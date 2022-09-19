#################################################################################
#                                                                               #
# XE-CKC                                                                        #
# Copyright (c) YX Technologies, Inc. 2020, All Rights Reserved.                #
#                                                                               #
# xe_ckc_helpers.tcl                                                            #
#                                                                               #
# Revision History:                                                             #
# 12/04/2020: Initial
#################################################################################

# Misc. Utils.
proc yxt_dbgPrint {check_name msg}      {puts stderr "DEBUG:: $msg"}
proc yxt_terminate {rcode}              {exit $rcode}
proc yxt_fatal {check_name msg rcode}   {puts stderr "$check_name-F: $msg"; yxt_terminate $rcode}
proc yxt_error {check_name msg}         {puts stderr "$check_name-E: $msg"; return(2);}
proc yxt_warn {check_name msg}          {puts stderr "$check_name-W: $msg"; return(1);}
proc yxt_msg {check_name msg}           {puts stderr "$check_nameI: $msg"; return(0);}

proc yxt_is_memory_net {net} {
  if {[info exists $net]} {return 0}
  set comp2 [xe::get_net_composite2_name $net]
  if {$comp2 eq "memory"} {return 1}
  return 0
}

# Find precharged nets.
proc xetcl_is_pc_net {net} {
  if {[info exists $net]} {return 0}
  set family [xe_get_net_family_name $net]
  if {$family ne "pc"} {return 0}
  set type [xe_get_net_type_name $net]
  #if {($type ne "z") && ($type ne "intpc")} {return 0}
  if {($type ne "z")} {return 0}
  return 1
}

proc yxt_is_dynamic_family {family} {
  if [regexp {^pc|sa} $family] {return 1}
  return 0
}