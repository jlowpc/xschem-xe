v {xschem version=3.1.0 file_version=1.2 }
G {}
K {type=subcircuit
format="@name @pinlist @@vcc @@vss @symname"
template="name=x1 vcc=vcc vss=vss"
extra="vcc vss"}
V {}
S {}
E {}
N 210 -300 210 -180 {
lab=s}
N 270 -300 270 -180 {
lab=d}
N 240 -300 240 -290 {
lab=vss}
N 240 -190 240 -180 {
lab=vcc}
N 190 -240 210 -240 {
lab=s}
N 240 -140 240 -120 {
lab=gn}
N 240 -360 240 -340 {
lab=gp}
N 270 -240 290 -240 {
lab=d}
C {yxt/yxt_title.sym} 160 0 0 0 {name=l1 author="Joanne Low"}
C {sky130_fd_pr/pfet_01v8.sym} 240 -320 3 1 {name=Mpc
L=0.15
W=1
nf=1
mult=7
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} 240 -160 3 0 {name=M15
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
C {devices/ipin.sym} 190 -240 0 0 {name=p4 lab=s}
C {devices/ipin.sym} 240 -360 1 0 {name=p2 lab=gp}
C {devices/ipin.sym} 240 -120 3 0 {name=p3 lab=gn}
C {devices/lab_pin_yxt.sym} 240 -290 1 1 {name=l2 sig_type=std_logic lab=vss}
C {devices/lab_pin_yxt.sym} 240 -190 3 1 {name=l3 sig_type=std_logic lab=vcc}
C {devices/opin.sym} 290 -240 0 0 {name=p1 lab=d}
