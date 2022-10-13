v {xschem version=3.1.0 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
T {ncap0_diff_area 1.0
ncap0_gate_area 1.3
ncap1_diff_area 1.5
ncap1_gate_area 1.8
pcap0_diff_area 3.0
pcap0_gate_area 3.3
cap1_diff_area 3.5
pcap1_gate_area 3.8
The parameters of all transistors are: 
w=1   l=0.15   ad=as=0.29   ps=pd=2.58} 770 -850 0 0 0.3 0.3 {}
N 410 -670 410 -640 {
lab=z}
N 410 -640 410 -620 {
lab=z}
N 360 -420 360 -390 {
lab=n2}
N 540 -420 540 -390 {
lab=n3}
N 360 -500 360 -480 {
lab=n1}
N 410 -560 410 -500 {
lab=n1}
N 540 -500 540 -480 {
lab=n1}
N 360 -330 360 -310 {
lab=n4}
N 540 -330 540 -310 {
lab=n4}
N 360 -310 500 -310 {
lab=n4}
N 430 -310 430 -280 {
lab=n4}
N 430 -220 430 -190 {
lab=nvg}
N 430 -130 430 -100 {
lab=vss}
N 170 -700 370 -700 {
lab=clk}
N 180 -700 180 -160 {
lab=clk}
N 340 -590 370 -590 {
lab=A}
N 300 -450 320 -450 {
lab=B}
N 300 -360 320 -360 {
lab=C}
N 480 -450 500 -450 {
lab=D}
N 480 -360 500 -360 {
lab=E}
N 370 -250 390 -250 {
lab=F}
N 410 -700 430 -700 {
lab=vcc}
N 410 -590 450 -590 {
lab=vss}
N 360 -450 400 -450 {
lab=vss}
N 360 -360 400 -360 {
lab=vss}
N 430 -250 470 -250 {
lab=vss}
N 430 -160 470 -160 {
lab=vss}
N 570 -770 570 -750 {
lab=#net1}
N 550 -720 570 -720 {
lab=vcc}
N 410 -760 410 -730 {
lab=vcc}
N 570 -850 570 -830 {
lab=vcc}
N 610 -800 640 -800 {
lab=vss}
N 610 -720 740 -720 {
lab=out}
N 740 -720 740 -640 {
lab=out}
N 570 -690 570 -640 {
lab=z}
N 360 -500 540 -500 {
lab=n1}
N 500 -310 670 -310 {
lab=n4}
N 670 -340 670 -310 {
lab=n4}
N 710 -370 730 -370 {
lab=clk}
N 710 -640 780 -640 {
lab=out}
N 410 -640 630 -640 {
lab=z}
N 180 -160 390 -160 {
lab=clk}
N 670 -420 670 -400 {
lab=vcc}
N 640 -370 670 -370 {
lab=vcc}
N 540 -450 570 -450 {
lab=vss}
N 540 -360 570 -360 {
lab=vss}
N 550 -800 570 -800 {
lab=vcc}
C {yxt/yxt_title.sym} 160 0 0 0 {name=l1 author="Joanne Low"}
C {sky130_fd_pr/pfet_01v8.sym} 390 -700 0 0 {name=Mpc
L=0.15
W=1
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} 390 -590 0 0 {name=M2
L=0.15
W=1
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_stdcells/inv_1.sym} 670 -640 0 0 {name=xinv VGND=vss VNB=vss VPB=vcc VPWR=vcc prefix=sky130_fd_sc_hd__ }
C {sky130_fd_pr/nfet_01v8.sym} 340 -450 0 0 {name=M7
L=0.15
W=1
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} 340 -360 0 0 {name=M8
L=0.15
W=1
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} 520 -450 0 0 {name=M9
L=0.15
W=1
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} 520 -360 0 0 {name=M10
L=0.15
W=1
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} 410 -160 0 0 {name=MVgnd
L=0.15
W=3
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} 410 -250 0 0 {name=M18
L=0.15
W=1
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} 590 -720 0 1 {name=Mfb
L=0.15
W=1
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {devices/ipin.sym} 170 -700 0 0 {name=p1 lab=clk}
C {devices/opin.sym} 780 -640 0 0 {name=p2 lab=out}
C {devices/lab_wire_yxt.sym} 620 -640 0 0 {name=l11 sig_type=std_logic lab=z}
C {devices/lab_wire_yxt.sym} 370 -500 0 0 {name=l14 sig_type=std_logic lab=n1}
C {devices/lab_wire_yxt.sym} 360 -400 0 0 {name=l15 sig_type=std_logic lab=n2}
C {devices/lab_wire_yxt.sym} 540 -400 0 0 {name=l16 sig_type=std_logic lab=n3}
C {devices/lab_wire_yxt.sym} 480 -310 0 0 {name=l19 sig_type=std_logic lab=n4}
C {devices/ipin.sym} 170 -760 0 0 {name=p3 lab=D}
C {devices/ipin.sym} 170 -780 0 0 {name=p4 lab=C}
C {devices/ipin.sym} 170 -800 0 0 {name=p5 lab=B}
C {devices/ipin.sym} 170 -820 0 0 {name=p6 lab=A}
C {devices/lab_pin_yxt.sym} 340 -590 0 0 {name=l22 sig_type=std_logic lab=A}
C {devices/lab_pin_yxt.sym} 300 -450 0 0 {name=l24 sig_type=std_logic lab=B}
C {devices/lab_pin_yxt.sym} 300 -360 0 0 {name=l25 sig_type=std_logic lab=C}
C {devices/lab_pin_yxt.sym} 480 -450 0 0 {name=l26 sig_type=std_logic lab=D}
C {devices/lab_pin_yxt.sym} 480 -360 0 0 {name=l27 sig_type=std_logic lab=E}
C {devices/lab_pin_yxt.sym} 370 -250 0 0 {name=l33 sig_type=std_logic lab=F}
C {devices/ipin.sym} 170 -720 0 0 {name=p14 lab=F}
C {devices/ipin.sym} 170 -740 0 0 {name=p15 lab=E}
C {devices/code.sym} 550 -230 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install

.subckt sky130_fd_sc_hd__inv_1 A VGND VNB VPB VPWR Y
X0 VGND A Y VNB sky130_fd_pr__nfet_01v8 w=650000u l=150000u
X1 VPWR A Y VPB sky130_fd_pr__pfet_01v8_hvt w=1e+06u l=150000u
.ends

"
spice_ignore=false}
C {devices/ipin.sym} 170 -840 0 0 {name=p16 lab=vss}
C {devices/ipin.sym} 170 -860 0 0 {name=p17 lab=vcc}
C {devices/lab_pin_yxt.sym} 430 -700 0 1 {name=l36 sig_type=std_logic lab=vcc}
C {devices/lab_pin_yxt.sym} 550 -720 0 0 {name=l37 sig_type=std_logic lab=vcc}
C {devices/lab_pin_yxt.sym} 450 -590 0 1 {name=l38 sig_type=std_logic lab=vss}
C {devices/lab_pin_yxt.sym} 400 -450 0 1 {name=l44 sig_type=std_logic lab=vss}
C {devices/lab_pin_yxt.sym} 400 -360 0 1 {name=l45 sig_type=std_logic lab=vss}
C {devices/lab_pin_yxt.sym} 570 -450 0 1 {name=l46 sig_type=std_logic lab=vss}
C {devices/lab_pin_yxt.sym} 570 -360 0 1 {name=l47 sig_type=std_logic lab=vss}
C {devices/lab_pin_yxt.sym} 470 -250 0 1 {name=l53 sig_type=std_logic lab=vss}
C {devices/lab_pin_yxt.sym} 470 -160 0 1 {name=l55 sig_type=std_logic lab=vss}
C {devices/lab_pin_yxt.sym} 430 -100 0 1 {name=l56 sig_type=std_logic lab=vss}
C {devices/lab_pin_yxt.sym} 410 -760 0 0 {name=l8 sig_type=std_logic lab=vcc}
C {sky130_fd_pr/pfet_01v8.sym} 590 -800 0 1 {name=Mfb1
L=0.15
W=1
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {devices/lab_pin_yxt.sym} 570 -850 0 0 {name=l2 sig_type=std_logic lab=vcc}
C {devices/lab_pin_yxt.sym} 640 -800 0 1 {name=l3 sig_type=std_logic lab=vss}
C {sky130_fd_pr/pfet_01v8.sym} 690 -370 0 1 {name=Mfb2
L=0.15
W=1
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {devices/lab_pin_yxt.sym} 730 -370 0 1 {name=l4 sig_type=std_logic lab=clk}
C {devices/lab_pin_yxt.sym} 670 -420 0 1 {name=l5 sig_type=std_logic lab=vcc}
C {devices/lab_pin_yxt.sym} 640 -370 0 0 {name=l6 sig_type=std_logic lab=vcc}
C {devices/lab_wire_yxt.sym} 430 -200 0 0 {name=l7 sig_type=std_logic lab=nvg}
C {devices/lab_pin_yxt.sym} 550 -800 0 0 {name=l9 sig_type=std_logic lab=vcc}
