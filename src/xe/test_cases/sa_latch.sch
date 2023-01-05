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
L 4 -290 -60 -290 770 {}
L 4 -290 -60 420 -60 {}
L 4 420 -60 420 770 {}
L 4 -290 770 420 770 {}
T {@name} -290 -90 0 0 0.4 0.4 {}
T {@symname} 270 -90 0 0 0.4 0.4 {}
N -30 -30 10 -30 {
lab=qb}
N -30 -30 -30 30 {
lab=qb}
N -30 30 10 30 {
lab=qb}
N 90 -30 130 -30 {
lab=q}
N 130 -30 130 30 {
lab=q}
N 90 30 130 30 {
lab=q}
N -80 30 -30 30 {
lab=qb}
N -80 30 -80 70 {
lab=qb}
N 130 30 180 30 {
lab=q}
N 180 30 180 70 {
lab=q}
N -100 70 -40 70 {
lab=qb}
N -40 70 -40 80 {
lab=qb}
N -100 190 -100 220 {
lab=vss}
N 130 -30 420 -30 {
lab=q}
N -100 70 -100 130 {
lab=qb}
N -40 140 -40 210 {
lab=vcc}
N 150 70 210 70 {
lab=q}
N 210 70 210 80 {
lab=q}
N 150 70 150 130 {
lab=q}
N 210 140 210 210 {
lab=vss}
N 150 190 150 210 {
lab=vcc}
N -10 360 -10 390 {
lab=xzz}
N 140 360 140 390 {
lab=zz}
N 30 330 50 330 {
lab=zz}
N 50 330 50 420 {
lab=zz}
N 30 420 50 420 {
lab=zz}
N 80 330 100 330 {
lab=xzz}
N 80 330 80 420 {
lab=xzz}
N 80 420 100 420 {
lab=xzz}
N -10 380 80 380 {
lab=xzz}
N 50 370 140 370 {
lab=zz}
N -150 380 -10 380 {
lab=xzz}
N -150 360 -150 380 {
lab=xzz}
N 140 370 290 370 {
lab=zz}
N 290 360 290 370 {
lab=zz}
N -10 490 30 490 {
lab=XSO}
N -10 450 -10 490 {
lab=XSO}
N 90 490 140 490 {
lab=SO}
N 140 450 140 490 {
lab=SO}
N -10 490 -10 550 {
lab=XSO}
N -10 610 -10 630 {
lab=com}
N -10 630 180 630 {
lab=com}
N 70 630 70 650 {
lab=com}
N 130 580 140 580 {
lab=#net1}
N -290 580 50 580 {
lab=d}
N 140 490 180 490 {
lab=SO}
N 180 490 180 550 {
lab=SO}
N 180 610 180 630 {
lab=com}
N 70 710 70 740 {
lab=vss}
N -10 280 -10 300 {
lab=vcc}
N -150 280 -150 300 {
lab=vcc}
N 140 280 140 300 {
lab=vcc}
N 290 280 290 300 {
lab=vcc}
N -240 380 -150 380 {
lab=xzz}
N -240 270 -240 380 {
lab=xzz}
N 370 260 370 370 {
lab=zz}
N 290 370 370 370 {
lab=zz}
N -240 160 110 160 {
lab=mq}
N -240 160 -240 190 {
lab=mq}
N -0 110 370 110 {
lab=xmq}
N 370 110 370 180 {
lab=xmq}
N -290 680 350 680 {
lab=clk}
N -210 330 -190 330 {
lab=clk}
N -210 330 -210 680 {
lab=clk}
N 330 330 350 330 {
lab=clk}
N 350 330 350 680 {
lab=clk}
C {sky130_stdcells/inv_1.sym} 50 -30 0 0 {name=x1 VGND=vss VNB=vss VPB=vcc VPWR=vcc prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/inv_1.sym} 50 30 0 1 {name=x2 VGND=vss VNB=vss VPB=vcc VPWR=vcc prefix=sky130_fd_sc_hd__ }
C {sky130_fd_pr/nfet3_01v8.sym} -120 160 0 0 {name=M3
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
C {sky130_fd_pr/nfet3_01v8.sym} -20 110 0 1 {name=M4
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
C {devices/ipin.sym} -290 680 0 0 {name=p2 lab=clk}
C {devices/vdd.sym} -40 210 2 1 {name=l1 lab=vcc}
C {devices/gnd.sym} -100 220 0 0 {name=l3 lab=vss}
C {devices/opin.sym} 420 -30 0 0 {name=p3 lab=q}
C {devices/lab_wire_yxt.sym} -30 0 0 0 {name=l5 sig_type=std_logic lab=qb}
C {sky130_fd_pr/nfet3_01v8.sym} 130 160 0 0 {name=M1
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
C {sky130_fd_pr/nfet3_01v8.sym} 230 110 0 1 {name=M2
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
C {devices/vdd.sym} 150 210 2 1 {name=l2 lab=vcc}
C {devices/gnd.sym} 210 210 0 0 {name=l4 lab=vss}
C {sky130_stdcells/inv_1.sym} -240 230 1 1 {name=x3 VGND=vss VNB=vss VPB=vcc VPWR=vcc prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/inv_1.sym} 370 220 1 1 {name=x4 VGND=vss VNB=vss VPB=vcc VPWR=vcc prefix=sky130_fd_sc_hd__ }
C {sky130_fd_pr/pfet3_01v8.sym} 10 330 0 1 {name=M5
L=0.15
W=1
body=vcc
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
C {sky130_fd_pr/pfet3_01v8.sym} -170 330 0 0 {name=M6
L=0.15
W=1
body=vcc
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
C {sky130_fd_pr/pfet3_01v8.sym} 120 330 0 0 {name=M7
L=0.15
W=1
body=vcc
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
C {sky130_fd_pr/pfet3_01v8.sym} 310 330 0 1 {name=M8
L=0.15
W=1
body=vcc
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
C {sky130_fd_pr/nfet3_01v8.sym} 10 420 0 1 {name=M9
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
C {sky130_fd_pr/nfet3_01v8.sym} 120 420 0 0 {name=M10
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
C {sky130_fd_pr/nfet3_01v8.sym} -30 580 0 0 {name=M11
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
C {sky130_fd_pr/nfet3_01v8.sym} 160 580 0 0 {name=M12
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
C {sky130_fd_pr/nfet3_01v8.sym} 60 470 1 0 {name=M13
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
C {devices/vdd.sym} 60 450 0 1 {name=l9 lab=vcc}
C {devices/gnd.sym} 70 740 0 0 {name=l10 lab=vss}
C {sky130_stdcells/inv_1.sym} 90 580 2 1 {name=x5 VGND=vss VNB=vss VPB=vcc VPWR=vcc prefix=sky130_fd_sc_hd__ }
C {sky130_fd_pr/nfet3_01v8.sym} 50 680 0 0 {name=M14
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
C {devices/vdd.sym} -150 280 0 1 {name=l11 lab=vcc}
C {devices/vdd.sym} -10 280 0 1 {name=l12 lab=vcc}
C {devices/vdd.sym} 140 280 0 1 {name=l13 lab=vcc}
C {devices/vdd.sym} 290 280 0 1 {name=l14 lab=vcc}
C {devices/ipin.sym} -290 580 0 0 {name=p4 lab=d}
C {devices/lab_wire_yxt.sym} -190 160 0 0 {name=l6 sig_type=std_logic lab=mq}
C {devices/lab_wire_yxt.sym} 340 110 0 0 {name=l15 sig_type=std_logic lab=xmq}
C {devices/lab_wire_yxt.sym} -70 380 0 0 {name=l7 sig_type=std_logic lab=xzz}
C {devices/lab_wire_yxt.sym} 340 370 0 0 {name=l16 sig_type=std_logic lab=zz}
C {devices/lab_wire_yxt.sym} -10 490 0 0 {name=l17 sig_type=std_logic lab=XSO}
C {devices/lab_wire_yxt.sym} 180 490 0 0 {name=l18 sig_type=std_logic lab=SO}
C {devices/lab_wire_yxt.sym} 140 630 0 0 {name=l19 sig_type=std_logic lab=com}
