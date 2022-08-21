proc traversal {file} {
  if { $file eq {} || [file exists $file] } {
    puts stderr "empty or existing file..."
    return
  }
  xschem unselect_all
  xschem set no_draw 1 ;# disable screen update
  xschem set no_undo 1 ;# disable undo 
  set fd [open $file "w"]
  hier_traversal $fd 0
  xschem set no_draw 0
  xschem set no_undo 0
  close $fd
}

# return "$n * $indent" spaces
proc spaces {n} {
  set indent 4
  set n [expr {$n * $indent}]
  return [format %${n}s {}]
}

# recursive procedure
proc hier_traversal {fd {level 0}} {
  set schpath [xschem get sch_path]
  set instances  [xschem get instances]
  for {set i 0} { $i < $instances} { incr i} {
    set instname [xschem getprop instance $i name]
    set symbol [xschem getprop instance $i cell::name]
    set type [xschem getprop symbol $symbol type]
    puts $fd "[spaces $level]$schpath$instname symbol: $symbol, type: $type"
    if {$type eq {subcircuit}} {
      set current_level [xschem get currsch]
      set ninst [lindex [split [xschem expandlabel $instname] { }] 1]
      for {set n 1} {$n <= $ninst} { incr n} {
        xschem select instance $i
        xschem descend $n
        # ensure previous descend was successful
        if {[xschem get currsch] == $current_level + 1} {
          incr level
          hier_traversal $fd $level
          xschem go_back
          incr level -1
        }
      }
    }
  }
}


