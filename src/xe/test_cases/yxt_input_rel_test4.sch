v {xschem version=3.1.0 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 780 -1080 840 -1080 {
lab=#net1}
N 330 -1230 380 -1230 {
lab=clkb}
N 330 -1160 380 -1160 {
lab=in1}
N 330 -1080 380 -1080 {
lab=clk}
N 330 -1000 380 -1000 {
lab=in2}
N 920 -1080 950 -1080 {
lab=#net2}
N 950 -1080 950 -1030 {
lab=#net2}
N 950 -1030 1010 -1030 {
lab=#net2}
N 940 -1180 1010 -1180 {
lab=clk}
N 1450 -1180 1540 -1180 {
lab=#net3}
N 1500 -1140 1540 -1140 {
lab=clk}
N 1500 -1140 1500 -1110 {
lab=clk}
N 1660 -1160 1710 -1160 {
lab=n4}
N 1790 -1160 1850 -1160 {
lab=n5}
N 1930 -1160 1990 -1160 {
lab=n6}
N 1900 -1290 1990 -1290 {
lab=clk}
N 2460 -1220 2490 -1220 {
lab=#net4}
N 2570 -1220 2600 -1220 {
lab=n8}
N 2560 -1290 2600 -1290 {
lab=clk}
N 3130 -1420 3190 -1420 {
lab=n9}
N 3270 -1420 3330 -1420 {
lab=n10}
N 260 -860 460 -860 {
lab=n10}
N 430 -820 460 -820 {
lab=clkb}
N 580 -840 630 -840 {
lab=n11}
N 710 -840 730 -840 {
lab=n12}
N 730 -840 730 -710 {
lab=n12}
N 730 -710 800 -710 {
lab=n12}
N 770 -840 800 -840 {
lab=clk}
N 1270 -770 1310 -770 {
lab=n13}
N 1390 -770 1460 -770 {
lab=out1}
N 390 -460 420 -460 {
lab=clk}
N 290 -860 290 -330 {
lab=n10}
N 290 -330 420 -330 {
lab=n10}
N 890 -390 970 -390 {
lab=n14}
N 1050 -390 1140 -390 {
lab=n15}
N 1220 -390 1300 -390 {
lab=n16}
N 1270 -470 1300 -470 {
lab=clk}
N 1700 -390 1760 -390 {
lab=n17}
N 1840 -390 1900 -390 {
lab=n18}
N 1870 -350 1900 -350 {
lab=clk}
N 2020 -370 2090 -370 {
lab=out2}
N 370 -90 400 -90 {
lab=clk}
N 290 -330 290 -130 {
lab=n10}
N 290 -130 400 -130 {
lab=n10}
N 520 -110 610 -110 {
lab=n19}
N 940 -160 970 -160 {
lab=clkb}
N 830 -80 970 -80 {
lab=n20}
N 830 -110 830 -80 {
lab=n20}
N 690 -110 830 -110 {
lab=n20}
N 1370 -80 1440 -80 {
lab=n21}
N 1520 -80 1580 -80 {
lab=n22}
N 1550 -40 1580 -40 {
lab=clk}
N 1700 -60 1780 -60 {
lab=n23}
N 1860 -60 1900 -60 {
lab=n24}
N 1900 -60 1900 360 {
lab=n24}
N 1900 360 1970 360 {
lab=n24}
N 1940 460 1970 460 {
lab=clk}
N 2680 -250 2740 -250 {
lab=n25}
N 2820 -250 2880 -250 {
lab=n26}
N 2850 -330 2880 -330 {
lab=clk}
N 3280 -250 3360 -250 {
lab=n27}
N 3430 -250 3470 -250 {
lab=out3}
N 1400 -80 1400 140 {
lab=n21}
N 330 140 1400 140 {
lab=n21}
N 330 140 330 310 {
lab=n21}
N 330 310 390 310 {
lab=n21}
N 470 310 540 310 {
lab=n28}
N 510 350 540 350 {
lab=clk}
N 660 330 700 330 {
lab=n29}
N 700 330 700 530 {
lab=n29}
N 700 530 800 530 {
lab=n29}
N 750 620 800 620 {
lab=in3}
N 1140 470 1270 470 {
lab=n30}
N 1140 530 1190 530 {
lab=in4}
N 1140 620 1190 620 {
lab=in5}
N 1670 470 1710 470 {
lab=n31}
N 1790 470 1810 470 {
lab=out4}
N 1810 470 1810 590 {
lab=out4}
N 1810 590 1860 590 {
lab=out4}
N 550 830 580 830 {
lab=clk}
N 330 310 330 960 {
lab=n21}
N 330 960 580 960 {
lab=n21}
N 1050 900 1130 900 {
lab=n32}
N 1210 900 1290 900 {
lab=n33}
N 1260 940 1290 940 {
lab=clkb}
N 1410 920 1490 920 {
lab=n34}
N 1460 960 1490 960 {
lab=clkb}
N 1610 940 1670 940 {
lab=n35}
N 1640 860 1670 860 {
lab=clkb}
N 2070 940 2150 940 {
lab=out5}
N 1240 390 1270 390 {
lab=clk}
C {yxt/mux.sch} 560 -1150 0 0 {name=x1 vcc=vcc vss=vss}
C {sky130_stdcells/inv_1.sym} 880 -1080 0 0 {name=x2 VGND=vss VNB=vss VPB=vcc VPWR=vcc prefix=sky130_fd_sc_hd__ }
C {devices/ipin.sym} 330 -1230 0 0 {name=p1 lab=clkb}
C {devices/ipin.sym} 330 -1160 0 0 {name=p2 lab=in1}
C {devices/ipin.sym} 330 -1080 0 0 {name=p3 lab=clk}
C {devices/ipin.sym} 330 -1000 0 0 {name=p4 lab=in2}
C {yxt/rs_nand_latch.sch} 1060 -1180 0 0 {name=x3 vcc=vcc vss=vss}
C {devices/lab_pin_yxt.sym} 940 -1180 0 0 {name=l1 sig_type=std_logic lab=clk}
C {sky130_stdcells/nand2_1.sym} 1600 -1160 0 0 {name=x4 VGND=vss VNB=vss VPB=vcc VPWR=vcc prefix=sky130_fd_sc_hd__ }
C {devices/lab_pin_yxt.sym} 1500 -1110 0 0 {name=l2 sig_type=std_logic lab=clk}
C {sky130_stdcells/inv_1.sym} 1750 -1160 0 0 {name=x5 VGND=vss VNB=vss VPB=vcc VPWR=vcc prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/inv_1.sym} 1890 -1160 0 0 {name=x6 VGND=vss VNB=vss VPB=vcc VPWR=vcc prefix=sky130_fd_sc_hd__ }
C {devices/lab_wire_yxt.sym} 1690 -1160 0 0 {name=l3 sig_type=std_logic lab=n4}
C {devices/lab_wire_yxt.sym} 1830 -1160 0 0 {name=l4 sig_type=std_logic lab=n5}
C {devices/lab_wire_yxt.sym} 1970 -1160 0 0 {name=l5 sig_type=std_logic lab=n6}
C {yxt/dyn.sch} 1850 -960 0 0 {name=x7 vcc=vcc vss=vss}
C {devices/lab_pin_yxt.sym} 1900 -1290 0 0 {name=l6 sig_type=std_logic lab=clk}
C {sky130_stdcells/inv_1.sym} 2530 -1220 0 0 {name=x8 VGND=vss VNB=vss VPB=vcc VPWR=vcc prefix=sky130_fd_sc_hd__ }
C {devices/lab_wire_yxt.sym} 2600 -1220 0 0 {name=l7 sig_type=std_logic lab=n8}
C {yxt/cascode_latch.sch} 2860 -1390 0 0 {name=x9 vcc=vcc vss=vss}
C {devices/lab_pin_yxt.sym} 2560 -1290 0 0 {name=l8 sig_type=std_logic lab=clk}
C {sky130_stdcells/inv_1.sym} 3230 -1420 0 0 {name=x10 VGND=vss VNB=vss VPB=vcc VPWR=vcc prefix=sky130_fd_sc_hd__ }
C {devices/lab_wire_yxt.sym} 3310 -1420 0 0 {name=l9 sig_type=std_logic lab=n10}
C {devices/lab_wire_yxt.sym} 3170 -1420 0 0 {name=l10 sig_type=std_logic lab=n9}
C {sky130_stdcells/nor2_1.sym} 520 -840 0 0 {name=x11 VGND=vss VNB=vss VPB=vcc VPWR=vcc prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/inv_1.sym} 670 -840 0 0 {name=x12 VGND=vss VNB=vss VPB=vcc VPWR=vcc prefix=sky130_fd_sc_hd__ }
C {devices/lab_pin_yxt.sym} 430 -820 0 0 {name=l13 sig_type=std_logic lab=clkb}
C {devices/lab_wire_yxt.sym} 620 -840 0 0 {name=l12 sig_type=std_logic lab=n11}
C {yxt/dyn.sch} 660 -510 0 0 {name=x13 vcc=vcc vss=vss}
C {devices/lab_wire_yxt.sym} 770 -710 0 0 {name=l14 sig_type=std_logic lab=n12}
C {devices/lab_pin_yxt.sym} 770 -840 0 0 {name=l15 sig_type=std_logic lab=clk}
C {sky130_stdcells/inv_1.sym} 1350 -770 0 0 {name=x14 VGND=vss VNB=vss VPB=vcc VPWR=vcc prefix=sky130_fd_sc_hd__ }
C {devices/lab_wire_yxt.sym} 1300 -770 0 0 {name=l16 sig_type=std_logic lab=n13}
C {devices/opin.sym} 1460 -770 0 0 {name=p5 lab=out1}
C {yxt/dyn.sch} 280 -130 0 0 {name=x15 vcc=vcc vss=vss}
C {devices/lab_pin_yxt.sym} 390 -460 0 0 {name=l17 sig_type=std_logic lab=clk}
C {devices/lab_wire_yxt.sym} 260 -860 0 0 {name=l18 sig_type=std_logic lab=n10}
C {devices/lab_wire_yxt.sym} 930 -390 0 0 {name=l11 sig_type=std_logic lab=n14}
C {sky130_stdcells/inv_1.sym} 1010 -390 0 0 {name=x16 VGND=vss VNB=vss VPB=vcc VPWR=vcc prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/inv_1.sym} 1180 -390 0 0 {name=x17 VGND=vss VNB=vss VPB=vcc VPWR=vcc prefix=sky130_fd_sc_hd__ }
C {yxt/latch.sch} 1220 -180 0 0 {name=x18 vcc=vcc vss=vss}
C {devices/lab_wire_yxt.sym} 1100 -390 0 0 {name=l19 sig_type=std_logic lab=n15}
C {devices/lab_wire_yxt.sym} 1260 -390 0 0 {name=l20 sig_type=std_logic lab=n16}
C {devices/lab_pin_yxt.sym} 1270 -470 0 0 {name=l21 sig_type=std_logic lab=clk}
C {sky130_stdcells/inv_1.sym} 1800 -390 0 0 {name=x19 VGND=vss VNB=vss VPB=vcc VPWR=vcc prefix=sky130_fd_sc_hd__ }
C {devices/lab_wire_yxt.sym} 1750 -390 0 0 {name=l22 sig_type=std_logic lab=n17}
C {devices/lab_wire_yxt.sym} 1870 -390 0 0 {name=l23 sig_type=std_logic lab=n18}
C {sky130_stdcells/nand2_1.sym} 1960 -370 0 0 {name=x20 VGND=vss VNB=vss VPB=vcc VPWR=vcc prefix=sky130_fd_sc_hd__ }
C {devices/lab_pin_yxt.sym} 1870 -350 0 0 {name=l24 sig_type=std_logic lab=clk}
C {devices/opin.sym} 2090 -370 0 0 {name=p6 lab=out2}
C {sky130_stdcells/nor2_1.sym} 460 -110 0 0 {name=x21 VGND=vss VNB=vss VPB=vcc VPWR=vcc prefix=sky130_fd_sc_hd__ }
C {devices/lab_pin_yxt.sym} 370 -90 0 0 {name=l25 sig_type=std_logic lab=clk}
C {devices/lab_wire_yxt.sym} 560 -110 0 0 {name=l26 sig_type=std_logic lab=n19}
C {sky130_stdcells/inv_1.sym} 650 -110 0 0 {name=x22 VGND=vss VNB=vss VPB=vcc VPWR=vcc prefix=sky130_fd_sc_hd__ }
C {devices/lab_wire_yxt.sym} 730 -110 0 0 {name=l27 sig_type=std_logic lab=n20}
C {yxt/latch.sch} 890 130 0 0 {name=x23 vcc=vcc vss=vss}
C {devices/lab_pin_yxt.sym} 940 -160 0 0 {name=l28 sig_type=std_logic lab=clkb}
C {devices/lab_wire_yxt.sym} 1420 -80 0 0 {name=l29 sig_type=std_logic lab=n21}
C {sky130_stdcells/inv_1.sym} 1480 -80 0 0 {name=x24 VGND=vss VNB=vss VPB=vcc VPWR=vcc prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/nor2_1.sym} 1640 -60 0 0 {name=x25 VGND=vss VNB=vss VPB=vcc VPWR=vcc prefix=sky130_fd_sc_hd__ }
C {devices/lab_wire_yxt.sym} 1550 -80 0 0 {name=l30 sig_type=std_logic lab=n22}
C {devices/lab_pin_yxt.sym} 1550 -40 0 0 {name=l31 sig_type=std_logic lab=clk}
C {devices/lab_wire_yxt.sym} 1740 -60 0 0 {name=l32 sig_type=std_logic lab=n23}
C {sky130_stdcells/inv_1.sym} 1820 -60 0 0 {name=x26 VGND=vss VNB=vss VPB=vcc VPWR=vcc prefix=sky130_fd_sc_hd__ }
C {yxt/sa_latch.sch} 2260 -220 0 0 {name=x27 vcc=vcc vss=vss}
C {devices/lab_pin_yxt.sym} 1940 460 0 0 {name=l33 sig_type=std_logic lab=clk}
C {devices/lab_wire_yxt.sym} 1900 -60 0 0 {name=l34 sig_type=std_logic lab=n24}
C {sky130_stdcells/inv_1.sym} 2780 -250 0 0 {name=x28 VGND=vss VNB=vss VPB=vcc VPWR=vcc prefix=sky130_fd_sc_hd__ }
C {devices/lab_wire_yxt.sym} 2720 -250 0 0 {name=l35 sig_type=std_logic lab=n25}
C {devices/lab_wire_yxt.sym} 2860 -250 0 0 {name=l36 sig_type=std_logic lab=n26}
C {yxt/latch.sch} 2800 -40 0 0 {name=x29 vcc=vcc vss=vss}
C {devices/lab_pin_yxt.sym} 2850 -330 0 0 {name=l37 sig_type=std_logic lab=clk}
C {sky130_stdcells/inv_1.sym} 3390 -250 0 0 {name=x30 VGND=vss VNB=vss VPB=vcc VPWR=vcc prefix=sky130_fd_sc_hd__ }
C {devices/opin.sym} 3470 -250 0 0 {name=p7 lab=out3}
C {devices/lab_wire_yxt.sym} 3330 -250 0 0 {name=l38 sig_type=std_logic lab=n27}
C {yxt/cplx.sch} 870 420 0 0 {name=x33 vcc=vcc vss=vss}
C {sky130_stdcells/nor2_1.sym} 600 330 0 0 {name=x32 VGND=vss VNB=vss VPB=vcc VPWR=vcc prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/inv_1.sym} 430 310 0 0 {name=x31 VGND=vss VNB=vss VPB=vcc VPWR=vcc prefix=sky130_fd_sc_hd__ }
C {yxt/latch.sch} 1190 680 0 0 {name=x34 vcc=vcc vss=vss}
C {sky130_stdcells/inv_1.sym} 1750 470 0 0 {name=x35 VGND=vss VNB=vss VPB=vcc VPWR=vcc prefix=sky130_fd_sc_hd__ }
C {devices/lab_wire_yxt.sym} 510 310 0 0 {name=l39 sig_type=std_logic lab=n28}
C {devices/lab_pin_yxt.sym} 510 350 0 0 {name=l40 sig_type=std_logic lab=clk}
C {devices/ipin.sym} 750 620 0 0 {name=p8 lab=in3}
C {devices/lab_wire_yxt.sym} 770 530 0 0 {name=l41 sig_type=std_logic lab=n29}
C {devices/lab_wire_yxt.sym} 1230 470 0 0 {name=l42 sig_type=std_logic lab=n30}
C {devices/ipin.sym} 1190 530 0 1 {name=p9 lab=in4}
C {devices/ipin.sym} 1190 620 0 1 {name=p10 lab=in5}
C {devices/lab_wire_yxt.sym} 1710 470 0 0 {name=l43 sig_type=std_logic lab=n31}
C {devices/opin.sym} 1860 590 0 0 {name=p11 lab=out4}
C {yxt/dyn.sch} 440 1160 0 0 {name=x36 vcc=vcc vss=vss}
C {devices/lab_pin_yxt.sym} 550 830 0 0 {name=l44 sig_type=std_logic lab=clk}
C {sky130_stdcells/inv_1.sym} 1170 900 0 0 {name=x37 VGND=vss VNB=vss VPB=vcc VPWR=vcc prefix=sky130_fd_sc_hd__ }
C {devices/lab_wire_yxt.sym} 1100 900 0 0 {name=l45 sig_type=std_logic lab=n32}
C {devices/lab_wire_yxt.sym} 1260 900 0 0 {name=l46 sig_type=std_logic lab=n33}
C {sky130_stdcells/nor2_1.sym} 1350 920 0 0 {name=x38 VGND=vss VNB=vss VPB=vcc VPWR=vcc prefix=sky130_fd_sc_hd__ }
C {devices/lab_pin_yxt.sym} 1260 940 0 0 {name=l47 sig_type=std_logic lab=clkb}
C {sky130_stdcells/nand2_1.sym} 1550 940 0 0 {name=x39 VGND=vss VNB=vss VPB=vcc VPWR=vcc prefix=sky130_fd_sc_hd__ }
C {devices/lab_wire_yxt.sym} 1460 920 0 0 {name=l48 sig_type=std_logic lab=n34}
C {devices/lab_pin_yxt.sym} 1460 960 0 0 {name=l49 sig_type=std_logic lab=clkb}
C {yxt/latch.sch} 1590 1150 0 0 {name=x40 vcc=vcc vss=vss}
C {devices/lab_pin_yxt.sym} 1640 860 0 0 {name=l50 sig_type=std_logic lab=clkb}
C {devices/lab_wire_yxt.sym} 1650 940 0 0 {name=l51 sig_type=std_logic lab=n35}
C {devices/opin.sym} 2150 940 0 0 {name=p12 lab=out5}
C {yxt/yxt_title.sym} 260 1200 0 0 {name=l52 author="Joanne Low"}
C {devices/code.sym} 2100 -850 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install

.subckt sky130_fd_sc_hd__inv_1 A VGND VNB VPB VPWR Y
M0 VGND A Y VNB sky130_fd_pr__nfet_01v8 w=650000u l=150000u
M1 VPWR A Y VPB sky130_fd_pr__pfet_01v8_hvt w=1e+06u l=150000u
.ends

.subckt sky130_fd_sc_hd__nand2_1 A B VGND VNB VPB VPWR Y
M0 Y A VPWR VPB sky130_fd_pr__pfet_01v8_hvt w=1e+06u l=150000u
M1 VPWR B Y VPB sky130_fd_pr__pfet_01v8_hvt w=1e+06u l=150000u
M2 VGND B a_113_47# VNB sky130_fd_pr__nfet_01v8 w=650000u l=150000u
M3 a_113_47# A Y VNB sky130_fd_pr__nfet_01v8 w=650000u l=150000u
.ends

.SUBCKT sky130_fd_sc_hd__nor2_1 A B VGND VNB VPB VPWR Y
*.PININFO A:I B:I VGND:I VNB:I VPB:I VPWR:I Y:O
MMP0 VPWR A sndPA VPB sky130_fd_pr__pfet_01v8_hvt m=1 w=1.0 l=0.15 mult=1 sa=0.265
+ sb=0.265 sd=0.28 topography=normal area=0.063 perim=1.14
MMP1 sndPA B Y VPB sky130_fd_pr__pfet_01v8_hvt m=1 w=1.0 l=0.15 mult=1 sa=0.265
+ sb=0.265 sd=0.28 topography=normal area=0.063 perim=1.14
MMN0 Y A VGND VNB sky130_fd_pr__nfet_01v8 m=1 w=0.65 l=0.15 mult=1 sa=0.265 sb=0.265
+ sd=0.28 topography=normal area=0.063 perim=1.14
MMN1 Y B VGND VNB sky130_fd_pr__nfet_01v8 m=1 w=0.65 l=0.15 mult=1 sa=0.265 sb=0.265
+ sd=0.28 topography=normal area=0.063 perim=1.14
.ENDS sky130_fd_sc_hd__nor2_1

"
spice_ignore=false}
C {devices/lab_pin_yxt.sym} 1240 390 0 0 {name=l53 sig_type=std_logic lab=clk}
