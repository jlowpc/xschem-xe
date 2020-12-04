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

proc xetcl_is_memory_net {net} {
  if {![info exists $net]} {return 0}
  set comp2 xe_get_net_composite2_name $net
  if {$comp2 eq "memory"} {return 1}
  return 0
}