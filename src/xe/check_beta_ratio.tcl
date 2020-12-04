#################################################################################
#                                                                               #
# XE-CKC                                                                        #
# Copyright (c) YX Technologies, Inc. 2020, All Rights Reserved.                #
#                                                                               #
# Beta ratio check                                                              #
#                                                                               #
# Revision History:                                                             #
# 07/23/2020: Initial
#################################################################################

proc get_net_max_beta {net subckt_nm net_nm ht} {
  upvar #0 $ht cache_ht
  global xetcl_beta_ratio_use_w_as_finfet
  set subckt_net $subckt_nm$net_nm
  if {[info exists cache_ht] && [info exists cache_ht($subckt_net)]} {return $cache_ht[$subckt_net]}
  set max_beta 0
  if {[xe_get_finfet_model_type]==0 || $xetcl_beta_ratio_use_w_as_finfet==1} {
    set max_beta [xe_get_net_max_beta $net]
  } else {
    set max_beta [xe_get_net_max_fin_beta $net]
  }
  set cache_ht($subckt_net) $max_beta
  return $max_beta
}

proc get_net_min_beta {net subckt_nm net_nm ht} {
  upvar #0 $ht cache_ht
  global xetcl_beta_ratio_use_w_as_finfet
  set subckt_net $subckt_nm$net_nm
  if {[info exists cache_ht] && [info exists cache_ht($subckt_net)]} {return $cache_ht[$subckt_net]}
  set min_beta 0
  if {[xe_get_finfet_model_type]==0 || $xetcl_beta_ratio_use_w_as_finfet==1} {
    set min_beta [xe_get_net_min_beta $net]
  } else {
    set min_beta [xe_get_net_min_fin_beta $net]
  }
  set cache_ht($subckt_net) $min_beta
  return $min_beta
}

proc xetcl_check_beta_ratio {} {
  global xetcl_beta_ratio_min_ratio xetcl_beta_ratio_max_ratio
  global xetcl_beta_ratio_fatal_adj xetcl_beta_ratio_error_adj xetcl_beta_ratio_warn_adj
  array set cache_max_ht {}
  array set cache_min_ht {}
  set check_name beta_ratio
  set num_checked_objects 0 
  #set fn "${design_name}_self_$check_name.csv"
  #set fd [open $fn "w"]
  #puts $fd "subckt,net,min_beta,max_beta,severity,min_limit,max_limit"
  puts "subckt,net,min_beta,max_beta,severity,min_limit,max_limit"
  set subckts [xe_get_subckts]
  foreach subckt $subckts {
    set subckt_nm [xe_get_subckt_name $subckt]  
    if {[xe_is_skip_subckt $subckt $check_name]==1} {continue}
    set subckt_name [xe_get_subckt_name $subckt]
    #puts "Check $subckt_name"
    set nets [xe_get_subckt_nets $subckt]
    foreach net $nets {
      set name [xe_get_net_name $net]
      if {[xe_is_pin_net $net] && ![xe_is_top_subckt $subckt]} {continue}
      if {[xe_is_skip_net $net $check_name]==1} {continue}               
      if {[xe_is_supply_net $net] || [xe_is_vss_net $net]} {continue}    
      if {[xetcl_is_memory_net $net]==1} {continue}                      
      set type [xe_get_net_type_name $net]
      if {$type ne "z"} {continue}                                       
      if {[xe_is_cs_gate_net $net] != 1} {continue}                      
      if {[xe_is_ccr_output_net $net] != 1} {continue}
      if {[xe_is_bbox_output_net $net]==1} {continue}
      # count up number of fi_nets checked by this script, excluding skipped nets.
      incr num_checked_objects
        
      set max_beta [get_net_max_beta $net $subckt_nm $name cache_max_ht]
      set min_beta [get_net_min_beta $net $subckt_nm $name cache_min_ht]
      if {$max_beta > $xetcl_beta_ratio_max_ratio || $min_beta < $xetcl_beta_ratio_min_ratio} {
        #summary = "{Beta ratio (%.*g, %.*g) out of range (%.*g, %.*g)}" %(self.xg.precision, min_beta, self.xg.precision, max_beta, self.xg.precision, self.min_ratio, self.xg.precision, self.max_ratio)
        set fatal_min [expr $xetcl_beta_ratio_min_ratio-$xetcl_beta_ratio_fatal_adj] 
        set fatal_max [expr $xetcl_beta_ratio_max_ratio-$xetcl_beta_ratio_fatal_adj] 
        set error_min [expr $xetcl_beta_ratio_min_ratio-$xetcl_beta_ratio_error_adj] 
        set error_max [expr $xetcl_beta_ratio_max_ratio-$xetcl_beta_ratio_error_adj] 
        set warn_min [expr $xetcl_beta_ratio_min_ratio-$xetcl_beta_ratio_warn_adj] 
        set warn_max [expr $xetcl_beta_ratio_max_ratio-$xetcl_beta_ratio_warn_adj] 
        if {$max_beta > $fatal_max || $min_beta < $fatal_min} {
          set severity Fatal
        } elseif {$max_beta > $error_max || $min_beta < $error_min} {
          set severity Error
        } elseif {$max_beta > $warn_max || $min_beta < $warn_min} {
          set severity Warn
        } else {
          set severity Normal
        }
        #puts $fd "$subckt_nm,$name,$min_beta,$max_beta,$severity,$xetcl_beta_ratio_min_ratio,$xetcl_beta_ratio_max_ratio"
        puts "$subckt_nm,$name,$min_beta,$max_beta,$severity,$xetcl_beta_ratio_min_ratio,$xetcl_beta_ratio_max_ratio"
      }
    }
  }
  #close $fd
}