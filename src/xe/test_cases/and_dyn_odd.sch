v {xschem version=3.1.0 file_version=1.2 }
G {}
K {type=subcircuit
format="@name @pinlist @symname vcc=@vcc vss=@vss"
template="name=x1 vcc=vcc vss=vss"}
V {}
S {}
E {}
L 4 150 -200 150 -60 {}
L 4 150 -200 650 -200 {}
L 4 650 -200 650 -60 {}
L 4 150 -60 650 -60 {}
T {@name} 150 -230 0 0 0.4 0.4 {}
T {@symname} 550 -230 0 0 0.4 0.4 {}
N 520 -140 560 -140 {
lab=B}
N 620 -140 650 -140 {
lab=q}
N 150 -160 170 -160 {
lab=d}
N 290 -140 330 -140 {
lab=A}
N 150 -120 170 -120 {
lab=clkA}
N 590 -100 590 -90 {
lab=clkB}
N 410 -140 440 -140 {
lab=n1}
N 150 -90 590 -90 {
lab=clkB}
C {yxt/yxt_title.sym} 160 0 0 0 {name=l1 author="Joanne Low"}
C {devices/ipin.sym} 150 -160 0 0 {name=p1 lab=d}
C {devices/ipin.sym} 150 -120 0 0 {name=p2 lab=clkA}
C {devices/opin.sym} 650 -140 0 0 {name=p3 lab=q}
C {devices/ipin.sym} 150 -90 0 0 {name=p4 lab=clkB}
C {devices/lab_wire.sym} 320 -140 0 0 {name=l2 sig_type=std_logic lab=A}
C {devices/lab_wire.sym} 540 -140 0 0 {name=l3 sig_type=std_logic lab=B}
C {yxt/dyn.sym} 590 -70 0 0 {name=x4 vcc=vss vss=vss}
C {sky130_stdcells/buf_1.sym} 370 -140 0 0 {name=x1 VGND=vss VNB=vss VPB=vcc VPWR=vcc prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/and2_0.sym} 230 -140 0 0 {name=x3 VGND=VGND VNB=VNB VPB=VPB VPWR=VPWR prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/inv_1.sym} 480 -140 0 0 {name=x2 VGND=VGND VNB=VNB VPB=VPB VPWR=VPWR prefix=sky130_fd_sc_hd__ }
C {devices/lab_wire.sym} 430 -140 0 0 {name=l4 sig_type=std_logic lab=n1}
