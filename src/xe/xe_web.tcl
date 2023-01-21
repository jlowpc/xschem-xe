#
#  File: xe_web.tcl
#  
#  This file is used with XE, a propietary all in one EDA tool to 
#  analyze and abstract complex VLSI circuits, and XSCHEM 
#  a schematic capture and Spice/Vhdl/Verilog netlisting tool for circuit 
#  simulation, licensed under GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#
#  Copyright (C) 2022 YX Technologies, Inc.

package require json

if {$::OS == "Windows"} {
  package require Thread
}

namespace eval yxt {
}

proc yxt::clear_global {} {
  global xe_gT xe_gTFull xe_gfilter_item_ht xe_gtablewindow_visibility
  array unset xe_gT 
  array unset xe_gTFull 
  array unset xe_gfilter_item_ht 
  set xe_gtablewindow_visibility {}
}

# Global variables
global XSCHEM_SHAREDIR XE_ROOT_DIR has_x
yxt::clear_global
set xe_cm_wcounter 1
set XE_ROOT_DIR $XSCHEM_SHAREDIR/XE
source $XE_ROOT_DIR/xewebrc

# Add XE Menu to Xschem's main Menu
if {[info exists has_x]} {
  package require Tktable
  menubutton .menubar.xe -text "XE"  -menu .menubar.xe.menu
  menu .menubar.xe.menu -tearoff 0
  .menubar.xe.menu add command -label "Configure XE" -command "yxt::configure_xe_win_select_dir 0"   
  .menubar.xe.menu add command -label "See Report" -command "yxt::see_report_win_context_menu {XE Reports}"
  pack .menubar.xe -side left
}


proc yxt::get_info {netname} {  
  global xe_net_info_dict
  if {[info exists xe_net_info_dict($netname)]} {
    return $xe_net_info_dict($netname)
  }
  return ""
} 

proc yxt::read_net_property {} {
  global xe_net_info_dict xe_conf_dict
  if {![info exists xe_conf_dict(xe_wd)]} {return}
  set s [file tail [file rootname [xschem get schname]]]
  set fn $xe_conf_dict(xe_wd)/$s.net_property
  set fd [open $fn r]
  set a [catch "open \"$fn\" r" fd]
  if {$a} {
    puts stderr "Can not open file to read info for XE $fn"
  } else {
    while { [gets $fd line] >=0 } {
      if { [regexp {^#} $line] } { # comments
        continue
      } else {
        set tokens [split $line { }]
        set xe_net_info_dict([lindex $tokens 0]) [lindex $tokens 1]
      } 
    }
  } 
  close $fd
}

###############################################
# if XE's WD/UD/TF are setup, just call xe_load API
# else call configure_xe_win
proc yxt_load {} {
  global xe_conf_dict netlist_dir netlist_type
  if {[info exists xe_conf_dict(xe_wd)]} {
    foreach fn $xe_conf_dict(xe_uds) {
      append ud $fn
      append ud ","
    }
  }
  if {[info exists xe_conf_dict(xe_tfs)]} {
    foreach fn $xe_conf_dict(xe_tfs) {
      append tf $fn
      append tf "."
    }
  }
  if {[info exists xe_conf_dict(xe_wd)] && [info exists xe_conf_dict(xe_uds)] && [info exists xe_conf_dict(xe_tfs)] && \
      $xe_conf_dict(xe_wd) ne "" && $xe_conf_dict(xe_uds) ne "" && $xe_conf_dict(xe_tfs) ne ""} {
    set s [file tail [file rootname [xschem get schname]]]
    set n ${netlist_dir}/${s}
    set N ${n}.$netlist_type
    # TBD: When XE fatal out, XSchem should not exit as well???? How to fix this
    xe::load $xe_conf_dict(xe_wd) $N $ud $tf "" ""
    # TBD: Need to put this in the background, and a method to let user know that it's done.  All XE's action should be paused until this finishes
  } else { 
    yxt::configure_xe_win_select_dir 1
  }
}

proc yxt_configure_xe_win_select_dir_select_dir {window} {
  global xe_conf_dict xe_wd_interim INITIALINSTDIR
  if {[info exists xe_conf_dict(xe_wd)]} {
    set xe_wd_interim [tk_chooseDirectory -initialdir $xe_wd_interim -parent $window -title {Select XE Working DIR} -mustexist false]
  } else {
    set xe_wd_interim [tk_chooseDirectory -initialdir $INITIALINSTDIR -parent $window -title {Select XE Working DIR} -mustexist false]
  }
}

proc yxt_configure_xe_win_select_dir_select_files {window title global_filelist} {
  global xe_wd_interim INITIALINSTDIR
  upvar #0 $global_filelist filelist
  if {[llength $filelist]>0} {
    set init [file dirname [lindex $filelist 0]]
    set filelist [tk_getOpenFile -title $title -multiple 1 -parent $window -initialdir $init]
  } elseif {[info exists xe_wd_interim]} {
    set filelist [tk_getOpenFile -title $title -multiple 1 -parent $window -initialdir $xe_wd_interim]
  } else { 
    set filelist [tk_getOpenFile -title $title -multiple 1 -parent $window -initialdir $INITIALINSTDIR]
  }
}

proc yxt_backslash_to_slash {s} {
  regsub -all {\\} $s {/} s
  return $s
}

proc yxt::configure_xe_win_select_dir_save_interim {} {
  global xe_wd_interim xe_conf_dict xe_uds_interim xe_tfs_interim
  set xe_wd_interim [yxt_backslash_to_slash $xe_wd_interim]
  if {![info exists xe_conf_dict(xe_wd)] || $xe_conf_dict(xe_wd) ne $xe_wd_interim} {
    set xe_conf_dict(xe_wd) $xe_wd_interim
    #xschem set_modify
  }
  if {![info exists xe_conf_dict(xe_uds)] || [list {*}$xe_uds_interim] ne [list {*}$xe_conf_dict(xe_tfs)]} {
    set xe_conf_dict(xe_uds) $xe_uds_interim
    #xschem set_modify
  }
  if {![info exists xe_conf_dict(xe_tfs)] || [list {*}$xe_tfs_interim] ne [list {*}$xe_conf_dict(xe_tfs)]} {
    set xe_conf_dict(xe_tfs) $xe_tfs_interim
    #xschem set_modify
  }
}

proc yxt_configure_xe_win_select_dir_clear {} {
  global xe_wd_interim xe_tfs_interim xe_uds_interim
  set xe_wd_interim {}
  set xe_tfs_interim {}
  set xe_uds_interim {}
}

proc yxt_save_xe_conf {} {
  global USER_CONF_DIR xe_conf_dict
  yxt::configure_xe_win_select_dir_save_interim
  set design [file tail [file rootname [xschem get schname]]]
  set filename $USER_CONF_DIR/$design.xe_save
  set fd [open $filename w]
  set a [catch "open \"$filename\" w" fd]
  if {$a} {
    puts stderr "Can not open file to save xe configuration: $filename"
  } else {   
    puts $fd [list array set xe_conf_dict [array get xe_conf_dict]]
    close $fd 
  }
}

proc yxt::auto_load_save_file {} {
  global xe_conf_dict xe_wd_interim xe_uds_interim xe_tfs_interim
  global USER_CONF_DIR has_x
  set design [file tail [file rootname [xschem get schname]]]
  if { [file exists $USER_CONF_DIR/$design.xe_save] } {
    if {[catch { source $USER_CONF_DIR/$design.xe_save } err] } {
      puts "Problems loading xe's save data for this design: $err"
      if {[info exists has_x]} {
        tk_messageBox -message  "Problems loading xe's save data for this design: $err" \
            -icon warning -parent . -type ok
      }
    }
  }
}

# TBD: working directory doesn't exist.
# modified should only be updated if something is changed
proc yxt::configure_xe_win_select_dir {load} {
  global xe_conf_dict xe_wd_interim xe_uds_interim xe_tfs_interim 
  global XE_RESULT XE_THREAD
  catch {destroy .xe_conf} 
  yxt::auto_load_save_file
  
  toplevel .xe_conf -class dialog
  wm title .xe_conf {XE Configuration}
  wm geometry .xe_conf 700x340

  # Working Directory
  frame .xe_conf.wd -padx 5 -pady 5
  frame .xe_conf.wd.left
  frame .xe_conf.wd.right
  label .xe_conf.wd.left.label   -text {Working Directory:}
  button .xe_conf.wd.left.button -text Select -command "yxt_configure_xe_win_select_dir_select_dir .xe_conf"
  entry .xe_conf.wd.right.entry  -textvariable xe_wd_interim

  if {[info exists xe_conf_dict(xe_wd)]} {set xe_wd_interim $xe_conf_dict(xe_wd)}
  pack .xe_conf.wd             -side top -fill x
  pack .xe_conf.wd.left        -side left
  pack .xe_conf.wd.left.label  -side top
  pack .xe_conf.wd.left.button -side bottom -pady 5
  pack .xe_conf.wd.right       -side left -fill x -expand true
  pack .xe_conf.wd.right.entry  -fill x -expand true
  # Auto fill UD and TF once working directory is specified
  # User Directive
  frame .xe_conf.ud -padx 5 -pady 5
  frame .xe_conf.ud.left
  frame .xe_conf.ud.right
  label .xe_conf.ud.left.label   -text {UD Files:}
  button .xe_conf.ud.left.button -text Select -command "yxt_configure_xe_win_select_dir_select_files .xe_conf \"Select XE-UD Files\" xe_uds_interim"
  listbox .xe_conf.ud.right.list -listvariable xe_uds_interim -height 0 -selectmode extended
  if {[info exists xe_conf_dict(xe_uds)]} {set xe_uds_interim $xe_conf_dict(xe_uds)}
  pack .xe_conf.ud              -side top -fill x
  pack .xe_conf.ud.left         -side left
  pack .xe_conf.ud.left.label   -side top
  pack .xe_conf.ud.left.button  -side bottom -padx 20
  pack .xe_conf.ud.right        -side left -fill x -expand true
  pack .xe_conf.ud.right.list   -fill both -expand true

  # Tech file
  frame .xe_conf.tf -padx 5 -pady 5
  frame .xe_conf.tf.left
  frame .xe_conf.tf.right
  label .xe_conf.tf.left.label  -text {TF Files:}
  button .xe_conf.tf.left.button -text Select -command "yxt_configure_xe_win_select_dir_select_files .xe_conf \"Select XE-TF Files\" xe_tfs_interim"
  listbox .xe_conf.tf.right.list  -listvariable xe_tfs_interim -height 0 -selectmode extended
  if {[info exists xe_conf_dict(xe_tfs)]} {set xe_tfs_interim $xe_conf_dict(xe_tfs)}
  pack .xe_conf.tf             -side top -fill x
  pack .xe_conf.tf.left        -side left
  pack .xe_conf.tf.left.label  -side top
  pack .xe_conf.tf.left.button -side bottom -pady 5
  pack .xe_conf.tf.right       -side left -fill x -expand true
  pack .xe_conf.tf.right.list  -fill both -expand true

  frame .xe_conf.footer -padx 5 -pady 5
  label .xe_conf.footer.note -text {By clicking run, LVS netlist will netlist with top level as a .subckt}
  pack .xe_conf.footer -fill both
  pack .xe_conf.footer.note -side left

  # Bottom Buttons (Clear, Cancel, Load|Run, Open, Save)
  button .xe_conf.cancel -text Cancel -command { \
    destroy .xe_conf \
  } -padx 20
  button .xe_conf.clear -text Clear -command { \
    yxt_configure_xe_win_select_dir_clear \
  } -padx 20
  button .xe_conf.ok -text OK -command { \
    yxt::configure_xe_win_select_dir_save_interim; \
    destroy .xe_conf; \
  } -padx 20
  if {$load} {
    button .xe_conf.load -text "Load" -command { \
      yxt::configure_xe_win_select_dir_save_interim; \
      destroy .xe_conf; \
      yxt_load
    }  -padx 20
  } else {
    button .xe_conf.run -text "Run" -command { \
      yxt::configure_xe_win_select_dir_save_interim; \
      yxt::configure_xe_win_select_dir_run_xe;
      destroy .xe_conf; \
      vwait XE_RESULT; \
      set ret_dict [::json::json2dict $XE_RESULT]; \
      if (![dict exists $ret_dict url]) { \
        alert_  "Something went wrong: $ret_dict"; \
      } else { \
        set XE_URL [dict get $ret_dict url]; \
        set XE_TASKID [dict get $ret_dict task_id]; \
        yxt_poll_to_get_xe_results; \
      }
      thread::release $XE_THREAD; \
      unset XE_THREAD; 
    }  -padx 20
  }
  button .xe_conf.save -text Save -command { \
    yxt_save_xe_conf 
  } -padx 20
  pack .xe_conf.cancel -side right
  pack .xe_conf.clear -side right
  pack .xe_conf.ok -side right
  if {$load} {
    pack .xe_conf.load -side right 
  } else {
    pack .xe_conf.run -side right 
  }
  pack .xe_conf.save -side left
  
  bind .xe_conf <Escape> {destroy .xe_conf}
  bind .xe_conf <Return> {
    yxt::configure_xe_win_select_dir_save_interim; \
    destroy .xe_conf; \
  }

  bind .xe_conf.wd.right.entry <FocusOut> {
    if {![info exists xe_conf_dict(xe_wd)] || $xe_conf_dict(xe_wd) ne $xe_wd_interim} {
      set design [file tail [file rootname [xschem get schname]]]
      set dirname [yxt_backslash_to_slash $xe_wd_interim]
      set ud_fn "${dirname}/${design}.xe_ud"
      set tf_fn "${dirname}/${design}.xe_tf"
      if {[info exists xe_uds_interim] && [file exists $ud_fn]} { 
        .xe_conf.ud.right.list insert 0 $ud_fn
        set xe_uds_interim $ud_fn
      }
      if {[info exists xe_tfs_interim] && [file exists $tf_fn]} { 
        .xe_conf.tf.right.list insert 0 $tf_fn
        set xe_tfs_interim $tf_fn
      }
    }
  }
  
  focus  .xe_conf
}

proc yxt_init_path_dict {filename} {
  global xesc_net_type xesc_path_dict xesc_path_name_list
  foreach type $xesc_net_type {
    set xesc_path_dict($filename,$type) {}
  }
  set xesc_path_dict($filename,speed_slow) 1
  set xesc_path_dict($filename,cap_mult_slow) 1.0
  set xesc_path_dict($filename,termination) 1
  set xesc_path_dict($filename,auto_sensitize) 0
  set xesc_path_dict($filename,preserve_rail_name) 0
  set xesc_path_dict($filename,multi) {}
  set xesc_path_dict($filename,write_filename) ""
  set xesc_path_dict($filename,tcl_filename) ""
  if {$filename ne "<new>"} {
    foreach path $xesc_path_name_list {
      if {$path eq {<new>}} {continue}
      set xesc_path_dict($path,sc_multi_$filename) 0
    }
  }
}

proc yxt::get_xe_log {design} {
  global XE_ROOT_DIR XEAPI_URL XEAPI_TOKEN
  set url "--url=$XEAPI_URL"
  set token "--token=$XEAPI_TOKEN"
  set output [exec python $XE_ROOT_DIR/python/get_xe_log.py $design $url $token]
  return $output
}

proc yxt::test {} {
  global netlist_dir netlist_type netlist_dir xe_conf_dict
  set design [file tail [file rootname [xschem get schname]]]
  set n ${netlist_dir}/${design}
  set N ${n}.$netlist_type
  puts "netlist=$N"
  file stat $N nl_detail
  puts "$N mod time is $nl_detail(mtime)"

  set s [xschem get schname]
  puts "schname = $s"
  file stat $s sch_detail

  if {[info exists xe_conf_dict(xe_wd)]} {
    set fn $xe_conf_dict(xe_wd)/${design}.net_property
    puts "fn is $fn"
    if [file exist $fn] {
      file stat $N xe_detail
      puts "$fn mod time is $xe_detail(mtime)"
    }
  }
}

proc yxt::file_mtime {fn} {
  file stat $fn detail
  set mtime $detail(mtime)
  return $mtime
}

proc yxt::configure_xe_win_select_dir_run_xe {{callback {}}} {
  global netlist_dir netlist_type xschem_libs XE_URL XE_TASKID XE_ROOT_DIR XEAPI_URL XEAPI_TOKEN
  global xe_conf_dict top_subckt spiceprefix
  global XE_THREAD XE_RESULT
  # XE need to netlist with top_subkct and no spiceprefix
  set top_subckt 1 
  set spiceprefix 0
  set_sim_defaults
  set sch_fn [xschem get schname]
  set s [file tail [file rootname $sch_fn]]
  set n ${netlist_dir}/${s}
  set N ${n}.$netlist_type
  set nl_mtime [yxt::file_mtime $N]
  set sch_mtime [yxt::file_mtime $sch_fn]

  if {![info exists xe_conf_dict(xe_wd)] || ![info exists xe_conf_dict(xe_uds)] || ![info exists xe_conf_dict(xe_tfs)] || \
      $xe_conf_dict(xe_wd) eq "" || $xe_conf_dict(xe_uds) eq "" || $xe_conf_dict(xe_tfs) eq ""} {
    alert_  "Need to first configure working directory, UD files, techfiles before running XE"
    return
  }
  if {![file exists $N]} { 
    set answer [tk_messageBox -message  "Netlist is not created. Would you like to create one now?" \
           -icon warning -parent . -type yesno]
    if {$answer eq "no"} {
        return {}
    } else {
      xschem netlist
    }
  }
  if {$nl_mtime < $sch_mtime} {
    set answer [tk_messageBox -message  "Schematic has been modified since last netlist generated.  Would you like to create one now?" \
           -icon warning -parent . -type yesno]
    if {$answer eq "yes"} {
      xschem netlist
    }
  }
  if {[info exists xe_conf_dict(xe_wd)]} {
    set design [file tail [file rootname [xschem get schname]]]
    set fn $xe_conf_dict(xe_wd)/${design}.net_property
    if [file exist $fn] {
      set xe_mtime [yxt::file_mtime $fn]
      if {$sch_mtime < $xe_mtime} {
        set answer [tk_messageBox -message  "XE was ran and it looks like schematic hasn't changed, do you want to rerun again?" \
               -icon warning -parent . -type yesno]
        if {$answer eq "no"} {
          return {}
        }
      }
    }
  }

  if {[file exists $N]} {
    set ud "--ud="
    foreach fn $xe_conf_dict(xe_uds) {
      append ud $fn
      append ud " "
    }
    set tf "--tf="
    foreach fn $xe_conf_dict(xe_tfs) {
      append tf $fn
      append tf " "
    }
    set url "--url=$XEAPI_URL"
    set token "--token=$XEAPI_TOKEN"

    set XE_THREAD [thread::create {
          thread::wait ; # Enter the event loop
        }]
    thread::send -async $XE_THREAD "[list exec python $XE_ROOT_DIR/python/run_xe_web.py --nl=$N $ud $tf --design=$s $url $token]" XE_RESULT
  } else {
    alert_  "Didn't find a netlist to run XE."
  }
}

proc yxt_poll_to_get_xe_results {} {
  global XE_RESULT2 XE_THREAD2 xe_conf_dict XE_URL XE_TASKID
  global XE_ROOT_DIR XEAPI_URL XEAPI_TOKEN
  set design [file tail [file rootname [xschem get schname]]]
  if (![info exists XE_URL]) {
    return
  }
  if {$::OS == "Windows"} {
    if ([info exists XE_THREAD2]) {
      alert_  "Looks like XE is still running in the background."  
    } else {
      #puts "Start running XE with a separate thread.  You will be informed with a window when that is completed:"
      #puts "Command to XE = $cmd"
      #thread::create "check_xe_status"
      set wd "--wd=$xe_conf_dict(xe_wd)"
      set url "--url=$XEAPI_URL"
      set results_url "--results_url=$XE_URL"
      set token "--token=$XEAPI_TOKEN"
      set des "--design=$design"
      set XE_THREAD2 [thread::create {thread::wait;}]
      thread::send -async $XE_THREAD2 [list exec python $XE_ROOT_DIR/python/get_xe_results.py $wd $url $results_url $XE_TASKID $des $token] XE_RESULT2
      #thread::send -async $XE_THREAD2 "exec python $XE_ROOT_DIR/python/get_xe_results.py --wd=$xe_conf_dict(xe_wd) --url=$XE_URL $XE_TASKID" XE_RESULT2
      #thread::send -async $XE_THREAD2 [list after 300] XE_RESULT2
    }
  } else {
    set id [$fg $st sh -c [$XE_ROOT_DIR/python/get_xe_results --wd=$xe_conf_dict(xe_wd) --url=$url $task_id)]]
    set execute_callback($id) $callback
  } 
  vwait XE_RESULT2
  thread::release $XE_THREAD2
  alert_  "XE finished running and report is ready to be reviewed."
  #set xe_log_detail [yxt::get_xe_log $design]
  set fn $xe_conf_dict(xe_wd)/$design.xe_log
  if { [file exists $fn] } {
    set xe_log_detail [read_data $fn]
    viewdata "Completed: running XE.\n  $xe_log_detail" 1
  } else {
    viewdata "Something went wrong, and no log file can be found" 1
  }
  unset XE_THREAD2
  unset XE_URL
  unset XE_TASKID
  #set cmd "cmd /c \"cd $xe_conf_dict(xe_wd) & tar -xvf $design.zip\""
  #set r [catch {eval exec $cmd } res]
  #yxt::read_net_property
}

proc yxt_process_fi_subckt {} {
  global xe_conf_dict xe_sd_fi_inst
  set s [file tail [file rootname [xschem get schname]]]
  set fn $xe_conf_dict(xe_wd)/$s.xe_fi_subckt
  set fd [open $fn r]
  set a [catch "open \"$fn\" r" fd]
  if {$a} {
    puts stderr "Can not open file to read all subckt fully instantiated names $fn"
  } else {
    set current_subckt ""
    while { [gets $fd line] >=0 } {
      if { [regexp {^#} $line] } { # comments
        continue
      } elseif {[regsub {^  - } $line {} fi_name]} {
        if ([string compare $current_subckt ""]) {
          if {[string compare $fi_name /] && [string compare $fi_name \.]} {
            lappend xe_sd_fi_inst($current_subckt) $fi_name
          }
        }
      } elseif {[regsub {:$} $line {} subckt_name]} {
        set current_subckt $subckt_name
      }
    }
  } 
  close $fd
}

proc yxt::see_report_win_context_menu {{msg {}}} {
  global xe_conf_dict xe_csv_files1 xe_report_ht
  global xe_gtablewindow_visibility xe_gT xe_gTFull xe_gfilter_item_ht
  if {[winfo exists .xe_report_dialog]} {
    focus  .xe_report_dialog
    return
  }
  if {[xschem get currsch]!=0} {
    alert_  "Need to be on the top most level to read XE report"
    return
  }
  yxt::auto_load_save_file
  yxt::read_net_property
  if (![info exists xe_conf_dict(xe_wd)]) {
    alert_  "Need to first configure XE to read report"
    yxt::configure_xe_win_select_dir 0
    return
  }
  set design [file tail [file rootname [xschem get schname]]]
  set sch_mtime [yxt::file_mtime [xschem get schname]]
  set fn $xe_conf_dict(xe_wd)/${design}.net_property
  if {[file exist $fn]} {
    set xe_mtime [yxt::file_mtime $fn]
    if {$xe_mtime < $sch_mtime} {
      set answer [tk_messageBox -message  "XE was last ran since schematic has changed, do you want to rerun again?" \
                  -icon warning -parent . -type yesno]
      if {$answer eq "yes"} {
        yxt::configure_xe_win_select_dir 0
        return
      }
    }
  } else {
    alert_  "Need to first configure XE to read report"
    yxt::configure_xe_win_select_dir 0
    return    
  }
  yxt::clear_global
  #array unset xe_gT 
  #array unset xe_gTFull 
  #array unset xe_gfilter_item_ht 
  #set xe_gtablewindow_visibility {}

  set num_col 0
  set current_row 0
  set list_checks {} 
  yxt_process_fi_subckt
  toplevel .xe_report_dialog -class dialog
  wm title .xe_report_dialog $msg
  set xe_csv_files1 [lsort [glob -nocomplain -directory $xe_conf_dict(xe_wd) -tails *.{csv,xe_lm_v}]]
  foreach file $xe_csv_files1 {
    if [regexp {classify_net_report\.csv} $file] {
      set xe_report_ht(xe_dmrc_entry_classify_net) $file
    } elseif [regexp {classify_xtor_report\.csv} $file] {
      set xe_report_ht(xe_dmrc_entry_classify_device) $file
    } elseif [regexp {xe_weff\.csv} $file] {
      set xe_report_ht(xe_ckc_weff) $file
    } else {lappend list_checks $file;}
  }

  panedwindow  .xe_report_dialog.l -orient horizontal
  frame .xe_report_dialog.l.paneleft
  ttk::treeview .xe_report_dialog.l.paneleft.tree
  .xe_report_dialog.l.paneleft.tree heading #0 -text "XE Reports"
  .xe_report_dialog.l.paneleft.tree configure -padding {0 0 0 0}
  pack .xe_report_dialog.l.paneleft.tree -expand 1 -fill both

  if {[info exists xe_report_ht(xe_dmrc_entry_classify_net)]} {
    set xe_dmrc_entry [.xe_report_dialog.l.paneleft.tree insert {} end -text "XE-DMRC"]
    set has_classify_net [info exists xe_report_ht(xe_dmrc_entry_classify_net)]
    set has_classify_device [info exists xe_report_ht(xe_dmrc_entry_classify_device)]
    if {$has_classify_net || $has_classify_device} {
      set xe_dmrc_entry_classify [.xe_report_dialog.l.paneleft.tree insert $xe_dmrc_entry end -text "Classification"]  
    }
    if {$has_classify_net} {
      set xe_dmrc_entry_classify_net [.xe_report_dialog.l.paneleft.tree insert $xe_dmrc_entry_classify end -text "Classify Net"]
      set xe_report_ht($xe_dmrc_entry_classify_net) $xe_report_ht(xe_dmrc_entry_classify_net)
    }
    if {$has_classify_device} {
      set xe_dmrc_entry_classify_device [.xe_report_dialog.l.paneleft.tree insert $xe_dmrc_entry_classify end -text "Classify Device"]
      set xe_report_ht($xe_dmrc_entry_classify_device) $xe_report_ht(xe_dmrc_entry_classify_device)
    }
    if {[llength $list_checks] > 0} {
      set xe_dmrc_entry_checks [.xe_report_dialog.l.paneleft.tree insert $xe_dmrc_entry end -text "DMRC Checks"]
      foreach check $list_checks {
        set id [.xe_report_dialog.l.paneleft.tree insert $xe_dmrc_entry_checks end -text $check]
        set xe_report_ht($id) $check
      }
    }
  }
  
  #set xe_ckc_entry_classify_net [.xe_report_dialog.l.paneleft.tree insert $xe_ckc_entry end -text "Classify Net"]
  #set xe_ckc_entry_unclassify_net [.xe_report_dialog.l.paneleft.tree insert $xe_ckc_entry end -text "Un-Classify Net"]
  #set xe_ckc_entry_checks [.xe_report_dialog.l.paneleft.tree insert $xe_ckc_entry end -text "Checks"]
  ############
  .xe_report_dialog.l  add .xe_report_dialog.l.paneleft -minsize 40
  pack .xe_report_dialog.l -expand true -fill both

  frame .xe_report_dialog.l.paneright
  table .xe_report_dialog.l.paneright.table -titlerows 1 -variable xe_gT -rows $current_row -cols $num_col -colstretchmode all \
    -yscrollcommand [list .xe_report_dialog.l.paneright.table.yscroll set] \
    -xscrollcommand [list .xe_report_dialog.l.paneright.table.xscroll set]
  scrollbar .xe_report_dialog.l.paneright.table.yscroll -command [list .xe_report_dialog.l.paneright.table yview]
  scrollbar .xe_report_dialog.l.paneright.table.xscroll -command [list .xe_report_dialog.l.paneright.table xview] -orient horiz
  pack .xe_report_dialog.l.paneright.table.yscroll -side right -fill y
  pack  .xe_report_dialog.l.paneright.table -side bottom  -fill both -expand true
  pack .xe_report_dialog.l.paneright.table.xscroll -side bottom -fill x 
  bind .xe_report_dialog.l.paneright.table <Button-3> {
    yxt_see_report_win_context_menu_context_menu %W [%W index @%x,%y] %X %Y 
  }
  bind .xe_report_dialog.l.paneright.table <Button-1> {
    yxt_see_report_win_context_menu_probe %W [%W index @%x,%y] %X %Y
  }
  .xe_report_dialog.l.paneright.table configure -state disabled
  
  .xe_report_dialog.l  add .xe_report_dialog.l.paneleft -minsize 40
  .xe_report_dialog.l  add .xe_report_dialog.l.paneright -minsize 40

  text .xe_report_dialog.l.paneright.text  -relief sunken -bd 2 -yscrollcommand ".xe_report_dialog.l.paneright.text.yscroll set" -setgrid 1 \
        -xscrollcommand ".xe_report_dialog.l.paneright.text.xscroll set" -wrap none -height 30
   scrollbar .xe_report_dialog.l.paneright.text.yscroll -command  ".xe_report_dialog.l.paneright.text yview" 
   scrollbar .xe_report_dialog.l.paneright.text.xscroll -command ".xe_report_dialog.l.paneright.text xview" -orient horiz
  # pack .xe_report_dialog.l.paneright.text.yscroll -side right -fill y
  # pack .xe_report_dialog.l.paneright.text -expand yes -fill both
  # pack .xe_report_dialog.l.paneright.text.xscroll -side bottom -fill x
   # 20171103 insert at insertion cursor(insert tag) instead of 0.0
   #.xe_report_dialog.l.paneright.text insert insert $data


  frame .xe_report_dialog.buttons 
  button .xe_report_dialog.buttons.ok -text OK -command {destroy .xe_report_dialog} 
  button .xe_report_dialog.buttons.cancel -text Cancel -command {destroy .xe_report_dialog}
  
  label .xe_report_dialog.buttons.label  -text {RegExp:}
  entry .xe_report_dialog.buttons.entry
  
  pack .xe_report_dialog.buttons.ok  .xe_report_dialog.buttons.cancel \
       .xe_report_dialog.buttons.label -side left
  pack .xe_report_dialog.buttons.entry -side left -fill x -expand true
  pack .xe_report_dialog.l -expand true -fill both
  pack .xe_report_dialog.buttons -side top -fill x
  
  bind .xe_report_dialog <Return> {destroy .xe_report_dialog}
  bind .xe_report_dialog <Escape> {destroy .xe_report_dialog}

  bind .xe_report_dialog.l.paneleft.tree <<TreeviewSelect>> { 
    set sel [.xe_report_dialog.l.paneleft.tree selection]
    if {[info exists xe_report_ht($sel)]} {
      set sel_report $xe_report_ht($sel)
      if [regexp {\.xe_lm_v} $sel_report] {
          set xe_lm_v [read_data $xe_conf_dict(xe_wd)/$sel_report]
          pack forget .xe_report_dialog.l.paneright.table
          pack .xe_report_dialog.l.paneright.text.yscroll -side right -fill y
          pack .xe_report_dialog.l.paneright.text -expand yes -fill both
          pack .xe_report_dialog.l.paneright.text.xscroll -side bottom -fill x
          .xe_report_dialog.l.paneright.text insert insert $xe_lm_v
      } else {
        pack forget .xe_report_dialog.l.paneright.text
        pack .xe_report_dialog.l.paneright.table.yscroll -side right -fill y
        pack  .xe_report_dialog.l.paneright.table -side bottom  -fill both -expand true
        pack .xe_report_dialog.l.paneright.table.xscroll -side bottom -fill x 
        set num_col 0
        set current_row 0
        yxt::clear_global
        #array unset xe_gT 
        #array unset xe_gTFull 
        #array unset xe_gfilter_item_ht 
        #set xe_gtablewindow_visibility {}
        set fn $xe_conf_dict(xe_wd)/$sel_report
        set fd [open $fn r]
        set a [catch "open \"$fn\" r" fd]
        #set a [catch {open $f w} fd]
        if {$a} {
          puts stderr "Can not open file $fn"
        } else {
          .xe_report_dialog.l.paneright.table configure -state normal
          .xe_report_dialog.l.paneright.table delete cols 0 [.xe_report_dialog.l.paneright.table cget -cols]
          while { [gets $fd line] >=0 } {
            set tokens [split $line ","]  
            
            set col 0
            if ($current_row==0) {
              set xe_gT($current_row,$col) "" 
            } else {
              set xe_gT($current_row,$col) $current_row
            }
            incr col
            foreach token $tokens {
              set xe_gT($current_row,$col) $token
              set xe_gTFull($current_row,$col) $token
              incr col
            }
            if ($num_col==0) {set num_col $col}
            incr current_row
            lappend xe_gtablewindow_visibility 1
          }
          .xe_report_dialog.l.paneright.table configure -rows $current_row -cols [expr $num_col+1]
          .xe_report_dialog.l.paneright.table configure -state disabled
        } 
        close $fd
      }
    }
  }

  #.xe_report_dialog.l.paneleft.list xview moveto 1
  #bind .xe_report_dialog <Configure> {
  #  .xe_report_dialog.l.paneleft.list xview moveto 1
  #}
  tkwait window .xe_report_dialog
}
# ============================================================
proc yxt_see_report_win_context_menu_context_menu {w el mousex mousey} {
  global xe_cm_wcounter xe_gtablewindow_visibility
  global xe_cm_w
  if {[scan $el %d,%d r c] != 2} return
  if {$c==0} return
  if {[$w tag includes title $el]} {
    set xe_cm_wcounter [expr $xe_cm_wcounter+1]
    set xe_cm_w .cmenu$xe_cm_wcounter
    menu $xe_cm_w -tearoff 0   
    #############
    set num_col [$w cget -cols]
    set num_row [llength $xe_gtablewindow_visibility]
    set current_row 0
    for {set i 1} {$i<$num_row} {incr i} {
      if {[lindex $xe_gtablewindow_visibility $i]==0} {continue}
      incr current_row
    }
    set top_cell 1,1
    set last_cell $current_row,$num_col
    #############
    $xe_cm_w add command -label "Sort ascending" -command "$w configure -state normal; \
      ::tk::table::Sort $w $top_cell $last_cell  $c -increasing; \
      $w configure -state disabled"
    $xe_cm_w add command -label "Sort descending"  -command "$w configure -state normal; \
      ::tk::table::Sort $w $top_cell $last_cell  $c -decreasing; \
      $w configure -state disabled"
    $xe_cm_w add separator
    $xe_cm_w add command -label "Filter"  -command "yxt_see_report_win_context_menu_context_menu_filter_dialog $w $c"
    tk_popup $xe_cm_w $mousex $mousey 
  } 
}

proc yxt_see_report_win_context_menu_probe {w el mousex mousey} {
  global xe_sd_fi_inst
  if {[scan $el %d,%d r c] != 2} return
  if {![$w tag includes title $el]} {
    set data_title [$w get 0,$c]
    set data [$w get $r,$c]
    if {![string compare $data_title subckt]} {
      set subckt [$w get $r,1]
      if {[info exists xe_sd_fi_inst($subckt)]} {
        set fi_inst [lindex $xe_sd_fi_inst($subckt) 0]
        probe_inst $fi_inst
      } else {
        probe_inst .
      }
    }
    if {![string compare $data_title net]} {
      set subckt [$w get $r,1]
      if {[info exists xe_sd_fi_inst($subckt)]} {
        set fi_inst [lindex $xe_sd_fi_inst($subckt) 0]
        set fi_net $fi_inst.$data
        probe_inst $fi_inst
        probe_net $fi_net
      } else {
      probe_inst $data
        probe_net $data
      }
    }
    if {[regexp {fi_net.*} $data_title]} {
      probe_net $data
      probe_inst $data
    }
    if {![string compare $data_title device]} {
      set subckt [$w get $r,1]
      if {[info exists xe_sd_fi_inst($subckt)]} {
        set fi_inst [lindex $xe_sd_fi_inst($subckt) 0]
        set fi_net $fi_inst.$data
        probe_inst $fi_net
      } else {
        probe_inst $data
      }
    }
    if {![string compare $data_title fi_device]} {
      probe_inst $data
    }
  }
}

# TK's checkbutton has issue with text and variable name that has []:.  Escape it for now
proc yxt_get_processed_name {name} {
  regsub -all {\[} $name {\\[} name
  regsub -all {\]} $name {\\]} name
  regsub -all {\:} $name {\\:} name
  return $name
}

proc yxt_see_report_win_context_menu_context_menu_filter_dialog {w c} {
  # xe_gfilter_item_ht is used because TK doesn't like name with [].  Use a number instead
  global xe_gtablewindow_visibility xe_gT xe_gTFull xe_gfilter_item_ht
  array unset ht
  set myList {}
  set num_row [llength $xe_gtablewindow_visibility]
  for {set i 1} {$i<$num_row} {incr i} {
    if {[info exists xe_gTFull($i,$c)]} {
      lappend myList $xe_gTFull($i,$c)      
    }
  }
  set xe_filter_list [lsort -unique $myList]
  toplevel .filter_dialog -class Dialog
  wm title .filter_dialog {Filter}
  panedwindow  .filter_dialog.l -orient horizontal
  frame .filter_dialog.l.paneleft
  ##############

  checkbutton .filter_dialog.l.paneleft.all -text "Select ALL" -variable .filter_dialog.l.paneleft.all -command "yxt_report_win_cm_filter_update_window_visibility $w -1 all .filter_dialog.l.paneleft [list $xe_filter_list]"
  grid .filter_dialog.l.paneleft.all -row 1 -column 2 -sticky nw
  set i 2
  foreach item $xe_filter_list {
    set xe_gfilter_item_ht($item) $i
    set item [yxt_get_processed_name $item]
    checkbutton .filter_dialog.l.paneleft.a$i -text $item  -variable .filter_dialog.l.paneleft.$i -command "yxt_report_win_cm_filter_update_window_visibility $w $c $item .filter_dialog.l.paneleft.$i [list $xe_filter_list]"
    #-anchor w
    # pack .filter_dialog.l.paneleft.$item -side left
    grid .filter_dialog.l.paneleft.a$i -row $i -column 2 -sticky w
    incr i
  }
  set has_deselect 0
  for {set i 1} {$i <= $num_row} {incr i} {
    if {[info exists xe_gTFull($i,$c)]} {
      set name $xe_gTFull($i,$c)
      set ii $xe_gfilter_item_ht($name)
      if {[lindex $xe_gtablewindow_visibility $i]==1} {
        yxt_set_value .filter_dialog.l.paneleft.$ii 1
      } else {
        yxt_set_value .filter_dialog.l.paneleft.$ii 0
        set has_deselect 1
      }
    }
  }
  if {$has_deselect} {
    .filter_dialog.l.paneleft.all deselect
  } else {
    .filter_dialog.l.paneleft.all select
  }
  #scrollbar .filter_dialog.l.paneleft.yscroll -command ".filter_dialog.l.paneleft yview" 
  #scrollbar .filter_dialog.l.paneleft.xscroll -command ".filter_dialog.l.paneleft xview" -orient horiz
  #grid .filter_dialog.l.paneleft.yscroll -in .filter_dialog.l.paneleft -sticky e
  #grid .filter_dialog.l.paneleft.xscroll -in .filter_dialog.l.paneleft -sticky s

  .filter_dialog.l  add .filter_dialog.l.paneleft -minsize 40  
  frame .filter_dialog.buttons 
  button .filter_dialog.buttons.ok -text OK -command "yxt_report_win_cm_filter_update_table $w; destroy .filter_dialog"
  button .filter_dialog.buttons.cancel -text Cancel -command {destroy .filter_dialog;}
  label .filter_dialog.buttons.label  -text {Reg Exp:}
  entry .filter_dialog.buttons.entry
  pack .filter_dialog.buttons.ok .filter_dialog.buttons.cancel \
       .filter_dialog.buttons.label -side left
  pack .filter_dialog.buttons.entry -side left -fill x -expand true
  pack .filter_dialog.l -expand true -fill both
  pack .filter_dialog.buttons -side top -fill x
  bind .filter_dialog <Return> "destroy .filter_dialog; yxt_report_win_cm_filter_update_table $w"
  bind .filter_dialog <Escape> { destroy .filter_dialog}
  focus .filter_dialog
  grab set .filter_dialog
  tkwait window .filter_dialog
}

proc yxt_get_value {varname} {
  upvar #0 $varname var
  return $var
}

proc yxt_set_value { var val } {
  upvar #0 $var v
  if {[ info exists v ]} {
    set v $val
  }
}

# for select all, display=".dialog.l.paneleft", and c=-1, name=all
proc yxt_report_win_cm_filter_update_window_visibility {w c name display xe_filter_list} {
  # name did not get from updated $item from caller
  set name [yxt_get_processed_name $name]
  global xe_gtablewindow_visibility xe_gTFull .filter_dialog.l.paneleft.all xe_gfilter_item_ht
  set num_col [$w cget -cols]
  set num_row [llength $xe_gtablewindow_visibility]
  if ($c<0)  { 
    set display_bool [yxt_get_value .filter_dialog.l.paneleft.all]
    for {set i 1} {$i<$num_row} {incr i} {
      lset xe_gtablewindow_visibility $i $display_bool
    }
    foreach item $xe_filter_list {
      set i $xe_gfilter_item_ht($item)
      if {$display_bool==0} {
        $display.a$i deselect
      } else {
        $display.a$i select
      }
    }
    return
  }
  set display_bool [yxt_get_value $display]
  set has_deselect 0
  for {set i 1} {$i<$num_row} {incr i} {
    if {[info exists xe_gTFull($i,$c)]} {
      set name2 $xe_gTFull($i,$c)
      set name2 [yxt_get_processed_name $name2]
      if {$name2 eq $name} {
        lset xe_gtablewindow_visibility $i $display_bool
      }
    }
    if {[lindex $xe_gtablewindow_visibility $i]==0} {set has_deselect 1}
  }
  if {$has_deselect} {
    .filter_dialog.l.paneleft.all deselect
  } else {
    .filter_dialog.l.paneleft.all select
  }
}

proc yxt_report_win_cm_filter_update_table {w} {
  global xe_gtablewindow_visibility xe_gT xe_gTFull
  set num_col [$w cget -cols]
  set num_row [llength $xe_gtablewindow_visibility]
 
  $w configure -state normal
  set current_row 1
  for {set i 1} {$i<$num_row} {incr i} {
    if {[lindex $xe_gtablewindow_visibility $i]==0} {continue}
    for {set j 0} {$j<$num_col} {incr j} {
      if {$j==0} {
        if {$current_row > 0} {
          set xe_gT($current_row,$j) $current_row
        }
      } else {
        if {[info exists xe_gTFull($i,$j)]} {
          set xe_gT($current_row,$j) $xe_gTFull($i,$j)
        }
      }
    }
    incr current_row
  }
  for {set i $current_row} {$i<$num_row} {incr i} {
    for {set j 0} { $j<$num_col } { incr j} {
      set xe_gT($i,$j) {}
    }
  }
  $w configure -state disabled
}

################################################################################
# Replace Native Xschem's with XE's
# Need to decide how to best save XE's settings
# proc save_file_dialog { msg ext global_initdir {initialfile {}} {overwrt 1} } {
#proc update_recent_file {f} 
################################################################################
proc probe_inst {path} {
  xschem set no_draw 1
  # return to top level if not already there
  while { [xschem get currsch] } { xschem go_back } 
  # recursively descend into sub-schematics
  while { [regexp {\.} $path] } {
    xschem unselect_all
    set inst $path
    regsub {\..*} $inst {} inst    ;# take 1st path component: xlev1[3].xlev2.m3 -> xlev1[3]
    regsub {[^.]+\.} $path {} path ;# take remaining path: xlev1[3].xlev2.m3 -> xlev2.m3
    xschem search exact 1 name $inst
    # handle vector instances: xlev1[3:0] -> xlev1[3],xlev1[2],xlev1[1],xlev1[0]
    # descend into the right one
    xschem search exact 0 name $inst 
    set inst_list [split [lindex [xschem expandlabel [lindex [xschem selected_set] 0 ] ] 0] {,}]
    set instnum [expr {[lsearch -exact  $inst_list $inst] + 1}]
    xschem descend $instnum
  }
  xschem set no_draw 0
  xschem redraw
  xschem search exact 0 name $path
  return $path
}
