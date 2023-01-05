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
L 4 -50 -70 -50 180 {}
L 4 390 -70 390 180 {}
L 4 -50 -70 390 -70 {}
L 4 -50 180 390 180 {}
T {@name} -50 -110 0 0 0.4 0.4 {}
T {@symname} 290 -110 0 0 0.4 0.4 {}
N 20 -40 60 -40 {
lab=db}
N 20 -40 20 10 {
lab=db}
N -50 -0 60 -0 {
lab=clk}
N -50 150 60 150 {
lab=d}
N 20 90 20 150 {
lab=d}
N 50 -0 50 110 {
lab=clk}
N 50 110 60 110 {
lab=clk}
N 180 130 230 130 {
lab=s1}
N 180 -20 230 -20 {
lab=r1}
N 350 -0 390 -0 {
lab=q}
N 200 90 230 90 {
lab=q}
N 200 60 200 90 {
lab=q}
N 200 60 370 20 {
lab=q}
N 370 0 370 20 {
lab=q}
N 200 20 230 20 {
lab=qb}
N 200 20 200 40 {
lab=qb}
N 200 40 370 80 {
lab=qb}
N 370 80 370 110 {
lab=qb}
N 350 110 370 110 {
lab=qb}
C {sky130_stdcells/nand2_1.sym} 120 -20 0 0 {name=x1 VGND=vss VNB=vss VPB=vcc VPWR=vcc prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/inv_1.sym} 20 50 3 0 {name=x5 VGND=vss VNB=vss VPB=vcc VPWR=vcc prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/nand2_1.sym} 120 130 0 0 {name=x2 VGND=vss VNB=vss VPB=vcc VPWR=vcc prefix=sky130_fd_sc_hd__ }
C {devices/ipin.sym} -50 0 0 0 {name=p1 lab=clk}
C {devices/ipin.sym} -50 150 0 0 {name=p2 lab=d}
C {devices/lab_wire_yxt.sym} 40 -40 0 0 {name=l1 sig_type=std_logic lab=db}
C {sky130_stdcells/nand2_1.sym} 290 0 0 0 {name=x3 VGND=vss VNB=vss VPB=vcc VPWR=vcc prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/nand2_1.sym} 290 110 0 0 {name=x4 VGND=vss VNB=vss VPB=vcc VPWR=vcc prefix=sky130_fd_sc_hd__ }
C {devices/opin.sym} 390 0 0 0 {name=p3 lab=q}
C {devices/lab_wire_yxt.sym} 370 110 0 0 {name=l2 sig_type=std_logic lab=qb}
C {devices/lab_wire_yxt.sym} 220 -20 0 0 {name=l3 sig_type=std_logic lab=r1}
C {devices/lab_wire_yxt.sym} 220 130 0 0 {name=l4 sig_type=std_logic lab=s1}
