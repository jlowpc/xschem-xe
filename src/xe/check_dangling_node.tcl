#################################################################################
#                                                                               #
# XE-CKC                                                                        #
# Copyright (c) YX Technologies, Inc. 2020, All Rights Reserved.                #
#                                                                               #
# Dangling Node check                                                           #
#                                                                               #
# Revision History:                                                             #
# 07/23/2020: Initial
#################################################################################

proc xetcl_check_dangling_node {{fd {}}} {
  if {$fd eq ""} {
    puts "subckt,device"
  } else {
    puts $fd "subckt,device"
  }
  set subckts [xe_get_subckts]
  foreach subckt $subckts {
    set subckt_nm [xe_get_subckt_name $subckt]
    #puts "Check $subckt_nm"
    set devices [xe_get_subckt_devices $subckt]
    foreach device $devices {
      set device_nm [xe_get_device_name $device]
      if {[xe_is_xtor_device $device]!=1} {continue}
      set gate [xe_get_xtor_gate_net $device]
      if {$gate=={NULL}} {continue}
      #puts "Checking $device_nm"
      set gate_nm [xe_get_net_name $gate]
      if {[xe_is_supply_net $gate] || [xe_is_vss_net $gate]} {continue} 
      set ok1 [xe_is_pin_net $gate]
      set ok2 0
      if {$ok1==0} {
        set ok2 [yxtHasSDXtorsConnectionNet $gate]
      }
      if {$ok1 || $ok2} {continue}
      if {$fd eq ""} {
        puts "$subckt_nm,$device_nm"
      } else {
        puts $fd "$subckt_nm,$device_nm"
      }
    }
  }
}

proc yxtHasSDXtorsConnectionNet {gate} {
  set gate_nm [xe_get_net_name $gate]
  set pins [xe_get_net_connected_pins $gate]
  foreach pin $pins {
    set xtor [xe_get_pin_device $pin]
    if {[xe_is_xtor_device $xtor] !=1} {continue}
    set drn [xe_get_xtor_drn_net $xtor]
    set drn_nm [xe_get_net_name $drn]
    set src [xe_get_xtor_src_net $xtor]
    set src_nm [xe_get_net_name $src]
    if {$drn_nm == $gate_nm || $src_nm == $gate_nm} {
      return 1
    }
  }
  return 0
}