v {xschem version=3.1.0 file_version=1.2 }
G {}
K {type=subcircuit
format="@name @pinlist @@vcc @@vss @symname"
template="name=x1"
extra="vcc vss"}
V {}
S {}
E {}
L 4 140 -240 470 -240 {}
L 4 140 -240 140 -90 {}
L 4 470 -240 470 -90 {}
L 4 140 -90 470 -90 {}
T {@symname} 370 -270 0 0 0.4 0.4 {}
T {@name} 140 -270 0 0 0.4 0.4 {}
N 220 -200 260 -200 {
lab=A}
N 340 -200 380 -200 {
lab=B}
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
C {sky130_stdcells/inv_1.sym} 300 -200 0 0 {name=x1 VGND=vss VNB=vss VPB=vcc VPWR=vcc prefix=sky130_fd_sc_hd__ }
C {devices/ipin.sym} 140 -200 0 0 {name=p1 lab=d}
C {devices/ipin.sym} 140 -140 0 0 {name=p2 lab=clkA}
C {devices/opin.sym} 470 -200 0 0 {name=p3 lab=q}
C {devices/ipin.sym} 140 -110 0 0 {name=p4 lab=clkB}
C {devices/lab_wire.sym} 250 -200 0 0 {name=l2 sig_type=std_logic lab=A}
C {devices/lab_wire.sym} 360 -200 0 0 {name=l3 sig_type=std_logic lab=B}
C {yxt/dyn.sym} 190 -130 0 0 {name=x4 vcc=vcc vss=vss}
C {yxt/dyn.sym} 410 -130 0 0 {name=x2 vcc=vcc vss=vss}
