v {xschem version=3.1.0 file_version=1.2 }
G {}
K {type=subcircuit
format="@name @pinlist @symname vcc=@vcc vss=@vss"
template="name=x1 vcc=vcc vss=vss"}
V {}
S {}
E {}
N 90 -1340 130 -1340 {
lab=in1}
N 90 -1280 130 -1280 {
lab=clk1}
N 90 -1250 130 -1250 {
lab=clk1}
N 460 -1340 500 -1340 {
lab=z1}
N 90 -1130 130 -1130 {
lab=in2}
N 90 -1070 130 -1070 {
lab=clk2}
N 90 -1040 130 -1040 {
lab=clk2}
N 460 -1130 500 -1130 {
lab=z2}
N 90 -930 130 -930 {
lab=in3}
N 90 -870 130 -870 {
lab=clk1}
N 90 -840 130 -840 {
lab=clk2}
N 460 -930 500 -930 {
lab=z3}
N 90 -720 130 -720 {
lab=in4}
N 90 -660 130 -660 {
lab=clk2}
N 90 -630 130 -630 {
lab=clk1}
N 460 -720 500 -720 {
lab=z4}
N 90 -510 130 -510 {
lab=in5}
N 90 -450 130 -450 {
lab=clk2}
N 90 -420 130 -420 {
lab=clk1}
N 460 -510 500 -510 {
lab=z5}
N 90 -300 130 -300 {
lab=in6}
N 90 -240 130 -240 {
lab=clk1}
N 90 -210 130 -210 {
lab=clk2}
N 460 -300 500 -300 {
lab=z6}
N 670 -1340 710 -1340 {
lab=in7}
N 670 -1280 710 -1280 {
lab=clk1}
N 670 -1250 710 -1250 {
lab=clk1}
N 1040 -1340 1080 -1340 {
lab=z7}
N 670 -1110 710 -1110 {
lab=in8}
N 670 -1050 710 -1050 {
lab=clk2}
N 670 -1020 710 -1020 {
lab=clk2}
N 1040 -1110 1080 -1110 {
lab=z8}
N 660 -890 700 -890 {
lab=in9}
N 660 -830 700 -830 {
lab=clk1}
N 660 -800 700 -800 {
lab=clk2}
N 1090 -870 1130 -870 {
lab=z9}
N 660 -650 700 -650 {
lab=in10}
N 660 -590 700 -590 {
lab=clk1}
N 660 -560 700 -560 {
lab=clk2}
N 1080 -630 1120 -630 {
lab=z10}
N 660 -400 700 -400 {
lab=in11}
N 660 -340 700 -340 {
lab=clk1}
N 660 -310 700 -310 {
lab=clk1}
N 1130 -400 1170 -400 {
lab=z11}
N 660 -170 700 -170 {
lab=in12}
N 660 -110 700 -110 {
lab=clk2}
N 660 -80 700 -80 {
lab=clk2}
N 1130 -170 1170 -170 {
lab=z12}
N 1290 -1330 1330 -1330 {
lab=in13}
N 1290 -1270 1330 -1270 {
lab=clk1}
N 1290 -1240 1330 -1240 {
lab=clk1}
N 1720 -1310 1760 -1310 {
lab=z13}
N 1290 -1090 1330 -1090 {
lab=in14}
N 1290 -1030 1330 -1030 {
lab=clk2}
N 1290 -1000 1330 -1000 {
lab=clk2}
N 1720 -1070 1760 -1070 {
lab=z14}
N 1300 -870 1340 -870 {
lab=in15}
N 1300 -810 1340 -810 {
lab=clk2}
N 1300 -780 1340 -780 {
lab=clk1}
N 1730 -850 1770 -850 {
lab=z15}
N 1300 -640 1340 -640 {
lab=in16}
N 1300 -580 1340 -580 {
lab=clk1}
N 1300 -550 1340 -550 {
lab=clk2}
N 1730 -620 1770 -620 {
lab=z16}
N 1300 -420 1340 -420 {
lab=in17}
N 1300 -380 1340 -380 {
lab=clk1}
N 1300 -350 1340 -350 {
lab=clk1}
N 1840 -400 1880 -400 {
lab=z17}
N 1300 -230 1340 -230 {
lab=in18}
N 1300 -190 1340 -190 {
lab=clk2}
N 1300 -160 1340 -160 {
lab=clk2}
N 1840 -210 1880 -210 {
lab=z18}
N 1930 -1330 1970 -1330 {
lab=in19}
N 1930 -1290 1970 -1290 {
lab=clk2}
N 1930 -1260 1970 -1260 {
lab=clk1}
N 2360 -1310 2400 -1310 {
lab=z19}
N 1930 -1140 1970 -1140 {
lab=in20}
N 1930 -1100 1970 -1100 {
lab=clk1}
N 1930 -1070 1970 -1070 {
lab=clk2}
N 2360 -1120 2400 -1120 {
lab=z20}
N 1930 -950 1970 -950 {
lab=in21}
N 1930 -910 1970 -910 {
lab=clk1}
N 2400 -930 2440 -930 {
lab=z21}
C {yxt/latch_latch.sch} -10 -1140 0 0 {name=XL1L1 vcc=vcc vss=vss}
C {yxt/yxt_title.sym} 150 0 0 0 {name=l1 author="Stefan Schippers"}
C {devices/ipin.sym} 90 -1340 0 0 {name=p1 lab=in1}
C {devices/ipin.sym} 90 -1280 0 0 {name=p2 lab=clk1}
C {devices/opin.sym} 500 -1340 0 0 {name=p4 lab=z1}
C {yxt/latch_latch.sch} -10 -930 0 0 {name=XL2L2 vcc=vcc vss=vss}
C {devices/ipin.sym} 90 -1130 0 0 {name=p5 lab=in2}
C {devices/opin.sym} 500 -1130 0 0 {name=p8 lab=z2}
C {devices/lab_pin.sym} 90 -870 0 0 {name=l2 sig_type=std_logic lab=clk1}
C {devices/ipin.sym} 90 -1070 0 0 {name=p6 lab=clk2}
C {yxt/dyn_latch.sch} -10 -730 0 0 {name=XD1L2 vcc=vcc vss=vss}
C {devices/ipin.sym} 90 -930 0 0 {name=p9 lab=in3}
C {devices/lab_pin.sym} 90 -840 0 0 {name=l3 sig_type=std_logic lab=clk2}
C {devices/opin.sym} 500 -930 0 0 {name=p10 lab=z3}
C {devices/lab_pin.sym} 90 -660 0 0 {name=l4 sig_type=std_logic lab=clk2}
C {yxt/dyn_latch.sch} -10 -520 0 0 {name=XD2L1 vcc=vcc vss=vss}
C {devices/ipin.sym} 90 -720 0 0 {name=p11 lab=in4}
C {devices/lab_pin.sym} 90 -630 0 0 {name=l5 sig_type=std_logic lab=clk1}
C {devices/opin.sym} 500 -720 0 0 {name=p12 lab=z4}
C {yxt/dyn_dyn.sch} -10 -310 0 0 {name=XD2D1 vcc=vcc vss=vss}
C {devices/lab_pin.sym} 90 -450 0 0 {name=l6 sig_type=std_logic lab=clk2}
C {devices/ipin.sym} 90 -510 0 0 {name=p13 lab=in5}
C {devices/lab_pin.sym} 90 -420 0 0 {name=l7 sig_type=std_logic lab=clk1}
C {devices/opin.sym} 500 -510 0 0 {name=p14 lab=z5}
C {yxt/dyn_dyn.sch} -10 -100 0 0 {name=XD1D2 vcc=vcc vss=vss}
C {devices/lab_pin.sym} 90 -240 0 0 {name=l8 sig_type=std_logic lab=clk1}
C {devices/ipin.sym} 90 -300 0 0 {name=p15 lab=in6}
C {devices/lab_pin.sym} 90 -210 0 0 {name=l9 sig_type=std_logic lab=clk2}
C {devices/opin.sym} 500 -300 0 0 {name=p16 lab=z6}
C {yxt/latch_dyn.sch} 570 -1140 0 0 {name=XL1D1 vcc=vcc vss=vss}
C {devices/ipin.sym} 670 -1340 0 0 {name=p17 lab=in7}
C {devices/opin.sym} 1080 -1340 0 0 {name=p20 lab=z7}
C {yxt/latch_dyn.sch} 570 -910 0 0 {name=XL2D2 vcc=vcc vss=vss}
C {devices/ipin.sym} 670 -1110 0 0 {name=p21 lab=in8}
C {devices/opin.sym} 1080 -1110 0 0 {name=p24 lab=z8}
C {yxt/dyn_or.sch} 560 -690 0 0 {name=XDxGOy vcc=vcc vss=vss}
C {devices/ipin.sym} 660 -890 0 0 {name=p25 lab=in9}
C {devices/opin.sym} 1130 -870 0 0 {name=p28 lab=z9}
C {devices/ipin.sym} 660 -650 0 0 {name=p29 lab=in10}
C {devices/opin.sym} 1120 -630 0 0 {name=p32 lab=z10}
C {yxt/dyn_and.sch} 550 -450 0 0 {name=XDxGAy vcc=vcc vss=vss}
C {devices/lab_pin.sym} 670 -1280 0 0 {name=l10 sig_type=std_logic lab=clk1}
C {devices/lab_pin.sym} 670 -1250 0 0 {name=l11 sig_type=std_logic lab=clk1}
C {devices/lab_pin.sym} 670 -1050 0 0 {name=l14 sig_type=std_logic lab=clk2}
C {devices/lab_pin.sym} 670 -1020 0 0 {name=l15 sig_type=std_logic lab=clk2}
C {devices/lab_pin.sym} 660 -830 0 0 {name=l16 sig_type=std_logic lab=clk1}
C {devices/lab_pin.sym} 660 -800 0 0 {name=l17 sig_type=std_logic lab=clk2}
C {devices/lab_pin.sym} 660 -590 0 0 {name=l18 sig_type=std_logic lab=clk1}
C {devices/lab_pin.sym} 660 -560 0 0 {name=l19 sig_type=std_logic lab=clk2}
C {yxt/dyn_dyn_odd.sch} 560 -200 0 0 {name=XNMRD1 vcc=vcc vss=vss}
C {devices/ipin.sym} 660 -400 0 0 {name=p18 lab=in11}
C {devices/lab_pin.sym} 660 -340 0 0 {name=l12 sig_type=std_logic lab=clk1}
C {devices/lab_pin.sym} 660 -310 0 0 {name=l13 sig_type=std_logic lab=clk1}
C {devices/opin.sym} 1170 -400 0 0 {name=p19 lab=z11}
C {yxt/dyn_dyn_odd.sch} 560 30 0 0 {name=XNMRD2 vcc=vcc vss=vss}
C {devices/ipin.sym} 660 -170 0 0 {name=p22 lab=in12}
C {devices/lab_pin.sym} 660 -110 0 0 {name=l20 sig_type=std_logic lab=clk2}
C {devices/lab_pin.sym} 660 -80 0 0 {name=l21 sig_type=std_logic lab=clk2}
C {devices/opin.sym} 1170 -170 0 0 {name=p23 lab=z12}
C {yxt/latch_and.sch} 1190 -1130 0 0 {name=XL1GA1 vcc=vcc vss=vss}
C {devices/ipin.sym} 1290 -1330 0 0 {name=p26 lab=in13}
C {devices/lab_pin.sym} 1290 -1270 0 0 {name=l22 sig_type=std_logic lab=clk1}
C {devices/lab_pin.sym} 1290 -1240 0 0 {name=l23 sig_type=std_logic lab=clk1}
C {devices/opin.sym} 1760 -1310 0 0 {name=p27 lab=z13}
C {yxt/latch_and.sch} 1190 -890 0 0 {name=XL2GA2 vcc=vcc vss=vss}
C {devices/ipin.sym} 1290 -1090 0 0 {name=p30 lab=in14}
C {devices/lab_pin.sym} 1290 -1030 0 0 {name=l24 sig_type=std_logic lab=clk2}
C {devices/lab_pin.sym} 1290 -1000 0 0 {name=l25 sig_type=std_logic lab=clk2}
C {devices/opin.sym} 1760 -1070 0 0 {name=p31 lab=z14}
C {yxt/latch_or.sch} 1200 -670 0 0 {name=xL2GO1 vcc=vcc vss=vss}
C {devices/ipin.sym} 1300 -870 0 0 {name=p33 lab=in15}
C {devices/lab_pin.sym} 1300 -810 0 0 {name=l26 sig_type=std_logic lab=clk2}
C {devices/lab_pin.sym} 1300 -780 0 0 {name=l27 sig_type=std_logic lab=clk1}
C {devices/opin.sym} 1770 -850 0 0 {name=p34 lab=z15}
C {yxt/latch_or.sch} 1200 -440 0 0 {name=XL1GO2 vcc=vcc vss=vss}
C {devices/ipin.sym} 1300 -640 0 0 {name=p35 lab=in16}
C {devices/lab_pin.sym} 1300 -580 0 0 {name=l28 sig_type=std_logic lab=clk1}
C {devices/lab_pin.sym} 1300 -550 0 0 {name=l29 sig_type=std_logic lab=clk2}
C {devices/opin.sym} 1770 -620 0 0 {name=p36 lab=z16}
C {yxt/and_dyn_odd.sch} 1190 -260 0 0 {name=xNMRGA1 vcc=vcc vss=vss}
C {devices/ipin.sym} 1300 -420 0 0 {name=p37 lab=in17}
C {devices/lab_pin.sym} 1300 -380 0 0 {name=l30 sig_type=std_logic lab=clk1}
C {devices/lab_pin.sym} 1300 -350 0 0 {name=l31 sig_type=std_logic lab=clk1}
C {devices/opin.sym} 1880 -400 0 0 {name=p38 lab=z17}
C {yxt/and_dyn_odd.sch} 1190 -70 0 0 {name=xNMRGA2 vcc=vcc vss=vss}
C {devices/ipin.sym} 1300 -230 0 0 {name=p39 lab=in18}
C {devices/lab_pin.sym} 1300 -190 0 0 {name=l32 sig_type=std_logic lab=clk2}
C {devices/lab_pin.sym} 1300 -160 0 0 {name=l33 sig_type=std_logic lab=clk2}
C {devices/opin.sym} 1880 -210 0 0 {name=p40 lab=z18}
C {yxt/or_dyn_even.sch} 1820 -1170 0 0 {name=XNMRGO2 vcc=vcc vss=vss}
C {devices/ipin.sym} 1930 -1330 0 0 {name=p41 lab=in19}
C {devices/lab_pin.sym} 1930 -1290 0 0 {name=l34 sig_type=std_logic lab=clk2}
C {devices/lab_pin.sym} 1930 -1260 0 0 {name=l35 sig_type=std_logic lab=clk1}
C {devices/opin.sym} 2400 -1310 0 0 {name=p42 lab=z19}
C {yxt/or_dyn_even.sch} 1820 -980 0 0 {name=XNMRGO1 vcc=vcc vss=vss}
C {devices/ipin.sym} 1930 -1140 0 0 {name=p43 lab=in20}
C {devices/lab_pin.sym} 1930 -1100 0 0 {name=l36 sig_type=std_logic lab=clk1}
C {devices/lab_pin.sym} 1930 -1070 0 0 {name=l37 sig_type=std_logic lab=clk2}
C {devices/opin.sym} 2400 -1120 0 0 {name=p44 lab=z20}
C {yxt/cxly.sch} 1840 -790 0 0 {name=XCxLy vcc=vcc vss=vss}
C {devices/ipin.sym} 1930 -950 0 0 {name=p45 lab=in21}
C {devices/lab_pin.sym} 1930 -910 0 0 {name=l38 sig_type=std_logic lab=clk1}
C {devices/opin.sym} 2440 -930 0 0 {name=p46 lab=z21}
C {devices/lab_pin.sym} 90 -1250 0 0 {name=l39 sig_type=std_logic lab=clk1}
C {devices/lab_pin.sym} 90 -1040 0 0 {name=l40 sig_type=std_logic lab=clk2}
C {devices/code.sym} 1950 -790 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install

.subckt sky130_fd_sc_hd__inv_1 A VGND VNB VPB VPWR Y
X0 VGND A Y VNB sky130_fd_pr__nfet_01v8 w=650000u l=150000u
X1 VPWR A Y VPB sky130_fd_pr__pfet_01v8_hvt w=1e+06u l=150000u
.ends

.subckt sky130_fd_sc_hd__nand2_1 A B VGND VNB VPB VPWR Y
X0 Y A VPWR VPB sky130_fd_pr__pfet_01v8_hvt w=1e+06u l=150000u
X1 VPWR B Y VPB sky130_fd_pr__pfet_01v8_hvt w=1e+06u l=150000u
X2 VGND B a_113_47# VNB sky130_fd_pr__nfet_01v8 w=650000u l=150000u
X3 a_113_47# A Y VNB sky130_fd_pr__nfet_01v8 w=650000u l=150000u
.ends

.subckt sky130_fd_sc_hd__or2_0 A B VGND VNB VPB VPWR X
X0 VGND a_68_355# X VNB sky130_fd_pr__nfet_01v8 w=420000u l=150000u
X1 a_150_355# A VPWR VPB sky130_fd_pr__pfet_01v8_hvt w=420000u l=150000u
X2 VGND B a_68_355# VNB sky130_fd_pr__nfet_01v8 w=420000u l=150000u
X3 a_68_355# A VGND VNB sky130_fd_pr__nfet_01v8 w=420000u l=150000u
X4 a_68_355# B a_150_355# VPB sky130_fd_pr__pfet_01v8_hvt w=420000u l=150000u
X5 VPWR a_68_355# X VPB sky130_fd_pr__pfet_01v8_hvt w=640000u l=150000u
.ends

.subckt sky130_fd_sc_hd__buf_1 A VGND VNB VPB VPWR X
X0 VGND a_27_47# X VNB sky130_fd_pr__nfet_01v8 w=520000u l=150000u
X1 a_27_47# A VPWR VPB sky130_fd_pr__pfet_01v8_hvt w=790000u l=150000u
X2 a_27_47# A VGND VNB sky130_fd_pr__nfet_01v8 w=520000u l=150000u
X3 VPWR a_27_47# X VPB sky130_fd_pr__pfet_01v8_hvt w=790000u l=150000u
.ends

.subckt sky130_fd_sc_hd__and2_0 A B VGND VNB VPB VPWR X
X0 a_40_47# B VPWR VPB sky130_fd_pr__pfet_01v8_hvt w=420000u l=150000u
X1 a_123_47# B VGND VNB sky130_fd_pr__nfet_01v8 w=420000u l=150000u
X2 a_40_47# A a_123_47# VNB sky130_fd_pr__nfet_01v8 w=420000u l=150000u
X3 VGND a_40_47# X VNB sky130_fd_pr__nfet_01v8 w=420000u l=150000u
X4 VPWR A a_40_47# VPB sky130_fd_pr__pfet_01v8_hvt w=420000u l=150000u
X5 VPWR a_40_47# X VPB sky130_fd_pr__pfet_01v8_hvt w=640000u l=150000u
.ends

.subckt sky130_fd_sc_hd__clkbuf_1 A VGND VNB VPB VPWR X
X0 VGND A a_75_212# VNB sky130_fd_pr__nfet_01v8 w=520000u l=150000u
X1 X a_75_212# VPWR VPB sky130_fd_pr__pfet_01v8_hvt w=790000u l=150000u
X2 X a_75_212# VGND VNB sky130_fd_pr__nfet_01v8 w=520000u l=150000u
X3 VPWR A a_75_212# VPB sky130_fd_pr__pfet_01v8_hvt w=790000u l=150000u
.ends

"
spice_ignore=false}
