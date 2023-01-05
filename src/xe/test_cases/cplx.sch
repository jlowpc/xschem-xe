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
L 4 -70 290 270 290 {}
L 4 270 -180 270 290 {}
L 4 -70 -180 270 -180 {}
L 4 -70 -180 -70 290 {}
T {@name} -70 -220 0 0 0.4 0.4 {}
T {@symname} 140 -220 0 0 0.4 0.4 {}
N 30 -60 30 -30 {
lab=#net1}
N 170 -60 170 -30 {
lab=#net2}
N 30 30 30 50 {
lab=z}
N 170 30 170 50 {
lab=z}
N 30 140 30 170 {
lab=n1}
N 170 140 170 170 {
lab=n1}
N 30 50 30 80 {
lab=z}
N 170 50 170 80 {
lab=z}
N 30 160 170 160 {
lab=n1}
N 30 230 30 260 {
lab=vss}
N 170 230 170 260 {
lab=vss}
N 30 -140 30 -120 {
lab=vcc}
N 170 -140 170 -120 {
lab=vcc}
N 30 50 270 50 {
lab=z}
N -70 110 -10 110 {
lab=in1}
N -70 200 -10 200 {
lab=in2}
N 210 110 270 110 {
lab=in3}
N 210 200 270 200 {
lab=in4}
N 210 -90 230 -90 {
lab=in3}
N -30 -90 -10 -90 {
lab=in2}
N -30 0 -10 0 {
lab=in4}
N 210 0 230 0 {
lab=in1}
C {sky130_fd_pr/pfet3_01v8.sym} 10 -90 0 0 {name=M2
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
C {sky130_fd_pr/nfet3_01v8.sym} 190 110 0 1 {name=M10
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
C {sky130_fd_pr/pfet3_01v8.sym} 190 -90 0 1 {name=M1
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
C {sky130_fd_pr/pfet3_01v8.sym} 10 0 0 0 {name=M3
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
C {sky130_fd_pr/pfet3_01v8.sym} 190 0 0 1 {name=M4
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
C {sky130_fd_pr/nfet3_01v8.sym} 10 110 0 0 {name=M5
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
C {sky130_fd_pr/nfet3_01v8.sym} 190 200 0 1 {name=M6
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
C {sky130_fd_pr/nfet3_01v8.sym} 10 200 0 0 {name=M7
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
C {devices/gnd.sym} 30 260 0 0 {name=l1 lab=vss}
C {devices/gnd.sym} 170 260 0 0 {name=l2 lab=vss}
C {devices/vdd.sym} 30 -140 0 0 {name=l3 lab=vcc}
C {devices/vdd.sym} 170 -140 0 0 {name=l4 lab=vcc}
C {devices/ipin.sym} -70 110 0 0 {name=p1 lab=in1}
C {devices/ipin.sym} -70 200 0 0 {name=p2 lab=in2}
C {devices/ipin.sym} 270 110 0 1 {name=p3 lab=in3}
C {devices/ipin.sym} 270 200 0 1 {name=p4 lab=in4}
C {devices/lab_wire_yxt.sym} 110 160 0 0 {name=l5 sig_type=std_logic lab=n1}
C {devices/opin.sym} 270 50 0 0 {name=p5 lab=z}
C {devices/lab_pin_yxt.sym} -30 -90 0 0 {name=l6 sig_type=std_logic lab=in2}
C {devices/lab_pin_yxt.sym} -30 0 0 0 {name=l7 sig_type=std_logic lab=in4}
C {devices/lab_pin_yxt.sym} 230 0 0 1 {name=l8 sig_type=std_logic lab=in1}
C {devices/lab_pin_yxt.sym} 230 -90 0 1 {name=l9 sig_type=std_logic lab=in3}
