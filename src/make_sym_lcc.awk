#!/usr/bin/awk -f
#
#  File: make_sym_lcc.awk
#  
#  This file is part of XSCHEM,
#  a schematic capture and Spice/Vhdl/Verilog netlisting tool for circuit 
#  simulation.
#  Copyright (C) 1998-2020 Stefan Frederik Schippers
# 
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
# 
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
# 
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
#

BEGIN{
  width=150
}

FNR == 1 {
    if (_filename_ != "") endfile(_filename_)
    _filename_ = FILENAME
    beginfile(FILENAME)
}
 
END  { endfile(_filename_) }
 
 
function beginfile(f)
{
 sym=name=f
 sub(/^.*\//,"",name)
 name_ext=name
 sub(/\.sch.*$/,"",name)
 sub(/\.sch.*$/,".sym",sym)
 print "**** symbol-izing: " sym "  ****"
  template="" ; start=0
  while((getline symline <sym) >0) {
   if(symline ~ /^[GK] \{/ ) start=1
   if(start) template=template symline "\n"
   if(symline ~ /\} *$/) start=0
  }
  close(sym)
  
   
 size=2.5
 space=20
 lwidth=20
 textdist=5
 labsize=0.2
 titlesize=0.3
 text_voffset=20
 lab_voffset=4
 ip=op=n_pin=n_p=n_l=0
 print "v {xschem version=2.9.8 file_version=1.2}" > sym
 if(template=="") {
  printf "%s", "K {type=subcircuit\nformat=\"@name @pinlist @symname\"\n"  >sym
  printf "%s\n", "template=\"name=x1\""  >sym
  printf "%s", "}\n"  >sym
 } 
 else print template >sym
}


/^C \{.*generic_pin(\.sym)?\}/{
  get_end_line()
  process_line()
  type_pin[n_pin]=generic_type
  dir_pin[n_pin]="generic"
  x_pin[n_pin] = $3+0 # y coordinate of pin 20140519
  y_pin[n_pin] = $4+0 # y coordinate of pin 20140519
  rotation_pin[n_pin] = $5+0 # y coordinate of pin 20140519
  flip_pin[n_pin] = $6+0 # y coordinate of pin 20140519
  index_pin[n_pin] = n_pin # one level indirection for sorting pins 20140519
  value_pin[n_pin]=value
  label_pin[n_pin] = pin_label
  props_pin[n_pin] = rest_of_props()
  n_pin++
  ip++
}

/^P /{
  get_end_line()
  process_box_line()
  box[n_p]=$0
  n_p++
}

/^C \{.*ipin(\.sym)?\}/{
  get_end_line()
  process_line()
  type_pin[n_pin]=sig_type
  verilog_pin[n_pin]=verilog_type
  dir_pin[n_pin]="ipin"
  x_pin[n_pin] = $3+0 # y coordinate of pin 20140519
  y_pin[n_pin] = $4+0 # y coordinate of pin 20140519
  rotation_pin[n_pin] = $5+0 # y coordinate of pin 20140519
  flip_pin[n_pin] = $6+0 # y coordinate of pin 20140519
  index_pin[n_pin] = n_pin # one level indirection 20140519
  value_pin[n_pin]=value
  label_pin[n_pin] = pin_label
  props_pin[n_pin] = rest_of_props()
  n_pin++
  ip++
}

$0 ~ /^C \{.*opin(\.sym)?\}/ && $0 !~ /^C \{.*iopin(\.sym)?\}/ {
  get_end_line()
  process_line()
  type_pin[n_pin]=sig_type
  verilog_pin[n_pin]=verilog_type
  dir_pin[n_pin]="opin"
  x_pin[n_pin] = $3+0 # y coordinate of pin 20140519
  y_pin[n_pin] = $4+0 # y coordinate of pin 20140519
  rotation_pin[n_pin] = $5+0 # y coordinate of pin 20140519
  flip_pin[n_pin] = $6+0 # y coordinate of pin 20140519
  index_pin[n_pin] = n_pin # one level indirection 20140519
  value_pin[n_pin]=value
  label_pin[n_pin] = pin_label
  props_pin[n_pin] = rest_of_props()
  n_pin++
  op++
}

/^C \{.*iopin(\.sym)?\}/{
  print "iopin"
  get_end_line()
  process_line()
  type_pin[n_pin]=sig_type
  verilog_pin[n_pin]=verilog_type
  dir_pin[n_pin]="iopin"
  x_pin[n_pin] = $3+0 # y coordinate of pin 20140519
  y_pin[n_pin] = $4+0 # y coordinate of pin 20140519
  rotation_pin[n_pin] = $5+0 # y coordinate of pin 20140519
  flip_pin[n_pin] = $6+0 # y coordinate of pin 20140519
  index_pin[n_pin] = n_pin # one level indirection 20140519
  value_pin[n_pin]=value
  label_pin[n_pin] = pin_label
  props_pin[n_pin] = rest_of_props()
  n_pin++
  op++
}

function rest_of_props()
{
  sub(/^C \{[^}]+\}.*\{/,"")
  sub(/\}[ \t]*$/, "")
  sub(/verilog_type[ \t]*=[ \t]*[^ \t]+[ \t]?/, "")
  sub(/sig_type[ \t]*=[ \t]*[^ \t]+[ \t]?/, "")
  sub(/lab[ \t]*=[ \t]*[^ \t]+[ \t]?/, "")
  sub(/value[ \t]*=[ \t]*[^ \t]+[ \t]?/, "")
  sub(/^[ \t]*$/, "")
  return $0
}

function process_line()
{
 print "process_line"
 sig_type=""  #20070726    # "std_logic"
 verilog_type= ""  # 20070726   "wire" #09112003
 pin_label=""
 value=""
 generic_type=""
 
 if($0 ~ /^.*lab=/)
 {
  pin_label=$0
  sub(/^.*lab=/,"",pin_label)
  sub(/[ }].*$/,"",pin_label)
 }

 if($0 ~ /^.*verilog_type=/)  #09112003
 {
  verilog_type=$0
  sub(/^.*verilog_type=/,"",verilog_type)
  sub(/[}].*$/,"",verilog_type)
  sub(/ $/,"",verilog_type)
 }
 
 if($0 ~ /^.*sig_type=/)
 {
  sig_type=$0
  sub(/^.*sig_type=/,"",sig_type)
  sub(/[ }].*$/,"",sig_type)
 }
 
 if($0 ~ /^.*generic_type=/)
 {
  generic_type=$0
  sub(/^.*generic_type=/,"",generic_type)
  sub(/[}].*$/,"",generic_type)
  sub(/[a-zA-Z0-9]+=.*$/,"",generic_type)	#03062002, allow spaces
  print "------------------------" $0 "-->" generic_type
 }

 if($0 ~ /^.*value=/)
 {
  value=$0
  if(value ~ /value="/) 
  {
   sub(/^.*value="/,"",value)
   value= "\"" substr(value,1, match(value, /[^\\]"/)  ) "\""
  }
  else
  {
   sub(/^.*value=/,"",value)
   sub(/[ }].*$/,"",value)
  }
 }
 #print "process_line: returning:" $0
 # print "process_line: pin_label=" pin_label " verilog_type=" verilog_type
}

function process_box_line()
{
 print "process_box_line"
 
 if($0 ~ /^.*dash=/)
 {
  sub(/dash=[0-9]/,"dash=0")
 }
 print "process_box_line: returning:" $0
 # print "process_line: pin_label=" pin_label " verilog_type=" verilog_type
}

## join lines like this:
## C {ipin.sym} ........ {lab=xxx
## verilog_type=reg}
function get_end_line()
{
  print "get_end_line"
  while($0 !~ /\}[ \t]*$/) {
    a=$0
    getline
    $0 = a " " $0
  }
}

function endfile(f) {

 n=ip;if(op>n) n=op
 if(n==0) n=1
 m=(n-1)/2
 y=-m*space
 x=-width
 

 for(ii=0;ii<n_p;ii++)
 {
  print box[ii] >sym
  awk split(box[ii],a," ");
  box_type=a[1]
  box_minx=box_maxx=box_miny=box_maxy=0
  if (box_type=="P")
  {
    box_num_vertices = a[3]
    for (j=0;j<box_num_vertices*2;j+=2)
    {
      if (box_minx==0 || box_minx > a[4+j]) box_minx=a[4+j]
      if (box_maxx==0 || box_maxx < a[4+j]) box_maxx=a[4+j]
      if (box_miny==0 || box_miny > a[4+j+1]) box_miny=a[4+j+1]
      if (box_maxy==0 || box_maxy < a[4+j+1]) box_maxy=a[4+j+1]
    }
    print "(" box_minx "," box_miny ") and (" box_maxx "," box_maxy ")"
  }
  if (box_type=="L")
  {
  }
 }

 print "T {@symname}" ,(box_minx+box_maxx)/2, (box_miny+box_maxy)/2,0,0,
       titlesize, titlesize, "{}" >sym
 print "T {@name}",box_maxx-lwidth+5, box_miny-space,0,0,labsize, labsize,"{}" >sym


 #hsort_key(index_pin, y_pin, n_pin)   # 20140519

 num_i = num_o = 0 #20140519

 for(ii=0;ii<n_pin;ii++)
 {
  i = index_pin[ii] # 20140519
  
  dir=dir_pin[i]
  value=value_pin[i]
  
  sig_type=type_pin[i]
  verilog_type=verilog_pin[i]
  vert = verilog_type ? (" verilog_type=" verilog_type) : ""
  vhdt = sig_type ? (" sig_type=" sig_type) : ""

  if(dir=="generic")
  {
   printf "B 3 " (x_pin[i]-size) " " (y_pin[i]-size) " " (x_pin[i]+size) " " (y_pin[i]+size) \
         " {name=" label_pin[i] " generic_type=" sig_type " " >sym
   if(value !="") printf "value=" value " " >sym
   printf props_pin[i] > sym
   printf "}\n" >sym
   #print "L 4 " x,y+num_i*space,x+lwidth, y+num_i*space,"{}" >sym
   print "T {" label_pin[i] "}",x_pin[i]+lwidth+textdist,y_pin[i]+num_i*space-lab_voffset,0,0,labsize, labsize, "{}" >sym
   num_i++ # 20140519
  }
  if(dir=="ipin")
  {
   printf "B 5 " (x_pin[i]-size) " " (y_pin[i]-size) " " (x_pin[i]+size) " " (y_pin[i]+size) \
         " {name=" label_pin[i] vhdt vert " dir=in " >sym
   if(value !="") printf "value=" value " " >sym
   printf props_pin[i] > sym
   printf "}\n" >sym
   #print "L 4 " x,y+num_i*space,x+lwidth, y+num_i*space,"{}" >sym
   print "T {" label_pin[i] "}",x_pin[i]+lwidth+textdist,y_pin[i]+num_i*space-lab_voffset,0,0,labsize, labsize, "{}" >sym
   num_i++ # 20140519
  }
  if(dir=="opin")
  {
   printf "B 5 " (x_pin[i]-size) " " (y_pin[i]-size) " " (x_pin[i]+size) " " (y_pin[i]+size) \
         " {name=" label_pin[i] vhdt vert " dir=out " >sym
   if(value !="") printf "value=" value " " >sym
   printf props_pin[i] > sym
   printf "}\n" >sym
   #print "L 4 " (-x-lwidth),(y+num_o*space),-x, (y+num_o*space),"{}" >sym
   print "T {" label_pin[i] "}"x_pin[i]+lwidth+textdist,y_pin[i]+num_i*space-lab_voffset,0,1,labsize, labsize, "{}" >sym
   num_o++ # 20140519
  }
  if(dir=="iopin")
  {
   printf "B 5 " (x_pin[i]-size) " " (y_pin[i]-size) " " (x_pin[i]+size) " " (y_pin[i]+size) \
         " {name=" label_pin[i] vhdt vert " dir=inout " >sym
   if(value !="") printf "value=" value " " >sym
   printf props_pin[i] > sym
   printf "}\n" >sym
   #print "L 7 " (-x_pin[i]-lwidth),(y_pin[i]+num_o*space),-x_pin[i], (y_pin[i]+num_o*space),"{}" >sym
   print "T {" label_pin[i] "}",x_pin[i]+lwidth+textdist,y_pin[i]+num_i*space-lab_voffset,0,1,labsize, labsize, "{}" >sym
   num_o++ # 20140519
  }
 }
 close(sym)
}
 
