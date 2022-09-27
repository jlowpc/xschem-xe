v {xschem version=3.1.0 file_version=1.2 }
G {}
K {type=subcircuit
format="@name @pinlist @@vcc @@vss @symname"
template="name=x1 vcc=vcc vss=vss"
extra="vcc vss"}
V {}
S {}
E {}
L 4 130 -200 130 -50 {}
L 4 130 -50 560 -50 {}
L 4 560 -200 560 -50 {}
L 4 130 -200 560 -200 {}
T {@name} 130 -230 0 0 0.4 0.4 {}
T {@symname} 460 -230 0 0 0.4 0.4 {}
N 530 -140 560 -140 {
lab=out}
N 130 -120 150 -120 {
lab=clk}
N 390 -140 470 -140 {
lab=d_clk}
N 230 -120 270 -120 {
lab=clkb}
N 130 -160 270 -160 {
lab=in}
N 140 -120 140 -70 {
lab=clk}
N 140 -70 500 -70 {
lab=clk}
N 500 -100 500 -70 {
lab=clk}
C {yxt/yxt_title.sym} 160 0 0 0 {name=l1 author="Joanne Low"}
C {devices/ipin.sym} 130 -160 0 0 {name=p1 lab=in}
C {devices/ipin.sym} 130 -120 0 0 {name=p2 lab=clk}
C {devices/opin.sym} 560 -140 0 0 {name=p3 lab=out}
C {sky130_stdcells/inv_1.sym} 190 -120 0 0 {name=x2 VGND=vss VNB=vss VPB=vcc VPWR=vcc prefix=sky130_fd_sc_hd__ }
C {yxt/latch.sym} 500 -70 0 0 {name=x1 vcc=vcc vss=vss}
C {sky130_stdcells/nand2_1.sym} 330 -140 0 0 {name=x3 VGND=vss VNB=vss VPB=vcc VPWR=vcc prefix=sky130_fd_sc_hd__ }
C {devices/lab_wire.sym} 460 -140 0 0 {name=l2 sig_type=std_logic lab=d_clk}
C {devices/lab_wire.sym} 260 -120 0 0 {name=l4 sig_type=std_logic lab=clkb}
