v {xschem version=3.1.0 file_version=1.2 }
G {}
K {type=subcircuit
format="@name @pinlist @@vcc @@vss @symname"
template="name=x1 vcc=vcc vss=vss"
extra="vcc vss"}
V {}
S {}
E {}
L 4 140 -250 140 -70 {}
L 4 530 -250 530 -70 {}
L 4 140 -250 530 -250 {}
L 4 140 -70 530 -70 {}
T {@name} 140 -280 0 0 0.4 0.4 {}
T {@symname} 430 -280 0 0 0.4 0.4 {}
N 220 -200 260 -200 {
lab=A}
N 340 -200 380 -200 {
lab=B}
N 500 -180 530 -180 {
lab=q}
N 140 -140 190 -140 {
lab=clkA}
N 190 -160 190 -140 {
lab=clkA}
N 140 -200 160 -200 {
lab=d}
N 140 -110 380 -110 {
lab=clkB}
N 380 -160 380 -110 {
lab=clkB}
C {yxt/yxt_title.sym} 160 0 0 0 {name=l1 author="Joanne Low"}
C {sky130_stdcells/inv_1.sym} 300 -200 0 0 {name=x1 VGND=vss VNB=vss VPB=vcc VPWR=vcc prefix=sky130_fd_sc_hd__ }
C {devices/ipin.sym} 140 -200 0 0 {name=p1 lab=d}
C {devices/ipin.sym} 140 -140 0 0 {name=p2 lab=clkA}
C {devices/opin.sym} 530 -180 0 0 {name=p3 lab=q}
C {devices/ipin.sym} 140 -110 0 0 {name=p4 lab=clkB}
C {devices/lab_wire_yxt.sym} 250 -200 0 0 {name=l2 sig_type=std_logic lab=A}
C {devices/lab_wire_yxt.sym} 360 -200 0 0 {name=l3 sig_type=std_logic lab=B}
C {sky130_stdcells/or2_0.sym} 440 -180 0 0 {name=x2 VGND=vss VNB=vss VPB=vcc VPWR=vcc prefix=sky130_fd_sc_hd__ }
C {yxt/latch.sym} 190 -130 0 0 {name=x3 vcc=vcc vss=vss}
