####################################################
# Beta Ratio
global xetcl_beta_ratio_min_ratio xetcl_beta_ratio_max_ratio xetcl_beta_ratio_fatal_adj xetcl_beta_ratio_error_adj xetcl_beta_ratio_warn_adj
set xetcl_beta_ratio_min_ratio 0.5 
set xetcl_beta_ratio_max_ratio 4.0
# Severity: Fatal, Error, Warning adjustment
# Beta ratio < min_ratio - adj or ratio > max_ratio + fatal_adj will be marked severity FATAL 
# Beta ratio < min_ratio - adj or ratio > max_ratio + fatal_adj will be marked severity ERROR
# Beta ratio < min_ratio - adj or ratio > max_ratio + fatal_adj will be marked severity WARN
set xetcl_beta_ratio_fatal_adj 200 
set xetcl_beta_ratio_error_adj 10  
set xetcl_beta_ratio_warn_adj   0  
set xetcl_beta_ratio_use_w_as_finfet 0
# Charge sharing
global xetcl_charge_sharing_ratio_limit xetcl_charge_sharing_fatal_adj xetcl_charge_sharing_error_adj xetcl_charge_sharing_warn_adj
set xetcl_charge_sharing_ratio_limit 0.75
set xetcl_charge_sharing_fatal_adj 0.3
set xetcl_charge_sharing_error_adj 0.2
set xetcl_charge_sharing_warn_adj  0.1

####################################################