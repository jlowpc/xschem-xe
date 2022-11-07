#
#  File: xe.tcl
#  
#  This file is used with XE, a propietary all in one EDA tool to 
#  analyze and abstract complex VLSI circuits, and XSCHEM 
#  a schematic capture and Spice/Vhdl/Verilog netlisting tool for circuit 
#  simulation, licensed under GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#
#  Copyright (C) 2020 YX Technologies, Inc.

package require Tktable

if {$::OS == "Windows"} {
  load xe_dmrc.dll
  package require Thread
} else {
  load xe_dmrc.so
}

proc xe::get_info {netname} {  
  global xe_net_info_dict
  #set path [string range [xschem get sch_path] 1 end]
  #puts "get_info path=$path net=$net"
  #set netname $path$net
  #return $netname
  #puts "netname = $netname"
  if {[info exists xe_net_info_dict($netname)]} {
    return $xe_net_info_dict($netname)
  }
  return ""
}

proc yxt_read_net_property {} {
  global xe_net_info_dict xe_conf_dict
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


#  set n [string tolower $n]
#  set prefix [string range $n 0 0]
#  set path [string range [xschem get sch_path] 1 end]
#  set n $path$n
#  if { $path ne {} } {
#    set n $prefix.$n
#  }
#  if { ![regexp $prefix {[ve]}] } {
#    set n @$n
#  }
#  set n i($n)
#  if { [regexp {\[} $n] } { set n \{$n\} }
#  # puts "ngspice::get_current --> $n"
#  set err [catch {set ::ngspice::ngspice_data($n)} res]
#  if { $err } {
#    set res {?}
#  } else {
#    set res [ format %.4g $res ]
#  }
#  # puts "$n --> $res"
#  return $res

proc yxt_clear_global {} {
  global xe_gT xe_gTFull xe_gfilter_item_ht xe_gtablewindow_visibility
  array unset xe_gT 
  array unset xe_gTFull 
  array unset xe_gfilter_item_ht 
  set xe_gtablewindow_visibility {}
}

# Global variables
global XSCHEM_SHAREDIR sim XE_ROOT_DIR
yxt_clear_global
set xe_cm_wcounter 1
set XE_ROOT_DIR $XSCHEM_SHAREDIR/XE

# Add XE Menu to Xschem's main Menu
menubutton .menubar.xe -text "XE"  -menu .menubar.xe.menu
menu .menubar.xe.menu -tearoff 0
.menubar.xe.menu add command -label "Configure XE" -command "yxt_configure_xe_win_select_dir 0"   
.menubar.xe.menu add command -label "See Report" -command "yxt_see_report_win_context_menu {XE Reports}"
.menubar.xe.menu add command -label "XE-SC" -command "yxtsc_win_update_change"
pack .menubar.xe -side left

###############################################
# TBD: TO BE REMOVED ONCE TCL IS SETUP
set_sim_defaults
lappend sim(tool_list) {xe}
set_ne sim(xe,0,cmd) {run_xe.tcl}
set_ne sim(xe,0,name) {YXTech XE}
set_ne sim(xe,0,fg) 0
set_ne sim(xe,0,st) 1
# there's only one XE and that's the default one
set_ne sim(xe,n) 1
set_ne sim(xe,default) 0
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
    yxt_configure_xe_win_select_dir 1
  }
}

proc yxt_configure_xe_win_select_dir {window} {
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

proc yxt_configure_xe_win_select_dir_save_interim {} {
  global xe_wd_interim xe_uds_interim xe_tfs_interim
  global xe_conf_dict 
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
  yxt_configure_xe_win_select_dir_save_interim
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

proc yxt_auto_load_save_file {} {
  global xe_conf_dict xe_wd_interim xe_uds_interim xe_tfs_interim
  global USER_CONF_DIR has_x
  set design [file tail [file rootname [xschem get schname]]]
  if { [file exists $USER_CONF_DIR/$design.xe_save] } {
    if {[catch { source $USER_CONF_DIR/$design.xe_save } err] } {
      puts "Problems loading xe's save data for this design: $err"
      if {[info exists has_x]} {
        tk_messageBox -message  "Problems loading xe's save data for this desig: $err" \
            -icon warning -parent . -type ok
      }
    }
  }
}

# TBD: working directory doesn't exist.
# modified should only be updated if something is changed
proc yxt_configure_xe_win_select_dir {load} {
  global xe_conf_dict xe_wd_interim xe_uds_interim xe_tfs_interim 
  global netlist_type netlist_dir
  global XE_RESULT XE_THREAD
  catch {destroy .xe_conf} 
  yxt_auto_load_save_file
  
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
    yxt_configure_xe_win_select_dir_save_interim; \
    destroy .xe_conf; \
  } -padx 20
  if {$load} {
    button .xe_conf.load -text "Load" -command { \
      yxt_configure_xe_win_select_dir_save_interim; \
      destroy .xe_conf; \
      yxt_load
    }  -padx 20
  } else {
    button .xe_conf.run -text "Run" -command { \
      yxt_configure_xe_win_select_dir_save_interim; \
      yxt_configure_xe_win_select_dir_run_xe; \
      destroy .xe_conf; \
      vwait XE_RESULT
      thread::release $XE_THREAD
      set s [file tail [file rootname [xschem get schname]]]
      set fn $xe_conf_dict(xe_wd)/$s.xe_log
      # set xe_log_detail [xetcl_get_xe_log_string]
      set xe_log_detail [read_data $fn]
      viewdata "Completed: running XE.\n  $xe_log_detail" 1
      unset XE_THREAD
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
    yxt_configure_xe_win_select_dir_save_interim; \
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

proc yxtsc_win_add_select_net {type global_list} {
  upvar #0 global_list list  
  set nets [xschem selected_wire]
  set path [xschem get sch_path]
  regsub {^\.} $path {} path
  foreach net $nets {
    if {$path ne "."} {
      set full [append path $nets]
    } else {
      set full $nets
    }
    lappend list $full
    lappend list " "
    .xe_sc.topf.center.$type.r.net insert end "$full\n"
  }
}

# <new> is saved; load should factor that in
proc yxtsc_save_path_dict {filename} {
  global xesc_path_dict
  set fd [open $filename w]
  set a [catch "open \"$filename\" w" fd]
  if {$a} {
    puts stderr "Can not open file to save cut information: $filename"
  } else {   
    puts $fd [list array set xesc_path_dict [array get xesc_path_dict]]
    close $fd 
  }
}

proc yxtsc_win_update_change {} {
  global xesc_net_type xesc_path_name_selected xesc_path_dict
  foreach type $xesc_net_type {
    .xe_sc.topf.center.$type.r.net delete 1.0 end
    .xe_sc.topf.center.$type.r.net insert 1.0 $xesc_path_dict($xesc_path_name_selected,$type) 
    }
  .xe_sc.middle.name.text configure -textvariable xesc_path_dict($xesc_path_name_selected,tcl_filename)
  .xe_sc.middle.filename.text configure -textvariable xesc_path_dict($xesc_path_name_selected,write_filename)
  .xe_sc.middle.cap_mult_slow.text configure -textvariable xesc_path_dict($xesc_path_name_selected,cap_mult_slow)
  .xe_sc.middle.speed.slow configure -value $xesc_path_dict($xesc_path_name_selected,speed_slow) -variable xesc_path_dict($xesc_path_name_selected,speed_slow) -value 1
  .xe_sc.middle.speed.fast configure -value $xesc_path_dict($xesc_path_name_selected,speed_slow) -variable xesc_path_dict($xesc_path_name_selected,speed_slow) -value 0
  .xe_sc.middle.termination.vcvs configure -value xesc_path_dict($xesc_path_name_selected,termination) -variable xesc_path_dict($xesc_path_name_selected,termination) -value 1
  .xe_sc.middle.termination.cap configure -value xesc_path_dict($xesc_path_name_selected,termination) -variable xesc_path_dict($xesc_path_name_selected,termination) -value 0
  .xe_sc.middle.checks.sensitize configure -variable xesc_path_dict($xesc_path_name_selected,auto_sensitize) 
  .xe_sc.middle.checks.preserve_rail_name configure -variable xesc_path_dict($xesc_path_name_selected,preserve_rail_name)
}

# TBD: Should we have a default path that always get picked instead of the first one in list
#      Maybe rather than remembering the path, push it to the first one when save or changed?
# Need to match with yxtsc_win_update_change
proc yxtsc_load_path_dict {filename} {
  global xesc_net_type xesc_path_dict xesc_path_name_list
  global xesc_path_name_selected xesc_path_name_selected_old xesc_path_index
  # Destroy the multiple paths checkboxes as xesc_path_name_list will be cleared
  foreach path $xesc_path_name_list {
    if {$path eq {<new>}} {continue;}
    pack forget .xe_sc.middle.multipaths.bottom.$path.c
    pack forget .xe_sc.middle.multipaths.bottom.$path
    destroy .xe_sc.middle.multipaths.bottom.$path.c
    destroy pack forget .xe_sc.middle.multipaths.bottom.$path
  }
  source $filename
  set xesc_path_name_list {}
  foreach key [array names xesc_path_dict] {
    set s [lindex [split $key ","] 0]
    if {[lsearch $xesc_path_name_list $s] < 0} {
      lappend xesc_path_name_list $s
    }
  }
  set xesc_path_name_selected [lindex $xesc_path_name_list 0]
  set xesc_path_name_selected_old $xesc_path_name_selected
  set xesc_path_index 0
  .xe_sc.topf.center.top.text configure -values $xesc_path_name_list 
  .xe_sc.topf.center.top.text set $xesc_path_name_selected

  foreach path $xesc_path_name_list {
    if {$path eq {<new>}} {continue}
    frame .xe_sc.middle.multipaths.bottom.$path
    # TBD: Do I need to initialize xesc_path_dict($xesc_path_name_selected, )
    checkbutton .xe_sc.middle.multipaths.bottom.$path.c -text "$path" -variable xesc_path_dict($xesc_path_name_selected,sc_multi_$path) 
    pack .xe_sc.middle.multipaths.bottom.$path -side left
    pack .xe_sc.middle.multipaths.bottom.$path.c -side left 
    if {$path eq $xesc_path_name_selected} {
      .xe_sc.middle.multipaths.bottom.$path.c configure -state disabled
    } 
  }
  yxtsc_win_update_change
}

# TBD: Changing path name on the fly (instead of <new>) doesn't work
# Any changes should reflect in yxtsc_load_path_dict
proc yxtsc_win_update_change {} {
  global xe_conf_dict xesc_path_dict # xesc_path_dict(name, start={}|end={}|passthru={}|speed_slow=1|0|cap_mult_slow=<float>|termination=cap|vcvs|auto_sensitize=1|0|preserve_rail_name=1|0|tcl_filename=string|write_filename=string|multi={}) 
  global xesc_net_type xesc_path_name_list xesc_path_name_selected xesc_path_name_selected_old xesc_path_index
  global xesc_file_save
  catch {destroy .xe_sc} 
  toplevel .xe_sc -class dialog
  wm title .xe_sc {XE-Simcut Configuration}
  wm geometry .xe_sc 700x540
  frame .xe_sc.topf 
  pack .xe_sc.topf -fill both -expand yes

  frame .xe_sc.topf.center
  frame .xe_sc.middle
  frame .xe_sc.bottom

  set bg(0) {#dddddd}
  set bg(1) {#aaaaaa}
  set toggle 0
  set xesc_net_type [list start end passthru]  
  if {![info exists xesc_path_dict]} {
    set xesc_path_name_list <new>
    yxt_init_path_dict <new>
  } 
  set xesc_path_name_selected [lindex $xesc_path_name_list 0]
  set xesc_path_name_selected_old $xesc_path_name_selected
  set xesc_path_index 0

  frame .xe_sc.topf.center.top -padx 5 -pady 10
  label .xe_sc.topf.center.top.lab -text {Path name*}
  ttk::combobox .xe_sc.topf.center.top.text -values $xesc_path_name_list -textvariable xesc_path_name_selected

  pack .xe_sc.topf.center -fill both -expand yes
  pack .xe_sc.topf.center.top -fill x
  pack .xe_sc.topf.center.top.lab -side left 
  pack .xe_sc.topf.center.top.text -side left -fill both -expand yes

  foreach type $xesc_net_type {
    frame .xe_sc.topf.center.$type
    if {$type eq "start" || $type eq "end"} {
      label .xe_sc.topf.center.$type.l -width 12 -text $type*  -bg $bg($toggle)
    } else {
      label .xe_sc.topf.center.$type.l -width 12 -text $type  -bg $bg($toggle)
    }
    frame .xe_sc.topf.center.$type.r
    text .xe_sc.topf.center.$type.r.net -width 20 -height 3 -wrap none -bg $bg($toggle)
    .xe_sc.topf.center.$type.r.net insert 1.0 $xesc_path_dict($xesc_path_name_selected,$type)
    button .xe_sc.topf.center.$type.r.select  -text "Select" -command \
      "yxtsc_win_add_select_net $type xesc_path_dict($xesc_path_name_selected,$type)" \
      -bg $bg($toggle)
    incr toggle
    set toggle [expr {$toggle %2}]

    pack .xe_sc.topf.center.$type -fill both -expand yes
    pack .xe_sc.topf.center.$type.l -fill y -side left
    pack .xe_sc.topf.center.$type.r -fill both -expand yes
    pack .xe_sc.topf.center.$type.r.net -side left -fill both -expand yes
    pack .xe_sc.topf.center.$type.r.select -side left -fill y 
  }
  frame .xe_sc.middle.name
  label .xe_sc.middle.name.lab -text {Tcl Script Filename*}
  entry .xe_sc.middle.name.text -relief sunken -textvariable xesc_path_dict($xesc_path_name_selected,tcl_filename) 
  pack .xe_sc.middle -fill x
  pack .xe_sc.middle.name -fill x
  pack .xe_sc.middle.name.lab -side left 
  pack .xe_sc.middle.name.text -side left -fill x -expand yes

  frame .xe_sc.middle.filename
  label .xe_sc.middle.filename.lab -text {Write Filename*}
  entry .xe_sc.middle.filename.text -relief sunken -textvariable xesc_path_dict($xesc_path_name_selected,write_filename) 
  pack .xe_sc.middle.filename -fill x
  pack .xe_sc.middle.filename.lab -side left 
  pack .xe_sc.middle.filename.text -side left -fill x -expand yes

  frame .xe_sc.middle.cap_mult_slow
  label .xe_sc.middle.cap_mult_slow.lab -text {Capacitance multiplier for slow}
  entry .xe_sc.middle.cap_mult_slow.text -relief sunken -textvariable xesc_path_dict($xesc_path_name_selected,cap_mult_slow) -validate key -vcmd {string is double %P}
  pack .xe_sc.middle.cap_mult_slow -fill x
  pack .xe_sc.middle.cap_mult_slow.lab -side left 
  pack .xe_sc.middle.cap_mult_slow.text -side left -fill x -expand yes

  frame .xe_sc.middle.speed
  label .xe_sc.middle.speed.lab -text Speed
  radiobutton .xe_sc.middle.speed.slow -text Slow -variable xesc_path_dict($xesc_path_name_selected,speed_slow) -value 1
  radiobutton .xe_sc.middle.speed.fast -text Fast -variable xesc_path_dict($xesc_path_name_selected,speed_slow) -value 0
  pack .xe_sc.middle.speed -fill x
  pack .xe_sc.middle.speed.lab -side left 
  pack .xe_sc.middle.speed.slow -side left 
  pack .xe_sc.middle.speed.fast -side left 
 
  frame .xe_sc.middle.termination
  label .xe_sc.middle.termination.lab -text {Termination Mode}
  radiobutton .xe_sc.middle.termination.vcvs -text VCVS -variable xesc_path_dict($xesc_path_name_selected,termination) -value 1
  radiobutton .xe_sc.middle.termination.cap -text Cap -variable xesc_path_dict($xesc_path_name_selected,termination) -value 0
  pack .xe_sc.middle.termination -fill x
  pack .xe_sc.middle.termination.lab -side left 
  pack .xe_sc.middle.termination.vcvs -side left 
  pack .xe_sc.middle.termination.cap -side left 

  frame .xe_sc.middle.checks
  checkbutton .xe_sc.middle.checks.sensitize -text {Auto Sensitize} -variable xesc_path_dict($xesc_path_name_selected,auto_sensitize) 
  checkbutton .xe_sc.middle.checks.preserve_rail_name -text {Preserve Rail Name} -variable xesc_path_dict($xesc_path_name_selected,preserve_rail_name)  
  pack .xe_sc.middle.checks -fill x
  pack .xe_sc.middle.checks.sensitize -side left 
  pack .xe_sc.middle.checks.preserve_rail_name -side left 

  frame .xe_sc.middle.multipaths -relief groove -borderwidth 2 -width 2 -height 2
  pack .xe_sc.middle.multipaths -fill x
  frame .xe_sc.middle.multipaths.top
  label .xe_sc.middle.multipaths.top.lab -text {Multiple Paths:}
  frame .xe_sc.middle.multipaths.bottom
  pack .xe_sc.middle.multipaths.top -fill x
  pack .xe_sc.middle.multipaths.top.lab -side left -fill both 
  pack .xe_sc.middle.multipaths.bottom -fill x

  foreach path $xesc_path_name_list {
    if {$path eq {<new>}} {continue}
    frame .xe_sc.middle.multipaths.bottom.$path
    set xesc_path_dict($xesc_path_name_selected,sc_multi_$path) 0
    checkbutton .xe_sc.middle.multipaths.bottom.$path.c -text "$path" -variable xesc_path_dict($xesc_path_name_selected,sc_multi_$path) 
    pack .xe_sc.middle.multipaths.bottom.$path -side left
    pack .xe_sc.middle.multipaths.bottom.$path.c -side left 
    if {$path eq $xesc_path_name_selected} {.xe_sc.middle.multipaths.bottom.$path.c configure -state disabled}
  }
  # <FocusIn> is first time clicking on the combobox (the drop down menu)
  bind .xe_sc.topf.center.top.text <FocusIn> {
    set xesc_path_name_selected_old $xesc_path_name_selected
    set xesc_path_index [.xe_sc.topf.center.top.text current]
  }
  # <FocusOut> is when it leaves the combobox (the drop down menu), so <new> MAY have been changed to a new path
  bind .xe_sc.topf.center.top.text <FocusOut> {
    set is_new 0
    if {$xesc_path_name_selected_old ne $xesc_path_name_selected} {
      if {$xesc_path_name_selected_old eq {<new>}} {
        set is_new 1
        yxt_init_path_dict $xesc_path_name_selected
        yxt_init_path_dict <new>
      }
      # multi path check box is destroy and re-create as new path (or path renamed) get introduced
      foreach path $xesc_path_name_list {
        if {$path eq {<new>}} {continue;}
        pack forget .xe_sc.middle.multipaths.bottom.$path.c
        pack forget .xe_sc.middle.multipaths.bottom.$path
        destroy .xe_sc.middle.multipaths.bottom.$path.c
        destroy pack forget .xe_sc.middle.multipaths.bottom.$path
      }
      # Replace name if necessary
      set xesc_path_name_list [lreplace $xesc_path_name_list \
        $xesc_path_index $xesc_path_index $xesc_path_name_selected]
      if {$is_new==1} {
        lappend xesc_path_name_list <new>
      }
      .xe_sc.topf.center.top.text configure -values $xesc_path_name_list
      foreach path $xesc_path_name_list {
        if {$path eq {<new>}} {continue}
        frame .xe_sc.middle.multipaths.bottom.$path
        # TBD: Do I need to initialize xesc_path_dict($xesc_path_name_selected, )
        checkbutton .xe_sc.middle.multipaths.bottom.$path.c -text "$path" -variable xesc_path_dict($xesc_path_name_selected,sc_multi_$path) 
        pack .xe_sc.middle.multipaths.bottom.$path -side left
        pack .xe_sc.middle.multipaths.bottom.$path.c -side left 
        if {$path eq $xesc_path_name_selected} {.xe_sc.middle.multipaths.bottom.$path.c configure -state disabled}
      }
      yxtsc_win_update_change 
    }
  }
  bind .xe_sc.topf.center.top.text <<ComboboxSelected>> {
    if {$xesc_path_name_selected_old ne $xesc_path_name_selected} {
      if {$xesc_path_name_selected_old ne "<new>"} {
        # Save old path that's being changed out of (except <new>)
        foreach type $xesc_net_type {
          set xesc_path_dict($xesc_path_name_selected_old,$type) [.xe_sc.topf.center.$type.r.net get 1.0 end] 
        }
      } else {
        # reset <new> with whatever values posted
        yxt_init_path_dict <new>
      }
      # <ComboboxSelected> doesn't need multiple paths deleted because no new path was introduced
      yxtsc_win_update_change
    }
    set xesc_path_name_selected_old $xesc_path_name_selected
    set xesc_path_index [.xe_sc.topf.center.top.text current]
    foreach path $xesc_path_name_list {
      if {$path eq {<new>}} {continue}
      if {$path eq $xesc_path_name_selected} {
        .xe_sc.middle.multipaths.bottom.$path.c configure -state disabled -variable xesc_path_dict($xesc_path_name_selected,sc_multi_$path)
      } else {
        .xe_sc.middle.multipaths.bottom.$path.c configure -state normal -variable xesc_path_dict($xesc_path_name_selected,sc_multi_$path)
      }
    }
  }
  frame .xe_sc.middle.info
  label .xe_sc.middle.info.note -text {* required field to do a cut} 
  pack .xe_sc.middle.info -fill x
  pack .xe_sc.middle.info.note -side left 

  button .xe_sc.bottom.delete  -text {Delete Path} -command {
    if {$xesc_path_name_selected ne {<new>}} {
      set answer [tk_messageBox -message  "Are you sure you want to delete path $xesc_path_name_selected \nContinue?" \
             -icon warning -parent . -type yesno]
      if { $answer eq "yes"} { 
        pack forget .xe_sc.middle.multipaths.bottom.$xesc_path_name_selected.c
        pack forget .xe_sc.middle.multipaths.bottom.$xesc_path_name_selected
        destroy .xe_sc.middle.multipaths.bottom.$xesc_path_name_selected.c
        destroy pack forget .xe_sc.middle.multipaths.bottom.$xesc_path_name_selected
        set xesc_path_name_list [lreplace $xesc_path_name_list $xesc_path_index $xesc_path_index]
        .xe_sc.topf.center.top.text configure -values $xesc_path_name_list  
        set xesc_path_name_selected [lindex $xesc_path_name_list 0]
        set xesc_path_name_selected_old $xesc_path_name_selected
        set xesc_path_index 0
        .xe_sc.topf.center.top.text set $xesc_path_name_selected
        if {$xesc_path_name_selected ne {<new>}} {
          .xe_sc.middle.multipaths.bottom.$xesc_path_name_selected.c configure -state disabled
        }
        yxtsc_win_update_change
      }
      focus  .xe_sc
    }
  }
  button .xe_sc.bottom.cancel  -text Cancel -command {destroy .xe_sc}
  button .xe_sc.bottom.save -text {Save} -command {
    foreach type $xesc_net_type {
      set xesc_path_dict($xesc_path_name_selected,$type) [.xe_sc.topf.center.$type.r.net get 1.0 {end - 1 chars}] 
    }
    set save_fn ""
    if {![info exists xesc_file_save] || $xesc_file_save eq ""} {
      set save_fn [tk_getSaveFile -parent .xe_sc]
    } else {
      set save_fn [tk_getSaveFile -parent .xe_sc -initialfile $xesc_file_save]
    }
    if {$save_fn ne ""} {
      set xesc_file_save $save_fn
      yxtsc_save_path_dict $xesc_file_save 
    }
  }
  button .xe_sc.bottom.load -text {Load} -command {
    set xesc_file_save [tk_getOpenFile -parent .xe_sc]
    if {$xesc_file_save ne ""} {
      yxtsc_load_path_dict $xesc_file_save 
    }
  }
  button .xe_sc.bottom.cut -text {Cut} -command {
    while { [xschem get currsch] } { xschem go_back } 
    foreach type $xesc_net_type {
      set xesc_path_dict($xesc_path_name_selected,$type) [.xe_sc.topf.center.$type.r.net get 1.0 {end - 1 chars}] 
    }
    if {[info exists xe_conf_dict(xe_wd)] && [info exists xesc_path_dict($xesc_path_name_selected,tcl_filename)] && [info exists xesc_path_dict($xesc_path_name_selected,write_filename)] && [info exists xesc_path_dict($xesc_path_name_selected,start)] && [info exists xesc_path_dict($xesc_path_name_selected,end)] && \
      $xe_conf_dict(xe_wd) ne "" && $xesc_path_dict($xesc_path_name_selected,tcl_filename) ne "" && $xesc_path_dict($xesc_path_name_selected,write_filename) ne "" && $xesc_path_dict($xesc_path_name_selected,start) ne "" && $xesc_path_dict($xesc_path_name_selected,end) ne ""} {
      yxtsc_win_update_change_cut
      destroy .xe_sc
      # TBD: Error checking (what if it fails, need to inform user), only hilight if user says yes when sc finishes
      set cut_fn $xe_conf_dict(xe_wd)/$xesc_path_name_selected/$xesc_path_dict($xesc_path_name_selected,write_filename)
      if {[file exists $cut_fn]} { 
        yxtsc_hilight_cut $cut_fn
      }
    } else {
      if {![info exists xe_conf_dict(xe_wd)]} {
        alert_  "Need to first configure working directory for XE to do a cut"
      } else {
        alert_  "Need a tcl and output filename to do a cut.  Please fill all required fields*."
      }
    }
  }
  wm protocol .xe_sc WM_DELETE_WINDOW {destroy .xe_sc}
  pack .xe_sc.bottom.delete -side left -anchor w
  pack .xe_sc.bottom.save -side left -anchor w
  pack .xe_sc.bottom.load -side left -anchor w
  pack .xe_sc.bottom.cut -side left -anchor w
  pack .xe_sc.bottom.cancel -side right -anchor e
  pack .xe_sc.topf -fill both -expand yes
  pack .xe_sc.bottom -fill x
}

# Highlight nets and devices after cut is finished.
# TBD: It does take a while to highlight; possibly add a request from user instead of auto doing it.
# TBD: Instance is still not done yet.
proc yxtsc_hilight_cut {cut_fn} {
  set fd [open $cut_fn r]
  set a [catch "open \"$cut_fn\" r" fd]
  set pick_up_inst 0
  if {$a} {
    puts stderr "Can not open file to read to hilight nets and xtors $cut_fn"
  } else {    
    while { [gets $fd line] >=0 } {
      if { [regexp {^\*\|NET (\S+)} $line \1 net_name] } { 
        probe_net $net_name
      }
      #elseif { $line eq "*** Instance section (ccr devices)" } { 
      #  set pick_up_inst 1
      #} elseif { $line eq "*****************************************************************************" } { 
      #  set pick_up_inst 0
      #} elseif ($pick_up_inst) {
      #  if { [regexp {^(\S+)} $line \1 device_name] } { 
      #    probe_inst $device_name
      #  }
      #}
    }
  } 
  close $fd
}

proc yxtsc_create_cut_script {cut_work_dir} {
  global xesc_path_dict xesc_path_name_list xesc_path_name_selected xe_conf_dict

  set fn $cut_work_dir/$xesc_path_dict($xesc_path_name_selected,tcl_filename) 
  set cut_fn $cut_work_dir/$xesc_path_dict($xesc_path_name_selected,write_filename)
  set fd [open $fn w]
  puts $fd "#!/usr/bin/tclsh"

  puts $fd "###################################################"
  puts $fd "#                                                 "
  puts $fd "# XSchem created TCL script to run XE-SC          "
  puts $fd "# $fn"
  puts $fd "#                                                 "
  puts $fd "###################################################"
  
  yxtsc_write_one_path $fd $xesc_path_name_selected
  
  set multi_list {}
  lappend multi_list $xesc_path_name_selected
  foreach path $xesc_path_name_list {
    if {$path eq {<new>}} {continue}
    if {$path eq $xesc_path_name_selected} {continue}
    puts $fd "\n"
    if {[info exists xesc_path_dict($xesc_path_name_selected,sc_multi_$path)] && $xesc_path_dict($xesc_path_name_selected,sc_multi_$path)==1} {
      yxtsc_write_one_path $fd $path
      lappend multi_list $path
    }
  }
  if {[llength $multi_list] > 1} {
    puts $fd "set yxt_multi_paths {}"
    foreach p $multi_list {
      puts $fd "lappend yxt_multi_paths \$$p"
    }
    puts $fd "xe_write_paths \$yxt_multi_paths $cut_fn 0"
  } else {
    puts $fd "xe_write_path \$$xesc_path_name_selected $cut_fn 0"
  }
  puts $fd "# Clean-up XE-SC API"
  # puts $fd "paths.exit()" # TBD: where to call exit after load()
  close $fd
  return $fn
}

proc yxtsc_write_one_path {fd path_name} {
  global xesc_path_dict
  if ($xesc_path_dict($path_name,preserve_rail_name)) {
    puts $fd "xe_set_preserve_rail_name_in_spf"
  }
  puts $fd "set $path_name \[xe_create_path $path_name\]"
  xetcl_write_net $fd $path_name start
  set tokens [split [regexp -all -inline {\S+} $xesc_path_dict($path_name,end)]]
  foreach net $tokens {
    set net [join $net]
    regsub -all {\[} $net {\\[} net
    regsub -all {\]} $net {\\]} net
    puts $fd "xe_add_path_end_net \$$path_name $net"
  }
  set tokens [split [regexp -all -inline {\S+} $xesc_path_dict($path_name,passthru)]]
  foreach net $tokens {
    set net [join $net]
    regsub -all {\[} $net {\\[} net
    regsub -all {\]} $net {\\]} net
    puts $fd "xe_add_path_passthru_net \$$path_name $net"
  }
  if {$xesc_path_dict($path_name,speed_slow)} {
    puts $fd "xe_set_path_speed \$$path_name slow"
  } else {
    puts $fd "xe_set_path_speed \$$path_name fast"
  }
  puts $fd "xe_set_path_cap_mult_slow \$$path_name $xesc_path_dict($path_name,cap_mult_slow)"
  if ($xesc_path_dict($path_name,termination)) {
    puts $fd "xe_set_path_termination_mode \$$path_name vcvs"
  } else {
    puts $fd "xe_set_path_termination_mode \$$path_name cap"
  }
  if ($xesc_path_dict($path_name,auto_sensitize)) {
    puts $fd "xe_set_path_auto_sensitize \$$path_name"
  }
  puts $fd "xe_cut_path \$$path_name"
}

proc xetcl_write_net {fd path_name type} {
  global xesc_path_dict
  set tokens [split [regexp -all -inline {\S+} $xesc_path_dict($path_name,$type)]]
  foreach net $tokens {
    # join is needed because net is a string representation of a list with 
    # auto insert braces to preserve white space
    set net [join $net] 
    regsub -all {\[} $net {\\[} net
    regsub -all {\]} $net {\\]} net
    if {$type eq "start"} {
      puts $fd "xe_add_path_start_net \$$path_name $net"
    } elseif {$type eq "start"} {
      puts $fd "xe_add_path_end_net \$$path_name $net"
    } elseif {$type eq "start"} {
      puts $fd "xe_add_path_passthru_net \$$path_name $net"
    }
  }
}

proc yxtsc_win_update_change_cut {{callback {}}} {
  global XSCHEM_SHAREDIR netlist_dir netlist_type xschem_libs XE_RESULT
  global xe_conf_dict xesc_path_name_selected top_subckt

  set top_subckt 1
  set s [file tail [file rootname [xschem get schname]]]
  set n ${netlist_dir}/${s}
  set N ${n}.$netlist_type
  if {![info exists xe_conf_dict(xe_wd)] || ![info exists xe_conf_dict(xe_uds)] || ![info exists xe_conf_dict(xe_tfs)] || \
  $xe_conf_dict(xe_wd) eq "" || $xe_conf_dict(xe_uds) eq "" || $xe_conf_dict(xe_tfs) eq ""} {
    alert_  "Need to first configure working directory, UD files, techfiles before running XE-SC"
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
  set cut_work_dir $xe_conf_dict(xe_wd)/$xesc_path_name_selected
  if {![file exist $cut_work_dir]} {
       file mkdir $cut_work_dir
  }
  set script [yxtsc_create_cut_script $cut_work_dir]
  if {[file exists $N]} {
     if {![xe_is_init]} {
       after 500 {set XE_RESULT [yxt_load]}
       vwait XE_RESULT
     }
  } else {
    alert_  "Didn't find a netlist to run XE."
  }
  #TBD: source $script should only happen after yxt_load finishes, research how to use VWAIT
  source $script
}

proc yxt_configure_xe_win_select_dir_run_xe {{callback {}}} {
  global XSCHEM_SHAREDIR netlist_dir netlist_type sim xschem_libs XE_RESULT XE_THREAD
  global xe_conf_dict top_subckt
  set top_subckt 1
  set_sim_defaults
  set tool xe
  set s [file tail [file rootname [xschem get schname]]]
  set n ${netlist_dir}/${s}
  set N ${n}.$netlist_type
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
    set def $sim($tool,default)
    set fg  $sim($tool,$def,fg)
    set st  $sim($tool,$def,st)
    if {$fg} {
      set fg {execute_wait}
    } else {
      set fg {execute}
    }
    #set xe_cmd [subst -nocommands $sim($tool,$def,cmd)]
    #set cmd "$xe_cmd --nl=$N $ud $tf --csv"
    set cmd "--nl=$N $ud $tf --csv"
    if {$::OS == "Windows"} {
      if ([info exists XE_THREAD]) {
        alert_  "Looks like XE is still running in the background."  
      } else {
        #puts "Start running XE with a separate thread.  You will be informed with a window when that is completed:"
        #puts "Command to XE = $cmd"
        #thread::create "package require Tk;  cd $xe_conf_dict(xe_wd); eval exec $cmd; tk_messageBox -message {XE completed} -icon warning;"

        set XE_THREAD [thread::create {
          thread::wait ; # Enter the event loop
        }]
        thread::send $XE_THREAD "cd $xe_conf_dict(xe_wd)" result
        #thread::send -async $XE_THREAD "eval exec $cmd" XE_RESULT
        thread::send -async $XE_THREAD "[yxt_run_all_xe $cmd]" XE_RESULT
      }
    } else {
      set id [$fg $st sh -c "cd $xe_conf_dict(xe_wd); $cmd"]
      set execute_callback($id) $callback
    }
  } else {
    alert_  "Didn't find a netlist to run XE."
  }
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

proc yxt_see_report_win_context_menu {{msg {}}} {
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
  if (![info exists xe_conf_dict(xe_wd)]) {
    alert_  "Need to first configure XE to read report"
    yxt_configure_xe_win_select_dir 0
    return
  }
  yxt_clear_global
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
    if [regexp {\.xe_lm_v} $file] {
      set xe_report_ht(xe_lm_entry) $file
    } elseif [regexp {xe_ckc_classify_net\.csv} $file] {
      set xe_report_ht(xe_ckc_entry_classify_net) $file
    } elseif [regexp {xe_ckc_unclassify_net\.csv} $file] {
      set xe_report_ht(xe_ckc_entry_unclassify_net) $file
    } elseif [regexp {xe_ckc_classify_device\.csv} $file] {
      set xe_report_ht(xe_ckc_entry_classify_device) $file
    } elseif [regexp {xe_ckc_unclassify_device\.csv} $file] {
      set xe_report_ht(xe_ckc_entry_unclassify_device) $file
    } elseif [regexp {xe_dmrc_classify_net\.csv} $file] {
      set xe_report_ht(xe_dmrc_entry_classify_net) $file
    } elseif [regexp {xe_dmrc_unclassify_net\.csv} $file] {
      set xe_report_ht(xe_dmrc_entry_unclassify_net) $file
    } elseif [regexp {xe_dmrc_classify_device\.csv} $file] {
      set xe_report_ht(xe_dmrc_entry_classify_device) $file
    } elseif [regexp {xe_dmrc_unclassify_device\.csv} $file] {
      set xe_report_ht(xe_dmrc_entry_unclassify_device) $file
    } elseif [regexp {xe_lm_classify_net\.csv} $file] {
      set xe_report_ht(xe_lm_entry_classify_net) $file
    } elseif [regexp {xe_lm_unclassify_net\.csv} $file] {
      set xe_report_ht(xe_lm_entry_unclassify_net) $file
    } elseif [regexp {xe_lm_classify_device\.csv} $file] {
      set xe_report_ht(xe_lm_entry_classify_device) $file
    } elseif [regexp {xe_lm_unclassify_device\.csv} $file] {
      set xe_report_ht(xe_lm_entry_unclassify_device) $file
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

  if {[info exists xe_report_ht(xe_lm_entry)]} {
    set xe_lm_entry [.xe_report_dialog.l.paneleft.tree insert {} end -text "XE-LM"]
    set xe_lm_entry_lm [.xe_report_dialog.l.paneleft.tree insert $xe_lm_entry end -text "xe_lm_v"]
    set xe_report_ht($xe_lm_entry_lm) $xe_report_ht(xe_lm_entry)

    set has_classify_net [info exists xe_report_ht(xe_lm_entry_classify_net)]
    set has_unclassify_net [info exists xe_report_ht(xe_lm_entry_unclassify_net)]
    set has_classify_device [info exists xe_report_ht(xe_lm_entry_classify_device)]
    set has_unclassify_device [info exists xe_report_ht(xe_lm_entry_unclassify_device)]
    if {$has_unclassify_net || $has_unclassify_net || $has_classify_device || $has_unclassify_device} {
      set xe_lm_entry_classify [.xe_report_dialog.l.paneleft.tree insert $xe_lm_entry end -text "Classification"]  
    }
    if {$has_classify_net} {
      set xe_lm_entry_classify_net [.xe_report_dialog.l.paneleft.tree insert $xe_lm_entry_classify end -text "Classify Net"]
      set xe_report_ht($xe_lm_entry_classify_net) $xe_report_ht(xe_lm_entry_classify_net)
    }
    if {$has_unclassify_net} {
      set xe_lm_entry_unclassify_net [.xe_report_dialog.l.paneleft.tree insert $xe_lm_entry_classify end -text "Un-Classify Net"]
      set xe_report_ht($xe_lm_entry_unclassify_net) $xe_report_ht(xe_lm_entry_unclassify_net)
    }
    if {$has_classify_device} {
      set xe_lm_entry_classify_device [.xe_report_dialog.l.paneleft.tree insert $xe_lm_entry_classify end -text "Classify Device"]
      set xe_report_ht($xe_lm_entry_classify_device) $xe_report_ht(xe_lm_entry_classify_device)
    }
    if {$has_unclassify_device} {
      set xe_lm_entry_unclassify_device [.xe_report_dialog.l.paneleft.tree insert $xe_lm_entry_classify end -text "Un-Classify Device"]
      set xe_report_ht($xe_lm_entry_unclassify_device) $xe_report_ht(xe_lm_entry_unclassify_device)
    }
  }
  
  if {[info exists xe_report_ht(xe_ckc_entry_classify_net)]} {
    set xe_ckc_entry [.xe_report_dialog.l.paneleft.tree insert {} end -text "XE-CKC"]
    set has_classify_net [info exists xe_report_ht(xe_ckc_entry_classify_net)]
    set has_unclassify_net [info exists xe_report_ht(xe_ckc_entry_unclassify_net)]
    set has_classify_device [info exists xe_report_ht(xe_ckc_entry_classify_device)]
    set has_unclassify_device [info exists xe_report_ht(xe_ckc_entry_unclassify_device)]
    if {$has_unclassify_net || $has_unclassify_net || $has_classify_device || $has_unclassify_device} {
      set xe_ckc_entry_classify [.xe_report_dialog.l.paneleft.tree insert $xe_ckc_entry end -text "Classification"]  
    }
    if {$has_classify_net} {
      set xe_ckc_entry_classify_net [.xe_report_dialog.l.paneleft.tree insert $xe_ckc_entry_classify end -text "Classify Net"]
      set xe_report_ht($xe_ckc_entry_classify_net) $xe_report_ht(xe_ckc_entry_classify_net)
    }
    if {$has_unclassify_net} {
      set xe_ckc_entry_unclassify_net [.xe_report_dialog.l.paneleft.tree insert $xe_ckc_entry_classify end -text "Un-Classify Net"]
      set xe_report_ht($xe_ckc_entry_unclassify_net) $xe_report_ht(xe_ckc_entry_unclassify_net)
    }
    if {$has_classify_device} {
      set xe_ckc_entry_classify_device [.xe_report_dialog.l.paneleft.tree insert $xe_ckc_entry_classify end -text "Classify Device"]
      set xe_report_ht($xe_ckc_entry_classify_device) $xe_report_ht(xe_ckc_entry_classify_device)
    }
    if {$has_unclassify_device} {
      set xe_ckc_entry_unclassify_device [.xe_report_dialog.l.paneleft.tree insert $xe_ckc_entry_classify end -text "Un-Classify Device"]
      set xe_report_ht($xe_ckc_entry_unclassify_device) $xe_report_ht(xe_ckc_entry_unclassify_device)
    }
    if {[llength $list_checks] > 0} {
      set xe_ckc_entry_checks [.xe_report_dialog.l.paneleft.tree insert $xe_ckc_entry end -text "CKC Checks"]
      foreach check $list_checks {
        set id [.xe_report_dialog.l.paneleft.tree insert $xe_ckc_entry_checks end -text $check]
        set xe_report_ht($id) $check
      }
    }
  }

  if {[info exists xe_report_ht(xe_dmrc_entry_classify_net)]} {
    set xe_dmrc_entry [.xe_report_dialog.l.paneleft.tree insert {} end -text "XE-DMRC"]
    set has_classify_net [info exists xe_report_ht(xe_dmrc_entry_classify_net)]
    set has_unclassify_net [info exists xe_report_ht(xe_dmrc_entry_unclassify_net)]
    set has_classify_device [info exists xe_report_ht(xe_dmrc_entry_classify_device)]
    set has_unclassify_device [info exists xe_report_ht(xe_dmrc_entry_unclassify_device)]
    if {$has_unclassify_net || $has_unclassify_net || $has_classify_device || $has_unclassify_device} {
      set xe_dmrc_entry_classify [.xe_report_dialog.l.paneleft.tree insert $xe_dmrc_entry end -text "Classification"]  
    }
    if {$has_classify_net} {
      set xe_dmrc_entry_classify_net [.xe_report_dialog.l.paneleft.tree insert $xe_dmrc_entry_classify end -text "Classify Net"]
      set xe_report_ht($xe_dmrc_entry_classify_net) $xe_report_ht(xe_dmrc_entry_classify_net)
    }
    if {$has_unclassify_net} {
      set xe_dmrc_entry_unclassify_net [.xe_report_dialog.l.paneleft.tree insert $xe_dmrc_entry_classify end -text "Un-Classify Net"]
      set xe_report_ht($xe_dmrc_entry_unclassify_net) $xe_report_ht(xe_dmrc_entry_unclassify_net)
    }
    if {$has_classify_device} {
      set xe_dmrc_entry_classify_device [.xe_report_dialog.l.paneleft.tree insert $xe_dmrc_entry_classify end -text "Classify Device"]
      set xe_report_ht($xe_dmrc_entry_classify_device) $xe_report_ht(xe_dmrc_entry_classify_device)
    }
    if {$has_unclassify_device} {
      set xe_dmrc_entry_unclassify_device [.xe_report_dialog.l.paneleft.tree insert $xe_dmrc_entry_classify end -text "Un-Classify Device"]
      set xe_report_ht($xe_dmrc_entry_unclassify_device) $xe_report_ht(xe_dmrc_entry_unclassify_device)
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
    yxt_see_report_win_context_menu %W [%W index @%x,%y] %X %Y 
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
        yxt_clear_global
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
  global pathlist current_dirname
  global xe_cm_wcounter xe_cm_w xe_sd_fi_inst
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

proc yxt_run_all_xe {cmd} {
  global XE_ROOT_DIR
  yxt_run_xe_lm $cmd
  yxt_run_xe_dmrc
  yxt_read_net_property
}


proc yxt_run_xe_lm {cmd} {
  set xe_lm_cmd "xe_lm_shell $cmd"
  #puts $xe_lm_cmd
  #eval exec $xe_lm_cmd
}

proc yxt_run_xe_dmrc {} {
  global XE_ROOT_DIR xe_conf_dict
  set wd $xe_conf_dict(xe_wd)
  set design [file tail [file rootname [xschem get schname]]]
  source $XE_ROOT_DIR/xe_ckc_limits.tcl
  source $XE_ROOT_DIR/xe_ckc_helpers.tcl
  set check_scripts [lsort [glob -nocomplain -directory $XE_ROOT_DIR -tails check_*.{tcl}]]
  foreach script $check_scripts {
    source $XE_ROOT_DIR/$script
  }
  yxt_load
  foreach script $check_scripts {
    regexp {check_(.*)\.tcl} $script matched check_name
    set filename $wd/${design}_${check_name}.csv
    set fd [open $filename w]
    set a [catch "open \"$filename\" w" fd]
    if {$a} {
      puts stderr "Can not open file to run $check_name: $filename"
    } else {   
      xetcl_check_${check_name} $fd   
      close $fd
    } 
  }
  #xetcl_driver_weff
  #xetcl_finfet_device_size
  #xetcl_sram6t_device_size
}

################################################################################
# Replace Native Xschem's with XE's
# Need to decide how to best save XE's settings
# proc save_file_dialog { msg ext global_initdir {initialfile {}} {overwrt 1} } {
#proc update_recent_file {f} 
################################################################################
################################################################################
# Temporary
## given a hierarchical instance name x1.xamp go down in the hierarchy and 
## highlight the specified instance.
proc probe_inst_old {device hilight_each_level} {

  xschem set no_draw 1
  # return to top level if not already there
  while { [xschem get currsch] } { xschem go_back } 
  if {$device ne "."} {
    while { [regexp {\.} $device] } {
      set inst $device
      regsub {\..*} $inst {} inst
      regsub {[^.]+\.} $device {} device
      if {$hilight_each_level} {
        xschem search exact 0 name $inst
      }
      xschem search exact 1 name $inst
      xschem descend
    }
    set err [catch {xschem search exact 0 name $device}]
  }
  xschem set no_draw 0
  xschem redraw
}

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
  return $path
}
