v {xschem version=3.1.0 file_version=1.2 }
G {}
K {type=subcircuit
format="@name @pinlist @symname vcc=@vcc vss=@vss"
template="name=x1 vcc=vcc vss=vss"}
V {}
S {}
E {}
N 140 -330 200 -330 {
lab=clk}
N 240 -260 400 -260 {
lab=#net1}
N 240 -300 240 -230 {
lab=#net1}
N 240 -170 240 -130 {
lab=#net2}
N 140 -200 200 -200 {
lab=d}
N 240 -70 240 -50 {
lab=vss}
N 480 -260 610 -260 {
lab=q}
N 530 -330 530 -260 {
lab=q}
N 370 -300 370 -260 {
lab=#net1}
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
C {yxt/yxt_title.sym} 160 0 0 0 {name=l1 author="Joanne Low"}
C {sky130_stdcells/inv_1.sym} 440 -260 0 0 {name=x1 VGND=vcc VNB=vcc VPB=vss VPWR=vss prefix=sky130_fd_sc_hd__ }
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
