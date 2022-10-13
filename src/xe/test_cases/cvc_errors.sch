v {xschem version=3.1.0 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {Forward bias diodes:
VBB < VSS 
NMOS bulk-source is forward biased
Output ESD (VSS) diode may be forward biased} -180 530 0 0 0.4 0.4 {}
T {Forward bias diodes:
VCC > VDD
NMOS source-bulk is forward biased
Output ESD (VDD) diode may be forward biased} -190 190 0 0 0.4 0.4 {}
T {FAIL} 40 -890 0 0 0.4 0.4 {}
T {PASS} 480 -880 0 0 0.4 0.4 {}
T {Warning for same voltages} 130 -840 0 0 0.4 0.4 {}
T {Error for different voltages} 120 -430 0 0 0.4 0.4 {}
T {VDD < VCC PMOS is always on} 1400 -610 0 0 0.4 0.4 {}
T {VSS > VBB NMOS is always on} 1400 -550 0 0 0.4 0.4 {}
T {Mosfet gate vs source: mosfet that are always on because the 
max gate voltage < max source voltage for pmos, or the 
min gate voltage > min source voltage for nmos.} 1150 -810 0 0 0.4 0.4 {}
T {FAIL} 1480 -910 0 0 0.4 0.4 {}
T {PASS} 1920 -900 0 0 0.4 0.4 {}
T {VDD < VCC PMOS is always on} 2100 -620 0 0 0.4 0.4 {}
T {VSS > VBB NMOS is always on} 2100 -560 0 0 0.4 0.4 {}
T {All shorts between power signals are reported and 
other shorts (input, internal nets) are reported if the 
current exceeds a specified limit.} 1130 -360 0 0 0.4 0.4 {}
T {Mosft undefined bulk: 
generally this indicates a missing power definition} 1460 210 0 0 0.4 0.4 {}
T {FAIL} 2920 -930 0 0 0.4 0.4 {}
T {PASS} 3360 -920 0 0 0.4 0.4 {}
T {Possible leak: 
Potential intermittent error that is not readily detectible by other programs.} 2920 -810 0 0 0.4 0.4 {}
T {Short only when 
input is high} 2660 -580 0 0 0.4 0.4 {}
T {Hi-Z input: logically undriven gates} 3050 40 0 0 0.4 0.4 {}
T {ok_n1 is High-Z but no leak path 
therefore no error} 2600 370 0 0 0.4 0.4 {}
T {out9A Hi-Z input with leak
path therfore error} 3150 380 0 0 0.4 0.4 {}
T {FAIL} 4220 -940 0 0 0.4 0.4 {}
T {PASS} 4660 -930 0 0 0.4 0.4 {}
T {Overvoltage: detected if the maximum voltage difference exceeds specified tolerance
for each device/terminal combination.  For mosfets, the gate-source, source-drain,
source-bulk, gate-bulk checks are all possible.} 4220 -820 0 0 0.4 0.4 {}
T {Expected values: expected values can be set for minimum, maximum, and simulation voltages.
An error is generated if the calculated value does not match the expected value.
It is possible to epxect undriven (open) nets.} 4230 60 0 0 0.4 0.4 {}
N 0 -710 0 -680 {
lab=out1A}
N -80 -740 -40 -740 {
lab=in1A}
N -60 -650 -40 -650 {
lab=in1A}
N -60 -740 -60 -650 {
lab=in1A}
N 0 -620 0 -580 {
lab=#net1}
N 150 -740 200 -740 {
lab=in1B}
N 180 -740 180 -550 {
lab=in1B}
N 0 -520 0 -500 {
lab=VSS}
N 0 -790 0 -770 {
lab=VDDA}
N 110 -790 110 -770 {
lab=VCC}
N 440 -710 440 -680 {
lab=out2A}
N 360 -740 400 -740 {
lab=in1C}
N 380 -650 400 -650 {
lab=in1C}
N 380 -740 380 -650 {
lab=in1C}
N 440 -620 440 -580 {
lab=#net2}
N 590 -740 640 -740 {
lab=in1D}
N 620 -740 620 -550 {
lab=in1D}
N 440 -520 440 -500 {
lab=VSS}
N 440 -790 440 -770 {
lab=VDDA}
N 550 -790 550 -770 {
lab=VDDA}
N 100 -390 100 -350 {
lab=VDDB}
N -10 -390 -10 -350 {
lab=VDDA}
N -10 -140 -10 -110 {
lab=out2A}
N -90 -170 -50 -170 {
lab=in2A}
N -70 -80 -50 -80 {
lab=in2A}
N -70 -170 -70 -80 {
lab=in2A}
N -10 -50 -10 -10 {
lab=#net3}
N 140 -170 190 -170 {
lab=in2B}
N 170 -170 170 20 {
lab=in2B}
N -10 50 -10 70 {
lab=VSS}
N -10 -220 -10 -200 {
lab=#net4}
N 100 -220 100 -200 {
lab=#net5}
N -10 -290 -10 -220 {
lab=#net4}
N 100 -290 100 -220 {
lab=#net5}
N -10 -230 20 -230 {
lab=#net4}
N 80 -230 100 -230 {
lab=#net5}
N 560 -390 560 -350 {
lab=VDDA}
N 450 -390 450 -350 {
lab=VDDA}
N 450 -140 450 -110 {
lab=out2B}
N 370 -170 410 -170 {
lab=in2C}
N 390 -80 410 -80 {
lab=in2C}
N 390 -170 390 -80 {
lab=in2C}
N 450 -50 450 -10 {
lab=#net6}
N 600 -170 650 -170 {
lab=in2D}
N 630 -170 630 20 {
lab=in2D}
N 450 50 450 70 {
lab=VSS}
N 450 -220 450 -200 {
lab=#net7}
N 560 -220 560 -200 {
lab=#net8}
N 450 -290 450 -220 {
lab=#net7}
N 560 -290 560 -220 {
lab=#net8}
N 450 -230 480 -230 {
lab=#net7}
N 540 -230 560 -230 {
lab=#net8}
N 0 -700 210 -700 {
lab=out1A}
N 110 -710 110 -700 {
lab=out1A}
N 440 -700 650 -700 {
lab=out2A}
N 550 -710 550 -700 {
lab=out2A}
N -10 -130 200 -130 {
lab=out2A}
N 100 -140 100 -130 {
lab=out2A}
N 450 -130 660 -130 {
lab=out2B}
N 560 -140 560 -130 {
lab=out2B}
N -210 270 -210 290 {
lab=VCC}
N -210 520 -210 540 {
lab=VBB}
N -300 320 -250 320 {
lab=in3A}
N -280 490 -250 490 {
lab=in3A}
N -280 320 -280 490 {
lab=in3A}
N -210 350 -210 460 {
lab=out3A}
N -210 400 30 400 {
lab=out3A}
N -210 320 -90 320 {
lab=VDD}
N -90 320 -90 330 {
lab=VDD}
N -90 390 -90 410 {
lab=#net9}
N -210 490 -90 490 {
lab=VSS}
N -90 470 -90 490 {
lab=VSS}
N 440 270 440 290 {
lab=VDD}
N 440 520 440 540 {
lab=VSS}
N 350 320 400 320 {
lab=in3B}
N 370 490 400 490 {
lab=in3B}
N 370 320 370 490 {
lab=in3B}
N 440 350 440 460 {
lab=out3B}
N 440 320 560 320 {
lab=VCC}
N 560 320 560 330 {
lab=VCC}
N 560 390 560 410 {
lab=out3B}
N 440 490 560 490 {
lab=VBB}
N 560 470 560 490 {
lab=VBB}
N 440 410 680 410 {
lab=out3B}
N 1240 -700 1240 -680 {
lab=VDD}
N 1240 -450 1240 -430 {
lab=VSS}
N 1150 -650 1200 -650 {
lab=in4A}
N 1170 -480 1200 -480 {
lab=in4A}
N 1170 -650 1170 -480 {
lab=in4A}
N 1240 -620 1240 -510 {
lab=#net10}
N 1240 -650 1320 -650 {
lab=VDD}
N 1240 -480 1310 -480 {
lab=VSS}
N 1240 -690 1320 -690 {
lab=VDD}
N 1320 -690 1320 -650 {
lab=VDD}
N 1310 -480 1310 -440 {
lab=VSS}
N 1240 -440 1310 -440 {
lab=VSS}
N 1380 -700 1380 -680 {
lab=VCC}
N 1380 -450 1380 -430 {
lab=VBB}
N 1380 -620 1380 -510 {
lab=out4A}
N 1380 -650 1460 -650 {
lab=VCC}
N 1380 -480 1450 -480 {
lab=VBB}
N 1380 -690 1460 -690 {
lab=VCC}
N 1460 -690 1460 -650 {
lab=VCC}
N 1450 -480 1450 -440 {
lab=VBB}
N 1380 -440 1450 -440 {
lab=VBB}
N 1330 -650 1340 -650 {
lab=#net10}
N 1330 -650 1330 -480 {
lab=#net10}
N 1330 -480 1340 -480 {
lab=#net10}
N 1240 -570 1330 -570 {
lab=#net10}
N 1380 -570 1500 -570 {
lab=out4A}
N 1940 -710 1940 -690 {
lab=VCC}
N 1940 -460 1940 -440 {
lab=VBB}
N 1850 -660 1900 -660 {
lab=in4B}
N 1870 -490 1900 -490 {
lab=in4B}
N 1870 -660 1870 -490 {
lab=in4B}
N 1940 -630 1940 -520 {
lab=#net11}
N 1940 -660 2020 -660 {
lab=VCC}
N 1940 -490 2010 -490 {
lab=VBB}
N 1940 -700 2020 -700 {
lab=VCC}
N 2020 -700 2020 -660 {
lab=VCC}
N 2010 -490 2010 -450 {
lab=VBB}
N 1940 -450 2010 -450 {
lab=VBB}
N 2080 -710 2080 -690 {
lab=VDD}
N 2080 -460 2080 -440 {
lab=VSS}
N 2080 -630 2080 -520 {
lab=#net12}
N 2080 -660 2160 -660 {
lab=VDD}
N 2080 -490 2150 -490 {
lab=VSS}
N 2080 -700 2160 -700 {
lab=VDD}
N 2160 -700 2160 -660 {
lab=VDD}
N 2150 -490 2150 -450 {
lab=VSS}
N 2080 -450 2150 -450 {
lab=VSS}
N 2030 -660 2040 -660 {
lab=#net11}
N 2030 -660 2030 -490 {
lab=#net11}
N 2030 -490 2040 -490 {
lab=#net11}
N 1940 -580 2030 -580 {
lab=#net11}
N 2080 -580 2200 -580 {
lab=#net12}
N 1230 270 1230 290 {
lab=VCC}
N 1230 520 1230 540 {
lab=VBB}
N 1140 320 1190 320 {
lab=in6A}
N 1160 490 1190 490 {
lab=in6A}
N 1160 320 1160 490 {
lab=in6A}
N 1230 350 1230 460 {
lab=out6A}
N 1230 320 1320 320 {
lab=BulkBad6A}
N 1230 490 1320 490 {
lab=BulkBad6B}
N 2060 260 2060 280 {
lab=VCC}
N 2060 510 2060 530 {
lab=VBB}
N 1970 310 2020 310 {
lab=in6B}
N 1990 480 2020 480 {
lab=in6B}
N 1990 310 1990 480 {
lab=in6B}
N 2060 340 2060 450 {
lab=out6B}
N 2060 310 2150 310 {
lab=VCC}
N 2060 480 2150 480 {
lab=VBB}
N 1230 400 1350 400 {
lab=out6A}
N 2060 400 2180 400 {
lab=out6B}
N 2960 -660 2960 -520 {
lab=VDD}
N 3020 -660 3020 -520 {
lab=GND}
N 2910 -590 2960 -590 {
lab=VDD}
N 3020 -590 3070 -590 {
lab=GND}
N 2930 -700 2990 -700 {
lab=#net13}
N 2780 -700 2850 -700 {
lab=in7A}
N 2990 -480 2990 -430 {
lab=in7A}
N 2820 -430 2990 -430 {
lab=in7A}
N 2820 -700 2820 -430 {
lab=in7A}
N 3480 -660 3480 -520 {
lab=VDD}
N 3540 -660 3540 -520 {
lab=out7A}
N 3430 -590 3480 -590 {
lab=VDD}
N 3540 -590 3590 -590 {
lab=out7A}
N 3450 -700 3510 -700 {
lab=#net14}
N 3300 -700 3370 -700 {
lab=in7B}
N 3510 -480 3510 -430 {
lab=in7B}
N 3340 -430 3510 -430 {
lab=in7B}
N 3340 -700 3340 -430 {
lab=in7B}
N 2870 -330 2920 -330 {
lab=in8A}
N 2870 -260 2920 -260 {
lab=in8B}
N 2860 -190 2910 -190 {
lab=in8C}
N 2860 -150 2910 -150 {
lab=in8D}
N 2860 -90 2910 -90 {
lab=in8E}
N 2860 -50 2910 -50 {
lab=in8F}
N 3000 -330 3050 -330 {
lab=GND}
N 3000 -260 3050 -260 {
lab=VDD}
N 3030 -170 3080 -170 {
lab=GND}
N 3030 -70 3080 -70 {
lab=VDD}
N 3340 -330 3390 -330 {
lab=in8G}
N 3340 -260 3390 -260 {
lab=in8H}
N 3330 -190 3380 -190 {
lab=in8I}
N 3330 -150 3380 -150 {
lab=in8J}
N 3330 -90 3380 -90 {
lab=in8K}
N 3330 -50 3380 -50 {
lab=in8L}
N 3470 -330 3520 -330 {
lab=out8A}
N 3470 -260 3520 -260 {
lab=out8B}
N 3500 -170 3550 -170 {
lab=out8C}
N 3500 -70 3550 -70 {
lab=out8D}
N 2930 290 2930 320 {
lab=ok_n1}
N 2850 260 2890 260 {
lab=in9A}
N 2870 350 2890 350 {
lab=in9A}
N 2870 260 2870 350 {
lab=in9A}
N 3110 290 3110 320 {
lab=out9A}
N 3110 380 3110 420 {
lab=GND}
N 3110 210 3110 230 {
lab=VDD}
N 2930 170 2930 230 {
lab=#net15}
N 2930 380 2930 460 {
lab=#net16}
N 2860 140 2890 140 {
lab=VDD}
N 2860 490 2890 490 {
lab=GND}
N 2930 520 2930 540 {
lab=GND}
N 2930 90 2930 110 {
lab=VDD}
N 3040 260 3070 260 {
lab=ok_n1}
N 3040 260 3040 350 {
lab=ok_n1}
N 3040 350 3070 350 {
lab=ok_n1}
N 2930 310 3040 310 {
lab=ok_n1}
N 3110 310 3190 310 {
lab=out9A}
N 3510 300 3510 330 {
lab=n2}
N 3410 150 3450 150 {
lab=VDD}
N 3450 360 3470 360 {
lab=VDD}
N 3690 300 3690 330 {
lab=out9B}
N 3690 390 3690 430 {
lab=GND}
N 3690 220 3690 240 {
lab=VDD}
N 3510 180 3510 240 {
lab=#net17}
N 3510 390 3510 470 {
lab=#net18}
N 3510 530 3510 550 {
lab=GND}
N 3510 100 3510 120 {
lab=VDD}
N 3620 270 3650 270 {
lab=n2}
N 3620 270 3620 360 {
lab=n2}
N 3620 360 3650 360 {
lab=n2}
N 3510 320 3620 320 {
lab=n2}
N 3690 320 3770 320 {
lab=out9B}
N 3450 500 3470 500 {
lab=VDD}
N 3450 150 3470 150 {
lab=VDD}
N 3450 150 3450 500 {
lab=VDD}
N 3450 270 3470 270 {
lab=VDD}
N -40 -550 180 -550 {
lab=in1B}
N 400 -550 620 -550 {
lab=in1D}
N -50 20 170 20 {
lab=in2B}
N 410 20 630 20 {
lab=in2D}
C {sky130_fd_pr/nfet3_01v8.sym} -20 -650 0 0 {name=M1
L=0.15
W=1
body=GND
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
C {sky130_fd_pr/pfet3_01v8.sym} -20 -740 0 0 {name=M2
L=0.15
W=1
body=VDD
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
C {sky130_fd_pr/pfet3_01v8.sym} 130 -740 0 1 {name=M3
L=0.15
W=1
body=VDD
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
C {sky130_fd_pr/nfet3_01v8.sym} -20 -550 0 0 {name=M4
L=0.15
W=1
body=GND
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
C {devices/lab_pin.sym} 0 -790 0 0 {name=l1 sig_type=std_logic lab=VDDA}
C {devices/lab_pin.sym} 110 -790 0 0 {name=l1 sig_type=std_logic lab=VCC}
C {devices/lab_pin.sym} 0 -500 0 0 {name=l1 sig_type=std_logic lab=VSS}
C {devices/ipin.sym} -80 -740 0 0 {name=p1 lab=in1A}
C {devices/ipin.sym} 200 -740 0 1 {name=p1 lab=in1B}
C {sky130_fd_pr/nfet3_01v8.sym} 420 -650 0 0 {name=M5
L=0.15
W=1
body=GND
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
C {sky130_fd_pr/pfet3_01v8.sym} 420 -740 0 0 {name=M6
L=0.15
W=1
body=VDD
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
C {sky130_fd_pr/pfet3_01v8.sym} 570 -740 0 1 {name=M7
L=0.15
W=1
body=VDD
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
C {sky130_fd_pr/nfet3_01v8.sym} 420 -550 0 0 {name=M8
L=0.15
W=1
body=GND
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
C {devices/lab_pin.sym} 440 -790 0 0 {name=l1 sig_type=std_logic lab=VDDA}
C {devices/lab_pin.sym} 550 -790 0 0 {name=l2 sig_type=std_logic lab=VDDA}
C {devices/lab_pin.sym} 440 -500 0 0 {name=l3 sig_type=std_logic lab=VSS}
C {devices/ipin.sym} 360 -740 0 0 {name=p1 lab=in1C}
C {devices/ipin.sym} 640 -740 0 1 {name=p2 lab=in1D}
C {sky130_fd_pr/res_generic_m1.sym} -10 -320 0 0 {name=R1
W=1
L=1
model=res_generic_m1
mult=1}
C {sky130_fd_pr/nfet3_01v8.sym} -30 -80 0 0 {name=M9
L=0.15
W=1
body=GND
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
C {sky130_fd_pr/pfet3_01v8.sym} -30 -170 0 0 {name=M10
L=0.15
W=1
body=VDD
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
C {sky130_fd_pr/pfet3_01v8.sym} 120 -170 0 1 {name=M11
L=0.15
W=1
body=VDD
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
C {sky130_fd_pr/nfet3_01v8.sym} -30 20 0 0 {name=M12
L=0.15
W=1
body=GND
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
C {devices/lab_pin.sym} -10 -390 0 0 {name=l1 sig_type=std_logic lab=VDDA}
C {devices/lab_pin.sym} 100 -390 0 0 {name=l2 sig_type=std_logic lab=VDDB}
C {devices/lab_pin.sym} -10 70 0 0 {name=l3 sig_type=std_logic lab=VSS}
C {devices/ipin.sym} -90 -170 0 0 {name=p1 lab=in2A}
C {devices/ipin.sym} 190 -170 0 1 {name=p2 lab=in2B}
C {sky130_fd_pr/res_generic_m1.sym} 100 -320 0 0 {name=R2
W=1
L=1
model=res_generic_m1
mult=1}
C {sky130_fd_pr/res_generic_m1.sym} 50 -230 3 0 {name=R3
W=1
L=1
model=res_generic_m1
mult=1}
C {sky130_fd_pr/res_generic_m1.sym} 450 -320 0 0 {name=R4
W=1
L=1
model=res_generic_m1
mult=1}
C {sky130_fd_pr/nfet3_01v8.sym} 430 -80 0 0 {name=M13
L=0.15
W=1
body=GND
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
C {sky130_fd_pr/pfet3_01v8.sym} 430 -170 0 0 {name=M14
L=0.15
W=1
body=VDD
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
C {sky130_fd_pr/pfet3_01v8.sym} 580 -170 0 1 {name=M15
L=0.15
W=1
body=VDD
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
C {sky130_fd_pr/nfet3_01v8.sym} 430 20 0 0 {name=M16
L=0.15
W=1
body=GND
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
C {devices/lab_pin.sym} 450 -390 0 0 {name=l1 sig_type=std_logic lab=VDDA}
C {devices/lab_pin.sym} 560 -390 0 0 {name=l2 sig_type=std_logic lab=VDDA}
C {devices/lab_pin.sym} 450 70 0 0 {name=l3 sig_type=std_logic lab=VSS}
C {devices/ipin.sym} 370 -170 0 0 {name=p1 lab=in2C}
C {devices/ipin.sym} 650 -170 0 1 {name=p2 lab=in2D}
C {sky130_fd_pr/res_generic_m1.sym} 560 -320 0 0 {name=R5
W=1
L=1
model=res_generic_m1
mult=1}
C {sky130_fd_pr/res_generic_m1.sym} 510 -230 3 0 {name=R6
W=1
L=1
model=res_generic_m1
mult=1}
C {devices/opin.sym} 210 -700 0 0 {name=p1 lab=out1A}
C {devices/opin.sym} 650 -700 0 0 {name=p1 lab=out2A}
C {devices/opin.sym} 30 400 0 0 {name=p1 lab=out3A}
C {devices/opin.sym} 660 -130 0 0 {name=p1 lab=out2B}
C {yxt/yxt_title.sym} 30 750 0 0 {name=l1 author="Joanne Low"}
C {sky130_fd_pr/nfet_01v8_lvt.sym} -230 490 0 0 {name=M17
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
model=nfet_01v8_lvt
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8_lvt.sym} -230 320 0 0 {name=M18
L=0.35
W=1
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8_lvt
spiceprefix=X
}
C {devices/lab_pin.sym} -210 270 0 0 {name=l2 sig_type=std_logic lab=VCC}
C {devices/lab_pin.sym} -210 540 0 0 {name=l2 sig_type=std_logic lab=VBB}
C {devices/ipin.sym} -300 320 0 0 {name=p1 lab=in3A}
C {sky130_fd_pr/diode.sym} -90 440 0 0 {name=D1
model=diode_pw2nd_05v5
area=1e12
}
C {sky130_fd_pr/diode.sym} -90 360 0 0 {name=D2
model=diode_pw2nd_05v5
area=1e12
}
C {devices/lab_pin.sym} -90 320 0 1 {name=l2 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} -90 490 0 1 {name=l2 sig_type=std_logic lab=VSS}
C {sky130_fd_pr/nfet_01v8_lvt.sym} 420 490 0 0 {name=M19
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
model=nfet_01v8_lvt
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8_lvt.sym} 420 320 0 0 {name=M20
L=0.35
W=1
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8_lvt
spiceprefix=X
}
C {devices/lab_pin.sym} 440 270 0 0 {name=l2 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 440 540 0 0 {name=l1 sig_type=std_logic lab=VSS}
C {devices/ipin.sym} 350 320 0 0 {name=p1 lab=in3B}
C {sky130_fd_pr/diode.sym} 560 440 0 0 {name=D3
model=diode_pw2nd_05v5
area=1e12
}
C {sky130_fd_pr/diode.sym} 560 360 0 0 {name=D4
model=diode_pw2nd_05v5
area=1e12
}
C {devices/lab_pin.sym} 560 320 0 1 {name=l3 sig_type=std_logic lab=VCC}
C {devices/lab_pin.sym} 560 490 0 1 {name=l4 sig_type=std_logic lab=VBB}
C {devices/opin.sym} 200 -130 0 0 {name=p1 lab=out2A}
C {devices/opin.sym} 680 410 0 0 {name=p1 lab=out3B}
C {sky130_fd_pr/nfet_01v8_lvt.sym} 1220 -480 0 0 {name=M21
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
model=nfet_01v8_lvt
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8_lvt.sym} 1220 -650 0 0 {name=M22
L=0.35
W=1
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8_lvt
spiceprefix=X
}
C {devices/lab_pin.sym} 1240 -700 0 0 {name=l2 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 1240 -430 0 0 {name=l1 sig_type=std_logic lab=VSS}
C {devices/ipin.sym} 1150 -650 0 0 {name=p1 lab=in4A}
C {devices/opin.sym} 1500 -570 0 0 {name=p2 lab=out4A}
C {sky130_fd_pr/nfet_01v8_lvt.sym} 1360 -480 0 0 {name=M23
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
model=nfet_01v8_lvt
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8_lvt.sym} 1360 -650 0 0 {name=M24
L=0.35
W=1
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8_lvt
spiceprefix=X
}
C {devices/lab_pin.sym} 1380 -700 0 0 {name=l2 sig_type=std_logic lab=VCC}
C {devices/lab_pin.sym} 1380 -430 0 0 {name=l1 sig_type=std_logic lab=VBB}
C {sky130_fd_pr/nfet_01v8_lvt.sym} 1920 -490 0 0 {name=M25
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
model=nfet_01v8_lvt
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8_lvt.sym} 1920 -660 0 0 {name=M26
L=0.35
W=1
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8_lvt
spiceprefix=X
}
C {devices/lab_pin.sym} 1940 -710 0 0 {name=l2 sig_type=std_logic lab=VCC}
C {devices/lab_pin.sym} 1940 -440 0 0 {name=l1 sig_type=std_logic lab=VBB}
C {devices/ipin.sym} 1850 -660 0 0 {name=p1 lab=in4B}
C {devices/opin.sym} 3590 -590 0 0 {name=p2 lab=out7A}
C {sky130_fd_pr/nfet_01v8_lvt.sym} 2060 -490 0 0 {name=M27
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
model=nfet_01v8_lvt
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8_lvt.sym} 2060 -660 0 0 {name=M28
L=0.35
W=1
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8_lvt
spiceprefix=X
}
C {devices/lab_pin.sym} 2080 -710 0 0 {name=l3 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 2080 -440 0 0 {name=l4 sig_type=std_logic lab=VSS}
C {sky130_fd_pr/nfet_01v8_lvt.sym} 1210 490 0 0 {name=M29
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
model=nfet_01v8_lvt
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8_lvt.sym} 1210 320 0 0 {name=M30
L=0.35
W=1
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8_lvt
spiceprefix=X
}
C {devices/lab_pin.sym} 1230 270 0 0 {name=l2 sig_type=std_logic lab=VCC}
C {devices/lab_pin.sym} 1230 540 0 0 {name=l1 sig_type=std_logic lab=VBB}
C {devices/ipin.sym} 1140 320 0 0 {name=p1 lab=in6A}
C {sky130_fd_pr/nfet_01v8_lvt.sym} 2040 480 0 0 {name=M31
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
model=nfet_01v8_lvt
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8_lvt.sym} 2040 310 0 0 {name=M32
L=0.35
W=1
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8_lvt
spiceprefix=X
}
C {devices/lab_pin.sym} 2060 260 0 0 {name=l2 sig_type=std_logic lab=VCC}
C {devices/lab_pin.sym} 2060 530 0 0 {name=l1 sig_type=std_logic lab=VBB}
C {devices/ipin.sym} 1970 310 0 0 {name=p1 lab=in6B}
C {devices/lab_pin.sym} 2150 310 0 1 {name=l3 sig_type=std_logic lab=VCC}
C {devices/lab_pin.sym} 2150 480 0 1 {name=l4 sig_type=std_logic lab=VBB}
C {devices/opin.sym} 1350 400 0 0 {name=p2 lab=out6A}
C {devices/opin.sym} 2180 400 0 0 {name=p2 lab=out6B}
C {sky130_fd_pr/pfet3_01v8.sym} 2990 -680 1 0 {name=M34
L=0.15
W=1
body=VDD
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
C {sky130_fd_pr/nfet3_01v8.sym} 2990 -500 3 0 {name=M35
L=0.15
W=1
body=GND
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
C {devices/gnd.sym} 3070 -590 0 0 {name=l1 lab=GND}
C {devices/vdd.sym} 2910 -590 0 0 {name=l1 lab=VDD}
C {sky130_stdcells/inv_1.sym} 2890 -700 0 0 {name=x1 VGND=VGND VNB=VNB VPB=VPB VPWR=VPWR prefix=sky130_fd_sc_hd__ }
C {devices/ipin.sym} 2780 -700 0 0 {name=p1 lab=in7A}
C {sky130_fd_pr/pfet3_01v8.sym} 3510 -680 1 0 {name=M33
L=0.15
W=1
body=VDD
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
C {sky130_fd_pr/nfet3_01v8.sym} 3510 -500 3 0 {name=M36
L=0.15
W=1
body=GND
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
C {devices/vdd.sym} 3430 -590 0 0 {name=l2 lab=VDD}
C {sky130_stdcells/inv_1.sym} 3410 -700 0 0 {name=x2 VGND=VGND VNB=VNB VPB=VPB VPWR=VPWR prefix=sky130_fd_sc_hd__ }
C {devices/ipin.sym} 3300 -700 0 0 {name=p1 lab=in7B}
C {sky130_stdcells/inv_1.sym} 2960 -260 0 0 {name=x3 VGND=VGND VNB=VNB VPB=VPB VPWR=VPWR prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/nand2_1.sym} 2970 -170 0 0 {name=x4 VGND=VGND VNB=VNB VPB=VPB VPWR=VPWR prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/nor2_1.sym} 2970 -70 0 0 {name=x5 VGND=VGND VNB=VNB VPB=VPB VPWR=VPWR prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/inv_1.sym} 2960 -330 0 0 {name=x6 VGND=VGND VNB=VNB VPB=VPB VPWR=VPWR prefix=sky130_fd_sc_hd__ }
C {devices/ipin.sym} 2870 -330 0 0 {name=p1 lab=in8A}
C {devices/ipin.sym} 2870 -260 0 0 {name=p1 lab=in8B}
C {devices/ipin.sym} 2860 -190 0 0 {name=p1 lab=in8C}
C {devices/ipin.sym} 2860 -150 0 0 {name=p1 lab=in8D}
C {devices/ipin.sym} 2860 -90 0 0 {name=p1 lab=in8E}
C {devices/ipin.sym} 2860 -50 0 0 {name=p2 lab=in8F}
C {devices/gnd.sym} 3050 -330 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} 3080 -170 0 0 {name=l1 lab=GND}
C {devices/vdd.sym} 3050 -260 0 0 {name=l1 lab=VDD}
C {devices/vdd.sym} 3080 -70 0 0 {name=l1 lab=VDD}
C {sky130_stdcells/inv_1.sym} 3430 -260 0 0 {name=x7 VGND=VGND VNB=VNB VPB=VPB VPWR=VPWR prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/nand2_1.sym} 3440 -170 0 0 {name=x8 VGND=VGND VNB=VNB VPB=VPB VPWR=VPWR prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/nor2_1.sym} 3440 -70 0 0 {name=x9 VGND=VGND VNB=VNB VPB=VPB VPWR=VPWR prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/inv_1.sym} 3430 -330 0 0 {name=x10 VGND=VGND VNB=VNB VPB=VPB VPWR=VPWR prefix=sky130_fd_sc_hd__ }
C {devices/ipin.sym} 3340 -330 0 0 {name=p1 lab=in8G}
C {devices/ipin.sym} 3340 -260 0 0 {name=p2 lab=in8H}
C {devices/ipin.sym} 3330 -190 0 0 {name=p3 lab=in8I}
C {devices/ipin.sym} 3330 -150 0 0 {name=p4 lab=in8J}
C {devices/ipin.sym} 3330 -90 0 0 {name=p5 lab=in8K}
C {devices/ipin.sym} 3330 -50 0 0 {name=p6 lab=in8L}
C {devices/opin.sym} 3520 -330 0 0 {name=p2 lab=out8A}
C {devices/opin.sym} 3520 -260 0 0 {name=p2 lab=out8B}
C {devices/opin.sym} 3550 -170 0 0 {name=p2 lab=out8C}
C {devices/opin.sym} 3550 -70 0 0 {name=p2 lab=out8D}
C {sky130_fd_pr/nfet3_01v8.sym} 2910 350 0 0 {name=M39
L=0.15
W=1
body=GND
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
C {sky130_fd_pr/pfet3_01v8.sym} 2910 260 0 0 {name=M40
L=0.15
W=1
body=VDD
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
C {devices/ipin.sym} 2850 260 0 0 {name=p1 lab=in9A}
C {devices/opin.sym} 3190 310 0 0 {name=p3 lab=out9A}
C {sky130_fd_pr/pfet3_01v8.sym} 2910 140 0 0 {name=M37
L=0.15
W=1
body=VDD
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
C {sky130_fd_pr/nfet3_01v8.sym} 2910 490 0 0 {name=M38
L=0.15
W=1
body=GND
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
C {sky130_fd_pr/nfet3_01v8.sym} 3090 350 0 0 {name=M41
L=0.15
W=1
body=GND
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
C {sky130_fd_pr/pfet3_01v8.sym} 3090 260 0 0 {name=M42
L=0.15
W=1
body=VDD
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
C {devices/gnd.sym} 2860 490 0 0 {name=l1 lab=GND}
C {devices/vdd.sym} 2860 140 0 0 {name=l1 lab=VDD}
C {devices/vdd.sym} 2930 90 0 0 {name=l1 lab=VDD}
C {devices/gnd.sym} 2930 540 0 0 {name=l1 lab=GND}
C {devices/vdd.sym} 3110 210 0 0 {name=l1 lab=VDD}
C {devices/gnd.sym} 3110 420 0 0 {name=l1 lab=GND}
C {devices/lab_wire_yxt.sym} 3020 310 0 0 {name=l1 sig_type=std_logic lab=ok_n1}
C {sky130_fd_pr/nfet3_01v8.sym} 3490 360 0 0 {name=M43
L=0.15
W=1
body=GND
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
C {sky130_fd_pr/pfet3_01v8.sym} 3490 270 0 0 {name=M44
L=0.15
W=1
body=VDD
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
C {devices/opin.sym} 3770 320 0 0 {name=p3 lab=out9B}
C {sky130_fd_pr/pfet3_01v8.sym} 3490 150 0 0 {name=M45
L=0.15
W=1
body=VDD
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
C {sky130_fd_pr/nfet3_01v8.sym} 3490 500 0 0 {name=M46
L=0.15
W=1
body=GND
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
C {sky130_fd_pr/nfet3_01v8.sym} 3670 360 0 0 {name=M47
L=0.15
W=1
body=GND
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
C {sky130_fd_pr/pfet3_01v8.sym} 3670 270 0 0 {name=M48
L=0.15
W=1
body=VDD
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
C {devices/vdd.sym} 3510 100 0 0 {name=l3 lab=VDD}
C {devices/gnd.sym} 3510 550 0 0 {name=l4 lab=GND}
C {devices/vdd.sym} 3690 220 0 0 {name=l5 lab=VDD}
C {devices/gnd.sym} 3690 430 0 0 {name=l6 lab=GND}
C {devices/lab_wire_yxt.sym} 3600 320 0 0 {name=l7 sig_type=std_logic lab=n2}
C {devices/vdd.sym} 3410 150 0 0 {name=l3 lab=VDD}
C {devices/code.sym} 4230 220 0 0 {name=s1 only_toplevel=false value="
.SUBCKT sky130_fd_sc_hd__inv_1 A VGND VNB VPB VPWR Y
*.PININFO A:I VGND:I VNB:I VPB:I VPWR:I Y:O
MMIN1 Y A VGND VNB nfet_01v8 m=1 w=0.65 l=0.15 mult=1 sa=0.265
+ sb=0.265 sd=0.28 topography=normal area=0.063 perim=1.14
MMIP1 Y A VPWR VPB pfet_01v8_hvt m=1 w=1.0 l=0.15 mult=1 sa=0.265
+ sb=0.265 sd=0.28 topography=normal area=0.063 perim=1.14
.ENDS sky130_fd_sc_hd__inv_1

.SUBCKT sky130_fd_sc_hd__nand2_1 A B VGND VNB VPB VPWR Y
*.PININFO A:I B:I VGND:I VNB:I VPB:I VPWR:I Y:O
MMP0 Y A VPWR VPB pfet_01v8_hvt m=1 w=1.0 l=0.15 mult=1 sa=0.265
+ sb=0.265 sd=0.28 topography=normal area=0.063 perim=1.14
MMP1 Y B VPWR VPB pfet_01v8_hvt m=1 w=1.0 l=0.15 mult=1 sa=0.265
+ sb=0.265 sd=0.28 topography=normal area=0.063 perim=1.14
MMN0 Y A sndA VNB nfet_01v8 m=1 w=0.65 l=0.15 mult=1 sa=0.265 sb=0.265
+ sd=0.28 topography=normal area=0.063 perim=1.14
MMN1 sndA B VGND VNB nfet_01v8 m=1 w=0.65 l=0.15 mult=1 sa=0.265
+ sb=0.265 sd=0.28 topography=normal area=0.063 perim=1.14
.ENDS sky130_fd_sc_hd__nand2_1

.SUBCKT sky130_fd_sc_hd__nor2_1 A B VGND VNB VPB VPWR Y
*.PININFO A:I B:I VGND:I VNB:I VPB:I VPWR:I Y:O
MMP0 VPWR A sndPA VPB pfet_01v8_hvt m=1 w=1.0 l=0.15 mult=1 sa=0.265
+ sb=0.265 sd=0.28 topography=normal area=0.063 perim=1.14
MMP1 sndPA B Y VPB pfet_01v8_hvt m=1 w=1.0 l=0.15 mult=1 sa=0.265
+ sb=0.265 sd=0.28 topography=normal area=0.063 perim=1.14
MMN0 Y A VGND VNB nfet_01v8 m=1 w=0.65 l=0.15 mult=1 sa=0.265 sb=0.265
+ sd=0.28 topography=normal area=0.063 perim=1.14
MMN1 Y B VGND VNB nfet_01v8 m=1 w=0.65 l=0.15 mult=1 sa=0.265 sb=0.265
+ sd=0.28 topography=normal area=0.063 perim=1.14
.ENDS sky130_fd_sc_hd__nor2_1
"

}
C {devices/ipin.sym} 1320 320 0 1 {name=p1 lab=BulkBad6A}
C {devices/ipin.sym} 1320 490 0 1 {name=p1 lab=BulkBad6B}
C {devices/ipin.sym} -60 -880 0 0 {name=p1 lab=VDDB}
C {devices/ipin.sym} -60 -910 0 0 {name=p1 lab=VDDA}
