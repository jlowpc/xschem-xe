v {xschem version=3.1.0 file_version=1.2
}
G {}
K {type=subcircuit
format="@name @pinlist @vcc @vss @symname"
template="name=x1 vcc=vcc vss=vss"
extra="vcc vss"}
V {}
S {}
E {}
L 4 -180 -100 -180 220 {}
L 4 220 -100 220 220 {}
L 4 -180 220 220 220 {}
L 4 -180 -100 220 -100 {}
T {@name} -180 -130 0 0 0.4 0.4 {}
T {@symname} 80 -130 0 0 0.4 0.4 {}
N -70 -10 -10 -10 {
lab=d1b}
N -60 150 0 150 {
lab=d2b}
N 40 -10 80 -10 {
lab=q}
N 80 -10 80 150 {
lab=q}
N 50 150 80 150 {
lab=q}
N 80 70 110 70 {
lab=q}
N 190 70 220 70 {
lab=out}
N -180 -10 -150 -10 {
lab=d1}
N -180 150 -140 150 {
lab=d2}
N -180 -80 20 -80 {
lab=clkb}
N 20 -80 20 -60 {
lab=clkb}
N 20 40 20 100 {
lab=clk}
N -180 70 20 70 {
lab=clk}
N -20 200 20 200 {
lab=clkb}
C {yxt/tgate.sym} -40 50 0 0 {name=xtg1 vcc=vcc vss=vss}
C {yxt/tgate.sym} -40 210 0 0 {name=xtg2 vcc=vcc vss=vss}
C {sky130_stdcells/inv_1.sym} -110 -10 0 0 {name=x3 VGND=vss VNB=vss VPB=vcc VPWR=vcc prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/inv_1.sym} -100 150 0 0 {name=x4 VGND=vss VNB=vss VPB=vcc VPWR=vcc prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/inv_1.sym} 150 70 0 0 {name=x5 VGND=vss VNB=vss VPB=vcc VPWR=vcc prefix=sky130_fd_sc_hd__ }
C {devices/ipin.sym} -180 -10 0 0 {name=p1 lab=d1}
C {devices/ipin.sym} -180 150 0 0 {name=p2 lab=d2}
C {devices/opin.sym} 220 70 0 0 {name=p3 lab=out}
C {devices/ipin.sym} -180 -80 0 0 {name=p4 lab=clkb}
C {devices/ipin.sym} -180 70 0 0 {name=p5 lab=clk}
C {devices/lab_pin_yxt.sym} -20 200 0 0 {name=l6 sig_type=std_logic lab=clkb}
C {devices/lab_wire_yxt.sym} 100 70 0 0 {name=l1 sig_type=std_logic lab=q}
C {devices/lab_wire_yxt.sym} -30 150 0 0 {name=l2 sig_type=std_logic lab=d2b}
C {devices/lab_wire_yxt.sym} -30 -10 0 0 {name=l3 sig_type=std_logic lab=d1b}
