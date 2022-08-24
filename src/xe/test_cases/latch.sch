v {xschem version=3.1.0 file_version=1.2 }
G {}
K {type=subcircuit
format="@name @pinlist @vcc @vss @symname"
template="name=x1 vcc=vcc vss=vss"
extra="vcc vss"}
V {}
S {}
E {}
N 200 -210 250 -210 {
lab=db}
N 310 -210 360 -210 {
lab=z}
N 340 -130 360 -130 {
lab=z}
N 340 -210 340 -130 {
lab=z}
N 440 -210 480 -210 {
lab=q}
N 80 -210 120 -210 {
lab=d}
N 280 -290 280 -260 {
lab=clkb}
N 280 -160 280 -130 {
lab=clk}
N 200 -290 280 -290 {
lab=clkb}
N 80 -290 120 -290 {
lab=clk}
N 100 -130 280 -130 {
lab=clk}
N 100 -290 100 -130 {
lab=clk}
N 440 -130 460 -130 {
lab=fb}
N 460 -130 460 -70 {
lab=fb}
N 440 -70 460 -70 {
lab=fb}
N 340 -70 360 -70 {
lab=z}
N 340 -130 340 -70 {
lab=z}
C {yxt/yxt_title.sym} 160 0 0 0 {name=l1 author="Joanne Low"}
C {sky130_stdcells/inv_1.sym} 160 -210 0 0 {name=x1 VGND=vss VNB=vss VPB=vcc VPWR=vcc prefix=sky130_fd_sc_hd__ }
C {yxt/tgate.sym} 220 -150 0 0 {name=x2 vcc=vcc vss=vss}
C {sky130_stdcells/inv_1.sym} 400 -210 0 0 {name=x3 VGND=vss VNB=vss VPB=vcc VPWR=vcc prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/inv_1.sym} 160 -290 0 0 {name=x6 VGND=vss VNB=vss VPB=vcc VPWR=vcc prefix=sky130_fd_sc_hd__ }
C {devices/ipin.sym} 80 -290 0 0 {name=p1 lab=clk}
C {devices/ipin.sym} 80 -210 0 0 {name=p2 lab=d}
C {devices/opin.sym} 480 -210 0 0 {name=p3 lab=q}
C {devices/lab_wire.sym} 240 -210 0 0 {name=l2 sig_type=std_logic lab=db}
C {devices/lab_wire.sym} 270 -290 0 0 {name=l3 sig_type=std_logic lab=clkb}
C {devices/lab_wire.sym} 330 -210 0 0 {name=l4 sig_type=std_logic lab=z}
C {sky130_stdcells/inv_1.sym} 400 -130 0 0 {name=x4 VGND=vss VNB=vss VPB=vcc VPWR=vcc prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/inv_1.sym} 400 -70 0 1 {name=x5 VGND=vss VNB=vss VPB=vcc VPWR=vcc prefix=sky130_fd_sc_hd__ }
C {devices/lab_wire.sym} 460 -130 0 0 {name=l5 sig_type=std_logic lab=fb}
