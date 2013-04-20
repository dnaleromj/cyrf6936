//POVRay-File created by 3d41.ulp v###VERSIONDUMMY###
///Users/jmoreland/.dropbox-alt/Dropbox/Projects/quadcopter/cyrf6936/cyrf6936-BoB/cyrf6936-bob.brd
//4/20/13 12:20 AM

#version 3.5;

//Set to on if the file should be used as .inc
#local use_file_as_inc = off;
#if(use_file_as_inc=off)


//changes the apperance of resistors (1 Blob / 0 real)
#declare global_res_shape = 1;
//randomize color of resistors 1=random 0=same color
#declare global_res_colselect = 0;
//Number of the color for the resistors
//0=Green, 1="normal color" 2=Blue 3=Brown
#declare global_res_col = 1;
//Set to on if you want to render the PCB upside-down
#declare pcb_upsidedown = off;
//Set to x or z to rotate around the corresponding axis (referring to pcb_upsidedown)
#declare pcb_rotdir = x;
//Set the length off short pins over the PCB
#declare pin_length = 2.5;
#declare global_diode_bend_radius = 1;
#declare global_res_bend_radius = 1;
#declare global_solder = on;

#declare global_show_screws = on;
#declare global_show_washers = on;
#declare global_show_nuts = on;

#declare global_use_radiosity = on;

#declare global_ambient_mul = 1;
#declare global_ambient_mul_emit = 0;

//Animation
#declare global_anim = off;
#local global_anim_showcampath = no;

#declare global_fast_mode = off;

#declare col_preset = 0;
#declare pin_short = on;

#declare e3d_environment = off;

#local cam_x = 0;
#local cam_y = 132;
#local cam_z = -70;
#local cam_a = 20;
#local cam_look_x = 0;
#local cam_look_y = -3;
#local cam_look_z = 0;

#local pcb_rotate_x = 10;
#local pcb_rotate_y = 0;
#local pcb_rotate_z = 10;

#local pcb_board = on;
#local pcb_parts = on;
#local pcb_wire_bridges = off;
#if(global_fast_mode=off)
	#local pcb_polygons = on;
	#local pcb_silkscreen = on;
	#local pcb_wires = on;
	#local pcb_pads_smds = on;
#else
	#local pcb_polygons = off;
	#local pcb_silkscreen = off;
	#local pcb_wires = off;
	#local pcb_pads_smds = off;
#end

#local lgt1_pos_x = 6;
#local lgt1_pos_y = 17;
#local lgt1_pos_z = 16;
#local lgt1_intense = 0.708085;
#local lgt2_pos_x = -6;
#local lgt2_pos_y = 17;
#local lgt2_pos_z = 16;
#local lgt2_intense = 0.708085;
#local lgt3_pos_x = 6;
#local lgt3_pos_y = 17;
#local lgt3_pos_z = -11;
#local lgt3_intense = 0.708085;
#local lgt4_pos_x = -6;
#local lgt4_pos_y = 17;
#local lgt4_pos_z = -11;
#local lgt4_intense = 0.708085;

//Do not change these values
#declare pcb_height = 1.500000;
#declare pcb_cuheight = 0.035000;
#declare pcb_x_size = 18.415000;
#declare pcb_y_size = 30.734000;
#declare pcb_layer1_used = 1;
#declare pcb_layer16_used = 1;
#declare inc_testmode = off;
#declare global_seed=seed(961);
#declare global_pcb_layer_dis = array[16]
{
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	1.535000,
}
#declare global_pcb_real_hole = 0.010000;

#include "e3d_tools.inc"
#include "e3d_user.inc"

global_settings{charset utf8}

#declare col_brd = texture{pigment{Gray30}}
#declare col_wrs = texture{pigment{Gray70}}
#declare col_pds = texture{T_Silver_5A}
#declare col_hls = texture{pigment{Gray50}}
#declare col_bgr = White;
#declare col_slk = texture{pigment{Gray10}}
#declare col_thl = texture{pigment{Gray50}}
#declare col_pol = texture{pigment{Gray70}}

#if(e3d_environment=on)
sky_sphere {pigment {Navy}
pigment {bozo turbulence 0.65 octaves 7 omega 0.7 lambda 2
color_map {
[0.0 0.1 color rgb <0.85, 0.85, 0.85> color rgb <0.75, 0.75, 0.75>]
[0.1 0.5 color rgb <0.75, 0.75, 0.75> color rgbt <1, 1, 1, 1>]
[0.5 1.0 color rgbt <1, 1, 1, 1> color rgbt <1, 1, 1, 1>]}
scale <0.1, 0.5, 0.1>} rotate -90*x}
plane{y, -10.0-max(pcb_x_size,pcb_y_size)*abs(max(sin((pcb_rotate_x/180)*pi),sin((pcb_rotate_z/180)*pi)))
texture{T_Chrome_2D
normal{waves 0.1 frequency 3000.0 scale 3000.0}} translate<0,0,0>}
#end

//Animation data
#if(global_anim=on)
#declare global_anim_showcampath = no;
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#declare global_anim_npoints_cam_flight=0;
#warning "No/not enough Animation Data available (min. 3 points) (Flight path)"
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#declare global_anim_npoints_cam_view=0;
#warning "No/not enough Animation Data available (min. 3 points) (View path)"
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#end

#if((global_anim_showcampath=yes)&(global_anim=off))
#end
#if(global_anim=on)
camera
{
	location global_anim_spline_cam_flight(clock)
	#if(global_anim_npoints_cam_view>2)
		look_at global_anim_spline_cam_view(clock)
	#else
		look_at global_anim_spline_cam_flight(clock+0.01)-<0,-0.01,0>
	#end
	angle 45
}
light_source
{
	global_anim_spline_cam_flight(clock)
	color rgb <1,1,1>
	spotlight point_at 
	#if(global_anim_npoints_cam_view>2)
		global_anim_spline_cam_view(clock)
	#else
		global_anim_spline_cam_flight(clock+0.01)-<0,-0.01,0>
	#end
	radius 35 falloff  40
}
#else
camera
{
	location <cam_x,cam_y,cam_z>
	look_at <cam_look_x,cam_look_y,cam_look_z>
	angle cam_a
	//translates the camera that <0,0,0> is over the Eagle <0,0>
	//translate<-9.207500,0,-15.367000>
}
#end

background{col_bgr}
light_source{<lgt1_pos_x,lgt1_pos_y,lgt1_pos_z> White*lgt1_intense}
light_source{<lgt2_pos_x,lgt2_pos_y,lgt2_pos_z> White*lgt2_intense}
light_source{<lgt3_pos_x,lgt3_pos_y,lgt3_pos_z> White*lgt3_intense}
light_source{<lgt4_pos_x,lgt4_pos_y,lgt4_pos_z> White*lgt4_intense}
#end


#macro CYRF6936_BOB(mac_x_ver,mac_y_ver,mac_z_ver,mac_x_rot,mac_y_rot,mac_z_rot)
union{
#if(pcb_board = on)
difference{
union{
//Board
prism{-1.500000,0.000000,8
<8.890000,7.366000><27.305000,7.366000>
<27.305000,7.366000><27.305000,38.100000>
<27.305000,38.100000><8.890000,38.100000>
<8.890000,38.100000><8.890000,7.366000>
texture{col_brd}}
}//End union(PCB)
//Holes(real)/Parts
//Holes(real)/Board
//Holes(real)/Vias
cylinder{<10.414000,0.095000,8.382000><10.414000,-1.595000,8.382000>0.152400 texture{col_hls}}
cylinder{<10.414000,0.095000,10.820400><10.414000,-1.595000,10.820400>0.152400 texture{col_hls}}
cylinder{<10.414000,0.095000,13.360400><10.414000,-1.595000,13.360400>0.152400 texture{col_hls}}
cylinder{<10.414000,0.095000,15.900400><10.414000,-1.595000,15.900400>0.152400 texture{col_hls}}
cylinder{<10.414000,0.095000,18.440400><10.414000,-1.595000,18.440400>0.152400 texture{col_hls}}
cylinder{<10.414000,0.095000,20.980400><10.414000,-1.595000,20.980400>0.152400 texture{col_hls}}
cylinder{<10.414000,0.095000,23.418800><10.414000,-1.595000,23.418800>0.152400 texture{col_hls}}
cylinder{<10.414000,0.095000,26.162000><10.414000,-1.595000,26.162000>0.152400 texture{col_hls}}
cylinder{<10.414000,0.095000,27.178000><10.414000,-1.595000,27.178000>0.152400 texture{col_hls}}
cylinder{<10.414000,0.095000,28.702000><10.414000,-1.595000,28.702000>0.152400 texture{col_hls}}
cylinder{<11.684000,0.095000,28.702000><11.684000,-1.595000,28.702000>0.152400 texture{col_hls}}
cylinder{<12.954000,0.095000,28.702000><12.954000,-1.595000,28.702000>0.152400 texture{col_hls}}
cylinder{<13.385800,0.095000,25.146000><13.385800,-1.595000,25.146000>0.152400 texture{col_hls}}
cylinder{<13.462000,0.095000,8.382000><13.462000,-1.595000,8.382000>0.152400 texture{col_hls}}
cylinder{<13.462000,0.095000,17.526000><13.462000,-1.595000,17.526000>0.152400 texture{col_hls}}
cylinder{<13.462000,0.095000,21.590000><13.462000,-1.595000,21.590000>0.152400 texture{col_hls}}
cylinder{<13.462000,0.095000,27.178000><13.462000,-1.595000,27.178000>0.152400 texture{col_hls}}
cylinder{<13.741400,0.095000,15.036800><13.741400,-1.595000,15.036800>0.152400 texture{col_hls}}
cylinder{<13.893800,0.095000,22.809200><13.893800,-1.595000,22.809200>0.152400 texture{col_hls}}
cylinder{<14.122400,0.095000,16.408400><14.122400,-1.595000,16.408400>0.152400 texture{col_hls}}
cylinder{<14.224000,0.095000,11.125200><14.224000,-1.595000,11.125200>0.152400 texture{col_hls}}
cylinder{<14.224000,0.095000,28.702000><14.224000,-1.595000,28.702000>0.152400 texture{col_hls}}
cylinder{<14.655800,0.095000,29.972000><14.655800,-1.595000,29.972000>0.190500 texture{col_hls}}
cylinder{<15.113000,0.095000,26.289000><15.113000,-1.595000,26.289000>0.152400 texture{col_hls}}
cylinder{<15.494000,0.095000,8.382000><15.494000,-1.595000,8.382000>0.152400 texture{col_hls}}
cylinder{<15.494000,0.095000,28.702000><15.494000,-1.595000,28.702000>0.152400 texture{col_hls}}
cylinder{<15.773400,0.095000,15.265400><15.773400,-1.595000,15.265400>0.152400 texture{col_hls}}
cylinder{<16.002000,0.095000,18.059400><16.002000,-1.595000,18.059400>0.152400 texture{col_hls}}
cylinder{<16.002000,0.095000,18.923000><16.002000,-1.595000,18.923000>0.152400 texture{col_hls}}
cylinder{<16.002000,0.095000,19.812000><16.002000,-1.595000,19.812000>0.152400 texture{col_hls}}
cylinder{<16.002000,0.095000,20.675600><16.002000,-1.595000,20.675600>0.152400 texture{col_hls}}
cylinder{<16.002000,0.095000,21.564600><16.002000,-1.595000,21.564600>0.152400 texture{col_hls}}
cylinder{<16.002000,0.095000,27.178000><16.002000,-1.595000,27.178000>0.152400 texture{col_hls}}
cylinder{<16.764000,0.095000,28.702000><16.764000,-1.595000,28.702000>0.152400 texture{col_hls}}
cylinder{<16.865600,0.095000,18.059400><16.865600,-1.595000,18.059400>0.152400 texture{col_hls}}
cylinder{<16.865600,0.095000,18.923000><16.865600,-1.595000,18.923000>0.152400 texture{col_hls}}
cylinder{<16.865600,0.095000,19.812000><16.865600,-1.595000,19.812000>0.152400 texture{col_hls}}
cylinder{<16.865600,0.095000,20.675600><16.865600,-1.595000,20.675600>0.152400 texture{col_hls}}
cylinder{<16.865600,0.095000,21.564600><16.865600,-1.595000,21.564600>0.152400 texture{col_hls}}
cylinder{<17.449800,0.095000,11.938000><17.449800,-1.595000,11.938000>0.152400 texture{col_hls}}
cylinder{<17.729200,0.095000,18.059400><17.729200,-1.595000,18.059400>0.152400 texture{col_hls}}
cylinder{<17.729200,0.095000,18.923000><17.729200,-1.595000,18.923000>0.152400 texture{col_hls}}
cylinder{<17.729200,0.095000,19.812000><17.729200,-1.595000,19.812000>0.152400 texture{col_hls}}
cylinder{<17.729200,0.095000,20.675600><17.729200,-1.595000,20.675600>0.152400 texture{col_hls}}
cylinder{<17.729200,0.095000,21.564600><17.729200,-1.595000,21.564600>0.152400 texture{col_hls}}
cylinder{<18.034000,0.095000,28.702000><18.034000,-1.595000,28.702000>0.152400 texture{col_hls}}
cylinder{<18.592800,0.095000,18.059400><18.592800,-1.595000,18.059400>0.152400 texture{col_hls}}
cylinder{<18.592800,0.095000,18.923000><18.592800,-1.595000,18.923000>0.152400 texture{col_hls}}
cylinder{<18.592800,0.095000,19.812000><18.592800,-1.595000,19.812000>0.152400 texture{col_hls}}
cylinder{<18.592800,0.095000,20.675600><18.592800,-1.595000,20.675600>0.152400 texture{col_hls}}
cylinder{<18.592800,0.095000,21.564600><18.592800,-1.595000,21.564600>0.152400 texture{col_hls}}
cylinder{<18.897600,0.095000,8.382000><18.897600,-1.595000,8.382000>0.152400 texture{col_hls}}
cylinder{<18.897600,0.095000,10.922000><18.897600,-1.595000,10.922000>0.152400 texture{col_hls}}
cylinder{<19.304000,0.095000,28.702000><19.304000,-1.595000,28.702000>0.152400 texture{col_hls}}
cylinder{<19.456400,0.095000,15.265400><19.456400,-1.595000,15.265400>0.152400 texture{col_hls}}
cylinder{<19.456400,0.095000,18.059400><19.456400,-1.595000,18.059400>0.152400 texture{col_hls}}
cylinder{<19.456400,0.095000,18.923000><19.456400,-1.595000,18.923000>0.152400 texture{col_hls}}
cylinder{<19.456400,0.095000,19.812000><19.456400,-1.595000,19.812000>0.152400 texture{col_hls}}
cylinder{<19.456400,0.095000,20.675600><19.456400,-1.595000,20.675600>0.152400 texture{col_hls}}
cylinder{<19.456400,0.095000,21.564600><19.456400,-1.595000,21.564600>0.152400 texture{col_hls}}
cylinder{<19.481800,0.095000,11.938000><19.481800,-1.595000,11.938000>0.152400 texture{col_hls}}
cylinder{<20.828000,0.095000,13.462000><20.828000,-1.595000,13.462000>0.152400 texture{col_hls}}
cylinder{<22.377400,0.095000,17.094200><22.377400,-1.595000,17.094200>0.152400 texture{col_hls}}
cylinder{<23.114000,0.095000,28.702000><23.114000,-1.595000,28.702000>0.152400 texture{col_hls}}
cylinder{<23.495000,0.095000,17.145000><23.495000,-1.595000,17.145000>0.152400 texture{col_hls}}
cylinder{<23.596600,0.095000,8.382000><23.596600,-1.595000,8.382000>0.152400 texture{col_hls}}
cylinder{<23.622000,0.095000,10.922000><23.622000,-1.595000,10.922000>0.152400 texture{col_hls}}
cylinder{<23.622000,0.095000,13.462000><23.622000,-1.595000,13.462000>0.152400 texture{col_hls}}
cylinder{<23.622000,0.095000,15.621000><23.622000,-1.595000,15.621000>0.152400 texture{col_hls}}
cylinder{<23.622000,0.095000,21.590000><23.622000,-1.595000,21.590000>0.152400 texture{col_hls}}
cylinder{<24.130000,0.095000,28.702000><24.130000,-1.595000,28.702000>0.152400 texture{col_hls}}
cylinder{<25.273000,0.095000,28.702000><25.273000,-1.595000,28.702000>0.152400 texture{col_hls}}
cylinder{<26.416000,0.095000,28.702000><26.416000,-1.595000,28.702000>0.152400 texture{col_hls}}
cylinder{<26.670000,0.095000,8.382000><26.670000,-1.595000,8.382000>0.152400 texture{col_hls}}
cylinder{<26.670000,0.095000,10.922000><26.670000,-1.595000,10.922000>0.152400 texture{col_hls}}
cylinder{<26.670000,0.095000,13.462000><26.670000,-1.595000,13.462000>0.152400 texture{col_hls}}
cylinder{<26.670000,0.095000,16.002000><26.670000,-1.595000,16.002000>0.152400 texture{col_hls}}
cylinder{<26.670000,0.095000,18.542000><26.670000,-1.595000,18.542000>0.152400 texture{col_hls}}
cylinder{<26.670000,0.095000,21.082000><26.670000,-1.595000,21.082000>0.152400 texture{col_hls}}
cylinder{<26.670000,0.095000,23.622000><26.670000,-1.595000,23.622000>0.152400 texture{col_hls}}
cylinder{<26.670000,0.095000,25.654000><26.670000,-1.595000,25.654000>0.152400 texture{col_hls}}
cylinder{<26.670000,0.095000,27.178000><26.670000,-1.595000,27.178000>0.152400 texture{col_hls}}
}//End difference(reale Bohrungen/Durchbrüche)
#end
#if(pcb_parts=on)//Parts
union{
#ifndef(pack_C1) #declare global_pack_C1=yes; object {CAP_SMD_CHIP_0402()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<21.920200,0.000000,25.806400>translate<0,0.035000,0> }#end		//SMD Capacitor 0402 C1 15pF 0402-CAP
#ifndef(pack_C3) #declare global_pack_C3=yes; object {CAP_SMD_CHIP_0402()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<18.262600,0.000000,25.146000>translate<0,0.035000,0> }#end		//SMD Capacitor 0402 C3 2.0pF 0402-CAP
#ifndef(pack_C4) #declare global_pack_C4=yes; object {CAP_SMD_CHIP_0402()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<21.259800,0.000000,28.117800>translate<0,0.035000,0> }#end		//SMD Capacitor 0402 C4 1.5pF 0402-CAP
#ifndef(pack_C5) #declare global_pack_C5=yes; object {CAP_SMD_CHIP_0402()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<17.449800,0.000000,13.665200>translate<0,0.035000,0> }#end		//SMD Capacitor 0402 C5 0.47uF 0402-CAP
#ifndef(pack_C6) #declare global_pack_C6=yes; object {CAP_SMD_CHIP_0402()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<15.011400,0.000000,25.146000>translate<0,0.035000,0> }#end		//SMD Capacitor 0402 C6 0.047uF 0402-CAP
#ifndef(pack_C7) #declare global_pack_C7=yes; object {CAP_SMD_CHIP_0402()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<22.529800,0.000000,18.821400>translate<0,0.035000,0> }#end		//SMD Capacitor 0402 C7 0.047uF 0402-CAP
#ifndef(pack_C8) #declare global_pack_C8=yes; object {CAP_SMD_CHIP_0402()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<14.401800,0.000000,14.300200>translate<0,0.035000,0> }#end		//SMD Capacitor 0402 C8 0.047uF 0402-CAP
#ifndef(pack_C9) #declare global_pack_C9=yes; object {CAP_SMD_CHIP_0402()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<19.456400,0.000000,13.665200>translate<0,0.035000,0> }#end		//SMD Capacitor 0402 C9 0.047uF 0402-CAP
#ifndef(pack_C10) #declare global_pack_C10=yes; object {CAP_SMD_CHIP_0402()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<23.723600,0.000000,18.821400>translate<0,0.035000,0> }#end		//SMD Capacitor 0402 C10 0.047uF 0402-CAP
#ifndef(pack_C11) #declare global_pack_C11=yes; object {CAP_SMD_CHIP_0402()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<22.529800,0.000000,21.844000>translate<0,0.035000,0> }#end		//SMD Capacitor 0402 C11 0.047uF 0402-CAP
#ifndef(pack_C14) #declare global_pack_C14=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<14.325600,0.000000,10.261600>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C14 2.2uF 0805
#ifndef(pack_C15) #declare global_pack_C15=yes; object {CAP_SMD_CHIP_0402()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<14.401800,0.000000,12.801600>translate<0,0.035000,0> }#end		//SMD Capacitor 0402 C15 0.47uF 0402-CAP
#ifndef(pack_CYRF6936) #declare global_pack_CYRF6936=yes; object {IC_SMD_MLF_40_050MM("CYRF6936",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<17.703800,0.000000,19.812000>translate<0,0.035000,0> }#end		//SMD IC MLF40 Package CYRF6936 CYRF6936 QFN40
#ifndef(pack_L2) #declare global_pack_L2=yes; object {CAP_SMD_CHIP_0402()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<19.558000,0.000000,26.441400>translate<0,0.035000,0> }#end		//SMD Capacitor 0402 L2  C0402
#ifndef(pack_Y1) #declare global_pack_Y1=yes; object {SPC_CRES_ABRACON_ABM3B_GRND("",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<18.897600,0.000000,9.448800>}#end		//SMD Ceramic Resonator Y1  CRYSTAL-SMD-5X3
}//End union
#end
#if(pcb_pads_smds=on)
//Pads&SMD/Parts
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<21.920200,0.000000,25.156400>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<21.920200,0.000000,26.456400>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<18.912600,0.000000,25.146000>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<17.612600,0.000000,25.146000>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<21.909800,0.000000,28.117800>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<20.609800,0.000000,28.117800>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<17.449800,0.000000,14.315200>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<17.449800,0.000000,13.015200>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<15.661400,0.000000,25.146000>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<14.361400,0.000000,25.146000>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<22.529800,0.000000,18.171400>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<22.529800,0.000000,19.471400>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<15.051800,0.000000,14.300200>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<13.751800,0.000000,14.300200>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<19.456400,0.000000,14.315200>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<19.456400,0.000000,13.015200>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<23.723600,0.000000,19.471400>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<23.723600,0.000000,18.171400>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<22.529800,0.000000,21.194000>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<22.529800,0.000000,22.494000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<13.425600,0.000000,10.261600>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<15.225600,0.000000,10.261600>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<15.051800,0.000000,12.801600>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<13.751800,0.000000,12.801600>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<20.678800,0.000000,17.562000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<20.678800,0.000000,18.062000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<20.678800,0.000000,18.562000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<20.678800,0.000000,19.062000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<20.678800,0.000000,19.562000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<20.678800,0.000000,20.062000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<20.678800,0.000000,20.562000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<20.678800,0.000000,21.062000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<20.678800,0.000000,21.562000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<20.678800,0.000000,22.062000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<19.953800,0.000000,22.787000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<19.453800,0.000000,22.787000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<18.953800,0.000000,22.787000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<18.453800,0.000000,22.787000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<17.953800,0.000000,22.787000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<17.453800,0.000000,22.787000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<16.953800,0.000000,22.787000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<16.453800,0.000000,22.787000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<15.953800,0.000000,22.787000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<15.453800,0.000000,22.787000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<14.728800,0.000000,22.062000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<14.728800,0.000000,21.562000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<14.728800,0.000000,21.062000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<14.728800,0.000000,20.562000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<14.728800,0.000000,20.062000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<14.728800,0.000000,19.562000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<14.728800,0.000000,19.062000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<14.728800,0.000000,18.562000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<14.728800,0.000000,18.062000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<14.728800,0.000000,17.562000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<15.453800,0.000000,16.837000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<15.953800,0.000000,16.837000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<16.453800,0.000000,16.837000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<16.953800,0.000000,16.837000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<17.453800,0.000000,16.837000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<17.953800,0.000000,16.837000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<18.453800,0.000000,16.837000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<18.953800,0.000000,16.837000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<19.453800,0.000000,16.837000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<19.953800,0.000000,16.837000>}
object{TOOLS_PCB_SMD(4.500000,4.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<17.703800,0.000000,19.812000>}
object{TOOLS_PCB_SMD(2.540000,1.270000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<10.414000,0.000000,24.638000>}
object{TOOLS_PCB_SMD(2.540000,1.270000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<10.414000,0.000000,17.018000>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<25.056200,0.000000,25.171400>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<23.356200,0.000000,25.171400>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<18.908000,0.000000,26.441400>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<20.208000,0.000000,26.441400>}
object{TOOLS_PCB_SMD(2.540000,1.270000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<10.414000,0.000000,11.938000>}
object{TOOLS_PCB_SMD(2.540000,1.270000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<10.414000,0.000000,14.478000>}
object{TOOLS_PCB_SMD(2.540000,1.270000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<10.414000,0.000000,19.558000>}
object{TOOLS_PCB_SMD(2.540000,1.270000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<10.414000,0.000000,9.525000>}
object{TOOLS_PCB_SMD(1.900000,1.100000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<17.047600,0.000000,8.298800>}
object{TOOLS_PCB_SMD(1.900000,1.100000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<20.747600,0.000000,8.298800>}
object{TOOLS_PCB_SMD(1.900000,1.100000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<20.747600,0.000000,10.598800>}
object{TOOLS_PCB_SMD(1.900000,1.100000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<17.047600,0.000000,10.598800>}
object{TOOLS_PCB_SMD(2.540000,1.270000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<10.414000,0.000000,22.098000>}
//Pads/Vias
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<13.741400,0,15.036800> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<14.122400,0,16.408400> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<23.495000,0,17.145000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<19.456400,0,21.564600> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<18.592800,0,21.564600> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<17.729200,0,21.564600> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<16.865600,0,21.564600> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<16.002000,0,21.564600> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<19.456400,0,20.675600> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<18.592800,0,20.675600> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<17.729200,0,20.675600> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<16.865600,0,20.675600> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<16.002000,0,20.675600> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<19.456400,0,19.812000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<18.592800,0,19.812000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<17.729200,0,19.812000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<16.865600,0,19.812000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<16.002000,0,19.812000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<19.456400,0,18.923000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<18.592800,0,18.923000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<17.729200,0,18.923000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<16.865600,0,18.923000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<16.002000,0,18.923000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<19.456400,0,18.059400> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<18.592800,0,18.059400> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<17.729200,0,18.059400> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<16.865600,0,18.059400> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<16.002000,0,18.059400> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<13.385800,0,25.146000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<13.893800,0,22.809200> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<19.481800,0,11.938000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<17.449800,0,11.938000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<10.414000,0,10.820400> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<10.414000,0,13.360400> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<10.414000,0,15.900400> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<10.414000,0,18.440400> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<10.414000,0,20.980400> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<10.414000,0,23.418800> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<10.414000,0,28.702000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<10.414000,0,8.382000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<24.130000,0,28.702000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<23.114000,0,28.702000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<19.304000,0,28.702000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<18.034000,0,28.702000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<11.684000,0,28.702000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<16.764000,0,28.702000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<15.494000,0,28.702000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<14.224000,0,28.702000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<12.954000,0,28.702000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<26.416000,0,28.702000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<23.596600,0,8.382000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<25.273000,0,28.702000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<13.462000,0,8.382000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<15.494000,0,8.382000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<18.897600,0,8.382000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<18.897600,0,10.922000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<14.224000,0,11.125200> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<13.462000,0,17.526000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<13.462000,0,21.590000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<13.462000,0,27.178000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<23.622000,0,15.621000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<20.828000,0,13.462000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<23.622000,0,10.922000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<16.002000,0,27.178000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<10.414000,0,26.162000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<10.414000,0,27.178000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<23.622000,0,21.590000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<26.670000,0,10.922000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<26.670000,0,13.462000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<26.670000,0,16.002000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<26.670000,0,18.542000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<26.670000,0,21.082000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<26.670000,0,23.622000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<26.670000,0,8.382000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<26.670000,0,25.654000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<26.670000,0,27.178000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.533400,0.381000,1,16,1,0) translate<14.655800,0,29.972000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<23.622000,0,13.462000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<15.773400,0,15.265400> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<15.113000,0,26.289000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<19.456400,0,15.265400> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<22.377400,0,17.094200> texture{col_wrs}}
#end
#if(pcb_wires=on)
union{
//Signals
difference{union{
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.726400,0.000000,14.325600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.741400,0.000000,15.036800>}
box{<0,0,-0.152400><0.711358,0.035000,0.152400> rotate<0,-88.785887,0> translate<13.726400,0.000000,14.325600> }
}cylinder{<13.741400,1,15.036800><13.741400,-2.500000,15.036800>0.152400 texture{col_thl}}}
difference{union{
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.893800,0.000000,22.809200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.981600,0.000000,22.809200>}
box{<0,0,-0.152400><0.087800,0.035000,0.152400> rotate<0,0.000000,0> translate<13.893800,0.000000,22.809200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.981600,0.000000,22.809200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.728800,0.000000,22.062000>}
box{<0,0,-0.152400><1.056700,0.035000,0.152400> rotate<0,44.997030,0> translate<13.981600,0.000000,22.809200> }
}cylinder{<13.893800,1,22.809200><13.893800,-2.500000,22.809200>0.152400 texture{col_thl}}}
difference{union{
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.655800,0.000000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.844000,0.000000,29.972000>}
box{<0,0,-0.254000><7.188200,0.035000,0.254000> rotate<0,0.000000,0> translate<14.655800,0.000000,29.972000> }
}cylinder{<14.655800,1,29.972000><14.655800,-2.500000,29.972000>0.190500 texture{col_thl}}}
difference{union{
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.113000,0.000000,26.289000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.661400,0.000000,25.740600>}
box{<0,0,-0.152400><0.775555,0.035000,0.152400> rotate<0,44.997030,0> translate<15.113000,0.000000,26.289000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.011400,-1.535000,22.580600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.113000,-1.535000,26.289000>}
box{<0,0,-0.203200><3.709792,0.035000,0.203200> rotate<0,-88.424809,0> translate<15.011400,-1.535000,22.580600> }
}cylinder{<15.113000,1,26.289000><15.113000,-2.500000,26.289000>0.152400 texture{col_thl}}}
difference{union{
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.748000,-1.535000,15.265400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.773400,-1.535000,15.265400>}
box{<0,0,-0.203200><0.025400,0.035000,0.203200> rotate<0,0.000000,0> translate<15.748000,-1.535000,15.265400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.773400,0.000000,15.265400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.453800,0.000000,15.945800>}
box{<0,0,-0.152400><0.962231,0.035000,0.152400> rotate<0,-44.997030,0> translate<15.773400,0.000000,15.265400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.773400,-1.535000,15.265400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.456400,-1.535000,15.265400>}
box{<0,0,-0.203200><3.683000,0.035000,0.203200> rotate<0,0.000000,0> translate<15.773400,-1.535000,15.265400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.011400,-1.535000,16.002000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.748000,-1.535000,15.265400>}
box{<0,0,-0.203200><1.041710,0.035000,0.203200> rotate<0,44.997030,0> translate<15.011400,-1.535000,16.002000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.051800,0.000000,14.543800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.773400,0.000000,15.265400>}
box{<0,0,-0.152400><1.020497,0.035000,0.152400> rotate<0,-44.997030,0> translate<15.051800,0.000000,14.543800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.290800,0.000000,15.748000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.773400,0.000000,15.265400>}
box{<0,0,-0.203200><0.682499,0.035000,0.203200> rotate<0,44.997030,0> translate<15.290800,0.000000,15.748000> }
}cylinder{<15.773400,1,15.265400><15.773400,-2.500000,15.265400>0.152400 texture{col_thl}}}
difference{union{
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.953800,0.000000,21.564600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.002000,0.000000,21.564600>}
box{<0,0,-0.127000><0.048200,0.035000,0.127000> rotate<0,0.000000,0> translate<15.953800,0.000000,21.564600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.953800,0.000000,22.787000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.953800,0.000000,21.564600>}
box{<0,0,-0.152400><1.222400,0.035000,0.152400> rotate<0,-90.000000,0> translate<15.953800,0.000000,21.564600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.728800,0.000000,21.564600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.002000,0.000000,21.564600>}
box{<0,0,-0.152400><1.273200,0.035000,0.152400> rotate<0,0.000000,0> translate<14.728800,0.000000,21.564600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.453800,0.000000,22.112800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.002000,0.000000,21.564600>}
box{<0,0,-0.152400><0.775272,0.035000,0.152400> rotate<0,44.997030,0> translate<15.453800,0.000000,22.112800> }
}cylinder{<16.002000,1,21.564600><16.002000,-2.500000,21.564600>0.152400 texture{col_thl}}}
difference{union{
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.953800,0.000000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.703800,0.000000,19.812000>}
box{<0,0,-0.203200><0.750000,0.035000,0.203200> rotate<0,0.000000,0> translate<16.953800,0.000000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.953800,0.000000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.953800,0.000000,19.812000>}
box{<0,0,-0.127000><0.508000,0.035000,0.127000> rotate<0,90.000000,0> translate<16.953800,0.000000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.953800,0.000000,22.787000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.953800,0.000000,19.812000>}
box{<0,0,-0.152400><2.975000,0.035000,0.152400> rotate<0,-90.000000,0> translate<16.953800,0.000000,19.812000> }
}cylinder{<16.865600,1,19.812000><16.865600,-2.500000,19.812000>0.152400 texture{col_thl}}}
difference{union{
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.453800,0.000000,21.564600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.865600,0.000000,21.564600>}
box{<0,0,-0.127000><0.411800,0.035000,0.127000> rotate<0,0.000000,0> translate<16.453800,0.000000,21.564600> }
}cylinder{<16.865600,1,21.564600><16.865600,-2.500000,21.564600>0.152400 texture{col_thl}}}
difference{union{
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.449800,0.000000,12.090400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.449800,0.000000,11.938000>}
box{<0,0,-0.127000><0.152400,0.035000,0.127000> rotate<0,-90.000000,0> translate<17.449800,0.000000,11.938000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.449800,0.000000,13.015200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.449800,0.000000,12.090400>}
box{<0,0,-0.152400><0.924800,0.035000,0.152400> rotate<0,-90.000000,0> translate<17.449800,0.000000,12.090400> }
}cylinder{<17.449800,1,11.938000><17.449800,-2.500000,11.938000>0.152400 texture{col_thl}}}
difference{union{
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.703800,0.000000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.329400,0.000000,19.812000>}
box{<0,0,-0.127000><1.625600,0.035000,0.127000> rotate<0,0.000000,0> translate<17.703800,0.000000,19.812000> }
}cylinder{<17.729200,1,19.812000><17.729200,-2.500000,19.812000>0.152400 texture{col_thl}}}
difference{union{
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.729200,0.000000,21.564600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.953800,0.000000,21.789200>}
box{<0,0,-0.152400><0.317632,0.035000,0.152400> rotate<0,-44.997030,0> translate<17.729200,0.000000,21.564600> }
}cylinder{<17.729200,1,21.564600><17.729200,-2.500000,21.564600>0.152400 texture{col_thl}}}
difference{union{
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.453800,0.000000,17.920400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.592800,0.000000,18.059400>}
box{<0,0,-0.152400><0.196576,0.035000,0.152400> rotate<0,-44.997030,0> translate<18.453800,0.000000,17.920400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.453800,0.000000,16.837000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.453800,0.000000,17.920400>}
box{<0,0,-0.152400><1.083400,0.035000,0.152400> rotate<0,90.000000,0> translate<18.453800,0.000000,17.920400> }
}cylinder{<18.592800,1,18.059400><18.592800,-2.500000,18.059400>0.152400 texture{col_thl}}}
difference{union{
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.453800,0.000000,21.703600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.592800,0.000000,21.564600>}
box{<0,0,-0.152400><0.196576,0.035000,0.152400> rotate<0,44.997030,0> translate<18.453800,0.000000,21.703600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.453800,0.000000,22.787000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.453800,0.000000,21.703600>}
box{<0,0,-0.152400><1.083400,0.035000,0.152400> rotate<0,-90.000000,0> translate<18.453800,0.000000,21.703600> }
}cylinder{<18.592800,1,21.564600><18.592800,-2.500000,21.564600>0.152400 texture{col_thl}}}
difference{union{
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.456400,0.000000,15.265400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.953800,0.000000,15.762800>}
box{<0,0,-0.152400><0.703430,0.035000,0.152400> rotate<0,-44.997030,0> translate<19.456400,0.000000,15.265400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.456400,-1.535000,15.265400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.234400,-1.535000,15.265400>}
box{<0,0,-0.203200><1.778000,0.035000,0.203200> rotate<0,0.000000,0> translate<19.456400,-1.535000,15.265400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.953800,0.000000,15.768000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.456400,0.000000,15.265400>}
box{<0,0,-0.152400><0.710784,0.035000,0.152400> rotate<0,44.997030,0> translate<18.953800,0.000000,15.768000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.456400,0.000000,14.315200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.456400,0.000000,15.265400>}
box{<0,0,-0.152400><0.950200,0.035000,0.152400> rotate<0,90.000000,0> translate<19.456400,0.000000,15.265400> }
}cylinder{<19.456400,1,15.265400><19.456400,-2.500000,15.265400>0.152400 texture{col_thl}}}
difference{union{
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.329400,0.000000,18.211800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.329400,0.000000,18.999200>}
box{<0,0,-0.127000><0.787400,0.035000,0.127000> rotate<0,90.000000,0> translate<19.329400,0.000000,18.999200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.456400,0.000000,18.062000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.456400,0.000000,18.059400>}
box{<0,0,-0.127000><0.002600,0.035000,0.127000> rotate<0,-90.000000,0> translate<19.456400,0.000000,18.059400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.456400,0.000000,18.062000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.678800,0.000000,18.062000>}
box{<0,0,-0.152400><1.222400,0.035000,0.152400> rotate<0,0.000000,0> translate<19.456400,0.000000,18.062000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.456400,0.000000,16.837000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.456400,0.000000,18.059400>}
box{<0,0,-0.152400><1.222400,0.035000,0.152400> rotate<0,90.000000,0> translate<19.456400,0.000000,18.059400> }
}cylinder{<19.456400,1,18.059400><19.456400,-2.500000,18.059400>0.152400 texture{col_thl}}}
difference{union{
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.329400,0.000000,19.075400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.329400,0.000000,19.812000>}
box{<0,0,-0.127000><0.736600,0.035000,0.127000> rotate<0,90.000000,0> translate<19.329400,0.000000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.329400,0.000000,19.075400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.678800,0.000000,19.050000>}
box{<0,0,-0.152400><1.349639,0.035000,0.152400> rotate<0,1.078290,0> translate<19.329400,0.000000,19.075400> }
}cylinder{<19.456400,1,18.923000><19.456400,-2.500000,18.923000>0.152400 texture{col_thl}}}
difference{union{
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.453800,0.000000,21.567200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.456400,0.000000,21.564600>}
box{<0,0,-0.152400><0.003677,0.035000,0.152400> rotate<0,44.997030,0> translate<19.453800,0.000000,21.567200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.456400,0.000000,21.564600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.459000,0.000000,21.562000>}
box{<0,0,-0.152400><0.003677,0.035000,0.152400> rotate<0,44.997030,0> translate<19.456400,0.000000,21.564600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.459000,0.000000,21.562000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.678800,0.000000,21.562000>}
box{<0,0,-0.152400><1.219800,0.035000,0.152400> rotate<0,0.000000,0> translate<19.459000,0.000000,21.562000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.453800,0.000000,22.787000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.453800,0.000000,21.567200>}
box{<0,0,-0.152400><1.219800,0.035000,0.152400> rotate<0,-90.000000,0> translate<19.453800,0.000000,21.567200> }
}cylinder{<19.456400,1,21.564600><19.456400,-2.500000,21.564600>0.152400 texture{col_thl}}}
difference{union{
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.456400,0.000000,11.938000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.481800,0.000000,11.938000>}
box{<0,0,-0.127000><0.025400,0.035000,0.127000> rotate<0,0.000000,0> translate<19.456400,0.000000,11.938000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.456400,0.000000,13.015200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.456400,0.000000,11.938000>}
box{<0,0,-0.152400><1.077200,0.035000,0.152400> rotate<0,-90.000000,0> translate<19.456400,0.000000,11.938000> }
}cylinder{<19.481800,1,11.938000><19.481800,-2.500000,11.938000>0.152400 texture{col_thl}}}
difference{union{
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.377400,-1.535000,17.094200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.377400,-1.535000,16.408400>}
box{<0,0,-0.203200><0.685800,0.035000,0.203200> rotate<0,-90.000000,0> translate<22.377400,-1.535000,16.408400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.377400,0.000000,17.094200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.936200,0.000000,16.535400>}
box{<0,0,-0.152400><0.790263,0.035000,0.152400> rotate<0,44.997030,0> translate<22.377400,0.000000,17.094200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.377400,0.000000,18.262600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.377400,0.000000,17.094200>}
box{<0,0,-0.152400><1.168400,0.035000,0.152400> rotate<0,-90.000000,0> translate<22.377400,0.000000,17.094200> }
}cylinder{<22.377400,1,17.094200><22.377400,-2.500000,17.094200>0.152400 texture{col_thl}}}
difference{union{
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.495000,0.000000,17.145000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.723600,0.000000,18.171400>}
box{<0,0,-0.152400><1.051549,0.035000,0.152400> rotate<0,-77.438896,0> translate<23.495000,0.000000,17.145000> }
}cylinder{<23.495000,1,17.145000><23.495000,-2.500000,17.145000>0.152400 texture{col_thl}}}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.414000,0.000000,19.558000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.664000,0.000000,20.062000>}
box{<0,0,-0.127000><0.562598,0.035000,0.127000> rotate<0,-63.612930,0> translate<10.414000,0.000000,19.558000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.414000,0.000000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.303000,0.000000,22.352000>}
box{<0,0,-0.203200><0.924574,0.035000,0.203200> rotate<0,-15.944344,0> translate<10.414000,0.000000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.414000,0.000000,9.525000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.469800,0.000000,9.525000>}
box{<0,0,-0.152400><1.055800,0.035000,0.152400> rotate<0,0.000000,0> translate<10.414000,0.000000,9.525000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.414000,0.000000,11.938000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.014200,0.000000,13.538200>}
box{<0,0,-0.127000><2.263025,0.035000,0.127000> rotate<0,-44.997030,0> translate<10.414000,0.000000,11.938000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.014200,0.000000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.014200,0.000000,13.538200>}
box{<0,0,-0.127000><1.905000,0.035000,0.127000> rotate<0,-90.000000,0> translate<12.014200,0.000000,13.538200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.414000,0.000000,14.478000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.192000,0.000000,16.383000>}
box{<0,0,-0.127000><2.605822,0.035000,0.127000> rotate<0,-46.971834,0> translate<10.414000,0.000000,14.478000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.192000,0.000000,18.161000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.192000,0.000000,16.383000>}
box{<0,0,-0.127000><1.778000,0.035000,0.127000> rotate<0,-90.000000,0> translate<12.192000,0.000000,16.383000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.469800,0.000000,9.525000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.511200,0.000000,10.566400>}
box{<0,0,-0.203200><1.472762,0.035000,0.203200> rotate<0,-44.997030,0> translate<11.469800,0.000000,9.525000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.511200,0.000000,14.924200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.511200,0.000000,10.566400>}
box{<0,0,-0.203200><4.357800,0.035000,0.203200> rotate<0,-90.000000,0> translate<12.511200,0.000000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.014200,0.000000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.700000,0.000000,16.129000>}
box{<0,0,-0.127000><0.969868,0.035000,0.127000> rotate<0,-44.997030,0> translate<12.014200,0.000000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.700000,0.000000,18.034000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.700000,0.000000,16.129000>}
box{<0,0,-0.127000><1.905000,0.035000,0.127000> rotate<0,-90.000000,0> translate<12.700000,0.000000,16.129000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.414000,0.000000,17.018000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.704000,0.000000,19.562000>}
box{<0,0,-0.127000><3.422870,0.035000,0.127000> rotate<0,-48.004642,0> translate<10.414000,0.000000,17.018000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.852400,0.000000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.877800,0.000000,25.120600>}
box{<0,0,-0.152400><0.035921,0.035000,0.152400> rotate<0,44.997030,0> translate<12.852400,0.000000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.192000,0.000000,18.161000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.093000,0.000000,19.062000>}
box{<0,0,-0.127000><1.274206,0.035000,0.127000> rotate<0,-44.997030,0> translate<12.192000,0.000000,18.161000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.303000,0.000000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.093000,0.000000,20.562000>}
box{<0,0,-0.127000><2.531442,0.035000,0.127000> rotate<0,44.997030,0> translate<11.303000,0.000000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.511200,0.000000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.120800,0.000000,10.566400>}
box{<0,0,-0.203200><0.609600,0.035000,0.203200> rotate<0,0.000000,0> translate<12.511200,0.000000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.700000,0.000000,18.034000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.228000,0.000000,18.562000>}
box{<0,0,-0.127000><0.746705,0.035000,0.127000> rotate<0,-44.997030,0> translate<12.700000,0.000000,18.034000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.511200,0.000000,14.924200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.335000,0.000000,15.748000>}
box{<0,0,-0.203200><1.165029,0.035000,0.203200> rotate<0,-44.997030,0> translate<12.511200,0.000000,14.924200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.120800,0.000000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.425600,0.000000,10.261600>}
box{<0,0,-0.203200><0.431052,0.035000,0.203200> rotate<0,44.997030,0> translate<13.120800,0.000000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.751800,0.000000,12.801600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.751800,0.000000,12.003800>}
box{<0,0,-0.152400><0.797800,0.035000,0.152400> rotate<0,-90.000000,0> translate<13.751800,0.000000,12.003800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.726400,0.000000,14.325600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.751800,0.000000,14.300200>}
box{<0,0,-0.152400><0.035921,0.035000,0.152400> rotate<0,44.997030,0> translate<13.726400,0.000000,14.325600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.751800,0.000000,12.003800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.020800,0.000000,11.734800>}
box{<0,0,-0.152400><0.380423,0.035000,0.152400> rotate<0,44.997030,0> translate<13.751800,0.000000,12.003800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.228000,0.000000,18.562000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.728800,0.000000,18.562000>}
box{<0,0,-0.127000><1.500800,0.035000,0.127000> rotate<0,0.000000,0> translate<13.228000,0.000000,18.562000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.093000,0.000000,19.062000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.728800,0.000000,19.062000>}
box{<0,0,-0.127000><1.635800,0.035000,0.127000> rotate<0,0.000000,0> translate<13.093000,0.000000,19.062000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.704000,0.000000,19.562000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.728800,0.000000,19.562000>}
box{<0,0,-0.127000><2.024800,0.035000,0.127000> rotate<0,0.000000,0> translate<12.704000,0.000000,19.562000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.664000,0.000000,20.062000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.728800,0.000000,20.062000>}
box{<0,0,-0.127000><4.064800,0.035000,0.127000> rotate<0,0.000000,0> translate<10.664000,0.000000,20.062000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.093000,0.000000,20.562000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.728800,0.000000,20.562000>}
box{<0,0,-0.127000><1.635800,0.035000,0.127000> rotate<0,0.000000,0> translate<13.093000,0.000000,20.562000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.728800,0.000000,21.062000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.728800,0.000000,21.564600>}
box{<0,0,-0.152400><0.502600,0.035000,0.152400> rotate<0,90.000000,0> translate<14.728800,0.000000,21.564600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.728800,0.000000,21.562000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.728800,0.000000,22.062000>}
box{<0,0,-0.152400><0.500000,0.035000,0.152400> rotate<0,90.000000,0> translate<14.728800,0.000000,22.062000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.795000,0.000000,35.814000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.986000,0.000000,35.814000>}
box{<0,0,-0.254000><4.191000,0.035000,0.254000> rotate<0,0.000000,0> translate<10.795000,0.000000,35.814000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.986000,0.000000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.986000,0.000000,35.814000>}
box{<0,0,-0.254000><3.810000,0.035000,0.254000> rotate<0,90.000000,0> translate<14.986000,0.000000,35.814000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.011400,-1.535000,16.002000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.011400,-1.535000,22.580600>}
box{<0,0,-0.203200><6.578600,0.035000,0.203200> rotate<0,90.000000,0> translate<15.011400,-1.535000,22.580600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.051800,0.000000,12.801600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.051800,0.000000,14.300200>}
box{<0,0,-0.152400><1.498600,0.035000,0.152400> rotate<0,90.000000,0> translate<15.051800,0.000000,14.300200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.051800,0.000000,14.300200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.051800,0.000000,14.543800>}
box{<0,0,-0.127000><0.243600,0.035000,0.127000> rotate<0,90.000000,0> translate<15.051800,0.000000,14.543800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.335000,0.000000,15.748000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.290800,0.000000,15.748000>}
box{<0,0,-0.203200><1.955800,0.035000,0.203200> rotate<0,0.000000,0> translate<13.335000,0.000000,15.748000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.453800,0.000000,22.787000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.453800,0.000000,22.112800>}
box{<0,0,-0.152400><0.674200,0.035000,0.152400> rotate<0,-90.000000,0> translate<15.453800,0.000000,22.112800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.661400,0.000000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.661400,0.000000,25.740600>}
box{<0,0,-0.152400><0.594600,0.035000,0.152400> rotate<0,90.000000,0> translate<15.661400,0.000000,25.740600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.020800,0.000000,11.734800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.748000,0.000000,11.734800>}
box{<0,0,-0.152400><1.727200,0.035000,0.152400> rotate<0,0.000000,0> translate<14.020800,0.000000,11.734800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.453800,0.000000,16.837000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.951200,0.000000,16.837000>}
box{<0,0,-0.127000><0.497400,0.035000,0.127000> rotate<0,0.000000,0> translate<15.453800,0.000000,16.837000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.951200,0.000000,16.837000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.951200,0.000000,19.304000>}
box{<0,0,-0.152400><2.467000,0.035000,0.152400> rotate<0,90.000000,0> translate<15.951200,0.000000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.986000,0.000000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.129000,0.000000,32.004000>}
box{<0,0,-0.254000><1.143000,0.035000,0.254000> rotate<0,0.000000,0> translate<14.986000,0.000000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.129000,0.000000,35.814000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.129000,0.000000,32.004000>}
box{<0,0,-0.254000><3.810000,0.035000,0.254000> rotate<0,-90.000000,0> translate<16.129000,0.000000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.748000,0.000000,11.734800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.205200,0.000000,12.192000>}
box{<0,0,-0.152400><0.646578,0.035000,0.152400> rotate<0,-44.997030,0> translate<15.748000,0.000000,11.734800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.205200,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.205200,0.000000,14.605000>}
box{<0,0,-0.152400><2.413000,0.035000,0.152400> rotate<0,90.000000,0> translate<16.205200,0.000000,14.605000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.453800,0.000000,16.837000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.453800,0.000000,15.945800>}
box{<0,0,-0.152400><0.891200,0.035000,0.152400> rotate<0,-90.000000,0> translate<16.453800,0.000000,15.945800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.453800,0.000000,22.787000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.453800,0.000000,21.564600>}
box{<0,0,-0.152400><1.222400,0.035000,0.152400> rotate<0,-90.000000,0> translate<16.453800,0.000000,21.564600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.205200,0.000000,14.605000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.953800,0.000000,15.353600>}
box{<0,0,-0.152400><1.058680,0.035000,0.152400> rotate<0,-44.997030,0> translate<16.205200,0.000000,14.605000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.953800,0.000000,16.837000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.953800,0.000000,15.353600>}
box{<0,0,-0.152400><1.483400,0.035000,0.152400> rotate<0,-90.000000,0> translate<16.953800,0.000000,15.353600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.951200,0.000000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.953800,0.000000,19.304000>}
box{<0,0,-0.127000><1.002600,0.035000,0.127000> rotate<0,0.000000,0> translate<15.951200,0.000000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.129000,0.000000,35.814000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.272000,0.000000,35.814000>}
box{<0,0,-0.254000><1.143000,0.035000,0.254000> rotate<0,0.000000,0> translate<16.129000,0.000000,35.814000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.272000,0.000000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.272000,0.000000,35.814000>}
box{<0,0,-0.254000><3.810000,0.035000,0.254000> rotate<0,90.000000,0> translate<17.272000,0.000000,35.814000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.449800,0.000000,14.315200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.453800,0.000000,14.315200>}
box{<0,0,-0.127000><0.004000,0.035000,0.127000> rotate<0,0.000000,0> translate<17.449800,0.000000,14.315200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.453800,0.000000,16.837000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.453800,0.000000,14.315200>}
box{<0,0,-0.152400><2.521800,0.035000,0.152400> rotate<0,-90.000000,0> translate<17.453800,0.000000,14.315200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.661400,0.000000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.453800,0.000000,23.353600>}
box{<0,0,-0.152400><2.534836,0.035000,0.152400> rotate<0,44.997030,0> translate<15.661400,0.000000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.453800,0.000000,22.787000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.453800,0.000000,23.353600>}
box{<0,0,-0.152400><0.566600,0.035000,0.152400> rotate<0,90.000000,0> translate<17.453800,0.000000,23.353600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.612600,0.000000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.627600,0.000000,25.131000>}
box{<0,0,-0.152400><0.021213,0.035000,0.152400> rotate<0,44.997030,0> translate<17.612600,0.000000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.627600,0.000000,24.536400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.627600,0.000000,25.131000>}
box{<0,0,-0.152400><0.594600,0.035000,0.152400> rotate<0,90.000000,0> translate<17.627600,0.000000,25.131000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.953800,0.000000,22.787000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.953800,0.000000,21.789200>}
box{<0,0,-0.152400><0.997800,0.035000,0.152400> rotate<0,-90.000000,0> translate<17.953800,0.000000,21.789200> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.272000,0.000000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<18.415000,0.000000,32.004000>}
box{<0,0,-0.254000><1.143000,0.035000,0.254000> rotate<0,0.000000,0> translate<17.272000,0.000000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<18.415000,0.000000,35.814000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<18.415000,0.000000,32.004000>}
box{<0,0,-0.254000><3.810000,0.035000,0.254000> rotate<0,-90.000000,0> translate<18.415000,0.000000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.953800,0.000000,16.837000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.453800,0.000000,16.837000>}
box{<0,0,-0.152400><0.500000,0.035000,0.152400> rotate<0,0.000000,0> translate<17.953800,0.000000,16.837000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.627600,0.000000,24.536400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.453800,0.000000,23.710200>}
box{<0,0,-0.152400><1.168423,0.035000,0.152400> rotate<0,44.997030,0> translate<17.627600,0.000000,24.536400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.453800,0.000000,22.787000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.453800,0.000000,23.710200>}
box{<0,0,-0.152400><0.923200,0.035000,0.152400> rotate<0,90.000000,0> translate<18.453800,0.000000,23.710200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.908000,0.000000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.908000,0.000000,26.441400>}
box{<0,0,-0.152400><1.295400,0.035000,0.152400> rotate<0,90.000000,0> translate<18.908000,0.000000,26.441400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.908000,0.000000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.912600,0.000000,25.146000>}
box{<0,0,-0.152400><0.004600,0.035000,0.152400> rotate<0,0.000000,0> translate<18.908000,0.000000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.953800,0.000000,16.837000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.953800,0.000000,15.768000>}
box{<0,0,-0.152400><1.069000,0.035000,0.152400> rotate<0,-90.000000,0> translate<18.953800,0.000000,15.768000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.953800,0.000000,26.441400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.953800,0.000000,22.787000>}
box{<0,0,-0.152400><3.654400,0.035000,0.152400> rotate<0,-90.000000,0> translate<18.953800,0.000000,22.787000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<18.908000,0.000000,26.441400>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<18.953800,0.000000,26.441400>}
box{<0,0,-0.254000><0.045800,0.035000,0.254000> rotate<0,0.000000,0> translate<18.908000,0.000000,26.441400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.453800,0.000000,16.837000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.456400,0.000000,16.837000>}
box{<0,0,-0.127000><0.002600,0.035000,0.127000> rotate<0,0.000000,0> translate<19.453800,0.000000,16.837000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<18.415000,0.000000,35.814000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<19.558000,0.000000,35.814000>}
box{<0,0,-0.254000><1.143000,0.035000,0.254000> rotate<0,0.000000,0> translate<18.415000,0.000000,35.814000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<19.558000,0.000000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<19.558000,0.000000,35.814000>}
box{<0,0,-0.254000><3.810000,0.035000,0.254000> rotate<0,90.000000,0> translate<19.558000,0.000000,35.814000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.953800,0.000000,15.762800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.953800,0.000000,16.837000>}
box{<0,0,-0.152400><1.074200,0.035000,0.152400> rotate<0,90.000000,0> translate<19.953800,0.000000,16.837000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.953800,0.000000,25.156400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.953800,0.000000,22.787000>}
box{<0,0,-0.152400><2.369400,0.035000,0.152400> rotate<0,-90.000000,0> translate<19.953800,0.000000,22.787000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.953800,0.000000,26.289000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.953800,0.000000,25.156400>}
box{<0,0,-0.152400><1.132600,0.035000,0.152400> rotate<0,-90.000000,0> translate<19.953800,0.000000,25.156400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.953800,0.000000,26.441400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.953800,0.000000,26.289000>}
box{<0,0,-0.152400><0.152400,0.035000,0.152400> rotate<0,-90.000000,0> translate<19.953800,0.000000,26.289000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.953800,0.000000,26.289000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.106200,0.000000,26.441400>}
box{<0,0,-0.152400><0.215526,0.035000,0.152400> rotate<0,-44.997030,0> translate<19.953800,0.000000,26.289000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.106200,0.000000,26.441400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.208000,0.000000,26.441400>}
box{<0,0,-0.152400><0.101800,0.035000,0.152400> rotate<0,0.000000,0> translate<20.106200,0.000000,26.441400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.405600,0.000000,19.558000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.674800,0.000000,19.558000>}
box{<0,0,-0.152400><1.269200,0.035000,0.152400> rotate<0,0.000000,0> translate<19.405600,0.000000,19.558000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.678800,0.000000,17.562000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.678800,0.000000,16.659200>}
box{<0,0,-0.152400><0.902800,0.035000,0.152400> rotate<0,-90.000000,0> translate<20.678800,0.000000,16.659200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.678800,0.000000,19.562000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.678800,0.000000,19.050000>}
box{<0,0,-0.152400><0.512000,0.035000,0.152400> rotate<0,-90.000000,0> translate<20.678800,0.000000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.674800,0.000000,19.558000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.678800,0.000000,19.562000>}
box{<0,0,-0.127000><0.005657,0.035000,0.127000> rotate<0,-44.997030,0> translate<20.674800,0.000000,19.558000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.678800,0.000000,20.562000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.678800,0.000000,20.062000>}
box{<0,0,-0.152400><0.500000,0.035000,0.152400> rotate<0,-90.000000,0> translate<20.678800,0.000000,20.062000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.678800,0.000000,22.062000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.678800,0.000000,22.558400>}
box{<0,0,-0.152400><0.496400,0.035000,0.152400> rotate<0,90.000000,0> translate<20.678800,0.000000,22.558400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.678800,0.000000,19.562000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.689800,0.000000,19.573000>}
box{<0,0,-0.127000><0.015556,0.035000,0.127000> rotate<0,-44.997030,0> translate<20.678800,0.000000,19.562000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<19.558000,0.000000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<20.701000,0.000000,32.004000>}
box{<0,0,-0.254000><1.143000,0.035000,0.254000> rotate<0,0.000000,0> translate<19.558000,0.000000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<20.701000,0.000000,35.814000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<20.701000,0.000000,32.004000>}
box{<0,0,-0.254000><3.810000,0.035000,0.254000> rotate<0,-90.000000,0> translate<20.701000,0.000000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.678800,0.000000,21.562000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.358800,0.000000,21.562000>}
box{<0,0,-0.152400><0.680000,0.035000,0.152400> rotate<0,0.000000,0> translate<20.678800,0.000000,21.562000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.678800,0.000000,20.062000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.397800,0.000000,20.062000>}
box{<0,0,-0.127000><0.719000,0.035000,0.127000> rotate<0,0.000000,0> translate<20.678800,0.000000,20.062000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.678800,0.000000,22.558400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.640800,0.000000,23.520400>}
box{<0,0,-0.152400><1.360473,0.035000,0.152400> rotate<0,-44.997030,0> translate<20.678800,0.000000,22.558400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.678800,0.000000,18.562000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.722400,0.000000,18.562000>}
box{<0,0,-0.152400><1.043600,0.035000,0.152400> rotate<0,0.000000,0> translate<20.678800,0.000000,18.562000> }
cylinder{<0,0,0><0,0.035000,0>0.000127 translate<21.844000,0.000000,28.575000>}
cylinder{<0,0,0><0,0.035000,0>0.000127 translate<21.844000,0.000000,28.183600>}
box{<0,0,-0.000127><0.391400,0.035000,0.000127> rotate<0,-90.000000,0> translate<21.844000,0.000000,28.183600> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.844000,0.000000,28.575000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.844000,0.000000,29.972000>}
box{<0,0,-0.254000><1.397000,0.035000,0.254000> rotate<0,90.000000,0> translate<21.844000,0.000000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<20.701000,0.000000,35.814000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.844000,0.000000,35.814000>}
box{<0,0,-0.254000><1.143000,0.035000,0.254000> rotate<0,0.000000,0> translate<20.701000,0.000000,35.814000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.844000,0.000000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.844000,0.000000,35.814000>}
box{<0,0,-0.254000><5.842000,0.035000,0.254000> rotate<0,90.000000,0> translate<21.844000,0.000000,35.814000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.747600,0.000000,10.598800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.894800,0.000000,11.746000>}
box{<0,0,-0.152400><1.622386,0.035000,0.152400> rotate<0,-44.997030,0> translate<20.747600,0.000000,10.598800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.894800,0.000000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.894800,0.000000,11.746000>}
box{<0,0,-0.152400><3.697200,0.035000,0.152400> rotate<0,-90.000000,0> translate<21.894800,0.000000,11.746000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.678800,0.000000,16.659200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.894800,0.000000,15.443200>}
box{<0,0,-0.152400><1.719684,0.035000,0.152400> rotate<0,44.997030,0> translate<20.678800,0.000000,16.659200> }
cylinder{<0,0,0><0,0.035000,0>0.000127 translate<21.844000,0.000000,28.183600>}
cylinder{<0,0,0><0,0.035000,0>0.000127 translate<21.909800,0.000000,28.117800>}
box{<0,0,-0.000127><0.093055,0.035000,0.000127> rotate<0,44.997030,0> translate<21.844000,0.000000,28.183600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.909800,0.000000,26.456400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.909800,0.000000,28.117800>}
box{<0,0,-0.152400><1.661400,0.035000,0.152400> rotate<0,90.000000,0> translate<21.909800,0.000000,28.117800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.953800,0.000000,25.156400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.920200,0.000000,25.156400>}
box{<0,0,-0.152400><1.966400,0.035000,0.152400> rotate<0,0.000000,0> translate<19.953800,0.000000,25.156400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.920200,0.000000,25.171400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.920200,0.000000,25.156400>}
box{<0,0,-0.152400><0.015000,0.035000,0.152400> rotate<0,-90.000000,0> translate<21.920200,0.000000,25.156400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.909800,0.000000,26.456400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.920200,0.000000,26.456400>}
box{<0,0,-0.152400><0.010400,0.035000,0.152400> rotate<0,0.000000,0> translate<21.909800,0.000000,26.456400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.358800,0.000000,21.562000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.996400,0.000000,22.199600>}
box{<0,0,-0.152400><0.901703,0.035000,0.152400> rotate<0,-44.997030,0> translate<21.358800,0.000000,21.562000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.722400,0.000000,18.562000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.021800,0.000000,18.262600>}
box{<0,0,-0.152400><0.423416,0.035000,0.152400> rotate<0,44.997030,0> translate<21.722400,0.000000,18.562000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.234400,-1.535000,15.265400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.377400,-1.535000,16.408400>}
box{<0,0,-0.203200><1.616446,0.035000,0.203200> rotate<0,-44.997030,0> translate<21.234400,-1.535000,15.265400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.021800,0.000000,18.262600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.377400,0.000000,18.262600>}
box{<0,0,-0.152400><0.355600,0.035000,0.152400> rotate<0,0.000000,0> translate<22.021800,0.000000,18.262600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.678800,0.000000,21.062000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.397800,0.000000,21.062000>}
box{<0,0,-0.127000><1.719000,0.035000,0.127000> rotate<0,0.000000,0> translate<20.678800,0.000000,21.062000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.377400,0.000000,18.262600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.519400,0.000000,18.262600>}
box{<0,0,-0.127000><0.142000,0.035000,0.127000> rotate<0,0.000000,0> translate<22.377400,0.000000,18.262600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.996400,0.000000,22.199600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.519400,0.000000,22.199600>}
box{<0,0,-0.152400><0.523000,0.035000,0.152400> rotate<0,0.000000,0> translate<21.996400,0.000000,22.199600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.519400,0.000000,18.262600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.529800,0.000000,18.171400>}
box{<0,0,-0.127000><0.091791,0.035000,0.127000> rotate<0,83.488863,0> translate<22.519400,0.000000,18.262600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.678800,0.000000,19.562000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.529800,0.000000,19.562000>}
box{<0,0,-0.127000><1.851000,0.035000,0.127000> rotate<0,0.000000,0> translate<20.678800,0.000000,19.562000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.529800,0.000000,19.471400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.529800,0.000000,19.562000>}
box{<0,0,-0.127000><0.090600,0.035000,0.127000> rotate<0,90.000000,0> translate<22.529800,0.000000,19.562000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.397800,0.000000,20.062000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.529800,0.000000,21.194000>}
box{<0,0,-0.127000><1.600890,0.035000,0.127000> rotate<0,-44.997030,0> translate<21.397800,0.000000,20.062000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.357000,0.000000,21.062000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.529800,0.000000,21.194000>}
box{<0,0,-0.127000><0.217448,0.035000,0.127000> rotate<0,-37.373341,0> translate<22.357000,0.000000,21.062000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.397800,0.000000,21.062000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.529800,0.000000,21.194000>}
box{<0,0,-0.127000><0.186676,0.035000,0.127000> rotate<0,-44.997030,0> translate<22.397800,0.000000,21.062000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.519400,0.000000,22.199600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.529800,0.000000,22.494000>}
box{<0,0,-0.152400><0.294584,0.035000,0.152400> rotate<0,-87.971000,0> translate<22.519400,0.000000,22.199600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.529800,0.000000,21.194000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.798800,0.000000,21.194000>}
box{<0,0,-0.127000><0.269000,0.035000,0.127000> rotate<0,0.000000,0> translate<22.529800,0.000000,21.194000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.920200,0.000000,25.156400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.341200,0.000000,25.156400>}
box{<0,0,-0.152400><1.421000,0.035000,0.152400> rotate<0,0.000000,0> translate<21.920200,0.000000,25.156400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.341200,0.000000,25.156400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.356200,0.000000,25.171400>}
box{<0,0,-0.152400><0.021213,0.035000,0.152400> rotate<0,-44.997030,0> translate<23.341200,0.000000,25.156400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.798800,0.000000,21.194000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.723600,0.000000,20.269200>}
box{<0,0,-0.127000><1.307865,0.035000,0.127000> rotate<0,44.997030,0> translate<22.798800,0.000000,21.194000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.723600,0.000000,19.471400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.723600,0.000000,20.269200>}
box{<0,0,-0.152400><0.797800,0.035000,0.152400> rotate<0,90.000000,0> translate<23.723600,0.000000,20.269200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.936200,0.000000,16.535400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.977600,0.000000,16.535400>}
box{<0,0,-0.152400><1.041400,0.035000,0.152400> rotate<0,0.000000,0> translate<22.936200,0.000000,16.535400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.723600,0.000000,19.471400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.242000,0.000000,19.573000>}
box{<0,0,-0.127000><0.528262,0.035000,0.127000> rotate<0,-11.087983,0> translate<23.723600,0.000000,19.471400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.977600,0.000000,16.535400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.714200,0.000000,17.272000>}
box{<0,0,-0.152400><1.041710,0.035000,0.152400> rotate<0,-44.997030,0> translate<23.977600,0.000000,16.535400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.242000,0.000000,19.573000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.714200,0.000000,19.100800>}
box{<0,0,-0.152400><0.667792,0.035000,0.152400> rotate<0,44.997030,0> translate<24.242000,0.000000,19.573000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.714200,0.000000,17.272000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.714200,0.000000,19.100800>}
box{<0,0,-0.152400><1.828800,0.035000,0.152400> rotate<0,90.000000,0> translate<24.714200,0.000000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.640800,0.000000,23.520400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.095200,0.000000,23.520400>}
box{<0,0,-0.152400><3.454400,0.035000,0.152400> rotate<0,0.000000,0> translate<21.640800,0.000000,23.520400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.095200,0.000000,23.520400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.450800,0.000000,23.876000>}
box{<0,0,-0.152400><0.502894,0.035000,0.152400> rotate<0,-44.997030,0> translate<25.095200,0.000000,23.520400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.056200,0.000000,25.171400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.450800,0.000000,25.157800>}
box{<0,0,-0.152400><0.394834,0.035000,0.152400> rotate<0,1.973804,0> translate<25.056200,0.000000,25.171400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.450800,0.000000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.450800,0.000000,25.157800>}
box{<0,0,-0.152400><1.281800,0.035000,0.152400> rotate<0,90.000000,0> translate<25.450800,0.000000,25.157800> }
//Text
//Rect
union{
texture{col_pds}
}
texture{col_wrs}
}
#end
#if(pcb_polygons=on)
union{
//Polygons
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,7.696197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,8.661400>}
box{<0,0,-0.076200><0.965203,0.035000,0.076200> rotate<0,90.000000,0> translate<9.220197,0.000000,8.661400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,7.696197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,30.683200>}
box{<0,0,-0.076200><22.987003,0.035000,0.076200> rotate<0,90.000000,0> translate<9.220197,-1.535000,30.683200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,7.696197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.769847,0.000000,7.696197>}
box{<0,0,-0.076200><6.549650,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,7.696197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,7.696197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,7.696197>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,7.696197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,7.772400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.767400,0.000000,7.772400>}
box{<0,0,-0.076200><6.547203,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,7.772400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,7.772400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,7.772400>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,7.772400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,7.924800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.767400,0.000000,7.924800>}
box{<0,0,-0.076200><6.547203,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,7.924800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,7.924800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,7.924800>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,7.924800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,8.077200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.767400,0.000000,8.077200>}
box{<0,0,-0.076200><6.547203,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,8.077200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,8.077200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,8.077200>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,8.077200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,8.229600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.971388,0.000000,8.229600>}
box{<0,0,-0.076200><7.751191,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,8.229600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,8.229600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,8.229600>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,8.229600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.767400,0.000000,8.382000>}
box{<0,0,-0.076200><6.547203,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,8.382000>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.767400,0.000000,8.534400>}
box{<0,0,-0.076200><6.547203,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,8.534400>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,8.661400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.778688,0.000000,8.661400>}
box{<0,0,-0.076200><2.558491,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,8.661400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,8.686800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,8.686800>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,8.686800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,8.839200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,8.839200>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,8.839200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,8.991600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,8.991600>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,8.991600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,9.144000>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,9.296400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,9.296400>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,9.296400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,9.448800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,9.448800>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,9.448800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,9.601200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,9.601200>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,9.601200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,9.753600>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,9.906000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,9.906000>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,9.906000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,10.058400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,10.058400>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,10.058400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,10.210800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,10.210800>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,10.210800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,10.363200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,10.363200>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,10.363200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,10.388597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,11.074400>}
box{<0,0,-0.076200><0.685803,0.035000,0.076200> rotate<0,90.000000,0> translate<9.220197,0.000000,11.074400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,10.388597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.722744,0.000000,10.388597>}
box{<0,0,-0.076200><2.502547,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,10.388597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,10.515600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.849747,0.000000,10.515600>}
box{<0,0,-0.076200><2.629550,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,10.515600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,10.515600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,10.515600>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,10.515600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,10.668000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.002147,0.000000,10.668000>}
box{<0,0,-0.076200><2.781950,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,10.668000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,10.668000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,10.668000>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,10.668000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,10.820400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.079400,0.000000,10.820400>}
box{<0,0,-0.076200><2.859203,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,10.820400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,10.820400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,10.820400>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,10.820400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.079400,0.000000,10.972800>}
box{<0,0,-0.076200><2.859203,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,10.972800>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,11.074400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.778688,0.000000,11.074400>}
box{<0,0,-0.076200><2.558491,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,11.074400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,11.125200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,11.125200>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,11.125200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,11.277600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,11.277600>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,11.277600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,11.430000>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,11.582400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,11.582400>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,11.582400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,11.734800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,11.734800>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,11.734800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,11.887200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,11.887200>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,11.887200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,12.039600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,12.039600>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,12.039600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,12.192000>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,12.344400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,12.344400>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,12.344400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,12.496800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,12.496800>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,12.496800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,12.649200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,12.649200>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,12.649200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,12.801597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,13.614400>}
box{<0,0,-0.076200><0.812803,0.035000,0.076200> rotate<0,90.000000,0> translate<9.220197,0.000000,13.614400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,12.801597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.774706,0.000000,12.801597>}
box{<0,0,-0.076200><1.554509,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,12.801597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,12.801600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.774709,0.000000,12.801600>}
box{<0,0,-0.076200><1.554512,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,12.801600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,12.801600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,12.801600>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,12.801600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.927109,0.000000,12.954000>}
box{<0,0,-0.076200><1.706912,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,12.954000>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,13.106400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.079509,0.000000,13.106400>}
box{<0,0,-0.076200><1.859312,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,13.106400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,13.106400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,13.106400>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,13.106400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,13.258800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.231909,0.000000,13.258800>}
box{<0,0,-0.076200><2.011712,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,13.258800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,13.258800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,13.258800>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,13.258800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.384309,0.000000,13.411200>}
box{<0,0,-0.076200><2.164112,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,13.411200>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,13.563600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.536709,0.000000,13.563600>}
box{<0,0,-0.076200><2.316512,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,13.563600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,13.563600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,13.563600>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,13.563600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,13.614400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.587509,0.000000,13.614400>}
box{<0,0,-0.076200><2.367312,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,13.614400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,13.716000>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,13.868400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,13.868400>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,13.868400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,14.020800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,14.020800>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,14.020800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,14.173200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,14.173200>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,14.173200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,14.325600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,14.325600>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,14.325600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,14.478000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,14.478000>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,14.478000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,14.630400>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,14.782800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.501656,-1.535000,14.782800>}
box{<0,0,-0.076200><6.281459,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,14.782800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,14.935200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.349256,-1.535000,14.935200>}
box{<0,0,-0.076200><6.129059,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,14.935200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,15.087600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.240000,-1.535000,15.087600>}
box{<0,0,-0.076200><6.019803,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,15.087600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.162741,-1.535000,15.240000>}
box{<0,0,-0.076200><5.942544,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,15.341597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,16.154400>}
box{<0,0,-0.076200><0.812803,0.035000,0.076200> rotate<0,90.000000,0> translate<9.220197,0.000000,16.154400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,15.341597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.733606,0.000000,15.341597>}
box{<0,0,-0.076200><1.513409,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,15.341597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,15.392400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.781025,0.000000,15.392400>}
box{<0,0,-0.076200><1.560828,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,15.392400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,15.392400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.010341,-1.535000,15.392400>}
box{<0,0,-0.076200><5.790144,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,15.392400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,15.544800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.923266,0.000000,15.544800>}
box{<0,0,-0.076200><1.703069,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,15.544800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,15.544800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.857941,-1.535000,15.544800>}
box{<0,0,-0.076200><5.637744,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,15.544800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,15.697200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.065506,0.000000,15.697200>}
box{<0,0,-0.076200><1.845309,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,15.697200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,15.697200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.705541,-1.535000,15.697200>}
box{<0,0,-0.076200><5.485344,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,15.697200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.207747,0.000000,15.849600>}
box{<0,0,-0.076200><1.987550,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,15.849600>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,16.002000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.349988,0.000000,16.002000>}
box{<0,0,-0.076200><2.129791,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,16.002000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,16.002000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,16.002000>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,16.002000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,16.154400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.492225,0.000000,16.154400>}
box{<0,0,-0.076200><2.272028,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,16.154400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,16.154400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,16.154400>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,16.154400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,16.306800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,16.306800>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,16.306800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,16.459200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,16.459200>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,16.459200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,16.611600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,16.611600>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,16.611600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,16.764000>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,16.916400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,16.916400>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,16.916400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,17.068800>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,17.221200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,17.221200>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,17.221200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,17.373600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,17.373600>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,17.373600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,17.526000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,17.526000>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,17.526000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,17.678400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,17.678400>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,17.678400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,17.830800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,17.830800>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,17.830800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,17.881597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,18.694400>}
box{<0,0,-0.076200><0.812803,0.035000,0.076200> rotate<0,90.000000,0> translate<9.220197,0.000000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,17.881597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.712928,0.000000,17.881597>}
box{<0,0,-0.076200><1.492731,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,17.881597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,17.983200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.804388,0.000000,17.983200>}
box{<0,0,-0.076200><1.584191,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,17.983200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,17.983200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,17.983200>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,17.983200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,18.135600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.941572,0.000000,18.135600>}
box{<0,0,-0.076200><1.721375,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,18.135600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,18.135600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,18.135600>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,18.135600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.078756,0.000000,18.288000>}
box{<0,0,-0.076200><1.858559,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,18.288000>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,18.440400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.215941,0.000000,18.440400>}
box{<0,0,-0.076200><1.995744,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,18.440400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,18.440400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,18.440400>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,18.440400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,18.592800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.353125,0.000000,18.592800>}
box{<0,0,-0.076200><2.132928,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,18.592800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,18.592800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,18.592800>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,18.592800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.444581,0.000000,18.694400>}
box{<0,0,-0.076200><2.224384,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,18.745200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,18.745200>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,18.745200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,18.897600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,18.897600>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,18.897600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,19.050000>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,19.202400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,19.202400>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,19.202400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,19.354800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,19.354800>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,19.354800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,19.507200>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,19.659600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,19.659600>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,19.659600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,19.812000>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,19.964400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,19.964400>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,19.964400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,20.116800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,20.116800>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,20.116800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,20.269200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,20.269200>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,20.269200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,20.421597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,21.234400>}
box{<0,0,-0.076200><0.812803,0.035000,0.076200> rotate<0,90.000000,0> translate<9.220197,0.000000,21.234400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,20.421597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.617584,0.000000,20.421597>}
box{<0,0,-0.076200><1.397387,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,20.421597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,20.421600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.617594,0.000000,20.421600>}
box{<0,0,-0.076200><1.397397,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,20.421600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,20.421600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,20.421600>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,20.421600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,20.574000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.578106,0.000000,20.574000>}
box{<0,0,-0.076200><3.357909,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,20.574000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,20.574000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,20.574000>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,20.574000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.425706,0.000000,20.726400>}
box{<0,0,-0.076200><3.205509,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,20.726400>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,20.878800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.273306,0.000000,20.878800>}
box{<0,0,-0.076200><3.053109,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,20.878800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,20.878800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,20.878800>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,20.878800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,21.031200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.120906,0.000000,21.031200>}
box{<0,0,-0.076200><2.900709,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,21.031200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,21.031200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,21.031200>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,21.031200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,21.183600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.968506,0.000000,21.183600>}
box{<0,0,-0.076200><2.748309,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,21.183600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,21.183600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,21.183600>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,21.183600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,21.234400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.778688,0.000000,21.234400>}
box{<0,0,-0.076200><2.558491,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,21.234400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,21.336000>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,21.488400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,21.488400>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,21.488400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,21.640800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,21.640800>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,21.640800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,21.793200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,21.793200>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,21.793200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,21.945600>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,22.098000>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,22.250400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,22.250400>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,22.250400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,22.402800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,22.402800>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,22.402800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,22.555200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.578744,-1.535000,22.555200>}
box{<0,0,-0.076200><5.358547,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,22.555200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,22.707600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,22.707600>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,22.707600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.587094,-1.535000,22.860000>}
box{<0,0,-0.076200><5.366897,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,22.961597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,23.672800>}
box{<0,0,-0.076200><0.711203,0.035000,0.076200> rotate<0,90.000000,0> translate<9.220197,0.000000,23.672800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,22.961597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.778688,0.000000,22.961597>}
box{<0,0,-0.076200><2.558491,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,22.961597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,23.012400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.591269,-1.535000,23.012400>}
box{<0,0,-0.076200><5.371072,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,23.012400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,23.012400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.983600,0.000000,23.012400>}
box{<0,0,-0.076200><5.763403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,23.012400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.595444,-1.535000,23.164800>}
box{<0,0,-0.076200><5.375247,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.983600,0.000000,23.164800>}
box{<0,0,-0.076200><5.763403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,23.317200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.599622,-1.535000,23.317200>}
box{<0,0,-0.076200><5.379425,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,23.317200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,23.317200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.000144,0.000000,23.317200>}
box{<0,0,-0.076200><5.779947,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,23.317200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,23.469600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.603797,-1.535000,23.469600>}
box{<0,0,-0.076200><5.383600,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,23.469600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,23.469600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.104428,0.000000,23.469600>}
box{<0,0,-0.076200><5.884231,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,23.469600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.607972,-1.535000,23.622000>}
box{<0,0,-0.076200><5.387775,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,23.622000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.646581,0.000000,23.622000>}
box{<0,0,-0.076200><7.426384,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,23.622000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,23.672800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.337803,0.000000,23.672800>}
box{<0,0,-0.076200><1.117606,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,23.672800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,23.774400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.612147,-1.535000,23.774400>}
box{<0,0,-0.076200><5.391950,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,23.774400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,23.926800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.616322,-1.535000,23.926800>}
box{<0,0,-0.076200><5.396125,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,23.926800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,24.079200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.620497,-1.535000,24.079200>}
box{<0,0,-0.076200><5.400300,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,24.079200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,24.231600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.624672,-1.535000,24.231600>}
box{<0,0,-0.076200><5.404475,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,24.231600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.628847,-1.535000,24.384000>}
box{<0,0,-0.076200><5.408650,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,24.536400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.633022,-1.535000,24.536400>}
box{<0,0,-0.076200><5.412825,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,24.536400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,24.688800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.637197,-1.535000,24.688800>}
box{<0,0,-0.076200><5.417000,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,24.688800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,24.841200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.641375,-1.535000,24.841200>}
box{<0,0,-0.076200><5.421178,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,24.841200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.645550,-1.535000,24.993600>}
box{<0,0,-0.076200><5.425353,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.649725,-1.535000,25.146000>}
box{<0,0,-0.076200><5.429528,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,25.298400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.653900,-1.535000,25.298400>}
box{<0,0,-0.076200><5.433703,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,25.298400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,25.450800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.658075,-1.535000,25.450800>}
box{<0,0,-0.076200><5.437878,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,25.450800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,25.603197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,28.956000>}
box{<0,0,-0.076200><3.352803,0.035000,0.076200> rotate<0,90.000000,0> translate<9.220197,0.000000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,25.603197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.337803,0.000000,25.603197>}
box{<0,0,-0.076200><1.117606,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,25.603197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.681200,0.000000,25.603200>}
box{<0,0,-0.076200><4.461003,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.662250,-1.535000,25.603200>}
box{<0,0,-0.076200><5.442053,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,25.755600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.722266,0.000000,25.755600>}
box{<0,0,-0.076200><4.502069,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,25.755600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,25.755600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.666425,-1.535000,25.755600>}
box{<0,0,-0.076200><5.446228,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,25.755600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.900019,0.000000,25.908000>}
box{<0,0,-0.076200><4.679822,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.670600,-1.535000,25.908000>}
box{<0,0,-0.076200><5.450403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,26.060400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.587256,0.000000,26.060400>}
box{<0,0,-0.076200><5.367059,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,26.060400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,26.060400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.587256,-1.535000,26.060400>}
box{<0,0,-0.076200><5.367059,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,26.060400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,26.212800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,0.000000,26.212800>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,26.212800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,26.212800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,26.212800>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,26.212800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,26.365200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,0.000000,26.365200>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,26.365200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,26.365200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,26.365200>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,26.365200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,26.517600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.587259,0.000000,26.517600>}
box{<0,0,-0.076200><5.367062,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,26.517600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,26.517600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.587259,-1.535000,26.517600>}
box{<0,0,-0.076200><5.367062,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,26.517600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.739659,0.000000,26.670000>}
box{<0,0,-0.076200><5.519462,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.739659,-1.535000,26.670000>}
box{<0,0,-0.076200><5.519462,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780000,0.000000,26.822400>}
box{<0,0,-0.076200><8.559803,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,26.822400>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,26.974800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780000,0.000000,26.974800>}
box{<0,0,-0.076200><8.559803,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,26.974800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,26.974800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,26.974800>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,26.974800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,27.127200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780000,0.000000,27.127200>}
box{<0,0,-0.076200><8.559803,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,27.127200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,27.127200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,27.127200>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,27.127200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,27.279600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780000,0.000000,27.279600>}
box{<0,0,-0.076200><8.559803,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,27.279600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,27.279600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,27.279600>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,27.279600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780000,0.000000,27.432000>}
box{<0,0,-0.076200><8.559803,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,27.432000>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,27.584400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.940297,0.000000,27.584400>}
box{<0,0,-0.076200><10.720100,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,27.584400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,27.584400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,27.584400>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,27.584400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,27.736800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.929597,0.000000,27.736800>}
box{<0,0,-0.076200><10.709400,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,27.736800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,27.736800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,27.736800>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,27.736800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,27.889200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.929597,0.000000,27.889200>}
box{<0,0,-0.076200><10.709400,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,27.889200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,27.889200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,27.889200>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,27.889200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.929597,0.000000,28.041600>}
box{<0,0,-0.076200><10.709400,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,28.041600>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.929600,0.000000,28.194000>}
box{<0,0,-0.076200><10.709403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,28.194000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,28.194000>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,28.194000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,28.346400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.929600,0.000000,28.346400>}
box{<0,0,-0.076200><10.709403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,28.346400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,28.346400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,28.346400>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,28.346400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,28.498800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.929600,0.000000,28.498800>}
box{<0,0,-0.076200><10.709403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,28.498800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,28.498800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,28.498800>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,28.498800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,28.651200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.940300,0.000000,28.651200>}
box{<0,0,-0.076200><10.720103,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,28.651200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,28.651200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,28.651200>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,28.651200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,28.803600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.028628,0.000000,28.803600>}
box{<0,0,-0.076200><10.808431,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,28.803600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,28.803600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,28.803600>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,28.803600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.005800,0.000000,28.956000>}
box{<0,0,-0.076200><11.785603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,28.956000>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,29.108400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.005800,-1.535000,29.108400>}
box{<0,0,-0.076200><11.785603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,29.108400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.005800,-1.535000,29.260800>}
box{<0,0,-0.076200><11.785603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,29.413200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.005800,-1.535000,29.413200>}
box{<0,0,-0.076200><11.785603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,29.413200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,29.565600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.005800,-1.535000,29.565600>}
box{<0,0,-0.076200><11.785603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,29.565600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.005800,-1.535000,29.718000>}
box{<0,0,-0.076200><11.785603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,29.718000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,29.870400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.005800,-1.535000,29.870400>}
box{<0,0,-0.076200><11.785603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,29.870400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,30.022800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.005800,-1.535000,30.022800>}
box{<0,0,-0.076200><11.785603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,30.022800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,30.175200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.005800,-1.535000,30.175200>}
box{<0,0,-0.076200><11.785603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,30.175200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,30.327600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.005800,-1.535000,30.327600>}
box{<0,0,-0.076200><11.785603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,30.327600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.005800,-1.535000,30.480000>}
box{<0,0,-0.076200><11.785603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,30.632400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.005800,-1.535000,30.632400>}
box{<0,0,-0.076200><11.785603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,30.632400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,30.683200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.005800,-1.535000,30.683200>}
box{<0,0,-0.076200><11.785603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,30.683200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.337803,0.000000,23.672800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.337803,0.000000,24.561788>}
box{<0,0,-0.076200><0.888987,0.035000,0.076200> rotate<0,90.000000,0> translate<10.337803,0.000000,24.561788> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.337803,0.000000,23.774400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.490191,0.000000,23.774400>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<10.337803,0.000000,23.774400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.337803,0.000000,23.926800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.490191,0.000000,23.926800>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<10.337803,0.000000,23.926800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.337803,0.000000,24.079200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.490191,0.000000,24.079200>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<10.337803,0.000000,24.079200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.337803,0.000000,24.231600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.490191,0.000000,24.231600>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<10.337803,0.000000,24.231600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.337803,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.490191,0.000000,24.384000>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<10.337803,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.337803,0.000000,24.536400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.490191,0.000000,24.536400>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<10.337803,0.000000,24.536400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.337803,0.000000,24.561788>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.490191,0.000000,24.561788>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<10.337803,0.000000,24.561788> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.337803,0.000000,24.714209>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.337803,0.000000,25.603197>}
box{<0,0,-0.076200><0.888987,0.035000,0.076200> rotate<0,90.000000,0> translate<10.337803,0.000000,25.603197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.337803,0.000000,24.714209>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.490191,0.000000,24.714209>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<10.337803,0.000000,24.714209> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.337803,0.000000,24.841200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.490191,0.000000,24.841200>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<10.337803,0.000000,24.841200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.337803,0.000000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.490191,0.000000,24.993600>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<10.337803,0.000000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.337803,0.000000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.490191,0.000000,25.146000>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<10.337803,0.000000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.337803,0.000000,25.298400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.490191,0.000000,25.298400>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<10.337803,0.000000,25.298400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.337803,0.000000,25.450800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.490191,0.000000,25.450800>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<10.337803,0.000000,25.450800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.490191,0.000000,23.672800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.727472,0.000000,23.672800>}
box{<0,0,-0.076200><1.237281,0.035000,0.076200> rotate<0,0.000000,0> translate<10.490191,0.000000,23.672800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.490191,0.000000,24.561788>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.490191,0.000000,23.672800>}
box{<0,0,-0.076200><0.888987,0.035000,0.076200> rotate<0,-90.000000,0> translate<10.490191,0.000000,23.672800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.490191,0.000000,25.603197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.490191,0.000000,24.714209>}
box{<0,0,-0.076200><0.888987,0.035000,0.076200> rotate<0,-90.000000,0> translate<10.490191,0.000000,24.714209> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.490191,0.000000,25.603197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.727472,0.000000,25.603197>}
box{<0,0,-0.076200><1.237281,0.035000,0.076200> rotate<0,0.000000,0> translate<10.490191,0.000000,25.603197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.490209,0.000000,24.561803>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.490209,0.000000,24.714191>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,90.000000,0> translate<10.490209,0.000000,24.714191> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.490209,0.000000,24.561803>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.014197,0.000000,24.561803>}
box{<0,0,-0.076200><1.523988,0.035000,0.076200> rotate<0,0.000000,0> translate<10.490209,0.000000,24.561803> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.490209,0.000000,24.688800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.681197,0.000000,24.688800>}
box{<0,0,-0.076200><3.190988,0.035000,0.076200> rotate<0,0.000000,0> translate<10.490209,0.000000,24.688800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.490209,0.000000,24.714191>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.014197,0.000000,24.714191>}
box{<0,0,-0.076200><1.523988,0.035000,0.076200> rotate<0,0.000000,0> translate<10.490209,0.000000,24.714191> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.617584,0.000000,20.421597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.690062,0.000000,20.446013>}
box{<0,0,-0.076200><0.076480,0.035000,0.076200> rotate<0,-18.615841,0> translate<10.617584,0.000000,20.421597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.690062,0.000000,20.446013>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.739281,0.000000,20.421597>}
box{<0,0,-0.076200><0.054942,0.035000,0.076200> rotate<0,26.382590,0> translate<10.690062,0.000000,20.446013> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.712928,0.000000,17.881597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.444581,0.000000,18.694400>}
box{<0,0,-0.076200><1.093602,0.035000,0.076200> rotate<0,-48.004544,0> translate<10.712928,0.000000,17.881597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.733606,0.000000,15.341597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.492225,0.000000,16.154400>}
box{<0,0,-0.076200><1.111823,0.035000,0.076200> rotate<0,-46.971740,0> translate<10.733606,0.000000,15.341597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.739275,0.000000,20.421600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.730506,0.000000,20.421600>}
box{<0,0,-0.076200><1.991231,0.035000,0.076200> rotate<0,0.000000,0> translate<10.739275,0.000000,20.421600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.739281,0.000000,20.421597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.778688,0.000000,20.421597>}
box{<0,0,-0.076200><1.039406,0.035000,0.076200> rotate<0,0.000000,0> translate<10.739281,0.000000,20.421597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.774706,0.000000,12.801597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.587509,0.000000,13.614400>}
box{<0,0,-0.076200><1.149477,0.035000,0.076200> rotate<0,-44.997030,0> translate<10.774706,0.000000,12.801597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.722744,0.000000,10.388597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.079400,0.000000,10.745256>}
box{<0,0,-0.076200><0.504390,0.035000,0.076200> rotate<0,-44.997281,0> translate<11.722744,0.000000,10.388597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.727472,0.000000,23.672800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.811450,0.000000,23.695303>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-14.999808,0> translate<11.727472,0.000000,23.672800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.727472,0.000000,25.603197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.811450,0.000000,25.580694>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,14.999808,0> translate<11.727472,0.000000,25.603197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.778688,0.000000,8.661400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,8.795309>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<11.778688,0.000000,8.661400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.778688,0.000000,11.074400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,11.208309>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<11.778688,0.000000,11.074400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.778688,0.000000,20.421597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.782687,0.000000,20.417597>}
box{<0,0,-0.076200><0.005657,0.035000,0.076200> rotate<0,44.997030,0> translate<11.778688,0.000000,20.421597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.778688,0.000000,21.234400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.848197,0.000000,21.303909>}
box{<0,0,-0.076200><0.098301,0.035000,0.076200> rotate<0,-44.997030,0> translate<11.778688,0.000000,21.234400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.778688,0.000000,22.961597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,22.827687>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<11.778688,0.000000,22.961597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.779587,0.000000,12.800697>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,12.667688>}
box{<0,0,-0.076200><0.188104,0.035000,0.076200> rotate<0,44.997030,0> translate<11.779587,0.000000,12.800697> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.779587,0.000000,12.800697>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.079400,0.000000,13.100509>}
box{<0,0,-0.076200><0.423999,0.035000,0.076200> rotate<0,-44.997030,0> translate<11.779587,0.000000,12.800697> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.780491,0.000000,12.801600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.079400,0.000000,12.801600>}
box{<0,0,-0.076200><0.298909,0.035000,0.076200> rotate<0,0.000000,0> translate<11.780491,0.000000,12.801600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.782687,0.000000,20.417597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.734509,0.000000,20.417597>}
box{<0,0,-0.076200><0.951822,0.035000,0.076200> rotate<0,0.000000,0> translate<11.782687,0.000000,20.417597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.804088,0.000000,8.686800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.767400,0.000000,8.686800>}
box{<0,0,-0.076200><3.963312,0.035000,0.076200> rotate<0,0.000000,0> translate<11.804088,0.000000,8.686800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.811450,0.000000,23.695303>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.886747,0.000000,23.738775>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-29.997566,0> translate<11.811450,0.000000,23.695303> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.811450,0.000000,25.580694>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.886747,0.000000,25.537222>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,29.997566,0> translate<11.811450,0.000000,25.580694> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.829488,0.000000,11.125200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.079400,0.000000,11.125200>}
box{<0,0,-0.076200><0.249912,0.035000,0.076200> rotate<0,0.000000,0> translate<11.829488,0.000000,11.125200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.848197,0.000000,21.303909>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.734509,0.000000,20.417597>}
box{<0,0,-0.076200><1.253435,0.035000,0.076200> rotate<0,44.997030,0> translate<11.848197,0.000000,21.303909> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.880284,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.983600,0.000000,22.860000>}
box{<0,0,-0.076200><3.103316,0.035000,0.076200> rotate<0,0.000000,0> translate<11.880284,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.886747,0.000000,23.738775>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.948222,0.000000,23.800250>}
box{<0,0,-0.076200><0.086939,0.035000,0.076200> rotate<0,-44.997030,0> translate<11.886747,0.000000,23.738775> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.886747,0.000000,25.537222>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.948222,0.000000,25.475747>}
box{<0,0,-0.076200><0.086939,0.035000,0.076200> rotate<0,44.997030,0> translate<11.886747,0.000000,25.537222> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,8.795309>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,9.357144>}
box{<0,0,-0.076200><0.561834,0.035000,0.076200> rotate<0,90.000000,0> translate<11.912597,0.000000,9.357144> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,8.839200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.767400,0.000000,8.839200>}
box{<0,0,-0.076200><3.854803,0.035000,0.076200> rotate<0,0.000000,0> translate<11.912597,0.000000,8.839200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,8.991600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.798766,0.000000,8.991600>}
box{<0,0,-0.076200><3.886169,0.035000,0.076200> rotate<0,0.000000,0> translate<11.912597,0.000000,8.991600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.948509,0.000000,9.144000>}
box{<0,0,-0.076200><4.035913,0.035000,0.076200> rotate<0,0.000000,0> translate<11.912597,0.000000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,9.296400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,9.296400>}
box{<0,0,-0.076200><15.062203,0.035000,0.076200> rotate<0,0.000000,0> translate<11.912597,0.000000,9.296400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,9.357144>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.690056,0.000000,10.134600>}
box{<0,0,-0.076200><1.099491,0.035000,0.076200> rotate<0,-44.996915,0> translate<11.912597,0.000000,9.357144> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,11.208309>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,12.667688>}
box{<0,0,-0.076200><1.459378,0.035000,0.076200> rotate<0,90.000000,0> translate<11.912597,0.000000,12.667688> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,11.277600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.079400,0.000000,11.277600>}
box{<0,0,-0.076200><0.166803,0.035000,0.076200> rotate<0,0.000000,0> translate<11.912597,0.000000,11.277600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.079400,0.000000,11.430000>}
box{<0,0,-0.076200><0.166803,0.035000,0.076200> rotate<0,0.000000,0> translate<11.912597,0.000000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,11.582400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.079400,0.000000,11.582400>}
box{<0,0,-0.076200><0.166803,0.035000,0.076200> rotate<0,0.000000,0> translate<11.912597,0.000000,11.582400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,11.734800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.079400,0.000000,11.734800>}
box{<0,0,-0.076200><0.166803,0.035000,0.076200> rotate<0,0.000000,0> translate<11.912597,0.000000,11.734800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,11.887200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.079400,0.000000,11.887200>}
box{<0,0,-0.076200><0.166803,0.035000,0.076200> rotate<0,0.000000,0> translate<11.912597,0.000000,11.887200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,12.039600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.079400,0.000000,12.039600>}
box{<0,0,-0.076200><0.166803,0.035000,0.076200> rotate<0,0.000000,0> translate<11.912597,0.000000,12.039600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.079400,0.000000,12.192000>}
box{<0,0,-0.076200><0.166803,0.035000,0.076200> rotate<0,0.000000,0> translate<11.912597,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,12.344400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.079400,0.000000,12.344400>}
box{<0,0,-0.076200><0.166803,0.035000,0.076200> rotate<0,0.000000,0> translate<11.912597,0.000000,12.344400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,12.496800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.079400,0.000000,12.496800>}
box{<0,0,-0.076200><0.166803,0.035000,0.076200> rotate<0,0.000000,0> translate<11.912597,0.000000,12.496800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,12.649200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.079400,0.000000,12.649200>}
box{<0,0,-0.076200><0.166803,0.035000,0.076200> rotate<0,0.000000,0> translate<11.912597,0.000000,12.649200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,22.245294>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,22.827687>}
box{<0,0,-0.076200><0.582394,0.035000,0.076200> rotate<0,90.000000,0> translate<11.912597,0.000000,22.827687> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,22.245294>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.240294,0.000000,20.917597>}
box{<0,0,-0.076200><1.877647,0.035000,0.076200> rotate<0,44.997030,0> translate<11.912597,0.000000,22.245294> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,22.250400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.974922,0.000000,22.250400>}
box{<0,0,-0.076200><2.062325,0.035000,0.076200> rotate<0,0.000000,0> translate<11.912597,0.000000,22.250400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,22.402800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.038453,0.000000,22.402800>}
box{<0,0,-0.076200><2.125856,0.035000,0.076200> rotate<0,0.000000,0> translate<11.912597,0.000000,22.402800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,22.555200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.983597,0.000000,22.555200>}
box{<0,0,-0.076200><3.071000,0.035000,0.076200> rotate<0,0.000000,0> translate<11.912597,0.000000,22.555200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,22.707600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.983597,0.000000,22.707600>}
box{<0,0,-0.076200><3.071000,0.035000,0.076200> rotate<0,0.000000,0> translate<11.912597,0.000000,22.707600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.922372,0.000000,23.774400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.494181,0.000000,23.774400>}
box{<0,0,-0.076200><4.571809,0.035000,0.076200> rotate<0,0.000000,0> translate<11.922372,0.000000,23.774400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.932891,0.000000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.079400,0.000000,12.954000>}
box{<0,0,-0.076200><0.146509,0.035000,0.076200> rotate<0,0.000000,0> translate<11.932891,0.000000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.948222,0.000000,23.800250>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.991694,0.000000,23.875547>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-59.996495,0> translate<11.948222,0.000000,23.800250> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.948222,0.000000,25.475747>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.991694,0.000000,25.400450>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,59.996495,0> translate<11.948222,0.000000,25.475747> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.962625,0.000000,25.450800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.681200,0.000000,25.450800>}
box{<0,0,-0.076200><1.718575,0.035000,0.076200> rotate<0,0.000000,0> translate<11.962625,0.000000,25.450800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.991694,0.000000,23.875547>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.014197,0.000000,23.959525>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-74.994252,0> translate<11.991694,0.000000,23.875547> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.991694,0.000000,25.400450>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.014197,0.000000,25.316472>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,74.994252,0> translate<11.991694,0.000000,25.400450> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.004253,0.000000,9.448800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.915109,0.000000,9.448800>}
box{<0,0,-0.076200><0.910856,0.035000,0.076200> rotate<0,0.000000,0> translate<12.004253,0.000000,9.448800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.005425,0.000000,23.926800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.341781,0.000000,23.926800>}
box{<0,0,-0.076200><4.336356,0.035000,0.076200> rotate<0,0.000000,0> translate<12.005425,0.000000,23.926800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.014197,0.000000,23.959525>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.014197,0.000000,24.561803>}
box{<0,0,-0.076200><0.602278,0.035000,0.076200> rotate<0,90.000000,0> translate<12.014197,0.000000,24.561803> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.014197,0.000000,24.079200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.189381,0.000000,24.079200>}
box{<0,0,-0.076200><4.175184,0.035000,0.076200> rotate<0,0.000000,0> translate<12.014197,0.000000,24.079200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.014197,0.000000,24.231600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.036981,0.000000,24.231600>}
box{<0,0,-0.076200><4.022784,0.035000,0.076200> rotate<0,0.000000,0> translate<12.014197,0.000000,24.231600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.014197,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.900003,0.000000,24.384000>}
box{<0,0,-0.076200><1.885806,0.035000,0.076200> rotate<0,0.000000,0> translate<12.014197,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.014197,0.000000,24.536400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.722263,0.000000,24.536400>}
box{<0,0,-0.076200><1.708066,0.035000,0.076200> rotate<0,0.000000,0> translate<12.014197,0.000000,24.536400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.014197,0.000000,24.714191>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.014197,0.000000,25.316472>}
box{<0,0,-0.076200><0.602281,0.035000,0.076200> rotate<0,90.000000,0> translate<12.014197,0.000000,25.316472> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.014197,0.000000,24.841200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.681197,0.000000,24.841200>}
box{<0,0,-0.076200><1.667000,0.035000,0.076200> rotate<0,0.000000,0> translate<12.014197,0.000000,24.841200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.014197,0.000000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.681197,0.000000,24.993600>}
box{<0,0,-0.076200><1.667000,0.035000,0.076200> rotate<0,0.000000,0> translate<12.014197,0.000000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.014197,0.000000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.285188,0.000000,25.146000>}
box{<0,0,-0.076200><2.270991,0.035000,0.076200> rotate<0,0.000000,0> translate<12.014197,0.000000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.014197,0.000000,25.298400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.681200,0.000000,25.298400>}
box{<0,0,-0.076200><1.667003,0.035000,0.076200> rotate<0,0.000000,0> translate<12.014197,0.000000,25.298400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.059891,0.000000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.973600,0.000000,22.098000>}
box{<0,0,-0.076200><1.913709,0.035000,0.076200> rotate<0,0.000000,0> translate<12.059891,0.000000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.079400,0.000000,13.100509>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.079400,0.000000,10.745256>}
box{<0,0,-0.076200><2.355253,0.035000,0.076200> rotate<0,-90.000000,0> translate<12.079400,0.000000,10.745256> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.156653,0.000000,9.601200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.797000,0.000000,9.601200>}
box{<0,0,-0.076200><0.640347,0.035000,0.076200> rotate<0,0.000000,0> translate<12.156653,0.000000,9.601200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.212291,0.000000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.973600,0.000000,21.945600>}
box{<0,0,-0.076200><1.761309,0.035000,0.076200> rotate<0,0.000000,0> translate<12.212291,0.000000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.309053,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.797000,0.000000,9.753600>}
box{<0,0,-0.076200><0.487947,0.035000,0.076200> rotate<0,0.000000,0> translate<12.309053,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.364691,0.000000,21.793200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.986391,0.000000,21.793200>}
box{<0,0,-0.076200><1.621700,0.035000,0.076200> rotate<0,0.000000,0> translate<12.364691,0.000000,21.793200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.461453,0.000000,9.906000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.797000,0.000000,9.906000>}
box{<0,0,-0.076200><0.335547,0.035000,0.076200> rotate<0,0.000000,0> translate<12.461453,0.000000,9.906000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.517091,0.000000,21.640800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.973600,0.000000,21.640800>}
box{<0,0,-0.076200><1.456509,0.035000,0.076200> rotate<0,0.000000,0> translate<12.517091,0.000000,21.640800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.613853,0.000000,10.058400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.797000,0.000000,10.058400>}
box{<0,0,-0.076200><0.183147,0.035000,0.076200> rotate<0,0.000000,0> translate<12.613853,0.000000,10.058400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.669491,0.000000,21.488400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.973600,0.000000,21.488400>}
box{<0,0,-0.076200><1.304109,0.035000,0.076200> rotate<0,0.000000,0> translate<12.669491,0.000000,21.488400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.690056,0.000000,10.134600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.797000,0.000000,10.134600>}
box{<0,0,-0.076200><0.106944,0.035000,0.076200> rotate<0,0.000000,0> translate<12.690056,0.000000,10.134600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.797000,0.000000,9.566909>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.930909,0.000000,9.433000>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<12.797000,0.000000,9.566909> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.797000,0.000000,10.134600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.797000,0.000000,9.566909>}
box{<0,0,-0.076200><0.567691,0.035000,0.076200> rotate<0,-90.000000,0> translate<12.797000,0.000000,9.566909> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.821891,0.000000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.984994,0.000000,21.336000>}
box{<0,0,-0.076200><1.163103,0.035000,0.076200> rotate<0,0.000000,0> translate<12.821891,0.000000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.930909,0.000000,9.433000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.920288,0.000000,9.433000>}
box{<0,0,-0.076200><0.989378,0.035000,0.076200> rotate<0,0.000000,0> translate<12.930909,0.000000,9.433000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.942997,0.000000,11.090197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.942997,0.000000,14.745344>}
box{<0,0,-0.076200><3.655147,0.035000,0.076200> rotate<0,90.000000,0> translate<12.942997,0.000000,14.745344> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.942997,0.000000,11.090197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.920288,0.000000,11.090197>}
box{<0,0,-0.076200><0.977291,0.035000,0.076200> rotate<0,0.000000,0> translate<12.942997,0.000000,11.090197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.942997,0.000000,11.125200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.622228,0.000000,11.125200>}
box{<0,0,-0.076200><1.679231,0.035000,0.076200> rotate<0,0.000000,0> translate<12.942997,0.000000,11.125200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.942997,0.000000,11.277600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.903113,0.000000,11.277600>}
box{<0,0,-0.076200><2.960116,0.035000,0.076200> rotate<0,0.000000,0> translate<12.942997,0.000000,11.277600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.942997,0.000000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.786781,0.000000,11.430000>}
box{<0,0,-0.076200><0.843784,0.035000,0.076200> rotate<0,0.000000,0> translate<12.942997,0.000000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.942997,0.000000,11.582400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.634381,0.000000,11.582400>}
box{<0,0,-0.076200><0.691384,0.035000,0.076200> rotate<0,0.000000,0> translate<12.942997,0.000000,11.582400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.942997,0.000000,11.734800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.481981,0.000000,11.734800>}
box{<0,0,-0.076200><0.538984,0.035000,0.076200> rotate<0,0.000000,0> translate<12.942997,0.000000,11.734800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.942997,0.000000,11.887200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.370800,0.000000,11.887200>}
box{<0,0,-0.076200><0.427803,0.035000,0.076200> rotate<0,0.000000,0> translate<12.942997,0.000000,11.887200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.942997,0.000000,12.039600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.370800,0.000000,12.039600>}
box{<0,0,-0.076200><0.427803,0.035000,0.076200> rotate<0,0.000000,0> translate<12.942997,0.000000,12.039600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.942997,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.238109,0.000000,12.192000>}
box{<0,0,-0.076200><0.295113,0.035000,0.076200> rotate<0,0.000000,0> translate<12.942997,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.942997,0.000000,12.344400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.173200,0.000000,12.344400>}
box{<0,0,-0.076200><0.230203,0.035000,0.076200> rotate<0,0.000000,0> translate<12.942997,0.000000,12.344400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.942997,0.000000,12.496800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.173200,0.000000,12.496800>}
box{<0,0,-0.076200><0.230203,0.035000,0.076200> rotate<0,0.000000,0> translate<12.942997,0.000000,12.496800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.942997,0.000000,12.649200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.173200,0.000000,12.649200>}
box{<0,0,-0.076200><0.230203,0.035000,0.076200> rotate<0,0.000000,0> translate<12.942997,0.000000,12.649200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.942997,0.000000,12.801600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.173200,0.000000,12.801600>}
box{<0,0,-0.076200><0.230203,0.035000,0.076200> rotate<0,0.000000,0> translate<12.942997,0.000000,12.801600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.942997,0.000000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.173200,0.000000,12.954000>}
box{<0,0,-0.076200><0.230203,0.035000,0.076200> rotate<0,0.000000,0> translate<12.942997,0.000000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.942997,0.000000,13.106400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.173200,0.000000,13.106400>}
box{<0,0,-0.076200><0.230203,0.035000,0.076200> rotate<0,0.000000,0> translate<12.942997,0.000000,13.106400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.942997,0.000000,13.258800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.173200,0.000000,13.258800>}
box{<0,0,-0.076200><0.230203,0.035000,0.076200> rotate<0,0.000000,0> translate<12.942997,0.000000,13.258800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.942997,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.238113,0.000000,13.411200>}
box{<0,0,-0.076200><0.295116,0.035000,0.076200> rotate<0,0.000000,0> translate<12.942997,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.942997,0.000000,13.563600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.237803,0.000000,13.563600>}
box{<0,0,-0.076200><0.294806,0.035000,0.076200> rotate<0,0.000000,0> translate<12.942997,0.000000,13.563600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.942997,0.000000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.097997,0.000000,13.716000>}
box{<0,0,-0.076200><0.155000,0.035000,0.076200> rotate<0,0.000000,0> translate<12.942997,0.000000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.942997,0.000000,13.868400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.071597,0.000000,13.868400>}
box{<0,0,-0.076200><0.128600,0.035000,0.076200> rotate<0,0.000000,0> translate<12.942997,0.000000,13.868400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.942997,0.000000,14.020800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.071597,0.000000,14.020800>}
box{<0,0,-0.076200><0.128600,0.035000,0.076200> rotate<0,0.000000,0> translate<12.942997,0.000000,14.020800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.942997,0.000000,14.173200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.071597,0.000000,14.173200>}
box{<0,0,-0.076200><0.128600,0.035000,0.076200> rotate<0,0.000000,0> translate<12.942997,0.000000,14.173200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.942997,0.000000,14.325600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.675588,0.000000,14.325600>}
box{<0,0,-0.076200><0.732591,0.035000,0.076200> rotate<0,0.000000,0> translate<12.942997,0.000000,14.325600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.942997,0.000000,14.478000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.071600,0.000000,14.478000>}
box{<0,0,-0.076200><0.128603,0.035000,0.076200> rotate<0,0.000000,0> translate<12.942997,0.000000,14.478000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.942997,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.071600,0.000000,14.630400>}
box{<0,0,-0.076200><0.128603,0.035000,0.076200> rotate<0,0.000000,0> translate<12.942997,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.942997,0.000000,14.745344>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.119788,0.000000,14.922134>}
box{<0,0,-0.076200><0.250020,0.035000,0.076200> rotate<0,-44.997030,0> translate<12.942997,0.000000,14.745344> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.974291,0.000000,21.183600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.973600,0.000000,21.183600>}
box{<0,0,-0.076200><0.999309,0.035000,0.076200> rotate<0,0.000000,0> translate<12.974291,0.000000,21.183600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.980453,0.000000,14.782800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.071600,0.000000,14.782800>}
box{<0,0,-0.076200><0.091147,0.035000,0.076200> rotate<0,0.000000,0> translate<12.980453,0.000000,14.782800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.055597,0.000000,16.079250>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.055597,0.000000,17.886703>}
box{<0,0,-0.076200><1.807453,0.035000,0.076200> rotate<0,90.000000,0> translate<13.055597,0.000000,17.886703> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.055597,0.000000,16.079250>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.156141,0.000000,16.179797>}
box{<0,0,-0.076200><0.142193,0.035000,0.076200> rotate<0,-44.997921,0> translate<13.055597,0.000000,16.079250> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.055597,0.000000,16.154400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.130747,0.000000,16.154400>}
box{<0,0,-0.076200><0.075150,0.035000,0.076200> rotate<0,0.000000,0> translate<13.055597,0.000000,16.154400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.055597,0.000000,16.306800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.000138,0.000000,16.306800>}
box{<0,0,-0.076200><1.944541,0.035000,0.076200> rotate<0,0.000000,0> translate<13.055597,0.000000,16.306800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.055597,0.000000,16.459200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.983597,0.000000,16.459200>}
box{<0,0,-0.076200><1.928000,0.035000,0.076200> rotate<0,0.000000,0> translate<13.055597,0.000000,16.459200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.055597,0.000000,16.611600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.983597,0.000000,16.611600>}
box{<0,0,-0.076200><1.928000,0.035000,0.076200> rotate<0,0.000000,0> translate<13.055597,0.000000,16.611600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.055597,0.000000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.983597,0.000000,16.764000>}
box{<0,0,-0.076200><1.928000,0.035000,0.076200> rotate<0,0.000000,0> translate<13.055597,0.000000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.055597,0.000000,16.916400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.983600,0.000000,16.916400>}
box{<0,0,-0.076200><1.928003,0.035000,0.076200> rotate<0,0.000000,0> translate<13.055597,0.000000,16.916400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.055597,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.983600,0.000000,17.068800>}
box{<0,0,-0.076200><1.928003,0.035000,0.076200> rotate<0,0.000000,0> translate<13.055597,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.055597,0.000000,17.221200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.181309,0.000000,17.221200>}
box{<0,0,-0.076200><1.125713,0.035000,0.076200> rotate<0,0.000000,0> translate<13.055597,0.000000,17.221200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.055597,0.000000,17.373600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.075200,0.000000,17.373600>}
box{<0,0,-0.076200><1.019603,0.035000,0.076200> rotate<0,0.000000,0> translate<13.055597,0.000000,17.373600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.055597,0.000000,17.526000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.075200,0.000000,17.526000>}
box{<0,0,-0.076200><1.019603,0.035000,0.076200> rotate<0,0.000000,0> translate<13.055597,0.000000,17.526000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.055597,0.000000,17.678400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.075200,0.000000,17.678400>}
box{<0,0,-0.076200><1.019603,0.035000,0.076200> rotate<0,0.000000,0> translate<13.055597,0.000000,17.678400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.055597,0.000000,17.830800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.075200,0.000000,17.830800>}
box{<0,0,-0.076200><1.019603,0.035000,0.076200> rotate<0,0.000000,0> translate<13.055597,0.000000,17.830800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.055597,0.000000,17.886703>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.375294,0.000000,18.206400>}
box{<0,0,-0.076200><0.452120,0.035000,0.076200> rotate<0,-44.997030,0> translate<13.055597,0.000000,17.886703> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.071597,0.000000,14.224003>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.071600,0.000000,13.806725>}
box{<0,0,-0.076200><0.417278,0.035000,0.076200> rotate<0,89.993631,0> translate<13.071597,0.000000,14.224003> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.071597,0.000000,14.224003>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.675588,0.000000,14.224003>}
box{<0,0,-0.076200><0.603991,0.035000,0.076200> rotate<0,0.000000,0> translate<13.071597,0.000000,14.224003> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.071597,0.000000,14.376391>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.071600,0.000000,14.793672>}
box{<0,0,-0.076200><0.417281,0.035000,0.076200> rotate<0,-89.993631,0> translate<13.071597,0.000000,14.376391> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.071597,0.000000,14.376391>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.675588,0.000000,14.376391>}
box{<0,0,-0.076200><0.603991,0.035000,0.076200> rotate<0,0.000000,0> translate<13.071597,0.000000,14.376391> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.071600,0.000000,13.806725>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.094103,0.000000,13.722747>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,74.994252,0> translate<13.071600,0.000000,13.806725> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.071600,0.000000,14.793672>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.094103,0.000000,14.877650>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-74.994252,0> translate<13.071600,0.000000,14.793672> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.094103,0.000000,13.722747>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.137575,0.000000,13.647450>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,59.996495,0> translate<13.094103,0.000000,13.722747> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.094103,0.000000,14.877650>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.119788,0.000000,14.922134>}
box{<0,0,-0.076200><0.051367,0.035000,0.076200> rotate<0,-59.994776,0> translate<13.094103,0.000000,14.877650> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.126691,0.000000,21.031200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.973600,0.000000,21.031200>}
box{<0,0,-0.076200><0.846909,0.035000,0.076200> rotate<0,0.000000,0> translate<13.126691,0.000000,21.031200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.137575,0.000000,13.647450>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.199050,0.000000,13.585975>}
box{<0,0,-0.076200><0.086939,0.035000,0.076200> rotate<0,44.997030,0> translate<13.137575,0.000000,13.647450> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.152094,0.000000,17.983200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.075200,0.000000,17.983200>}
box{<0,0,-0.076200><0.923106,0.035000,0.076200> rotate<0,0.000000,0> translate<13.152094,0.000000,17.983200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.156141,0.000000,16.179797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.079031,0.000000,16.179797>}
box{<0,0,-0.076200><1.922891,0.035000,0.076200> rotate<0,0.000000,0> translate<13.156141,0.000000,16.179797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.173200,0.000000,12.256909>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.307109,0.000000,12.123000>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<13.173200,0.000000,12.256909> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.173200,0.000000,13.346288>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.173200,0.000000,12.256909>}
box{<0,0,-0.076200><1.089378,0.035000,0.076200> rotate<0,-90.000000,0> translate<13.173200,0.000000,12.256909> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.173200,0.000000,13.346288>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.307109,0.000000,13.480197>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<13.173200,0.000000,13.346288> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.199050,0.000000,13.585975>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.274347,0.000000,13.542503>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,29.997566,0> translate<13.199050,0.000000,13.585975> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.229863,0.000000,15.032209>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.274347,0.000000,15.057894>}
box{<0,0,-0.076200><0.051367,0.035000,0.076200> rotate<0,-29.999285,0> translate<13.229863,0.000000,15.032209> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.229863,0.000000,15.032209>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.513856,0.000000,15.316200>}
box{<0,0,-0.076200><0.401626,0.035000,0.076200> rotate<0,-44.996715,0> translate<13.229863,0.000000,15.032209> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.240294,0.000000,20.917597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.973600,0.000000,20.917597>}
box{<0,0,-0.076200><0.733306,0.035000,0.076200> rotate<0,0.000000,0> translate<13.240294,0.000000,20.917597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.274347,0.000000,13.542503>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.358325,0.000000,13.520000>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,14.999808,0> translate<13.274347,0.000000,13.542503> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.274347,0.000000,15.057894>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.358325,0.000000,15.080397>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-14.999808,0> translate<13.274347,0.000000,15.057894> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.285253,0.000000,15.087600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.056788,0.000000,15.087600>}
box{<0,0,-0.076200><1.771534,0.035000,0.076200> rotate<0,0.000000,0> translate<13.285253,0.000000,15.087600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.304494,0.000000,18.135600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.075200,0.000000,18.135600>}
box{<0,0,-0.076200><0.770706,0.035000,0.076200> rotate<0,0.000000,0> translate<13.304494,0.000000,18.135600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.307109,0.000000,12.123000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.370800,0.000000,12.123000>}
box{<0,0,-0.076200><0.063691,0.035000,0.076200> rotate<0,0.000000,0> translate<13.307109,0.000000,12.123000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.307109,0.000000,13.480197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.196487,0.000000,13.480197>}
box{<0,0,-0.076200><0.889378,0.035000,0.076200> rotate<0,0.000000,0> translate<13.307109,0.000000,13.480197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.358325,0.000000,13.520000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.675603,0.000000,13.520000>}
box{<0,0,-0.076200><0.317278,0.035000,0.076200> rotate<0,0.000000,0> translate<13.358325,0.000000,13.520000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.358325,0.000000,15.080397>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.675603,0.000000,15.080397>}
box{<0,0,-0.076200><0.317278,0.035000,0.076200> rotate<0,0.000000,0> translate<13.358325,0.000000,15.080397> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.370800,0.000000,11.845981>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.639800,0.000000,11.576981>}
box{<0,0,-0.076200><0.380423,0.035000,0.076200> rotate<0,44.997030,0> translate<13.370800,0.000000,11.845981> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.370800,0.000000,12.123000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.370800,0.000000,11.845981>}
box{<0,0,-0.076200><0.277019,0.035000,0.076200> rotate<0,-90.000000,0> translate<13.370800,0.000000,11.845981> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.375294,0.000000,18.206400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.075200,0.000000,18.206400>}
box{<0,0,-0.076200><0.699906,0.035000,0.076200> rotate<0,0.000000,0> translate<13.375294,0.000000,18.206400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.437653,0.000000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.188141,0.000000,15.240000>}
box{<0,0,-0.076200><1.750488,0.035000,0.076200> rotate<0,0.000000,0> translate<13.437653,0.000000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.513856,0.000000,15.316200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.111941,0.000000,15.316200>}
box{<0,0,-0.076200><1.598084,0.035000,0.076200> rotate<0,0.000000,0> translate<13.513856,0.000000,15.316200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.639800,0.000000,11.576981>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.862981,0.000000,11.353800>}
box{<0,0,-0.076200><0.315626,0.035000,0.076200> rotate<0,44.997030,0> translate<13.639800,0.000000,11.576981> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.675588,0.000000,14.376391>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.675588,0.000000,14.224003>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,-90.000000,0> translate<13.675588,0.000000,14.224003> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.675603,0.000000,13.520000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.675603,0.000000,14.223988>}
box{<0,0,-0.076200><0.703988,0.035000,0.076200> rotate<0,90.000000,0> translate<13.675603,0.000000,14.223988> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.675603,0.000000,13.563600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.827991,0.000000,13.563600>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<13.675603,0.000000,13.563600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.675603,0.000000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.827991,0.000000,13.716000>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<13.675603,0.000000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.675603,0.000000,13.868400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.827991,0.000000,13.868400>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<13.675603,0.000000,13.868400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.675603,0.000000,14.020800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.827991,0.000000,14.020800>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<13.675603,0.000000,14.020800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.675603,0.000000,14.173200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.827991,0.000000,14.173200>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<13.675603,0.000000,14.173200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.675603,0.000000,14.223988>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.827991,0.000000,14.223988>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<13.675603,0.000000,14.223988> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.675603,0.000000,14.376409>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.675603,0.000000,15.080397>}
box{<0,0,-0.076200><0.703987,0.035000,0.076200> rotate<0,90.000000,0> translate<13.675603,0.000000,15.080397> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.675603,0.000000,14.376409>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.827991,0.000000,14.376409>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<13.675603,0.000000,14.376409> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.675603,0.000000,14.478000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.827991,0.000000,14.478000>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<13.675603,0.000000,14.478000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.675603,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.827991,0.000000,14.630400>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<13.675603,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.675603,0.000000,14.782800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.827991,0.000000,14.782800>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<13.675603,0.000000,14.782800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.675603,0.000000,14.935200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.827991,0.000000,14.935200>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<13.675603,0.000000,14.935200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.681197,0.000000,25.069803>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.681200,0.000000,24.652525>}
box{<0,0,-0.076200><0.417278,0.035000,0.076200> rotate<0,89.993631,0> translate<13.681197,0.000000,25.069803> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.681197,0.000000,25.069803>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.285188,0.000000,25.069803>}
box{<0,0,-0.076200><0.603991,0.035000,0.076200> rotate<0,0.000000,0> translate<13.681197,0.000000,25.069803> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.681197,0.000000,25.222191>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.681200,0.000000,25.639472>}
box{<0,0,-0.076200><0.417281,0.035000,0.076200> rotate<0,-89.993631,0> translate<13.681197,0.000000,25.222191> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.681197,0.000000,25.222191>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.285188,0.000000,25.222191>}
box{<0,0,-0.076200><0.603991,0.035000,0.076200> rotate<0,0.000000,0> translate<13.681197,0.000000,25.222191> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.681200,0.000000,24.652525>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.703703,0.000000,24.568547>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,74.994252,0> translate<13.681200,0.000000,24.652525> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.681200,0.000000,25.639472>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.703703,0.000000,25.723450>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-74.994252,0> translate<13.681200,0.000000,25.639472> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.703703,0.000000,24.568547>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.747175,0.000000,24.493250>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,59.996495,0> translate<13.703703,0.000000,24.568547> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.703703,0.000000,25.723450>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.747175,0.000000,25.798747>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-59.996495,0> translate<13.703703,0.000000,25.723450> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.747175,0.000000,24.493250>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.808650,0.000000,24.431775>}
box{<0,0,-0.076200><0.086939,0.035000,0.076200> rotate<0,44.997030,0> translate<13.747175,0.000000,24.493250> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.747175,0.000000,25.798747>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.808650,0.000000,25.860222>}
box{<0,0,-0.076200><0.086939,0.035000,0.076200> rotate<0,-44.997030,0> translate<13.747175,0.000000,25.798747> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.808650,0.000000,24.431775>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.883947,0.000000,24.388303>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,29.997566,0> translate<13.808650,0.000000,24.431775> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.808650,0.000000,25.860222>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.883947,0.000000,25.903694>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-29.997566,0> translate<13.808650,0.000000,25.860222> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.827991,0.000000,13.520000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.145272,0.000000,13.520000>}
box{<0,0,-0.076200><0.317281,0.035000,0.076200> rotate<0,0.000000,0> translate<13.827991,0.000000,13.520000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.827991,0.000000,14.223988>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.827991,0.000000,13.520000>}
box{<0,0,-0.076200><0.703988,0.035000,0.076200> rotate<0,-90.000000,0> translate<13.827991,0.000000,13.520000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.827991,0.000000,15.080394>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.827991,0.000000,14.376409>}
box{<0,0,-0.076200><0.703984,0.035000,0.076200> rotate<0,-90.000000,0> translate<13.827991,0.000000,14.376409> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.827991,0.000000,15.080394>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.145272,0.000000,15.080397>}
box{<0,0,-0.076200><0.317281,0.035000,0.076200> rotate<0,-0.000564,0> translate<13.827991,0.000000,15.080394> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.828009,0.000000,14.224003>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.828009,0.000000,14.376391>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,90.000000,0> translate<13.828009,0.000000,14.376391> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.828009,0.000000,14.224003>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.431997,0.000000,14.224003>}
box{<0,0,-0.076200><0.603988,0.035000,0.076200> rotate<0,0.000000,0> translate<13.828009,0.000000,14.224003> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.828009,0.000000,14.325600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.473200,0.000000,14.325600>}
box{<0,0,-0.076200><0.645191,0.035000,0.076200> rotate<0,0.000000,0> translate<13.828009,0.000000,14.325600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.828009,0.000000,14.376391>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.431997,0.000000,14.376391>}
box{<0,0,-0.076200><0.603988,0.035000,0.076200> rotate<0,0.000000,0> translate<13.828009,0.000000,14.376391> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.862981,0.000000,11.353800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.905816,0.000000,11.353800>}
box{<0,0,-0.076200><2.042834,0.035000,0.076200> rotate<0,0.000000,0> translate<13.862981,0.000000,11.353800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.883947,0.000000,24.388303>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.967925,0.000000,24.365800>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,14.999808,0> translate<13.883947,0.000000,24.388303> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.883947,0.000000,25.903694>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.967925,0.000000,25.926197>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-14.999808,0> translate<13.883947,0.000000,25.903694> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.920288,0.000000,9.433000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.054197,0.000000,9.566909>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<13.920288,0.000000,9.433000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.920288,0.000000,11.090197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.054197,0.000000,10.956288>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<13.920288,0.000000,11.090197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.936088,0.000000,9.448800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.571425,0.000000,9.448800>}
box{<0,0,-0.076200><0.635338,0.035000,0.076200> rotate<0,0.000000,0> translate<13.936088,0.000000,9.448800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.967925,0.000000,24.365800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.285203,0.000000,24.365800>}
box{<0,0,-0.076200><0.317278,0.035000,0.076200> rotate<0,0.000000,0> translate<13.967925,0.000000,24.365800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.967925,0.000000,25.926197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.285203,0.000000,25.926197>}
box{<0,0,-0.076200><0.317278,0.035000,0.076200> rotate<0,0.000000,0> translate<13.967925,0.000000,25.926197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.973600,0.000000,21.061981>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.973600,0.000000,20.917597>}
box{<0,0,-0.076200><0.144384,0.035000,0.076200> rotate<0,-90.000000,0> translate<13.973600,0.000000,20.917597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.973600,0.000000,21.061981>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.728766,0.000000,21.061981>}
box{<0,0,-0.076200><0.755166,0.035000,0.076200> rotate<0,0.000000,0> translate<13.973600,0.000000,21.061981> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.973600,0.000000,21.062013>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.728766,0.000000,21.062013>}
box{<0,0,-0.076200><0.755166,0.035000,0.076200> rotate<0,0.000000,0> translate<13.973600,0.000000,21.062013> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.973600,0.000000,21.245472>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.973600,0.000000,21.062013>}
box{<0,0,-0.076200><0.183459,0.035000,0.076200> rotate<0,-90.000000,0> translate<13.973600,0.000000,21.062013> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.973600,0.000000,21.245472>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.991428,0.000000,21.312000>}
box{<0,0,-0.076200><0.068875,0.035000,0.076200> rotate<0,-74.993469,0> translate<13.973600,0.000000,21.245472> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.973600,0.000000,21.378525>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.991428,0.000000,21.312000>}
box{<0,0,-0.076200><0.068872,0.035000,0.076200> rotate<0,74.992796,0> translate<13.973600,0.000000,21.378525> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.973600,0.000000,21.561981>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.973600,0.000000,21.378525>}
box{<0,0,-0.076200><0.183456,0.035000,0.076200> rotate<0,-90.000000,0> translate<13.973600,0.000000,21.378525> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.973600,0.000000,21.561981>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.728766,0.000000,21.561981>}
box{<0,0,-0.076200><0.755166,0.035000,0.076200> rotate<0,0.000000,0> translate<13.973600,0.000000,21.561981> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.973600,0.000000,21.562013>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.728766,0.000000,21.562013>}
box{<0,0,-0.076200><0.755166,0.035000,0.076200> rotate<0,0.000000,0> translate<13.973600,0.000000,21.562013> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.973600,0.000000,21.745472>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.973600,0.000000,21.562013>}
box{<0,0,-0.076200><0.183459,0.035000,0.076200> rotate<0,-90.000000,0> translate<13.973600,0.000000,21.562013> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.973600,0.000000,21.745472>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.991428,0.000000,21.812000>}
box{<0,0,-0.076200><0.068875,0.035000,0.076200> rotate<0,-74.993469,0> translate<13.973600,0.000000,21.745472> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.973600,0.000000,21.878525>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.991428,0.000000,21.812000>}
box{<0,0,-0.076200><0.068872,0.035000,0.076200> rotate<0,74.992796,0> translate<13.973600,0.000000,21.878525> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.973600,0.000000,22.061981>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.973600,0.000000,21.878525>}
box{<0,0,-0.076200><0.183456,0.035000,0.076200> rotate<0,-90.000000,0> translate<13.973600,0.000000,21.878525> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.973600,0.000000,22.061981>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.728766,0.000000,22.061981>}
box{<0,0,-0.076200><0.755166,0.035000,0.076200> rotate<0,0.000000,0> translate<13.973600,0.000000,22.061981> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.973600,0.000000,22.062013>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.728766,0.000000,22.062013>}
box{<0,0,-0.076200><0.755166,0.035000,0.076200> rotate<0,0.000000,0> translate<13.973600,0.000000,22.062013> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.973600,0.000000,22.245472>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.973600,0.000000,22.062013>}
box{<0,0,-0.076200><0.183459,0.035000,0.076200> rotate<0,-90.000000,0> translate<13.973600,0.000000,22.062013> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.973600,0.000000,22.245472>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.996103,0.000000,22.329450>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-74.994252,0> translate<13.973600,0.000000,22.245472> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.996103,0.000000,22.329450>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.039575,0.000000,22.404747>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-59.996495,0> translate<13.996103,0.000000,22.329450> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.037684,0.000000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.513550,0.000000,10.972800>}
box{<0,0,-0.076200><0.475866,0.035000,0.076200> rotate<0,0.000000,0> translate<14.037684,0.000000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.039575,0.000000,22.404747>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.101050,0.000000,22.466222>}
box{<0,0,-0.076200><0.086939,0.035000,0.076200> rotate<0,-44.997030,0> translate<14.039575,0.000000,22.404747> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.054197,0.000000,9.566909>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.054197,0.000000,10.956288>}
box{<0,0,-0.076200><1.389378,0.035000,0.076200> rotate<0,90.000000,0> translate<14.054197,0.000000,10.956288> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.054197,0.000000,9.601200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.499934,0.000000,9.601200>}
box{<0,0,-0.076200><0.445737,0.035000,0.076200> rotate<0,0.000000,0> translate<14.054197,0.000000,9.601200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.054197,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.495400,0.000000,9.753600>}
box{<0,0,-0.076200><0.441203,0.035000,0.076200> rotate<0,0.000000,0> translate<14.054197,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.054197,0.000000,9.906000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.495400,0.000000,9.906000>}
box{<0,0,-0.076200><0.441203,0.035000,0.076200> rotate<0,0.000000,0> translate<14.054197,0.000000,9.906000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.054197,0.000000,10.058400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.495400,0.000000,10.058400>}
box{<0,0,-0.076200><0.441203,0.035000,0.076200> rotate<0,0.000000,0> translate<14.054197,0.000000,10.058400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.054197,0.000000,10.210800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.149388,0.000000,10.210800>}
box{<0,0,-0.076200><1.095191,0.035000,0.076200> rotate<0,0.000000,0> translate<14.054197,0.000000,10.210800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.054197,0.000000,10.363200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.495400,0.000000,10.363200>}
box{<0,0,-0.076200><0.441203,0.035000,0.076200> rotate<0,0.000000,0> translate<14.054197,0.000000,10.363200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.054197,0.000000,10.515600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.495400,0.000000,10.515600>}
box{<0,0,-0.076200><0.441203,0.035000,0.076200> rotate<0,0.000000,0> translate<14.054197,0.000000,10.515600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.054197,0.000000,10.668000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.495400,0.000000,10.668000>}
box{<0,0,-0.076200><0.441203,0.035000,0.076200> rotate<0,0.000000,0> translate<14.054197,0.000000,10.668000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.054197,0.000000,10.820400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.495400,0.000000,10.820400>}
box{<0,0,-0.076200><0.441203,0.035000,0.076200> rotate<0,0.000000,0> translate<14.054197,0.000000,10.820400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.075200,0.000000,17.327309>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.209109,0.000000,17.193400>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<14.075200,0.000000,17.327309> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.075200,0.000000,17.796688>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.075200,0.000000,17.327309>}
box{<0,0,-0.076200><0.469378,0.035000,0.076200> rotate<0,-90.000000,0> translate<14.075200,0.000000,17.327309> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.075200,0.000000,17.796688>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.090513,0.000000,17.812000>}
box{<0,0,-0.076200><0.021655,0.035000,0.076200> rotate<0,-44.997030,0> translate<14.075200,0.000000,17.796688> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.075200,0.000000,17.827309>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.090513,0.000000,17.812000>}
box{<0,0,-0.076200><0.021653,0.035000,0.076200> rotate<0,44.991183,0> translate<14.075200,0.000000,17.827309> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.075200,0.000000,18.206400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.075200,0.000000,17.827309>}
box{<0,0,-0.076200><0.379091,0.035000,0.076200> rotate<0,-90.000000,0> translate<14.075200,0.000000,17.827309> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.101050,0.000000,22.466222>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.176347,0.000000,22.509694>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-29.997566,0> translate<14.101050,0.000000,22.466222> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.145272,0.000000,13.520000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.229250,0.000000,13.542503>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-14.999808,0> translate<14.145272,0.000000,13.520000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.145272,0.000000,15.080397>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.229250,0.000000,15.057894>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,14.999808,0> translate<14.145272,0.000000,15.080397> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.171409,0.000000,12.123000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.178616,0.000000,12.115797>}
box{<0,0,-0.076200><0.010189,0.035000,0.076200> rotate<0,44.984605,0> translate<14.171409,0.000000,12.123000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.171409,0.000000,12.123000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.196487,0.000000,12.123000>}
box{<0,0,-0.076200><0.025078,0.035000,0.076200> rotate<0,0.000000,0> translate<14.171409,0.000000,12.123000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.176347,0.000000,22.509694>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.260325,0.000000,22.532197>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-14.999808,0> translate<14.176347,0.000000,22.509694> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.178616,0.000000,12.115797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.590181,0.000000,12.115797>}
box{<0,0,-0.076200><1.411566,0.035000,0.076200> rotate<0,0.000000,0> translate<14.178616,0.000000,12.115797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.196487,0.000000,12.123000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.330397,0.000000,12.256909>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<14.196487,0.000000,12.123000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.196487,0.000000,13.480197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.330397,0.000000,13.346288>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<14.196487,0.000000,13.480197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.209109,0.000000,17.193400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.983600,0.000000,17.193400>}
box{<0,0,-0.076200><0.774491,0.035000,0.076200> rotate<0,0.000000,0> translate<14.209109,0.000000,17.193400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.229250,0.000000,13.542503>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.304547,0.000000,13.585975>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-29.997566,0> translate<14.229250,0.000000,13.542503> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.229250,0.000000,15.057894>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.304547,0.000000,15.014422>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,29.997566,0> translate<14.229250,0.000000,15.057894> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.260325,0.000000,22.532197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.728781,0.000000,22.532197>}
box{<0,0,-0.076200><0.468456,0.035000,0.076200> rotate<0,0.000000,0> translate<14.260325,0.000000,22.532197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.265484,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.538113,0.000000,13.411200>}
box{<0,0,-0.076200><0.272628,0.035000,0.076200> rotate<0,0.000000,0> translate<14.265484,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.265488,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.538109,0.000000,12.192000>}
box{<0,0,-0.076200><0.272622,0.035000,0.076200> rotate<0,0.000000,0> translate<14.265488,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.265791,0.000000,13.563600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.670800,0.000000,13.563600>}
box{<0,0,-0.076200><0.405009,0.035000,0.076200> rotate<0,0.000000,0> translate<14.265791,0.000000,13.563600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.285188,0.000000,25.222191>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.285188,0.000000,25.069803>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,-90.000000,0> translate<14.285188,0.000000,25.069803> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.285203,0.000000,24.365800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.285203,0.000000,25.069788>}
box{<0,0,-0.076200><0.703988,0.035000,0.076200> rotate<0,90.000000,0> translate<14.285203,0.000000,25.069788> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.285203,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.437591,0.000000,24.384000>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<14.285203,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.285203,0.000000,24.536400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.437591,0.000000,24.536400>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<14.285203,0.000000,24.536400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.285203,0.000000,24.688800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.437591,0.000000,24.688800>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<14.285203,0.000000,24.688800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.285203,0.000000,24.841200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.437591,0.000000,24.841200>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<14.285203,0.000000,24.841200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.285203,0.000000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.437591,0.000000,24.993600>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<14.285203,0.000000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.285203,0.000000,25.069788>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.437591,0.000000,25.069788>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<14.285203,0.000000,25.069788> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.285203,0.000000,25.222209>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.285203,0.000000,25.926197>}
box{<0,0,-0.076200><0.703988,0.035000,0.076200> rotate<0,90.000000,0> translate<14.285203,0.000000,25.926197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.285203,0.000000,25.222209>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.437591,0.000000,25.222209>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<14.285203,0.000000,25.222209> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.285203,0.000000,25.298400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.437591,0.000000,25.298400>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<14.285203,0.000000,25.298400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.285203,0.000000,25.450800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.437591,0.000000,25.450800>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<14.285203,0.000000,25.450800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.285203,0.000000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.437591,0.000000,25.603200>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<14.285203,0.000000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.285203,0.000000,25.755600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.437591,0.000000,25.755600>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<14.285203,0.000000,25.755600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.285203,0.000000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.437591,0.000000,25.908000>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<14.285203,0.000000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.304547,0.000000,13.585975>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.366022,0.000000,13.647450>}
box{<0,0,-0.076200><0.086939,0.035000,0.076200> rotate<0,-44.997030,0> translate<14.304547,0.000000,13.585975> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.304547,0.000000,15.014422>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.366022,0.000000,14.952947>}
box{<0,0,-0.076200><0.086939,0.035000,0.076200> rotate<0,44.997030,0> translate<14.304547,0.000000,15.014422> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.330397,0.000000,12.256909>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.330397,0.000000,13.346288>}
box{<0,0,-0.076200><1.089378,0.035000,0.076200> rotate<0,90.000000,0> translate<14.330397,0.000000,13.346288> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.330397,0.000000,12.344400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.473200,0.000000,12.344400>}
box{<0,0,-0.076200><0.142803,0.035000,0.076200> rotate<0,0.000000,0> translate<14.330397,0.000000,12.344400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.330397,0.000000,12.496800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.473200,0.000000,12.496800>}
box{<0,0,-0.076200><0.142803,0.035000,0.076200> rotate<0,0.000000,0> translate<14.330397,0.000000,12.496800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.330397,0.000000,12.649200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.473200,0.000000,12.649200>}
box{<0,0,-0.076200><0.142803,0.035000,0.076200> rotate<0,0.000000,0> translate<14.330397,0.000000,12.649200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.330397,0.000000,12.801600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.473200,0.000000,12.801600>}
box{<0,0,-0.076200><0.142803,0.035000,0.076200> rotate<0,0.000000,0> translate<14.330397,0.000000,12.801600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.330397,0.000000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.473200,0.000000,12.954000>}
box{<0,0,-0.076200><0.142803,0.035000,0.076200> rotate<0,0.000000,0> translate<14.330397,0.000000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.330397,0.000000,13.106400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.473200,0.000000,13.106400>}
box{<0,0,-0.076200><0.142803,0.035000,0.076200> rotate<0,0.000000,0> translate<14.330397,0.000000,13.106400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.330397,0.000000,13.258800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.473200,0.000000,13.258800>}
box{<0,0,-0.076200><0.142803,0.035000,0.076200> rotate<0,0.000000,0> translate<14.330397,0.000000,13.258800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.366022,0.000000,13.647450>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.409494,0.000000,13.722747>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-59.996495,0> translate<14.366022,0.000000,13.647450> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.366022,0.000000,14.952947>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.409494,0.000000,14.877650>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,59.996495,0> translate<14.366022,0.000000,14.952947> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.376269,0.000000,14.935200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.563512,0.000000,14.935200>}
box{<0,0,-0.076200><0.187244,0.035000,0.076200> rotate<0,0.000000,0> translate<14.376269,0.000000,14.935200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.405597,0.000000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.512709,0.000000,13.716000>}
box{<0,0,-0.076200><0.107112,0.035000,0.076200> rotate<0,0.000000,0> translate<14.405597,0.000000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.409494,0.000000,13.722747>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.431997,0.000000,13.806725>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-74.994252,0> translate<14.409494,0.000000,13.722747> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.409494,0.000000,14.877650>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.431997,0.000000,14.793672>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,74.994252,0> translate<14.409494,0.000000,14.877650> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.431997,0.000000,13.806725>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.431997,0.000000,14.224003>}
box{<0,0,-0.076200><0.417278,0.035000,0.076200> rotate<0,90.000000,0> translate<14.431997,0.000000,14.224003> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.431997,0.000000,13.868400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.473200,0.000000,13.868400>}
box{<0,0,-0.076200><0.041203,0.035000,0.076200> rotate<0,0.000000,0> translate<14.431997,0.000000,13.868400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.431997,0.000000,14.020800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.473200,0.000000,14.020800>}
box{<0,0,-0.076200><0.041203,0.035000,0.076200> rotate<0,0.000000,0> translate<14.431997,0.000000,14.020800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.431997,0.000000,14.173200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.473200,0.000000,14.173200>}
box{<0,0,-0.076200><0.041203,0.035000,0.076200> rotate<0,0.000000,0> translate<14.431997,0.000000,14.173200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.431997,0.000000,14.376391>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.431997,0.000000,14.793672>}
box{<0,0,-0.076200><0.417281,0.035000,0.076200> rotate<0,90.000000,0> translate<14.431997,0.000000,14.793672> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.431997,0.000000,14.478000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.473200,0.000000,14.478000>}
box{<0,0,-0.076200><0.041203,0.035000,0.076200> rotate<0,0.000000,0> translate<14.431997,0.000000,14.478000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.431997,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.473200,0.000000,14.630400>}
box{<0,0,-0.076200><0.041203,0.035000,0.076200> rotate<0,0.000000,0> translate<14.431997,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.431997,0.000000,14.782800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.473200,0.000000,14.782800>}
box{<0,0,-0.076200><0.041203,0.035000,0.076200> rotate<0,0.000000,0> translate<14.431997,0.000000,14.782800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.437591,0.000000,24.365800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.754872,0.000000,24.365800>}
box{<0,0,-0.076200><0.317281,0.035000,0.076200> rotate<0,0.000000,0> translate<14.437591,0.000000,24.365800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.437591,0.000000,25.069788>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.437591,0.000000,24.365800>}
box{<0,0,-0.076200><0.703988,0.035000,0.076200> rotate<0,-90.000000,0> translate<14.437591,0.000000,24.365800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.437591,0.000000,25.926194>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.437591,0.000000,25.222209>}
box{<0,0,-0.076200><0.703984,0.035000,0.076200> rotate<0,-90.000000,0> translate<14.437591,0.000000,25.222209> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.437591,0.000000,25.926194>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.721463,0.000000,25.926197>}
box{<0,0,-0.076200><0.283872,0.035000,0.076200> rotate<0,-0.000631,0> translate<14.437591,0.000000,25.926194> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.437609,0.000000,25.069803>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.437609,0.000000,25.222191>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,90.000000,0> translate<14.437609,0.000000,25.222191> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.437609,0.000000,25.069803>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.041597,0.000000,25.069803>}
box{<0,0,-0.076200><0.603988,0.035000,0.076200> rotate<0,0.000000,0> translate<14.437609,0.000000,25.069803> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.437609,0.000000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.082800,0.000000,25.146000>}
box{<0,0,-0.076200><0.645191,0.035000,0.076200> rotate<0,0.000000,0> translate<14.437609,0.000000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.437609,0.000000,25.222191>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.041597,0.000000,25.222191>}
box{<0,0,-0.076200><0.603988,0.035000,0.076200> rotate<0,0.000000,0> translate<14.437609,0.000000,25.222191> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.473200,0.000000,12.256909>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.607109,0.000000,12.123000>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<14.473200,0.000000,12.256909> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.473200,0.000000,13.346288>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.473200,0.000000,12.256909>}
box{<0,0,-0.076200><1.089378,0.035000,0.076200> rotate<0,-90.000000,0> translate<14.473200,0.000000,12.256909> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.473200,0.000000,13.346288>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.607109,0.000000,13.480197>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<14.473200,0.000000,13.346288> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.473200,0.000000,13.755509>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.607109,0.000000,13.621600>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<14.473200,0.000000,13.755509> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.473200,0.000000,14.844888>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.473200,0.000000,13.755509>}
box{<0,0,-0.076200><1.089378,0.035000,0.076200> rotate<0,-90.000000,0> translate<14.473200,0.000000,13.755509> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.473200,0.000000,14.844888>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.607109,0.000000,14.978797>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<14.473200,0.000000,14.844888> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.495400,0.000000,9.618125>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.517903,0.000000,9.534147>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,74.994252,0> translate<14.495400,0.000000,9.618125> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.495400,0.000000,10.185403>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.495400,0.000000,9.618125>}
box{<0,0,-0.076200><0.567278,0.035000,0.076200> rotate<0,-90.000000,0> translate<14.495400,0.000000,9.618125> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.495400,0.000000,10.185403>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.149388,0.000000,10.185403>}
box{<0,0,-0.076200><0.653988,0.035000,0.076200> rotate<0,0.000000,0> translate<14.495400,0.000000,10.185403> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.495400,0.000000,10.337791>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.149388,0.000000,10.337791>}
box{<0,0,-0.076200><0.653988,0.035000,0.076200> rotate<0,0.000000,0> translate<14.495400,0.000000,10.337791> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.495400,0.000000,10.905072>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.495400,0.000000,10.337791>}
box{<0,0,-0.076200><0.567281,0.035000,0.076200> rotate<0,-90.000000,0> translate<14.495400,0.000000,10.337791> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.495400,0.000000,10.905072>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.517903,0.000000,10.989050>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-74.994252,0> translate<14.495400,0.000000,10.905072> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.517903,0.000000,9.534147>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.561375,0.000000,9.458850>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,59.996495,0> translate<14.517903,0.000000,9.534147> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.517903,0.000000,10.989050>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.561375,0.000000,11.064347>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-59.996495,0> translate<14.517903,0.000000,10.989050> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.561375,0.000000,9.458850>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.622850,0.000000,9.397375>}
box{<0,0,-0.076200><0.086939,0.035000,0.076200> rotate<0,44.997030,0> translate<14.561375,0.000000,9.458850> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.561375,0.000000,11.064347>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.622850,0.000000,11.125822>}
box{<0,0,-0.076200><0.086939,0.035000,0.076200> rotate<0,-44.997030,0> translate<14.561375,0.000000,11.064347> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.574863,-1.535000,22.413634>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,22.408631>}
box{<0,0,-0.076200><0.006890,0.035000,0.076200> rotate<0,46.558985,0> translate<14.574863,-1.535000,22.413634> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.574863,-1.535000,22.413634>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,22.586556>}
box{<0,0,-0.076200><0.172987,0.035000,0.076200> rotate<0,-88.424837,0> translate<14.574863,-1.535000,22.413634> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,15.823141>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.240000,-1.535000,15.162741>}
box{<0,0,-0.076200><0.933947,0.035000,0.076200> rotate<0,44.997030,0> translate<14.579600,-1.535000,15.823141> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,22.408631>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,15.823141>}
box{<0,0,-0.076200><6.585491,0.035000,0.076200> rotate<0,-90.000000,0> translate<14.579600,-1.535000,15.823141> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,22.759456>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,22.586556>}
box{<0,0,-0.076200><0.172900,0.035000,0.076200> rotate<0,-90.000000,0> translate<14.579600,-1.535000,22.586556> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,22.759456>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.584472,-1.535000,22.764325>}
box{<0,0,-0.076200><0.006888,0.035000,0.076200> rotate<0,-44.978650,0> translate<14.579600,-1.535000,22.759456> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,26.068056>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.672441,-1.535000,25.975219>}
box{<0,0,-0.076200><0.131294,0.035000,0.076200> rotate<0,44.996066,0> translate<14.579600,-1.535000,26.068056> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,0.000000,26.068056>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.721463,0.000000,25.926197>}
box{<0,0,-0.076200><0.200622,0.035000,0.076200> rotate<0,44.996399,0> translate<14.579600,0.000000,26.068056> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,0.000000,26.509941>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,0.000000,26.068056>}
box{<0,0,-0.076200><0.441884,0.035000,0.076200> rotate<0,-90.000000,0> translate<14.579600,0.000000,26.068056> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,26.509941>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,26.068056>}
box{<0,0,-0.076200><0.441884,0.035000,0.076200> rotate<0,-90.000000,0> translate<14.579600,-1.535000,26.068056> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,0.000000,26.509941>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.892056,0.000000,26.822397>}
box{<0,0,-0.076200><0.441880,0.035000,0.076200> rotate<0,-44.997030,0> translate<14.579600,0.000000,26.509941> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,26.509941>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.892056,-1.535000,26.822397>}
box{<0,0,-0.076200><0.441880,0.035000,0.076200> rotate<0,-44.997030,0> translate<14.579600,-1.535000,26.509941> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.584472,-1.535000,22.764325>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.672441,-1.535000,25.975219>}
box{<0,0,-0.076200><3.212099,0.035000,0.076200> rotate<0,-88.424826,0> translate<14.584472,-1.535000,22.764325> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.607109,0.000000,12.123000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.496488,0.000000,12.123000>}
box{<0,0,-0.076200><0.889378,0.035000,0.076200> rotate<0,0.000000,0> translate<14.607109,0.000000,12.123000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.607109,0.000000,13.480197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.670800,0.000000,13.480197>}
box{<0,0,-0.076200><0.063691,0.035000,0.076200> rotate<0,0.000000,0> translate<14.607109,0.000000,13.480197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.607109,0.000000,13.621600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.670800,0.000000,13.621600>}
box{<0,0,-0.076200><0.063691,0.035000,0.076200> rotate<0,0.000000,0> translate<14.607109,0.000000,13.621600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.607109,0.000000,14.978797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.947981,0.000000,14.978797>}
box{<0,0,-0.076200><0.340872,0.035000,0.076200> rotate<0,0.000000,0> translate<14.607109,0.000000,14.978797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.622850,0.000000,9.397375>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.698147,0.000000,9.353903>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,29.997566,0> translate<14.622850,0.000000,9.397375> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.622850,0.000000,11.125822>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.698147,0.000000,11.169294>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-29.997566,0> translate<14.622850,0.000000,11.125822> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.670800,0.000000,13.621600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.670800,0.000000,13.480197>}
box{<0,0,-0.076200><0.141403,0.035000,0.076200> rotate<0,-90.000000,0> translate<14.670800,0.000000,13.480197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.698147,0.000000,9.353903>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.782125,0.000000,9.331400>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,14.999808,0> translate<14.698147,0.000000,9.353903> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.698147,0.000000,11.169294>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.782125,0.000000,11.191797>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-14.999808,0> translate<14.698147,0.000000,11.169294> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.728766,0.000000,21.062013>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.728766,0.000000,21.061981>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,-90.000000,0> translate<14.728766,0.000000,21.061981> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.728766,0.000000,21.562013>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.728766,0.000000,21.561981>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,-90.000000,0> translate<14.728766,0.000000,21.561981> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.728766,0.000000,22.062013>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.728766,0.000000,22.061981>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,-90.000000,0> translate<14.728766,0.000000,22.061981> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.728781,0.000000,21.062031>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.728781,0.000000,21.532197>}
box{<0,0,-0.076200><0.470166,0.035000,0.076200> rotate<0,90.000000,0> translate<14.728781,0.000000,21.532197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.728781,0.000000,21.062031>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.728813,0.000000,21.062031>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<14.728781,0.000000,21.062031> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.728781,0.000000,21.183600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.728813,0.000000,21.183600>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<14.728781,0.000000,21.183600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.728781,0.000000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.728813,0.000000,21.336000>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<14.728781,0.000000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.728781,0.000000,21.488400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.728813,0.000000,21.488400>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<14.728781,0.000000,21.488400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.728781,0.000000,21.532197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.728781,0.000000,21.561966>}
box{<0,0,-0.076200><0.029769,0.035000,0.076200> rotate<0,90.000000,0> translate<14.728781,0.000000,21.561966> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.728781,0.000000,21.561966>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.728813,0.000000,21.561966>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<14.728781,0.000000,21.561966> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.728781,0.000000,21.562031>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.728781,0.000000,22.032197>}
box{<0,0,-0.076200><0.470166,0.035000,0.076200> rotate<0,90.000000,0> translate<14.728781,0.000000,22.032197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.728781,0.000000,21.562031>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.728813,0.000000,21.562031>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<14.728781,0.000000,21.562031> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.728781,0.000000,21.640800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.728813,0.000000,21.640800>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<14.728781,0.000000,21.640800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.728781,0.000000,21.793200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.728813,0.000000,21.793200>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<14.728781,0.000000,21.793200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.728781,0.000000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.728813,0.000000,21.945600>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<14.728781,0.000000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.728781,0.000000,22.032197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.728781,0.000000,22.061966>}
box{<0,0,-0.076200><0.029769,0.035000,0.076200> rotate<0,90.000000,0> translate<14.728781,0.000000,22.061966> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.728781,0.000000,22.061966>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.728813,0.000000,22.061966>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<14.728781,0.000000,22.061966> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.728781,0.000000,22.062031>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.728781,0.000000,22.532197>}
box{<0,0,-0.076200><0.470166,0.035000,0.076200> rotate<0,90.000000,0> translate<14.728781,0.000000,22.532197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.728781,0.000000,22.062031>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.728813,0.000000,22.062031>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<14.728781,0.000000,22.062031> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.728781,0.000000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.728813,0.000000,22.098000>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<14.728781,0.000000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.728781,0.000000,22.250400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.728813,0.000000,22.250400>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<14.728781,0.000000,22.250400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.728781,0.000000,22.402800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.728813,0.000000,22.402800>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<14.728781,0.000000,22.402800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.728813,0.000000,21.561966>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.728813,0.000000,21.062031>}
box{<0,0,-0.076200><0.499934,0.035000,0.076200> rotate<0,-90.000000,0> translate<14.728813,0.000000,21.062031> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.728813,0.000000,22.061966>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.728813,0.000000,21.562031>}
box{<0,0,-0.076200><0.499934,0.035000,0.076200> rotate<0,-90.000000,0> translate<14.728813,0.000000,21.562031> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.728813,0.000000,22.532194>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.728813,0.000000,22.062031>}
box{<0,0,-0.076200><0.470163,0.035000,0.076200> rotate<0,-90.000000,0> translate<14.728813,0.000000,22.062031> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.728813,0.000000,22.532194>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.983600,0.000000,22.532194>}
box{<0,0,-0.076200><0.254788,0.035000,0.076200> rotate<0,0.000000,0> translate<14.728813,0.000000,22.532194> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.754872,0.000000,24.365800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.838850,0.000000,24.388303>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-14.999808,0> translate<14.754872,0.000000,24.365800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.782125,0.000000,9.331400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.149403,0.000000,9.331400>}
box{<0,0,-0.076200><0.367278,0.035000,0.076200> rotate<0,0.000000,0> translate<14.782125,0.000000,9.331400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.782125,0.000000,11.191797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.149403,0.000000,11.191797>}
box{<0,0,-0.076200><0.367278,0.035000,0.076200> rotate<0,0.000000,0> translate<14.782125,0.000000,11.191797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.822791,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.884581,0.000000,24.384000>}
box{<0,0,-0.076200><1.061791,0.035000,0.076200> rotate<0,0.000000,0> translate<14.822791,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.838850,0.000000,24.388303>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.914147,0.000000,24.431775>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-29.997566,0> translate<14.838850,0.000000,24.388303> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.892056,0.000000,26.822397>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.333941,0.000000,26.822397>}
box{<0,0,-0.076200><0.441884,0.035000,0.076200> rotate<0,0.000000,0> translate<14.892056,0.000000,26.822397> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.892056,-1.535000,26.822397>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.333941,-1.535000,26.822397>}
box{<0,0,-0.076200><0.441884,0.035000,0.076200> rotate<0,0.000000,0> translate<14.892056,-1.535000,26.822397> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.914147,0.000000,24.431775>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.975622,0.000000,24.493250>}
box{<0,0,-0.076200><0.086939,0.035000,0.076200> rotate<0,-44.997030,0> translate<14.914147,0.000000,24.431775> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.947981,0.000000,14.978797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.198666,0.000000,15.229478>}
box{<0,0,-0.076200><0.354519,0.035000,0.076200> rotate<0,-44.996673,0> translate<14.947981,0.000000,14.978797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.975622,0.000000,24.493250>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.019094,0.000000,24.568547>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-59.996495,0> translate<14.975622,0.000000,24.493250> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.983597,0.000000,16.836981>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.983600,0.000000,16.368525>}
box{<0,0,-0.076200><0.468456,0.035000,0.076200> rotate<0,89.993678,0> translate<14.983597,0.000000,16.836981> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.983597,0.000000,16.836981>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.453766,0.000000,16.836981>}
box{<0,0,-0.076200><0.470169,0.035000,0.076200> rotate<0,0.000000,0> translate<14.983597,0.000000,16.836981> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.983597,0.000000,22.786981>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.983600,0.000000,22.532194>}
box{<0,0,-0.076200><0.254788,0.035000,0.076200> rotate<0,89.993358,0> translate<14.983597,0.000000,22.786981> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.983597,0.000000,22.786981>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.453766,0.000000,22.786981>}
box{<0,0,-0.076200><0.470169,0.035000,0.076200> rotate<0,0.000000,0> translate<14.983597,0.000000,22.786981> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.983600,0.000000,16.368525>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.006103,0.000000,16.284547>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,74.994252,0> translate<14.983600,0.000000,16.368525> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.983600,0.000000,16.837013>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.453766,0.000000,16.837013>}
box{<0,0,-0.076200><0.470166,0.035000,0.076200> rotate<0,0.000000,0> translate<14.983600,0.000000,16.837013> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.983600,0.000000,17.193400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.983600,0.000000,16.837013>}
box{<0,0,-0.076200><0.356388,0.035000,0.076200> rotate<0,-90.000000,0> translate<14.983600,0.000000,16.837013> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.983600,0.000000,22.787012>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.453766,0.000000,22.787012>}
box{<0,0,-0.076200><0.470166,0.035000,0.076200> rotate<0,0.000000,0> translate<14.983600,0.000000,22.787012> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.983600,0.000000,23.255472>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.983600,0.000000,22.787012>}
box{<0,0,-0.076200><0.468459,0.035000,0.076200> rotate<0,-90.000000,0> translate<14.983600,0.000000,22.787012> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.983600,0.000000,23.255472>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.006103,0.000000,23.339450>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-74.994252,0> translate<14.983600,0.000000,23.255472> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.000531,0.000000,24.536400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.147709,0.000000,24.536400>}
box{<0,0,-0.076200><0.147178,0.035000,0.076200> rotate<0,0.000000,0> translate<15.000531,0.000000,24.536400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.000531,0.000000,25.755600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.019094,0.000000,25.723450>}
box{<0,0,-0.076200><0.037124,0.035000,0.076200> rotate<0,59.995120,0> translate<15.000531,0.000000,25.755600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.000531,0.000000,25.755600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.107584,0.000000,25.755600>}
box{<0,0,-0.076200><0.107053,0.035000,0.076200> rotate<0,0.000000,0> translate<15.000531,0.000000,25.755600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.006103,0.000000,16.284547>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.049575,0.000000,16.209250>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,59.996495,0> translate<15.006103,0.000000,16.284547> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.006103,0.000000,23.339450>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.049575,0.000000,23.414747>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-59.996495,0> translate<15.006103,0.000000,23.339450> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.019094,0.000000,24.568547>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.041597,0.000000,24.652525>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-74.994252,0> translate<15.019094,0.000000,24.568547> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.019094,0.000000,25.723450>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.041597,0.000000,25.639472>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,74.994252,0> translate<15.019094,0.000000,25.723450> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.041597,0.000000,24.652525>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.041597,0.000000,25.069803>}
box{<0,0,-0.076200><0.417278,0.035000,0.076200> rotate<0,90.000000,0> translate<15.041597,0.000000,25.069803> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.041597,0.000000,24.688800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.082800,0.000000,24.688800>}
box{<0,0,-0.076200><0.041203,0.035000,0.076200> rotate<0,0.000000,0> translate<15.041597,0.000000,24.688800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.041597,0.000000,24.841200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.082800,0.000000,24.841200>}
box{<0,0,-0.076200><0.041203,0.035000,0.076200> rotate<0,0.000000,0> translate<15.041597,0.000000,24.841200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.041597,0.000000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.082800,0.000000,24.993600>}
box{<0,0,-0.076200><0.041203,0.035000,0.076200> rotate<0,0.000000,0> translate<15.041597,0.000000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.041597,0.000000,25.222191>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.041597,0.000000,25.639472>}
box{<0,0,-0.076200><0.417281,0.035000,0.076200> rotate<0,90.000000,0> translate<15.041597,0.000000,25.639472> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.041597,0.000000,25.298400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.082800,0.000000,25.298400>}
box{<0,0,-0.076200><0.041203,0.035000,0.076200> rotate<0,0.000000,0> translate<15.041597,0.000000,25.298400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.041597,0.000000,25.450800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.082800,0.000000,25.450800>}
box{<0,0,-0.076200><0.041203,0.035000,0.076200> rotate<0,0.000000,0> translate<15.041597,0.000000,25.450800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.041597,0.000000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.082800,0.000000,25.603200>}
box{<0,0,-0.076200><0.041203,0.035000,0.076200> rotate<0,0.000000,0> translate<15.041597,0.000000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.049575,0.000000,16.209250>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.079031,0.000000,16.179797>}
box{<0,0,-0.076200><0.041655,0.035000,0.076200> rotate<0,44.993991,0> translate<15.049575,0.000000,16.209250> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.049575,0.000000,23.414747>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.111050,0.000000,23.476222>}
box{<0,0,-0.076200><0.086939,0.035000,0.076200> rotate<0,-44.997030,0> translate<15.049575,0.000000,23.414747> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.082800,0.000000,24.601309>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.216709,0.000000,24.467400>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<15.082800,0.000000,24.601309> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.082800,0.000000,25.690688>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.082800,0.000000,24.601309>}
box{<0,0,-0.076200><1.089378,0.035000,0.076200> rotate<0,-90.000000,0> translate<15.082800,0.000000,24.601309> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.082800,0.000000,25.690688>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.127650,0.000000,25.735534>}
box{<0,0,-0.076200><0.063425,0.035000,0.076200> rotate<0,-44.995034,0> translate<15.082800,0.000000,25.690688> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.107584,0.000000,25.755600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.127650,0.000000,25.735534>}
box{<0,0,-0.076200><0.028377,0.035000,0.076200> rotate<0,44.997030,0> translate<15.107584,0.000000,25.755600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.111050,0.000000,23.476222>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.186347,0.000000,23.519694>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-29.997566,0> translate<15.111050,0.000000,23.476222> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.111941,0.000000,15.316200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.198666,0.000000,15.229478>}
box{<0,0,-0.076200><0.122645,0.035000,0.076200> rotate<0,44.995998,0> translate<15.111941,0.000000,15.316200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.149388,0.000000,10.337791>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.149388,0.000000,10.185403>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,-90.000000,0> translate<15.149388,0.000000,10.185403> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.149403,0.000000,9.331400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.149403,0.000000,10.185388>}
box{<0,0,-0.076200><0.853988,0.035000,0.076200> rotate<0,90.000000,0> translate<15.149403,0.000000,10.185388> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.149403,0.000000,9.448800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.301791,0.000000,9.448800>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<15.149403,0.000000,9.448800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.149403,0.000000,9.601200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.301791,0.000000,9.601200>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<15.149403,0.000000,9.601200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.149403,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.301791,0.000000,9.753600>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<15.149403,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.149403,0.000000,9.906000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.301791,0.000000,9.906000>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<15.149403,0.000000,9.906000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.149403,0.000000,10.058400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.301791,0.000000,10.058400>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<15.149403,0.000000,10.058400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.149403,0.000000,10.185388>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.301791,0.000000,10.185388>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<15.149403,0.000000,10.185388> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.149403,0.000000,10.337809>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.149403,0.000000,11.191797>}
box{<0,0,-0.076200><0.853988,0.035000,0.076200> rotate<0,90.000000,0> translate<15.149403,0.000000,11.191797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.149403,0.000000,10.337809>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.301791,0.000000,10.337809>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<15.149403,0.000000,10.337809> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.149403,0.000000,10.363200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.301791,0.000000,10.363200>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<15.149403,0.000000,10.363200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.149403,0.000000,10.515600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.301791,0.000000,10.515600>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<15.149403,0.000000,10.515600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.149403,0.000000,10.668000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.301791,0.000000,10.668000>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<15.149403,0.000000,10.668000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.149403,0.000000,10.820400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.301791,0.000000,10.820400>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<15.149403,0.000000,10.820400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.149403,0.000000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.301791,0.000000,10.972800>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<15.149403,0.000000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.149403,0.000000,11.125200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.301791,0.000000,11.125200>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<15.149403,0.000000,11.125200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.186347,0.000000,23.519694>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.270325,0.000000,23.542197>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-14.999808,0> translate<15.186347,0.000000,23.519694> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.216709,0.000000,24.467400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.801181,0.000000,24.467400>}
box{<0,0,-0.076200><0.584472,0.035000,0.076200> rotate<0,0.000000,0> translate<15.216709,0.000000,24.467400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.240000,-1.535000,15.044456>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.552456,-1.535000,14.732000>}
box{<0,0,-0.076200><0.441880,0.035000,0.076200> rotate<0,44.997030,0> translate<15.240000,-1.535000,15.044456> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.240000,-1.535000,15.162741>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.240000,-1.535000,15.044456>}
box{<0,0,-0.076200><0.118284,0.035000,0.076200> rotate<0,-90.000000,0> translate<15.240000,-1.535000,15.044456> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.270325,0.000000,23.542197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.453781,0.000000,23.542197>}
box{<0,0,-0.076200><0.183456,0.035000,0.076200> rotate<0,0.000000,0> translate<15.270325,0.000000,23.542197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.301791,0.000000,9.331400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.669072,0.000000,9.331400>}
box{<0,0,-0.076200><0.367281,0.035000,0.076200> rotate<0,0.000000,0> translate<15.301791,0.000000,9.331400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.301791,0.000000,10.185388>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.301791,0.000000,9.331400>}
box{<0,0,-0.076200><0.853988,0.035000,0.076200> rotate<0,-90.000000,0> translate<15.301791,0.000000,9.331400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.301791,0.000000,11.191797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.301791,0.000000,10.337809>}
box{<0,0,-0.076200><0.853988,0.035000,0.076200> rotate<0,-90.000000,0> translate<15.301791,0.000000,10.337809> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.301791,0.000000,11.191797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.669072,0.000000,11.191797>}
box{<0,0,-0.076200><0.367281,0.035000,0.076200> rotate<0,0.000000,0> translate<15.301791,0.000000,11.191797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.333941,0.000000,26.822397>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.646397,0.000000,26.509941>}
box{<0,0,-0.076200><0.441880,0.035000,0.076200> rotate<0,44.997030,0> translate<15.333941,0.000000,26.822397> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.333941,-1.535000,26.822397>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.646397,-1.535000,26.509941>}
box{<0,0,-0.076200><0.441880,0.035000,0.076200> rotate<0,44.997030,0> translate<15.333941,-1.535000,26.822397> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.367084,0.000000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.382397,0.000000,19.796688>}
box{<0,0,-0.076200><0.021655,0.035000,0.076200> rotate<0,44.997030,0> translate<15.367084,0.000000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.367084,0.000000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.382397,0.000000,19.827309>}
box{<0,0,-0.076200><0.021653,0.035000,0.076200> rotate<0,-44.991183,0> translate<15.367084,0.000000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.367084,0.000000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.627588,0.000000,19.812000>}
box{<0,0,-0.076200><2.260503,0.035000,0.076200> rotate<0,0.000000,0> translate<15.367084,0.000000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.382397,0.000000,19.735803>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.382397,0.000000,19.796688>}
box{<0,0,-0.076200><0.060884,0.035000,0.076200> rotate<0,90.000000,0> translate<15.382397,0.000000,19.796688> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.382397,0.000000,19.735803>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.627588,0.000000,19.735803>}
box{<0,0,-0.076200><2.245191,0.035000,0.076200> rotate<0,0.000000,0> translate<15.382397,0.000000,19.735803> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.382397,0.000000,19.827309>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.382397,0.000000,19.888191>}
box{<0,0,-0.076200><0.060881,0.035000,0.076200> rotate<0,90.000000,0> translate<15.382397,0.000000,19.888191> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.382397,0.000000,19.888191>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.627588,0.000000,19.888191>}
box{<0,0,-0.076200><2.245191,0.035000,0.076200> rotate<0,0.000000,0> translate<15.382397,0.000000,19.888191> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.432797,0.000000,13.480197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.432797,0.000000,13.621600>}
box{<0,0,-0.076200><0.141403,0.035000,0.076200> rotate<0,90.000000,0> translate<15.432797,0.000000,13.621600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.432797,0.000000,13.480197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.496488,0.000000,13.480197>}
box{<0,0,-0.076200><0.063691,0.035000,0.076200> rotate<0,0.000000,0> translate<15.432797,0.000000,13.480197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.432797,0.000000,13.563600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.824200,0.000000,13.563600>}
box{<0,0,-0.076200><0.391403,0.035000,0.076200> rotate<0,0.000000,0> translate<15.432797,0.000000,13.563600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.432797,0.000000,13.621600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.496488,0.000000,13.621600>}
box{<0,0,-0.076200><0.063691,0.035000,0.076200> rotate<0,0.000000,0> translate<15.432797,0.000000,13.621600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,16.180856>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,22.574650>}
box{<0,0,-0.076200><6.393794,0.035000,0.076200> rotate<0,90.000000,0> translate<15.443197,-1.535000,22.574650> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,16.180856>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.825256,-1.535000,15.798797>}
box{<0,0,-0.076200><0.540314,0.035000,0.076200> rotate<0,44.997030,0> translate<15.443197,-1.535000,16.180856> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,16.306800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.665144,-1.535000,16.306800>}
box{<0,0,-0.076200><6.221947,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,16.306800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,16.459200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.817544,-1.535000,16.459200>}
box{<0,0,-0.076200><6.374347,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,16.459200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,16.611600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.945600,-1.535000,16.611600>}
box{<0,0,-0.076200><6.502403,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,16.611600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.945600,-1.535000,16.764000>}
box{<0,0,-0.076200><6.502403,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,16.916400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.844000,-1.535000,16.916400>}
box{<0,0,-0.076200><6.400803,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,16.916400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.844000,-1.535000,17.068800>}
box{<0,0,-0.076200><6.400803,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,17.221200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.844000,-1.535000,17.221200>}
box{<0,0,-0.076200><6.400803,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,17.221200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,17.373600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.902459,-1.535000,17.373600>}
box{<0,0,-0.076200><6.459262,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,17.373600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,17.526000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.054859,-1.535000,17.526000>}
box{<0,0,-0.076200><6.611662,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,17.526000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,17.678400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,17.678400>}
box{<0,0,-0.076200><11.531603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,17.678400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,17.830800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,17.830800>}
box{<0,0,-0.076200><11.531603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,17.830800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,17.983200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,17.983200>}
box{<0,0,-0.076200><11.531603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,17.983200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,18.135600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,18.135600>}
box{<0,0,-0.076200><11.531603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,18.135600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,18.288000>}
box{<0,0,-0.076200><11.531603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,18.440400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,18.440400>}
box{<0,0,-0.076200><11.531603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,18.440400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,18.592800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,18.592800>}
box{<0,0,-0.076200><11.531603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,18.592800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,18.745200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,18.745200>}
box{<0,0,-0.076200><11.531603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,18.745200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,18.897600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,18.897600>}
box{<0,0,-0.076200><11.531603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,18.897600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,19.050000>}
box{<0,0,-0.076200><11.531603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,19.202400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,19.202400>}
box{<0,0,-0.076200><11.531603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,19.202400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,19.354800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,19.354800>}
box{<0,0,-0.076200><11.531603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,19.354800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,19.507200>}
box{<0,0,-0.076200><11.531603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,19.659600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,19.659600>}
box{<0,0,-0.076200><11.531603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,19.659600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,19.812000>}
box{<0,0,-0.076200><11.531603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,19.964400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,19.964400>}
box{<0,0,-0.076200><11.531603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,19.964400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,20.116800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,20.116800>}
box{<0,0,-0.076200><11.531603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,20.116800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,20.269200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,20.269200>}
box{<0,0,-0.076200><11.531603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,20.269200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,20.421600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,20.421600>}
box{<0,0,-0.076200><11.531603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,20.421600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,20.574000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,20.574000>}
box{<0,0,-0.076200><11.531603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,20.574000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,20.726400>}
box{<0,0,-0.076200><11.531603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,20.878800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,20.878800>}
box{<0,0,-0.076200><11.531603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,20.878800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,21.031200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,21.031200>}
box{<0,0,-0.076200><11.531603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,21.031200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,21.183600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,21.183600>}
box{<0,0,-0.076200><11.531603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,21.183600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,21.336000>}
box{<0,0,-0.076200><11.531603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,21.488400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,21.488400>}
box{<0,0,-0.076200><11.531603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,21.488400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,21.640800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,21.640800>}
box{<0,0,-0.076200><11.531603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,21.640800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,21.793200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,21.793200>}
box{<0,0,-0.076200><11.531603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,21.793200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,21.945600>}
box{<0,0,-0.076200><11.531603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,22.098000>}
box{<0,0,-0.076200><11.531603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,22.250400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,22.250400>}
box{<0,0,-0.076200><11.531603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,22.250400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,22.402800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,22.402800>}
box{<0,0,-0.076200><11.531603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,22.402800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,22.555200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,22.555200>}
box{<0,0,-0.076200><11.531603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,22.555200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,22.574650>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.535878,-1.535000,25.957541>}
box{<0,0,-0.076200><3.384160,0.035000,0.076200> rotate<0,-88.424821,0> translate<15.443197,-1.535000,22.574650> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.446838,-1.535000,22.707600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,22.707600>}
box{<0,0,-0.076200><11.527963,0.035000,0.076200> rotate<0,0.000000,0> translate<15.446838,-1.535000,22.707600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.451013,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,22.860000>}
box{<0,0,-0.076200><11.523788,0.035000,0.076200> rotate<0,0.000000,0> translate<15.451013,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.453766,0.000000,16.837013>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.453766,0.000000,16.836981>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,-90.000000,0> translate<15.453766,0.000000,16.836981> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.453766,0.000000,22.787012>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.453766,0.000000,22.786981>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,-90.000000,0> translate<15.453766,0.000000,22.786981> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.453781,0.000000,22.787031>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.453781,0.000000,23.542197>}
box{<0,0,-0.076200><0.755166,0.035000,0.076200> rotate<0,90.000000,0> translate<15.453781,0.000000,23.542197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.453781,0.000000,22.787031>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.453813,0.000000,22.787031>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<15.453781,0.000000,22.787031> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.453781,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.453813,0.000000,22.860000>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<15.453781,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.453781,0.000000,23.012400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.453813,0.000000,23.012400>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<15.453781,0.000000,23.012400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.453781,0.000000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.453813,0.000000,23.164800>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<15.453781,0.000000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.453781,0.000000,23.317200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.453813,0.000000,23.317200>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<15.453781,0.000000,23.317200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.453781,0.000000,23.469600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.453813,0.000000,23.469600>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<15.453781,0.000000,23.469600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.453813,0.000000,23.542197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.453813,0.000000,22.787031>}
box{<0,0,-0.076200><0.755166,0.035000,0.076200> rotate<0,-90.000000,0> translate<15.453813,0.000000,22.787031> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.453813,0.000000,23.542197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.637272,0.000000,23.542197>}
box{<0,0,-0.076200><0.183459,0.035000,0.076200> rotate<0,0.000000,0> translate<15.453813,0.000000,23.542197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.453831,0.000000,16.836981>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.453831,0.000000,16.837013>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,90.000000,0> translate<15.453831,0.000000,16.837013> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.453831,0.000000,16.836981>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.483597,0.000000,16.836981>}
box{<0,0,-0.076200><0.029766,0.035000,0.076200> rotate<0,0.000000,0> translate<15.453831,0.000000,16.836981> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.453831,0.000000,16.837013>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.953766,0.000000,16.837013>}
box{<0,0,-0.076200><0.499934,0.035000,0.076200> rotate<0,0.000000,0> translate<15.453831,0.000000,16.837013> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.453831,0.000000,22.786981>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.453831,0.000000,22.787012>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,90.000000,0> translate<15.453831,0.000000,22.787012> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.453831,0.000000,22.786981>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.953766,0.000000,22.786981>}
box{<0,0,-0.076200><0.499934,0.035000,0.076200> rotate<0,0.000000,0> translate<15.453831,0.000000,22.786981> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.453831,0.000000,22.787012>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.923997,0.000000,22.787012>}
box{<0,0,-0.076200><0.470166,0.035000,0.076200> rotate<0,0.000000,0> translate<15.453831,0.000000,22.787012> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.455188,-1.535000,23.012400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,23.012400>}
box{<0,0,-0.076200><11.519613,0.035000,0.076200> rotate<0,0.000000,0> translate<15.455188,-1.535000,23.012400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.459363,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,23.164800>}
box{<0,0,-0.076200><11.515438,0.035000,0.076200> rotate<0,0.000000,0> translate<15.459363,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.463538,-1.535000,23.317200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,23.317200>}
box{<0,0,-0.076200><11.511263,0.035000,0.076200> rotate<0,0.000000,0> translate<15.463538,-1.535000,23.317200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.467716,-1.535000,23.469600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,23.469600>}
box{<0,0,-0.076200><11.507084,0.035000,0.076200> rotate<0,0.000000,0> translate<15.467716,-1.535000,23.469600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.469653,-1.535000,16.154400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.512744,-1.535000,16.154400>}
box{<0,0,-0.076200><6.043091,0.035000,0.076200> rotate<0,0.000000,0> translate<15.469653,-1.535000,16.154400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.471891,-1.535000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,23.622000>}
box{<0,0,-0.076200><11.502909,0.035000,0.076200> rotate<0,0.000000,0> translate<15.471891,-1.535000,23.622000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.476066,-1.535000,23.774400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,23.774400>}
box{<0,0,-0.076200><11.498734,0.035000,0.076200> rotate<0,0.000000,0> translate<15.476066,-1.535000,23.774400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.480241,-1.535000,23.926800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,23.926800>}
box{<0,0,-0.076200><11.494559,0.035000,0.076200> rotate<0,0.000000,0> translate<15.480241,-1.535000,23.926800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.483597,0.000000,16.836981>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.953766,0.000000,16.836981>}
box{<0,0,-0.076200><0.470169,0.035000,0.076200> rotate<0,0.000000,0> translate<15.483597,0.000000,16.836981> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.484416,-1.535000,24.079200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,24.079200>}
box{<0,0,-0.076200><11.490384,0.035000,0.076200> rotate<0,0.000000,0> translate<15.484416,-1.535000,24.079200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.486338,0.000000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780000,0.000000,26.670000>}
box{<0,0,-0.076200><2.293662,0.035000,0.076200> rotate<0,0.000000,0> translate<15.486338,0.000000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.486338,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,26.670000>}
box{<0,0,-0.076200><11.488463,0.035000,0.076200> rotate<0,0.000000,0> translate<15.486338,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.488591,-1.535000,24.231600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,24.231600>}
box{<0,0,-0.076200><11.486209,0.035000,0.076200> rotate<0,0.000000,0> translate<15.488591,-1.535000,24.231600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.492766,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,24.384000>}
box{<0,0,-0.076200><11.482034,0.035000,0.076200> rotate<0,0.000000,0> translate<15.492766,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.496488,0.000000,12.123000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.630397,0.000000,12.256909>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<15.496488,0.000000,12.123000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.496488,0.000000,13.480197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.630397,0.000000,13.346288>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<15.496488,0.000000,13.480197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.496488,0.000000,13.621600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.630397,0.000000,13.755509>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<15.496488,0.000000,13.621600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.496941,-1.535000,24.536400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,24.536400>}
box{<0,0,-0.076200><11.477859,0.035000,0.076200> rotate<0,0.000000,0> translate<15.496941,-1.535000,24.536400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.501116,-1.535000,24.688800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,24.688800>}
box{<0,0,-0.076200><11.473684,0.035000,0.076200> rotate<0,0.000000,0> translate<15.501116,-1.535000,24.688800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.505291,-1.535000,24.841200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,24.841200>}
box{<0,0,-0.076200><11.469509,0.035000,0.076200> rotate<0,0.000000,0> translate<15.505291,-1.535000,24.841200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.509469,-1.535000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,24.993600>}
box{<0,0,-0.076200><11.465331,0.035000,0.076200> rotate<0,0.000000,0> translate<15.509469,-1.535000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.513644,-1.535000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,25.146000>}
box{<0,0,-0.076200><11.461156,0.035000,0.076200> rotate<0,0.000000,0> translate<15.513644,-1.535000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.517819,-1.535000,25.298400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,25.298400>}
box{<0,0,-0.076200><11.456981,0.035000,0.076200> rotate<0,0.000000,0> translate<15.517819,-1.535000,25.298400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.521994,-1.535000,25.450800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,25.450800>}
box{<0,0,-0.076200><11.452806,0.035000,0.076200> rotate<0,0.000000,0> translate<15.521994,-1.535000,25.450800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.526169,-1.535000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,25.603200>}
box{<0,0,-0.076200><11.448631,0.035000,0.076200> rotate<0,0.000000,0> translate<15.526169,-1.535000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.530344,-1.535000,25.755600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,25.755600>}
box{<0,0,-0.076200><11.444456,0.035000,0.076200> rotate<0,0.000000,0> translate<15.530344,-1.535000,25.755600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.534519,-1.535000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,25.908000>}
box{<0,0,-0.076200><11.440281,0.035000,0.076200> rotate<0,0.000000,0> translate<15.534519,-1.535000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.535878,-1.535000,25.957541>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.646397,-1.535000,26.068056>}
box{<0,0,-0.076200><0.156295,0.035000,0.076200> rotate<0,-44.996220,0> translate<15.535878,-1.535000,25.957541> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.552456,-1.535000,14.732000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.994341,-1.535000,14.732000>}
box{<0,0,-0.076200><0.441884,0.035000,0.076200> rotate<0,0.000000,0> translate<15.552456,-1.535000,14.732000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.565484,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.824200,0.000000,13.411200>}
box{<0,0,-0.076200><0.258716,0.035000,0.076200> rotate<0,0.000000,0> translate<15.565484,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.565488,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.666384,0.000000,12.192000>}
box{<0,0,-0.076200><0.100897,0.035000,0.076200> rotate<0,0.000000,0> translate<15.565488,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.567650,0.000000,16.081800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.637272,0.000000,16.081800>}
box{<0,0,-0.076200><0.069622,0.035000,0.076200> rotate<0,0.000000,0> translate<15.567650,0.000000,16.081800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.567650,0.000000,16.081800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.809319,0.000000,15.840131>}
box{<0,0,-0.076200><0.341771,0.035000,0.076200> rotate<0,44.997030,0> translate<15.567650,0.000000,16.081800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.590181,0.000000,12.115797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.824200,0.000000,12.349816>}
box{<0,0,-0.076200><0.330952,0.035000,0.076200> rotate<0,-44.997030,0> translate<15.590181,0.000000,12.115797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.590888,0.000000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.824200,0.000000,13.716000>}
box{<0,0,-0.076200><0.233313,0.035000,0.076200> rotate<0,0.000000,0> translate<15.590888,0.000000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.622053,-1.535000,16.002000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.360344,-1.535000,16.002000>}
box{<0,0,-0.076200><5.738291,0.035000,0.076200> rotate<0,0.000000,0> translate<15.622053,-1.535000,16.002000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.630397,0.000000,12.256909>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.630397,0.000000,13.346288>}
box{<0,0,-0.076200><1.089378,0.035000,0.076200> rotate<0,90.000000,0> translate<15.630397,0.000000,13.346288> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.630397,0.000000,12.344400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.818784,0.000000,12.344400>}
box{<0,0,-0.076200><0.188387,0.035000,0.076200> rotate<0,0.000000,0> translate<15.630397,0.000000,12.344400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.630397,0.000000,12.496800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.824200,0.000000,12.496800>}
box{<0,0,-0.076200><0.193803,0.035000,0.076200> rotate<0,0.000000,0> translate<15.630397,0.000000,12.496800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.630397,0.000000,12.649200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.824200,0.000000,12.649200>}
box{<0,0,-0.076200><0.193803,0.035000,0.076200> rotate<0,0.000000,0> translate<15.630397,0.000000,12.649200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.630397,0.000000,12.801600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.824200,0.000000,12.801600>}
box{<0,0,-0.076200><0.193803,0.035000,0.076200> rotate<0,0.000000,0> translate<15.630397,0.000000,12.801600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.630397,0.000000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.824200,0.000000,12.954000>}
box{<0,0,-0.076200><0.193803,0.035000,0.076200> rotate<0,0.000000,0> translate<15.630397,0.000000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.630397,0.000000,13.106400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.824200,0.000000,13.106400>}
box{<0,0,-0.076200><0.193803,0.035000,0.076200> rotate<0,0.000000,0> translate<15.630397,0.000000,13.106400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.630397,0.000000,13.258800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.824200,0.000000,13.258800>}
box{<0,0,-0.076200><0.193803,0.035000,0.076200> rotate<0,0.000000,0> translate<15.630397,0.000000,13.258800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.630397,0.000000,13.755509>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.630397,0.000000,14.583581>}
box{<0,0,-0.076200><0.828072,0.035000,0.076200> rotate<0,90.000000,0> translate<15.630397,0.000000,14.583581> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.630397,0.000000,13.868400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.824200,0.000000,13.868400>}
box{<0,0,-0.076200><0.193803,0.035000,0.076200> rotate<0,0.000000,0> translate<15.630397,0.000000,13.868400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.630397,0.000000,14.020800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.824200,0.000000,14.020800>}
box{<0,0,-0.076200><0.193803,0.035000,0.076200> rotate<0,0.000000,0> translate<15.630397,0.000000,14.020800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.630397,0.000000,14.173200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.824200,0.000000,14.173200>}
box{<0,0,-0.076200><0.193803,0.035000,0.076200> rotate<0,0.000000,0> translate<15.630397,0.000000,14.173200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.630397,0.000000,14.325600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.824200,0.000000,14.325600>}
box{<0,0,-0.076200><0.193803,0.035000,0.076200> rotate<0,0.000000,0> translate<15.630397,0.000000,14.325600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.630397,0.000000,14.478000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.824200,0.000000,14.478000>}
box{<0,0,-0.076200><0.193803,0.035000,0.076200> rotate<0,0.000000,0> translate<15.630397,0.000000,14.478000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.630397,0.000000,14.583581>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.778816,0.000000,14.732000>}
box{<0,0,-0.076200><0.209896,0.035000,0.076200> rotate<0,-44.997030,0> translate<15.630397,0.000000,14.583581> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.637272,0.000000,16.081800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.703797,0.000000,16.099628>}
box{<0,0,-0.076200><0.068872,0.035000,0.076200> rotate<0,-15.001264,0> translate<15.637272,0.000000,16.081800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.637272,0.000000,23.542197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.703800,0.000000,23.524369>}
box{<0,0,-0.076200><0.068875,0.035000,0.076200> rotate<0,15.000591,0> translate<15.637272,0.000000,23.542197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.638738,-1.535000,26.060400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,26.060400>}
box{<0,0,-0.076200><11.336063,0.035000,0.076200> rotate<0,0.000000,0> translate<15.638738,-1.535000,26.060400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.638738,0.000000,26.517600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780000,0.000000,26.517600>}
box{<0,0,-0.076200><2.141262,0.035000,0.076200> rotate<0,0.000000,0> translate<15.638738,0.000000,26.517600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.638738,-1.535000,26.517600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,26.517600>}
box{<0,0,-0.076200><11.336063,0.035000,0.076200> rotate<0,0.000000,0> translate<15.638738,-1.535000,26.517600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.646397,-1.535000,26.068056>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.646397,-1.535000,26.509941>}
box{<0,0,-0.076200><0.441884,0.035000,0.076200> rotate<0,90.000000,0> translate<15.646397,-1.535000,26.509941> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.646397,-1.535000,26.212800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,26.212800>}
box{<0,0,-0.076200><11.328403,0.035000,0.076200> rotate<0,0.000000,0> translate<15.646397,-1.535000,26.212800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.646397,0.000000,26.294412>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.646397,0.000000,26.509941>}
box{<0,0,-0.076200><0.215528,0.035000,0.076200> rotate<0,90.000000,0> translate<15.646397,0.000000,26.509941> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.646397,0.000000,26.294412>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.819213,0.000000,26.121597>}
box{<0,0,-0.076200><0.244398,0.035000,0.076200> rotate<0,44.997030,0> translate<15.646397,0.000000,26.294412> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.646397,0.000000,26.365200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780000,0.000000,26.365200>}
box{<0,0,-0.076200><2.133603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.646397,0.000000,26.365200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.646397,-1.535000,26.365200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,26.365200>}
box{<0,0,-0.076200><11.328403,0.035000,0.076200> rotate<0,0.000000,0> translate<15.646397,-1.535000,26.365200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.647450,0.000000,16.002000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.971188,0.000000,16.002000>}
box{<0,0,-0.076200><0.323738,0.035000,0.076200> rotate<0,0.000000,0> translate<15.647450,0.000000,16.002000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.669072,0.000000,9.331400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.753050,0.000000,9.353903>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-14.999808,0> translate<15.669072,0.000000,9.331400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.669072,0.000000,11.191797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.753050,0.000000,11.169294>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,14.999808,0> translate<15.669072,0.000000,11.191797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.677216,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.824200,0.000000,14.630400>}
box{<0,0,-0.076200><0.146984,0.035000,0.076200> rotate<0,0.000000,0> translate<15.677216,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.703797,0.000000,16.099628>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.770325,0.000000,16.081800>}
box{<0,0,-0.076200><0.068875,0.035000,0.076200> rotate<0,15.000591,0> translate<15.703797,0.000000,16.099628> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.703800,0.000000,23.524369>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.770325,0.000000,23.542197>}
box{<0,0,-0.076200><0.068872,0.035000,0.076200> rotate<0,-15.001264,0> translate<15.703800,0.000000,23.524369> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.728009,0.000000,26.212800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780000,0.000000,26.212800>}
box{<0,0,-0.076200><2.051991,0.035000,0.076200> rotate<0,0.000000,0> translate<15.728009,0.000000,26.212800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.753050,0.000000,9.353903>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.828347,0.000000,9.397375>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-29.997566,0> translate<15.753050,0.000000,9.353903> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.753050,0.000000,11.169294>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.828347,0.000000,11.125822>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,29.997566,0> translate<15.753050,0.000000,11.169294> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.767400,0.000000,7.705325>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.769847,0.000000,7.696197>}
box{<0,0,-0.076200><0.009450,0.035000,0.076200> rotate<0,74.989187,0> translate<15.767400,0.000000,7.705325> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.767400,0.000000,8.222603>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.767400,0.000000,7.705325>}
box{<0,0,-0.076200><0.517278,0.035000,0.076200> rotate<0,-90.000000,0> translate<15.767400,0.000000,7.705325> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.767400,0.000000,8.222603>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.971388,0.000000,8.222603>}
box{<0,0,-0.076200><1.203988,0.035000,0.076200> rotate<0,0.000000,0> translate<15.767400,0.000000,8.222603> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.767400,0.000000,8.374991>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.971388,0.000000,8.374991>}
box{<0,0,-0.076200><1.203988,0.035000,0.076200> rotate<0,0.000000,0> translate<15.767400,0.000000,8.374991> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.767400,0.000000,8.892272>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.767400,0.000000,8.374991>}
box{<0,0,-0.076200><0.517281,0.035000,0.076200> rotate<0,-90.000000,0> translate<15.767400,0.000000,8.374991> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.767400,0.000000,8.892272>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.789903,0.000000,8.976250>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-74.994252,0> translate<15.767400,0.000000,8.892272> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.770325,0.000000,16.081800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.953781,0.000000,16.081800>}
box{<0,0,-0.076200><0.183456,0.035000,0.076200> rotate<0,0.000000,0> translate<15.770325,0.000000,16.081800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.770325,0.000000,23.542197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.953781,0.000000,23.542197>}
box{<0,0,-0.076200><0.183456,0.035000,0.076200> rotate<0,0.000000,0> translate<15.770325,0.000000,23.542197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.774453,-1.535000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.207944,-1.535000,15.849600>}
box{<0,0,-0.076200><5.433491,0.035000,0.076200> rotate<0,0.000000,0> translate<15.774453,-1.535000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.778816,0.000000,14.732000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.824200,0.000000,14.732000>}
box{<0,0,-0.076200><0.045384,0.035000,0.076200> rotate<0,0.000000,0> translate<15.778816,0.000000,14.732000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.789903,0.000000,8.976250>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.833375,0.000000,9.051547>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-59.996495,0> translate<15.789903,0.000000,8.976250> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.799850,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.818788,0.000000,15.849600>}
box{<0,0,-0.076200><0.018937,0.035000,0.076200> rotate<0,0.000000,0> translate<15.799850,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.801181,0.000000,24.467400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.735672,0.000000,23.532909>}
box{<0,0,-0.076200><1.321569,0.035000,0.076200> rotate<0,44.997030,0> translate<15.801181,0.000000,24.467400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.809319,0.000000,15.840131>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.050988,0.000000,16.081800>}
box{<0,0,-0.076200><0.341771,0.035000,0.076200> rotate<0,-44.997030,0> translate<15.809319,0.000000,15.840131> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.819213,0.000000,26.121597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.819216,0.000000,26.121597>}
box{<0,0,-0.076200><0.000003,0.035000,0.076200> rotate<0,0.000000,0> translate<15.819213,0.000000,26.121597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.819216,0.000000,26.121597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.042397,0.000000,25.898416>}
box{<0,0,-0.076200><0.315626,0.035000,0.076200> rotate<0,44.997030,0> translate<15.819216,0.000000,26.121597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.824200,0.000000,14.732000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.824200,0.000000,12.349816>}
box{<0,0,-0.076200><2.382184,0.035000,0.076200> rotate<0,-90.000000,0> translate<15.824200,0.000000,12.349816> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.825256,-1.535000,15.798797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.994341,-1.535000,15.798797>}
box{<0,0,-0.076200><0.169084,0.035000,0.076200> rotate<0,0.000000,0> translate<15.825256,-1.535000,15.798797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.828347,0.000000,9.397375>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.889822,0.000000,9.458850>}
box{<0,0,-0.076200><0.086939,0.035000,0.076200> rotate<0,-44.997030,0> translate<15.828347,0.000000,9.397375> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.828347,0.000000,11.125822>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.869000,0.000000,11.085166>}
box{<0,0,-0.076200><0.057494,0.035000,0.076200> rotate<0,44.999232,0> translate<15.828347,0.000000,11.125822> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.828969,0.000000,11.125200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.869000,0.000000,11.125200>}
box{<0,0,-0.076200><0.040031,0.035000,0.076200> rotate<0,0.000000,0> translate<15.828969,0.000000,11.125200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.833375,0.000000,9.051547>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.894850,0.000000,9.113022>}
box{<0,0,-0.076200><0.086939,0.035000,0.076200> rotate<0,-44.997030,0> translate<15.833375,0.000000,9.051547> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.869000,0.000000,11.243488>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.869000,0.000000,11.085166>}
box{<0,0,-0.076200><0.158322,0.035000,0.076200> rotate<0,-90.000000,0> translate<15.869000,0.000000,11.085166> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.869000,0.000000,11.243488>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.002909,0.000000,11.377397>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<15.869000,0.000000,11.243488> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.879772,0.000000,9.448800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,9.448800>}
box{<0,0,-0.076200><11.095028,0.035000,0.076200> rotate<0,0.000000,0> translate<15.879772,0.000000,9.448800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.880413,0.000000,26.060400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780000,0.000000,26.060400>}
box{<0,0,-0.076200><1.899588,0.035000,0.076200> rotate<0,0.000000,0> translate<15.880413,0.000000,26.060400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.889822,0.000000,9.458850>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.933294,0.000000,9.534147>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-59.996495,0> translate<15.889822,0.000000,9.458850> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.894850,0.000000,9.113022>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.970147,0.000000,9.156494>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-29.997566,0> translate<15.894850,0.000000,9.113022> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.905816,0.000000,11.353800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.363016,0.000000,11.811000>}
box{<0,0,-0.076200><0.646578,0.035000,0.076200> rotate<0,-44.997030,0> translate<15.905816,0.000000,11.353800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.923997,0.000000,22.787012>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.953766,0.000000,22.787012>}
box{<0,0,-0.076200><0.029769,0.035000,0.076200> rotate<0,0.000000,0> translate<15.923997,0.000000,22.787012> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.933294,0.000000,9.534147>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.955797,0.000000,9.618125>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-74.994252,0> translate<15.933294,0.000000,9.534147> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.951259,0.000000,9.601200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,9.601200>}
box{<0,0,-0.076200><11.023541,0.035000,0.076200> rotate<0,0.000000,0> translate<15.951259,0.000000,9.601200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.953766,0.000000,16.837013>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.953766,0.000000,16.836981>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,-90.000000,0> translate<15.953766,0.000000,16.836981> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.953766,0.000000,22.787012>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.953766,0.000000,22.786981>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,-90.000000,0> translate<15.953766,0.000000,22.786981> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.953781,0.000000,16.081800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.953781,0.000000,16.836966>}
box{<0,0,-0.076200><0.755166,0.035000,0.076200> rotate<0,90.000000,0> translate<15.953781,0.000000,16.836966> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.953781,0.000000,16.154400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.953813,0.000000,16.154400>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<15.953781,0.000000,16.154400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.953781,0.000000,16.306800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.953813,0.000000,16.306800>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<15.953781,0.000000,16.306800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.953781,0.000000,16.459200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.953813,0.000000,16.459200>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<15.953781,0.000000,16.459200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.953781,0.000000,16.611600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.953813,0.000000,16.611600>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<15.953781,0.000000,16.611600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.953781,0.000000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.953813,0.000000,16.764000>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<15.953781,0.000000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.953781,0.000000,16.836966>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.953813,0.000000,16.836966>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<15.953781,0.000000,16.836966> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.953781,0.000000,22.787031>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.953781,0.000000,23.542197>}
box{<0,0,-0.076200><0.755166,0.035000,0.076200> rotate<0,90.000000,0> translate<15.953781,0.000000,23.542197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.953781,0.000000,22.787031>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.953813,0.000000,22.787031>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<15.953781,0.000000,22.787031> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.953781,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.953813,0.000000,22.860000>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<15.953781,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.953781,0.000000,23.012400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.953813,0.000000,23.012400>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<15.953781,0.000000,23.012400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.953781,0.000000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.953813,0.000000,23.164800>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<15.953781,0.000000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.953781,0.000000,23.317200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.953813,0.000000,23.317200>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<15.953781,0.000000,23.317200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.953781,0.000000,23.469600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.953813,0.000000,23.469600>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<15.953781,0.000000,23.469600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.953813,0.000000,16.081800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.050988,0.000000,16.081800>}
box{<0,0,-0.076200><0.097175,0.035000,0.076200> rotate<0,0.000000,0> translate<15.953813,0.000000,16.081800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.953813,0.000000,16.836966>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.953813,0.000000,16.081800>}
box{<0,0,-0.076200><0.755166,0.035000,0.076200> rotate<0,-90.000000,0> translate<15.953813,0.000000,16.081800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.953813,0.000000,23.542197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.953813,0.000000,22.787031>}
box{<0,0,-0.076200><0.755166,0.035000,0.076200> rotate<0,-90.000000,0> translate<15.953813,0.000000,22.787031> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.953813,0.000000,23.542197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.137272,0.000000,23.542197>}
box{<0,0,-0.076200><0.183459,0.035000,0.076200> rotate<0,0.000000,0> translate<15.953813,0.000000,23.542197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.953831,0.000000,22.786981>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.953831,0.000000,22.787012>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,90.000000,0> translate<15.953831,0.000000,22.787012> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.953831,0.000000,22.786981>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.453766,0.000000,22.786981>}
box{<0,0,-0.076200><0.499934,0.035000,0.076200> rotate<0,0.000000,0> translate<15.953831,0.000000,22.786981> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.953831,0.000000,22.787012>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.423997,0.000000,22.787012>}
box{<0,0,-0.076200><0.470166,0.035000,0.076200> rotate<0,0.000000,0> translate<15.953831,0.000000,22.787012> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.955797,0.000000,9.618125>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.955797,0.000000,9.867316>}
box{<0,0,-0.076200><0.249191,0.035000,0.076200> rotate<0,90.000000,0> translate<15.955797,0.000000,9.867316> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.955797,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,9.753600>}
box{<0,0,-0.076200><11.019003,0.035000,0.076200> rotate<0,0.000000,0> translate<15.955797,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.955797,0.000000,9.867316>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.002909,0.000000,9.820200>}
box{<0,0,-0.076200><0.066629,0.035000,0.076200> rotate<0,44.998930,0> translate<15.955797,0.000000,9.867316> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.970147,0.000000,9.156494>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.054125,0.000000,9.178997>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-14.999808,0> translate<15.970147,0.000000,9.156494> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.982016,0.000000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.039988,0.000000,11.430000>}
box{<0,0,-0.076200><5.057972,0.035000,0.076200> rotate<0,0.000000,0> translate<15.982016,0.000000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.994341,-1.535000,14.732000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.095941,-1.535000,14.833600>}
box{<0,0,-0.076200><0.143684,0.035000,0.076200> rotate<0,-44.997030,0> translate<15.994341,-1.535000,14.732000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.994341,-1.535000,15.798797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.095941,-1.535000,15.697197>}
box{<0,0,-0.076200><0.143684,0.035000,0.076200> rotate<0,44.997030,0> translate<15.994341,-1.535000,15.798797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.002909,0.000000,9.820200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.092288,0.000000,9.820200>}
box{<0,0,-0.076200><2.089378,0.035000,0.076200> rotate<0,0.000000,0> translate<16.002909,0.000000,9.820200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.002909,0.000000,11.377397>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.092288,0.000000,11.377397>}
box{<0,0,-0.076200><2.089378,0.035000,0.076200> rotate<0,0.000000,0> translate<16.002909,0.000000,11.377397> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.032813,0.000000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.151219,0.000000,25.908000>}
box{<0,0,-0.076200><1.118406,0.035000,0.076200> rotate<0,0.000000,0> translate<16.032813,0.000000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.042397,0.000000,25.824597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.042397,0.000000,25.898416>}
box{<0,0,-0.076200><0.073819,0.035000,0.076200> rotate<0,90.000000,0> translate<16.042397,0.000000,25.898416> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.042397,0.000000,25.824597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.106088,0.000000,25.824597>}
box{<0,0,-0.076200><0.063691,0.035000,0.076200> rotate<0,0.000000,0> translate<16.042397,0.000000,25.824597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.045141,-1.535000,14.782800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.184656,-1.535000,14.782800>}
box{<0,0,-0.076200><3.139516,0.035000,0.076200> rotate<0,0.000000,0> translate<16.045141,-1.535000,14.782800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.054125,0.000000,9.178997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.971403,0.000000,9.178997>}
box{<0,0,-0.076200><0.917278,0.035000,0.076200> rotate<0,0.000000,0> translate<16.054125,0.000000,9.178997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.095938,-1.535000,15.697200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.133859,-1.535000,15.697200>}
box{<0,0,-0.076200><3.037922,0.035000,0.076200> rotate<0,0.000000,0> translate<16.095938,-1.535000,15.697200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.095941,-1.535000,14.833600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.133856,-1.535000,14.833600>}
box{<0,0,-0.076200><3.037916,0.035000,0.076200> rotate<0,0.000000,0> translate<16.095941,-1.535000,14.833600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.095941,-1.535000,15.697197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.133856,-1.535000,15.697197>}
box{<0,0,-0.076200><3.037916,0.035000,0.076200> rotate<0,0.000000,0> translate<16.095941,-1.535000,15.697197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.106088,0.000000,25.824597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.239997,0.000000,25.690688>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<16.106088,0.000000,25.824597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.134416,0.000000,11.582400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.192388,0.000000,11.582400>}
box{<0,0,-0.076200><5.057972,0.035000,0.076200> rotate<0,0.000000,0> translate<16.134416,0.000000,11.582400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.137272,0.000000,23.542197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.203800,0.000000,23.524369>}
box{<0,0,-0.076200><0.068875,0.035000,0.076200> rotate<0,15.000591,0> translate<16.137272,0.000000,23.542197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.175084,0.000000,25.755600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.973466,0.000000,25.755600>}
box{<0,0,-0.076200><0.798381,0.035000,0.076200> rotate<0,0.000000,0> translate<16.175084,0.000000,25.755600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.203800,0.000000,23.524369>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.270325,0.000000,23.542197>}
box{<0,0,-0.076200><0.068872,0.035000,0.076200> rotate<0,-15.001264,0> translate<16.203800,0.000000,23.524369> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.239997,0.000000,25.106216>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.239997,0.000000,25.690688>}
box{<0,0,-0.076200><0.584472,0.035000,0.076200> rotate<0,90.000000,0> translate<16.239997,0.000000,25.690688> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.239997,0.000000,25.106216>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.804016,0.000000,23.542197>}
box{<0,0,-0.076200><2.211857,0.035000,0.076200> rotate<0,44.997030,0> translate<16.239997,0.000000,25.106216> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.239997,0.000000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.536388,0.000000,25.146000>}
box{<0,0,-0.076200><1.296391,0.035000,0.076200> rotate<0,0.000000,0> translate<16.239997,0.000000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.239997,0.000000,25.298400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.932400,0.000000,25.298400>}
box{<0,0,-0.076200><0.692403,0.035000,0.076200> rotate<0,0.000000,0> translate<16.239997,0.000000,25.298400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.239997,0.000000,25.450800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.932400,0.000000,25.450800>}
box{<0,0,-0.076200><0.692403,0.035000,0.076200> rotate<0,0.000000,0> translate<16.239997,0.000000,25.450800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.239997,0.000000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.932400,0.000000,25.603200>}
box{<0,0,-0.076200><0.692403,0.035000,0.076200> rotate<0,0.000000,0> translate<16.239997,0.000000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.270325,0.000000,23.542197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.453781,0.000000,23.542197>}
box{<0,0,-0.076200><0.183456,0.035000,0.076200> rotate<0,0.000000,0> translate<16.270325,0.000000,23.542197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.286816,0.000000,11.734800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.344788,0.000000,11.734800>}
box{<0,0,-0.076200><5.057972,0.035000,0.076200> rotate<0,0.000000,0> translate<16.286816,0.000000,11.734800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.352612,0.000000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.932397,0.000000,24.993600>}
box{<0,0,-0.076200><0.579784,0.035000,0.076200> rotate<0,0.000000,0> translate<16.352612,0.000000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.363016,0.000000,11.811000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.586197,0.000000,12.034181>}
box{<0,0,-0.076200><0.315626,0.035000,0.076200> rotate<0,-44.997030,0> translate<16.363016,0.000000,11.811000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.423997,0.000000,22.787012>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.453766,0.000000,22.787012>}
box{<0,0,-0.076200><0.029769,0.035000,0.076200> rotate<0,0.000000,0> translate<16.423997,0.000000,22.787012> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.439216,0.000000,11.887200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.497188,0.000000,11.887200>}
box{<0,0,-0.076200><5.057972,0.035000,0.076200> rotate<0,0.000000,0> translate<16.439216,0.000000,11.887200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.453766,0.000000,22.787012>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.453766,0.000000,22.786981>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,-90.000000,0> translate<16.453766,0.000000,22.786981> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.453781,0.000000,22.787031>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.453781,0.000000,23.542197>}
box{<0,0,-0.076200><0.755166,0.035000,0.076200> rotate<0,90.000000,0> translate<16.453781,0.000000,23.542197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.453781,0.000000,22.787031>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.453813,0.000000,22.787031>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<16.453781,0.000000,22.787031> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.453781,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.453813,0.000000,22.860000>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<16.453781,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.453781,0.000000,23.012400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.453813,0.000000,23.012400>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<16.453781,0.000000,23.012400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.453781,0.000000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.453813,0.000000,23.164800>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<16.453781,0.000000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.453781,0.000000,23.317200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.453813,0.000000,23.317200>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<16.453781,0.000000,23.317200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.453781,0.000000,23.469600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.453813,0.000000,23.469600>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<16.453781,0.000000,23.469600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.453813,0.000000,23.542197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.453813,0.000000,22.787031>}
box{<0,0,-0.076200><0.755166,0.035000,0.076200> rotate<0,-90.000000,0> translate<16.453813,0.000000,22.787031> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.453813,0.000000,23.542197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.637272,0.000000,23.542197>}
box{<0,0,-0.076200><0.183459,0.035000,0.076200> rotate<0,0.000000,0> translate<16.453813,0.000000,23.542197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.453831,0.000000,22.786981>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.453831,0.000000,22.787012>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,90.000000,0> translate<16.453831,0.000000,22.787012> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.453831,0.000000,22.786981>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.953766,0.000000,22.786981>}
box{<0,0,-0.076200><0.499934,0.035000,0.076200> rotate<0,0.000000,0> translate<16.453831,0.000000,22.786981> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.453831,0.000000,22.787012>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.923997,0.000000,22.787012>}
box{<0,0,-0.076200><0.470166,0.035000,0.076200> rotate<0,0.000000,0> translate<16.453831,0.000000,22.787012> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.505012,0.000000,24.841200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.932397,0.000000,24.841200>}
box{<0,0,-0.076200><0.427384,0.035000,0.076200> rotate<0,0.000000,0> translate<16.505012,0.000000,24.841200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.586197,0.000000,12.034181>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.586197,0.000000,14.447181>}
box{<0,0,-0.076200><2.413000,0.035000,0.076200> rotate<0,90.000000,0> translate<16.586197,0.000000,14.447181> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.586197,0.000000,12.039600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.513800,0.000000,12.039600>}
box{<0,0,-0.076200><4.927603,0.035000,0.076200> rotate<0,0.000000,0> translate<16.586197,0.000000,12.039600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.586197,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.513800,0.000000,12.192000>}
box{<0,0,-0.076200><4.927603,0.035000,0.076200> rotate<0,0.000000,0> translate<16.586197,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.586197,0.000000,12.344400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.921244,0.000000,12.344400>}
box{<0,0,-0.076200><0.335047,0.035000,0.076200> rotate<0,0.000000,0> translate<16.586197,0.000000,12.344400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.586197,0.000000,12.496800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.715741,0.000000,12.496800>}
box{<0,0,-0.076200><0.129544,0.035000,0.076200> rotate<0,0.000000,0> translate<16.586197,0.000000,12.496800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.586197,0.000000,12.649200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.669600,0.000000,12.649200>}
box{<0,0,-0.076200><0.083403,0.035000,0.076200> rotate<0,0.000000,0> translate<16.586197,0.000000,12.649200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.586197,0.000000,12.801600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.669600,0.000000,12.801600>}
box{<0,0,-0.076200><0.083403,0.035000,0.076200> rotate<0,0.000000,0> translate<16.586197,0.000000,12.801600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.586197,0.000000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.373587,0.000000,12.954000>}
box{<0,0,-0.076200><0.787391,0.035000,0.076200> rotate<0,0.000000,0> translate<16.586197,0.000000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.586197,0.000000,13.106400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.669600,0.000000,13.106400>}
box{<0,0,-0.076200><0.083403,0.035000,0.076200> rotate<0,0.000000,0> translate<16.586197,0.000000,13.106400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.586197,0.000000,13.258800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.669600,0.000000,13.258800>}
box{<0,0,-0.076200><0.083403,0.035000,0.076200> rotate<0,0.000000,0> translate<16.586197,0.000000,13.258800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.586197,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.670278,0.000000,13.411200>}
box{<0,0,-0.076200><0.084081,0.035000,0.076200> rotate<0,0.000000,0> translate<16.586197,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.586197,0.000000,13.563600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.733066,0.000000,13.563600>}
box{<0,0,-0.076200><0.146869,0.035000,0.076200> rotate<0,0.000000,0> translate<16.586197,0.000000,13.563600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.586197,0.000000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.513800,0.000000,13.716000>}
box{<0,0,-0.076200><4.927603,0.035000,0.076200> rotate<0,0.000000,0> translate<16.586197,0.000000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.586197,0.000000,13.868400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.773309,0.000000,13.868400>}
box{<0,0,-0.076200><0.187112,0.035000,0.076200> rotate<0,0.000000,0> translate<16.586197,0.000000,13.868400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.586197,0.000000,14.020800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.771200,0.000000,14.020800>}
box{<0,0,-0.076200><0.185003,0.035000,0.076200> rotate<0,0.000000,0> translate<16.586197,0.000000,14.020800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.586197,0.000000,14.173200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.771200,0.000000,14.173200>}
box{<0,0,-0.076200><0.185003,0.035000,0.076200> rotate<0,0.000000,0> translate<16.586197,0.000000,14.173200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.586197,0.000000,14.325600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.771200,0.000000,14.325600>}
box{<0,0,-0.076200><0.185003,0.035000,0.076200> rotate<0,0.000000,0> translate<16.586197,0.000000,14.325600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.586197,0.000000,14.447181>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.771200,0.000000,14.632188>}
box{<0,0,-0.076200><0.261636,0.035000,0.076200> rotate<0,-44.997514,0> translate<16.586197,0.000000,14.447181> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.617013,0.000000,14.478000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.771200,0.000000,14.478000>}
box{<0,0,-0.076200><0.154187,0.035000,0.076200> rotate<0,0.000000,0> translate<16.617013,0.000000,14.478000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.637272,0.000000,23.542197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.703800,0.000000,23.524369>}
box{<0,0,-0.076200><0.068875,0.035000,0.076200> rotate<0,15.000591,0> translate<16.637272,0.000000,23.542197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.657412,0.000000,24.688800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.932397,0.000000,24.688800>}
box{<0,0,-0.076200><0.274984,0.035000,0.076200> rotate<0,0.000000,0> translate<16.657412,0.000000,24.688800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.669600,0.000000,12.621725>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.692103,0.000000,12.537747>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,74.994252,0> translate<16.669600,0.000000,12.621725> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.669600,0.000000,12.939003>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.669600,0.000000,12.621725>}
box{<0,0,-0.076200><0.317278,0.035000,0.076200> rotate<0,-90.000000,0> translate<16.669600,0.000000,12.621725> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.669600,0.000000,12.939003>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.373587,0.000000,12.939003>}
box{<0,0,-0.076200><0.703988,0.035000,0.076200> rotate<0,0.000000,0> translate<16.669600,0.000000,12.939003> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.669600,0.000000,13.091391>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.373587,0.000000,13.091391>}
box{<0,0,-0.076200><0.703988,0.035000,0.076200> rotate<0,0.000000,0> translate<16.669600,0.000000,13.091391> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.669600,0.000000,13.408672>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.669600,0.000000,13.091391>}
box{<0,0,-0.076200><0.317281,0.035000,0.076200> rotate<0,-90.000000,0> translate<16.669600,0.000000,13.091391> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.669600,0.000000,13.408672>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.692103,0.000000,13.492650>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-74.994252,0> translate<16.669600,0.000000,13.408672> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.692103,0.000000,12.537747>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.735575,0.000000,12.462450>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,59.996495,0> translate<16.692103,0.000000,12.537747> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.692103,0.000000,13.492650>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.735575,0.000000,13.567947>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-59.996495,0> translate<16.692103,0.000000,13.492650> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.703800,0.000000,23.524369>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.735672,0.000000,23.532909>}
box{<0,0,-0.076200><0.032996,0.035000,0.076200> rotate<0,-14.999986,0> translate<16.703800,0.000000,23.524369> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.735575,0.000000,12.462450>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.797050,0.000000,12.400975>}
box{<0,0,-0.076200><0.086939,0.035000,0.076200> rotate<0,44.997030,0> translate<16.735575,0.000000,12.462450> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.735575,0.000000,13.567947>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.797050,0.000000,13.629422>}
box{<0,0,-0.076200><0.086939,0.035000,0.076200> rotate<0,-44.997030,0> translate<16.735575,0.000000,13.567947> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.769413,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.771200,0.000000,14.630400>}
box{<0,0,-0.076200><0.001787,0.035000,0.076200> rotate<0,0.000000,0> translate<16.769413,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.771200,0.000000,13.870509>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.905109,0.000000,13.736600>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<16.771200,0.000000,13.870509> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.771200,0.000000,14.632188>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.771200,0.000000,13.870509>}
box{<0,0,-0.076200><0.761678,0.035000,0.076200> rotate<0,-90.000000,0> translate<16.771200,0.000000,13.870509> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.797050,0.000000,12.400975>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.872347,0.000000,12.357503>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,29.997566,0> translate<16.797050,0.000000,12.400975> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.797050,0.000000,13.629422>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.872347,0.000000,13.672894>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-29.997566,0> translate<16.797050,0.000000,13.629422> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.809812,0.000000,24.536400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.973463,0.000000,24.536400>}
box{<0,0,-0.076200><0.163650,0.035000,0.076200> rotate<0,0.000000,0> translate<16.809812,0.000000,24.536400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.872347,0.000000,12.357503>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.956325,0.000000,12.335000>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,14.999808,0> translate<16.872347,0.000000,12.357503> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.872347,0.000000,13.672894>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.956325,0.000000,13.695397>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-14.999808,0> translate<16.872347,0.000000,13.672894> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.905109,0.000000,13.736600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.994488,0.000000,13.736600>}
box{<0,0,-0.076200><1.089378,0.035000,0.076200> rotate<0,0.000000,0> translate<16.905109,0.000000,13.736600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.923997,0.000000,22.787012>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.953766,0.000000,22.787012>}
box{<0,0,-0.076200><0.029769,0.035000,0.076200> rotate<0,0.000000,0> translate<16.923997,0.000000,22.787012> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.932397,0.000000,25.069803>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.932400,0.000000,24.652525>}
box{<0,0,-0.076200><0.417278,0.035000,0.076200> rotate<0,89.993631,0> translate<16.932397,0.000000,25.069803> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.932397,0.000000,25.069803>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.536388,0.000000,25.069803>}
box{<0,0,-0.076200><0.603991,0.035000,0.076200> rotate<0,0.000000,0> translate<16.932397,0.000000,25.069803> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.932397,0.000000,25.222191>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.932400,0.000000,25.639472>}
box{<0,0,-0.076200><0.417281,0.035000,0.076200> rotate<0,-89.993631,0> translate<16.932397,0.000000,25.222191> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.932397,0.000000,25.222191>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.536388,0.000000,25.222191>}
box{<0,0,-0.076200><0.603991,0.035000,0.076200> rotate<0,0.000000,0> translate<16.932397,0.000000,25.222191> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.932400,0.000000,24.652525>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.954903,0.000000,24.568547>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,74.994252,0> translate<16.932400,0.000000,24.652525> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.932400,0.000000,25.639472>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.954903,0.000000,25.723450>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-74.994252,0> translate<16.932400,0.000000,25.639472> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.953766,0.000000,22.787012>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.953766,0.000000,22.786981>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,-90.000000,0> translate<16.953766,0.000000,22.786981> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.954903,0.000000,24.568547>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.998375,0.000000,24.493250>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,59.996495,0> translate<16.954903,0.000000,24.568547> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.954903,0.000000,25.723450>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.998375,0.000000,25.798747>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-59.996495,0> translate<16.954903,0.000000,25.723450> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.956325,0.000000,12.335000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.373603,0.000000,12.334997>}
box{<0,0,-0.076200><0.417278,0.035000,0.076200> rotate<0,0.000429,0> translate<16.956325,0.000000,12.335000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.956325,0.000000,13.695397>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.373603,0.000000,13.695397>}
box{<0,0,-0.076200><0.417278,0.035000,0.076200> rotate<0,0.000000,0> translate<16.956325,0.000000,13.695397> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.962212,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.151203,0.000000,24.384000>}
box{<0,0,-0.076200><0.188991,0.035000,0.076200> rotate<0,0.000000,0> translate<16.962212,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.971388,0.000000,8.374991>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.971388,0.000000,8.222603>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,-90.000000,0> translate<16.971388,0.000000,8.222603> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.971403,0.000000,8.375009>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.971403,0.000000,9.178997>}
box{<0,0,-0.076200><0.803987,0.035000,0.076200> rotate<0,90.000000,0> translate<16.971403,0.000000,9.178997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.971403,0.000000,8.375009>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.123791,0.000000,8.375009>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<16.971403,0.000000,8.375009> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.971403,0.000000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.123791,0.000000,8.382000>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<16.971403,0.000000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.971403,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.123791,0.000000,8.534400>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<16.971403,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.971403,0.000000,8.686800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.123791,0.000000,8.686800>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<16.971403,0.000000,8.686800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.971403,0.000000,8.839200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.123791,0.000000,8.839200>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<16.971403,0.000000,8.839200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.971403,0.000000,8.991600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.123791,0.000000,8.991600>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<16.971403,0.000000,8.991600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.971403,0.000000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.123791,0.000000,9.144000>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<16.971403,0.000000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.998375,0.000000,24.493250>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.059850,0.000000,24.431775>}
box{<0,0,-0.076200><0.086939,0.035000,0.076200> rotate<0,44.997030,0> translate<16.998375,0.000000,24.493250> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.998375,0.000000,25.798747>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.059850,0.000000,25.860222>}
box{<0,0,-0.076200><0.086939,0.035000,0.076200> rotate<0,-44.997030,0> translate<16.998375,0.000000,25.798747> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.059850,0.000000,24.431775>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.135147,0.000000,24.388303>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,29.997566,0> translate<17.059850,0.000000,24.431775> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.059850,0.000000,25.860222>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.135147,0.000000,25.903694>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-29.997566,0> translate<17.059850,0.000000,25.860222> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.114612,0.000000,24.231600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780000,0.000000,24.231600>}
box{<0,0,-0.076200><0.665388,0.035000,0.076200> rotate<0,0.000000,0> translate<17.114612,0.000000,24.231600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.123791,0.000000,9.178997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.123791,0.000000,8.375009>}
box{<0,0,-0.076200><0.803987,0.035000,0.076200> rotate<0,-90.000000,0> translate<17.123791,0.000000,8.375009> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.123791,0.000000,9.178997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.041072,0.000000,9.178997>}
box{<0,0,-0.076200><0.917281,0.035000,0.076200> rotate<0,0.000000,0> translate<17.123791,0.000000,9.178997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.123809,0.000000,8.222603>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.123809,0.000000,8.374991>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,90.000000,0> translate<17.123809,0.000000,8.374991> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.123809,0.000000,8.222603>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.327797,0.000000,8.222603>}
box{<0,0,-0.076200><1.203988,0.035000,0.076200> rotate<0,0.000000,0> translate<17.123809,0.000000,8.222603> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.123809,0.000000,8.229600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.569000,0.000000,8.229600>}
box{<0,0,-0.076200><2.445191,0.035000,0.076200> rotate<0,0.000000,0> translate<17.123809,0.000000,8.229600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.123809,0.000000,8.374991>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.327797,0.000000,8.374991>}
box{<0,0,-0.076200><1.203988,0.035000,0.076200> rotate<0,0.000000,0> translate<17.123809,0.000000,8.374991> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.135147,0.000000,24.388303>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.219125,0.000000,24.365800>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,14.999808,0> translate<17.135147,0.000000,24.388303> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.135147,0.000000,25.903694>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.219125,0.000000,25.926197>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-14.999808,0> translate<17.135147,0.000000,25.903694> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.219125,0.000000,24.365800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.536403,0.000000,24.365800>}
box{<0,0,-0.076200><0.317278,0.035000,0.076200> rotate<0,0.000000,0> translate<17.219125,0.000000,24.365800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.219125,0.000000,25.926197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.536403,0.000000,25.926197>}
box{<0,0,-0.076200><0.317278,0.035000,0.076200> rotate<0,0.000000,0> translate<17.219125,0.000000,25.926197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.267012,0.000000,24.079200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780000,0.000000,24.079200>}
box{<0,0,-0.076200><0.512988,0.035000,0.076200> rotate<0,0.000000,0> translate<17.267012,0.000000,24.079200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.373587,0.000000,13.091391>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.373587,0.000000,12.939003>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,-90.000000,0> translate<17.373587,0.000000,12.939003> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.373603,0.000000,12.334997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.373603,0.000000,12.938988>}
box{<0,0,-0.076200><0.603991,0.035000,0.076200> rotate<0,90.000000,0> translate<17.373603,0.000000,12.938988> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.373603,0.000000,12.344400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.525991,0.000000,12.344400>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.373603,0.000000,12.344400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.373603,0.000000,12.496800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.525991,0.000000,12.496800>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.373603,0.000000,12.496800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.373603,0.000000,12.649200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.525991,0.000000,12.649200>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.373603,0.000000,12.649200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.373603,0.000000,12.801600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.525991,0.000000,12.801600>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.373603,0.000000,12.801600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.373603,0.000000,12.938988>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.525991,0.000000,12.938988>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.373603,0.000000,12.938988> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.373603,0.000000,13.091409>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.373603,0.000000,13.695397>}
box{<0,0,-0.076200><0.603987,0.035000,0.076200> rotate<0,90.000000,0> translate<17.373603,0.000000,13.695397> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.373603,0.000000,13.091409>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.525991,0.000000,13.091409>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.373603,0.000000,13.091409> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.373603,0.000000,13.106400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.525991,0.000000,13.106400>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.373603,0.000000,13.106400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.373603,0.000000,13.258800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.525991,0.000000,13.258800>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.373603,0.000000,13.258800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.373603,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.525991,0.000000,13.411200>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.373603,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.373603,0.000000,13.563600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.525991,0.000000,13.563600>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.373603,0.000000,13.563600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.419412,0.000000,23.926800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.572800,0.000000,23.926800>}
box{<0,0,-0.076200><1.153388,0.035000,0.076200> rotate<0,0.000000,0> translate<17.419412,0.000000,23.926800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.525991,0.000000,12.334997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.943272,0.000000,12.335000>}
box{<0,0,-0.076200><0.417281,0.035000,0.076200> rotate<0,-0.000429,0> translate<17.525991,0.000000,12.334997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.525991,0.000000,12.938988>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.525991,0.000000,12.334997>}
box{<0,0,-0.076200><0.603991,0.035000,0.076200> rotate<0,-90.000000,0> translate<17.525991,0.000000,12.334997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.525991,0.000000,13.695397>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.525991,0.000000,13.091409>}
box{<0,0,-0.076200><0.603987,0.035000,0.076200> rotate<0,-90.000000,0> translate<17.525991,0.000000,13.091409> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.525991,0.000000,13.695397>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.943272,0.000000,13.695397>}
box{<0,0,-0.076200><0.417281,0.035000,0.076200> rotate<0,0.000000,0> translate<17.525991,0.000000,13.695397> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.526009,0.000000,12.939003>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.526009,0.000000,13.091391>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,90.000000,0> translate<17.526009,0.000000,13.091391> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.526009,0.000000,12.939003>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.229994,0.000000,12.939003>}
box{<0,0,-0.076200><0.703984,0.035000,0.076200> rotate<0,0.000000,0> translate<17.526009,0.000000,12.939003> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.526009,0.000000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.380188,0.000000,12.954000>}
box{<0,0,-0.076200><1.854178,0.035000,0.076200> rotate<0,0.000000,0> translate<17.526009,0.000000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.526009,0.000000,13.091391>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.229997,0.000000,13.091391>}
box{<0,0,-0.076200><0.703988,0.035000,0.076200> rotate<0,0.000000,0> translate<17.526009,0.000000,13.091391> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.536388,0.000000,25.222191>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.536388,0.000000,25.069803>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,-90.000000,0> translate<17.536388,0.000000,25.069803> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.536403,0.000000,24.365800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.536403,0.000000,25.069788>}
box{<0,0,-0.076200><0.703988,0.035000,0.076200> rotate<0,90.000000,0> translate<17.536403,0.000000,25.069788> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.536403,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.688791,0.000000,24.384000>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.536403,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.536403,0.000000,24.536400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.688791,0.000000,24.536400>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.536403,0.000000,24.536400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.536403,0.000000,24.688800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.688791,0.000000,24.688800>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.536403,0.000000,24.688800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.536403,0.000000,24.841200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.688791,0.000000,24.841200>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.536403,0.000000,24.841200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.536403,0.000000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.688791,0.000000,24.993600>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.536403,0.000000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.536403,0.000000,25.069788>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.688791,0.000000,25.069788>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.536403,0.000000,25.069788> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.536403,0.000000,25.222209>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.536403,0.000000,25.926197>}
box{<0,0,-0.076200><0.703988,0.035000,0.076200> rotate<0,90.000000,0> translate<17.536403,0.000000,25.926197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.536403,0.000000,25.222209>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.688791,0.000000,25.222209>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.536403,0.000000,25.222209> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.536403,0.000000,25.298400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.688791,0.000000,25.298400>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.536403,0.000000,25.298400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.536403,0.000000,25.450800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.688791,0.000000,25.450800>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.536403,0.000000,25.450800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.536403,0.000000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.688791,0.000000,25.603200>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.536403,0.000000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.536403,0.000000,25.755600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.688791,0.000000,25.755600>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.536403,0.000000,25.755600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.536403,0.000000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.688791,0.000000,25.908000>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.536403,0.000000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.571813,0.000000,23.774400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.572800,0.000000,23.774400>}
box{<0,0,-0.076200><1.000988,0.035000,0.076200> rotate<0,0.000000,0> translate<17.571813,0.000000,23.774400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.627588,0.000000,19.888191>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.627588,0.000000,19.735803>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,-90.000000,0> translate<17.627588,0.000000,19.735803> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.627603,0.000000,17.535775>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.627603,0.000000,19.735788>}
box{<0,0,-0.076200><2.200012,0.035000,0.076200> rotate<0,90.000000,0> translate<17.627603,0.000000,19.735788> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.627603,0.000000,17.535775>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.686347,0.000000,17.569694>}
box{<0,0,-0.076200><0.067833,0.035000,0.076200> rotate<0,-30.000236,0> translate<17.627603,0.000000,17.535775> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.627603,0.000000,17.678400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.779991,0.000000,17.678400>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.627603,0.000000,17.678400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.627603,0.000000,17.830800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.779991,0.000000,17.830800>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.627603,0.000000,17.830800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.627603,0.000000,17.983200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.779991,0.000000,17.983200>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.627603,0.000000,17.983200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.627603,0.000000,18.135600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.779991,0.000000,18.135600>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.627603,0.000000,18.135600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.627603,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.779991,0.000000,18.288000>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.627603,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.627603,0.000000,18.440400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.779991,0.000000,18.440400>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.627603,0.000000,18.440400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.627603,0.000000,18.592800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.779991,0.000000,18.592800>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.627603,0.000000,18.592800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.627603,0.000000,18.745200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.779991,0.000000,18.745200>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.627603,0.000000,18.745200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.627603,0.000000,18.897600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.779991,0.000000,18.897600>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.627603,0.000000,18.897600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.627603,0.000000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.779991,0.000000,19.050000>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.627603,0.000000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.627603,0.000000,19.202400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.779991,0.000000,19.202400>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.627603,0.000000,19.202400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.627603,0.000000,19.354800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.779991,0.000000,19.354800>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.627603,0.000000,19.354800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.627603,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.779991,0.000000,19.507200>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.627603,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.627603,0.000000,19.659600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.779991,0.000000,19.659600>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.627603,0.000000,19.659600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.627603,0.000000,19.735788>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.779991,0.000000,19.735788>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.627603,0.000000,19.735788> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.627603,0.000000,19.888209>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.627603,0.000000,22.088222>}
box{<0,0,-0.076200><2.200012,0.035000,0.076200> rotate<0,90.000000,0> translate<17.627603,0.000000,22.088222> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.627603,0.000000,19.888209>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.779991,0.000000,19.888209>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.627603,0.000000,19.888209> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.627603,0.000000,19.964400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.779991,0.000000,19.964400>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.627603,0.000000,19.964400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.627603,0.000000,20.116800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.779991,0.000000,20.116800>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.627603,0.000000,20.116800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.627603,0.000000,20.269200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.779991,0.000000,20.269200>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.627603,0.000000,20.269200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.627603,0.000000,20.421600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.779991,0.000000,20.421600>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.627603,0.000000,20.421600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.627603,0.000000,20.574000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.779991,0.000000,20.574000>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.627603,0.000000,20.574000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.627603,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.779991,0.000000,20.726400>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.627603,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.627603,0.000000,20.878800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.779991,0.000000,20.878800>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.627603,0.000000,20.878800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.627603,0.000000,21.031200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.779991,0.000000,21.031200>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.627603,0.000000,21.031200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.627603,0.000000,21.183600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.779991,0.000000,21.183600>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.627603,0.000000,21.183600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.627603,0.000000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.779991,0.000000,21.336000>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.627603,0.000000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.627603,0.000000,21.488400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.779991,0.000000,21.488400>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.627603,0.000000,21.488400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.627603,0.000000,21.640800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.779991,0.000000,21.640800>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.627603,0.000000,21.640800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.627603,0.000000,21.793200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.779991,0.000000,21.793200>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.627603,0.000000,21.793200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.627603,0.000000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.779991,0.000000,21.945600>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.627603,0.000000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.627603,0.000000,22.088222>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.686347,0.000000,22.054303>}
box{<0,0,-0.076200><0.067833,0.035000,0.076200> rotate<0,30.000236,0> translate<17.627603,0.000000,22.088222> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.686347,0.000000,17.569694>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.770325,0.000000,17.592197>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-14.999808,0> translate<17.686347,0.000000,17.569694> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.686347,0.000000,22.054303>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.770325,0.000000,22.031800>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,14.999808,0> translate<17.686347,0.000000,22.054303> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.688791,0.000000,24.365800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780000,0.000000,24.365800>}
box{<0,0,-0.076200><0.091209,0.035000,0.076200> rotate<0,0.000000,0> translate<17.688791,0.000000,24.365800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.688791,0.000000,25.069788>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.688791,0.000000,24.365800>}
box{<0,0,-0.076200><0.703988,0.035000,0.076200> rotate<0,-90.000000,0> translate<17.688791,0.000000,24.365800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.688791,0.000000,25.926194>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.688791,0.000000,25.222209>}
box{<0,0,-0.076200><0.703984,0.035000,0.076200> rotate<0,-90.000000,0> translate<17.688791,0.000000,25.222209> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.688791,0.000000,25.926194>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780000,0.000000,25.926194>}
box{<0,0,-0.076200><0.091209,0.035000,0.076200> rotate<0,0.000000,0> translate<17.688791,0.000000,25.926194> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.724213,0.000000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.572800,0.000000,23.622000>}
box{<0,0,-0.076200><0.848588,0.035000,0.076200> rotate<0,0.000000,0> translate<17.724213,0.000000,23.622000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.770325,0.000000,17.592197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.779991,0.000000,17.592197>}
box{<0,0,-0.076200><0.009666,0.035000,0.076200> rotate<0,0.000000,0> translate<17.770325,0.000000,17.592197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.770325,0.000000,22.031800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.779991,0.000000,22.031800>}
box{<0,0,-0.076200><0.009666,0.035000,0.076200> rotate<0,0.000000,0> translate<17.770325,0.000000,22.031800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.779991,0.000000,19.735788>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.779991,0.000000,17.592197>}
box{<0,0,-0.076200><2.143591,0.035000,0.076200> rotate<0,-90.000000,0> translate<17.779991,0.000000,17.592197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.779991,0.000000,22.031800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.779991,0.000000,19.888209>}
box{<0,0,-0.076200><2.143591,0.035000,0.076200> rotate<0,-90.000000,0> translate<17.779991,0.000000,19.888209> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780000,0.000000,24.047634>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.824634,0.000000,24.003000>}
box{<0,0,-0.076200><0.063123,0.035000,0.076200> rotate<0,44.997030,0> translate<17.780000,0.000000,24.047634> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780000,0.000000,24.365800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780000,0.000000,24.047634>}
box{<0,0,-0.076200><0.318166,0.035000,0.076200> rotate<0,-90.000000,0> translate<17.780000,0.000000,24.047634> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780000,0.000000,27.514363>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780000,0.000000,25.926194>}
box{<0,0,-0.076200><1.588169,0.035000,0.076200> rotate<0,-90.000000,0> translate<17.780000,0.000000,25.926194> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780000,0.000000,27.514363>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.824634,0.000000,27.558997>}
box{<0,0,-0.076200><0.063123,0.035000,0.076200> rotate<0,-44.997030,0> translate<17.780000,0.000000,27.514363> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780009,0.000000,19.735803>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780009,0.000000,19.888191>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,90.000000,0> translate<17.780009,0.000000,19.888191> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780009,0.000000,19.735803>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.923600,0.000000,19.735803>}
box{<0,0,-0.076200><2.143591,0.035000,0.076200> rotate<0,0.000000,0> translate<17.780009,0.000000,19.735803> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780009,0.000000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.941428,0.000000,19.812000>}
box{<0,0,-0.076200><2.161419,0.035000,0.076200> rotate<0,0.000000,0> translate<17.780009,0.000000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780009,0.000000,19.888191>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.980019,0.000000,19.888191>}
box{<0,0,-0.076200><2.200009,0.035000,0.076200> rotate<0,0.000000,0> translate<17.780009,0.000000,19.888191> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.804016,0.000000,23.542197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.953781,0.000000,23.542197>}
box{<0,0,-0.076200><0.149766,0.035000,0.076200> rotate<0,0.000000,0> translate<17.804016,0.000000,23.542197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.824634,0.000000,24.003000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.572800,0.000000,24.003000>}
box{<0,0,-0.076200><0.748166,0.035000,0.076200> rotate<0,0.000000,0> translate<17.824634,0.000000,24.003000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.824634,0.000000,27.558997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.947106,0.000000,27.558997>}
box{<0,0,-0.076200><2.122472,0.035000,0.076200> rotate<0,0.000000,0> translate<17.824634,0.000000,27.558997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.834797,0.000000,14.893797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.834797,0.000000,16.081800>}
box{<0,0,-0.076200><1.188003,0.035000,0.076200> rotate<0,90.000000,0> translate<17.834797,0.000000,16.081800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.834797,0.000000,14.893797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.994488,0.000000,14.893797>}
box{<0,0,-0.076200><0.159691,0.035000,0.076200> rotate<0,0.000000,0> translate<17.834797,0.000000,14.893797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.834797,0.000000,14.935200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.032256,0.000000,14.935200>}
box{<0,0,-0.076200><1.197459,0.035000,0.076200> rotate<0,0.000000,0> translate<17.834797,0.000000,14.935200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.834797,0.000000,15.087600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.923000,0.000000,15.087600>}
box{<0,0,-0.076200><1.088203,0.035000,0.076200> rotate<0,0.000000,0> translate<17.834797,0.000000,15.087600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.834797,0.000000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.923000,0.000000,15.240000>}
box{<0,0,-0.076200><1.088203,0.035000,0.076200> rotate<0,0.000000,0> translate<17.834797,0.000000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.834797,0.000000,15.392400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.790581,0.000000,15.392400>}
box{<0,0,-0.076200><0.955784,0.035000,0.076200> rotate<0,0.000000,0> translate<17.834797,0.000000,15.392400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.834797,0.000000,15.544800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.638181,0.000000,15.544800>}
box{<0,0,-0.076200><0.803384,0.035000,0.076200> rotate<0,0.000000,0> translate<17.834797,0.000000,15.544800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.834797,0.000000,15.697200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.572800,0.000000,15.697200>}
box{<0,0,-0.076200><0.738003,0.035000,0.076200> rotate<0,0.000000,0> translate<17.834797,0.000000,15.697200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.834797,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.572800,0.000000,15.849600>}
box{<0,0,-0.076200><0.738003,0.035000,0.076200> rotate<0,0.000000,0> translate<17.834797,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.834797,0.000000,16.002000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.572800,0.000000,16.002000>}
box{<0,0,-0.076200><0.738003,0.035000,0.076200> rotate<0,0.000000,0> translate<17.834797,0.000000,16.002000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.834797,0.000000,16.081800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.953781,0.000000,16.081800>}
box{<0,0,-0.076200><0.118984,0.035000,0.076200> rotate<0,0.000000,0> translate<17.834797,0.000000,16.081800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.943272,0.000000,12.335000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.027250,0.000000,12.357503>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-14.999808,0> translate<17.943272,0.000000,12.335000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.943272,0.000000,13.695397>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.027250,0.000000,13.672894>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,14.999808,0> translate<17.943272,0.000000,13.695397> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.953781,0.000000,16.081800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.953781,0.000000,16.836966>}
box{<0,0,-0.076200><0.755166,0.035000,0.076200> rotate<0,90.000000,0> translate<17.953781,0.000000,16.836966> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.953781,0.000000,16.154400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.953813,0.000000,16.154400>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<17.953781,0.000000,16.154400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.953781,0.000000,16.306800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.953813,0.000000,16.306800>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<17.953781,0.000000,16.306800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.953781,0.000000,16.459200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.953813,0.000000,16.459200>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<17.953781,0.000000,16.459200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.953781,0.000000,16.611600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.953813,0.000000,16.611600>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<17.953781,0.000000,16.611600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.953781,0.000000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.953813,0.000000,16.764000>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<17.953781,0.000000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.953781,0.000000,16.836966>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.953813,0.000000,16.836966>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<17.953781,0.000000,16.836966> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.953781,0.000000,22.787031>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.953781,0.000000,23.542197>}
box{<0,0,-0.076200><0.755166,0.035000,0.076200> rotate<0,90.000000,0> translate<17.953781,0.000000,23.542197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.953781,0.000000,22.787031>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.953813,0.000000,22.787031>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<17.953781,0.000000,22.787031> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.953781,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.953813,0.000000,22.860000>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<17.953781,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.953781,0.000000,23.012400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.953813,0.000000,23.012400>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<17.953781,0.000000,23.012400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.953781,0.000000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.953813,0.000000,23.164800>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<17.953781,0.000000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.953781,0.000000,23.317200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.953813,0.000000,23.317200>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<17.953781,0.000000,23.317200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.953781,0.000000,23.469600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.953813,0.000000,23.469600>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<17.953781,0.000000,23.469600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.953813,0.000000,16.081800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.137272,0.000000,16.081800>}
box{<0,0,-0.076200><0.183459,0.035000,0.076200> rotate<0,0.000000,0> translate<17.953813,0.000000,16.081800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.953813,0.000000,16.836966>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.953813,0.000000,16.081800>}
box{<0,0,-0.076200><0.755166,0.035000,0.076200> rotate<0,-90.000000,0> translate<17.953813,0.000000,16.081800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.953813,0.000000,23.542197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.953813,0.000000,22.787031>}
box{<0,0,-0.076200><0.755166,0.035000,0.076200> rotate<0,-90.000000,0> translate<17.953813,0.000000,22.787031> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.953813,0.000000,23.542197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.137272,0.000000,23.542197>}
box{<0,0,-0.076200><0.183459,0.035000,0.076200> rotate<0,0.000000,0> translate<17.953813,0.000000,23.542197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.953831,0.000000,16.836981>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.953831,0.000000,16.837013>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,90.000000,0> translate<17.953831,0.000000,16.837013> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.953831,0.000000,16.836981>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.983597,0.000000,16.836981>}
box{<0,0,-0.076200><0.029766,0.035000,0.076200> rotate<0,0.000000,0> translate<17.953831,0.000000,16.836981> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.953831,0.000000,16.837013>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.453766,0.000000,16.837013>}
box{<0,0,-0.076200><0.499934,0.035000,0.076200> rotate<0,0.000000,0> translate<17.953831,0.000000,16.837013> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.953831,0.000000,22.786981>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.953831,0.000000,22.787012>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,90.000000,0> translate<17.953831,0.000000,22.787012> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.953831,0.000000,22.786981>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.453766,0.000000,22.786981>}
box{<0,0,-0.076200><0.499934,0.035000,0.076200> rotate<0,0.000000,0> translate<17.953831,0.000000,22.786981> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.953831,0.000000,22.787012>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.423997,0.000000,22.787012>}
box{<0,0,-0.076200><0.470166,0.035000,0.076200> rotate<0,0.000000,0> translate<17.953831,0.000000,22.787012> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.978350,0.000000,12.344400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.927844,0.000000,12.344400>}
box{<0,0,-0.076200><0.949494,0.035000,0.076200> rotate<0,0.000000,0> translate<17.978350,0.000000,12.344400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.983597,0.000000,16.836981>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.453766,0.000000,16.836981>}
box{<0,0,-0.076200><0.470169,0.035000,0.076200> rotate<0,0.000000,0> translate<17.983597,0.000000,16.836981> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.994488,0.000000,13.736600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.128397,0.000000,13.870509>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<17.994488,0.000000,13.736600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.994488,0.000000,14.893797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.128397,0.000000,14.759888>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<17.994488,0.000000,14.893797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.027250,0.000000,12.357503>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.102547,0.000000,12.400975>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-29.997566,0> translate<18.027250,0.000000,12.357503> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.027250,0.000000,13.672894>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.102547,0.000000,13.629422>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,29.997566,0> translate<18.027250,0.000000,13.672894> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.041072,0.000000,9.178997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.125050,0.000000,9.156494>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,14.999808,0> translate<18.041072,0.000000,9.178997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.092288,0.000000,9.820200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.226197,0.000000,9.954109>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<18.092288,0.000000,9.820200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.092288,0.000000,11.377397>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.226197,0.000000,11.243488>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<18.092288,0.000000,11.377397> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.102547,0.000000,12.400975>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.164022,0.000000,12.462450>}
box{<0,0,-0.076200><0.086939,0.035000,0.076200> rotate<0,-44.997030,0> translate<18.102547,0.000000,12.400975> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.102547,0.000000,13.629422>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.164022,0.000000,13.567947>}
box{<0,0,-0.076200><0.086939,0.035000,0.076200> rotate<0,44.997030,0> translate<18.102547,0.000000,13.629422> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.105484,0.000000,14.782800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.800712,0.000000,14.782800>}
box{<0,0,-0.076200><0.695228,0.035000,0.076200> rotate<0,0.000000,0> translate<18.105484,0.000000,14.782800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.125050,0.000000,9.156494>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.200347,0.000000,9.113022>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,29.997566,0> translate<18.125050,0.000000,9.156494> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.126288,0.000000,13.868400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.779909,0.000000,13.868400>}
box{<0,0,-0.076200><0.653622,0.035000,0.076200> rotate<0,0.000000,0> translate<18.126288,0.000000,13.868400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.128397,0.000000,13.870509>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.128397,0.000000,14.759888>}
box{<0,0,-0.076200><0.889378,0.035000,0.076200> rotate<0,90.000000,0> translate<18.128397,0.000000,14.759888> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.128397,0.000000,14.020800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.777800,0.000000,14.020800>}
box{<0,0,-0.076200><0.649403,0.035000,0.076200> rotate<0,0.000000,0> translate<18.128397,0.000000,14.020800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.128397,0.000000,14.173200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.777800,0.000000,14.173200>}
box{<0,0,-0.076200><0.649403,0.035000,0.076200> rotate<0,0.000000,0> translate<18.128397,0.000000,14.173200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.128397,0.000000,14.325600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.777800,0.000000,14.325600>}
box{<0,0,-0.076200><0.649403,0.035000,0.076200> rotate<0,0.000000,0> translate<18.128397,0.000000,14.325600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.128397,0.000000,14.478000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.777800,0.000000,14.478000>}
box{<0,0,-0.076200><0.649403,0.035000,0.076200> rotate<0,0.000000,0> translate<18.128397,0.000000,14.478000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.128397,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.777800,0.000000,14.630400>}
box{<0,0,-0.076200><0.649403,0.035000,0.076200> rotate<0,0.000000,0> translate<18.128397,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.137272,0.000000,16.081800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.203797,0.000000,16.099628>}
box{<0,0,-0.076200><0.068872,0.035000,0.076200> rotate<0,-15.001264,0> translate<18.137272,0.000000,16.081800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.137272,0.000000,23.542197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.203800,0.000000,23.524369>}
box{<0,0,-0.076200><0.068875,0.035000,0.076200> rotate<0,15.000591,0> translate<18.137272,0.000000,23.542197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.146691,0.000000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,9.144000>}
box{<0,0,-0.076200><8.828109,0.035000,0.076200> rotate<0,0.000000,0> translate<18.146691,0.000000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.164022,0.000000,12.462450>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.207494,0.000000,12.537747>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-59.996495,0> translate<18.164022,0.000000,12.462450> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.164022,0.000000,13.567947>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.207494,0.000000,13.492650>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,59.996495,0> translate<18.164022,0.000000,13.567947> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.166534,0.000000,13.563600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.739666,0.000000,13.563600>}
box{<0,0,-0.076200><0.573131,0.035000,0.076200> rotate<0,0.000000,0> translate<18.166534,0.000000,13.563600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.178088,0.000000,9.906000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.617109,0.000000,9.906000>}
box{<0,0,-0.076200><1.439022,0.035000,0.076200> rotate<0,0.000000,0> translate<18.178088,0.000000,9.906000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.183853,0.000000,12.496800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.722341,0.000000,12.496800>}
box{<0,0,-0.076200><0.538487,0.035000,0.076200> rotate<0,0.000000,0> translate<18.183853,0.000000,12.496800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.192084,0.000000,11.277600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.603113,0.000000,11.277600>}
box{<0,0,-0.076200><1.411028,0.035000,0.076200> rotate<0,0.000000,0> translate<18.192084,0.000000,11.277600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.200347,0.000000,9.113022>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.261822,0.000000,9.051547>}
box{<0,0,-0.076200><0.086939,0.035000,0.076200> rotate<0,44.997030,0> translate<18.200347,0.000000,9.113022> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.203797,0.000000,16.099628>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.270325,0.000000,16.081800>}
box{<0,0,-0.076200><0.068875,0.035000,0.076200> rotate<0,15.000591,0> translate<18.203797,0.000000,16.099628> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.203800,0.000000,23.524369>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.270325,0.000000,23.542197>}
box{<0,0,-0.076200><0.068872,0.035000,0.076200> rotate<0,-15.001264,0> translate<18.203800,0.000000,23.524369> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.207494,0.000000,12.537747>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.229997,0.000000,12.621725>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-74.994252,0> translate<18.207494,0.000000,12.537747> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.207494,0.000000,13.492650>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.229997,0.000000,13.408672>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,74.994252,0> translate<18.207494,0.000000,13.492650> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.226197,0.000000,9.954109>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.226197,0.000000,11.243488>}
box{<0,0,-0.076200><1.289378,0.035000,0.076200> rotate<0,90.000000,0> translate<18.226197,0.000000,11.243488> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.226197,0.000000,10.058400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.569000,0.000000,10.058400>}
box{<0,0,-0.076200><1.342803,0.035000,0.076200> rotate<0,0.000000,0> translate<18.226197,0.000000,10.058400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.226197,0.000000,10.210800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.569000,0.000000,10.210800>}
box{<0,0,-0.076200><1.342803,0.035000,0.076200> rotate<0,0.000000,0> translate<18.226197,0.000000,10.210800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.226197,0.000000,10.363200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.569000,0.000000,10.363200>}
box{<0,0,-0.076200><1.342803,0.035000,0.076200> rotate<0,0.000000,0> translate<18.226197,0.000000,10.363200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.226197,0.000000,10.515600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.569000,0.000000,10.515600>}
box{<0,0,-0.076200><1.342803,0.035000,0.076200> rotate<0,0.000000,0> translate<18.226197,0.000000,10.515600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.226197,0.000000,10.668000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.569000,0.000000,10.668000>}
box{<0,0,-0.076200><1.342803,0.035000,0.076200> rotate<0,0.000000,0> translate<18.226197,0.000000,10.668000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.226197,0.000000,10.820400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.569000,0.000000,10.820400>}
box{<0,0,-0.076200><1.342803,0.035000,0.076200> rotate<0,0.000000,0> translate<18.226197,0.000000,10.820400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.226197,0.000000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.569000,0.000000,10.972800>}
box{<0,0,-0.076200><1.342803,0.035000,0.076200> rotate<0,0.000000,0> translate<18.226197,0.000000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.226197,0.000000,11.125200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.569000,0.000000,11.125200>}
box{<0,0,-0.076200><1.342803,0.035000,0.076200> rotate<0,0.000000,0> translate<18.226197,0.000000,11.125200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.229322,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.676878,0.000000,13.411200>}
box{<0,0,-0.076200><0.447556,0.035000,0.076200> rotate<0,0.000000,0> translate<18.229322,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.229994,0.000000,12.939003>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.229997,0.000000,12.621725>}
box{<0,0,-0.076200><0.317278,0.035000,0.076200> rotate<0,89.993496,0> translate<18.229994,0.000000,12.939003> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.229997,0.000000,12.649200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.676200,0.000000,12.649200>}
box{<0,0,-0.076200><0.446203,0.035000,0.076200> rotate<0,0.000000,0> translate<18.229997,0.000000,12.649200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.229997,0.000000,12.801600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.676200,0.000000,12.801600>}
box{<0,0,-0.076200><0.446203,0.035000,0.076200> rotate<0,0.000000,0> translate<18.229997,0.000000,12.801600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.229997,0.000000,13.091391>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.229997,0.000000,13.408672>}
box{<0,0,-0.076200><0.317281,0.035000,0.076200> rotate<0,90.000000,0> translate<18.229997,0.000000,13.408672> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.229997,0.000000,13.106400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.676200,0.000000,13.106400>}
box{<0,0,-0.076200><0.446203,0.035000,0.076200> rotate<0,0.000000,0> translate<18.229997,0.000000,13.106400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.229997,0.000000,13.258800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.676200,0.000000,13.258800>}
box{<0,0,-0.076200><0.446203,0.035000,0.076200> rotate<0,0.000000,0> translate<18.229997,0.000000,13.258800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.261822,0.000000,9.051547>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.305294,0.000000,8.976250>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,59.996495,0> translate<18.261822,0.000000,9.051547> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.270325,0.000000,16.081800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.453781,0.000000,16.081800>}
box{<0,0,-0.076200><0.183456,0.035000,0.076200> rotate<0,0.000000,0> translate<18.270325,0.000000,16.081800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.270325,0.000000,23.542197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.453781,0.000000,23.542197>}
box{<0,0,-0.076200><0.183456,0.035000,0.076200> rotate<0,0.000000,0> translate<18.270325,0.000000,23.542197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.296434,0.000000,8.991600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.617113,0.000000,8.991600>}
box{<0,0,-0.076200><1.320678,0.035000,0.076200> rotate<0,0.000000,0> translate<18.296434,0.000000,8.991600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.305294,0.000000,8.976250>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.327797,0.000000,8.892272>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,74.994252,0> translate<18.305294,0.000000,8.976250> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.325350,0.000000,7.696197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.327797,0.000000,7.705325>}
box{<0,0,-0.076200><0.009450,0.035000,0.076200> rotate<0,-74.989187,0> translate<18.325350,0.000000,7.696197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.325350,0.000000,7.696197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.569000,0.000000,7.696197>}
box{<0,0,-0.076200><1.243650,0.035000,0.076200> rotate<0,0.000000,0> translate<18.325350,0.000000,7.696197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.327797,0.000000,7.705325>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.327797,0.000000,8.222603>}
box{<0,0,-0.076200><0.517278,0.035000,0.076200> rotate<0,90.000000,0> translate<18.327797,0.000000,8.222603> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.327797,0.000000,7.772400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.569000,0.000000,7.772400>}
box{<0,0,-0.076200><1.241203,0.035000,0.076200> rotate<0,0.000000,0> translate<18.327797,0.000000,7.772400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.327797,0.000000,7.924800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.569000,0.000000,7.924800>}
box{<0,0,-0.076200><1.241203,0.035000,0.076200> rotate<0,0.000000,0> translate<18.327797,0.000000,7.924800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.327797,0.000000,8.077200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.569000,0.000000,8.077200>}
box{<0,0,-0.076200><1.241203,0.035000,0.076200> rotate<0,0.000000,0> translate<18.327797,0.000000,8.077200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.327797,0.000000,8.374991>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.327797,0.000000,8.892272>}
box{<0,0,-0.076200><0.517281,0.035000,0.076200> rotate<0,90.000000,0> translate<18.327797,0.000000,8.892272> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.327797,0.000000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.569000,0.000000,8.382000>}
box{<0,0,-0.076200><1.241203,0.035000,0.076200> rotate<0,0.000000,0> translate<18.327797,0.000000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.327797,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.569000,0.000000,8.534400>}
box{<0,0,-0.076200><1.241203,0.035000,0.076200> rotate<0,0.000000,0> translate<18.327797,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.327797,0.000000,8.686800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.569000,0.000000,8.686800>}
box{<0,0,-0.076200><1.241203,0.035000,0.076200> rotate<0,0.000000,0> translate<18.327797,0.000000,8.686800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.327797,0.000000,8.839200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.569000,0.000000,8.839200>}
box{<0,0,-0.076200><1.241203,0.035000,0.076200> rotate<0,0.000000,0> translate<18.327797,0.000000,8.839200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.423997,0.000000,22.787012>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.453766,0.000000,22.787012>}
box{<0,0,-0.076200><0.029769,0.035000,0.076200> rotate<0,0.000000,0> translate<18.423997,0.000000,22.787012> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.453766,0.000000,16.837013>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.453766,0.000000,16.836981>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,-90.000000,0> translate<18.453766,0.000000,16.836981> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.453766,0.000000,22.787012>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.453766,0.000000,22.786981>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,-90.000000,0> translate<18.453766,0.000000,22.786981> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.453781,0.000000,16.081800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.453781,0.000000,16.836966>}
box{<0,0,-0.076200><0.755166,0.035000,0.076200> rotate<0,90.000000,0> translate<18.453781,0.000000,16.836966> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.453781,0.000000,16.154400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.453813,0.000000,16.154400>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<18.453781,0.000000,16.154400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.453781,0.000000,16.306800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.453813,0.000000,16.306800>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<18.453781,0.000000,16.306800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.453781,0.000000,16.459200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.453813,0.000000,16.459200>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<18.453781,0.000000,16.459200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.453781,0.000000,16.611600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.453813,0.000000,16.611600>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<18.453781,0.000000,16.611600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.453781,0.000000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.453813,0.000000,16.764000>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<18.453781,0.000000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.453781,0.000000,16.836966>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.453813,0.000000,16.836966>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<18.453781,0.000000,16.836966> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.453781,0.000000,22.787031>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.453781,0.000000,23.542197>}
box{<0,0,-0.076200><0.755166,0.035000,0.076200> rotate<0,90.000000,0> translate<18.453781,0.000000,23.542197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.453781,0.000000,22.787031>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.453813,0.000000,22.787031>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<18.453781,0.000000,22.787031> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.453781,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.453813,0.000000,22.860000>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<18.453781,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.453781,0.000000,23.012400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.453813,0.000000,23.012400>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<18.453781,0.000000,23.012400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.453781,0.000000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.453813,0.000000,23.164800>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<18.453781,0.000000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.453781,0.000000,23.317200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.453813,0.000000,23.317200>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<18.453781,0.000000,23.317200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.453781,0.000000,23.469600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.453813,0.000000,23.469600>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<18.453781,0.000000,23.469600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.453813,0.000000,16.081800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.572800,0.000000,16.081800>}
box{<0,0,-0.076200><0.118987,0.035000,0.076200> rotate<0,0.000000,0> translate<18.453813,0.000000,16.081800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.453813,0.000000,16.836966>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.453813,0.000000,16.081800>}
box{<0,0,-0.076200><0.755166,0.035000,0.076200> rotate<0,-90.000000,0> translate<18.453813,0.000000,16.081800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.453813,0.000000,23.542197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.453813,0.000000,22.787031>}
box{<0,0,-0.076200><0.755166,0.035000,0.076200> rotate<0,-90.000000,0> translate<18.453813,0.000000,22.787031> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.453813,0.000000,23.542197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.572800,0.000000,23.542197>}
box{<0,0,-0.076200><0.118987,0.035000,0.076200> rotate<0,0.000000,0> translate<18.453813,0.000000,23.542197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.572800,0.000000,15.610181>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.923000,0.000000,15.259984>}
box{<0,0,-0.076200><0.495255,0.035000,0.076200> rotate<0,44.996775,0> translate<18.572800,0.000000,15.610181> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.572800,0.000000,16.081800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.572800,0.000000,15.610181>}
box{<0,0,-0.076200><0.471619,0.035000,0.076200> rotate<0,-90.000000,0> translate<18.572800,0.000000,15.610181> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.572800,0.000000,24.003000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.572800,0.000000,23.542197>}
box{<0,0,-0.076200><0.460803,0.035000,0.076200> rotate<0,-90.000000,0> translate<18.572800,0.000000,23.542197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.676200,0.000000,12.621725>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.698703,0.000000,12.537747>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,74.994252,0> translate<18.676200,0.000000,12.621725> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.676200,0.000000,12.939003>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.676200,0.000000,12.621725>}
box{<0,0,-0.076200><0.317278,0.035000,0.076200> rotate<0,-90.000000,0> translate<18.676200,0.000000,12.621725> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.676200,0.000000,12.939003>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.380188,0.000000,12.939003>}
box{<0,0,-0.076200><0.703988,0.035000,0.076200> rotate<0,0.000000,0> translate<18.676200,0.000000,12.939003> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.676200,0.000000,13.091391>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.380188,0.000000,13.091391>}
box{<0,0,-0.076200><0.703988,0.035000,0.076200> rotate<0,0.000000,0> translate<18.676200,0.000000,13.091391> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.676200,0.000000,13.408672>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.676200,0.000000,13.091391>}
box{<0,0,-0.076200><0.317281,0.035000,0.076200> rotate<0,-90.000000,0> translate<18.676200,0.000000,13.091391> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.676200,0.000000,13.408672>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.698703,0.000000,13.492650>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-74.994252,0> translate<18.676200,0.000000,13.408672> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.698703,0.000000,12.537747>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.742175,0.000000,12.462450>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,59.996495,0> translate<18.698703,0.000000,12.537747> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.698703,0.000000,13.492650>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.742175,0.000000,13.567947>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-59.996495,0> translate<18.698703,0.000000,13.492650> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.742175,0.000000,12.462450>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.803650,0.000000,12.400975>}
box{<0,0,-0.076200><0.086939,0.035000,0.076200> rotate<0,44.997030,0> translate<18.742175,0.000000,12.462450> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.742175,0.000000,13.567947>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.803650,0.000000,13.629422>}
box{<0,0,-0.076200><0.086939,0.035000,0.076200> rotate<0,-44.997030,0> translate<18.742175,0.000000,13.567947> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.777800,0.000000,13.870509>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.911709,0.000000,13.736600>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<18.777800,0.000000,13.870509> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.777800,0.000000,14.759888>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.777800,0.000000,13.870509>}
box{<0,0,-0.076200><0.889378,0.035000,0.076200> rotate<0,-90.000000,0> translate<18.777800,0.000000,13.870509> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.777800,0.000000,14.759888>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.911709,0.000000,14.893797>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<18.777800,0.000000,14.759888> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.803650,0.000000,12.400975>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.878947,0.000000,12.357503>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,29.997566,0> translate<18.803650,0.000000,12.400975> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.803650,0.000000,13.629422>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.878947,0.000000,13.672894>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-29.997566,0> translate<18.803650,0.000000,13.629422> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.878947,0.000000,12.357503>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.962925,0.000000,12.335000>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,14.999808,0> translate<18.878947,0.000000,12.357503> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.878947,0.000000,13.672894>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.962925,0.000000,13.695397>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-14.999808,0> translate<18.878947,0.000000,13.672894> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.911709,0.000000,13.736600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.001088,0.000000,13.736600>}
box{<0,0,-0.076200><1.089378,0.035000,0.076200> rotate<0,0.000000,0> translate<18.911709,0.000000,13.736600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.911709,0.000000,14.893797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.073663,0.000000,14.893797>}
box{<0,0,-0.076200><0.161953,0.035000,0.076200> rotate<0,0.000000,0> translate<18.911709,0.000000,14.893797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.923000,0.000000,15.044456>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.073663,0.000000,14.893797>}
box{<0,0,-0.076200><0.213067,0.035000,0.076200> rotate<0,44.996436,0> translate<18.923000,0.000000,15.044456> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.923000,0.000000,15.259984>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.923000,0.000000,15.044456>}
box{<0,0,-0.076200><0.215528,0.035000,0.076200> rotate<0,-90.000000,0> translate<18.923000,0.000000,15.044456> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.962925,0.000000,12.335000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.380203,0.000000,12.334997>}
box{<0,0,-0.076200><0.417278,0.035000,0.076200> rotate<0,0.000429,0> translate<18.962925,0.000000,12.335000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.962925,0.000000,13.695397>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.380203,0.000000,13.695397>}
box{<0,0,-0.076200><0.417278,0.035000,0.076200> rotate<0,0.000000,0> translate<18.962925,0.000000,13.695397> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.133856,-1.535000,14.833600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.235456,-1.535000,14.732000>}
box{<0,0,-0.076200><0.143684,0.035000,0.076200> rotate<0,44.997030,0> translate<19.133856,-1.535000,14.833600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.133856,-1.535000,15.697197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.235456,-1.535000,15.798797>}
box{<0,0,-0.076200><0.143684,0.035000,0.076200> rotate<0,-44.997030,0> translate<19.133856,-1.535000,15.697197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.235456,-1.535000,14.732000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.677341,-1.535000,14.732000>}
box{<0,0,-0.076200><0.441884,0.035000,0.076200> rotate<0,0.000000,0> translate<19.235456,-1.535000,14.732000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.235456,-1.535000,15.798797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.677341,-1.535000,15.798797>}
box{<0,0,-0.076200><0.441884,0.035000,0.076200> rotate<0,0.000000,0> translate<19.235456,-1.535000,15.798797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.334797,0.000000,15.925816>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.334797,0.000000,16.081800>}
box{<0,0,-0.076200><0.155984,0.035000,0.076200> rotate<0,90.000000,0> translate<19.334797,0.000000,16.081800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.334797,0.000000,15.925816>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.456400,0.000000,15.804213>}
box{<0,0,-0.076200><0.171973,0.035000,0.076200> rotate<0,44.997030,0> translate<19.334797,0.000000,15.925816> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.334797,0.000000,16.002000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.572800,0.000000,16.002000>}
box{<0,0,-0.076200><0.238003,0.035000,0.076200> rotate<0,0.000000,0> translate<19.334797,0.000000,16.002000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.334797,0.000000,16.081800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.453781,0.000000,16.081800>}
box{<0,0,-0.076200><0.118984,0.035000,0.076200> rotate<0,0.000000,0> translate<19.334797,0.000000,16.081800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.334797,0.000000,23.542197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.334797,0.000000,24.003000>}
box{<0,0,-0.076200><0.460803,0.035000,0.076200> rotate<0,90.000000,0> translate<19.334797,0.000000,24.003000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.334797,0.000000,23.542197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.453781,0.000000,23.542197>}
box{<0,0,-0.076200><0.118984,0.035000,0.076200> rotate<0,0.000000,0> translate<19.334797,0.000000,23.542197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.334797,0.000000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.572800,0.000000,23.622000>}
box{<0,0,-0.076200><0.238003,0.035000,0.076200> rotate<0,0.000000,0> translate<19.334797,0.000000,23.622000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.334797,0.000000,23.774400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.572800,0.000000,23.774400>}
box{<0,0,-0.076200><0.238003,0.035000,0.076200> rotate<0,0.000000,0> translate<19.334797,0.000000,23.774400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.334797,0.000000,23.926800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.572800,0.000000,23.926800>}
box{<0,0,-0.076200><0.238003,0.035000,0.076200> rotate<0,0.000000,0> translate<19.334797,0.000000,23.926800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.334797,0.000000,24.003000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.572800,0.000000,24.003000>}
box{<0,0,-0.076200><0.238003,0.035000,0.076200> rotate<0,0.000000,0> translate<19.334797,0.000000,24.003000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.380188,0.000000,13.091391>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.380188,0.000000,12.939003>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,-90.000000,0> translate<19.380188,0.000000,12.939003> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.380203,0.000000,12.334997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.380203,0.000000,12.938988>}
box{<0,0,-0.076200><0.603991,0.035000,0.076200> rotate<0,90.000000,0> translate<19.380203,0.000000,12.938988> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.380203,0.000000,12.344400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.532591,0.000000,12.344400>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<19.380203,0.000000,12.344400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.380203,0.000000,12.496800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.532591,0.000000,12.496800>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<19.380203,0.000000,12.496800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.380203,0.000000,12.649200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.532591,0.000000,12.649200>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<19.380203,0.000000,12.649200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.380203,0.000000,12.801600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.532591,0.000000,12.801600>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<19.380203,0.000000,12.801600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.380203,0.000000,12.938988>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.532591,0.000000,12.938988>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<19.380203,0.000000,12.938988> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.380203,0.000000,13.091409>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.380203,0.000000,13.695397>}
box{<0,0,-0.076200><0.603987,0.035000,0.076200> rotate<0,90.000000,0> translate<19.380203,0.000000,13.695397> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.380203,0.000000,13.091409>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.532591,0.000000,13.091409>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<19.380203,0.000000,13.091409> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.380203,0.000000,13.106400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.532591,0.000000,13.106400>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<19.380203,0.000000,13.106400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.380203,0.000000,13.258800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.532591,0.000000,13.258800>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<19.380203,0.000000,13.258800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.380203,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.532591,0.000000,13.411200>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<19.380203,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.380203,0.000000,13.563600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.532591,0.000000,13.563600>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<19.380203,0.000000,13.563600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.411013,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.501788,0.000000,15.849600>}
box{<0,0,-0.076200><0.090775,0.035000,0.076200> rotate<0,0.000000,0> translate<19.411013,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.453781,0.000000,16.081800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.453781,0.000000,16.836966>}
box{<0,0,-0.076200><0.755166,0.035000,0.076200> rotate<0,90.000000,0> translate<19.453781,0.000000,16.836966> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.453781,0.000000,16.154400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.453813,0.000000,16.154400>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<19.453781,0.000000,16.154400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.453781,0.000000,16.306800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.453813,0.000000,16.306800>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<19.453781,0.000000,16.306800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.453781,0.000000,16.459200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.453813,0.000000,16.459200>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<19.453781,0.000000,16.459200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.453781,0.000000,16.611600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.453813,0.000000,16.611600>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<19.453781,0.000000,16.611600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.453781,0.000000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.453813,0.000000,16.764000>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<19.453781,0.000000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.453781,0.000000,16.836966>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.453813,0.000000,16.836966>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<19.453781,0.000000,16.836966> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.453781,0.000000,22.787031>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.453781,0.000000,23.542197>}
box{<0,0,-0.076200><0.755166,0.035000,0.076200> rotate<0,90.000000,0> translate<19.453781,0.000000,23.542197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.453781,0.000000,22.787031>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.453813,0.000000,22.787031>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<19.453781,0.000000,22.787031> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.453781,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.453813,0.000000,22.860000>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<19.453781,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.453781,0.000000,23.012400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.453813,0.000000,23.012400>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<19.453781,0.000000,23.012400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.453781,0.000000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.453813,0.000000,23.164800>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<19.453781,0.000000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.453781,0.000000,23.317200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.453813,0.000000,23.317200>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<19.453781,0.000000,23.317200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.453781,0.000000,23.469600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.453813,0.000000,23.469600>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<19.453781,0.000000,23.469600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.453813,0.000000,16.081800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.572800,0.000000,16.081800>}
box{<0,0,-0.076200><0.118987,0.035000,0.076200> rotate<0,0.000000,0> translate<19.453813,0.000000,16.081800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.453813,0.000000,16.836966>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.453813,0.000000,16.081800>}
box{<0,0,-0.076200><0.755166,0.035000,0.076200> rotate<0,-90.000000,0> translate<19.453813,0.000000,16.081800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.453813,0.000000,23.542197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.453813,0.000000,22.787031>}
box{<0,0,-0.076200><0.755166,0.035000,0.076200> rotate<0,-90.000000,0> translate<19.453813,0.000000,22.787031> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.453813,0.000000,23.542197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.572800,0.000000,23.542197>}
box{<0,0,-0.076200><0.118987,0.035000,0.076200> rotate<0,0.000000,0> translate<19.453813,0.000000,23.542197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.453831,0.000000,16.836981>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.453831,0.000000,16.837013>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,90.000000,0> translate<19.453831,0.000000,16.837013> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.453831,0.000000,16.836981>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.572800,0.000000,16.836981>}
box{<0,0,-0.076200><0.118969,0.035000,0.076200> rotate<0,0.000000,0> translate<19.453831,0.000000,16.836981> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.453831,0.000000,16.837013>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.572800,0.000000,16.837013>}
box{<0,0,-0.076200><0.118969,0.035000,0.076200> rotate<0,0.000000,0> translate<19.453831,0.000000,16.837013> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.456400,0.000000,15.804213>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.572800,0.000000,15.920613>}
box{<0,0,-0.076200><0.164614,0.035000,0.076200> rotate<0,-44.997030,0> translate<19.456400,0.000000,15.804213> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.532591,0.000000,12.334997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.949872,0.000000,12.335000>}
box{<0,0,-0.076200><0.417281,0.035000,0.076200> rotate<0,-0.000429,0> translate<19.532591,0.000000,12.334997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.532591,0.000000,12.938988>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.532591,0.000000,12.334997>}
box{<0,0,-0.076200><0.603991,0.035000,0.076200> rotate<0,-90.000000,0> translate<19.532591,0.000000,12.334997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.532591,0.000000,13.695397>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.532591,0.000000,13.091409>}
box{<0,0,-0.076200><0.603987,0.035000,0.076200> rotate<0,-90.000000,0> translate<19.532591,0.000000,13.091409> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.532591,0.000000,13.695397>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.949872,0.000000,13.695397>}
box{<0,0,-0.076200><0.417281,0.035000,0.076200> rotate<0,0.000000,0> translate<19.532591,0.000000,13.695397> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.532609,0.000000,12.939003>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.532609,0.000000,13.091391>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,90.000000,0> translate<19.532609,0.000000,13.091391> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.532609,0.000000,12.939003>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.236594,0.000000,12.939003>}
box{<0,0,-0.076200><0.703984,0.035000,0.076200> rotate<0,0.000000,0> translate<19.532609,0.000000,12.939003> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.532609,0.000000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.513800,0.000000,12.954000>}
box{<0,0,-0.076200><1.981191,0.035000,0.076200> rotate<0,0.000000,0> translate<19.532609,0.000000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.532609,0.000000,13.091391>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.236597,0.000000,13.091391>}
box{<0,0,-0.076200><0.703988,0.035000,0.076200> rotate<0,0.000000,0> translate<19.532609,0.000000,13.091391> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.569000,0.000000,8.943487>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.569000,0.000000,7.696197>}
box{<0,0,-0.076200><1.247291,0.035000,0.076200> rotate<0,-90.000000,0> translate<19.569000,0.000000,7.696197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.569000,0.000000,8.943487>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.702909,0.000000,9.077397>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<19.569000,0.000000,8.943487> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.569000,0.000000,9.954109>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.702909,0.000000,9.820200>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<19.569000,0.000000,9.954109> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.569000,0.000000,11.243488>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.569000,0.000000,9.954109>}
box{<0,0,-0.076200><1.289378,0.035000,0.076200> rotate<0,-90.000000,0> translate<19.569000,0.000000,9.954109> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.569000,0.000000,11.243488>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.702909,0.000000,11.377397>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<19.569000,0.000000,11.243488> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.572800,0.000000,16.081800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.572800,0.000000,15.920613>}
box{<0,0,-0.076200><0.161188,0.035000,0.076200> rotate<0,-90.000000,0> translate<19.572800,0.000000,15.920613> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.572800,0.000000,16.837013>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.572800,0.000000,16.836981>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,-90.000000,0> translate<19.572800,0.000000,16.836981> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.572800,0.000000,24.003000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.572800,0.000000,23.542197>}
box{<0,0,-0.076200><0.460803,0.035000,0.076200> rotate<0,-90.000000,0> translate<19.572800,0.000000,23.542197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.677341,-1.535000,14.732000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.778941,-1.535000,14.833600>}
box{<0,0,-0.076200><0.143684,0.035000,0.076200> rotate<0,-44.997030,0> translate<19.677341,-1.535000,14.732000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.677341,-1.535000,15.798797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.778941,-1.535000,15.697197>}
box{<0,0,-0.076200><0.143684,0.035000,0.076200> rotate<0,44.997030,0> translate<19.677341,-1.535000,15.798797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.702909,0.000000,9.077397>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.792288,0.000000,9.077397>}
box{<0,0,-0.076200><2.089378,0.035000,0.076200> rotate<0,0.000000,0> translate<19.702909,0.000000,9.077397> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.702909,0.000000,9.820200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.792288,0.000000,9.820200>}
box{<0,0,-0.076200><2.089378,0.035000,0.076200> rotate<0,0.000000,0> translate<19.702909,0.000000,9.820200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.702909,0.000000,11.377397>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.987384,0.000000,11.377397>}
box{<0,0,-0.076200><1.284475,0.035000,0.076200> rotate<0,0.000000,0> translate<19.702909,0.000000,11.377397> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.728141,-1.535000,14.782800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,14.782800>}
box{<0,0,-0.076200><7.246659,0.035000,0.076200> rotate<0,0.000000,0> translate<19.728141,-1.535000,14.782800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.778938,-1.535000,15.697200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.055544,-1.535000,15.697200>}
box{<0,0,-0.076200><1.276606,0.035000,0.076200> rotate<0,0.000000,0> translate<19.778938,-1.535000,15.697200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.778941,-1.535000,14.833600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.413256,-1.535000,14.833600>}
box{<0,0,-0.076200><1.634316,0.035000,0.076200> rotate<0,0.000000,0> translate<19.778941,-1.535000,14.833600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.778941,-1.535000,15.697197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.055541,-1.535000,15.697197>}
box{<0,0,-0.076200><1.276600,0.035000,0.076200> rotate<0,0.000000,0> translate<19.778941,-1.535000,15.697197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.839134,0.000000,14.893797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.989797,0.000000,15.044456>}
box{<0,0,-0.076200><0.213067,0.035000,0.076200> rotate<0,-44.996436,0> translate<19.839134,0.000000,14.893797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.839134,0.000000,14.893797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.001088,0.000000,14.893797>}
box{<0,0,-0.076200><0.161953,0.035000,0.076200> rotate<0,0.000000,0> translate<19.839134,0.000000,14.893797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.880538,0.000000,14.935200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.513800,0.000000,14.935200>}
box{<0,0,-0.076200><1.633262,0.035000,0.076200> rotate<0,0.000000,0> translate<19.880538,0.000000,14.935200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.923600,0.000000,19.745472>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.923600,0.000000,19.735803>}
box{<0,0,-0.076200><0.009669,0.035000,0.076200> rotate<0,-90.000000,0> translate<19.923600,0.000000,19.735803> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.923600,0.000000,19.745472>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.946103,0.000000,19.829450>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-74.994252,0> translate<19.923600,0.000000,19.745472> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.929597,0.000000,28.041603>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.929600,0.000000,27.624325>}
box{<0,0,-0.076200><0.417278,0.035000,0.076200> rotate<0,89.993631,0> translate<19.929597,0.000000,28.041603> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.929597,0.000000,28.041603>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.533587,0.000000,28.041603>}
box{<0,0,-0.076200><0.603991,0.035000,0.076200> rotate<0,0.000000,0> translate<19.929597,0.000000,28.041603> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.929597,0.000000,28.193991>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.929600,0.000000,28.611272>}
box{<0,0,-0.076200><0.417281,0.035000,0.076200> rotate<0,-89.993631,0> translate<19.929597,0.000000,28.193991> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.929597,0.000000,28.193991>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.533587,0.000000,28.193991>}
box{<0,0,-0.076200><0.603991,0.035000,0.076200> rotate<0,0.000000,0> translate<19.929597,0.000000,28.193991> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.929600,0.000000,27.624325>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.947106,0.000000,27.558997>}
box{<0,0,-0.076200><0.067633,0.035000,0.076200> rotate<0,74.993715,0> translate<19.929600,0.000000,27.624325> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.929600,0.000000,28.611272>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.952103,0.000000,28.695250>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-74.994252,0> translate<19.929600,0.000000,28.611272> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.946103,0.000000,19.829450>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.980019,0.000000,19.888191>}
box{<0,0,-0.076200><0.067829,0.035000,0.076200> rotate<0,-59.994790,0> translate<19.946103,0.000000,19.829450> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.949872,0.000000,12.335000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.033850,0.000000,12.357503>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-14.999808,0> translate<19.949872,0.000000,12.335000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.949872,0.000000,13.695397>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.033850,0.000000,13.672894>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,14.999808,0> translate<19.949872,0.000000,13.695397> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.952103,0.000000,28.695250>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.995575,0.000000,28.770547>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-59.996495,0> translate<19.952103,0.000000,28.695250> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.984950,0.000000,12.344400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.513800,0.000000,12.344400>}
box{<0,0,-0.076200><1.528850,0.035000,0.076200> rotate<0,0.000000,0> translate<19.984950,0.000000,12.344400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.989797,0.000000,15.044456>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.989797,0.000000,15.259984>}
box{<0,0,-0.076200><0.215528,0.035000,0.076200> rotate<0,90.000000,0> translate<19.989797,0.000000,15.259984> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.989797,0.000000,15.087600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.513800,0.000000,15.087600>}
box{<0,0,-0.076200><1.524003,0.035000,0.076200> rotate<0,0.000000,0> translate<19.989797,0.000000,15.087600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.989797,0.000000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.513800,0.000000,15.240000>}
box{<0,0,-0.076200><1.524003,0.035000,0.076200> rotate<0,0.000000,0> translate<19.989797,0.000000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.989797,0.000000,15.259984>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.111612,0.000000,15.381800>}
box{<0,0,-0.076200><0.172273,0.035000,0.076200> rotate<0,-44.997030,0> translate<19.989797,0.000000,15.259984> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.995575,0.000000,28.770547>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.057050,0.000000,28.832022>}
box{<0,0,-0.076200><0.086939,0.035000,0.076200> rotate<0,-44.997030,0> translate<19.995575,0.000000,28.770547> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.001088,0.000000,13.736600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.134997,0.000000,13.870509>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<20.001088,0.000000,13.736600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.001088,0.000000,14.893797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.134997,0.000000,14.759888>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<20.001088,0.000000,14.893797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.033850,0.000000,12.357503>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.109147,0.000000,12.400975>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-29.997566,0> translate<20.033850,0.000000,12.357503> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.033850,0.000000,13.672894>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.109147,0.000000,13.629422>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,29.997566,0> translate<20.033850,0.000000,13.672894> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.057050,0.000000,28.832022>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.132347,0.000000,28.875494>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-29.997566,0> translate<20.057050,0.000000,28.832022> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.109147,0.000000,12.400975>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.170622,0.000000,12.462450>}
box{<0,0,-0.076200><0.086939,0.035000,0.076200> rotate<0,-44.997030,0> translate<20.109147,0.000000,12.400975> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.109147,0.000000,13.629422>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.170622,0.000000,13.567947>}
box{<0,0,-0.076200><0.086939,0.035000,0.076200> rotate<0,44.997030,0> translate<20.109147,0.000000,13.629422> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.111612,0.000000,15.381800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.111616,0.000000,15.381800>}
box{<0,0,-0.076200><0.000003,0.035000,0.076200> rotate<0,0.000000,0> translate<20.111612,0.000000,15.381800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.111616,0.000000,15.381800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.334797,0.000000,15.604981>}
box{<0,0,-0.076200><0.315626,0.035000,0.076200> rotate<0,-44.997030,0> translate<20.111616,0.000000,15.381800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.112084,0.000000,14.782800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.513800,0.000000,14.782800>}
box{<0,0,-0.076200><1.401716,0.035000,0.076200> rotate<0,0.000000,0> translate<20.112084,0.000000,14.782800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.122216,0.000000,15.392400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.406781,0.000000,15.392400>}
box{<0,0,-0.076200><1.284566,0.035000,0.076200> rotate<0,0.000000,0> translate<20.122216,0.000000,15.392400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.132347,0.000000,28.875494>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.216325,0.000000,28.897997>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-14.999808,0> translate<20.132347,0.000000,28.875494> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.132888,0.000000,13.868400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.513800,0.000000,13.868400>}
box{<0,0,-0.076200><1.380912,0.035000,0.076200> rotate<0,0.000000,0> translate<20.132888,0.000000,13.868400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.134997,0.000000,13.870509>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.134997,0.000000,14.759888>}
box{<0,0,-0.076200><0.889378,0.035000,0.076200> rotate<0,90.000000,0> translate<20.134997,0.000000,14.759888> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.134997,0.000000,14.020800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.513800,0.000000,14.020800>}
box{<0,0,-0.076200><1.378803,0.035000,0.076200> rotate<0,0.000000,0> translate<20.134997,0.000000,14.020800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.134997,0.000000,14.173200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.513800,0.000000,14.173200>}
box{<0,0,-0.076200><1.378803,0.035000,0.076200> rotate<0,0.000000,0> translate<20.134997,0.000000,14.173200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.134997,0.000000,14.325600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.513800,0.000000,14.325600>}
box{<0,0,-0.076200><1.378803,0.035000,0.076200> rotate<0,0.000000,0> translate<20.134997,0.000000,14.325600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.134997,0.000000,14.478000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.513800,0.000000,14.478000>}
box{<0,0,-0.076200><1.378803,0.035000,0.076200> rotate<0,0.000000,0> translate<20.134997,0.000000,14.478000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.134997,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.513800,0.000000,14.630400>}
box{<0,0,-0.076200><1.378803,0.035000,0.076200> rotate<0,0.000000,0> translate<20.134997,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.170622,0.000000,12.462450>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.214094,0.000000,12.537747>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-59.996495,0> translate<20.170622,0.000000,12.462450> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.170622,0.000000,13.567947>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.214094,0.000000,13.492650>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,59.996495,0> translate<20.170622,0.000000,13.567947> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.173134,0.000000,13.563600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.513800,0.000000,13.563600>}
box{<0,0,-0.076200><1.340666,0.035000,0.076200> rotate<0,0.000000,0> translate<20.173134,0.000000,13.563600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.190453,0.000000,12.496800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.513800,0.000000,12.496800>}
box{<0,0,-0.076200><1.323347,0.035000,0.076200> rotate<0,0.000000,0> translate<20.190453,0.000000,12.496800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.214094,0.000000,12.537747>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.236597,0.000000,12.621725>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-74.994252,0> translate<20.214094,0.000000,12.537747> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.214094,0.000000,13.492650>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.236597,0.000000,13.408672>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,74.994252,0> translate<20.214094,0.000000,13.492650> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.216325,0.000000,28.897997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.533603,0.000000,28.897997>}
box{<0,0,-0.076200><0.317278,0.035000,0.076200> rotate<0,0.000000,0> translate<20.216325,0.000000,28.897997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.235922,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.513800,0.000000,13.411200>}
box{<0,0,-0.076200><1.277878,0.035000,0.076200> rotate<0,0.000000,0> translate<20.235922,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.236594,0.000000,12.939003>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.236597,0.000000,12.621725>}
box{<0,0,-0.076200><0.317278,0.035000,0.076200> rotate<0,89.993496,0> translate<20.236594,0.000000,12.939003> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.236597,0.000000,12.649200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.513800,0.000000,12.649200>}
box{<0,0,-0.076200><1.277203,0.035000,0.076200> rotate<0,0.000000,0> translate<20.236597,0.000000,12.649200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.236597,0.000000,12.801600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.513800,0.000000,12.801600>}
box{<0,0,-0.076200><1.277203,0.035000,0.076200> rotate<0,0.000000,0> translate<20.236597,0.000000,12.801600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.236597,0.000000,13.091391>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.236597,0.000000,13.408672>}
box{<0,0,-0.076200><0.317281,0.035000,0.076200> rotate<0,90.000000,0> translate<20.236597,0.000000,13.408672> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.236597,0.000000,13.106400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.513800,0.000000,13.106400>}
box{<0,0,-0.076200><1.277203,0.035000,0.076200> rotate<0,0.000000,0> translate<20.236597,0.000000,13.106400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.236597,0.000000,13.258800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.513800,0.000000,13.258800>}
box{<0,0,-0.076200><1.277203,0.035000,0.076200> rotate<0,0.000000,0> translate<20.236597,0.000000,13.258800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.274616,0.000000,15.544800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.254381,0.000000,15.544800>}
box{<0,0,-0.076200><0.979766,0.035000,0.076200> rotate<0,0.000000,0> translate<20.274616,0.000000,15.544800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.334797,0.000000,15.604981>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.334797,0.000000,16.464388>}
box{<0,0,-0.076200><0.859406,0.035000,0.076200> rotate<0,90.000000,0> translate<20.334797,0.000000,16.464388> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.334797,0.000000,15.697200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.101981,0.000000,15.697200>}
box{<0,0,-0.076200><0.767184,0.035000,0.076200> rotate<0,0.000000,0> translate<20.334797,0.000000,15.697200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.334797,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.949581,0.000000,15.849600>}
box{<0,0,-0.076200><0.614784,0.035000,0.076200> rotate<0,0.000000,0> translate<20.334797,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.334797,0.000000,16.002000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.797181,0.000000,16.002000>}
box{<0,0,-0.076200><0.462384,0.035000,0.076200> rotate<0,0.000000,0> translate<20.334797,0.000000,16.002000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.334797,0.000000,16.154400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.644781,0.000000,16.154400>}
box{<0,0,-0.076200><0.309984,0.035000,0.076200> rotate<0,0.000000,0> translate<20.334797,0.000000,16.154400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.334797,0.000000,16.306800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.492381,0.000000,16.306800>}
box{<0,0,-0.076200><0.157584,0.035000,0.076200> rotate<0,0.000000,0> translate<20.334797,0.000000,16.306800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.334797,0.000000,16.459200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.339981,0.000000,16.459200>}
box{<0,0,-0.076200><0.005184,0.035000,0.076200> rotate<0,0.000000,0> translate<20.334797,0.000000,16.459200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.334797,0.000000,16.464388>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.513800,0.000000,15.285381>}
box{<0,0,-0.076200><1.667364,0.035000,0.076200> rotate<0,44.997106,0> translate<20.334797,0.000000,16.464388> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.533587,0.000000,28.193991>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.533587,0.000000,28.041603>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,-90.000000,0> translate<20.533587,0.000000,28.041603> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.533603,0.000000,28.194009>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.533603,0.000000,28.897997>}
box{<0,0,-0.076200><0.703988,0.035000,0.076200> rotate<0,90.000000,0> translate<20.533603,0.000000,28.897997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.533603,0.000000,28.194009>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.685991,0.000000,28.194009>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<20.533603,0.000000,28.194009> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.533603,0.000000,28.346400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.685991,0.000000,28.346400>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<20.533603,0.000000,28.346400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.533603,0.000000,28.498800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.685991,0.000000,28.498800>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<20.533603,0.000000,28.498800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.533603,0.000000,28.651200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.685991,0.000000,28.651200>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<20.533603,0.000000,28.651200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.533603,0.000000,28.803600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.685991,0.000000,28.803600>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<20.533603,0.000000,28.803600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.678781,0.000000,18.942997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.678781,0.000000,19.061966>}
box{<0,0,-0.076200><0.118969,0.035000,0.076200> rotate<0,90.000000,0> translate<20.678781,0.000000,19.061966> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.678781,0.000000,18.942997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.678812,0.000000,18.942997>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<20.678781,0.000000,18.942997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.678781,0.000000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.678812,0.000000,19.050000>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<20.678781,0.000000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.678781,0.000000,19.061966>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.678812,0.000000,19.061966>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<20.678781,0.000000,19.061966> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.678781,0.000000,19.062031>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.678781,0.000000,19.561966>}
box{<0,0,-0.076200><0.499934,0.035000,0.076200> rotate<0,90.000000,0> translate<20.678781,0.000000,19.561966> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.678781,0.000000,19.062031>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.678812,0.000000,19.062031>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<20.678781,0.000000,19.062031> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.678781,0.000000,19.202400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.678812,0.000000,19.202400>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<20.678781,0.000000,19.202400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.678781,0.000000,19.354800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.678812,0.000000,19.354800>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<20.678781,0.000000,19.354800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.678781,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.678812,0.000000,19.507200>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<20.678781,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.678781,0.000000,19.561966>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.678812,0.000000,19.561966>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<20.678781,0.000000,19.561966> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.678812,0.000000,19.061966>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.678812,0.000000,18.942997>}
box{<0,0,-0.076200><0.118969,0.035000,0.076200> rotate<0,-90.000000,0> translate<20.678812,0.000000,18.942997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.678812,0.000000,19.091797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.678812,0.000000,19.062031>}
box{<0,0,-0.076200><0.029766,0.035000,0.076200> rotate<0,-90.000000,0> translate<20.678812,0.000000,19.062031> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.678812,0.000000,19.561966>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.678812,0.000000,19.091797>}
box{<0,0,-0.076200><0.470169,0.035000,0.076200> rotate<0,-90.000000,0> translate<20.678812,0.000000,19.091797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.678831,0.000000,18.061981>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.678831,0.000000,18.062013>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,90.000000,0> translate<20.678831,0.000000,18.062013> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.678831,0.000000,18.061981>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.433997,0.000000,18.061981>}
box{<0,0,-0.076200><0.755166,0.035000,0.076200> rotate<0,0.000000,0> translate<20.678831,0.000000,18.061981> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.678831,0.000000,18.062013>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.433997,0.000000,18.062013>}
box{<0,0,-0.076200><0.755166,0.035000,0.076200> rotate<0,0.000000,0> translate<20.678831,0.000000,18.062013> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.678831,0.000000,19.061981>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.678831,0.000000,19.062013>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,90.000000,0> translate<20.678831,0.000000,19.062013> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.678831,0.000000,19.061981>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.433997,0.000000,19.061981>}
box{<0,0,-0.076200><0.755166,0.035000,0.076200> rotate<0,0.000000,0> translate<20.678831,0.000000,19.061981> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.678831,0.000000,19.062013>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.433997,0.000000,19.062013>}
box{<0,0,-0.076200><0.755166,0.035000,0.076200> rotate<0,0.000000,0> translate<20.678831,0.000000,19.062013> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.678831,0.000000,19.561981>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.678831,0.000000,19.562013>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,90.000000,0> translate<20.678831,0.000000,19.562013> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.678831,0.000000,19.561981>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.433997,0.000000,19.561981>}
box{<0,0,-0.076200><0.755166,0.035000,0.076200> rotate<0,0.000000,0> translate<20.678831,0.000000,19.561981> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.678831,0.000000,19.562013>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.433997,0.000000,19.562013>}
box{<0,0,-0.076200><0.755166,0.035000,0.076200> rotate<0,0.000000,0> translate<20.678831,0.000000,19.562013> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.678831,0.000000,21.561981>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.678831,0.000000,21.562013>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,90.000000,0> translate<20.678831,0.000000,21.562013> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.678831,0.000000,21.561981>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.433997,0.000000,21.561981>}
box{<0,0,-0.076200><0.755166,0.035000,0.076200> rotate<0,0.000000,0> translate<20.678831,0.000000,21.561981> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.678831,0.000000,21.562013>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.433997,0.000000,21.562013>}
box{<0,0,-0.076200><0.755166,0.035000,0.076200> rotate<0,0.000000,0> translate<20.678831,0.000000,21.562013> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.685991,0.000000,28.897994>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.685991,0.000000,28.194009>}
box{<0,0,-0.076200><0.703984,0.035000,0.076200> rotate<0,-90.000000,0> translate<20.685991,0.000000,28.194009> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.685991,0.000000,28.897994>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.003272,0.000000,28.897997>}
box{<0,0,-0.076200><0.317281,0.035000,0.076200> rotate<0,-0.000564,0> translate<20.685991,0.000000,28.897994> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.987384,0.000000,11.377397>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.513800,0.000000,11.903816>}
box{<0,0,-0.076200><0.744466,0.035000,0.076200> rotate<0,-44.997200,0> translate<20.987384,0.000000,11.377397> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.003272,0.000000,28.897997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.005800,0.000000,28.897319>}
box{<0,0,-0.076200><0.002617,0.035000,0.076200> rotate<0,15.014147,0> translate<21.003272,0.000000,28.897997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.005800,0.000000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.005800,0.000000,28.897319>}
box{<0,0,-0.076200><0.058681,0.035000,0.076200> rotate<0,-90.000000,0> translate<21.005800,0.000000,28.897319> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.005800,-1.535000,29.051434>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.050434,-1.535000,29.006800>}
box{<0,0,-0.076200><0.063123,0.035000,0.076200> rotate<0,44.997030,0> translate<21.005800,-1.535000,29.051434> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.005800,-1.535000,30.683200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.005800,-1.535000,29.051434>}
box{<0,0,-0.076200><1.631766,0.035000,0.076200> rotate<0,-90.000000,0> translate<21.005800,-1.535000,29.051434> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.050434,-1.535000,29.006800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.907563,-1.535000,29.006800>}
box{<0,0,-0.076200><2.857128,0.035000,0.076200> rotate<0,0.000000,0> translate<21.050434,-1.535000,29.006800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.055541,-1.535000,15.697197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.945600,-1.535000,16.587256>}
box{<0,0,-0.076200><1.258734,0.035000,0.076200> rotate<0,-44.997030,0> translate<21.055541,-1.535000,15.697197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.059797,0.000000,16.817016>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.059797,0.000000,17.193400>}
box{<0,0,-0.076200><0.376384,0.035000,0.076200> rotate<0,90.000000,0> translate<21.059797,0.000000,17.193400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.059797,0.000000,16.817016>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.052616,0.000000,15.824197>}
box{<0,0,-0.076200><1.404058,0.035000,0.076200> rotate<0,44.997030,0> translate<21.059797,0.000000,16.817016> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.059797,0.000000,16.916400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.844000,0.000000,16.916400>}
box{<0,0,-0.076200><0.784203,0.035000,0.076200> rotate<0,0.000000,0> translate<21.059797,0.000000,16.916400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.059797,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.844000,0.000000,17.068800>}
box{<0,0,-0.076200><0.784203,0.035000,0.076200> rotate<0,0.000000,0> translate<21.059797,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.059797,0.000000,17.193400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.198488,0.000000,17.193400>}
box{<0,0,-0.076200><0.138691,0.035000,0.076200> rotate<0,0.000000,0> translate<21.059797,0.000000,17.193400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.089809,0.000000,22.430597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.198488,0.000000,22.430597>}
box{<0,0,-0.076200><0.108678,0.035000,0.076200> rotate<0,0.000000,0> translate<21.089809,0.000000,22.430597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.089809,0.000000,22.430597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.798616,0.000000,23.139400>}
box{<0,0,-0.076200><1.002401,0.035000,0.076200> rotate<0,-44.996904,0> translate<21.089809,0.000000,22.430597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.112813,0.000000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.953256,0.000000,16.764000>}
box{<0,0,-0.076200><0.840444,0.035000,0.076200> rotate<0,0.000000,0> translate<21.112813,0.000000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.198488,0.000000,17.193400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.332397,0.000000,17.327309>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<21.198488,0.000000,17.193400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.198488,0.000000,22.430597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.332397,0.000000,22.296688>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<21.198488,0.000000,22.430597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.214413,0.000000,22.555200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.453588,0.000000,22.555200>}
box{<0,0,-0.076200><1.239175,0.035000,0.076200> rotate<0,0.000000,0> translate<21.214413,0.000000,22.555200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.226284,0.000000,22.402800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.749600,0.000000,22.402800>}
box{<0,0,-0.076200><0.523316,0.035000,0.076200> rotate<0,0.000000,0> translate<21.226284,0.000000,22.402800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.226288,0.000000,17.221200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.844000,0.000000,17.221200>}
box{<0,0,-0.076200><0.617712,0.035000,0.076200> rotate<0,0.000000,0> translate<21.226288,0.000000,17.221200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.265213,0.000000,16.611600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.105656,0.000000,16.611600>}
box{<0,0,-0.076200><0.840444,0.035000,0.076200> rotate<0,0.000000,0> translate<21.265213,0.000000,16.611600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.332397,0.000000,17.327309>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.332397,0.000000,17.683625>}
box{<0,0,-0.076200><0.356316,0.035000,0.076200> rotate<0,90.000000,0> translate<21.332397,0.000000,17.683625> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.332397,0.000000,17.373600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.902463,0.000000,17.373600>}
box{<0,0,-0.076200><0.570066,0.035000,0.076200> rotate<0,0.000000,0> translate<21.332397,0.000000,17.373600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.332397,0.000000,17.526000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.996400,0.000000,17.526000>}
box{<0,0,-0.076200><0.664003,0.035000,0.076200> rotate<0,0.000000,0> translate<21.332397,0.000000,17.526000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.332397,0.000000,17.678400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.899509,0.000000,17.678400>}
box{<0,0,-0.076200><0.567113,0.035000,0.076200> rotate<0,0.000000,0> translate<21.332397,0.000000,17.678400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.332397,0.000000,17.683625>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.368022,0.000000,17.719250>}
box{<0,0,-0.076200><0.050381,0.035000,0.076200> rotate<0,-44.997030,0> translate<21.332397,0.000000,17.683625> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.332397,0.000000,21.940372>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.332397,0.000000,22.296688>}
box{<0,0,-0.076200><0.356316,0.035000,0.076200> rotate<0,90.000000,0> translate<21.332397,0.000000,22.296688> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.332397,0.000000,21.940372>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.368022,0.000000,21.904747>}
box{<0,0,-0.076200><0.050381,0.035000,0.076200> rotate<0,44.997030,0> translate<21.332397,0.000000,21.940372> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.332397,0.000000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.813063,0.000000,21.945600>}
box{<0,0,-0.076200><0.480666,0.035000,0.076200> rotate<0,0.000000,0> translate<21.332397,0.000000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.332397,0.000000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.750275,0.000000,22.098000>}
box{<0,0,-0.076200><0.417878,0.035000,0.076200> rotate<0,0.000000,0> translate<21.332397,0.000000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.332397,0.000000,22.250400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.749600,0.000000,22.250400>}
box{<0,0,-0.076200><0.417203,0.035000,0.076200> rotate<0,0.000000,0> translate<21.332397,0.000000,22.250400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.366813,0.000000,22.707600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.749600,0.000000,22.707600>}
box{<0,0,-0.076200><0.382787,0.035000,0.076200> rotate<0,0.000000,0> translate<21.366813,0.000000,22.707600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.368022,0.000000,17.719250>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.411494,0.000000,17.794547>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-59.996495,0> translate<21.368022,0.000000,17.719250> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.368022,0.000000,21.904747>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.411494,0.000000,21.829450>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,59.996495,0> translate<21.368022,0.000000,21.904747> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.411494,0.000000,17.794547>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.433997,0.000000,17.878525>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-74.994252,0> translate<21.411494,0.000000,17.794547> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.411494,0.000000,21.829450>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.433997,0.000000,21.745472>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,74.994252,0> translate<21.411494,0.000000,21.829450> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.413256,-1.535000,14.833600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.666197,-1.535000,15.086541>}
box{<0,0,-0.076200><0.357712,0.035000,0.076200> rotate<0,-44.997030,0> translate<21.413256,-1.535000,14.833600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.416169,0.000000,19.311997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.433997,0.000000,19.245472>}
box{<0,0,-0.076200><0.068872,0.035000,0.076200> rotate<0,74.992796,0> translate<21.416169,0.000000,19.311997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.416169,0.000000,19.311997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.433997,0.000000,19.378525>}
box{<0,0,-0.076200><0.068875,0.035000,0.076200> rotate<0,-74.993469,0> translate<21.416169,0.000000,19.311997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.417613,0.000000,16.459200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.473581,0.000000,16.459200>}
box{<0,0,-0.076200><1.055969,0.035000,0.076200> rotate<0,0.000000,0> translate<21.417613,0.000000,16.459200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.421206,0.000000,17.830800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.851200,0.000000,17.830800>}
box{<0,0,-0.076200><0.429994,0.035000,0.076200> rotate<0,0.000000,0> translate<21.421206,0.000000,17.830800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.421209,0.000000,21.793200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,21.793200>}
box{<0,0,-0.076200><5.553591,0.035000,0.076200> rotate<0,0.000000,0> translate<21.421209,0.000000,21.793200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.427637,0.000000,19.354800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.749600,0.000000,19.354800>}
box{<0,0,-0.076200><0.321963,0.035000,0.076200> rotate<0,0.000000,0> translate<21.427637,0.000000,19.354800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.433997,0.000000,17.878525>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.433997,0.000000,18.061981>}
box{<0,0,-0.076200><0.183456,0.035000,0.076200> rotate<0,90.000000,0> translate<21.433997,0.000000,18.061981> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.433997,0.000000,17.983200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.762381,0.000000,17.983200>}
box{<0,0,-0.076200><0.328384,0.035000,0.076200> rotate<0,0.000000,0> translate<21.433997,0.000000,17.983200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.433997,0.000000,18.062013>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.433997,0.000000,18.181000>}
box{<0,0,-0.076200><0.118987,0.035000,0.076200> rotate<0,90.000000,0> translate<21.433997,0.000000,18.181000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.433997,0.000000,18.135600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.609981,0.000000,18.135600>}
box{<0,0,-0.076200><0.175984,0.035000,0.076200> rotate<0,0.000000,0> translate<21.433997,0.000000,18.135600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.433997,0.000000,18.181000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.564581,0.000000,18.181000>}
box{<0,0,-0.076200><0.130584,0.035000,0.076200> rotate<0,0.000000,0> translate<21.433997,0.000000,18.181000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.433997,0.000000,18.942997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.433997,0.000000,19.061981>}
box{<0,0,-0.076200><0.118984,0.035000,0.076200> rotate<0,90.000000,0> translate<21.433997,0.000000,19.061981> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.433997,0.000000,18.942997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.801522,0.000000,18.942997>}
box{<0,0,-0.076200><0.367525,0.035000,0.076200> rotate<0,0.000000,0> translate<21.433997,0.000000,18.942997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.433997,0.000000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.757081,0.000000,19.050000>}
box{<0,0,-0.076200><0.323084,0.035000,0.076200> rotate<0,0.000000,0> translate<21.433997,0.000000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.433997,0.000000,19.062013>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.433997,0.000000,19.245472>}
box{<0,0,-0.076200><0.183459,0.035000,0.076200> rotate<0,90.000000,0> translate<21.433997,0.000000,19.245472> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.433997,0.000000,19.202400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.749600,0.000000,19.202400>}
box{<0,0,-0.076200><0.315603,0.035000,0.076200> rotate<0,0.000000,0> translate<21.433997,0.000000,19.202400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.433997,0.000000,19.378525>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.433997,0.000000,19.561981>}
box{<0,0,-0.076200><0.183456,0.035000,0.076200> rotate<0,90.000000,0> translate<21.433997,0.000000,19.561981> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.433997,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.453588,0.000000,19.507200>}
box{<0,0,-0.076200><1.019591,0.035000,0.076200> rotate<0,0.000000,0> translate<21.433997,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.433997,0.000000,19.562013>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.433997,0.000000,19.706400>}
box{<0,0,-0.076200><0.144388,0.035000,0.076200> rotate<0,90.000000,0> translate<21.433997,0.000000,19.706400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.433997,0.000000,19.659600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.749600,0.000000,19.659600>}
box{<0,0,-0.076200><0.315603,0.035000,0.076200> rotate<0,0.000000,0> translate<21.433997,0.000000,19.659600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.433997,0.000000,19.706400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.545094,0.000000,19.706400>}
box{<0,0,-0.076200><0.111097,0.035000,0.076200> rotate<0,0.000000,0> translate<21.433997,0.000000,19.706400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.433997,0.000000,21.417597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.433997,0.000000,21.561981>}
box{<0,0,-0.076200><0.144384,0.035000,0.076200> rotate<0,90.000000,0> translate<21.433997,0.000000,21.561981> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.433997,0.000000,21.417597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.851200,0.000000,21.417597>}
box{<0,0,-0.076200><0.417203,0.035000,0.076200> rotate<0,0.000000,0> translate<21.433997,0.000000,21.417597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.433997,0.000000,21.488400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.851200,0.000000,21.488400>}
box{<0,0,-0.076200><0.417203,0.035000,0.076200> rotate<0,0.000000,0> translate<21.433997,0.000000,21.488400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.433997,0.000000,21.562013>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.433997,0.000000,21.745472>}
box{<0,0,-0.076200><0.183459,0.035000,0.076200> rotate<0,90.000000,0> translate<21.433997,0.000000,21.745472> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.433997,0.000000,21.640800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.853313,0.000000,21.640800>}
box{<0,0,-0.076200><0.419316,0.035000,0.076200> rotate<0,0.000000,0> translate<21.433997,0.000000,21.640800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.513800,0.000000,15.285381>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.513800,0.000000,11.903816>}
box{<0,0,-0.076200><3.381566,0.035000,0.076200> rotate<0,-90.000000,0> translate<21.513800,0.000000,11.903816> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.514856,-1.535000,14.935200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,14.935200>}
box{<0,0,-0.076200><5.459944,0.035000,0.076200> rotate<0,0.000000,0> translate<21.514856,-1.535000,14.935200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.519213,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.749600,0.000000,22.860000>}
box{<0,0,-0.076200><0.230387,0.035000,0.076200> rotate<0,0.000000,0> translate<21.519213,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.545094,0.000000,19.706400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.766453,0.000000,19.927763>}
box{<0,0,-0.076200><0.313052,0.035000,0.076200> rotate<0,-44.997435,0> translate<21.545094,0.000000,19.706400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.564581,0.000000,18.181000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.640800,0.000000,18.104781>}
box{<0,0,-0.076200><0.107790,0.035000,0.076200> rotate<0,44.997030,0> translate<21.564581,0.000000,18.181000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.570013,0.000000,16.306800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.625981,0.000000,16.306800>}
box{<0,0,-0.076200><1.055969,0.035000,0.076200> rotate<0,0.000000,0> translate<21.570013,0.000000,16.306800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.640800,0.000000,18.104781>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.851200,0.000000,17.894384>}
box{<0,0,-0.076200><0.297548,0.035000,0.076200> rotate<0,44.996605,0> translate<21.640800,0.000000,18.104781> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.650691,0.000000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.749600,0.000000,19.812000>}
box{<0,0,-0.076200><0.098909,0.035000,0.076200> rotate<0,0.000000,0> translate<21.650691,0.000000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.666197,-1.535000,15.086541>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.809197,-1.535000,16.229541>}
box{<0,0,-0.076200><1.616446,0.035000,0.076200> rotate<0,-44.997030,0> translate<21.666197,-1.535000,15.086541> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.667256,-1.535000,15.087600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,15.087600>}
box{<0,0,-0.076200><5.307544,0.035000,0.076200> rotate<0,0.000000,0> translate<21.667256,-1.535000,15.087600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.671613,0.000000,23.012400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.795747,0.000000,23.012400>}
box{<0,0,-0.076200><0.124134,0.035000,0.076200> rotate<0,0.000000,0> translate<21.671613,0.000000,23.012400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.722413,0.000000,16.154400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.778381,0.000000,16.154400>}
box{<0,0,-0.076200><1.055969,0.035000,0.076200> rotate<0,0.000000,0> translate<21.722413,0.000000,16.154400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.749600,0.000000,19.077925>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.772103,0.000000,18.993947>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,74.994252,0> translate<21.749600,0.000000,19.077925> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.749600,0.000000,19.395203>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.749600,0.000000,19.077925>}
box{<0,0,-0.076200><0.317278,0.035000,0.076200> rotate<0,-90.000000,0> translate<21.749600,0.000000,19.077925> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.749600,0.000000,19.395203>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.453588,0.000000,19.395203>}
box{<0,0,-0.076200><0.703988,0.035000,0.076200> rotate<0,0.000000,0> translate<21.749600,0.000000,19.395203> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.749600,0.000000,19.547591>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.453588,0.000000,19.547591>}
box{<0,0,-0.076200><0.703988,0.035000,0.076200> rotate<0,0.000000,0> translate<21.749600,0.000000,19.547591> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.749600,0.000000,19.864872>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.749600,0.000000,19.547591>}
box{<0,0,-0.076200><0.317281,0.035000,0.076200> rotate<0,-90.000000,0> translate<21.749600,0.000000,19.547591> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.749600,0.000000,19.864872>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.766453,0.000000,19.927763>}
box{<0,0,-0.076200><0.065110,0.035000,0.076200> rotate<0,-74.993662,0> translate<21.749600,0.000000,19.864872> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.749600,0.000000,22.100525>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.772103,0.000000,22.016547>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,74.994252,0> translate<21.749600,0.000000,22.100525> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.749600,0.000000,22.417803>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.749600,0.000000,22.100525>}
box{<0,0,-0.076200><0.317278,0.035000,0.076200> rotate<0,-90.000000,0> translate<21.749600,0.000000,22.100525> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.749600,0.000000,22.417803>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.453588,0.000000,22.417803>}
box{<0,0,-0.076200><0.703988,0.035000,0.076200> rotate<0,0.000000,0> translate<21.749600,0.000000,22.417803> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.749600,0.000000,22.570191>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.453588,0.000000,22.570191>}
box{<0,0,-0.076200><0.703988,0.035000,0.076200> rotate<0,0.000000,0> translate<21.749600,0.000000,22.570191> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.749600,0.000000,22.887472>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.749600,0.000000,22.570191>}
box{<0,0,-0.076200><0.317281,0.035000,0.076200> rotate<0,-90.000000,0> translate<21.749600,0.000000,22.570191> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.749600,0.000000,22.887472>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.772103,0.000000,22.971450>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-74.994252,0> translate<21.749600,0.000000,22.887472> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.772103,0.000000,18.993947>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.801522,0.000000,18.942997>}
box{<0,0,-0.076200><0.058833,0.035000,0.076200> rotate<0,59.993718,0> translate<21.772103,0.000000,18.993947> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.772103,0.000000,22.016547>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.815575,0.000000,21.941250>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,59.996495,0> translate<21.772103,0.000000,22.016547> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.772103,0.000000,22.971450>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.815575,0.000000,23.046747>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-59.996495,0> translate<21.772103,0.000000,22.971450> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.792288,0.000000,9.077397>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.926197,0.000000,8.943487>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<21.792288,0.000000,9.077397> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.792288,0.000000,9.820200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.926197,0.000000,9.954109>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<21.792288,0.000000,9.820200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.798616,0.000000,23.139400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.931056,0.000000,23.139400>}
box{<0,0,-0.076200><0.132441,0.035000,0.076200> rotate<0,0.000000,0> translate<21.798616,0.000000,23.139400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.815575,0.000000,21.941250>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.877050,0.000000,21.879775>}
box{<0,0,-0.076200><0.086939,0.035000,0.076200> rotate<0,44.997030,0> translate<21.815575,0.000000,21.941250> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.815575,0.000000,23.046747>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.877050,0.000000,23.108222>}
box{<0,0,-0.076200><0.086939,0.035000,0.076200> rotate<0,-44.997030,0> translate<21.815575,0.000000,23.046747> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.819656,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,15.240000>}
box{<0,0,-0.076200><5.155144,0.035000,0.076200> rotate<0,0.000000,0> translate<21.819656,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.844000,-1.535000,16.873256>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.945600,-1.535000,16.771656>}
box{<0,0,-0.076200><0.143684,0.035000,0.076200> rotate<0,44.997030,0> translate<21.844000,-1.535000,16.873256> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.844000,0.000000,16.873256>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.156456,0.000000,16.560800>}
box{<0,0,-0.076200><0.441880,0.035000,0.076200> rotate<0,44.997030,0> translate<21.844000,0.000000,16.873256> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.844000,0.000000,17.315141>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.844000,0.000000,16.873256>}
box{<0,0,-0.076200><0.441884,0.035000,0.076200> rotate<0,-90.000000,0> translate<21.844000,0.000000,16.873256> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.844000,-1.535000,17.315141>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.844000,-1.535000,16.873256>}
box{<0,0,-0.076200><0.441884,0.035000,0.076200> rotate<0,-90.000000,0> translate<21.844000,-1.535000,16.873256> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.844000,0.000000,17.315141>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.996400,0.000000,17.467538>}
box{<0,0,-0.076200><0.215524,0.035000,0.076200> rotate<0,-44.996443,0> translate<21.844000,0.000000,17.315141> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.844000,-1.535000,17.315141>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.156456,-1.535000,17.627597>}
box{<0,0,-0.076200><0.441880,0.035000,0.076200> rotate<0,-44.997030,0> translate<21.844000,-1.535000,17.315141> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.851200,0.000000,17.726709>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.985109,0.000000,17.592800>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<21.851200,0.000000,17.726709> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.851200,0.000000,17.894384>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.851200,0.000000,17.726709>}
box{<0,0,-0.076200><0.167675,0.035000,0.076200> rotate<0,-90.000000,0> translate<21.851200,0.000000,17.726709> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.851200,0.000000,21.638687>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.851200,0.000000,21.417597>}
box{<0,0,-0.076200><0.221091,0.035000,0.076200> rotate<0,-90.000000,0> translate<21.851200,0.000000,21.417597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.851200,0.000000,21.638687>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.985109,0.000000,21.772597>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<21.851200,0.000000,21.638687> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.874813,0.000000,16.002000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,16.002000>}
box{<0,0,-0.076200><5.099988,0.035000,0.076200> rotate<0,0.000000,0> translate<21.874813,0.000000,16.002000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.877050,0.000000,21.879775>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.952347,0.000000,21.836303>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,29.997566,0> translate<21.877050,0.000000,21.879775> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.877050,0.000000,23.108222>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.931056,0.000000,23.139400>}
box{<0,0,-0.076200><0.062360,0.035000,0.076200> rotate<0,-29.996112,0> translate<21.877050,0.000000,23.108222> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.878084,0.000000,8.991600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,8.991600>}
box{<0,0,-0.076200><5.096716,0.035000,0.076200> rotate<0,0.000000,0> translate<21.878084,0.000000,8.991600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.878087,0.000000,9.906000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,9.906000>}
box{<0,0,-0.076200><5.096713,0.035000,0.076200> rotate<0,0.000000,0> translate<21.878087,0.000000,9.906000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.926197,0.000000,7.696197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.926197,0.000000,8.943487>}
box{<0,0,-0.076200><1.247291,0.035000,0.076200> rotate<0,90.000000,0> translate<21.926197,0.000000,8.943487> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.926197,0.000000,7.696197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,7.696197>}
box{<0,0,-0.076200><5.048603,0.035000,0.076200> rotate<0,0.000000,0> translate<21.926197,0.000000,7.696197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.926197,0.000000,7.772400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,7.772400>}
box{<0,0,-0.076200><5.048603,0.035000,0.076200> rotate<0,0.000000,0> translate<21.926197,0.000000,7.772400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.926197,0.000000,7.924800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,7.924800>}
box{<0,0,-0.076200><5.048603,0.035000,0.076200> rotate<0,0.000000,0> translate<21.926197,0.000000,7.924800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.926197,0.000000,8.077200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,8.077200>}
box{<0,0,-0.076200><5.048603,0.035000,0.076200> rotate<0,0.000000,0> translate<21.926197,0.000000,8.077200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.926197,0.000000,8.229600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,8.229600>}
box{<0,0,-0.076200><5.048603,0.035000,0.076200> rotate<0,0.000000,0> translate<21.926197,0.000000,8.229600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.926197,0.000000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,8.382000>}
box{<0,0,-0.076200><5.048603,0.035000,0.076200> rotate<0,0.000000,0> translate<21.926197,0.000000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.926197,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,8.534400>}
box{<0,0,-0.076200><5.048603,0.035000,0.076200> rotate<0,0.000000,0> translate<21.926197,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.926197,0.000000,8.686800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,8.686800>}
box{<0,0,-0.076200><5.048603,0.035000,0.076200> rotate<0,0.000000,0> translate<21.926197,0.000000,8.686800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.926197,0.000000,8.839200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,8.839200>}
box{<0,0,-0.076200><5.048603,0.035000,0.076200> rotate<0,0.000000,0> translate<21.926197,0.000000,8.839200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.926197,0.000000,9.954109>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.926197,0.000000,11.238584>}
box{<0,0,-0.076200><1.284475,0.035000,0.076200> rotate<0,90.000000,0> translate<21.926197,0.000000,11.238584> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.926197,0.000000,10.058400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,10.058400>}
box{<0,0,-0.076200><5.048603,0.035000,0.076200> rotate<0,0.000000,0> translate<21.926197,0.000000,10.058400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.926197,0.000000,10.210800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,10.210800>}
box{<0,0,-0.076200><5.048603,0.035000,0.076200> rotate<0,0.000000,0> translate<21.926197,0.000000,10.210800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.926197,0.000000,10.363200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,10.363200>}
box{<0,0,-0.076200><5.048603,0.035000,0.076200> rotate<0,0.000000,0> translate<21.926197,0.000000,10.363200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.926197,0.000000,10.515600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,10.515600>}
box{<0,0,-0.076200><5.048603,0.035000,0.076200> rotate<0,0.000000,0> translate<21.926197,0.000000,10.515600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.926197,0.000000,10.668000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,10.668000>}
box{<0,0,-0.076200><5.048603,0.035000,0.076200> rotate<0,0.000000,0> translate<21.926197,0.000000,10.668000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.926197,0.000000,10.820400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,10.820400>}
box{<0,0,-0.076200><5.048603,0.035000,0.076200> rotate<0,0.000000,0> translate<21.926197,0.000000,10.820400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.926197,0.000000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,10.972800>}
box{<0,0,-0.076200><5.048603,0.035000,0.076200> rotate<0,0.000000,0> translate<21.926197,0.000000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.926197,0.000000,11.125200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,11.125200>}
box{<0,0,-0.076200><5.048603,0.035000,0.076200> rotate<0,0.000000,0> translate<21.926197,0.000000,11.125200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.926197,0.000000,11.238584>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.275797,0.000000,11.588181>}
box{<0,0,-0.076200><0.494407,0.035000,0.076200> rotate<0,-44.996774,0> translate<21.926197,0.000000,11.238584> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.945600,-1.535000,16.771656>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.945600,-1.535000,16.587256>}
box{<0,0,-0.076200><0.184400,0.035000,0.076200> rotate<0,-90.000000,0> translate<21.945600,-1.535000,16.587256> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.952347,0.000000,21.836303>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.036325,0.000000,21.813800>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,14.999808,0> translate<21.952347,0.000000,21.836303> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.965212,0.000000,11.277600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,11.277600>}
box{<0,0,-0.076200><5.009588,0.035000,0.076200> rotate<0,0.000000,0> translate<21.965212,0.000000,11.277600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.972056,-1.535000,15.392400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,15.392400>}
box{<0,0,-0.076200><5.002744,0.035000,0.076200> rotate<0,0.000000,0> translate<21.972056,-1.535000,15.392400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.973434,0.000000,20.134744>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.036325,0.000000,20.151597>}
box{<0,0,-0.076200><0.065110,0.035000,0.076200> rotate<0,-15.000398,0> translate<21.973434,0.000000,20.134744> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.973434,0.000000,20.134744>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.454091,0.000000,20.615400>}
box{<0,0,-0.076200><0.679751,0.035000,0.076200> rotate<0,-44.997030,0> translate<21.973434,0.000000,20.134744> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.985109,0.000000,17.592800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.996400,0.000000,17.592800>}
box{<0,0,-0.076200><0.011291,0.035000,0.076200> rotate<0,0.000000,0> translate<21.985109,0.000000,17.592800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.985109,0.000000,21.772597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.074488,0.000000,21.772597>}
box{<0,0,-0.076200><1.089378,0.035000,0.076200> rotate<0,0.000000,0> translate<21.985109,0.000000,21.772597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.996400,0.000000,17.592800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.996400,0.000000,17.467538>}
box{<0,0,-0.076200><0.125262,0.035000,0.076200> rotate<0,-90.000000,0> translate<21.996400,0.000000,17.467538> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.027213,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,15.849600>}
box{<0,0,-0.076200><4.947588,0.035000,0.076200> rotate<0,0.000000,0> translate<22.027213,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.030428,0.000000,18.792781>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.036325,0.000000,18.791200>}
box{<0,0,-0.076200><0.006105,0.035000,0.076200> rotate<0,15.009770,0> translate<22.030428,0.000000,18.792781> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.030428,0.000000,18.792781>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.073213,0.000000,18.749997>}
box{<0,0,-0.076200><0.060506,0.035000,0.076200> rotate<0,44.997030,0> translate<22.030428,0.000000,18.792781> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.036325,0.000000,18.791200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.453603,0.000000,18.791197>}
box{<0,0,-0.076200><0.417278,0.035000,0.076200> rotate<0,0.000429,0> translate<22.036325,0.000000,18.791200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.036325,0.000000,20.151597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.453603,0.000000,20.151597>}
box{<0,0,-0.076200><0.417278,0.035000,0.076200> rotate<0,0.000000,0> translate<22.036325,0.000000,20.151597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.036325,0.000000,21.813800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.453603,0.000000,21.813797>}
box{<0,0,-0.076200><0.417278,0.035000,0.076200> rotate<0,0.000429,0> translate<22.036325,0.000000,21.813800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.052616,0.000000,15.824197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.275797,0.000000,15.601016>}
box{<0,0,-0.076200><0.315626,0.035000,0.076200> rotate<0,44.997030,0> translate<22.052616,0.000000,15.824197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.073213,0.000000,18.749997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.035228,0.000000,18.749997>}
box{<0,0,-0.076200><0.962016,0.035000,0.076200> rotate<0,0.000000,0> translate<22.073213,0.000000,18.749997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.107891,0.000000,20.269200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.220706,0.000000,20.269200>}
box{<0,0,-0.076200><1.112816,0.035000,0.076200> rotate<0,0.000000,0> translate<22.107891,0.000000,20.269200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.117612,0.000000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,11.430000>}
box{<0,0,-0.076200><4.857188,0.035000,0.076200> rotate<0,0.000000,0> translate<22.117612,0.000000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.124456,-1.535000,15.544800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,15.544800>}
box{<0,0,-0.076200><4.850344,0.035000,0.076200> rotate<0,0.000000,0> translate<22.124456,-1.535000,15.544800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.156456,0.000000,16.560800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.371981,0.000000,16.560800>}
box{<0,0,-0.076200><0.215525,0.035000,0.076200> rotate<0,0.000000,0> translate<22.156456,0.000000,16.560800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.156456,-1.535000,17.627597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.598341,-1.535000,17.627597>}
box{<0,0,-0.076200><0.441884,0.035000,0.076200> rotate<0,0.000000,0> translate<22.156456,-1.535000,17.627597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.179613,0.000000,15.697200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,15.697200>}
box{<0,0,-0.076200><4.795188,0.035000,0.076200> rotate<0,0.000000,0> translate<22.179613,0.000000,15.697200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.260291,0.000000,20.421600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.068306,0.000000,20.421600>}
box{<0,0,-0.076200><0.808016,0.035000,0.076200> rotate<0,0.000000,0> translate<22.260291,0.000000,20.421600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.270012,0.000000,11.582400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,11.582400>}
box{<0,0,-0.076200><4.704788,0.035000,0.076200> rotate<0,0.000000,0> translate<22.270012,0.000000,11.582400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.275797,0.000000,11.588181>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.275797,0.000000,15.601016>}
box{<0,0,-0.076200><4.012834,0.035000,0.076200> rotate<0,90.000000,0> translate<22.275797,0.000000,15.601016> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.275797,0.000000,11.734800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,11.734800>}
box{<0,0,-0.076200><4.699003,0.035000,0.076200> rotate<0,0.000000,0> translate<22.275797,0.000000,11.734800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.275797,0.000000,11.887200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,11.887200>}
box{<0,0,-0.076200><4.699003,0.035000,0.076200> rotate<0,0.000000,0> translate<22.275797,0.000000,11.887200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.275797,0.000000,12.039600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,12.039600>}
box{<0,0,-0.076200><4.699003,0.035000,0.076200> rotate<0,0.000000,0> translate<22.275797,0.000000,12.039600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.275797,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,12.192000>}
box{<0,0,-0.076200><4.699003,0.035000,0.076200> rotate<0,0.000000,0> translate<22.275797,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.275797,0.000000,12.344400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,12.344400>}
box{<0,0,-0.076200><4.699003,0.035000,0.076200> rotate<0,0.000000,0> translate<22.275797,0.000000,12.344400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.275797,0.000000,12.496800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,12.496800>}
box{<0,0,-0.076200><4.699003,0.035000,0.076200> rotate<0,0.000000,0> translate<22.275797,0.000000,12.496800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.275797,0.000000,12.649200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,12.649200>}
box{<0,0,-0.076200><4.699003,0.035000,0.076200> rotate<0,0.000000,0> translate<22.275797,0.000000,12.649200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.275797,0.000000,12.801600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,12.801600>}
box{<0,0,-0.076200><4.699003,0.035000,0.076200> rotate<0,0.000000,0> translate<22.275797,0.000000,12.801600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.275797,0.000000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,12.954000>}
box{<0,0,-0.076200><4.699003,0.035000,0.076200> rotate<0,0.000000,0> translate<22.275797,0.000000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.275797,0.000000,13.106400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,13.106400>}
box{<0,0,-0.076200><4.699003,0.035000,0.076200> rotate<0,0.000000,0> translate<22.275797,0.000000,13.106400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.275797,0.000000,13.258800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,13.258800>}
box{<0,0,-0.076200><4.699003,0.035000,0.076200> rotate<0,0.000000,0> translate<22.275797,0.000000,13.258800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.275797,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,13.411200>}
box{<0,0,-0.076200><4.699003,0.035000,0.076200> rotate<0,0.000000,0> translate<22.275797,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.275797,0.000000,13.563600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,13.563600>}
box{<0,0,-0.076200><4.699003,0.035000,0.076200> rotate<0,0.000000,0> translate<22.275797,0.000000,13.563600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.275797,0.000000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,13.716000>}
box{<0,0,-0.076200><4.699003,0.035000,0.076200> rotate<0,0.000000,0> translate<22.275797,0.000000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.275797,0.000000,13.868400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,13.868400>}
box{<0,0,-0.076200><4.699003,0.035000,0.076200> rotate<0,0.000000,0> translate<22.275797,0.000000,13.868400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.275797,0.000000,14.020800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,14.020800>}
box{<0,0,-0.076200><4.699003,0.035000,0.076200> rotate<0,0.000000,0> translate<22.275797,0.000000,14.020800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.275797,0.000000,14.173200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,14.173200>}
box{<0,0,-0.076200><4.699003,0.035000,0.076200> rotate<0,0.000000,0> translate<22.275797,0.000000,14.173200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.275797,0.000000,14.325600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,14.325600>}
box{<0,0,-0.076200><4.699003,0.035000,0.076200> rotate<0,0.000000,0> translate<22.275797,0.000000,14.325600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.275797,0.000000,14.478000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,14.478000>}
box{<0,0,-0.076200><4.699003,0.035000,0.076200> rotate<0,0.000000,0> translate<22.275797,0.000000,14.478000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.275797,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,14.630400>}
box{<0,0,-0.076200><4.699003,0.035000,0.076200> rotate<0,0.000000,0> translate<22.275797,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.275797,0.000000,14.782800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,14.782800>}
box{<0,0,-0.076200><4.699003,0.035000,0.076200> rotate<0,0.000000,0> translate<22.275797,0.000000,14.782800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.275797,0.000000,14.935200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,14.935200>}
box{<0,0,-0.076200><4.699003,0.035000,0.076200> rotate<0,0.000000,0> translate<22.275797,0.000000,14.935200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.275797,0.000000,15.087600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,15.087600>}
box{<0,0,-0.076200><4.699003,0.035000,0.076200> rotate<0,0.000000,0> translate<22.275797,0.000000,15.087600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.275797,0.000000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,15.240000>}
box{<0,0,-0.076200><4.699003,0.035000,0.076200> rotate<0,0.000000,0> translate<22.275797,0.000000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.275797,0.000000,15.392400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,15.392400>}
box{<0,0,-0.076200><4.699003,0.035000,0.076200> rotate<0,0.000000,0> translate<22.275797,0.000000,15.392400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.275797,0.000000,15.544800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,15.544800>}
box{<0,0,-0.076200><4.699003,0.035000,0.076200> rotate<0,0.000000,0> translate<22.275797,0.000000,15.544800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.276856,-1.535000,15.697200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,15.697200>}
box{<0,0,-0.076200><4.697944,0.035000,0.076200> rotate<0,0.000000,0> translate<22.276856,-1.535000,15.697200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.371981,0.000000,16.560800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.555200,0.000000,16.377581>}
box{<0,0,-0.076200><0.259110,0.035000,0.076200> rotate<0,44.997030,0> translate<22.371981,0.000000,16.560800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.412691,0.000000,20.574000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.915906,0.000000,20.574000>}
box{<0,0,-0.076200><0.503216,0.035000,0.076200> rotate<0,0.000000,0> translate<22.412691,0.000000,20.574000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.429256,-1.535000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,15.849600>}
box{<0,0,-0.076200><4.545544,0.035000,0.076200> rotate<0,0.000000,0> translate<22.429256,-1.535000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.453588,0.000000,19.547591>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.453588,0.000000,19.395203>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,-90.000000,0> translate<22.453588,0.000000,19.395203> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.453588,0.000000,22.570191>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.453588,0.000000,22.417803>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,-90.000000,0> translate<22.453588,0.000000,22.417803> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.453603,0.000000,18.791197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.453603,0.000000,19.395188>}
box{<0,0,-0.076200><0.603991,0.035000,0.076200> rotate<0,90.000000,0> translate<22.453603,0.000000,19.395188> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.453603,0.000000,18.897600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.605991,0.000000,18.897600>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<22.453603,0.000000,18.897600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.453603,0.000000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.605991,0.000000,19.050000>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<22.453603,0.000000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.453603,0.000000,19.202400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.605991,0.000000,19.202400>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<22.453603,0.000000,19.202400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.453603,0.000000,19.354800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.605991,0.000000,19.354800>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<22.453603,0.000000,19.354800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.453603,0.000000,19.395188>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.605991,0.000000,19.395188>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<22.453603,0.000000,19.395188> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.453603,0.000000,19.547609>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.453603,0.000000,20.151597>}
box{<0,0,-0.076200><0.603988,0.035000,0.076200> rotate<0,90.000000,0> translate<22.453603,0.000000,20.151597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.453603,0.000000,19.547609>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.605991,0.000000,19.547609>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<22.453603,0.000000,19.547609> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.453603,0.000000,19.659600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.605991,0.000000,19.659600>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<22.453603,0.000000,19.659600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.453603,0.000000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.605991,0.000000,19.812000>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<22.453603,0.000000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.453603,0.000000,19.964400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.605991,0.000000,19.964400>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<22.453603,0.000000,19.964400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.453603,0.000000,20.116800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.605991,0.000000,20.116800>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<22.453603,0.000000,20.116800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.453603,0.000000,21.813797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.453603,0.000000,22.417787>}
box{<0,0,-0.076200><0.603991,0.035000,0.076200> rotate<0,90.000000,0> translate<22.453603,0.000000,22.417787> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.453603,0.000000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.605991,0.000000,21.945600>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<22.453603,0.000000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.453603,0.000000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.605991,0.000000,22.098000>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<22.453603,0.000000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.453603,0.000000,22.250400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.605991,0.000000,22.250400>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<22.453603,0.000000,22.250400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.453603,0.000000,22.402800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.605991,0.000000,22.402800>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<22.453603,0.000000,22.402800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.453603,0.000000,22.417787>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.605991,0.000000,22.417787>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<22.453603,0.000000,22.417787> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.454091,0.000000,20.615400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.874506,0.000000,20.615400>}
box{<0,0,-0.076200><0.420416,0.035000,0.076200> rotate<0,0.000000,0> translate<22.454091,0.000000,20.615400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.555200,0.000000,16.377581>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.778381,0.000000,16.154400>}
box{<0,0,-0.076200><0.315626,0.035000,0.076200> rotate<0,44.997030,0> translate<22.555200,0.000000,16.377581> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.581656,-1.535000,16.002000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,16.002000>}
box{<0,0,-0.076200><4.393144,0.035000,0.076200> rotate<0,0.000000,0> translate<22.581656,-1.535000,16.002000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.598341,-1.535000,17.627597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.910797,-1.535000,17.315141>}
box{<0,0,-0.076200><0.441880,0.035000,0.076200> rotate<0,44.997030,0> translate<22.598341,-1.535000,17.627597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.605991,0.000000,18.791197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.023272,0.000000,18.791200>}
box{<0,0,-0.076200><0.417281,0.035000,0.076200> rotate<0,-0.000429,0> translate<22.605991,0.000000,18.791197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.605991,0.000000,19.395188>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.605991,0.000000,18.791197>}
box{<0,0,-0.076200><0.603991,0.035000,0.076200> rotate<0,-90.000000,0> translate<22.605991,0.000000,18.791197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.605991,0.000000,20.151597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.605991,0.000000,19.547609>}
box{<0,0,-0.076200><0.603988,0.035000,0.076200> rotate<0,-90.000000,0> translate<22.605991,0.000000,19.547609> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.605991,0.000000,20.151597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.023272,0.000000,20.151597>}
box{<0,0,-0.076200><0.417281,0.035000,0.076200> rotate<0,0.000000,0> translate<22.605991,0.000000,20.151597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.605991,0.000000,21.813797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.023272,0.000000,21.813800>}
box{<0,0,-0.076200><0.417281,0.035000,0.076200> rotate<0,-0.000429,0> translate<22.605991,0.000000,21.813797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.605991,0.000000,22.417787>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.605991,0.000000,21.813797>}
box{<0,0,-0.076200><0.603991,0.035000,0.076200> rotate<0,-90.000000,0> translate<22.605991,0.000000,21.813797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.606009,0.000000,22.417803>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.606009,0.000000,22.570191>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,90.000000,0> translate<22.606009,0.000000,22.570191> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.606009,0.000000,22.417803>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.309994,0.000000,22.417803>}
box{<0,0,-0.076200><0.703984,0.035000,0.076200> rotate<0,0.000000,0> translate<22.606009,0.000000,22.417803> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.606009,0.000000,22.555200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,22.555200>}
box{<0,0,-0.076200><4.368791,0.035000,0.076200> rotate<0,0.000000,0> translate<22.606009,0.000000,22.555200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.606009,0.000000,22.570191>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.309997,0.000000,22.570191>}
box{<0,0,-0.076200><0.703987,0.035000,0.076200> rotate<0,0.000000,0> translate<22.606009,0.000000,22.570191> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.682197,0.000000,27.558997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.682197,0.000000,28.956000>}
box{<0,0,-0.076200><1.397003,0.035000,0.076200> rotate<0,90.000000,0> translate<22.682197,0.000000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.682197,0.000000,27.558997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.193563,0.000000,27.558997>}
box{<0,0,-0.076200><3.511366,0.035000,0.076200> rotate<0,0.000000,0> translate<22.682197,0.000000,27.558997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.682197,0.000000,27.584400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,27.584400>}
box{<0,0,-0.076200><4.292603,0.035000,0.076200> rotate<0,0.000000,0> translate<22.682197,0.000000,27.584400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.682197,0.000000,27.736800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,27.736800>}
box{<0,0,-0.076200><4.292603,0.035000,0.076200> rotate<0,0.000000,0> translate<22.682197,0.000000,27.736800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.682197,0.000000,27.889200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,27.889200>}
box{<0,0,-0.076200><4.292603,0.035000,0.076200> rotate<0,0.000000,0> translate<22.682197,0.000000,27.889200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.682197,0.000000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,28.041600>}
box{<0,0,-0.076200><4.292603,0.035000,0.076200> rotate<0,0.000000,0> translate<22.682197,0.000000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.682197,0.000000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,28.194000>}
box{<0,0,-0.076200><4.292603,0.035000,0.076200> rotate<0,0.000000,0> translate<22.682197,0.000000,28.194000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.682197,0.000000,28.346400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,28.346400>}
box{<0,0,-0.076200><4.292603,0.035000,0.076200> rotate<0,0.000000,0> translate<22.682197,0.000000,28.346400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.682197,0.000000,28.498800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,28.498800>}
box{<0,0,-0.076200><4.292603,0.035000,0.076200> rotate<0,0.000000,0> translate<22.682197,0.000000,28.498800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.682197,0.000000,28.651200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,28.651200>}
box{<0,0,-0.076200><4.292603,0.035000,0.076200> rotate<0,0.000000,0> translate<22.682197,0.000000,28.651200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.682197,0.000000,28.803600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,28.803600>}
box{<0,0,-0.076200><4.292603,0.035000,0.076200> rotate<0,0.000000,0> translate<22.682197,0.000000,28.803600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.682197,0.000000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,28.956000>}
box{<0,0,-0.076200><4.292603,0.035000,0.076200> rotate<0,0.000000,0> translate<22.682197,0.000000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.699938,-1.535000,17.526000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,17.526000>}
box{<0,0,-0.076200><4.274863,0.035000,0.076200> rotate<0,0.000000,0> translate<22.699938,-1.535000,17.526000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.734056,-1.535000,16.154400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,16.154400>}
box{<0,0,-0.076200><4.240744,0.035000,0.076200> rotate<0,0.000000,0> translate<22.734056,-1.535000,16.154400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.758397,0.000000,17.467538>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.758397,0.000000,17.592800>}
box{<0,0,-0.076200><0.125262,0.035000,0.076200> rotate<0,90.000000,0> translate<22.758397,0.000000,17.592800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.758397,0.000000,17.467538>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.910797,0.000000,17.315141>}
box{<0,0,-0.076200><0.215524,0.035000,0.076200> rotate<0,44.996443,0> translate<22.758397,0.000000,17.467538> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.758397,0.000000,17.526000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.124847,0.000000,17.526000>}
box{<0,0,-0.076200><0.366450,0.035000,0.076200> rotate<0,0.000000,0> translate<22.758397,0.000000,17.526000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.758397,0.000000,17.592800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.035228,0.000000,17.592800>}
box{<0,0,-0.076200><0.276831,0.035000,0.076200> rotate<0,0.000000,0> translate<22.758397,0.000000,17.592800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.778381,0.000000,16.154400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.135416,0.000000,16.154400>}
box{<0,0,-0.076200><1.357034,0.035000,0.076200> rotate<0,0.000000,0> translate<22.778381,0.000000,16.154400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.809197,-1.535000,16.229541>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.809197,-1.535000,16.771656>}
box{<0,0,-0.076200><0.542116,0.035000,0.076200> rotate<0,90.000000,0> translate<22.809197,-1.535000,16.771656> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.809197,-1.535000,16.306800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,16.306800>}
box{<0,0,-0.076200><4.165603,0.035000,0.076200> rotate<0,0.000000,0> translate<22.809197,-1.535000,16.306800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.809197,-1.535000,16.459200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,16.459200>}
box{<0,0,-0.076200><4.165603,0.035000,0.076200> rotate<0,0.000000,0> translate<22.809197,-1.535000,16.459200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.809197,-1.535000,16.611600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,16.611600>}
box{<0,0,-0.076200><4.165603,0.035000,0.076200> rotate<0,0.000000,0> translate<22.809197,-1.535000,16.611600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.809197,-1.535000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,16.764000>}
box{<0,0,-0.076200><4.165603,0.035000,0.076200> rotate<0,0.000000,0> translate<22.809197,-1.535000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.809197,-1.535000,16.771656>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.910797,-1.535000,16.873256>}
box{<0,0,-0.076200><0.143684,0.035000,0.076200> rotate<0,-44.997030,0> translate<22.809197,-1.535000,16.771656> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.852338,0.000000,17.373600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.276984,0.000000,17.373600>}
box{<0,0,-0.076200><1.424647,0.035000,0.076200> rotate<0,0.000000,0> translate<22.852338,0.000000,17.373600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.852338,-1.535000,17.373600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,17.373600>}
box{<0,0,-0.076200><4.122463,0.035000,0.076200> rotate<0,0.000000,0> translate<22.852338,-1.535000,17.373600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.874506,0.000000,20.615400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.342600,0.000000,20.147306>}
box{<0,0,-0.076200><0.661985,0.035000,0.076200> rotate<0,44.997030,0> translate<22.874506,0.000000,20.615400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.910797,-1.535000,16.873256>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.910797,-1.535000,17.315141>}
box{<0,0,-0.076200><0.441884,0.035000,0.076200> rotate<0,90.000000,0> translate<22.910797,-1.535000,17.315141> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.910797,-1.535000,16.916400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,16.916400>}
box{<0,0,-0.076200><4.064003,0.035000,0.076200> rotate<0,0.000000,0> translate<22.910797,-1.535000,16.916400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.910797,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,17.068800>}
box{<0,0,-0.076200><4.064003,0.035000,0.076200> rotate<0,0.000000,0> translate<22.910797,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.910797,0.000000,17.099616>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.910797,0.000000,17.315141>}
box{<0,0,-0.076200><0.215525,0.035000,0.076200> rotate<0,90.000000,0> translate<22.910797,0.000000,17.315141> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.910797,0.000000,17.099616>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.094016,0.000000,16.916397>}
box{<0,0,-0.076200><0.259110,0.035000,0.076200> rotate<0,44.997030,0> translate<22.910797,0.000000,17.099616> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.910797,0.000000,17.221200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.124584,0.000000,17.221200>}
box{<0,0,-0.076200><1.213787,0.035000,0.076200> rotate<0,0.000000,0> translate<22.910797,0.000000,17.221200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.910797,-1.535000,17.221200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,17.221200>}
box{<0,0,-0.076200><4.064003,0.035000,0.076200> rotate<0,0.000000,0> translate<22.910797,-1.535000,17.221200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.941613,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.972184,0.000000,17.068800>}
box{<0,0,-0.076200><1.030572,0.035000,0.076200> rotate<0,0.000000,0> translate<22.941613,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.023272,0.000000,18.791200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.107250,0.000000,18.813703>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-14.999808,0> translate<23.023272,0.000000,18.791200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.023272,0.000000,20.151597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.107250,0.000000,20.129094>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,14.999808,0> translate<23.023272,0.000000,20.151597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.023272,0.000000,21.813800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.107250,0.000000,21.836303>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-14.999808,0> translate<23.023272,0.000000,21.813800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.035228,0.000000,17.592800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.070850,0.000000,17.557175>}
box{<0,0,-0.076200><0.050379,0.035000,0.076200> rotate<0,44.999543,0> translate<23.035228,0.000000,17.592800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.035228,0.000000,18.749997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.070850,0.000000,18.785622>}
box{<0,0,-0.076200><0.050379,0.035000,0.076200> rotate<0,-44.999543,0> translate<23.035228,0.000000,18.749997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.070850,0.000000,17.557175>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.146147,0.000000,17.513703>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,29.997566,0> translate<23.070850,0.000000,17.557175> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.070850,0.000000,18.785622>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.146147,0.000000,18.829094>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-29.997566,0> translate<23.070850,0.000000,18.785622> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.074488,0.000000,21.772597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.208397,0.000000,21.638687>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<23.074488,0.000000,21.772597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.094013,0.000000,16.916400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.819784,0.000000,16.916400>}
box{<0,0,-0.076200><0.725772,0.035000,0.076200> rotate<0,0.000000,0> translate<23.094013,0.000000,16.916400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.094016,0.000000,16.916397>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.819781,0.000000,16.916397>}
box{<0,0,-0.076200><0.725766,0.035000,0.076200> rotate<0,0.000000,0> translate<23.094016,0.000000,16.916397> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.107250,0.000000,18.813703>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.182547,0.000000,18.857175>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-29.997566,0> translate<23.107250,0.000000,18.813703> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.107250,0.000000,20.129094>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.182547,0.000000,20.085622>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,29.997566,0> translate<23.107250,0.000000,20.129094> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.107250,0.000000,21.836303>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.182547,0.000000,21.879775>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-29.997566,0> translate<23.107250,0.000000,21.836303> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.128541,0.000000,23.139400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.182547,0.000000,23.108222>}
box{<0,0,-0.076200><0.062360,0.035000,0.076200> rotate<0,29.996112,0> translate<23.128541,0.000000,23.139400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.128541,0.000000,23.139400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.253016,0.000000,23.139400>}
box{<0,0,-0.076200><2.124475,0.035000,0.076200> rotate<0,0.000000,0> translate<23.128541,0.000000,23.139400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.128547,0.000000,20.116800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.342600,0.000000,20.116800>}
box{<0,0,-0.076200><0.214053,0.035000,0.076200> rotate<0,0.000000,0> translate<23.128547,0.000000,20.116800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.146147,0.000000,17.513703>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.230125,0.000000,17.491200>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,14.999808,0> translate<23.146147,0.000000,17.513703> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.146147,0.000000,18.829094>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.230125,0.000000,18.851597>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-14.999808,0> translate<23.146147,0.000000,18.829094> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.182547,0.000000,18.857175>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.218172,0.000000,18.892800>}
box{<0,0,-0.076200><0.050381,0.035000,0.076200> rotate<0,-44.997030,0> translate<23.182547,0.000000,18.857175> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.182547,0.000000,20.085622>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.218172,0.000000,20.049997>}
box{<0,0,-0.076200><0.050381,0.035000,0.076200> rotate<0,44.997030,0> translate<23.182547,0.000000,20.085622> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.182547,0.000000,21.879775>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.244022,0.000000,21.941250>}
box{<0,0,-0.076200><0.086939,0.035000,0.076200> rotate<0,-44.997030,0> translate<23.182547,0.000000,21.879775> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.182547,0.000000,23.108222>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.244022,0.000000,23.046747>}
box{<0,0,-0.076200><0.086939,0.035000,0.076200> rotate<0,44.997030,0> translate<23.182547,0.000000,23.108222> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.206284,0.000000,21.640800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,21.640800>}
box{<0,0,-0.076200><3.768516,0.035000,0.076200> rotate<0,0.000000,0> translate<23.206284,0.000000,21.640800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.208397,0.000000,21.287291>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.208397,0.000000,21.638687>}
box{<0,0,-0.076200><0.351397,0.035000,0.076200> rotate<0,90.000000,0> translate<23.208397,0.000000,21.638687> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.208397,0.000000,21.287291>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.845491,0.000000,20.650197>}
box{<0,0,-0.076200><0.900987,0.035000,0.076200> rotate<0,44.997030,0> translate<23.208397,0.000000,21.287291> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.208397,0.000000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,21.336000>}
box{<0,0,-0.076200><3.766403,0.035000,0.076200> rotate<0,0.000000,0> translate<23.208397,0.000000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.208397,0.000000,21.488400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,21.488400>}
box{<0,0,-0.076200><3.766403,0.035000,0.076200> rotate<0,0.000000,0> translate<23.208397,0.000000,21.488400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.218172,0.000000,18.892800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.268287,0.000000,18.892800>}
box{<0,0,-0.076200><1.050116,0.035000,0.076200> rotate<0,0.000000,0> translate<23.218172,0.000000,18.892800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.218172,0.000000,20.049997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.342600,0.000000,20.049997>}
box{<0,0,-0.076200><0.124428,0.035000,0.076200> rotate<0,0.000000,0> translate<23.218172,0.000000,20.049997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.230125,0.000000,17.491200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.647403,0.000000,17.491197>}
box{<0,0,-0.076200><0.417278,0.035000,0.076200> rotate<0,0.000429,0> translate<23.230125,0.000000,17.491200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.230125,0.000000,18.851597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.647403,0.000000,18.851597>}
box{<0,0,-0.076200><0.417278,0.035000,0.076200> rotate<0,0.000000,0> translate<23.230125,0.000000,18.851597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.244022,0.000000,21.941250>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.287494,0.000000,22.016547>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-59.996495,0> translate<23.244022,0.000000,21.941250> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.244022,0.000000,23.046747>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.287494,0.000000,22.971450>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,59.996495,0> translate<23.244022,0.000000,23.046747> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.246531,0.000000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,21.945600>}
box{<0,0,-0.076200><3.728269,0.035000,0.076200> rotate<0,0.000000,0> translate<23.246531,0.000000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.263853,0.000000,23.012400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,23.012400>}
box{<0,0,-0.076200><3.710947,0.035000,0.076200> rotate<0,0.000000,0> translate<23.263853,0.000000,23.012400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.287494,0.000000,22.016547>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.309997,0.000000,22.100525>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-74.994252,0> translate<23.287494,0.000000,22.016547> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.287494,0.000000,22.971450>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.309997,0.000000,22.887472>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,74.994252,0> translate<23.287494,0.000000,22.971450> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.309319,0.000000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,22.098000>}
box{<0,0,-0.076200><3.665481,0.035000,0.076200> rotate<0,0.000000,0> translate<23.309319,0.000000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.309994,0.000000,22.417803>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.309997,0.000000,22.100525>}
box{<0,0,-0.076200><0.317278,0.035000,0.076200> rotate<0,89.993496,0> translate<23.309994,0.000000,22.417803> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.309997,0.000000,22.250400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,22.250400>}
box{<0,0,-0.076200><3.664803,0.035000,0.076200> rotate<0,0.000000,0> translate<23.309997,0.000000,22.250400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.309997,0.000000,22.402800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,22.402800>}
box{<0,0,-0.076200><3.664803,0.035000,0.076200> rotate<0,0.000000,0> translate<23.309997,0.000000,22.402800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.309997,0.000000,22.570191>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.309997,0.000000,22.887472>}
box{<0,0,-0.076200><0.317281,0.035000,0.076200> rotate<0,90.000000,0> translate<23.309997,0.000000,22.887472> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.309997,0.000000,22.707600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,22.707600>}
box{<0,0,-0.076200><3.664803,0.035000,0.076200> rotate<0,0.000000,0> translate<23.309997,0.000000,22.707600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.309997,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,22.860000>}
box{<0,0,-0.076200><3.664803,0.035000,0.076200> rotate<0,0.000000,0> translate<23.309997,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.312088,0.000000,21.183600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,21.183600>}
box{<0,0,-0.076200><3.662713,0.035000,0.076200> rotate<0,0.000000,0> translate<23.312088,0.000000,21.183600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.342600,0.000000,20.147306>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.342600,0.000000,20.049997>}
box{<0,0,-0.076200><0.097309,0.035000,0.076200> rotate<0,-90.000000,0> translate<23.342600,0.000000,20.049997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.464488,0.000000,21.031200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,21.031200>}
box{<0,0,-0.076200><3.510313,0.035000,0.076200> rotate<0,0.000000,0> translate<23.464488,0.000000,21.031200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.616888,0.000000,20.878800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,20.878800>}
box{<0,0,-0.076200><3.357913,0.035000,0.076200> rotate<0,0.000000,0> translate<23.616888,0.000000,20.878800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.647403,0.000000,17.491197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.647403,0.000000,18.095188>}
box{<0,0,-0.076200><0.603991,0.035000,0.076200> rotate<0,90.000000,0> translate<23.647403,0.000000,18.095188> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.647403,0.000000,17.526000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.799791,0.000000,17.526000>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<23.647403,0.000000,17.526000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.647403,0.000000,17.678400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.799791,0.000000,17.678400>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<23.647403,0.000000,17.678400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.647403,0.000000,17.830800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.799791,0.000000,17.830800>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<23.647403,0.000000,17.830800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.647403,0.000000,17.983200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.799791,0.000000,17.983200>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<23.647403,0.000000,17.983200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.647403,0.000000,18.095188>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.799791,0.000000,18.095188>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<23.647403,0.000000,18.095188> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.647403,0.000000,18.247609>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.647403,0.000000,18.851597>}
box{<0,0,-0.076200><0.603988,0.035000,0.076200> rotate<0,90.000000,0> translate<23.647403,0.000000,18.851597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.647403,0.000000,18.247609>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.799791,0.000000,18.247609>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<23.647403,0.000000,18.247609> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.647403,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.799791,0.000000,18.288000>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<23.647403,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.647403,0.000000,18.440400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.799791,0.000000,18.440400>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<23.647403,0.000000,18.440400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.647403,0.000000,18.592800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.799791,0.000000,18.592800>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<23.647403,0.000000,18.592800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.647403,0.000000,18.745200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.799791,0.000000,18.745200>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<23.647403,0.000000,18.745200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.769288,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,20.726400>}
box{<0,0,-0.076200><3.205513,0.035000,0.076200> rotate<0,0.000000,0> translate<23.769288,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.799791,0.000000,17.491197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.217072,0.000000,17.491200>}
box{<0,0,-0.076200><0.417281,0.035000,0.076200> rotate<0,-0.000429,0> translate<23.799791,0.000000,17.491197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.799791,0.000000,18.095188>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.799791,0.000000,17.491197>}
box{<0,0,-0.076200><0.603991,0.035000,0.076200> rotate<0,-90.000000,0> translate<23.799791,0.000000,17.491197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.799791,0.000000,18.851597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.799791,0.000000,18.247609>}
box{<0,0,-0.076200><0.603988,0.035000,0.076200> rotate<0,-90.000000,0> translate<23.799791,0.000000,18.247609> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.799791,0.000000,18.851597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.217072,0.000000,18.851597>}
box{<0,0,-0.076200><0.417281,0.035000,0.076200> rotate<0,0.000000,0> translate<23.799791,0.000000,18.851597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.819781,0.000000,16.916397>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.333200,0.000000,17.429816>}
box{<0,0,-0.076200><0.726084,0.035000,0.076200> rotate<0,-44.997030,0> translate<23.819781,0.000000,16.916397> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.845491,0.000000,20.650197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.881416,0.000000,20.650197>}
box{<0,0,-0.076200><0.035925,0.035000,0.076200> rotate<0,0.000000,0> translate<23.845491,0.000000,20.650197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.881416,0.000000,20.650197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.104597,0.000000,20.427016>}
box{<0,0,-0.076200><0.315626,0.035000,0.076200> rotate<0,44.997030,0> translate<23.881416,0.000000,20.650197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.907563,-1.535000,29.006800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.952197,-1.535000,29.051434>}
box{<0,0,-0.076200><0.063123,0.035000,0.076200> rotate<0,-44.997030,0> translate<23.907563,-1.535000,29.006800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.952197,-1.535000,29.051434>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.952197,-1.535000,30.683200>}
box{<0,0,-0.076200><1.631766,0.035000,0.076200> rotate<0,90.000000,0> translate<23.952197,-1.535000,30.683200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.952197,-1.535000,29.108400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,29.108400>}
box{<0,0,-0.076200><3.022603,0.035000,0.076200> rotate<0,0.000000,0> translate<23.952197,-1.535000,29.108400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.952197,-1.535000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,29.260800>}
box{<0,0,-0.076200><3.022603,0.035000,0.076200> rotate<0,0.000000,0> translate<23.952197,-1.535000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.952197,-1.535000,29.413200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,29.413200>}
box{<0,0,-0.076200><3.022603,0.035000,0.076200> rotate<0,0.000000,0> translate<23.952197,-1.535000,29.413200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.952197,-1.535000,29.565600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,29.565600>}
box{<0,0,-0.076200><3.022603,0.035000,0.076200> rotate<0,0.000000,0> translate<23.952197,-1.535000,29.565600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.952197,-1.535000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,29.718000>}
box{<0,0,-0.076200><3.022603,0.035000,0.076200> rotate<0,0.000000,0> translate<23.952197,-1.535000,29.718000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.952197,-1.535000,29.870400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,29.870400>}
box{<0,0,-0.076200><3.022603,0.035000,0.076200> rotate<0,0.000000,0> translate<23.952197,-1.535000,29.870400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.952197,-1.535000,30.022800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,30.022800>}
box{<0,0,-0.076200><3.022603,0.035000,0.076200> rotate<0,0.000000,0> translate<23.952197,-1.535000,30.022800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.952197,-1.535000,30.175200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,30.175200>}
box{<0,0,-0.076200><3.022603,0.035000,0.076200> rotate<0,0.000000,0> translate<23.952197,-1.535000,30.175200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.952197,-1.535000,30.327600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,30.327600>}
box{<0,0,-0.076200><3.022603,0.035000,0.076200> rotate<0,0.000000,0> translate<23.952197,-1.535000,30.327600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.952197,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,30.480000>}
box{<0,0,-0.076200><3.022603,0.035000,0.076200> rotate<0,0.000000,0> translate<23.952197,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.952197,-1.535000,30.632400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,30.632400>}
box{<0,0,-0.076200><3.022603,0.035000,0.076200> rotate<0,0.000000,0> translate<23.952197,-1.535000,30.632400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.952197,-1.535000,30.683200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,30.683200>}
box{<0,0,-0.076200><3.022603,0.035000,0.076200> rotate<0,0.000000,0> translate<23.952197,-1.535000,30.683200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.957612,0.000000,20.574000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,20.574000>}
box{<0,0,-0.076200><3.017188,0.035000,0.076200> rotate<0,0.000000,0> translate<23.957612,0.000000,20.574000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.104597,0.000000,20.049997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.104597,0.000000,20.427016>}
box{<0,0,-0.076200><0.377019,0.035000,0.076200> rotate<0,90.000000,0> translate<24.104597,0.000000,20.427016> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.104597,0.000000,20.049997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.268287,0.000000,20.049997>}
box{<0,0,-0.076200><0.163691,0.035000,0.076200> rotate<0,0.000000,0> translate<24.104597,0.000000,20.049997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.104597,0.000000,20.116800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,20.116800>}
box{<0,0,-0.076200><2.870203,0.035000,0.076200> rotate<0,0.000000,0> translate<24.104597,0.000000,20.116800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.104597,0.000000,20.269200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,20.269200>}
box{<0,0,-0.076200><2.870203,0.035000,0.076200> rotate<0,0.000000,0> translate<24.104597,0.000000,20.269200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.104597,0.000000,20.421600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,20.421600>}
box{<0,0,-0.076200><2.870203,0.035000,0.076200> rotate<0,0.000000,0> translate<24.104597,0.000000,20.421600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.135416,0.000000,16.154400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.872016,0.000000,16.891000>}
box{<0,0,-0.076200><1.041710,0.035000,0.076200> rotate<0,-44.997030,0> translate<24.135416,0.000000,16.154400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.135416,0.000000,16.154400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,16.154400>}
box{<0,0,-0.076200><2.839384,0.035000,0.076200> rotate<0,0.000000,0> translate<24.135416,0.000000,16.154400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.217072,0.000000,17.491200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.301050,0.000000,17.513703>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-14.999808,0> translate<24.217072,0.000000,17.491200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.217072,0.000000,18.851597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.301050,0.000000,18.829094>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,14.999808,0> translate<24.217072,0.000000,18.851597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.268287,0.000000,18.892800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.325834,0.000000,18.950350>}
box{<0,0,-0.076200><0.081386,0.035000,0.076200> rotate<0,-44.998586,0> translate<24.268287,0.000000,18.892800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.268287,0.000000,20.049997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.364284,0.000000,19.953997>}
box{<0,0,-0.076200><0.135762,0.035000,0.076200> rotate<0,44.997963,0> translate<24.268287,0.000000,20.049997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.273084,0.000000,18.897600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.333200,0.000000,18.897600>}
box{<0,0,-0.076200><0.060116,0.035000,0.076200> rotate<0,0.000000,0> translate<24.273084,0.000000,18.897600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.287816,0.000000,16.306800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,16.306800>}
box{<0,0,-0.076200><2.686984,0.035000,0.076200> rotate<0,0.000000,0> translate<24.287816,0.000000,16.306800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.301050,0.000000,17.513703>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.333200,0.000000,17.532266>}
box{<0,0,-0.076200><0.037124,0.035000,0.076200> rotate<0,-29.998941,0> translate<24.301050,0.000000,17.513703> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.301050,0.000000,18.829094>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.333200,0.000000,18.810531>}
box{<0,0,-0.076200><0.037124,0.035000,0.076200> rotate<0,29.998941,0> translate<24.301050,0.000000,18.829094> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.322347,0.000000,17.526000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.333200,0.000000,17.526000>}
box{<0,0,-0.076200><0.010853,0.035000,0.076200> rotate<0,0.000000,0> translate<24.322347,0.000000,17.526000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.325834,0.000000,18.950350>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.333200,0.000000,18.942981>}
box{<0,0,-0.076200><0.010419,0.035000,0.076200> rotate<0,45.009181,0> translate<24.325834,0.000000,18.950350> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.333200,0.000000,17.532266>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.333200,0.000000,17.429816>}
box{<0,0,-0.076200><0.102450,0.035000,0.076200> rotate<0,-90.000000,0> translate<24.333200,0.000000,17.429816> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.333200,0.000000,18.942981>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.333200,0.000000,18.810531>}
box{<0,0,-0.076200><0.132450,0.035000,0.076200> rotate<0,-90.000000,0> translate<24.333200,0.000000,18.810531> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.353884,0.000000,19.964400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,19.964400>}
box{<0,0,-0.076200><2.620916,0.035000,0.076200> rotate<0,0.000000,0> translate<24.353884,0.000000,19.964400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.364284,0.000000,19.953997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.399816,0.000000,19.953997>}
box{<0,0,-0.076200><0.035531,0.035000,0.076200> rotate<0,0.000000,0> translate<24.364284,0.000000,19.953997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.399816,0.000000,19.953997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.095197,0.000000,19.258616>}
box{<0,0,-0.076200><0.983418,0.035000,0.076200> rotate<0,44.997030,0> translate<24.399816,0.000000,19.953997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.440216,0.000000,16.459200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,16.459200>}
box{<0,0,-0.076200><2.534584,0.035000,0.076200> rotate<0,0.000000,0> translate<24.440216,0.000000,16.459200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.541813,0.000000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,19.812000>}
box{<0,0,-0.076200><2.432987,0.035000,0.076200> rotate<0,0.000000,0> translate<24.541813,0.000000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.592616,0.000000,16.611600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,16.611600>}
box{<0,0,-0.076200><2.382184,0.035000,0.076200> rotate<0,0.000000,0> translate<24.592616,0.000000,16.611600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.694213,0.000000,19.659600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,19.659600>}
box{<0,0,-0.076200><2.280587,0.035000,0.076200> rotate<0,0.000000,0> translate<24.694213,0.000000,19.659600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.745016,0.000000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,16.764000>}
box{<0,0,-0.076200><2.229784,0.035000,0.076200> rotate<0,0.000000,0> translate<24.745016,0.000000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.846613,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,19.507200>}
box{<0,0,-0.076200><2.128187,0.035000,0.076200> rotate<0,0.000000,0> translate<24.846613,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.872016,0.000000,16.891000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.095197,0.000000,17.114181>}
box{<0,0,-0.076200><0.315626,0.035000,0.076200> rotate<0,-44.997030,0> translate<24.872016,0.000000,16.891000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.897416,0.000000,16.916400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,16.916400>}
box{<0,0,-0.076200><2.077384,0.035000,0.076200> rotate<0,0.000000,0> translate<24.897416,0.000000,16.916400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.999013,0.000000,19.354800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,19.354800>}
box{<0,0,-0.076200><1.975787,0.035000,0.076200> rotate<0,0.000000,0> translate<24.999013,0.000000,19.354800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.049816,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,17.068800>}
box{<0,0,-0.076200><1.924984,0.035000,0.076200> rotate<0,0.000000,0> translate<25.049816,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.095197,0.000000,17.114181>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.095197,0.000000,19.258616>}
box{<0,0,-0.076200><2.144434,0.035000,0.076200> rotate<0,90.000000,0> translate<25.095197,0.000000,19.258616> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.095197,0.000000,17.221200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,17.221200>}
box{<0,0,-0.076200><1.879603,0.035000,0.076200> rotate<0,0.000000,0> translate<25.095197,0.000000,17.221200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.095197,0.000000,17.373600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,17.373600>}
box{<0,0,-0.076200><1.879603,0.035000,0.076200> rotate<0,0.000000,0> translate<25.095197,0.000000,17.373600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.095197,0.000000,17.526000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,17.526000>}
box{<0,0,-0.076200><1.879603,0.035000,0.076200> rotate<0,0.000000,0> translate<25.095197,0.000000,17.526000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.095197,0.000000,17.678400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,17.678400>}
box{<0,0,-0.076200><1.879603,0.035000,0.076200> rotate<0,0.000000,0> translate<25.095197,0.000000,17.678400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.095197,0.000000,17.830800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,17.830800>}
box{<0,0,-0.076200><1.879603,0.035000,0.076200> rotate<0,0.000000,0> translate<25.095197,0.000000,17.830800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.095197,0.000000,17.983200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,17.983200>}
box{<0,0,-0.076200><1.879603,0.035000,0.076200> rotate<0,0.000000,0> translate<25.095197,0.000000,17.983200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.095197,0.000000,18.135600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,18.135600>}
box{<0,0,-0.076200><1.879603,0.035000,0.076200> rotate<0,0.000000,0> translate<25.095197,0.000000,18.135600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.095197,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,18.288000>}
box{<0,0,-0.076200><1.879603,0.035000,0.076200> rotate<0,0.000000,0> translate<25.095197,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.095197,0.000000,18.440400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,18.440400>}
box{<0,0,-0.076200><1.879603,0.035000,0.076200> rotate<0,0.000000,0> translate<25.095197,0.000000,18.440400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.095197,0.000000,18.592800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,18.592800>}
box{<0,0,-0.076200><1.879603,0.035000,0.076200> rotate<0,0.000000,0> translate<25.095197,0.000000,18.592800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.095197,0.000000,18.745200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,18.745200>}
box{<0,0,-0.076200><1.879603,0.035000,0.076200> rotate<0,0.000000,0> translate<25.095197,0.000000,18.745200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.095197,0.000000,18.897600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,18.897600>}
box{<0,0,-0.076200><1.879603,0.035000,0.076200> rotate<0,0.000000,0> translate<25.095197,0.000000,18.897600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.095197,0.000000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,19.050000>}
box{<0,0,-0.076200><1.879603,0.035000,0.076200> rotate<0,0.000000,0> translate<25.095197,0.000000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.095197,0.000000,19.202400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,19.202400>}
box{<0,0,-0.076200><1.879603,0.035000,0.076200> rotate<0,0.000000,0> translate<25.095197,0.000000,19.202400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.253016,0.000000,23.139400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.608616,0.000000,23.495000>}
box{<0,0,-0.076200><0.502894,0.035000,0.076200> rotate<0,-44.997030,0> translate<25.253016,0.000000,23.139400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.278416,0.000000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,23.164800>}
box{<0,0,-0.076200><1.696384,0.035000,0.076200> rotate<0,0.000000,0> translate<25.278416,0.000000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.430816,0.000000,23.317200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,23.317200>}
box{<0,0,-0.076200><1.543984,0.035000,0.076200> rotate<0,0.000000,0> translate<25.430816,0.000000,23.317200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.583216,0.000000,23.469600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,23.469600>}
box{<0,0,-0.076200><1.391584,0.035000,0.076200> rotate<0,0.000000,0> translate<25.583216,0.000000,23.469600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.608616,0.000000,23.495000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.831797,0.000000,23.718181>}
box{<0,0,-0.076200><0.315626,0.035000,0.076200> rotate<0,-44.997030,0> translate<25.608616,0.000000,23.495000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.735616,0.000000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,23.622000>}
box{<0,0,-0.076200><1.239184,0.035000,0.076200> rotate<0,0.000000,0> translate<25.735616,0.000000,23.622000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.831797,0.000000,23.718181>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.831797,0.000000,24.003000>}
box{<0,0,-0.076200><0.284819,0.035000,0.076200> rotate<0,90.000000,0> translate<25.831797,0.000000,24.003000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.831797,0.000000,23.774400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,23.774400>}
box{<0,0,-0.076200><1.143003,0.035000,0.076200> rotate<0,0.000000,0> translate<25.831797,0.000000,23.774400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.831797,0.000000,23.926800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,23.926800>}
box{<0,0,-0.076200><1.143003,0.035000,0.076200> rotate<0,0.000000,0> translate<25.831797,0.000000,23.926800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.831797,0.000000,24.003000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.193563,0.000000,24.003000>}
box{<0,0,-0.076200><0.361766,0.035000,0.076200> rotate<0,0.000000,0> translate<25.831797,0.000000,24.003000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.193563,0.000000,24.003000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.238197,0.000000,24.047634>}
box{<0,0,-0.076200><0.063123,0.035000,0.076200> rotate<0,-44.997030,0> translate<26.193563,0.000000,24.003000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.193563,0.000000,27.558997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.238197,0.000000,27.514363>}
box{<0,0,-0.076200><0.063123,0.035000,0.076200> rotate<0,44.997030,0> translate<26.193563,0.000000,27.558997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.238197,0.000000,24.047634>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.238197,0.000000,27.514363>}
box{<0,0,-0.076200><3.466728,0.035000,0.076200> rotate<0,90.000000,0> translate<26.238197,0.000000,27.514363> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.238197,0.000000,24.079200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,24.079200>}
box{<0,0,-0.076200><0.736603,0.035000,0.076200> rotate<0,0.000000,0> translate<26.238197,0.000000,24.079200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.238197,0.000000,24.231600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,24.231600>}
box{<0,0,-0.076200><0.736603,0.035000,0.076200> rotate<0,0.000000,0> translate<26.238197,0.000000,24.231600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.238197,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,24.384000>}
box{<0,0,-0.076200><0.736603,0.035000,0.076200> rotate<0,0.000000,0> translate<26.238197,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.238197,0.000000,24.536400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,24.536400>}
box{<0,0,-0.076200><0.736603,0.035000,0.076200> rotate<0,0.000000,0> translate<26.238197,0.000000,24.536400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.238197,0.000000,24.688800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,24.688800>}
box{<0,0,-0.076200><0.736603,0.035000,0.076200> rotate<0,0.000000,0> translate<26.238197,0.000000,24.688800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.238197,0.000000,24.841200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,24.841200>}
box{<0,0,-0.076200><0.736603,0.035000,0.076200> rotate<0,0.000000,0> translate<26.238197,0.000000,24.841200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.238197,0.000000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,24.993600>}
box{<0,0,-0.076200><0.736603,0.035000,0.076200> rotate<0,0.000000,0> translate<26.238197,0.000000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.238197,0.000000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,25.146000>}
box{<0,0,-0.076200><0.736603,0.035000,0.076200> rotate<0,0.000000,0> translate<26.238197,0.000000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.238197,0.000000,25.298400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,25.298400>}
box{<0,0,-0.076200><0.736603,0.035000,0.076200> rotate<0,0.000000,0> translate<26.238197,0.000000,25.298400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.238197,0.000000,25.450800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,25.450800>}
box{<0,0,-0.076200><0.736603,0.035000,0.076200> rotate<0,0.000000,0> translate<26.238197,0.000000,25.450800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.238197,0.000000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,25.603200>}
box{<0,0,-0.076200><0.736603,0.035000,0.076200> rotate<0,0.000000,0> translate<26.238197,0.000000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.238197,0.000000,25.755600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,25.755600>}
box{<0,0,-0.076200><0.736603,0.035000,0.076200> rotate<0,0.000000,0> translate<26.238197,0.000000,25.755600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.238197,0.000000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,25.908000>}
box{<0,0,-0.076200><0.736603,0.035000,0.076200> rotate<0,0.000000,0> translate<26.238197,0.000000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.238197,0.000000,26.060400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,26.060400>}
box{<0,0,-0.076200><0.736603,0.035000,0.076200> rotate<0,0.000000,0> translate<26.238197,0.000000,26.060400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.238197,0.000000,26.212800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,26.212800>}
box{<0,0,-0.076200><0.736603,0.035000,0.076200> rotate<0,0.000000,0> translate<26.238197,0.000000,26.212800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.238197,0.000000,26.365200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,26.365200>}
box{<0,0,-0.076200><0.736603,0.035000,0.076200> rotate<0,0.000000,0> translate<26.238197,0.000000,26.365200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.238197,0.000000,26.517600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,26.517600>}
box{<0,0,-0.076200><0.736603,0.035000,0.076200> rotate<0,0.000000,0> translate<26.238197,0.000000,26.517600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.238197,0.000000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,26.670000>}
box{<0,0,-0.076200><0.736603,0.035000,0.076200> rotate<0,0.000000,0> translate<26.238197,0.000000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.238197,0.000000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,26.822400>}
box{<0,0,-0.076200><0.736603,0.035000,0.076200> rotate<0,0.000000,0> translate<26.238197,0.000000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.238197,0.000000,26.974800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,26.974800>}
box{<0,0,-0.076200><0.736603,0.035000,0.076200> rotate<0,0.000000,0> translate<26.238197,0.000000,26.974800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.238197,0.000000,27.127200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,27.127200>}
box{<0,0,-0.076200><0.736603,0.035000,0.076200> rotate<0,0.000000,0> translate<26.238197,0.000000,27.127200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.238197,0.000000,27.279600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,27.279600>}
box{<0,0,-0.076200><0.736603,0.035000,0.076200> rotate<0,0.000000,0> translate<26.238197,0.000000,27.279600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.238197,0.000000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,27.432000>}
box{<0,0,-0.076200><0.736603,0.035000,0.076200> rotate<0,0.000000,0> translate<26.238197,0.000000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,7.696197>}
box{<0,0,-0.076200><21.259803,0.035000,0.076200> rotate<0,-90.000000,0> translate<26.974800,0.000000,7.696197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,30.683200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,7.696197>}
box{<0,0,-0.076200><22.987003,0.035000,0.076200> rotate<0,-90.000000,0> translate<26.974800,-1.535000,7.696197> }
texture{col_pol}
}
#end
union{
//Holes(fast)/Vias
//Holes(fast)/Board
texture{col_hls}
}
#if(pcb_silkscreen=on)
//Silk Screen
union{
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.234359,0.000000,10.277853>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.107250,0.000000,10.150744>}
box{<0,0,-0.063500><0.179760,0.036000,0.063500> rotate<0,-44.997030,0> translate<25.107250,0.000000,10.150744> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.107250,0.000000,10.150744>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.107250,0.000000,9.896525>}
box{<0,0,-0.063500><0.254219,0.036000,0.063500> rotate<0,-90.000000,0> translate<25.107250,0.000000,9.896525> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.107250,0.000000,9.896525>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.234359,0.000000,9.769419>}
box{<0,0,-0.063500><0.179758,0.036000,0.063500> rotate<0,44.996326,0> translate<25.107250,0.000000,9.896525> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.234359,0.000000,9.769419>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.742794,0.000000,9.769419>}
box{<0,0,-0.063500><0.508434,0.036000,0.063500> rotate<0,0.000000,0> translate<25.234359,0.000000,9.769419> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.742794,0.000000,9.769419>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.869900,0.000000,9.896525>}
box{<0,0,-0.063500><0.179755,0.036000,0.063500> rotate<0,-44.997030,0> translate<25.742794,0.000000,9.769419> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.869900,0.000000,9.896525>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.869900,0.000000,10.150744>}
box{<0,0,-0.063500><0.254219,0.036000,0.063500> rotate<0,90.000000,0> translate<25.869900,0.000000,10.150744> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.869900,0.000000,10.150744>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.742794,0.000000,10.277853>}
box{<0,0,-0.063500><0.179758,0.036000,0.063500> rotate<0,44.997734,0> translate<25.742794,0.000000,10.277853> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.107250,0.000000,10.587997>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.234359,0.000000,10.587997>}
box{<0,0,-0.063500><0.127109,0.036000,0.063500> rotate<0,0.000000,0> translate<25.107250,0.000000,10.587997> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.234359,0.000000,10.587997>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.488575,0.000000,10.842213>}
box{<0,0,-0.063500><0.359515,0.036000,0.063500> rotate<0,-44.997030,0> translate<25.234359,0.000000,10.587997> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.488575,0.000000,10.842213>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.234359,0.000000,11.096431>}
box{<0,0,-0.063500><0.359517,0.036000,0.063500> rotate<0,44.997382,0> translate<25.234359,0.000000,11.096431> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.234359,0.000000,11.096431>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.107250,0.000000,11.096431>}
box{<0,0,-0.063500><0.127109,0.036000,0.063500> rotate<0,0.000000,0> translate<25.107250,0.000000,11.096431> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.488575,0.000000,10.842213>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.869900,0.000000,10.842213>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<25.488575,0.000000,10.842213> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.869900,0.000000,11.406575>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.107250,0.000000,11.406575>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,0.000000,0> translate<25.107250,0.000000,11.406575> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.107250,0.000000,11.406575>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.107250,0.000000,11.787900>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,90.000000,0> translate<25.107250,0.000000,11.787900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.107250,0.000000,11.787900>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.234359,0.000000,11.915009>}
box{<0,0,-0.063500><0.179760,0.036000,0.063500> rotate<0,-44.997030,0> translate<25.107250,0.000000,11.787900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.234359,0.000000,11.915009>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.488575,0.000000,11.915009>}
box{<0,0,-0.063500><0.254216,0.036000,0.063500> rotate<0,0.000000,0> translate<25.234359,0.000000,11.915009> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.488575,0.000000,11.915009>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.615684,0.000000,11.787900>}
box{<0,0,-0.063500><0.179760,0.036000,0.063500> rotate<0,44.997030,0> translate<25.488575,0.000000,11.915009> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.615684,0.000000,11.787900>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.615684,0.000000,11.406575>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,-90.000000,0> translate<25.615684,0.000000,11.406575> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.615684,0.000000,11.660791>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.869900,0.000000,11.915009>}
box{<0,0,-0.063500><0.359517,0.036000,0.063500> rotate<0,-44.997382,0> translate<25.615684,0.000000,11.660791> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.869900,0.000000,12.225153>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.107250,0.000000,12.225153>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,0.000000,0> translate<25.107250,0.000000,12.225153> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.107250,0.000000,12.225153>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.107250,0.000000,12.733588>}
box{<0,0,-0.063500><0.508434,0.036000,0.063500> rotate<0,90.000000,0> translate<25.107250,0.000000,12.733588> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.488575,0.000000,12.225153>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.488575,0.000000,12.479369>}
box{<0,0,-0.063500><0.254216,0.036000,0.063500> rotate<0,90.000000,0> translate<25.488575,0.000000,12.479369> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.107250,0.000000,13.552166>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.234359,0.000000,13.297947>}
box{<0,0,-0.063500><0.284225,0.036000,0.063500> rotate<0,63.430762,0> translate<25.107250,0.000000,13.552166> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.234359,0.000000,13.297947>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.488575,0.000000,13.043731>}
box{<0,0,-0.063500><0.359515,0.036000,0.063500> rotate<0,44.997030,0> translate<25.234359,0.000000,13.297947> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.488575,0.000000,13.043731>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.742794,0.000000,13.043731>}
box{<0,0,-0.063500><0.254219,0.036000,0.063500> rotate<0,0.000000,0> translate<25.488575,0.000000,13.043731> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.742794,0.000000,13.043731>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.869900,0.000000,13.170838>}
box{<0,0,-0.063500><0.179755,0.036000,0.063500> rotate<0,-44.997030,0> translate<25.742794,0.000000,13.043731> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.869900,0.000000,13.170838>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.869900,0.000000,13.425056>}
box{<0,0,-0.063500><0.254219,0.036000,0.063500> rotate<0,90.000000,0> translate<25.869900,0.000000,13.425056> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.869900,0.000000,13.425056>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.742794,0.000000,13.552166>}
box{<0,0,-0.063500><0.179758,0.036000,0.063500> rotate<0,44.997734,0> translate<25.742794,0.000000,13.552166> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.742794,0.000000,13.552166>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.615684,0.000000,13.552166>}
box{<0,0,-0.063500><0.127109,0.036000,0.063500> rotate<0,0.000000,0> translate<25.615684,0.000000,13.552166> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.615684,0.000000,13.552166>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.488575,0.000000,13.425056>}
box{<0,0,-0.063500><0.179760,0.036000,0.063500> rotate<0,-44.997030,0> translate<25.488575,0.000000,13.425056> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.488575,0.000000,13.425056>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.488575,0.000000,13.043731>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,-90.000000,0> translate<25.488575,0.000000,13.043731> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.742794,0.000000,13.862309>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.869900,0.000000,13.989416>}
box{<0,0,-0.063500><0.179755,0.036000,0.063500> rotate<0,-44.997030,0> translate<25.742794,0.000000,13.862309> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.869900,0.000000,13.989416>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.869900,0.000000,14.243634>}
box{<0,0,-0.063500><0.254219,0.036000,0.063500> rotate<0,90.000000,0> translate<25.869900,0.000000,14.243634> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.869900,0.000000,14.243634>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.742794,0.000000,14.370744>}
box{<0,0,-0.063500><0.179758,0.036000,0.063500> rotate<0,44.997734,0> translate<25.742794,0.000000,14.370744> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.742794,0.000000,14.370744>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.234359,0.000000,14.370744>}
box{<0,0,-0.063500><0.508434,0.036000,0.063500> rotate<0,0.000000,0> translate<25.234359,0.000000,14.370744> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.234359,0.000000,14.370744>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.107250,0.000000,14.243634>}
box{<0,0,-0.063500><0.179760,0.036000,0.063500> rotate<0,-44.997030,0> translate<25.107250,0.000000,14.243634> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.107250,0.000000,14.243634>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.107250,0.000000,13.989416>}
box{<0,0,-0.063500><0.254219,0.036000,0.063500> rotate<0,-90.000000,0> translate<25.107250,0.000000,13.989416> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.107250,0.000000,13.989416>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.234359,0.000000,13.862309>}
box{<0,0,-0.063500><0.179758,0.036000,0.063500> rotate<0,44.996326,0> translate<25.107250,0.000000,13.989416> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.234359,0.000000,13.862309>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.361466,0.000000,13.862309>}
box{<0,0,-0.063500><0.127106,0.036000,0.063500> rotate<0,0.000000,0> translate<25.234359,0.000000,13.862309> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.361466,0.000000,13.862309>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.488575,0.000000,13.989416>}
box{<0,0,-0.063500><0.179758,0.036000,0.063500> rotate<0,-44.996326,0> translate<25.361466,0.000000,13.862309> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.488575,0.000000,13.989416>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.488575,0.000000,14.370744>}
box{<0,0,-0.063500><0.381328,0.036000,0.063500> rotate<0,90.000000,0> translate<25.488575,0.000000,14.370744> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.234359,0.000000,14.680888>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.107250,0.000000,14.807994>}
box{<0,0,-0.063500><0.179758,0.036000,0.063500> rotate<0,44.996326,0> translate<25.107250,0.000000,14.807994> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.107250,0.000000,14.807994>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.107250,0.000000,15.062213>}
box{<0,0,-0.063500><0.254219,0.036000,0.063500> rotate<0,90.000000,0> translate<25.107250,0.000000,15.062213> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.107250,0.000000,15.062213>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.234359,0.000000,15.189322>}
box{<0,0,-0.063500><0.179760,0.036000,0.063500> rotate<0,-44.997030,0> translate<25.107250,0.000000,15.062213> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.234359,0.000000,15.189322>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.361466,0.000000,15.189322>}
box{<0,0,-0.063500><0.127106,0.036000,0.063500> rotate<0,0.000000,0> translate<25.234359,0.000000,15.189322> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.361466,0.000000,15.189322>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.488575,0.000000,15.062213>}
box{<0,0,-0.063500><0.179760,0.036000,0.063500> rotate<0,44.997030,0> translate<25.361466,0.000000,15.189322> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.488575,0.000000,15.062213>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.488575,0.000000,14.935103>}
box{<0,0,-0.063500><0.127109,0.036000,0.063500> rotate<0,-90.000000,0> translate<25.488575,0.000000,14.935103> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.488575,0.000000,15.062213>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.615684,0.000000,15.189322>}
box{<0,0,-0.063500><0.179760,0.036000,0.063500> rotate<0,-44.997030,0> translate<25.488575,0.000000,15.062213> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.615684,0.000000,15.189322>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.742794,0.000000,15.189322>}
box{<0,0,-0.063500><0.127109,0.036000,0.063500> rotate<0,0.000000,0> translate<25.615684,0.000000,15.189322> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.742794,0.000000,15.189322>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.869900,0.000000,15.062213>}
box{<0,0,-0.063500><0.179758,0.036000,0.063500> rotate<0,44.997734,0> translate<25.742794,0.000000,15.189322> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.869900,0.000000,15.062213>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.869900,0.000000,14.807994>}
box{<0,0,-0.063500><0.254219,0.036000,0.063500> rotate<0,-90.000000,0> translate<25.869900,0.000000,14.807994> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.869900,0.000000,14.807994>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.742794,0.000000,14.680888>}
box{<0,0,-0.063500><0.179755,0.036000,0.063500> rotate<0,-44.997030,0> translate<25.742794,0.000000,14.680888> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.107250,0.000000,16.007900>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.234359,0.000000,15.753681>}
box{<0,0,-0.063500><0.284225,0.036000,0.063500> rotate<0,63.430762,0> translate<25.107250,0.000000,16.007900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.234359,0.000000,15.753681>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.488575,0.000000,15.499466>}
box{<0,0,-0.063500><0.359515,0.036000,0.063500> rotate<0,44.997030,0> translate<25.234359,0.000000,15.753681> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.488575,0.000000,15.499466>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.742794,0.000000,15.499466>}
box{<0,0,-0.063500><0.254219,0.036000,0.063500> rotate<0,0.000000,0> translate<25.488575,0.000000,15.499466> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.742794,0.000000,15.499466>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.869900,0.000000,15.626572>}
box{<0,0,-0.063500><0.179755,0.036000,0.063500> rotate<0,-44.997030,0> translate<25.742794,0.000000,15.499466> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.869900,0.000000,15.626572>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.869900,0.000000,15.880791>}
box{<0,0,-0.063500><0.254219,0.036000,0.063500> rotate<0,90.000000,0> translate<25.869900,0.000000,15.880791> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.869900,0.000000,15.880791>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.742794,0.000000,16.007900>}
box{<0,0,-0.063500><0.179758,0.036000,0.063500> rotate<0,44.997734,0> translate<25.742794,0.000000,16.007900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.742794,0.000000,16.007900>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.615684,0.000000,16.007900>}
box{<0,0,-0.063500><0.127109,0.036000,0.063500> rotate<0,0.000000,0> translate<25.615684,0.000000,16.007900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.615684,0.000000,16.007900>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.488575,0.000000,15.880791>}
box{<0,0,-0.063500><0.179760,0.036000,0.063500> rotate<0,-44.997030,0> translate<25.488575,0.000000,15.880791> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.488575,0.000000,15.880791>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.488575,0.000000,15.499466>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,-90.000000,0> translate<25.488575,0.000000,15.499466> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.488575,0.000000,16.318044>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.488575,0.000000,16.826478>}
box{<0,0,-0.063500><0.508434,0.036000,0.063500> rotate<0,90.000000,0> translate<25.488575,0.000000,16.826478> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.869900,0.000000,17.136622>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.107250,0.000000,17.136622>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,0.000000,0> translate<25.107250,0.000000,17.136622> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.107250,0.000000,17.136622>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.107250,0.000000,17.517947>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,90.000000,0> translate<25.107250,0.000000,17.517947> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.107250,0.000000,17.517947>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.234359,0.000000,17.645056>}
box{<0,0,-0.063500><0.179760,0.036000,0.063500> rotate<0,-44.997030,0> translate<25.107250,0.000000,17.517947> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.234359,0.000000,17.645056>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.361466,0.000000,17.645056>}
box{<0,0,-0.063500><0.127106,0.036000,0.063500> rotate<0,0.000000,0> translate<25.234359,0.000000,17.645056> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.361466,0.000000,17.645056>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.488575,0.000000,17.517947>}
box{<0,0,-0.063500><0.179760,0.036000,0.063500> rotate<0,44.997030,0> translate<25.361466,0.000000,17.645056> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.488575,0.000000,17.517947>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.615684,0.000000,17.645056>}
box{<0,0,-0.063500><0.179760,0.036000,0.063500> rotate<0,-44.997030,0> translate<25.488575,0.000000,17.517947> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.615684,0.000000,17.645056>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.742794,0.000000,17.645056>}
box{<0,0,-0.063500><0.127109,0.036000,0.063500> rotate<0,0.000000,0> translate<25.615684,0.000000,17.645056> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.742794,0.000000,17.645056>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.869900,0.000000,17.517947>}
box{<0,0,-0.063500><0.179758,0.036000,0.063500> rotate<0,44.997734,0> translate<25.742794,0.000000,17.645056> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.869900,0.000000,17.517947>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.869900,0.000000,17.136622>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,-90.000000,0> translate<25.869900,0.000000,17.136622> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.488575,0.000000,17.136622>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.488575,0.000000,17.517947>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,90.000000,0> translate<25.488575,0.000000,17.517947> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.869900,0.000000,18.082306>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.869900,0.000000,18.336525>}
box{<0,0,-0.063500><0.254219,0.036000,0.063500> rotate<0,90.000000,0> translate<25.869900,0.000000,18.336525> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.869900,0.000000,18.336525>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.742794,0.000000,18.463634>}
box{<0,0,-0.063500><0.179758,0.036000,0.063500> rotate<0,44.997734,0> translate<25.742794,0.000000,18.463634> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.742794,0.000000,18.463634>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.488575,0.000000,18.463634>}
box{<0,0,-0.063500><0.254219,0.036000,0.063500> rotate<0,0.000000,0> translate<25.488575,0.000000,18.463634> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.488575,0.000000,18.463634>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.361466,0.000000,18.336525>}
box{<0,0,-0.063500><0.179760,0.036000,0.063500> rotate<0,-44.997030,0> translate<25.361466,0.000000,18.336525> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.361466,0.000000,18.336525>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.361466,0.000000,18.082306>}
box{<0,0,-0.063500><0.254219,0.036000,0.063500> rotate<0,-90.000000,0> translate<25.361466,0.000000,18.082306> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.361466,0.000000,18.082306>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.488575,0.000000,17.955200>}
box{<0,0,-0.063500><0.179758,0.036000,0.063500> rotate<0,44.996326,0> translate<25.361466,0.000000,18.082306> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.488575,0.000000,17.955200>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.742794,0.000000,17.955200>}
box{<0,0,-0.063500><0.254219,0.036000,0.063500> rotate<0,0.000000,0> translate<25.488575,0.000000,17.955200> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.742794,0.000000,17.955200>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.869900,0.000000,18.082306>}
box{<0,0,-0.063500><0.179755,0.036000,0.063500> rotate<0,-44.997030,0> translate<25.742794,0.000000,17.955200> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.869900,0.000000,18.773778>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.107250,0.000000,18.773778>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,0.000000,0> translate<25.107250,0.000000,18.773778> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.107250,0.000000,18.773778>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.107250,0.000000,19.155103>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,90.000000,0> translate<25.107250,0.000000,19.155103> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.107250,0.000000,19.155103>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.234359,0.000000,19.282212>}
box{<0,0,-0.063500><0.179760,0.036000,0.063500> rotate<0,-44.997030,0> translate<25.107250,0.000000,19.155103> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.234359,0.000000,19.282212>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.361466,0.000000,19.282212>}
box{<0,0,-0.063500><0.127106,0.036000,0.063500> rotate<0,0.000000,0> translate<25.234359,0.000000,19.282212> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.361466,0.000000,19.282212>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.488575,0.000000,19.155103>}
box{<0,0,-0.063500><0.179760,0.036000,0.063500> rotate<0,44.997030,0> translate<25.361466,0.000000,19.282212> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.488575,0.000000,19.155103>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.615684,0.000000,19.282212>}
box{<0,0,-0.063500><0.179760,0.036000,0.063500> rotate<0,-44.997030,0> translate<25.488575,0.000000,19.155103> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.615684,0.000000,19.282212>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.742794,0.000000,19.282212>}
box{<0,0,-0.063500><0.127109,0.036000,0.063500> rotate<0,0.000000,0> translate<25.615684,0.000000,19.282212> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.742794,0.000000,19.282212>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.869900,0.000000,19.155103>}
box{<0,0,-0.063500><0.179758,0.036000,0.063500> rotate<0,44.997734,0> translate<25.742794,0.000000,19.282212> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.869900,0.000000,19.155103>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.869900,0.000000,18.773778>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,-90.000000,0> translate<25.869900,0.000000,18.773778> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.488575,0.000000,18.773778>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.488575,0.000000,19.155103>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,90.000000,0> translate<25.488575,0.000000,19.155103> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.361466,0.000000,20.410934>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.869900,0.000000,20.665150>}
box{<0,0,-0.063500><0.568446,0.036000,0.063500> rotate<0,-26.563157,0> translate<25.361466,0.000000,20.410934> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.869900,0.000000,20.665150>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.361466,0.000000,20.919369>}
box{<0,0,-0.063500><0.568448,0.036000,0.063500> rotate<0,26.563439,0> translate<25.361466,0.000000,20.919369> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.742794,0.000000,21.229513>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.234359,0.000000,21.229513>}
box{<0,0,-0.063500><0.508434,0.036000,0.063500> rotate<0,0.000000,0> translate<25.234359,0.000000,21.229513> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.234359,0.000000,21.229513>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.107250,0.000000,21.356619>}
box{<0,0,-0.063500><0.179758,0.036000,0.063500> rotate<0,44.996326,0> translate<25.107250,0.000000,21.356619> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.107250,0.000000,21.356619>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.107250,0.000000,21.610838>}
box{<0,0,-0.063500><0.254219,0.036000,0.063500> rotate<0,90.000000,0> translate<25.107250,0.000000,21.610838> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.107250,0.000000,21.610838>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.234359,0.000000,21.737947>}
box{<0,0,-0.063500><0.179760,0.036000,0.063500> rotate<0,-44.997030,0> translate<25.107250,0.000000,21.610838> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.234359,0.000000,21.737947>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.742794,0.000000,21.737947>}
box{<0,0,-0.063500><0.508434,0.036000,0.063500> rotate<0,0.000000,0> translate<25.234359,0.000000,21.737947> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.742794,0.000000,21.737947>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.869900,0.000000,21.610838>}
box{<0,0,-0.063500><0.179758,0.036000,0.063500> rotate<0,44.997734,0> translate<25.742794,0.000000,21.737947> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.869900,0.000000,21.610838>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.869900,0.000000,21.356619>}
box{<0,0,-0.063500><0.254219,0.036000,0.063500> rotate<0,-90.000000,0> translate<25.869900,0.000000,21.356619> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.869900,0.000000,21.356619>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.742794,0.000000,21.229513>}
box{<0,0,-0.063500><0.179755,0.036000,0.063500> rotate<0,-44.997030,0> translate<25.742794,0.000000,21.229513> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.742794,0.000000,21.229513>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.234359,0.000000,21.737947>}
box{<0,0,-0.063500><0.719035,0.036000,0.063500> rotate<0,44.997030,0> translate<25.234359,0.000000,21.737947> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.869900,0.000000,22.048091>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.742794,0.000000,22.048091>}
box{<0,0,-0.063500><0.127106,0.036000,0.063500> rotate<0,0.000000,0> translate<25.742794,0.000000,22.048091> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.742794,0.000000,22.048091>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.742794,0.000000,22.175197>}
box{<0,0,-0.063500><0.127106,0.036000,0.063500> rotate<0,90.000000,0> translate<25.742794,0.000000,22.175197> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.742794,0.000000,22.175197>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.869900,0.000000,22.175197>}
box{<0,0,-0.063500><0.127106,0.036000,0.063500> rotate<0,0.000000,0> translate<25.742794,0.000000,22.175197> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.869900,0.000000,22.175197>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.869900,0.000000,22.048091>}
box{<0,0,-0.063500><0.127106,0.036000,0.063500> rotate<0,-90.000000,0> translate<25.869900,0.000000,22.048091> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.361466,0.000000,22.457378>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.107250,0.000000,22.711594>}
box{<0,0,-0.063500><0.359515,0.036000,0.063500> rotate<0,44.997030,0> translate<25.107250,0.000000,22.711594> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.107250,0.000000,22.711594>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.869900,0.000000,22.711594>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,0.000000,0> translate<25.107250,0.000000,22.711594> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.869900,0.000000,22.457378>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.869900,0.000000,22.965813>}
box{<0,0,-0.063500><0.508434,0.036000,0.063500> rotate<0,90.000000,0> translate<25.869900,0.000000,22.965813> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.234422,-1.536000,8.275544>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.128500,-1.536000,8.381466>}
box{<0,0,-0.063500><0.149796,0.036000,0.063500> rotate<0,44.997030,0> translate<12.128500,-1.536000,8.381466> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.128500,-1.536000,8.381466>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.128500,-1.536000,8.487391>}
box{<0,0,-0.063500><0.105925,0.036000,0.063500> rotate<0,90.000000,0> translate<12.128500,-1.536000,8.487391> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.128500,-1.536000,8.487391>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.234422,-1.536000,8.593312>}
box{<0,0,-0.063500><0.149796,0.036000,0.063500> rotate<0,-44.997030,0> translate<12.128500,-1.536000,8.487391> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.234422,-1.536000,8.593312>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.764041,-1.536000,8.593312>}
box{<0,0,-0.063500><0.529619,0.036000,0.063500> rotate<0,0.000000,0> translate<12.234422,-1.536000,8.593312> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.764041,-1.536000,8.487391>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.764041,-1.536000,8.699238>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,90.000000,0> translate<12.764041,-1.536000,8.699238> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.128500,-1.536000,9.678819>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.764041,-1.536000,9.678819>}
box{<0,0,-0.063500><0.635541,0.036000,0.063500> rotate<0,0.000000,0> translate<12.128500,-1.536000,9.678819> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.764041,-1.536000,9.678819>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.552194,-1.536000,9.890666>}
box{<0,0,-0.063500><0.299597,0.036000,0.063500> rotate<0,44.997030,0> translate<12.552194,-1.536000,9.890666> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.552194,-1.536000,9.890666>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.764041,-1.536000,10.102513>}
box{<0,0,-0.063500><0.299597,0.036000,0.063500> rotate<0,-44.997030,0> translate<12.552194,-1.536000,9.890666> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.764041,-1.536000,10.102513>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.128500,-1.536000,10.102513>}
box{<0,0,-0.063500><0.635541,0.036000,0.063500> rotate<0,0.000000,0> translate<12.128500,-1.536000,10.102513> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.128500,-1.536000,10.486378>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.128500,-1.536000,10.698225>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,90.000000,0> translate<12.128500,-1.536000,10.698225> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.128500,-1.536000,10.698225>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.234422,-1.536000,10.804150>}
box{<0,0,-0.063500><0.149798,0.036000,0.063500> rotate<0,-44.997875,0> translate<12.128500,-1.536000,10.698225> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.234422,-1.536000,10.804150>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.446269,-1.536000,10.804150>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,0.000000,0> translate<12.234422,-1.536000,10.804150> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.446269,-1.536000,10.804150>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.552194,-1.536000,10.698225>}
box{<0,0,-0.063500><0.149801,0.036000,0.063500> rotate<0,44.997030,0> translate<12.446269,-1.536000,10.804150> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.552194,-1.536000,10.698225>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.552194,-1.536000,10.486378>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,-90.000000,0> translate<12.552194,-1.536000,10.486378> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.552194,-1.536000,10.486378>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.446269,-1.536000,10.380456>}
box{<0,0,-0.063500><0.149798,0.036000,0.063500> rotate<0,-44.996185,0> translate<12.446269,-1.536000,10.380456> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.446269,-1.536000,10.380456>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.234422,-1.536000,10.380456>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,0.000000,0> translate<12.234422,-1.536000,10.380456> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.234422,-1.536000,10.380456>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.128500,-1.536000,10.486378>}
box{<0,0,-0.063500><0.149796,0.036000,0.063500> rotate<0,44.997030,0> translate<12.128500,-1.536000,10.486378> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.128500,-1.536000,11.082094>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.552194,-1.536000,11.082094>}
box{<0,0,-0.063500><0.423694,0.036000,0.063500> rotate<0,0.000000,0> translate<12.128500,-1.536000,11.082094> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.340347,-1.536000,11.082094>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.552194,-1.536000,11.293941>}
box{<0,0,-0.063500><0.299597,0.036000,0.063500> rotate<0,-44.997030,0> translate<12.340347,-1.536000,11.082094> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.552194,-1.536000,11.293941>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.552194,-1.536000,11.399863>}
box{<0,0,-0.063500><0.105922,0.036000,0.063500> rotate<0,90.000000,0> translate<12.552194,-1.536000,11.399863> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.128500,-1.536000,11.984559>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.128500,-1.536000,11.772713>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,-90.000000,0> translate<12.128500,-1.536000,11.772713> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.128500,-1.536000,11.772713>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.234422,-1.536000,11.666791>}
box{<0,0,-0.063500><0.149796,0.036000,0.063500> rotate<0,44.997030,0> translate<12.128500,-1.536000,11.772713> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.234422,-1.536000,11.666791>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.446269,-1.536000,11.666791>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,0.000000,0> translate<12.234422,-1.536000,11.666791> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.446269,-1.536000,11.666791>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.552194,-1.536000,11.772713>}
box{<0,0,-0.063500><0.149798,0.036000,0.063500> rotate<0,-44.996185,0> translate<12.446269,-1.536000,11.666791> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.552194,-1.536000,11.772713>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.552194,-1.536000,11.984559>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,90.000000,0> translate<12.552194,-1.536000,11.984559> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.552194,-1.536000,11.984559>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.446269,-1.536000,12.090484>}
box{<0,0,-0.063500><0.149801,0.036000,0.063500> rotate<0,44.997030,0> translate<12.446269,-1.536000,12.090484> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.446269,-1.536000,12.090484>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.340347,-1.536000,12.090484>}
box{<0,0,-0.063500><0.105922,0.036000,0.063500> rotate<0,0.000000,0> translate<12.340347,-1.536000,12.090484> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.340347,-1.536000,12.090484>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.340347,-1.536000,11.666791>}
box{<0,0,-0.063500><0.423694,0.036000,0.063500> rotate<0,-90.000000,0> translate<12.340347,-1.536000,11.666791> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.764041,-1.536000,12.368428>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.764041,-1.536000,12.474350>}
box{<0,0,-0.063500><0.105922,0.036000,0.063500> rotate<0,90.000000,0> translate<12.764041,-1.536000,12.474350> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.764041,-1.536000,12.474350>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.128500,-1.536000,12.474350>}
box{<0,0,-0.063500><0.635541,0.036000,0.063500> rotate<0,0.000000,0> translate<12.128500,-1.536000,12.474350> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.128500,-1.536000,12.368428>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.128500,-1.536000,12.580275>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,90.000000,0> translate<12.128500,-1.536000,12.580275> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.552194,-1.536000,12.942109>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.552194,-1.536000,13.153956>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,90.000000,0> translate<12.552194,-1.536000,13.153956> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.552194,-1.536000,13.153956>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.446269,-1.536000,13.259881>}
box{<0,0,-0.063500><0.149801,0.036000,0.063500> rotate<0,44.997030,0> translate<12.446269,-1.536000,13.259881> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.446269,-1.536000,13.259881>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.128500,-1.536000,13.259881>}
box{<0,0,-0.063500><0.317769,0.036000,0.063500> rotate<0,0.000000,0> translate<12.128500,-1.536000,13.259881> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.128500,-1.536000,13.259881>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.128500,-1.536000,12.942109>}
box{<0,0,-0.063500><0.317772,0.036000,0.063500> rotate<0,-90.000000,0> translate<12.128500,-1.536000,12.942109> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.128500,-1.536000,12.942109>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.234422,-1.536000,12.836188>}
box{<0,0,-0.063500><0.149796,0.036000,0.063500> rotate<0,44.997030,0> translate<12.128500,-1.536000,12.942109> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.234422,-1.536000,12.836188>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.340347,-1.536000,12.942109>}
box{<0,0,-0.063500><0.149798,0.036000,0.063500> rotate<0,-44.996185,0> translate<12.234422,-1.536000,12.836188> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.340347,-1.536000,12.942109>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.340347,-1.536000,13.259881>}
box{<0,0,-0.063500><0.317772,0.036000,0.063500> rotate<0,90.000000,0> translate<12.340347,-1.536000,13.259881> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.128500,-1.536000,13.537825>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.552194,-1.536000,13.537825>}
box{<0,0,-0.063500><0.423694,0.036000,0.063500> rotate<0,0.000000,0> translate<12.128500,-1.536000,13.537825> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.552194,-1.536000,13.537825>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.552194,-1.536000,13.855594>}
box{<0,0,-0.063500><0.317769,0.036000,0.063500> rotate<0,90.000000,0> translate<12.552194,-1.536000,13.855594> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.552194,-1.536000,13.855594>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.446269,-1.536000,13.961519>}
box{<0,0,-0.063500><0.149801,0.036000,0.063500> rotate<0,44.997030,0> translate<12.446269,-1.536000,13.961519> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.446269,-1.536000,13.961519>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.128500,-1.536000,13.961519>}
box{<0,0,-0.063500><0.317769,0.036000,0.063500> rotate<0,0.000000,0> translate<12.128500,-1.536000,13.961519> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.764041,-1.536000,14.663156>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.128500,-1.536000,14.663156>}
box{<0,0,-0.063500><0.635541,0.036000,0.063500> rotate<0,0.000000,0> translate<12.128500,-1.536000,14.663156> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.128500,-1.536000,14.663156>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.128500,-1.536000,14.345384>}
box{<0,0,-0.063500><0.317772,0.036000,0.063500> rotate<0,-90.000000,0> translate<12.128500,-1.536000,14.345384> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.128500,-1.536000,14.345384>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.234422,-1.536000,14.239463>}
box{<0,0,-0.063500><0.149796,0.036000,0.063500> rotate<0,44.997030,0> translate<12.128500,-1.536000,14.345384> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.234422,-1.536000,14.239463>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.446269,-1.536000,14.239463>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,0.000000,0> translate<12.234422,-1.536000,14.239463> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.446269,-1.536000,14.239463>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.552194,-1.536000,14.345384>}
box{<0,0,-0.063500><0.149798,0.036000,0.063500> rotate<0,-44.996185,0> translate<12.446269,-1.536000,14.239463> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.552194,-1.536000,14.345384>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.552194,-1.536000,14.663156>}
box{<0,0,-0.063500><0.317772,0.036000,0.063500> rotate<0,90.000000,0> translate<12.552194,-1.536000,14.663156> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.764041,-1.536000,16.066431>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.764041,-1.536000,15.642738>}
box{<0,0,-0.063500><0.423694,0.036000,0.063500> rotate<0,-90.000000,0> translate<12.764041,-1.536000,15.642738> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.764041,-1.536000,15.642738>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.128500,-1.536000,15.642738>}
box{<0,0,-0.063500><0.635541,0.036000,0.063500> rotate<0,0.000000,0> translate<12.128500,-1.536000,15.642738> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.128500,-1.536000,15.642738>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.128500,-1.536000,16.066431>}
box{<0,0,-0.063500><0.423694,0.036000,0.063500> rotate<0,90.000000,0> translate<12.128500,-1.536000,16.066431> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.446269,-1.536000,15.642738>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.446269,-1.536000,15.854584>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,90.000000,0> translate<12.446269,-1.536000,15.854584> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.128500,-1.536000,16.344375>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.552194,-1.536000,16.344375>}
box{<0,0,-0.063500><0.423694,0.036000,0.063500> rotate<0,0.000000,0> translate<12.128500,-1.536000,16.344375> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.552194,-1.536000,16.344375>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.552194,-1.536000,16.662144>}
box{<0,0,-0.063500><0.317769,0.036000,0.063500> rotate<0,90.000000,0> translate<12.552194,-1.536000,16.662144> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.552194,-1.536000,16.662144>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.446269,-1.536000,16.768069>}
box{<0,0,-0.063500><0.149801,0.036000,0.063500> rotate<0,44.997030,0> translate<12.446269,-1.536000,16.768069> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.446269,-1.536000,16.768069>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.128500,-1.536000,16.768069>}
box{<0,0,-0.063500><0.317769,0.036000,0.063500> rotate<0,0.000000,0> translate<12.128500,-1.536000,16.768069> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.916653,-1.536000,17.257859>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.916653,-1.536000,17.363781>}
box{<0,0,-0.063500><0.105922,0.036000,0.063500> rotate<0,90.000000,0> translate<11.916653,-1.536000,17.363781> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.916653,-1.536000,17.363781>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.022578,-1.536000,17.469706>}
box{<0,0,-0.063500><0.149801,0.036000,0.063500> rotate<0,-44.997030,0> translate<11.916653,-1.536000,17.363781> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.022578,-1.536000,17.469706>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.552194,-1.536000,17.469706>}
box{<0,0,-0.063500><0.529616,0.036000,0.063500> rotate<0,0.000000,0> translate<12.022578,-1.536000,17.469706> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.552194,-1.536000,17.469706>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.552194,-1.536000,17.151934>}
box{<0,0,-0.063500><0.317772,0.036000,0.063500> rotate<0,-90.000000,0> translate<12.552194,-1.536000,17.151934> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.552194,-1.536000,17.151934>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.446269,-1.536000,17.046012>}
box{<0,0,-0.063500><0.149798,0.036000,0.063500> rotate<0,-44.996185,0> translate<12.446269,-1.536000,17.046012> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.446269,-1.536000,17.046012>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.234422,-1.536000,17.046012>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,0.000000,0> translate<12.234422,-1.536000,17.046012> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.234422,-1.536000,17.046012>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.128500,-1.536000,17.151934>}
box{<0,0,-0.063500><0.149796,0.036000,0.063500> rotate<0,44.997030,0> translate<12.128500,-1.536000,17.151934> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.128500,-1.536000,17.151934>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.128500,-1.536000,17.469706>}
box{<0,0,-0.063500><0.317772,0.036000,0.063500> rotate<0,90.000000,0> translate<12.128500,-1.536000,17.469706> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.552194,-1.536000,17.747650>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.552194,-1.536000,17.853572>}
box{<0,0,-0.063500><0.105922,0.036000,0.063500> rotate<0,90.000000,0> translate<12.552194,-1.536000,17.853572> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.552194,-1.536000,17.853572>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.128500,-1.536000,17.853572>}
box{<0,0,-0.063500><0.423694,0.036000,0.063500> rotate<0,0.000000,0> translate<12.128500,-1.536000,17.853572> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.128500,-1.536000,17.747650>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.128500,-1.536000,17.959497>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,90.000000,0> translate<12.128500,-1.536000,17.959497> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.869966,-1.536000,17.853572>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.764041,-1.536000,17.853572>}
box{<0,0,-0.063500><0.105925,0.036000,0.063500> rotate<0,0.000000,0> translate<12.764041,-1.536000,17.853572> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.128500,-1.536000,18.215409>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.552194,-1.536000,18.215409>}
box{<0,0,-0.063500><0.423694,0.036000,0.063500> rotate<0,0.000000,0> translate<12.128500,-1.536000,18.215409> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.552194,-1.536000,18.215409>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.552194,-1.536000,18.533178>}
box{<0,0,-0.063500><0.317769,0.036000,0.063500> rotate<0,90.000000,0> translate<12.552194,-1.536000,18.533178> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.552194,-1.536000,18.533178>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.446269,-1.536000,18.639103>}
box{<0,0,-0.063500><0.149801,0.036000,0.063500> rotate<0,44.997030,0> translate<12.446269,-1.536000,18.639103> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.446269,-1.536000,18.639103>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.128500,-1.536000,18.639103>}
box{<0,0,-0.063500><0.317769,0.036000,0.063500> rotate<0,0.000000,0> translate<12.128500,-1.536000,18.639103> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.128500,-1.536000,19.234816>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.128500,-1.536000,19.022969>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,-90.000000,0> translate<12.128500,-1.536000,19.022969> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.128500,-1.536000,19.022969>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.234422,-1.536000,18.917047>}
box{<0,0,-0.063500><0.149796,0.036000,0.063500> rotate<0,44.997030,0> translate<12.128500,-1.536000,19.022969> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.234422,-1.536000,18.917047>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.446269,-1.536000,18.917047>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,0.000000,0> translate<12.234422,-1.536000,18.917047> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.446269,-1.536000,18.917047>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.552194,-1.536000,19.022969>}
box{<0,0,-0.063500><0.149798,0.036000,0.063500> rotate<0,-44.996185,0> translate<12.446269,-1.536000,18.917047> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.552194,-1.536000,19.022969>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.552194,-1.536000,19.234816>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,90.000000,0> translate<12.552194,-1.536000,19.234816> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.552194,-1.536000,19.234816>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.446269,-1.536000,19.340741>}
box{<0,0,-0.063500><0.149801,0.036000,0.063500> rotate<0,44.997030,0> translate<12.446269,-1.536000,19.340741> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.446269,-1.536000,19.340741>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.340347,-1.536000,19.340741>}
box{<0,0,-0.063500><0.105922,0.036000,0.063500> rotate<0,0.000000,0> translate<12.340347,-1.536000,19.340741> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.340347,-1.536000,19.340741>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.340347,-1.536000,18.917047>}
box{<0,0,-0.063500><0.423694,0.036000,0.063500> rotate<0,-90.000000,0> translate<12.340347,-1.536000,18.917047> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.128500,-1.536000,19.936453>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.128500,-1.536000,19.724606>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,-90.000000,0> translate<12.128500,-1.536000,19.724606> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.128500,-1.536000,19.724606>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.234422,-1.536000,19.618684>}
box{<0,0,-0.063500><0.149796,0.036000,0.063500> rotate<0,44.997030,0> translate<12.128500,-1.536000,19.724606> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.234422,-1.536000,19.618684>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.446269,-1.536000,19.618684>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,0.000000,0> translate<12.234422,-1.536000,19.618684> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.446269,-1.536000,19.618684>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.552194,-1.536000,19.724606>}
box{<0,0,-0.063500><0.149798,0.036000,0.063500> rotate<0,-44.996185,0> translate<12.446269,-1.536000,19.618684> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.552194,-1.536000,19.724606>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.552194,-1.536000,19.936453>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,90.000000,0> translate<12.552194,-1.536000,19.936453> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.552194,-1.536000,19.936453>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.446269,-1.536000,20.042378>}
box{<0,0,-0.063500><0.149801,0.036000,0.063500> rotate<0,44.997030,0> translate<12.446269,-1.536000,20.042378> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.446269,-1.536000,20.042378>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.340347,-1.536000,20.042378>}
box{<0,0,-0.063500><0.105922,0.036000,0.063500> rotate<0,0.000000,0> translate<12.340347,-1.536000,20.042378> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.340347,-1.536000,20.042378>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.340347,-1.536000,19.618684>}
box{<0,0,-0.063500><0.423694,0.036000,0.063500> rotate<0,-90.000000,0> translate<12.340347,-1.536000,19.618684> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.128500,-1.536000,20.320322>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.552194,-1.536000,20.320322>}
box{<0,0,-0.063500><0.423694,0.036000,0.063500> rotate<0,0.000000,0> translate<12.128500,-1.536000,20.320322> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.340347,-1.536000,20.320322>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.552194,-1.536000,20.532169>}
box{<0,0,-0.063500><0.299597,0.036000,0.063500> rotate<0,-44.997030,0> translate<12.340347,-1.536000,20.320322> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.552194,-1.536000,20.532169>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.552194,-1.536000,20.638091>}
box{<0,0,-0.063500><0.105922,0.036000,0.063500> rotate<0,90.000000,0> translate<12.552194,-1.536000,20.638091> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.552194,-1.536000,20.905019>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.552194,-1.536000,21.010941>}
box{<0,0,-0.063500><0.105922,0.036000,0.063500> rotate<0,90.000000,0> translate<12.552194,-1.536000,21.010941> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.552194,-1.536000,21.010941>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.128500,-1.536000,21.010941>}
box{<0,0,-0.063500><0.423694,0.036000,0.063500> rotate<0,0.000000,0> translate<12.128500,-1.536000,21.010941> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.128500,-1.536000,20.905019>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.128500,-1.536000,21.116866>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,90.000000,0> translate<12.128500,-1.536000,21.116866> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.869966,-1.536000,21.010941>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.764041,-1.536000,21.010941>}
box{<0,0,-0.063500><0.105925,0.036000,0.063500> rotate<0,0.000000,0> translate<12.764041,-1.536000,21.010941> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.128500,-1.536000,21.372778>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.552194,-1.536000,21.372778>}
box{<0,0,-0.063500><0.423694,0.036000,0.063500> rotate<0,0.000000,0> translate<12.128500,-1.536000,21.372778> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.552194,-1.536000,21.372778>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.552194,-1.536000,21.690547>}
box{<0,0,-0.063500><0.317769,0.036000,0.063500> rotate<0,90.000000,0> translate<12.552194,-1.536000,21.690547> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.552194,-1.536000,21.690547>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.446269,-1.536000,21.796472>}
box{<0,0,-0.063500><0.149801,0.036000,0.063500> rotate<0,44.997030,0> translate<12.446269,-1.536000,21.796472> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.446269,-1.536000,21.796472>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.128500,-1.536000,21.796472>}
box{<0,0,-0.063500><0.317769,0.036000,0.063500> rotate<0,0.000000,0> translate<12.128500,-1.536000,21.796472> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.916653,-1.536000,22.286262>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.916653,-1.536000,22.392184>}
box{<0,0,-0.063500><0.105922,0.036000,0.063500> rotate<0,90.000000,0> translate<11.916653,-1.536000,22.392184> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.916653,-1.536000,22.392184>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.022578,-1.536000,22.498109>}
box{<0,0,-0.063500><0.149801,0.036000,0.063500> rotate<0,-44.997030,0> translate<11.916653,-1.536000,22.392184> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.022578,-1.536000,22.498109>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.552194,-1.536000,22.498109>}
box{<0,0,-0.063500><0.529616,0.036000,0.063500> rotate<0,0.000000,0> translate<12.022578,-1.536000,22.498109> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.552194,-1.536000,22.498109>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.552194,-1.536000,22.180338>}
box{<0,0,-0.063500><0.317772,0.036000,0.063500> rotate<0,-90.000000,0> translate<12.552194,-1.536000,22.180338> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.552194,-1.536000,22.180338>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.446269,-1.536000,22.074416>}
box{<0,0,-0.063500><0.149798,0.036000,0.063500> rotate<0,-44.996185,0> translate<12.446269,-1.536000,22.074416> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.446269,-1.536000,22.074416>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.234422,-1.536000,22.074416>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,0.000000,0> translate<12.234422,-1.536000,22.074416> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.234422,-1.536000,22.074416>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.128500,-1.536000,22.180338>}
box{<0,0,-0.063500><0.149796,0.036000,0.063500> rotate<0,44.997030,0> translate<12.128500,-1.536000,22.180338> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.128500,-1.536000,22.180338>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.128500,-1.536000,22.498109>}
box{<0,0,-0.063500><0.317772,0.036000,0.063500> rotate<0,90.000000,0> translate<12.128500,-1.536000,22.498109> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.764041,-1.536000,23.477691>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.128500,-1.536000,23.477691>}
box{<0,0,-0.063500><0.635541,0.036000,0.063500> rotate<0,0.000000,0> translate<12.128500,-1.536000,23.477691> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.128500,-1.536000,23.477691>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.128500,-1.536000,23.901384>}
box{<0,0,-0.063500><0.423694,0.036000,0.063500> rotate<0,90.000000,0> translate<12.128500,-1.536000,23.901384> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.764041,-1.536000,24.179328>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.128500,-1.536000,24.179328>}
box{<0,0,-0.063500><0.635541,0.036000,0.063500> rotate<0,0.000000,0> translate<12.128500,-1.536000,24.179328> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.128500,-1.536000,24.179328>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.128500,-1.536000,24.603022>}
box{<0,0,-0.063500><0.423694,0.036000,0.063500> rotate<0,90.000000,0> translate<12.128500,-1.536000,24.603022> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.658119,-1.536000,25.304659>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.764041,-1.536000,25.198734>}
box{<0,0,-0.063500><0.149798,0.036000,0.063500> rotate<0,44.997875,0> translate<12.658119,-1.536000,25.304659> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.764041,-1.536000,25.198734>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.764041,-1.536000,24.986888>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,-90.000000,0> translate<12.764041,-1.536000,24.986888> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.764041,-1.536000,24.986888>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.658119,-1.536000,24.880966>}
box{<0,0,-0.063500><0.149796,0.036000,0.063500> rotate<0,-44.997030,0> translate<12.658119,-1.536000,24.880966> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.658119,-1.536000,24.880966>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.234422,-1.536000,24.880966>}
box{<0,0,-0.063500><0.423697,0.036000,0.063500> rotate<0,0.000000,0> translate<12.234422,-1.536000,24.880966> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.234422,-1.536000,24.880966>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.128500,-1.536000,24.986888>}
box{<0,0,-0.063500><0.149796,0.036000,0.063500> rotate<0,44.997030,0> translate<12.128500,-1.536000,24.986888> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.128500,-1.536000,24.986888>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.128500,-1.536000,25.198734>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,90.000000,0> translate<12.128500,-1.536000,25.198734> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.128500,-1.536000,25.198734>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.234422,-1.536000,25.304659>}
box{<0,0,-0.063500><0.149798,0.036000,0.063500> rotate<0,-44.997875,0> translate<12.128500,-1.536000,25.198734> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.409194,-1.536000,13.128550>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.621041,-1.536000,13.340397>}
box{<0,0,-0.063500><0.299597,0.036000,0.063500> rotate<0,-44.997030,0> translate<11.409194,-1.536000,13.128550> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.621041,-1.536000,13.340397>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.985500,-1.536000,13.340397>}
box{<0,0,-0.063500><0.635541,0.036000,0.063500> rotate<0,0.000000,0> translate<10.985500,-1.536000,13.340397> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.985500,-1.536000,13.128550>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.985500,-1.536000,13.552244>}
box{<0,0,-0.063500><0.423694,0.036000,0.063500> rotate<0,90.000000,0> translate<10.985500,-1.536000,13.552244> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.515119,-1.536000,13.830188>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.621041,-1.536000,13.936109>}
box{<0,0,-0.063500><0.149796,0.036000,0.063500> rotate<0,-44.997030,0> translate<11.515119,-1.536000,13.830188> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.621041,-1.536000,13.936109>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.621041,-1.536000,14.147956>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,90.000000,0> translate<11.621041,-1.536000,14.147956> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.621041,-1.536000,14.147956>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.515119,-1.536000,14.253881>}
box{<0,0,-0.063500><0.149798,0.036000,0.063500> rotate<0,44.997875,0> translate<11.515119,-1.536000,14.253881> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.515119,-1.536000,14.253881>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.409194,-1.536000,14.253881>}
box{<0,0,-0.063500><0.105925,0.036000,0.063500> rotate<0,0.000000,0> translate<11.409194,-1.536000,14.253881> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.409194,-1.536000,14.253881>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.303269,-1.536000,14.147956>}
box{<0,0,-0.063500><0.149801,0.036000,0.063500> rotate<0,-44.997030,0> translate<11.303269,-1.536000,14.147956> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.303269,-1.536000,14.147956>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.197347,-1.536000,14.253881>}
box{<0,0,-0.063500><0.149798,0.036000,0.063500> rotate<0,44.997875,0> translate<11.197347,-1.536000,14.253881> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.197347,-1.536000,14.253881>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.091422,-1.536000,14.253881>}
box{<0,0,-0.063500><0.105925,0.036000,0.063500> rotate<0,0.000000,0> translate<11.091422,-1.536000,14.253881> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.091422,-1.536000,14.253881>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.985500,-1.536000,14.147956>}
box{<0,0,-0.063500><0.149798,0.036000,0.063500> rotate<0,-44.997875,0> translate<10.985500,-1.536000,14.147956> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.985500,-1.536000,14.147956>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.985500,-1.536000,13.936109>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,-90.000000,0> translate<10.985500,-1.536000,13.936109> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.985500,-1.536000,13.936109>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.091422,-1.536000,13.830188>}
box{<0,0,-0.063500><0.149796,0.036000,0.063500> rotate<0,44.997030,0> translate<10.985500,-1.536000,13.936109> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.091422,-1.536000,13.830188>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.197347,-1.536000,13.830188>}
box{<0,0,-0.063500><0.105925,0.036000,0.063500> rotate<0,0.000000,0> translate<11.091422,-1.536000,13.830188> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.197347,-1.536000,13.830188>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.303269,-1.536000,13.936109>}
box{<0,0,-0.063500><0.149796,0.036000,0.063500> rotate<0,-44.997030,0> translate<11.197347,-1.536000,13.830188> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.303269,-1.536000,13.936109>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.409194,-1.536000,13.830188>}
box{<0,0,-0.063500><0.149798,0.036000,0.063500> rotate<0,44.996185,0> translate<11.303269,-1.536000,13.936109> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.409194,-1.536000,13.830188>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.515119,-1.536000,13.830188>}
box{<0,0,-0.063500><0.105925,0.036000,0.063500> rotate<0,0.000000,0> translate<11.409194,-1.536000,13.830188> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.303269,-1.536000,13.936109>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.303269,-1.536000,14.147956>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,90.000000,0> translate<11.303269,-1.536000,14.147956> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.985500,-1.536000,15.233462>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.409194,-1.536000,15.233462>}
box{<0,0,-0.063500><0.423694,0.036000,0.063500> rotate<0,0.000000,0> translate<10.985500,-1.536000,15.233462> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.409194,-1.536000,15.233462>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.621041,-1.536000,15.445309>}
box{<0,0,-0.063500><0.299597,0.036000,0.063500> rotate<0,-44.997030,0> translate<11.409194,-1.536000,15.233462> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.621041,-1.536000,15.445309>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.409194,-1.536000,15.657156>}
box{<0,0,-0.063500><0.299597,0.036000,0.063500> rotate<0,44.997030,0> translate<11.409194,-1.536000,15.657156> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.409194,-1.536000,15.657156>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.985500,-1.536000,15.657156>}
box{<0,0,-0.063500><0.423694,0.036000,0.063500> rotate<0,0.000000,0> translate<10.985500,-1.536000,15.657156> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.303269,-1.536000,15.233462>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.303269,-1.536000,15.657156>}
box{<0,0,-0.063500><0.423694,0.036000,0.063500> rotate<0,90.000000,0> translate<11.303269,-1.536000,15.657156> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.773653,-1.536000,15.935100>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.409194,-1.536000,15.935100>}
box{<0,0,-0.063500><0.635541,0.036000,0.063500> rotate<0,0.000000,0> translate<10.773653,-1.536000,15.935100> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.409194,-1.536000,15.935100>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.409194,-1.536000,16.252869>}
box{<0,0,-0.063500><0.317769,0.036000,0.063500> rotate<0,90.000000,0> translate<11.409194,-1.536000,16.252869> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.409194,-1.536000,16.252869>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.303269,-1.536000,16.358794>}
box{<0,0,-0.063500><0.149801,0.036000,0.063500> rotate<0,44.997030,0> translate<11.303269,-1.536000,16.358794> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.303269,-1.536000,16.358794>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.091422,-1.536000,16.358794>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,0.000000,0> translate<11.091422,-1.536000,16.358794> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.091422,-1.536000,16.358794>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.985500,-1.536000,16.252869>}
box{<0,0,-0.063500><0.149798,0.036000,0.063500> rotate<0,-44.997875,0> translate<10.985500,-1.536000,16.252869> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.985500,-1.536000,16.252869>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.985500,-1.536000,15.935100>}
box{<0,0,-0.063500><0.317769,0.036000,0.063500> rotate<0,-90.000000,0> translate<10.985500,-1.536000,15.935100> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.985500,-1.536000,16.636738>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.409194,-1.536000,16.636738>}
box{<0,0,-0.063500><0.423694,0.036000,0.063500> rotate<0,0.000000,0> translate<10.985500,-1.536000,16.636738> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.197347,-1.536000,16.636738>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.409194,-1.536000,16.848584>}
box{<0,0,-0.063500><0.299597,0.036000,0.063500> rotate<0,-44.997030,0> translate<11.197347,-1.536000,16.636738> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.409194,-1.536000,16.848584>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.409194,-1.536000,16.954506>}
box{<0,0,-0.063500><0.105922,0.036000,0.063500> rotate<0,90.000000,0> translate<11.409194,-1.536000,16.954506> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.985500,-1.536000,18.346766>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.985500,-1.536000,17.923072>}
box{<0,0,-0.063500><0.423694,0.036000,0.063500> rotate<0,-90.000000,0> translate<10.985500,-1.536000,17.923072> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.985500,-1.536000,17.923072>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.409194,-1.536000,18.346766>}
box{<0,0,-0.063500><0.599193,0.036000,0.063500> rotate<0,-44.997030,0> translate<10.985500,-1.536000,17.923072> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.409194,-1.536000,18.346766>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.515119,-1.536000,18.346766>}
box{<0,0,-0.063500><0.105925,0.036000,0.063500> rotate<0,0.000000,0> translate<11.409194,-1.536000,18.346766> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.515119,-1.536000,18.346766>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.621041,-1.536000,18.240841>}
box{<0,0,-0.063500><0.149798,0.036000,0.063500> rotate<0,44.997875,0> translate<11.515119,-1.536000,18.346766> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.621041,-1.536000,18.240841>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.621041,-1.536000,18.028994>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,-90.000000,0> translate<11.621041,-1.536000,18.028994> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.621041,-1.536000,18.028994>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.515119,-1.536000,17.923072>}
box{<0,0,-0.063500><0.149796,0.036000,0.063500> rotate<0,-44.997030,0> translate<11.515119,-1.536000,17.923072> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.091422,-1.536000,18.624709>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.515119,-1.536000,18.624709>}
box{<0,0,-0.063500><0.423697,0.036000,0.063500> rotate<0,0.000000,0> translate<11.091422,-1.536000,18.624709> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.515119,-1.536000,18.624709>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.621041,-1.536000,18.730631>}
box{<0,0,-0.063500><0.149796,0.036000,0.063500> rotate<0,-44.997030,0> translate<11.515119,-1.536000,18.624709> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.621041,-1.536000,18.730631>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.621041,-1.536000,18.942478>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,90.000000,0> translate<11.621041,-1.536000,18.942478> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.621041,-1.536000,18.942478>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.515119,-1.536000,19.048403>}
box{<0,0,-0.063500><0.149798,0.036000,0.063500> rotate<0,44.997875,0> translate<11.515119,-1.536000,19.048403> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.515119,-1.536000,19.048403>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.091422,-1.536000,19.048403>}
box{<0,0,-0.063500><0.423697,0.036000,0.063500> rotate<0,0.000000,0> translate<11.091422,-1.536000,19.048403> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.091422,-1.536000,19.048403>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.985500,-1.536000,18.942478>}
box{<0,0,-0.063500><0.149798,0.036000,0.063500> rotate<0,-44.997875,0> translate<10.985500,-1.536000,18.942478> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.985500,-1.536000,18.942478>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.985500,-1.536000,18.730631>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,-90.000000,0> translate<10.985500,-1.536000,18.730631> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.985500,-1.536000,18.730631>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.091422,-1.536000,18.624709>}
box{<0,0,-0.063500><0.149796,0.036000,0.063500> rotate<0,44.997030,0> translate<10.985500,-1.536000,18.730631> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.091422,-1.536000,18.624709>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.515119,-1.536000,19.048403>}
box{<0,0,-0.063500><0.599196,0.036000,0.063500> rotate<0,-44.996819,0> translate<11.091422,-1.536000,18.624709> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.409194,-1.536000,19.326347>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.621041,-1.536000,19.538194>}
box{<0,0,-0.063500><0.299597,0.036000,0.063500> rotate<0,-44.997030,0> translate<11.409194,-1.536000,19.326347> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.621041,-1.536000,19.538194>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.985500,-1.536000,19.538194>}
box{<0,0,-0.063500><0.635541,0.036000,0.063500> rotate<0,0.000000,0> translate<10.985500,-1.536000,19.538194> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.985500,-1.536000,19.326347>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.985500,-1.536000,19.750041>}
box{<0,0,-0.063500><0.423694,0.036000,0.063500> rotate<0,90.000000,0> translate<10.985500,-1.536000,19.750041> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.515119,-1.536000,20.027984>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.621041,-1.536000,20.133906>}
box{<0,0,-0.063500><0.149796,0.036000,0.063500> rotate<0,-44.997030,0> translate<11.515119,-1.536000,20.027984> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.621041,-1.536000,20.133906>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.621041,-1.536000,20.345753>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,90.000000,0> translate<11.621041,-1.536000,20.345753> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.621041,-1.536000,20.345753>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.515119,-1.536000,20.451678>}
box{<0,0,-0.063500><0.149798,0.036000,0.063500> rotate<0,44.997875,0> translate<11.515119,-1.536000,20.451678> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.515119,-1.536000,20.451678>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.409194,-1.536000,20.451678>}
box{<0,0,-0.063500><0.105925,0.036000,0.063500> rotate<0,0.000000,0> translate<11.409194,-1.536000,20.451678> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.409194,-1.536000,20.451678>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.303269,-1.536000,20.345753>}
box{<0,0,-0.063500><0.149801,0.036000,0.063500> rotate<0,-44.997030,0> translate<11.303269,-1.536000,20.345753> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.303269,-1.536000,20.345753>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.303269,-1.536000,20.239831>}
box{<0,0,-0.063500><0.105922,0.036000,0.063500> rotate<0,-90.000000,0> translate<11.303269,-1.536000,20.239831> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.303269,-1.536000,20.345753>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.197347,-1.536000,20.451678>}
box{<0,0,-0.063500><0.149798,0.036000,0.063500> rotate<0,44.997875,0> translate<11.197347,-1.536000,20.451678> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.197347,-1.536000,20.451678>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.091422,-1.536000,20.451678>}
box{<0,0,-0.063500><0.105925,0.036000,0.063500> rotate<0,0.000000,0> translate<11.091422,-1.536000,20.451678> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.091422,-1.536000,20.451678>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.985500,-1.536000,20.345753>}
box{<0,0,-0.063500><0.149798,0.036000,0.063500> rotate<0,-44.997875,0> translate<10.985500,-1.536000,20.345753> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.985500,-1.536000,20.345753>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.985500,-1.536000,20.133906>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,-90.000000,0> translate<10.985500,-1.536000,20.133906> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.985500,-1.536000,20.133906>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.091422,-1.536000,20.027984>}
box{<0,0,-0.063500><0.149796,0.036000,0.063500> rotate<0,44.997030,0> translate<10.985500,-1.536000,20.133906> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.271000,0.000000,28.956000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.955000,0.000000,28.956000>}
box{<0,0,-0.101600><11.684000,0.036000,0.101600> rotate<0,0.000000,0> translate<9.271000,0.000000,28.956000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.733000,0.000000,28.956000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<26.924000,0.000000,28.956000>}
box{<0,0,-0.101600><4.191000,0.036000,0.101600> rotate<0,0.000000,0> translate<22.733000,0.000000,28.956000> }
//C1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.696200,0.000000,25.561400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.696200,0.000000,26.051400>}
box{<0,0,-0.076200><0.490000,0.036000,0.076200> rotate<0,90.000000,0> translate<21.696200,0.000000,26.051400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.144200,0.000000,26.051400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.144200,0.000000,25.561400>}
box{<0,0,-0.076200><0.490000,0.036000,0.076200> rotate<0,-90.000000,0> translate<22.144200,0.000000,25.561400> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<21.889700,0.000000,25.806400>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<21.950700,0.000000,25.806400>}
box{<0,0,-0.203200><0.061000,0.036000,0.203200> rotate<0,0.000000,0> translate<21.889700,0.000000,25.806400> }
box{<-0.150000,0,-0.299950><0.150000,0.036000,0.299950> rotate<0,-90.000000,0> translate<21.925050,0.000000,25.402400>}
box{<-0.150000,0,-0.299950><0.150000,0.036000,0.299950> rotate<0,-90.000000,0> translate<21.925050,0.000000,26.215200>}
//C3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.507600,0.000000,24.922000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.017600,0.000000,24.922000>}
box{<0,0,-0.076200><0.490000,0.036000,0.076200> rotate<0,0.000000,0> translate<18.017600,0.000000,24.922000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.017600,0.000000,25.370000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.507600,0.000000,25.370000>}
box{<0,0,-0.076200><0.490000,0.036000,0.076200> rotate<0,0.000000,0> translate<18.017600,0.000000,25.370000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<18.262600,0.000000,25.115500>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<18.262600,0.000000,25.176500>}
box{<0,0,-0.203200><0.061000,0.036000,0.203200> rotate<0,90.000000,0> translate<18.262600,0.000000,25.176500> }
box{<-0.150000,0,-0.299950><0.150000,0.036000,0.299950> rotate<0,-180.000000,0> translate<18.666600,0.000000,25.150850>}
box{<-0.150000,0,-0.299950><0.150000,0.036000,0.299950> rotate<0,-180.000000,0> translate<17.853800,0.000000,25.150850>}
//C4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.504800,0.000000,27.893800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.014800,0.000000,27.893800>}
box{<0,0,-0.076200><0.490000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.014800,0.000000,27.893800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.014800,0.000000,28.341800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.504800,0.000000,28.341800>}
box{<0,0,-0.076200><0.490000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.014800,0.000000,28.341800> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<21.259800,0.000000,28.087300>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<21.259800,0.000000,28.148300>}
box{<0,0,-0.203200><0.061000,0.036000,0.203200> rotate<0,90.000000,0> translate<21.259800,0.000000,28.148300> }
box{<-0.150000,0,-0.299950><0.150000,0.036000,0.299950> rotate<0,-180.000000,0> translate<21.663800,0.000000,28.122650>}
box{<-0.150000,0,-0.299950><0.150000,0.036000,0.299950> rotate<0,-180.000000,0> translate<20.851000,0.000000,28.122650>}
//C5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.673800,0.000000,13.910200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.673800,0.000000,13.420200>}
box{<0,0,-0.076200><0.490000,0.036000,0.076200> rotate<0,-90.000000,0> translate<17.673800,0.000000,13.420200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.225800,0.000000,13.420200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.225800,0.000000,13.910200>}
box{<0,0,-0.076200><0.490000,0.036000,0.076200> rotate<0,90.000000,0> translate<17.225800,0.000000,13.910200> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<17.480300,0.000000,13.665200>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<17.419300,0.000000,13.665200>}
box{<0,0,-0.203200><0.061000,0.036000,0.203200> rotate<0,0.000000,0> translate<17.419300,0.000000,13.665200> }
box{<-0.150000,0,-0.299950><0.150000,0.036000,0.299950> rotate<0,-270.000000,0> translate<17.444950,0.000000,14.069200>}
box{<-0.150000,0,-0.299950><0.150000,0.036000,0.299950> rotate<0,-270.000000,0> translate<17.444950,0.000000,13.256400>}
//C6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.256400,0.000000,24.922000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.766400,0.000000,24.922000>}
box{<0,0,-0.076200><0.490000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.766400,0.000000,24.922000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.766400,0.000000,25.370000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.256400,0.000000,25.370000>}
box{<0,0,-0.076200><0.490000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.766400,0.000000,25.370000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<15.011400,0.000000,25.115500>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<15.011400,0.000000,25.176500>}
box{<0,0,-0.203200><0.061000,0.036000,0.203200> rotate<0,90.000000,0> translate<15.011400,0.000000,25.176500> }
box{<-0.150000,0,-0.299950><0.150000,0.036000,0.299950> rotate<0,-180.000000,0> translate<15.415400,0.000000,25.150850>}
box{<-0.150000,0,-0.299950><0.150000,0.036000,0.299950> rotate<0,-180.000000,0> translate<14.602600,0.000000,25.150850>}
//C7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.305800,0.000000,18.576400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.305800,0.000000,19.066400>}
box{<0,0,-0.076200><0.490000,0.036000,0.076200> rotate<0,90.000000,0> translate<22.305800,0.000000,19.066400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.753800,0.000000,19.066400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.753800,0.000000,18.576400>}
box{<0,0,-0.076200><0.490000,0.036000,0.076200> rotate<0,-90.000000,0> translate<22.753800,0.000000,18.576400> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<22.499300,0.000000,18.821400>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<22.560300,0.000000,18.821400>}
box{<0,0,-0.203200><0.061000,0.036000,0.203200> rotate<0,0.000000,0> translate<22.499300,0.000000,18.821400> }
box{<-0.150000,0,-0.299950><0.150000,0.036000,0.299950> rotate<0,-90.000000,0> translate<22.534650,0.000000,18.417400>}
box{<-0.150000,0,-0.299950><0.150000,0.036000,0.299950> rotate<0,-90.000000,0> translate<22.534650,0.000000,19.230200>}
//C8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.646800,0.000000,14.076200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.156800,0.000000,14.076200>}
box{<0,0,-0.076200><0.490000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.156800,0.000000,14.076200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.156800,0.000000,14.524200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.646800,0.000000,14.524200>}
box{<0,0,-0.076200><0.490000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.156800,0.000000,14.524200> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<14.401800,0.000000,14.269700>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<14.401800,0.000000,14.330700>}
box{<0,0,-0.203200><0.061000,0.036000,0.203200> rotate<0,90.000000,0> translate<14.401800,0.000000,14.330700> }
box{<-0.150000,0,-0.299950><0.150000,0.036000,0.299950> rotate<0,-180.000000,0> translate<14.805800,0.000000,14.305050>}
box{<-0.150000,0,-0.299950><0.150000,0.036000,0.299950> rotate<0,-180.000000,0> translate<13.993000,0.000000,14.305050>}
//C9 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.680400,0.000000,13.910200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.680400,0.000000,13.420200>}
box{<0,0,-0.076200><0.490000,0.036000,0.076200> rotate<0,-90.000000,0> translate<19.680400,0.000000,13.420200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.232400,0.000000,13.420200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.232400,0.000000,13.910200>}
box{<0,0,-0.076200><0.490000,0.036000,0.076200> rotate<0,90.000000,0> translate<19.232400,0.000000,13.910200> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<19.486900,0.000000,13.665200>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<19.425900,0.000000,13.665200>}
box{<0,0,-0.203200><0.061000,0.036000,0.203200> rotate<0,0.000000,0> translate<19.425900,0.000000,13.665200> }
box{<-0.150000,0,-0.299950><0.150000,0.036000,0.299950> rotate<0,-270.000000,0> translate<19.451550,0.000000,14.069200>}
box{<-0.150000,0,-0.299950><0.150000,0.036000,0.299950> rotate<0,-270.000000,0> translate<19.451550,0.000000,13.256400>}
//C10 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.947600,0.000000,19.066400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.947600,0.000000,18.576400>}
box{<0,0,-0.076200><0.490000,0.036000,0.076200> rotate<0,-90.000000,0> translate<23.947600,0.000000,18.576400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.499600,0.000000,18.576400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.499600,0.000000,19.066400>}
box{<0,0,-0.076200><0.490000,0.036000,0.076200> rotate<0,90.000000,0> translate<23.499600,0.000000,19.066400> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<23.754100,0.000000,18.821400>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<23.693100,0.000000,18.821400>}
box{<0,0,-0.203200><0.061000,0.036000,0.203200> rotate<0,0.000000,0> translate<23.693100,0.000000,18.821400> }
box{<-0.150000,0,-0.299950><0.150000,0.036000,0.299950> rotate<0,-270.000000,0> translate<23.718750,0.000000,19.225400>}
box{<-0.150000,0,-0.299950><0.150000,0.036000,0.299950> rotate<0,-270.000000,0> translate<23.718750,0.000000,18.412600>}
//C11 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.305800,0.000000,21.599000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.305800,0.000000,22.089000>}
box{<0,0,-0.076200><0.490000,0.036000,0.076200> rotate<0,90.000000,0> translate<22.305800,0.000000,22.089000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.753800,0.000000,22.089000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.753800,0.000000,21.599000>}
box{<0,0,-0.076200><0.490000,0.036000,0.076200> rotate<0,-90.000000,0> translate<22.753800,0.000000,21.599000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<22.499300,0.000000,21.844000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<22.560300,0.000000,21.844000>}
box{<0,0,-0.203200><0.061000,0.036000,0.203200> rotate<0,0.000000,0> translate<22.499300,0.000000,21.844000> }
box{<-0.150000,0,-0.299950><0.150000,0.036000,0.299950> rotate<0,-90.000000,0> translate<22.534650,0.000000,21.440000>}
box{<-0.150000,0,-0.299950><0.150000,0.036000,0.299950> rotate<0,-90.000000,0> translate<22.534650,0.000000,22.252800>}
//C14 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.025600,0.000000,10.861600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.625600,0.000000,10.861600>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.025600,0.000000,10.861600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.025600,0.000000,9.661600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.625600,0.000000,9.661600>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.025600,0.000000,9.661600> }
//C15 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.646800,0.000000,12.577600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.156800,0.000000,12.577600>}
box{<0,0,-0.076200><0.490000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.156800,0.000000,12.577600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.156800,0.000000,13.025600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.646800,0.000000,13.025600>}
box{<0,0,-0.076200><0.490000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.156800,0.000000,13.025600> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<14.401800,0.000000,12.771100>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<14.401800,0.000000,12.832100>}
box{<0,0,-0.203200><0.061000,0.036000,0.203200> rotate<0,90.000000,0> translate<14.401800,0.000000,12.832100> }
box{<-0.150000,0,-0.299950><0.150000,0.036000,0.299950> rotate<0,-180.000000,0> translate<14.805800,0.000000,12.806450>}
box{<-0.150000,0,-0.299950><0.150000,0.036000,0.299950> rotate<0,-180.000000,0> translate<13.993000,0.000000,12.806450>}
//CYRF6936 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.703800,0.000000,16.814800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.703800,0.000000,17.246600>}
box{<0,0,-0.063500><0.431800,0.036000,0.063500> rotate<0,90.000000,0> translate<14.703800,0.000000,17.246600> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.703800,0.000000,22.352000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.703800,0.000000,22.809200>}
box{<0,0,-0.063500><0.457200,0.036000,0.063500> rotate<0,90.000000,0> translate<14.703800,0.000000,22.809200> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.703800,0.000000,22.809200>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.163800,0.000000,22.809200>}
box{<0,0,-0.063500><0.460000,0.036000,0.063500> rotate<0,0.000000,0> translate<14.703800,0.000000,22.809200> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.320000,0.000000,22.809200>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.701000,0.000000,22.809200>}
box{<0,0,-0.063500><0.381000,0.036000,0.063500> rotate<0,0.000000,0> translate<20.320000,0.000000,22.809200> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.653000,0.000000,17.253300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.262500,0.000000,16.862800>}
box{<0,0,-0.063500><0.552250,0.036000,0.063500> rotate<0,-44.997030,0> translate<20.262500,0.000000,16.862800> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.163800,0.000000,16.814800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.703800,0.000000,16.814800>}
box{<0,0,-0.063500><0.460000,0.036000,0.063500> rotate<0,0.000000,0> translate<14.703800,0.000000,16.814800> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.701000,0.000000,22.809200>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.701000,0.000000,22.428200>}
box{<0,0,-0.063500><0.381000,0.036000,0.063500> rotate<0,-90.000000,0> translate<20.701000,0.000000,22.428200> }
difference{
cylinder{<20.878800,0,16.637000><20.878800,0.036000,16.637000>0.350000 translate<0,0.000000,0>}
cylinder{<20.878800,-0.1,16.637000><20.878800,0.135000,16.637000>0.000000 translate<0,0.000000,0>}}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<15.948356,0.000000,24.215063>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<15.855144,0.000000,24.308275>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<15.855144,0.000000,24.308275> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<15.855144,0.000000,24.308275>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<15.668719,0.000000,24.308275>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<15.668719,0.000000,24.308275> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<15.668719,0.000000,24.308275>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<15.575506,0.000000,24.215063>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<15.575506,0.000000,24.215063> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<15.575506,0.000000,24.215063>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<15.575506,0.000000,23.842213>}
box{<0,0,-0.025400><0.372850,0.036000,0.025400> rotate<0,-90.000000,0> translate<15.575506,0.000000,23.842213> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<15.575506,0.000000,23.842213>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<15.668719,0.000000,23.749000>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<15.575506,0.000000,23.842213> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<15.668719,0.000000,23.749000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<15.855144,0.000000,23.749000>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<15.668719,0.000000,23.749000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<15.855144,0.000000,23.749000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<15.948356,0.000000,23.842213>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<15.855144,0.000000,23.749000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<16.136816,0.000000,24.308275>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<16.136816,0.000000,24.215063>}
box{<0,0,-0.025400><0.093212,0.036000,0.025400> rotate<0,-90.000000,0> translate<16.136816,0.000000,24.215063> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<16.136816,0.000000,24.215063>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<16.323241,0.000000,24.028638>}
box{<0,0,-0.025400><0.263645,0.036000,0.025400> rotate<0,44.997030,0> translate<16.136816,0.000000,24.215063> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<16.323241,0.000000,24.028638>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<16.509666,0.000000,24.215063>}
box{<0,0,-0.025400><0.263645,0.036000,0.025400> rotate<0,-44.997030,0> translate<16.323241,0.000000,24.028638> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<16.509666,0.000000,24.215063>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<16.509666,0.000000,24.308275>}
box{<0,0,-0.025400><0.093212,0.036000,0.025400> rotate<0,90.000000,0> translate<16.509666,0.000000,24.308275> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<16.323241,0.000000,24.028638>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<16.323241,0.000000,23.749000>}
box{<0,0,-0.025400><0.279637,0.036000,0.025400> rotate<0,-90.000000,0> translate<16.323241,0.000000,23.749000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<16.698125,0.000000,23.749000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<16.698125,0.000000,24.308275>}
box{<0,0,-0.025400><0.559275,0.036000,0.025400> rotate<0,90.000000,0> translate<16.698125,0.000000,24.308275> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<16.698125,0.000000,24.308275>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<16.977763,0.000000,24.308275>}
box{<0,0,-0.025400><0.279637,0.036000,0.025400> rotate<0,0.000000,0> translate<16.698125,0.000000,24.308275> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<16.977763,0.000000,24.308275>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<17.070975,0.000000,24.215063>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<16.977763,0.000000,24.308275> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<17.070975,0.000000,24.215063>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<17.070975,0.000000,24.028638>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,-90.000000,0> translate<17.070975,0.000000,24.028638> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<17.070975,0.000000,24.028638>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<16.977763,0.000000,23.935425>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<16.977763,0.000000,23.935425> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<16.977763,0.000000,23.935425>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<16.698125,0.000000,23.935425>}
box{<0,0,-0.025400><0.279637,0.036000,0.025400> rotate<0,0.000000,0> translate<16.698125,0.000000,23.935425> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<16.884550,0.000000,23.935425>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<17.070975,0.000000,23.749000>}
box{<0,0,-0.025400><0.263645,0.036000,0.025400> rotate<0,44.997030,0> translate<16.884550,0.000000,23.935425> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<17.259434,0.000000,23.749000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<17.259434,0.000000,24.308275>}
box{<0,0,-0.025400><0.559275,0.036000,0.025400> rotate<0,90.000000,0> translate<17.259434,0.000000,24.308275> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<17.259434,0.000000,24.308275>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<17.632284,0.000000,24.308275>}
box{<0,0,-0.025400><0.372850,0.036000,0.025400> rotate<0,0.000000,0> translate<17.259434,0.000000,24.308275> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<17.259434,0.000000,24.028638>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<17.445859,0.000000,24.028638>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<17.259434,0.000000,24.028638> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<18.193594,0.000000,24.308275>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<18.007169,0.000000,24.215063>}
box{<0,0,-0.025400><0.208429,0.036000,0.025400> rotate<0,-26.563298,0> translate<18.007169,0.000000,24.215063> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<18.007169,0.000000,24.215063>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<17.820744,0.000000,24.028638>}
box{<0,0,-0.025400><0.263645,0.036000,0.025400> rotate<0,-44.997030,0> translate<17.820744,0.000000,24.028638> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<17.820744,0.000000,24.028638>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<17.820744,0.000000,23.842213>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,-90.000000,0> translate<17.820744,0.000000,23.842213> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<17.820744,0.000000,23.842213>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<17.913956,0.000000,23.749000>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<17.820744,0.000000,23.842213> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<17.913956,0.000000,23.749000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<18.100381,0.000000,23.749000>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<17.913956,0.000000,23.749000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<18.100381,0.000000,23.749000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<18.193594,0.000000,23.842213>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<18.100381,0.000000,23.749000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<18.193594,0.000000,23.842213>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<18.193594,0.000000,23.935425>}
box{<0,0,-0.025400><0.093212,0.036000,0.025400> rotate<0,90.000000,0> translate<18.193594,0.000000,23.935425> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<18.193594,0.000000,23.935425>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<18.100381,0.000000,24.028638>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<18.100381,0.000000,24.028638> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<18.100381,0.000000,24.028638>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<17.820744,0.000000,24.028638>}
box{<0,0,-0.025400><0.279637,0.036000,0.025400> rotate<0,0.000000,0> translate<17.820744,0.000000,24.028638> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<18.382053,0.000000,23.842213>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<18.475266,0.000000,23.749000>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<18.382053,0.000000,23.842213> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<18.475266,0.000000,23.749000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<18.661691,0.000000,23.749000>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<18.475266,0.000000,23.749000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<18.661691,0.000000,23.749000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<18.754903,0.000000,23.842213>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<18.661691,0.000000,23.749000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<18.754903,0.000000,23.842213>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<18.754903,0.000000,24.215063>}
box{<0,0,-0.025400><0.372850,0.036000,0.025400> rotate<0,90.000000,0> translate<18.754903,0.000000,24.215063> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<18.754903,0.000000,24.215063>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<18.661691,0.000000,24.308275>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<18.661691,0.000000,24.308275> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<18.661691,0.000000,24.308275>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<18.475266,0.000000,24.308275>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<18.475266,0.000000,24.308275> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<18.475266,0.000000,24.308275>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<18.382053,0.000000,24.215063>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<18.382053,0.000000,24.215063> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<18.382053,0.000000,24.215063>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<18.382053,0.000000,24.121850>}
box{<0,0,-0.025400><0.093212,0.036000,0.025400> rotate<0,-90.000000,0> translate<18.382053,0.000000,24.121850> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<18.382053,0.000000,24.121850>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<18.475266,0.000000,24.028638>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<18.382053,0.000000,24.121850> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<18.475266,0.000000,24.028638>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<18.754903,0.000000,24.028638>}
box{<0,0,-0.025400><0.279637,0.036000,0.025400> rotate<0,0.000000,0> translate<18.475266,0.000000,24.028638> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<18.943362,0.000000,24.215063>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.036575,0.000000,24.308275>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<18.943362,0.000000,24.215063> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.036575,0.000000,24.308275>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.223000,0.000000,24.308275>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<19.036575,0.000000,24.308275> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.223000,0.000000,24.308275>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.316213,0.000000,24.215063>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<19.223000,0.000000,24.308275> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.316213,0.000000,24.215063>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.316213,0.000000,24.121850>}
box{<0,0,-0.025400><0.093212,0.036000,0.025400> rotate<0,-90.000000,0> translate<19.316213,0.000000,24.121850> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.316213,0.000000,24.121850>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.223000,0.000000,24.028638>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<19.223000,0.000000,24.028638> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.223000,0.000000,24.028638>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.129788,0.000000,24.028638>}
box{<0,0,-0.025400><0.093212,0.036000,0.025400> rotate<0,0.000000,0> translate<19.129788,0.000000,24.028638> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.223000,0.000000,24.028638>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.316213,0.000000,23.935425>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<19.223000,0.000000,24.028638> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.316213,0.000000,23.935425>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.316213,0.000000,23.842213>}
box{<0,0,-0.025400><0.093212,0.036000,0.025400> rotate<0,-90.000000,0> translate<19.316213,0.000000,23.842213> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.316213,0.000000,23.842213>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.223000,0.000000,23.749000>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<19.223000,0.000000,23.749000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.223000,0.000000,23.749000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.036575,0.000000,23.749000>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<19.036575,0.000000,23.749000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.036575,0.000000,23.749000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<18.943362,0.000000,23.842213>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<18.943362,0.000000,23.842213> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.877522,0.000000,24.308275>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.691097,0.000000,24.215063>}
box{<0,0,-0.025400><0.208429,0.036000,0.025400> rotate<0,-26.563298,0> translate<19.691097,0.000000,24.215063> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.691097,0.000000,24.215063>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.504672,0.000000,24.028638>}
box{<0,0,-0.025400><0.263645,0.036000,0.025400> rotate<0,-44.997030,0> translate<19.504672,0.000000,24.028638> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.504672,0.000000,24.028638>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.504672,0.000000,23.842213>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,-90.000000,0> translate<19.504672,0.000000,23.842213> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.504672,0.000000,23.842213>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.597884,0.000000,23.749000>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<19.504672,0.000000,23.842213> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.597884,0.000000,23.749000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.784309,0.000000,23.749000>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<19.597884,0.000000,23.749000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.784309,0.000000,23.749000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.877522,0.000000,23.842213>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<19.784309,0.000000,23.749000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.877522,0.000000,23.842213>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.877522,0.000000,23.935425>}
box{<0,0,-0.025400><0.093212,0.036000,0.025400> rotate<0,90.000000,0> translate<19.877522,0.000000,23.935425> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.877522,0.000000,23.935425>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.784309,0.000000,24.028638>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<19.784309,0.000000,24.028638> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.784309,0.000000,24.028638>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.504672,0.000000,24.028638>}
box{<0,0,-0.025400><0.279637,0.036000,0.025400> rotate<0,0.000000,0> translate<19.504672,0.000000,24.028638> }
//GND silk screen
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.269450,0.000000,26.094663>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.176238,0.000000,26.187875>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<11.176238,0.000000,26.187875> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.176238,0.000000,26.187875>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.989813,0.000000,26.187875>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<10.989813,0.000000,26.187875> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.989813,0.000000,26.187875>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.896600,0.000000,26.094663>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<10.896600,0.000000,26.094663> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.896600,0.000000,26.094663>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.896600,0.000000,25.721813>}
box{<0,0,-0.025400><0.372850,0.036000,0.025400> rotate<0,-90.000000,0> translate<10.896600,0.000000,25.721813> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.896600,0.000000,25.721813>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.989813,0.000000,25.628600>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<10.896600,0.000000,25.721813> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.989813,0.000000,25.628600>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.176238,0.000000,25.628600>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<10.989813,0.000000,25.628600> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.176238,0.000000,25.628600>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.269450,0.000000,25.721813>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<11.176238,0.000000,25.628600> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.269450,0.000000,25.721813>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.269450,0.000000,25.908238>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,90.000000,0> translate<11.269450,0.000000,25.908238> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.269450,0.000000,25.908238>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.083025,0.000000,25.908238>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<11.083025,0.000000,25.908238> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.457909,0.000000,25.628600>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.457909,0.000000,26.187875>}
box{<0,0,-0.025400><0.559275,0.036000,0.025400> rotate<0,90.000000,0> translate<11.457909,0.000000,26.187875> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.457909,0.000000,26.187875>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.830759,0.000000,25.628600>}
box{<0,0,-0.025400><0.672165,0.036000,0.025400> rotate<0,56.306216,0> translate<11.457909,0.000000,26.187875> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.830759,0.000000,25.628600>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.830759,0.000000,26.187875>}
box{<0,0,-0.025400><0.559275,0.036000,0.025400> rotate<0,90.000000,0> translate<11.830759,0.000000,26.187875> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.019219,0.000000,26.187875>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.019219,0.000000,25.628600>}
box{<0,0,-0.025400><0.559275,0.036000,0.025400> rotate<0,-90.000000,0> translate<12.019219,0.000000,25.628600> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.019219,0.000000,25.628600>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.298856,0.000000,25.628600>}
box{<0,0,-0.025400><0.279637,0.036000,0.025400> rotate<0,0.000000,0> translate<12.019219,0.000000,25.628600> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.298856,0.000000,25.628600>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.392069,0.000000,25.721813>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<12.298856,0.000000,25.628600> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.392069,0.000000,25.721813>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.392069,0.000000,26.094663>}
box{<0,0,-0.025400><0.372850,0.036000,0.025400> rotate<0,90.000000,0> translate<12.392069,0.000000,26.094663> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.392069,0.000000,26.094663>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.298856,0.000000,26.187875>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<12.298856,0.000000,26.187875> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.298856,0.000000,26.187875>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.019219,0.000000,26.187875>}
box{<0,0,-0.025400><0.279637,0.036000,0.025400> rotate<0,0.000000,0> translate<12.019219,0.000000,26.187875> }
//IRQ silk screen
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.820400,0.000000,17.932400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.006825,0.000000,17.932400>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<10.820400,0.000000,17.932400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.913613,0.000000,17.932400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.913613,0.000000,18.491675>}
box{<0,0,-0.025400><0.559275,0.036000,0.025400> rotate<0,90.000000,0> translate<10.913613,0.000000,18.491675> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.820400,0.000000,18.491675>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.006825,0.000000,18.491675>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<10.820400,0.000000,18.491675> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.194606,0.000000,17.932400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.194606,0.000000,18.491675>}
box{<0,0,-0.025400><0.559275,0.036000,0.025400> rotate<0,90.000000,0> translate<11.194606,0.000000,18.491675> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.194606,0.000000,18.491675>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.474244,0.000000,18.491675>}
box{<0,0,-0.025400><0.279637,0.036000,0.025400> rotate<0,0.000000,0> translate<11.194606,0.000000,18.491675> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.474244,0.000000,18.491675>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.567456,0.000000,18.398463>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<11.474244,0.000000,18.491675> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.567456,0.000000,18.398463>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.567456,0.000000,18.212038>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,-90.000000,0> translate<11.567456,0.000000,18.212038> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.567456,0.000000,18.212038>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.474244,0.000000,18.118825>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<11.474244,0.000000,18.118825> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.474244,0.000000,18.118825>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.194606,0.000000,18.118825>}
box{<0,0,-0.025400><0.279637,0.036000,0.025400> rotate<0,0.000000,0> translate<11.194606,0.000000,18.118825> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.381031,0.000000,18.118825>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.567456,0.000000,17.932400>}
box{<0,0,-0.025400><0.263645,0.036000,0.025400> rotate<0,44.997030,0> translate<11.381031,0.000000,18.118825> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.755916,0.000000,18.025613>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.755916,0.000000,18.398463>}
box{<0,0,-0.025400><0.372850,0.036000,0.025400> rotate<0,90.000000,0> translate<11.755916,0.000000,18.398463> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.755916,0.000000,18.398463>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.849128,0.000000,18.491675>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<11.755916,0.000000,18.398463> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.849128,0.000000,18.491675>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.035553,0.000000,18.491675>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<11.849128,0.000000,18.491675> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.035553,0.000000,18.491675>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.128766,0.000000,18.398463>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<12.035553,0.000000,18.491675> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.128766,0.000000,18.398463>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.128766,0.000000,18.025613>}
box{<0,0,-0.025400><0.372850,0.036000,0.025400> rotate<0,-90.000000,0> translate<12.128766,0.000000,18.025613> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.128766,0.000000,18.025613>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.035553,0.000000,17.932400>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<12.035553,0.000000,17.932400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.035553,0.000000,17.932400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.849128,0.000000,17.932400>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<11.849128,0.000000,17.932400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.849128,0.000000,17.932400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.755916,0.000000,18.025613>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<11.755916,0.000000,18.025613> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.942341,0.000000,18.118825>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.128766,0.000000,17.932400>}
box{<0,0,-0.025400><0.263645,0.036000,0.025400> rotate<0,44.997030,0> translate<11.942341,0.000000,18.118825> }
//L1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.562200,0.000000,24.739400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.850200,0.000000,24.739400>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<23.850200,0.000000,24.739400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.562200,0.000000,25.590400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.850200,0.000000,25.590400>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<23.850200,0.000000,25.590400> }
box{<-0.250050,0,-0.475000><0.250050,0.036000,0.475000> rotate<0,-180.000000,0> translate<24.794350,0.000000,25.166300>}
box{<-0.250050,0,-0.475000><0.250050,0.036000,0.475000> rotate<0,-180.000000,0> translate<23.625950,0.000000,25.166300>}
//L2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.313000,0.000000,26.665400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.803000,0.000000,26.665400>}
box{<0,0,-0.076200><0.490000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.313000,0.000000,26.665400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.803000,0.000000,26.217400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.313000,0.000000,26.217400>}
box{<0,0,-0.076200><0.490000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.313000,0.000000,26.217400> }
box{<-0.150000,0,-0.299950><0.150000,0.036000,0.299950> rotate<0,-0.000000,0> translate<19.154000,0.000000,26.436550>}
box{<-0.150000,0,-0.299950><0.150000,0.036000,0.299950> rotate<0,-0.000000,0> translate<19.966800,0.000000,26.436550>}
//MISO silk screen
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.820400,0.000000,12.852400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.820400,0.000000,13.411675>}
box{<0,0,-0.025400><0.559275,0.036000,0.025400> rotate<0,90.000000,0> translate<10.820400,0.000000,13.411675> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.820400,0.000000,13.411675>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.006825,0.000000,13.225250>}
box{<0,0,-0.025400><0.263645,0.036000,0.025400> rotate<0,44.997030,0> translate<10.820400,0.000000,13.411675> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.006825,0.000000,13.225250>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.193250,0.000000,13.411675>}
box{<0,0,-0.025400><0.263645,0.036000,0.025400> rotate<0,-44.997030,0> translate<11.006825,0.000000,13.225250> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.193250,0.000000,13.411675>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.193250,0.000000,12.852400>}
box{<0,0,-0.025400><0.559275,0.036000,0.025400> rotate<0,-90.000000,0> translate<11.193250,0.000000,12.852400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.381709,0.000000,12.852400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.568134,0.000000,12.852400>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<11.381709,0.000000,12.852400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.474922,0.000000,12.852400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.474922,0.000000,13.411675>}
box{<0,0,-0.025400><0.559275,0.036000,0.025400> rotate<0,90.000000,0> translate<11.474922,0.000000,13.411675> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.381709,0.000000,13.411675>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.568134,0.000000,13.411675>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<11.381709,0.000000,13.411675> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.128766,0.000000,13.318463>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.035553,0.000000,13.411675>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<12.035553,0.000000,13.411675> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.035553,0.000000,13.411675>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.849128,0.000000,13.411675>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<11.849128,0.000000,13.411675> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.849128,0.000000,13.411675>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.755916,0.000000,13.318463>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<11.755916,0.000000,13.318463> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.755916,0.000000,13.318463>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.755916,0.000000,13.225250>}
box{<0,0,-0.025400><0.093212,0.036000,0.025400> rotate<0,-90.000000,0> translate<11.755916,0.000000,13.225250> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.755916,0.000000,13.225250>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.849128,0.000000,13.132038>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<11.755916,0.000000,13.225250> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.849128,0.000000,13.132038>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.035553,0.000000,13.132038>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<11.849128,0.000000,13.132038> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.035553,0.000000,13.132038>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.128766,0.000000,13.038825>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<12.035553,0.000000,13.132038> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.128766,0.000000,13.038825>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.128766,0.000000,12.945613>}
box{<0,0,-0.025400><0.093212,0.036000,0.025400> rotate<0,-90.000000,0> translate<12.128766,0.000000,12.945613> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.128766,0.000000,12.945613>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.035553,0.000000,12.852400>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<12.035553,0.000000,12.852400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.035553,0.000000,12.852400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.849128,0.000000,12.852400>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<11.849128,0.000000,12.852400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.849128,0.000000,12.852400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.755916,0.000000,12.945613>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<11.755916,0.000000,12.945613> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.596863,0.000000,13.411675>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.410438,0.000000,13.411675>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<12.410438,0.000000,13.411675> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.410438,0.000000,13.411675>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.317225,0.000000,13.318463>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<12.317225,0.000000,13.318463> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.317225,0.000000,13.318463>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.317225,0.000000,12.945613>}
box{<0,0,-0.025400><0.372850,0.036000,0.025400> rotate<0,-90.000000,0> translate<12.317225,0.000000,12.945613> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.317225,0.000000,12.945613>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.410438,0.000000,12.852400>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<12.317225,0.000000,12.945613> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.410438,0.000000,12.852400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.596863,0.000000,12.852400>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<12.410438,0.000000,12.852400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.596863,0.000000,12.852400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.690075,0.000000,12.945613>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<12.596863,0.000000,12.852400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.690075,0.000000,12.945613>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.690075,0.000000,13.318463>}
box{<0,0,-0.025400><0.372850,0.036000,0.025400> rotate<0,90.000000,0> translate<12.690075,0.000000,13.318463> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.690075,0.000000,13.318463>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.596863,0.000000,13.411675>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<12.596863,0.000000,13.411675> }
//MOSI silk screen
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.820400,0.000000,15.392400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.820400,0.000000,15.951675>}
box{<0,0,-0.025400><0.559275,0.036000,0.025400> rotate<0,90.000000,0> translate<10.820400,0.000000,15.951675> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.820400,0.000000,15.951675>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.006825,0.000000,15.765250>}
box{<0,0,-0.025400><0.263645,0.036000,0.025400> rotate<0,44.997030,0> translate<10.820400,0.000000,15.951675> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.006825,0.000000,15.765250>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.193250,0.000000,15.951675>}
box{<0,0,-0.025400><0.263645,0.036000,0.025400> rotate<0,-44.997030,0> translate<11.006825,0.000000,15.765250> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.193250,0.000000,15.951675>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.193250,0.000000,15.392400>}
box{<0,0,-0.025400><0.559275,0.036000,0.025400> rotate<0,-90.000000,0> translate<11.193250,0.000000,15.392400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.661347,0.000000,15.951675>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.474922,0.000000,15.951675>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<11.474922,0.000000,15.951675> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.474922,0.000000,15.951675>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.381709,0.000000,15.858462>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<11.381709,0.000000,15.858462> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.381709,0.000000,15.858462>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.381709,0.000000,15.485613>}
box{<0,0,-0.025400><0.372850,0.036000,0.025400> rotate<0,-90.000000,0> translate<11.381709,0.000000,15.485613> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.381709,0.000000,15.485613>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.474922,0.000000,15.392400>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<11.381709,0.000000,15.485613> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.474922,0.000000,15.392400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.661347,0.000000,15.392400>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<11.474922,0.000000,15.392400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.661347,0.000000,15.392400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.754559,0.000000,15.485613>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<11.661347,0.000000,15.392400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.754559,0.000000,15.485613>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.754559,0.000000,15.858462>}
box{<0,0,-0.025400><0.372850,0.036000,0.025400> rotate<0,90.000000,0> translate<11.754559,0.000000,15.858462> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.754559,0.000000,15.858462>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.661347,0.000000,15.951675>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<11.661347,0.000000,15.951675> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.315869,0.000000,15.858462>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.222656,0.000000,15.951675>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<12.222656,0.000000,15.951675> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.222656,0.000000,15.951675>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.036231,0.000000,15.951675>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<12.036231,0.000000,15.951675> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.036231,0.000000,15.951675>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.943019,0.000000,15.858462>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<11.943019,0.000000,15.858462> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.943019,0.000000,15.858462>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.943019,0.000000,15.765250>}
box{<0,0,-0.025400><0.093212,0.036000,0.025400> rotate<0,-90.000000,0> translate<11.943019,0.000000,15.765250> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.943019,0.000000,15.765250>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.036231,0.000000,15.672038>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<11.943019,0.000000,15.765250> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.036231,0.000000,15.672038>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.222656,0.000000,15.672038>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<12.036231,0.000000,15.672038> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.222656,0.000000,15.672038>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.315869,0.000000,15.578825>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<12.222656,0.000000,15.672038> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.315869,0.000000,15.578825>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.315869,0.000000,15.485613>}
box{<0,0,-0.025400><0.093212,0.036000,0.025400> rotate<0,-90.000000,0> translate<12.315869,0.000000,15.485613> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.315869,0.000000,15.485613>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.222656,0.000000,15.392400>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<12.222656,0.000000,15.392400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.222656,0.000000,15.392400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.036231,0.000000,15.392400>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<12.036231,0.000000,15.392400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.036231,0.000000,15.392400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.943019,0.000000,15.485613>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<11.943019,0.000000,15.485613> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.504328,0.000000,15.392400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.690753,0.000000,15.392400>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<12.504328,0.000000,15.392400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.597541,0.000000,15.392400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.597541,0.000000,15.951675>}
box{<0,0,-0.025400><0.559275,0.036000,0.025400> rotate<0,90.000000,0> translate<12.597541,0.000000,15.951675> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.504328,0.000000,15.951675>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.690753,0.000000,15.951675>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<12.504328,0.000000,15.951675> }
//SCK silk screen
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.193250,0.000000,20.938462>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.100038,0.000000,21.031675>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<11.100038,0.000000,21.031675> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.100038,0.000000,21.031675>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.913613,0.000000,21.031675>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<10.913613,0.000000,21.031675> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.913613,0.000000,21.031675>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.820400,0.000000,20.938462>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<10.820400,0.000000,20.938462> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.820400,0.000000,20.938462>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.820400,0.000000,20.845250>}
box{<0,0,-0.025400><0.093212,0.036000,0.025400> rotate<0,-90.000000,0> translate<10.820400,0.000000,20.845250> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.820400,0.000000,20.845250>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.913613,0.000000,20.752038>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<10.820400,0.000000,20.845250> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.913613,0.000000,20.752038>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.100038,0.000000,20.752038>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<10.913613,0.000000,20.752038> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.100038,0.000000,20.752038>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.193250,0.000000,20.658825>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<11.100038,0.000000,20.752038> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.193250,0.000000,20.658825>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.193250,0.000000,20.565613>}
box{<0,0,-0.025400><0.093212,0.036000,0.025400> rotate<0,-90.000000,0> translate<11.193250,0.000000,20.565613> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.193250,0.000000,20.565613>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.100038,0.000000,20.472400>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<11.100038,0.000000,20.472400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.100038,0.000000,20.472400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.913613,0.000000,20.472400>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<10.913613,0.000000,20.472400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.913613,0.000000,20.472400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.820400,0.000000,20.565613>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<10.820400,0.000000,20.565613> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.754559,0.000000,20.938462>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.661347,0.000000,21.031675>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<11.661347,0.000000,21.031675> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.661347,0.000000,21.031675>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.474922,0.000000,21.031675>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<11.474922,0.000000,21.031675> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.474922,0.000000,21.031675>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.381709,0.000000,20.938462>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<11.381709,0.000000,20.938462> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.381709,0.000000,20.938462>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.381709,0.000000,20.565613>}
box{<0,0,-0.025400><0.372850,0.036000,0.025400> rotate<0,-90.000000,0> translate<11.381709,0.000000,20.565613> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.381709,0.000000,20.565613>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.474922,0.000000,20.472400>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<11.381709,0.000000,20.565613> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.474922,0.000000,20.472400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.661347,0.000000,20.472400>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<11.474922,0.000000,20.472400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.661347,0.000000,20.472400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.754559,0.000000,20.565613>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<11.661347,0.000000,20.472400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.943019,0.000000,21.031675>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.943019,0.000000,20.472400>}
box{<0,0,-0.025400><0.559275,0.036000,0.025400> rotate<0,-90.000000,0> translate<11.943019,0.000000,20.472400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.943019,0.000000,20.658825>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.315869,0.000000,21.031675>}
box{<0,0,-0.025400><0.527290,0.036000,0.025400> rotate<0,-44.997030,0> translate<11.943019,0.000000,20.658825> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.036231,0.000000,20.752038>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.315869,0.000000,20.472400>}
box{<0,0,-0.025400><0.395467,0.036000,0.025400> rotate<0,44.997030,0> translate<12.036231,0.000000,20.752038> }
//VCC silk screen
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.820400,0.000000,10.998675>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.820400,0.000000,10.625825>}
box{<0,0,-0.025400><0.372850,0.036000,0.025400> rotate<0,-90.000000,0> translate<10.820400,0.000000,10.625825> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.820400,0.000000,10.625825>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.006825,0.000000,10.439400>}
box{<0,0,-0.025400><0.263645,0.036000,0.025400> rotate<0,44.997030,0> translate<10.820400,0.000000,10.625825> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.006825,0.000000,10.439400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.193250,0.000000,10.625825>}
box{<0,0,-0.025400><0.263645,0.036000,0.025400> rotate<0,-44.997030,0> translate<11.006825,0.000000,10.439400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.193250,0.000000,10.625825>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.193250,0.000000,10.998675>}
box{<0,0,-0.025400><0.372850,0.036000,0.025400> rotate<0,90.000000,0> translate<11.193250,0.000000,10.998675> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.754559,0.000000,10.905463>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.661347,0.000000,10.998675>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<11.661347,0.000000,10.998675> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.661347,0.000000,10.998675>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.474922,0.000000,10.998675>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<11.474922,0.000000,10.998675> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.474922,0.000000,10.998675>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.381709,0.000000,10.905463>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<11.381709,0.000000,10.905463> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.381709,0.000000,10.905463>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.381709,0.000000,10.532613>}
box{<0,0,-0.025400><0.372850,0.036000,0.025400> rotate<0,-90.000000,0> translate<11.381709,0.000000,10.532613> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.381709,0.000000,10.532613>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.474922,0.000000,10.439400>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<11.381709,0.000000,10.532613> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.474922,0.000000,10.439400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.661347,0.000000,10.439400>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<11.474922,0.000000,10.439400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.661347,0.000000,10.439400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.754559,0.000000,10.532613>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<11.661347,0.000000,10.439400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.315869,0.000000,10.905463>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.222656,0.000000,10.998675>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<12.222656,0.000000,10.998675> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.222656,0.000000,10.998675>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.036231,0.000000,10.998675>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<12.036231,0.000000,10.998675> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.036231,0.000000,10.998675>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.943019,0.000000,10.905463>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<11.943019,0.000000,10.905463> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.943019,0.000000,10.905463>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.943019,0.000000,10.532613>}
box{<0,0,-0.025400><0.372850,0.036000,0.025400> rotate<0,-90.000000,0> translate<11.943019,0.000000,10.532613> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.943019,0.000000,10.532613>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.036231,0.000000,10.439400>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<11.943019,0.000000,10.532613> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.036231,0.000000,10.439400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.222656,0.000000,10.439400>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<12.036231,0.000000,10.439400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.222656,0.000000,10.439400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.315869,0.000000,10.532613>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<12.222656,0.000000,10.439400> }
//Y1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.297600,0.000000,11.048800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.497600,0.000000,11.048800>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<18.297600,0.000000,11.048800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.397600,0.000000,9.748800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.397600,0.000000,9.148800>}
box{<0,0,-0.101600><0.600000,0.036000,0.101600> rotate<0,-90.000000,0> translate<21.397600,0.000000,9.148800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.497600,0.000000,7.848800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.297600,0.000000,7.848800>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<18.297600,0.000000,7.848800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.397600,0.000000,9.748800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.397600,0.000000,9.148800>}
box{<0,0,-0.101600><0.600000,0.036000,0.101600> rotate<0,-90.000000,0> translate<16.397600,0.000000,9.148800> }
//_SS silk screen
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.820400,0.000000,22.919187>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.193250,0.000000,22.919187>}
box{<0,0,-0.025400><0.372850,0.036000,0.025400> rotate<0,0.000000,0> translate<10.820400,0.000000,22.919187> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.754559,0.000000,23.478463>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.661347,0.000000,23.571675>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<11.661347,0.000000,23.571675> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.661347,0.000000,23.571675>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.474922,0.000000,23.571675>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<11.474922,0.000000,23.571675> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.474922,0.000000,23.571675>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.381709,0.000000,23.478463>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<11.381709,0.000000,23.478463> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.381709,0.000000,23.478463>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.381709,0.000000,23.385250>}
box{<0,0,-0.025400><0.093212,0.036000,0.025400> rotate<0,-90.000000,0> translate<11.381709,0.000000,23.385250> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.381709,0.000000,23.385250>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.474922,0.000000,23.292038>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<11.381709,0.000000,23.385250> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.474922,0.000000,23.292038>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.661347,0.000000,23.292038>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<11.474922,0.000000,23.292038> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.661347,0.000000,23.292038>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.754559,0.000000,23.198825>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<11.661347,0.000000,23.292038> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.754559,0.000000,23.198825>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.754559,0.000000,23.105612>}
box{<0,0,-0.025400><0.093212,0.036000,0.025400> rotate<0,-90.000000,0> translate<11.754559,0.000000,23.105612> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.754559,0.000000,23.105612>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.661347,0.000000,23.012400>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<11.661347,0.000000,23.012400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.661347,0.000000,23.012400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.474922,0.000000,23.012400>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<11.474922,0.000000,23.012400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.474922,0.000000,23.012400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.381709,0.000000,23.105612>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<11.381709,0.000000,23.105612> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.315869,0.000000,23.478463>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.222656,0.000000,23.571675>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<12.222656,0.000000,23.571675> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.222656,0.000000,23.571675>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.036231,0.000000,23.571675>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<12.036231,0.000000,23.571675> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.036231,0.000000,23.571675>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.943019,0.000000,23.478463>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<11.943019,0.000000,23.478463> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.943019,0.000000,23.478463>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.943019,0.000000,23.385250>}
box{<0,0,-0.025400><0.093212,0.036000,0.025400> rotate<0,-90.000000,0> translate<11.943019,0.000000,23.385250> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.943019,0.000000,23.385250>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.036231,0.000000,23.292038>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<11.943019,0.000000,23.385250> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.036231,0.000000,23.292038>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.222656,0.000000,23.292038>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<12.036231,0.000000,23.292038> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.222656,0.000000,23.292038>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.315869,0.000000,23.198825>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<12.222656,0.000000,23.292038> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.315869,0.000000,23.198825>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.315869,0.000000,23.105612>}
box{<0,0,-0.025400><0.093212,0.036000,0.025400> rotate<0,-90.000000,0> translate<12.315869,0.000000,23.105612> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.315869,0.000000,23.105612>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.222656,0.000000,23.012400>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<12.222656,0.000000,23.012400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.222656,0.000000,23.012400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.036231,0.000000,23.012400>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<12.036231,0.000000,23.012400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.036231,0.000000,23.012400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.943019,0.000000,23.105612>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<11.943019,0.000000,23.105612> }
texture{col_slk}
}
#end
translate<mac_x_ver,mac_y_ver,mac_z_ver>
rotate<mac_x_rot,mac_y_rot,mac_z_rot>
}//End union
#end

#if(use_file_as_inc=off)
object{  CYRF6936_BOB(-18.097500,0,-22.733000,pcb_rotate_x,pcb_rotate_y,pcb_rotate_z)
#if(pcb_upsidedown=on)
rotate pcb_rotdir*180
#end
}
#end


//Parts not found in 3dpack.dat or 3dusrpac.dat are:
//GND	SOLDER_PAD	SOLDER_PAD
//IRQ	SOLDER_PAD	SOLDER_PAD
//L1		0603
//MISO	SOLDER_PAD	SOLDER_PAD
//MOSI	SOLDER_PAD	SOLDER_PAD
//SCK	SOLDER_PAD	SOLDER_PAD
//VCC	SOLDER_PAD	SOLDER_PAD
//_SS	SOLDER_PAD	SOLDER_PAD
