#################################################################################
#                                                                               #
# XE-CKC                                                                        #
# Copyright (c) YX Technologies, Inc. 2020, All Rights Reserved.                #
#                                                                               #
# Charge share check                                                            #
#                                                                               #
# Revision History:                                                             #
# 07/26/2022: Initial                                                           #
#################################################################################

proc xetcl_check_charge_share {{fd {}}} {
  global xetcl_charge_sharing_ratio_limit
  global xetcl_charge_sharing_fatal_adj xetcl_charge_sharing_error_adj xetcl_charge_sharing_warn_adj
  set check_name charge_share
  set num_checked_objects 0 
  #set fn "${design_name}_self_$check_name.csv"
  #set fd [open $fn "w"]
  if {$fd eq ""} {
    puts "subckt,net,c1_z,c1_int,c0_int,ratio,severity,limit"
  } else {
    puts $fd "subckt,net,c1_z,c1_int,c0_int,ratio,severity,limit"
  }
  set subckt [xe_get_top_subckt]
  set subckt_nm [xe_get_subckt_name $subckt]  
  if {[xe_is_skip_subckt $subckt $check_name]==1} {continue}
  set subckt_name [xe_get_subckt_name $subckt]
  # puts "Check $subckt_name"
  set nets [xe_get_subckt_nets $subckt]
  foreach net $nets {
    set name [xe_get_net_name $net]
    # puts "Checking net: $name"
    if {[xe_is_pin_net $net] && ![xe_is_top_subckt $subckt]} {continue}
    if {[xe_is_skip_net $net $check_name]==1} {continue}               
    if {[xe_is_supply_net $net] || [xe_is_vss_net $net]} {continue}    
    if {![xetcl_is_pc_net $net]} {continue}                                                      
    # count up number of fi_nets checked by this script, excluding skipped nets.
    incr num_checked_objects
        
    set c1_z [xe_get_net_cap1 $net]
    set c0_int [xe_get_pc_net_internal_nets_cap0 $net 1]
    set c1_int [xe_get_pc_net_internal_pc_cap1 $net]
    #set c1_int [expr {$c1_stack - $c1_z}] 
    #set c0_int [expr {$c0_stack - $c0_z}] 
    set cap_ratio 0.0
    set c_total [expr {$c1_z + $c0_int + $c1_int}]
    if {$c_total > 0.0} {
      set cap_ratio [expr {$c0_int/$c_total}]
    }
    if {$cap_ratio < $xetcl_charge_sharing_ratio_limit} {
      #summary = "{Beta ratio (%.*g, %.*g) out of range (%.*g, %.*g)}" %(self.xg.precision, min_beta, self.xg.precision, max_beta, self.xg.precision, self.min_ratio, self.xg.precision, self.max_ratio)
      set fatal_limit [expr $xetcl_charge_sharing_ratio_limit-$xetcl_charge_sharing_fatal_adj] 
      set error_limit [expr $xetcl_charge_sharing_ratio_limit-$xetcl_charge_sharing_error_adj] 
      set warn_limit [expr $xetcl_charge_sharing_ratio_limit-$xetcl_charge_sharing_warn_adj] 
        
      if {$cap_ratio < $fatal_limit} {
        set severity Fatal
      } elseif {$cap_ratio < $error_limit} {
        set severity Error
      } elseif {$cap_ratio < $warn_limit} {
        set severity Warn
      } else {
        set severity Normal
      }
      if {$fd eq ""} {
        puts "$subckt_nm,$name,[format "%.2f" $c1_z],[format "%.2f" $c1_int],[format "%.2f" $c0_int],[format "%.2f" $cap_ratio],$severity,[format "%.2f" $xetcl_charge_sharing_ratio_limit]"
      } else {
        puts $fd "$subckt_nm,$name,[format "%.2f" $c1_z],[format "%.2f" $c1_int],[format "%.2f" $c0_int],[format "%.2f" $cap_ratio],$severity,[format "%.2f" $xetcl_charge_sharing_ratio_limit]"
      }
    }
  }
  #close $fd
}