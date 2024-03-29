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
L 4 140 -380 610 -380 {}
L 4 140 -50 610 -50 {}
L 4 610 -380 610 -50 {}
L 4 140 -380 140 -50 {}
T {@symname} 520 -400 0 0 0.3 0.3 {}
T {@name} 140 -400 0 0 0.3 0.3 {}
N 140 -330 200 -330 {
lab=clk}
N 240 -260 400 -260 {
lab=z}
N 240 -300 240 -230 {
lab=z}
N 240 -170 240 -130 {
lab=#net1}
N 140 -200 200 -200 {
lab=d}
N 240 -70 240 -50 {
lab=vss}
N 480 -260 610 -260 {
lab=q}
N 530 -330 530 -260 {
lab=q}
N 370 -300 370 -260 {
lab=z}
N 410 -330 530 -330 {
lab=q}
N 240 -380 240 -360 {
lab=vcc}
N 370 -380 370 -360 {
lab=vcc}
N 170 -330 170 -100 {
lab=clk}
N 170 -100 200 -100 {
lab=clk}
N 240 -330 260 -330 {
lab=vcc}
N 240 -100 300 -100 {
lab=vss}
N 240 -200 300 -200 {
lab=vss}
N 350 -330 370 -330 {
lab=vcc}
C {yxt/yxt_title.sym} 160 0 0 0 {name=l1 author="Joanne Low"}
C {sky130_stdcells/inv_1.sym} 440 -260 0 0 {name=x1 VGND=vss VNB=vss VPB=vcc VPWR=vcc prefix=sky130_fd_sc_hd__ }
C {devices/ipin.sym} 140 -330 0 0 {name=p1 lab=clk}
C {devices/opin.sym} 610 -260 0 0 {name=p3 lab=q}
C {sky130_fd_pr/nfet_01v8.sym} 220 -200 0 0 {name=M1
L=0.15
W=1
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
C {sky130_fd_pr/pfet_01v8.sym} 390 -330 0 1 {name=M2
L=0.15
W=1
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
C {sky130_fd_pr/pfet_01v8.sym} 220 -330 0 0 {name=M3
L=0.15
W=1
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
C {sky130_fd_pr/nfet_01v8.sym} 220 -100 0 0 {name=M4
L=0.15
W=1
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
C {devices/ipin.sym} 140 -200 0 0 {name=p4 lab=d}
C {devices/lab_pin.sym} 240 -50 0 0 {name=l2 sig_type=std_logic lab=vss}
C {devices/lab_pin.sym} 240 -380 0 0 {name=l3 sig_type=std_logic lab=vcc}
C {devices/lab_pin.sym} 370 -380 0 0 {name=l4 sig_type=std_logic lab=vcc}
C {devices/lab_pin.sym} 300 -100 0 1 {name=l5 sig_type=std_logic lab=vss}
C {devices/lab_pin.sym} 300 -200 0 1 {name=l6 sig_type=std_logic lab=vss}
C {devices/lab_pin.sym} 260 -330 0 1 {name=l7 sig_type=std_logic lab=vcc}
C {devices/lab_pin.sym} 350 -330 0 0 {name=l8 sig_type=std_logic lab=vcc}
C {devices/lab_wire_yxt.sym} 310 -260 0 0 {name=l9 sig_type=std_logic lab=z}
