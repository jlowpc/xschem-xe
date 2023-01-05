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
L 4 -260 -60 -260 340 {}
L 4 -260 -60 270 -60 {}
L 4 270 -60 270 340 {}
L 4 -260 340 270 340 {}
T {@name} -260 -90 0 0 0.4 0.4 {}
T {@symname} 150 -90 0 0 0.4 0.4 {}
N -30 -30 10 -30 {
lab=q}
N -30 -30 -30 30 {
lab=q}
N -30 30 10 30 {
lab=q}
N 90 -30 130 -30 {
lab=qb}
N 130 -30 130 30 {
lab=qb}
N 90 30 130 30 {
lab=qb}
N -260 100 140 100 {
lab=clk}
N -80 30 -30 30 {
lab=q}
N -80 30 -80 70 {
lab=q}
N 130 30 180 30 {
lab=qb}
N 180 30 180 70 {
lab=qb}
N -100 130 -40 130 {
lab=mq}
N -40 130 -40 140 {
lab=mq}
N -100 130 -100 210 {
lab=mq}
N 150 130 210 130 {
lab=xmq}
N 210 130 210 140 {
lab=xmq}
N 150 130 150 210 {
lab=xmq}
N -260 170 170 170 {
lab=d}
N -250 240 -240 240 {
lab=d}
N -250 170 -250 240 {
lab=d}
N -100 270 -100 300 {
lab=vss}
N 150 270 150 290 {
lab=vcc}
N -40 200 -40 290 {
lab=vcc}
N 210 200 210 290 {
lab=vss}
N -160 240 110 240 {
lab=d_x}
N 130 -30 270 -30 {
lab=qb}
C {sky130_stdcells/inv_1.sym} 50 -30 0 0 {name=x1 VGND=vss VNB=vss VPB=vcc VPWR=vcc prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/inv_1.sym} 50 30 0 1 {name=x2 VGND=vss VNB=vss VPB=vcc VPWR=vcc prefix=sky130_fd_sc_hd__ }
C {sky130_fd_pr/nfet3_01v8.sym} 160 100 0 0 {name=M1
L=0.15
W=1
body=vss
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
C {sky130_fd_pr/nfet3_01v8.sym} -100 100 0 0 {name=M2
L=0.15
W=1
body=vss
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
C {sky130_fd_pr/nfet3_01v8.sym} -120 240 0 0 {name=M3
L=0.15
W=1
body=vss
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
C {sky130_fd_pr/nfet3_01v8.sym} -60 170 0 0 {name=M4
L=0.15
W=1
body=vss
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
C {sky130_fd_pr/nfet3_01v8.sym} 130 240 0 0 {name=M5
L=0.15
W=1
body=vss
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
C {sky130_fd_pr/nfet3_01v8.sym} 190 170 0 0 {name=M6
L=0.15
W=1
body=vss
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
C {sky130_stdcells/inv_1.sym} -200 240 0 0 {name=x3 VGND=vss VNB=vss VPB=vcc VPWR=vcc prefix=sky130_fd_sc_hd__ }
C {devices/ipin.sym} -260 170 0 0 {name=p1 lab=d}
C {devices/ipin.sym} -260 100 0 0 {name=p2 lab=clk}
C {devices/vdd.sym} -40 290 2 1 {name=l1 lab=vcc}
C {devices/gnd.sym} -100 300 0 0 {name=l3 lab=vss}
C {devices/vdd.sym} 150 290 2 1 {name=l2 lab=vcc}
C {devices/gnd.sym} 210 290 0 0 {name=l4 lab=vss}
C {devices/opin.sym} 270 -30 0 0 {name=p3 lab=qb}
C {devices/lab_wire_yxt.sym} -30 0 0 0 {name=l5 sig_type=std_logic lab=q}
C {devices/lab_wire_yxt.sym} -100 150 0 0 {name=l6 sig_type=std_logic lab=mq}
C {devices/lab_wire_yxt.sym} 150 150 0 0 {name=l7 sig_type=std_logic lab=xmq}
C {devices/lab_wire_yxt.sym} 30 240 0 0 {name=l8 sig_type=std_logic lab=d_x}
