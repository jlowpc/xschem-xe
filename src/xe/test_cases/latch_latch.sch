v {xschem version=3.1.0 file_version=1.2 }
G {}
K {type=subcircuit
format="@name @pinlist @symname vcc=@vcc vss=@vss"
template="name=x1 vcc=vcc vss=vss"}
V {}
S {}
E {}
L 4 140 -240 140 -80 {}
L 4 140 -80 470 -80 {}
L 4 470 -240 470 -80 {}
L 4 140 -240 470 -240 {}
T {@symname} 360 -270 0 0 0.4 0.4 {}
T {@name} 140 -270 0 0 0.4 0.4 {}
N 220 -200 260 -200 {
lab=xxx}
N 340 -200 380 -200 {
lab=#net1}
N 440 -200 470 -200 {
lab=q}
N 140 -140 190 -140 {
lab=clkA}
N 190 -160 190 -140 {
lab=clkA}
N 140 -110 410 -110 {
lab=clkB}
N 410 -160 410 -110 {
lab=clkB}
N 140 -200 160 -200 {
lab=d}
C {yxt/yxt_title.sym} 160 0 0 0 {name=l1 author="Joanne Low"}
C {sky130_stdcells/inv_1.sym} 300 -200 0 0 {name=x1 VGND=vcc VNB=vcc VPB=vss VPWR=vss prefix=sky130_fd_sc_hd__ }
C {yxt/latch.sym} 190 -130 0 0 {name=x2 vcc=vcc vss=vss}
C {yxt/latch.sym} 410 -130 0 0 {name=x3 vcc=vcc vss=vss}
C {devices/ipin.sym} 140 -200 0 0 {name=p1 lab=d}
C {devices/ipin.sym} 140 -140 0 0 {name=p2 lab=clkA}
C {devices/opin.sym} 470 -200 0 0 {name=p3 lab=q}
C {devices/ipin.sym} 140 -110 0 0 {name=p4 lab=clkB}
C {devices/lab_wire.sym} 250 -200 0 0 {name=l2 sig_type=std_logic lab=A}
C {devices/lab_wire.sym} 360 -200 0 0 {name=l3 sig_type=std_logic lab=B}
