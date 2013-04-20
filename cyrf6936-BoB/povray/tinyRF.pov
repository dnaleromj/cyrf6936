//POVRay-File created by 3d41.ulp v###VERSIONDUMMY###
///Users/jmoreland/.dropbox-alt/Dropbox/Projects/quadcopter/cyrf6936/tinyRF/tinyRF.brd
//4/20/13 12:25 AM

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
#local cam_y = 55;
#local cam_z = -29;
#local cam_a = 20;
#local cam_look_x = 0;
#local cam_look_y = -1;
#local cam_look_z = 0;

#local pcb_rotate_x = 4;
#local pcb_rotate_y = 15;
#local pcb_rotate_z = 0;

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

#local lgt1_pos_x = 4;
#local lgt1_pos_y = 7;
#local lgt1_pos_z = 6;
#local lgt1_intense = 0.702414;
#local lgt2_pos_x = -4;
#local lgt2_pos_y = 7;
#local lgt2_pos_z = 6;
#local lgt2_intense = 0.702414;
#local lgt3_pos_x = 4;
#local lgt3_pos_y = 7;
#local lgt3_pos_z = -4;
#local lgt3_intense = 0.702414;
#local lgt4_pos_x = -4;
#local lgt4_pos_y = 7;
#local lgt4_pos_z = -4;
#local lgt4_intense = 0.702414;

//Do not change these values
#declare pcb_height = 1.500000;
#declare pcb_cuheight = 0.035000;
#declare pcb_x_size = 13.000000;
#declare pcb_y_size = 13.000000;
#declare pcb_layer1_used = 1;
#declare pcb_layer16_used = 1;
#declare inc_testmode = off;
#declare global_seed=seed(265);
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
#declare col_wrs = texture{pigment{Gray50}}
#declare col_pds = texture{T_Silver_5A}
#declare col_hls = texture{pigment{Gray30}}
#declare col_bgr = White;
#declare col_slk = texture{pigment{Gray10}}
#declare col_thl = texture{pigment{Gray30}}
#declare col_pol = texture{pigment{Gray50}}

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
	//translate<-6.500000,0,-6.500000>
}
#end

background{col_bgr}
light_source{<lgt1_pos_x,lgt1_pos_y,lgt1_pos_z> White*lgt1_intense}
light_source{<lgt2_pos_x,lgt2_pos_y,lgt2_pos_z> White*lgt2_intense}
light_source{<lgt3_pos_x,lgt3_pos_y,lgt3_pos_z> White*lgt3_intense}
light_source{<lgt4_pos_x,lgt4_pos_y,lgt4_pos_z> White*lgt4_intense}
#end


#macro TINYRF(mac_x_ver,mac_y_ver,mac_z_ver,mac_x_rot,mac_y_rot,mac_z_rot)
union{
#if(pcb_board = on)
difference{
union{
//Board
prism{-1.500000,0.000000,8
<11.832400,15.447800><11.832400,28.447800>
<11.832400,28.447800><24.832400,28.447800>
<24.832400,28.447800><24.832400,15.447800>
<24.832400,15.447800><11.832400,15.447800>
texture{col_brd}}
}//End union(PCB)
//Holes(real)/Parts
//Holes(real)/Board
//Holes(real)/Vias
cylinder{<14.071600,0.095000,18.821400><14.071600,-1.595000,18.821400>0.152400 texture{col_hls}}
cylinder{<14.173200,0.095000,27.863800><14.173200,-1.595000,27.863800>0.152400 texture{col_hls}}
cylinder{<14.249400,0.095000,24.942800><14.249400,-1.595000,24.942800>0.152400 texture{col_hls}}
cylinder{<15.748000,0.095000,17.322800><15.748000,-1.595000,17.322800>0.152400 texture{col_hls}}
cylinder{<16.052800,0.095000,27.076400><16.052800,-1.595000,27.076400>0.152400 texture{col_hls}}
cylinder{<16.256000,0.095000,19.786600><16.256000,-1.595000,19.786600>0.152400 texture{col_hls}}
cylinder{<16.256000,0.095000,20.650200><16.256000,-1.595000,20.650200>0.152400 texture{col_hls}}
cylinder{<16.256000,0.095000,21.539200><16.256000,-1.595000,21.539200>0.152400 texture{col_hls}}
cylinder{<16.256000,0.095000,22.402800><16.256000,-1.595000,22.402800>0.152400 texture{col_hls}}
cylinder{<16.256000,0.095000,23.291800><16.256000,-1.595000,23.291800>0.152400 texture{col_hls}}
cylinder{<16.662400,0.095000,27.863800><16.662400,-1.595000,27.863800>0.152400 texture{col_hls}}
cylinder{<17.119600,0.095000,19.786600><17.119600,-1.595000,19.786600>0.152400 texture{col_hls}}
cylinder{<17.119600,0.095000,20.650200><17.119600,-1.595000,20.650200>0.152400 texture{col_hls}}
cylinder{<17.119600,0.095000,21.539200><17.119600,-1.595000,21.539200>0.152400 texture{col_hls}}
cylinder{<17.119600,0.095000,22.402800><17.119600,-1.595000,22.402800>0.152400 texture{col_hls}}
cylinder{<17.119600,0.095000,23.291800><17.119600,-1.595000,23.291800>0.152400 texture{col_hls}}
cylinder{<17.754600,0.095000,27.863800><17.754600,-1.595000,27.863800>0.152400 texture{col_hls}}
cylinder{<17.983200,0.095000,19.786600><17.983200,-1.595000,19.786600>0.152400 texture{col_hls}}
cylinder{<17.983200,0.095000,20.650200><17.983200,-1.595000,20.650200>0.152400 texture{col_hls}}
cylinder{<17.983200,0.095000,21.539200><17.983200,-1.595000,21.539200>0.152400 texture{col_hls}}
cylinder{<17.983200,0.095000,22.402800><17.983200,-1.595000,22.402800>0.152400 texture{col_hls}}
cylinder{<17.983200,0.095000,23.291800><17.983200,-1.595000,23.291800>0.152400 texture{col_hls}}
cylinder{<18.846800,0.095000,19.786600><18.846800,-1.595000,19.786600>0.152400 texture{col_hls}}
cylinder{<18.846800,0.095000,20.650200><18.846800,-1.595000,20.650200>0.152400 texture{col_hls}}
cylinder{<18.846800,0.095000,21.539200><18.846800,-1.595000,21.539200>0.152400 texture{col_hls}}
cylinder{<18.846800,0.095000,22.402800><18.846800,-1.595000,22.402800>0.152400 texture{col_hls}}
cylinder{<18.846800,0.095000,23.291800><18.846800,-1.595000,23.291800>0.152400 texture{col_hls}}
cylinder{<19.710400,0.095000,19.786600><19.710400,-1.595000,19.786600>0.152400 texture{col_hls}}
cylinder{<19.710400,0.095000,20.650200><19.710400,-1.595000,20.650200>0.152400 texture{col_hls}}
cylinder{<19.710400,0.095000,21.539200><19.710400,-1.595000,21.539200>0.152400 texture{col_hls}}
cylinder{<19.710400,0.095000,22.402800><19.710400,-1.595000,22.402800>0.152400 texture{col_hls}}
cylinder{<19.710400,0.095000,23.291800><19.710400,-1.595000,23.291800>0.152400 texture{col_hls}}
cylinder{<19.735800,0.095000,17.322800><19.735800,-1.595000,17.322800>0.152400 texture{col_hls}}
cylinder{<21.513800,0.095000,18.592800><21.513800,-1.595000,18.592800>0.203200 texture{col_hls}}
cylinder{<23.647400,0.095000,16.078200><23.647400,-1.595000,16.078200>0.152400 texture{col_hls}}
cylinder{<23.876000,0.095000,21.793200><23.876000,-1.595000,21.793200>0.152400 texture{col_hls}}
cylinder{<23.952200,0.095000,27.584400><23.952200,-1.595000,27.584400>0.381000 texture{col_hls}}
}//End difference(reale Bohrungen/Durchbrüche)
#end
#if(pcb_parts=on)//Parts
union{
#ifndef(pack_C1) #declare global_pack_C1=yes; object {CAP_SMD_CHIP_0402()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<21.564600,0.000000,26.670000>translate<0,0.035000,0> }#end		//SMD Capacitor 0402 C1 15pF 0402-CAP
#ifndef(pack_C3) #declare global_pack_C3=yes; object {CAP_SMD_CHIP_0402()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<17.805400,0.000000,26.111200>translate<0,0.035000,0> }#end		//SMD Capacitor 0402 C3 2.0pF 0402-CAP
#ifndef(pack_C4) #declare global_pack_C4=yes; object {CAP_SMD_CHIP_0402()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<19.939000,0.000000,27.406600>translate<0,0.035000,0> }#end		//SMD Capacitor 0402 C4 1.5pF 0402-CAP
#ifndef(pack_C5) #declare global_pack_C5=yes; object {CAP_SMD_CHIP_0402()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<17.780000,0.000000,16.306800>translate<0,0.035000,0> }#end		//SMD Capacitor 0402 C5 0.47uF 0402-CAP
#ifndef(pack_C6) #declare global_pack_C6=yes; object {CAP_SMD_CHIP_0402()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<15.392400,0.000000,26.111200>translate<0,0.035000,0> }#end		//SMD Capacitor 0402 C6 0.047uF 0402-CAP
#ifndef(pack_C7) #declare global_pack_C7=yes; object {CAP_SMD_CHIP_0402()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<22.656800,0.000000,17.830800>translate<0,0.035000,0> }#end		//SMD Capacitor 0402 C7 0.047uF 0402-CAP
#ifndef(pack_C8) #declare global_pack_C8=yes; object {CAP_SMD_CHIP_0402()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<13.639800,0.000000,17.805400>translate<0,0.035000,0> }#end		//SMD Capacitor 0402 C8 0.047uF 0402-CAP
#ifndef(pack_C9) #declare global_pack_C9=yes; object {CAP_SMD_CHIP_0402()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<20.066000,0.000000,16.306800>translate<0,0.035000,0> }#end		//SMD Capacitor 0402 C9 0.047uF 0402-CAP
#ifndef(pack_C10) #declare global_pack_C10=yes; object {CAP_SMD_CHIP_0402()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<22.656800,0.000000,20.116800>translate<0,0.035000,0> }#end		//SMD Capacitor 0402 C10 0.047uF 0402-CAP
#ifndef(pack_C11) #declare global_pack_C11=yes; object {CAP_SMD_CHIP_0402()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<22.606000,0.000000,22.453600>translate<0,0.035000,0> }#end		//SMD Capacitor 0402 C11 0.047uF 0402-CAP
#ifndef(pack_C14) #declare global_pack_C14=yes; object {CAP_SMD_CHIP_0805()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<12.801600,-1.500000,19.278600>translate<0,-0.035000,0> }#end		//SMD Capacitor 0805 C14 2.2uF 0805
#ifndef(pack_C15) #declare global_pack_C15=yes; object {CAP_SMD_CHIP_0402()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<13.665200,0.000000,16.306800>translate<0,0.035000,0> }#end		//SMD Capacitor 0402 C15 0.47uF 0402-CAP
#ifndef(pack_CYRF6936) #declare global_pack_CYRF6936=yes; object {IC_SMD_MLF_40_050MM("CYRF6936",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<17.957800,0.000000,21.539200>translate<0,0.035000,0> }#end		//SMD IC MLF40 Package CYRF6936 CYRF6936 QFN40
#ifndef(pack_L2) #declare global_pack_L2=yes; object {CAP_SMD_CHIP_0402()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<19.964400,0.000000,26.111200>translate<0,0.035000,0> }#end		//SMD Capacitor 0402 L2  C0402
#ifndef(pack_Y1) #declare global_pack_Y1=yes; object {SPC_CRES_ABRACON_ABM3B_GRND("",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,180> translate<18.186400,-1.500000,17.424400>}#end		//SMD Ceramic Resonator Y1  CRYSTAL-SMD-5X3
}//End union
#end
#if(pcb_pads_smds=on)
//Pads&SMD/Parts
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<21.564600,0.000000,26.020000>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<21.564600,0.000000,27.320000>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<18.455400,0.000000,26.111200>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<17.155400,0.000000,26.111200>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<20.589000,0.000000,27.406600>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<19.289000,0.000000,27.406600>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<17.130000,0.000000,16.306800>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<18.430000,0.000000,16.306800>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<16.042400,0.000000,26.111200>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<14.742400,0.000000,26.111200>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<22.656800,0.000000,17.180800>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<22.656800,0.000000,18.480800>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<14.289800,0.000000,17.805400>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<12.989800,0.000000,17.805400>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<19.416000,0.000000,16.306800>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<20.716000,0.000000,16.306800>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<22.656800,0.000000,20.766800>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<22.656800,0.000000,19.466800>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<22.606000,0.000000,21.803600>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<22.606000,0.000000,23.103600>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<12.801600,-1.537000,18.378600>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<12.801600,-1.537000,20.178600>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<13.015200,0.000000,16.306800>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<14.315200,0.000000,16.306800>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<20.932800,0.000000,19.289200>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<20.932800,0.000000,19.789200>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<20.932800,0.000000,20.289200>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<20.932800,0.000000,20.789200>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<20.932800,0.000000,21.289200>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<20.932800,0.000000,21.789200>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<20.932800,0.000000,22.289200>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<20.932800,0.000000,22.789200>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<20.932800,0.000000,23.289200>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<20.932800,0.000000,23.789200>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<20.207800,0.000000,24.514200>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<19.707800,0.000000,24.514200>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<19.207800,0.000000,24.514200>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<18.707800,0.000000,24.514200>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<18.207800,0.000000,24.514200>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<17.707800,0.000000,24.514200>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<17.207800,0.000000,24.514200>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<16.707800,0.000000,24.514200>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<16.207800,0.000000,24.514200>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<15.707800,0.000000,24.514200>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<14.982800,0.000000,23.789200>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<14.982800,0.000000,23.289200>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<14.982800,0.000000,22.789200>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<14.982800,0.000000,22.289200>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<14.982800,0.000000,21.789200>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<14.982800,0.000000,21.289200>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<14.982800,0.000000,20.789200>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<14.982800,0.000000,20.289200>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<14.982800,0.000000,19.789200>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<14.982800,0.000000,19.289200>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<15.707800,0.000000,18.564200>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<16.207800,0.000000,18.564200>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<16.707800,0.000000,18.564200>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<17.207800,0.000000,18.564200>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<17.707800,0.000000,18.564200>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<18.207800,0.000000,18.564200>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<18.707800,0.000000,18.564200>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<19.207800,0.000000,18.564200>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<19.707800,0.000000,18.564200>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<20.207800,0.000000,18.564200>}
object{TOOLS_PCB_SMD(4.500000,4.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<17.957800,0.000000,21.539200>}
object{TOOLS_PCB_SMD(1.270000,1.270000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<12.827000,0.000000,27.305000>}
object{TOOLS_PCB_SMD(1.270000,1.270000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<12.827000,0.000000,22.352000>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<23.354400,0.000000,24.968200>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<21.654400,0.000000,24.968200>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<19.314400,0.000000,26.111200>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<20.614400,0.000000,26.111200>}
object{TOOLS_PCB_SMD(1.270000,1.270000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<12.827000,0.000000,19.050000>}
object{TOOLS_PCB_SMD(1.270000,1.270000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<12.827000,0.000000,20.701000>}
object{TOOLS_PCB_SMD(1.270000,1.270000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<12.827000,0.000000,24.003000>}
object{TOOLS_PCB_SMD(1.270000,1.270000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<12.954000,-1.537000,16.535400>}
object{TOOLS_PCB_SMD(1.900000,1.100000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<16.336400,-1.537000,18.574400>}
object{TOOLS_PCB_SMD(1.900000,1.100000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<20.036400,-1.537000,18.574400>}
object{TOOLS_PCB_SMD(1.900000,1.100000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<20.036400,-1.537000,16.274400>}
object{TOOLS_PCB_SMD(1.900000,1.100000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<16.336400,-1.537000,16.274400>}
object{TOOLS_PCB_SMD(1.270000,1.270000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<12.801600,0.000000,25.654000>}
//Pads/Vias
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<19.710400,0,23.291800> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<18.846800,0,23.291800> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<17.983200,0,23.291800> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<17.119600,0,23.291800> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<16.256000,0,23.291800> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<19.710400,0,22.402800> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<18.846800,0,22.402800> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<17.983200,0,22.402800> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<17.119600,0,22.402800> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<16.256000,0,22.402800> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<19.710400,0,21.539200> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<18.846800,0,21.539200> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<17.983200,0,21.539200> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<17.119600,0,21.539200> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<16.256000,0,21.539200> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<19.710400,0,20.650200> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<18.846800,0,20.650200> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<17.983200,0,20.650200> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<17.119600,0,20.650200> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<16.256000,0,20.650200> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<19.710400,0,19.786600> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<18.846800,0,19.786600> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<17.983200,0,19.786600> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<17.119600,0,19.786600> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<16.256000,0,19.786600> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<14.173200,0,27.863800> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.508000,0.304800,1,16,1,0) translate<14.249400,0,24.942800> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<17.754600,0,27.863800> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<23.647400,0,16.078200> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<16.662400,0,27.863800> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<23.876000,0,21.793200> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.508000,0.304800,1,16,1,0) translate<14.071600,0,18.821400> texture{col_wrs}}
object{TOOLS_PCB_VIA(1.066800,0.762000,1,16,1,0) translate<23.952200,0,27.584400> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.711200,0.406400,1,16,1,0) translate<21.513800,0,18.592800> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<15.748000,0,17.322800> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<16.052800,0,27.076400> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<19.735800,0,17.322800> texture{col_wrs}}
#end
#if(pcb_wires=on)
union{
//Signals
difference{union{
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.646400,-1.535000,17.322800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.748000,-1.535000,17.322800>}
box{<0,0,-0.203200><0.101600,0.035000,0.203200> rotate<0,0.000000,0> translate<15.646400,-1.535000,17.322800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.722600,-1.535000,17.297400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.748000,-1.535000,17.322800>}
box{<0,0,-0.127000><0.035921,0.035000,0.127000> rotate<0,-44.997030,0> translate<15.722600,-1.535000,17.297400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<15.748000,0.000000,17.322800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<16.256000,0.000000,17.322800>}
box{<0,0,-0.101600><0.508000,0.035000,0.101600> rotate<0,0.000000,0> translate<15.748000,0.000000,17.322800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.748000,-1.535000,17.322800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.735800,-1.535000,17.322800>}
box{<0,0,-0.203200><3.987800,0.035000,0.203200> rotate<0,0.000000,0> translate<15.748000,-1.535000,17.322800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.909800,-1.535000,17.805400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.646400,-1.535000,17.322800>}
box{<0,0,-0.203200><0.880615,0.035000,0.203200> rotate<0,33.229518,0> translate<14.909800,-1.535000,17.805400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.427200,-1.535000,17.297400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.722600,-1.535000,17.297400>}
box{<0,0,-0.203200><1.295400,0.035000,0.203200> rotate<0,0.000000,0> translate<14.427200,-1.535000,17.297400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<14.772400,0.000000,17.322800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<15.748000,0.000000,17.322800>}
box{<0,0,-0.101600><0.975600,0.035000,0.101600> rotate<0,0.000000,0> translate<14.772400,0.000000,17.322800> }
}cylinder{<15.748000,1,17.322800><15.748000,-2.500000,17.322800>0.152400 texture{col_thl}}}
difference{union{
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.052800,0.000000,27.076400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.052800,0.000000,26.121600>}
box{<0,0,-0.203200><0.954800,0.035000,0.203200> rotate<0,-90.000000,0> translate<16.052800,0.000000,26.121600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.909800,-1.535000,25.120600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.052800,-1.535000,27.076400>}
box{<0,0,-0.203200><2.265304,0.035000,0.203200> rotate<0,-59.693379,0> translate<14.909800,-1.535000,25.120600> }
}cylinder{<16.052800,1,27.076400><16.052800,-2.500000,27.076400>0.152400 texture{col_thl}}}
difference{union{
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.207800,0.000000,23.291800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.256000,0.000000,23.291800>}
box{<0,0,-0.127000><0.048200,0.035000,0.127000> rotate<0,0.000000,0> translate<16.207800,0.000000,23.291800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.207800,0.000000,24.514200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.207800,0.000000,23.291800>}
box{<0,0,-0.152400><1.222400,0.035000,0.152400> rotate<0,-90.000000,0> translate<16.207800,0.000000,23.291800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.982800,0.000000,23.291800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.256000,0.000000,23.291800>}
box{<0,0,-0.152400><1.273200,0.035000,0.152400> rotate<0,0.000000,0> translate<14.982800,0.000000,23.291800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.707800,0.000000,23.840000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.256000,0.000000,23.291800>}
box{<0,0,-0.152400><0.775272,0.035000,0.152400> rotate<0,44.997030,0> translate<15.707800,0.000000,23.840000> }
}cylinder{<16.256000,1,23.291800><16.256000,-2.500000,23.291800>0.152400 texture{col_thl}}}
difference{union{
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.207800,0.000000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.957800,0.000000,21.539200>}
box{<0,0,-0.203200><0.750000,0.035000,0.203200> rotate<0,0.000000,0> translate<17.207800,0.000000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.207800,0.000000,21.031200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.207800,0.000000,21.539200>}
box{<0,0,-0.127000><0.508000,0.035000,0.127000> rotate<0,90.000000,0> translate<17.207800,0.000000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.207800,0.000000,24.514200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.207800,0.000000,21.539200>}
box{<0,0,-0.152400><2.975000,0.035000,0.152400> rotate<0,-90.000000,0> translate<17.207800,0.000000,21.539200> }
}cylinder{<17.119600,1,21.539200><17.119600,-2.500000,21.539200>0.152400 texture{col_thl}}}
difference{union{
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.707800,0.000000,23.291800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.119600,0.000000,23.291800>}
box{<0,0,-0.127000><0.411800,0.035000,0.127000> rotate<0,0.000000,0> translate<16.707800,0.000000,23.291800> }
}cylinder{<17.119600,1,23.291800><17.119600,-2.500000,23.291800>0.152400 texture{col_thl}}}
difference{union{
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.957800,0.000000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.583400,0.000000,21.539200>}
box{<0,0,-0.127000><1.625600,0.035000,0.127000> rotate<0,0.000000,0> translate<17.957800,0.000000,21.539200> }
}cylinder{<17.983200,1,21.539200><17.983200,-2.500000,21.539200>0.152400 texture{col_thl}}}
difference{union{
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.983200,0.000000,23.291800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.207800,0.000000,23.516400>}
box{<0,0,-0.152400><0.317632,0.035000,0.152400> rotate<0,-44.997030,0> translate<17.983200,0.000000,23.291800> }
}cylinder{<17.983200,1,23.291800><17.983200,-2.500000,23.291800>0.152400 texture{col_thl}}}
difference{union{
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.707800,0.000000,19.647600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.846800,0.000000,19.786600>}
box{<0,0,-0.152400><0.196576,0.035000,0.152400> rotate<0,-44.997030,0> translate<18.707800,0.000000,19.647600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.707800,0.000000,18.564200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.707800,0.000000,19.647600>}
box{<0,0,-0.152400><1.083400,0.035000,0.152400> rotate<0,90.000000,0> translate<18.707800,0.000000,19.647600> }
}cylinder{<18.846800,1,19.786600><18.846800,-2.500000,19.786600>0.152400 texture{col_thl}}}
difference{union{
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.707800,0.000000,23.430800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.846800,0.000000,23.291800>}
box{<0,0,-0.152400><0.196576,0.035000,0.152400> rotate<0,44.997030,0> translate<18.707800,0.000000,23.430800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.707800,0.000000,24.514200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.707800,0.000000,23.430800>}
box{<0,0,-0.152400><1.083400,0.035000,0.152400> rotate<0,-90.000000,0> translate<18.707800,0.000000,23.430800> }
}cylinder{<18.846800,1,23.291800><18.846800,-2.500000,23.291800>0.152400 texture{col_thl}}}
difference{union{
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.583400,0.000000,19.939000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.583400,0.000000,20.726400>}
box{<0,0,-0.127000><0.787400,0.035000,0.127000> rotate<0,90.000000,0> translate<19.583400,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.710400,0.000000,19.789200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.710400,0.000000,19.786600>}
box{<0,0,-0.127000><0.002600,0.035000,0.127000> rotate<0,-90.000000,0> translate<19.710400,0.000000,19.786600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.710400,0.000000,19.789200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.932800,0.000000,19.789200>}
box{<0,0,-0.152400><1.222400,0.035000,0.152400> rotate<0,0.000000,0> translate<19.710400,0.000000,19.789200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.710400,0.000000,18.564200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.710400,0.000000,19.786600>}
box{<0,0,-0.152400><1.222400,0.035000,0.152400> rotate<0,90.000000,0> translate<19.710400,0.000000,19.786600> }
}cylinder{<19.710400,1,19.786600><19.710400,-2.500000,19.786600>0.152400 texture{col_thl}}}
difference{union{
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.583400,0.000000,20.802600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.583400,0.000000,21.539200>}
box{<0,0,-0.127000><0.736600,0.035000,0.127000> rotate<0,90.000000,0> translate<19.583400,0.000000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.583400,0.000000,20.802600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.932800,0.000000,20.777200>}
box{<0,0,-0.152400><1.349639,0.035000,0.152400> rotate<0,1.078290,0> translate<19.583400,0.000000,20.802600> }
}cylinder{<19.710400,1,20.650200><19.710400,-2.500000,20.650200>0.152400 texture{col_thl}}}
difference{union{
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.707800,0.000000,23.294400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.710400,0.000000,23.291800>}
box{<0,0,-0.152400><0.003677,0.035000,0.152400> rotate<0,44.997030,0> translate<19.707800,0.000000,23.294400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.710400,0.000000,23.291800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.713000,0.000000,23.289200>}
box{<0,0,-0.152400><0.003677,0.035000,0.152400> rotate<0,44.997030,0> translate<19.710400,0.000000,23.291800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.713000,0.000000,23.289200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.932800,0.000000,23.289200>}
box{<0,0,-0.152400><1.219800,0.035000,0.152400> rotate<0,0.000000,0> translate<19.713000,0.000000,23.289200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.707800,0.000000,24.514200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.707800,0.000000,23.294400>}
box{<0,0,-0.152400><1.219800,0.035000,0.152400> rotate<0,-90.000000,0> translate<19.707800,0.000000,23.294400> }
}cylinder{<19.710400,1,23.291800><19.710400,-2.500000,23.291800>0.152400 texture{col_thl}}}
difference{union{
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.735800,0.000000,17.322800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.207800,0.000000,17.794800>}
box{<0,0,-0.101600><0.667509,0.035000,0.101600> rotate<0,-44.997030,0> translate<19.735800,0.000000,17.322800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.735800,0.000000,17.322800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.514800,0.000000,17.322800>}
box{<0,0,-0.203200><2.779000,0.035000,0.203200> rotate<0,0.000000,0> translate<19.735800,0.000000,17.322800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.207800,0.000000,17.850800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.735800,0.000000,17.322800>}
box{<0,0,-0.101600><0.746705,0.035000,0.101600> rotate<0,44.997030,0> translate<19.207800,0.000000,17.850800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.416000,0.000000,17.003000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.735800,0.000000,17.322800>}
box{<0,0,-0.101600><0.452265,0.035000,0.101600> rotate<0,-44.997030,0> translate<19.416000,0.000000,17.003000> }
}cylinder{<19.735800,1,17.322800><19.735800,-2.500000,17.322800>0.152400 texture{col_thl}}}
difference{union{
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.513800,-1.535000,18.592800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.513800,-1.535000,17.802600>}
box{<0,0,-0.127000><0.790200,0.035000,0.127000> rotate<0,-90.000000,0> translate<21.513800,-1.535000,17.802600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.932800,0.000000,19.173800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.513800,0.000000,18.592800>}
box{<0,0,-0.127000><0.821658,0.035000,0.127000> rotate<0,44.997030,0> translate<20.932800,0.000000,19.173800> }
}cylinder{<21.513800,1,18.592800><21.513800,-2.500000,18.592800>0.203200 texture{col_thl}}}
difference{union{
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.687800,0.000000,27.320000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.952200,0.000000,27.584400>}
box{<0,0,-0.254000><0.373918,0.035000,0.254000> rotate<0,-44.997030,0> translate<23.687800,0.000000,27.320000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.564600,0.000000,27.320000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.687800,0.000000,27.320000>}
box{<0,0,-0.254000><2.123200,0.035000,0.254000> rotate<0,0.000000,0> translate<21.564600,0.000000,27.320000> }
}cylinder{<23.952200,1,27.584400><23.952200,-2.500000,27.584400>0.381000 texture{col_thl}}}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.954000,-1.535000,18.378600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.954000,-1.535000,16.535400>}
box{<0,0,-0.304800><1.843200,0.035000,0.304800> rotate<0,-90.000000,0> translate<12.954000,-1.535000,16.535400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.801600,-1.535000,18.378600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.954000,-1.535000,18.378600>}
box{<0,0,-0.304800><0.152400,0.035000,0.304800> rotate<0,0.000000,0> translate<12.801600,-1.535000,18.378600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<12.827000,0.000000,20.701000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<13.030200,0.000000,20.701000>}
box{<0,0,-0.101600><0.203200,0.035000,0.101600> rotate<0,0.000000,0> translate<12.827000,0.000000,20.701000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<12.827000,0.000000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<13.081000,0.000000,19.304000>}
box{<0,0,-0.101600><0.359210,0.035000,0.101600> rotate<0,-44.997030,0> translate<12.827000,0.000000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<12.827000,0.000000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<13.258800,0.000000,22.352000>}
box{<0,0,-0.101600><0.431800,0.035000,0.101600> rotate<0,0.000000,0> translate<12.827000,0.000000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<13.030200,0.000000,20.701000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<13.309600,0.000000,20.421600>}
box{<0,0,-0.101600><0.395131,0.035000,0.101600> rotate<0,44.997030,0> translate<13.030200,0.000000,20.701000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<13.081000,0.000000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<13.411200,0.000000,19.304000>}
box{<0,0,-0.101600><0.330200,0.035000,0.101600> rotate<0,0.000000,0> translate<13.081000,0.000000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<12.801600,0.000000,25.654000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<13.512800,0.000000,25.654000>}
box{<0,0,-0.101600><0.711200,0.035000,0.101600> rotate<0,0.000000,0> translate<12.801600,0.000000,25.654000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<12.827000,0.000000,24.003000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<13.716000,0.000000,23.114000>}
box{<0,0,-0.101600><1.257236,0.035000,0.101600> rotate<0,44.997030,0> translate<12.827000,0.000000,24.003000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<13.716000,0.000000,22.402800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<13.716000,0.000000,23.114000>}
box{<0,0,-0.101600><0.711200,0.035000,0.101600> rotate<0,90.000000,0> translate<13.716000,0.000000,23.114000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<13.512800,0.000000,25.654000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<13.716000,0.000000,25.450800>}
box{<0,0,-0.101600><0.287368,0.035000,0.101600> rotate<0,44.997030,0> translate<13.512800,0.000000,25.654000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<13.716000,0.000000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<13.716000,0.000000,25.450800>}
box{<0,0,-0.101600><1.828800,0.035000,0.101600> rotate<0,90.000000,0> translate<13.716000,0.000000,25.450800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.954000,-1.535000,16.535400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.868400,-1.535000,16.738600>}
box{<0,0,-0.203200><0.936706,0.035000,0.203200> rotate<0,-12.527981,0> translate<12.954000,-1.535000,16.535400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<13.309600,0.000000,20.421600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<13.970000,0.000000,20.421600>}
box{<0,0,-0.101600><0.660400,0.035000,0.101600> rotate<0,0.000000,0> translate<13.309600,0.000000,20.421600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<13.716000,0.000000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<14.071600,0.000000,23.266400>}
box{<0,0,-0.101600><0.502894,0.035000,0.101600> rotate<0,44.997030,0> translate<13.716000,0.000000,23.622000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<14.071600,0.000000,22.555200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<14.071600,0.000000,23.266400>}
box{<0,0,-0.101600><0.711200,0.035000,0.101600> rotate<0,90.000000,0> translate<14.071600,0.000000,23.266400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<13.015200,0.000000,16.306800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<14.289800,0.000000,17.530600>}
box{<0,0,-0.101600><1.767001,0.035000,0.101600> rotate<0,-43.832272,0> translate<13.015200,0.000000,16.306800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<14.289800,0.000000,17.805400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<14.289800,0.000000,17.530600>}
box{<0,0,-0.101600><0.274800,0.035000,0.101600> rotate<0,-90.000000,0> translate<14.289800,0.000000,17.530600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<13.970000,0.000000,20.421600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<14.325600,0.000000,20.777200>}
box{<0,0,-0.101600><0.502894,0.035000,0.101600> rotate<0,-44.997030,0> translate<13.970000,0.000000,20.421600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<13.258800,0.000000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<14.325600,0.000000,21.285200>}
box{<0,0,-0.101600><1.508683,0.035000,0.101600> rotate<0,44.997030,0> translate<13.258800,0.000000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<13.716000,0.000000,22.402800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<14.329600,0.000000,21.789200>}
box{<0,0,-0.101600><0.867761,0.035000,0.101600> rotate<0,44.997030,0> translate<13.716000,0.000000,22.402800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<14.071600,0.000000,22.555200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<14.337600,0.000000,22.289200>}
box{<0,0,-0.101600><0.376181,0.035000,0.101600> rotate<0,44.997030,0> translate<14.071600,0.000000,22.555200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<13.411200,0.000000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<14.396400,0.000000,20.289200>}
box{<0,0,-0.101600><1.393283,0.035000,0.101600> rotate<0,-44.997030,0> translate<13.411200,0.000000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.868400,-1.535000,16.738600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.427200,-1.535000,17.297400>}
box{<0,0,-0.203200><0.790263,0.035000,0.203200> rotate<0,-44.997030,0> translate<13.868400,-1.535000,16.738600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<14.742400,0.000000,25.479600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<14.742400,0.000000,26.111200>}
box{<0,0,-0.101600><0.631600,0.035000,0.101600> rotate<0,90.000000,0> translate<14.742400,0.000000,26.111200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<14.289800,0.000000,17.805400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<14.772400,0.000000,17.322800>}
box{<0,0,-0.101600><0.682499,0.035000,0.101600> rotate<0,44.997030,0> translate<14.289800,0.000000,17.805400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.909800,-1.535000,17.805400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.909800,-1.535000,25.120600>}
box{<0,0,-0.203200><7.315200,0.035000,0.203200> rotate<0,90.000000,0> translate<14.909800,-1.535000,25.120600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<14.325600,0.000000,20.777200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<14.970800,0.000000,20.777200>}
box{<0,0,-0.101600><0.645200,0.035000,0.101600> rotate<0,0.000000,0> translate<14.325600,0.000000,20.777200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<14.325600,0.000000,21.285200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<14.978800,0.000000,21.285200>}
box{<0,0,-0.101600><0.653200,0.035000,0.101600> rotate<0,0.000000,0> translate<14.325600,0.000000,21.285200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<14.396400,0.000000,20.289200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<14.982800,0.000000,20.289200>}
box{<0,0,-0.101600><0.586400,0.035000,0.101600> rotate<0,0.000000,0> translate<14.396400,0.000000,20.289200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<14.970800,0.000000,20.777200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<14.982800,0.000000,20.789200>}
box{<0,0,-0.101600><0.016971,0.035000,0.101600> rotate<0,-44.997030,0> translate<14.970800,0.000000,20.777200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<14.978800,0.000000,21.285200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<14.982800,0.000000,21.289200>}
box{<0,0,-0.101600><0.005657,0.035000,0.101600> rotate<0,-44.997030,0> translate<14.978800,0.000000,21.285200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<14.329600,0.000000,21.789200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<14.982800,0.000000,21.789200>}
box{<0,0,-0.101600><0.653200,0.035000,0.101600> rotate<0,0.000000,0> translate<14.329600,0.000000,21.789200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<14.337600,0.000000,22.289200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<14.982800,0.000000,22.289200>}
box{<0,0,-0.101600><0.645200,0.035000,0.101600> rotate<0,0.000000,0> translate<14.337600,0.000000,22.289200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.982800,0.000000,22.789200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.982800,0.000000,23.291800>}
box{<0,0,-0.152400><0.502600,0.035000,0.152400> rotate<0,90.000000,0> translate<14.982800,0.000000,23.291800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.982800,0.000000,23.289200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.982800,0.000000,23.789200>}
box{<0,0,-0.152400><0.500000,0.035000,0.152400> rotate<0,90.000000,0> translate<14.982800,0.000000,23.789200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<14.315200,0.000000,16.306800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<15.773400,0.000000,16.256000>}
box{<0,0,-0.101600><1.459085,0.035000,0.101600> rotate<0,1.995101,0> translate<14.315200,0.000000,16.306800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.875000,0.000000,26.339800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.042400,0.000000,26.111200>}
box{<0,0,-0.076200><0.283339,0.035000,0.076200> rotate<0,53.781749,0> translate<15.875000,0.000000,26.339800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<16.042400,0.000000,26.111200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<16.052800,0.000000,26.121600>}
box{<0,0,-0.101600><0.014708,0.035000,0.101600> rotate<0,-44.997030,0> translate<16.042400,0.000000,26.111200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.042400,0.000000,26.111200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.078200,0.000000,26.075400>}
box{<0,0,-0.076200><0.050629,0.035000,0.076200> rotate<0,44.997030,0> translate<16.042400,0.000000,26.111200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.078200,0.000000,25.527000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.078200,0.000000,26.075400>}
box{<0,0,-0.127000><0.548400,0.035000,0.127000> rotate<0,90.000000,0> translate<16.078200,0.000000,26.075400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.707800,0.000000,18.564200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.205200,0.000000,18.564200>}
box{<0,0,-0.127000><0.497400,0.035000,0.127000> rotate<0,0.000000,0> translate<15.707800,0.000000,18.564200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.205200,0.000000,18.564200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.205200,0.000000,21.031200>}
box{<0,0,-0.152400><2.467000,0.035000,0.152400> rotate<0,90.000000,0> translate<16.205200,0.000000,21.031200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.078200,0.000000,25.527000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.281400,0.000000,25.323800>}
box{<0,0,-0.127000><0.287368,0.035000,0.127000> rotate<0,44.997030,0> translate<16.078200,0.000000,25.527000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<16.256000,0.000000,17.322800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<16.707800,0.000000,17.774600>}
box{<0,0,-0.101600><0.638942,0.035000,0.101600> rotate<0,-44.997030,0> translate<16.256000,0.000000,17.322800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<16.707800,0.000000,18.564200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<16.707800,0.000000,17.774600>}
box{<0,0,-0.101600><0.789600,0.035000,0.101600> rotate<0,-90.000000,0> translate<16.707800,0.000000,17.774600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.707800,0.000000,24.514200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.707800,0.000000,23.291800>}
box{<0,0,-0.152400><1.222400,0.035000,0.152400> rotate<0,-90.000000,0> translate<16.707800,0.000000,23.291800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<17.130000,0.000000,16.306800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<17.155400,0.000000,16.749000>}
box{<0,0,-0.101600><0.442929,0.035000,0.101600> rotate<0,-86.706816,0> translate<17.130000,0.000000,16.306800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<15.773400,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<17.207800,0.000000,17.690400>}
box{<0,0,-0.101600><2.028548,0.035000,0.101600> rotate<0,-44.997030,0> translate<15.773400,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<17.207800,0.000000,18.564200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<17.207800,0.000000,17.690400>}
box{<0,0,-0.101600><0.873800,0.035000,0.101600> rotate<0,-90.000000,0> translate<17.207800,0.000000,17.690400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.205200,0.000000,21.031200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.207800,0.000000,21.031200>}
box{<0,0,-0.127000><1.002600,0.035000,0.127000> rotate<0,0.000000,0> translate<16.205200,0.000000,21.031200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.281400,0.000000,25.323800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.500600,0.000000,25.323800>}
box{<0,0,-0.127000><1.219200,0.035000,0.127000> rotate<0,0.000000,0> translate<16.281400,0.000000,25.323800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<17.155400,0.000000,16.749000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<17.703800,0.000000,17.297400>}
box{<0,0,-0.101600><0.775555,0.035000,0.101600> rotate<0,-44.997030,0> translate<17.155400,0.000000,16.749000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<17.703800,0.000000,17.297400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<17.703800,0.000000,18.560200>}
box{<0,0,-0.101600><1.262800,0.035000,0.101600> rotate<0,90.000000,0> translate<17.703800,0.000000,18.560200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<17.703800,0.000000,18.560200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<17.707800,0.000000,18.564200>}
box{<0,0,-0.101600><0.005657,0.035000,0.101600> rotate<0,-44.997030,0> translate<17.703800,0.000000,18.560200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<17.500600,0.000000,25.323800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<17.707800,0.000000,25.116600>}
box{<0,0,-0.101600><0.293025,0.035000,0.101600> rotate<0,44.997030,0> translate<17.500600,0.000000,25.323800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.707800,0.000000,24.514200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.707800,0.000000,25.116600>}
box{<0,0,-0.127000><0.602400,0.035000,0.127000> rotate<0,90.000000,0> translate<17.707800,0.000000,25.116600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.207800,0.000000,24.514200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.207800,0.000000,23.516400>}
box{<0,0,-0.152400><0.997800,0.035000,0.152400> rotate<0,-90.000000,0> translate<18.207800,0.000000,23.516400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.207800,0.000000,18.564200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.707800,0.000000,18.564200>}
box{<0,0,-0.152400><0.500000,0.035000,0.152400> rotate<0,0.000000,0> translate<18.207800,0.000000,18.564200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.207800,0.000000,18.564200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.207800,0.000000,17.850800>}
box{<0,0,-0.101600><0.713400,0.035000,0.101600> rotate<0,-90.000000,0> translate<19.207800,0.000000,17.850800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.207800,0.000000,24.514200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.207800,0.000000,26.004600>}
box{<0,0,-0.127000><1.490400,0.035000,0.127000> rotate<0,90.000000,0> translate<19.207800,0.000000,26.004600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.455400,0.000000,26.111200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.314400,0.000000,26.111200>}
box{<0,0,-0.203200><0.859000,0.035000,0.203200> rotate<0,0.000000,0> translate<18.455400,0.000000,26.111200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.207800,0.000000,26.004600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.314400,0.000000,26.111200>}
box{<0,0,-0.076200><0.150755,0.035000,0.076200> rotate<0,-44.997030,0> translate<19.207800,0.000000,26.004600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.416000,0.000000,17.003000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.416000,0.000000,16.306800>}
box{<0,0,-0.101600><0.696200,0.035000,0.101600> rotate<0,-90.000000,0> translate<19.416000,0.000000,16.306800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.707800,0.000000,18.564200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.710400,0.000000,18.564200>}
box{<0,0,-0.127000><0.002600,0.035000,0.127000> rotate<0,0.000000,0> translate<19.707800,0.000000,18.564200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.207800,0.000000,18.564200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.207800,0.000000,17.794800>}
box{<0,0,-0.101600><0.769400,0.035000,0.101600> rotate<0,-90.000000,0> translate<20.207800,0.000000,17.794800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.207800,0.000000,24.514200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.207800,0.000000,25.059200>}
box{<0,0,-0.127000><0.545000,0.035000,0.127000> rotate<0,90.000000,0> translate<20.207800,0.000000,25.059200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.207800,0.000000,25.059200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.599400,0.000000,25.450800>}
box{<0,0,-0.127000><0.553806,0.035000,0.127000> rotate<0,-44.997030,0> translate<20.207800,0.000000,25.059200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.599400,0.000000,25.450800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.599400,0.000000,26.096200>}
box{<0,0,-0.127000><0.645400,0.035000,0.127000> rotate<0,90.000000,0> translate<20.599400,0.000000,26.096200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.599400,0.000000,26.096200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.614400,0.000000,26.111200>}
box{<0,0,-0.076200><0.021213,0.035000,0.076200> rotate<0,-44.997030,0> translate<20.599400,0.000000,26.096200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.659600,0.000000,21.285200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.928800,0.000000,21.285200>}
box{<0,0,-0.152400><1.269200,0.035000,0.152400> rotate<0,0.000000,0> translate<19.659600,0.000000,21.285200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.932800,0.000000,19.289200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.932800,0.000000,19.173800>}
box{<0,0,-0.127000><0.115400,0.035000,0.127000> rotate<0,-90.000000,0> translate<20.932800,0.000000,19.173800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.932800,0.000000,21.289200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.932800,0.000000,20.777200>}
box{<0,0,-0.152400><0.512000,0.035000,0.152400> rotate<0,-90.000000,0> translate<20.932800,0.000000,20.777200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.928800,0.000000,21.285200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.932800,0.000000,21.289200>}
box{<0,0,-0.127000><0.005657,0.035000,0.127000> rotate<0,-44.997030,0> translate<20.928800,0.000000,21.285200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.932800,0.000000,22.289200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.932800,0.000000,21.789200>}
box{<0,0,-0.127000><0.500000,0.035000,0.127000> rotate<0,-90.000000,0> translate<20.932800,0.000000,21.789200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.932800,0.000000,22.289200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.932800,0.000000,22.789200>}
box{<0,0,-0.127000><0.500000,0.035000,0.127000> rotate<0,90.000000,0> translate<20.932800,0.000000,22.789200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.932800,0.000000,21.289200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.943800,0.000000,21.300200>}
box{<0,0,-0.127000><0.015556,0.035000,0.127000> rotate<0,-44.997030,0> translate<20.932800,0.000000,21.289200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.932800,0.000000,22.289200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.946200,0.000000,22.275800>}
box{<0,0,-0.101600><0.018950,0.035000,0.101600> rotate<0,44.997030,0> translate<20.932800,0.000000,22.289200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.932800,0.000000,23.789200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.325400,0.000000,23.789200>}
box{<0,0,-0.101600><0.392600,0.035000,0.101600> rotate<0,0.000000,0> translate<20.932800,0.000000,23.789200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.036400,-1.535000,16.274400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.513800,-1.535000,17.802600>}
box{<0,0,-0.127000><2.125584,0.035000,0.127000> rotate<0,-45.965275,0> translate<20.036400,-1.535000,16.274400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.564600,0.000000,26.020000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.654400,0.000000,25.930200>}
box{<0,0,-0.101600><0.126996,0.035000,0.101600> rotate<0,44.997030,0> translate<21.564600,0.000000,26.020000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.654400,0.000000,24.968200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.654400,0.000000,25.930200>}
box{<0,0,-0.101600><0.962000,0.035000,0.101600> rotate<0,90.000000,0> translate<21.654400,0.000000,25.930200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.614400,0.000000,26.111200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.655800,0.000000,26.111200>}
box{<0,0,-0.203200><1.041400,0.035000,0.203200> rotate<0,0.000000,0> translate<20.614400,0.000000,26.111200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.564600,0.000000,26.020000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.655800,0.000000,26.111200>}
box{<0,0,-0.101600><0.128976,0.035000,0.101600> rotate<0,-44.997030,0> translate<21.564600,0.000000,26.020000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.325400,0.000000,23.789200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.691600,0.000000,24.155400>}
box{<0,0,-0.101600><0.517885,0.035000,0.101600> rotate<0,-44.997030,0> translate<21.325400,0.000000,23.789200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.946200,0.000000,22.275800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.767800,0.000000,22.275800>}
box{<0,0,-0.101600><0.821600,0.035000,0.101600> rotate<0,0.000000,0> translate<20.946200,0.000000,22.275800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.932800,0.000000,20.289200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.179200,0.000000,20.289200>}
box{<0,0,-0.101600><1.246400,0.035000,0.101600> rotate<0,0.000000,0> translate<20.932800,0.000000,20.289200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.767800,0.000000,22.275800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.240000,0.000000,21.803600>}
box{<0,0,-0.101600><0.667792,0.035000,0.101600> rotate<0,44.997030,0> translate<21.767800,0.000000,22.275800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.691600,0.000000,24.155400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.541600,0.000000,24.155400>}
box{<0,0,-0.101600><0.850000,0.035000,0.101600> rotate<0,0.000000,0> translate<21.691600,0.000000,24.155400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.240000,0.000000,21.803600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.606000,0.000000,21.803600>}
box{<0,0,-0.101600><0.366000,0.035000,0.101600> rotate<0,0.000000,0> translate<22.240000,0.000000,21.803600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.514800,0.000000,17.322800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.656800,0.000000,17.180800>}
box{<0,0,-0.203200><0.200818,0.035000,0.203200> rotate<0,44.997030,0> translate<22.514800,0.000000,17.322800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.179200,0.000000,20.289200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.656800,0.000000,20.766800>}
box{<0,0,-0.101600><0.675428,0.035000,0.101600> rotate<0,-44.997030,0> translate<22.179200,0.000000,20.289200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.606000,0.000000,21.803600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.656800,0.000000,21.752800>}
box{<0,0,-0.101600><0.071842,0.035000,0.101600> rotate<0,44.997030,0> translate<22.606000,0.000000,21.803600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.656800,0.000000,20.766800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.656800,0.000000,21.752800>}
box{<0,0,-0.101600><0.986000,0.035000,0.101600> rotate<0,90.000000,0> translate<22.656800,0.000000,21.752800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.656800,0.000000,17.180800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.175200,0.000000,17.180800>}
box{<0,0,-0.203200><0.518400,0.035000,0.203200> rotate<0,0.000000,0> translate<22.656800,0.000000,17.180800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.541600,0.000000,24.155400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<23.354400,0.000000,24.968200>}
box{<0,0,-0.101600><1.149473,0.035000,0.101600> rotate<0,-44.997030,0> translate<22.541600,0.000000,24.155400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.656800,0.000000,20.766800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.505400,0.000000,20.766800>}
box{<0,0,-0.203200><0.848600,0.035000,0.203200> rotate<0,0.000000,0> translate<22.656800,0.000000,20.766800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.175200,0.000000,17.180800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.622000,0.000000,17.627600>}
box{<0,0,-0.203200><0.631871,0.035000,0.203200> rotate<0,-44.997030,0> translate<23.175200,0.000000,17.180800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.622000,0.000000,20.650200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.622000,0.000000,17.627600>}
box{<0,0,-0.203200><3.022600,0.035000,0.203200> rotate<0,-90.000000,0> translate<23.622000,0.000000,17.627600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.505400,0.000000,20.766800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.622000,0.000000,20.650200>}
box{<0,0,-0.203200><0.164897,0.035000,0.203200> rotate<0,44.997030,0> translate<23.505400,0.000000,20.766800> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,0.000000,15.778125>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,0.000000,18.186400>}
box{<0,0,-0.076200><2.408275,0.035000,0.076200> rotate<0,90.000000,0> translate<12.162725,0.000000,18.186400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,0.000000,15.778125>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.436600,0.000000,15.778125>}
box{<0,0,-0.076200><0.273875,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,0.000000,15.778125> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.436600,0.000000,15.849600>}
box{<0,0,-0.076200><0.273875,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,0.000000,16.002000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.436600,0.000000,16.002000>}
box{<0,0,-0.076200><0.273875,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,0.000000,16.002000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,0.000000,16.154400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.436600,0.000000,16.154400>}
box{<0,0,-0.076200><0.273875,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,0.000000,16.154400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,0.000000,16.306800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.436600,0.000000,16.306800>}
box{<0,0,-0.076200><0.273875,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,0.000000,16.306800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,0.000000,16.459200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.436600,0.000000,16.459200>}
box{<0,0,-0.076200><0.273875,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,0.000000,16.459200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,0.000000,16.611600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.436600,0.000000,16.611600>}
box{<0,0,-0.076200><0.273875,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,0.000000,16.611600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,0.000000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.436600,0.000000,16.764000>}
box{<0,0,-0.076200><0.273875,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,0.000000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,0.000000,16.916400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.501513,0.000000,16.916400>}
box{<0,0,-0.076200><0.338788,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,0.000000,16.916400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.332072,0.000000,17.068800>}
box{<0,0,-0.076200><1.169347,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,0.000000,17.221200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.490800,0.000000,17.221200>}
box{<0,0,-0.076200><1.328075,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,0.000000,17.221200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,0.000000,17.373600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.649525,0.000000,17.373600>}
box{<0,0,-0.076200><1.486800,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,0.000000,17.373600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,0.000000,17.526000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.711200,0.000000,17.526000>}
box{<0,0,-0.076200><1.548475,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,0.000000,17.526000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,0.000000,17.678400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.711200,0.000000,17.678400>}
box{<0,0,-0.076200><1.548475,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,0.000000,17.678400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,0.000000,17.830800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.711200,0.000000,17.830800>}
box{<0,0,-0.076200><1.548475,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,0.000000,17.830800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,0.000000,17.983200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.711200,0.000000,17.983200>}
box{<0,0,-0.076200><1.548475,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,0.000000,17.983200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,0.000000,18.135600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.711200,0.000000,18.135600>}
box{<0,0,-0.076200><1.548475,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,0.000000,18.135600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,0.000000,18.186400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.556688,0.000000,18.186400>}
box{<0,0,-0.076200><1.393963,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,0.000000,18.186400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,-1.535000,19.007197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,-1.535000,19.448400>}
box{<0,0,-0.076200><0.441203,0.035000,0.076200> rotate<0,90.000000,0> translate<12.162725,-1.535000,19.448400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,-1.535000,19.007197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.496288,-1.535000,19.007197>}
box{<0,0,-0.076200><1.333563,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,-1.535000,19.007197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.478000,-1.535000,19.050000>}
box{<0,0,-0.076200><2.315275,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,-1.535000,19.202400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.478000,-1.535000,19.202400>}
box{<0,0,-0.076200><2.315275,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,-1.535000,19.202400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,-1.535000,19.354800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.478000,-1.535000,19.354800>}
box{<0,0,-0.076200><2.315275,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,-1.535000,19.354800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,-1.535000,19.448400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.725403,-1.535000,19.448400>}
box{<0,0,-0.076200><0.562678,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,-1.535000,19.448400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,-1.535000,20.908797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,-1.535000,28.117475>}
box{<0,0,-0.076200><7.208678,0.035000,0.076200> rotate<0,90.000000,0> translate<12.162725,-1.535000,28.117475> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,-1.535000,20.908797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.725403,-1.535000,20.908797>}
box{<0,0,-0.076200><0.562678,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,-1.535000,20.908797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,-1.535000,21.031200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.478000,-1.535000,21.031200>}
box{<0,0,-0.076200><2.315275,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,-1.535000,21.031200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,-1.535000,21.183600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.478000,-1.535000,21.183600>}
box{<0,0,-0.076200><2.315275,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,-1.535000,21.183600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,-1.535000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.478000,-1.535000,21.336000>}
box{<0,0,-0.076200><2.315275,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,-1.535000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,-1.535000,21.488400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.478000,-1.535000,21.488400>}
box{<0,0,-0.076200><2.315275,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,-1.535000,21.488400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,-1.535000,21.640800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.478000,-1.535000,21.640800>}
box{<0,0,-0.076200><2.315275,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,-1.535000,21.640800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,-1.535000,21.793200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.478000,-1.535000,21.793200>}
box{<0,0,-0.076200><2.315275,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,-1.535000,21.793200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.478000,-1.535000,21.945600>}
box{<0,0,-0.076200><2.315275,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,-1.535000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.478000,-1.535000,22.098000>}
box{<0,0,-0.076200><2.315275,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,-1.535000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,-1.535000,22.250400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.478000,-1.535000,22.250400>}
box{<0,0,-0.076200><2.315275,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,-1.535000,22.250400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,-1.535000,22.402800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.478000,-1.535000,22.402800>}
box{<0,0,-0.076200><2.315275,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,-1.535000,22.402800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,-1.535000,22.555200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.478000,-1.535000,22.555200>}
box{<0,0,-0.076200><2.315275,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,-1.535000,22.555200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,-1.535000,22.707600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.478000,-1.535000,22.707600>}
box{<0,0,-0.076200><2.315275,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,-1.535000,22.707600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.478000,-1.535000,22.860000>}
box{<0,0,-0.076200><2.315275,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,-1.535000,23.012400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.478000,-1.535000,23.012400>}
box{<0,0,-0.076200><2.315275,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,-1.535000,23.012400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.478000,-1.535000,23.164800>}
box{<0,0,-0.076200><2.315275,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,-1.535000,23.317200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.478000,-1.535000,23.317200>}
box{<0,0,-0.076200><2.315275,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,-1.535000,23.317200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,-1.535000,23.469600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.478000,-1.535000,23.469600>}
box{<0,0,-0.076200><2.315275,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,-1.535000,23.469600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,-1.535000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.478000,-1.535000,23.622000>}
box{<0,0,-0.076200><2.315275,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,-1.535000,23.622000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,-1.535000,23.774400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.478000,-1.535000,23.774400>}
box{<0,0,-0.076200><2.315275,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,-1.535000,23.774400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,-1.535000,23.926800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.478000,-1.535000,23.926800>}
box{<0,0,-0.076200><2.315275,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,-1.535000,23.926800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,-1.535000,24.079200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.478000,-1.535000,24.079200>}
box{<0,0,-0.076200><2.315275,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,-1.535000,24.079200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,-1.535000,24.231600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.478000,-1.535000,24.231600>}
box{<0,0,-0.076200><2.315275,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,-1.535000,24.231600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.478000,-1.535000,24.384000>}
box{<0,0,-0.076200><2.315275,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,-1.535000,24.536400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.478000,-1.535000,24.536400>}
box{<0,0,-0.076200><2.315275,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,-1.535000,24.536400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,-1.535000,24.688800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.478000,-1.535000,24.688800>}
box{<0,0,-0.076200><2.315275,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,-1.535000,24.688800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,-1.535000,24.841200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.478000,-1.535000,24.841200>}
box{<0,0,-0.076200><2.315275,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,-1.535000,24.841200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,-1.535000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.478000,-1.535000,24.993600>}
box{<0,0,-0.076200><2.315275,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,-1.535000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,-1.535000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.456728,-1.535000,25.146000>}
box{<0,0,-0.076200><2.294003,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,-1.535000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,-1.535000,25.298400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.478000,-1.535000,25.298400>}
box{<0,0,-0.076200><2.315275,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,-1.535000,25.298400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,-1.535000,25.450800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.602647,-1.535000,25.450800>}
box{<0,0,-0.076200><2.439922,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,-1.535000,25.450800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,-1.535000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.691713,-1.535000,25.603200>}
box{<0,0,-0.076200><2.528988,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,-1.535000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,-1.535000,25.755600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.780778,-1.535000,25.755600>}
box{<0,0,-0.076200><2.618053,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,-1.535000,25.755600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,-1.535000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.869841,-1.535000,25.908000>}
box{<0,0,-0.076200><2.707116,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,-1.535000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,-1.535000,26.060400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.958906,-1.535000,26.060400>}
box{<0,0,-0.076200><2.796181,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,-1.535000,26.060400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,-1.535000,26.212800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.047972,-1.535000,26.212800>}
box{<0,0,-0.076200><2.885247,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,-1.535000,26.212800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,-1.535000,26.365200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.137034,-1.535000,26.365200>}
box{<0,0,-0.076200><2.974309,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,-1.535000,26.365200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,0.000000,26.517597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,0.000000,28.117475>}
box{<0,0,-0.076200><1.599878,0.035000,0.076200> rotate<0,90.000000,0> translate<12.162725,0.000000,28.117475> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,0.000000,26.517597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.531288,0.000000,26.517597>}
box{<0,0,-0.076200><1.368563,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,0.000000,26.517597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,-1.535000,26.517600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.226100,-1.535000,26.517600>}
box{<0,0,-0.076200><3.063375,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,-1.535000,26.517600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,0.000000,26.517600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.463800,0.000000,26.517600>}
box{<0,0,-0.076200><3.301075,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,0.000000,26.517600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.315166,-1.535000,26.670000>}
box{<0,0,-0.076200><3.152441,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,0.000000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.477916,0.000000,26.670000>}
box{<0,0,-0.076200><3.315191,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,0.000000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,-1.535000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.404231,-1.535000,26.822400>}
box{<0,0,-0.076200><3.241506,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,-1.535000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,0.000000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.552456,0.000000,26.822400>}
box{<0,0,-0.076200><3.389731,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,0.000000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,-1.535000,26.974800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.493294,-1.535000,26.974800>}
box{<0,0,-0.076200><3.330569,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,-1.535000,26.974800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,0.000000,26.974800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.519400,0.000000,26.974800>}
box{<0,0,-0.076200><3.356675,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,0.000000,26.974800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,0.000000,27.127200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.519400,0.000000,27.127200>}
box{<0,0,-0.076200><3.356675,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,0.000000,27.127200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,-1.535000,27.127200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.519400,-1.535000,27.127200>}
box{<0,0,-0.076200><3.356675,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,-1.535000,27.127200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,0.000000,27.279600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.519400,0.000000,27.279600>}
box{<0,0,-0.076200><3.356675,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,0.000000,27.279600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,-1.535000,27.279600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.519400,-1.535000,27.279600>}
box{<0,0,-0.076200><3.356675,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,-1.535000,27.279600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,0.000000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.654059,0.000000,27.432000>}
box{<0,0,-0.076200><3.491334,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,0.000000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,-1.535000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.654059,-1.535000,27.432000>}
box{<0,0,-0.076200><3.491334,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,-1.535000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,0.000000,27.584400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.806459,0.000000,27.584400>}
box{<0,0,-0.076200><3.643734,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,0.000000,27.584400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,-1.535000,27.584400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.806459,-1.535000,27.584400>}
box{<0,0,-0.076200><3.643734,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,-1.535000,27.584400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,0.000000,27.736800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.894800,0.000000,27.736800>}
box{<0,0,-0.076200><9.732075,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,0.000000,27.736800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,-1.535000,27.736800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.190544,-1.535000,27.736800>}
box{<0,0,-0.076200><11.027819,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,-1.535000,27.736800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,0.000000,27.889200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.894800,0.000000,27.889200>}
box{<0,0,-0.076200><9.732075,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,0.000000,27.889200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,-1.535000,27.889200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.253672,-1.535000,27.889200>}
box{<0,0,-0.076200><11.090947,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,-1.535000,27.889200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,0.000000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.894800,0.000000,28.041600>}
box{<0,0,-0.076200><9.732075,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,0.000000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,-1.535000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.331772,-1.535000,28.041600>}
box{<0,0,-0.076200><11.169047,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,-1.535000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,0.000000,28.117475>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.894800,0.000000,28.117475>}
box{<0,0,-0.076200><9.732075,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,0.000000,28.117475> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.162725,-1.535000,28.117475>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.407647,-1.535000,28.117475>}
box{<0,0,-0.076200><11.244922,0.035000,0.076200> rotate<0,0.000000,0> translate<12.162725,-1.535000,28.117475> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.436600,0.000000,16.851488>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.436600,0.000000,15.778125>}
box{<0,0,-0.076200><1.073362,0.035000,0.076200> rotate<0,-90.000000,0> translate<12.436600,0.000000,15.778125> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.436600,0.000000,16.851488>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.570509,0.000000,16.985397>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<12.436600,0.000000,16.851488> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.570509,0.000000,16.985397>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.245206,0.000000,16.985397>}
box{<0,0,-0.076200><0.674697,0.035000,0.076200> rotate<0,0.000000,0> translate<12.570509,0.000000,16.985397> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.725403,-1.535000,19.448400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.725403,-1.535000,20.102388>}
box{<0,0,-0.076200><0.653988,0.035000,0.076200> rotate<0,90.000000,0> translate<12.725403,-1.535000,20.102388> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.725403,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.877791,-1.535000,19.507200>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<12.725403,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.725403,-1.535000,19.659600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.877791,-1.535000,19.659600>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<12.725403,-1.535000,19.659600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.725403,-1.535000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.877791,-1.535000,19.812000>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<12.725403,-1.535000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.725403,-1.535000,19.964400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.877791,-1.535000,19.964400>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<12.725403,-1.535000,19.964400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.725403,-1.535000,20.102388>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.877791,-1.535000,20.102388>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<12.725403,-1.535000,20.102388> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.725403,-1.535000,20.254809>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.725403,-1.535000,20.908797>}
box{<0,0,-0.076200><0.653987,0.035000,0.076200> rotate<0,90.000000,0> translate<12.725403,-1.535000,20.908797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.725403,-1.535000,20.254809>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.877791,-1.535000,20.254809>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<12.725403,-1.535000,20.254809> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.725403,-1.535000,20.269200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.877791,-1.535000,20.269200>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<12.725403,-1.535000,20.269200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.725403,-1.535000,20.421600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.877791,-1.535000,20.421600>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<12.725403,-1.535000,20.421600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.725403,-1.535000,20.574000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.877791,-1.535000,20.574000>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<12.725403,-1.535000,20.574000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.725403,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.877791,-1.535000,20.726400>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<12.725403,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.725403,-1.535000,20.878800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.877791,-1.535000,20.878800>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<12.725403,-1.535000,20.878800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.877791,-1.535000,19.448400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.445072,-1.535000,19.448400>}
box{<0,0,-0.076200><0.567281,0.035000,0.076200> rotate<0,0.000000,0> translate<12.877791,-1.535000,19.448400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.877791,-1.535000,20.102388>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.877791,-1.535000,19.448400>}
box{<0,0,-0.076200><0.653988,0.035000,0.076200> rotate<0,-90.000000,0> translate<12.877791,-1.535000,19.448400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.877791,-1.535000,20.908797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.877791,-1.535000,20.254809>}
box{<0,0,-0.076200><0.653987,0.035000,0.076200> rotate<0,-90.000000,0> translate<12.877791,-1.535000,20.254809> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.877791,-1.535000,20.908797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.445072,-1.535000,20.908797>}
box{<0,0,-0.076200><0.567281,0.035000,0.076200> rotate<0,0.000000,0> translate<12.877791,-1.535000,20.908797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.877809,-1.535000,20.102403>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.877809,-1.535000,20.254791>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,90.000000,0> translate<12.877809,-1.535000,20.254791> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.877809,-1.535000,20.102403>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.731797,-1.535000,20.102403>}
box{<0,0,-0.076200><0.853988,0.035000,0.076200> rotate<0,0.000000,0> translate<12.877809,-1.535000,20.102403> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.877809,-1.535000,20.116800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.478000,-1.535000,20.116800>}
box{<0,0,-0.076200><1.600191,0.035000,0.076200> rotate<0,0.000000,0> translate<12.877809,-1.535000,20.116800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.877809,-1.535000,20.254791>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.731797,-1.535000,20.254791>}
box{<0,0,-0.076200><0.853988,0.035000,0.076200> rotate<0,0.000000,0> translate<12.877809,-1.535000,20.254791> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.245206,0.000000,16.985397>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.711200,0.000000,17.432819>}
box{<0,0,-0.076200><0.646016,0.035000,0.076200> rotate<0,-43.832310,0> translate<13.245206,0.000000,16.985397> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.445072,-1.535000,19.448400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.529050,-1.535000,19.470903>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-14.999808,0> translate<13.445072,-1.535000,19.448400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.445072,-1.535000,20.908797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.529050,-1.535000,20.886294>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,14.999808,0> translate<13.445072,-1.535000,20.908797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.487397,-1.535000,17.398997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.487397,-1.535000,17.750000>}
box{<0,0,-0.076200><0.351003,0.035000,0.076200> rotate<0,90.000000,0> translate<13.487397,-1.535000,17.750000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.487397,-1.535000,17.398997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.683688,-1.535000,17.398997>}
box{<0,0,-0.076200><0.196291,0.035000,0.076200> rotate<0,0.000000,0> translate<13.487397,-1.535000,17.398997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.487397,-1.535000,17.526000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.045144,-1.535000,17.526000>}
box{<0,0,-0.076200><0.557747,0.035000,0.076200> rotate<0,0.000000,0> translate<13.487397,-1.535000,17.526000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.487397,-1.535000,17.678400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.197544,-1.535000,17.678400>}
box{<0,0,-0.076200><0.710147,0.035000,0.076200> rotate<0,0.000000,0> translate<13.487397,-1.535000,17.678400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.487397,-1.535000,17.750000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.496288,-1.535000,17.750000>}
box{<0,0,-0.076200><0.008891,0.035000,0.076200> rotate<0,0.000000,0> translate<13.487397,-1.535000,17.750000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.496288,-1.535000,17.750000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.630197,-1.535000,17.883909>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<13.496288,-1.535000,17.750000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.496288,-1.535000,19.007197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.630197,-1.535000,18.873287>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<13.496288,-1.535000,19.007197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.529050,-1.535000,19.470903>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.604347,-1.535000,19.514375>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-29.997566,0> translate<13.529050,-1.535000,19.470903> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.529050,-1.535000,20.886294>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.604347,-1.535000,20.842822>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,29.997566,0> translate<13.529050,-1.535000,20.886294> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.531288,0.000000,26.517597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.665197,0.000000,26.383688>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<13.531288,0.000000,26.517597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.542031,-1.535000,20.878800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.478000,-1.535000,20.878800>}
box{<0,0,-0.076200><0.935969,0.035000,0.076200> rotate<0,0.000000,0> translate<13.542031,-1.535000,20.878800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.556688,0.000000,18.186400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.690597,0.000000,18.320309>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<13.556688,0.000000,18.186400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.577088,-1.535000,17.830800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.463434,-1.535000,17.830800>}
box{<0,0,-0.076200><0.886347,0.035000,0.076200> rotate<0,0.000000,0> translate<13.577088,-1.535000,17.830800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.591919,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.478000,-1.535000,19.507200>}
box{<0,0,-0.076200><0.886081,0.035000,0.076200> rotate<0,0.000000,0> translate<13.591919,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.604347,-1.535000,19.514375>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.665822,-1.535000,19.575850>}
box{<0,0,-0.076200><0.086939,0.035000,0.076200> rotate<0,-44.997030,0> translate<13.604347,-1.535000,19.514375> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.604347,-1.535000,20.842822>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.665822,-1.535000,20.781347>}
box{<0,0,-0.076200><0.086939,0.035000,0.076200> rotate<0,44.997030,0> translate<13.604347,-1.535000,20.842822> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.605884,-1.535000,18.897600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.478000,-1.535000,18.897600>}
box{<0,0,-0.076200><0.872116,0.035000,0.076200> rotate<0,0.000000,0> translate<13.605884,-1.535000,18.897600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.630197,-1.535000,17.883909>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.630197,-1.535000,18.873287>}
box{<0,0,-0.076200><0.989378,0.035000,0.076200> rotate<0,90.000000,0> translate<13.630197,-1.535000,18.873287> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.630197,-1.535000,17.983200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.478000,-1.535000,17.983200>}
box{<0,0,-0.076200><0.847803,0.035000,0.076200> rotate<0,0.000000,0> translate<13.630197,-1.535000,17.983200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.630197,-1.535000,18.135600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.478000,-1.535000,18.135600>}
box{<0,0,-0.076200><0.847803,0.035000,0.076200> rotate<0,0.000000,0> translate<13.630197,-1.535000,18.135600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.630197,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.478000,-1.535000,18.288000>}
box{<0,0,-0.076200><0.847803,0.035000,0.076200> rotate<0,0.000000,0> translate<13.630197,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.630197,-1.535000,18.440400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.478000,-1.535000,18.440400>}
box{<0,0,-0.076200><0.847803,0.035000,0.076200> rotate<0,0.000000,0> translate<13.630197,-1.535000,18.440400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.630197,-1.535000,18.592800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.478000,-1.535000,18.592800>}
box{<0,0,-0.076200><0.847803,0.035000,0.076200> rotate<0,0.000000,0> translate<13.630197,-1.535000,18.592800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.630197,-1.535000,18.745200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.478000,-1.535000,18.745200>}
box{<0,0,-0.076200><0.847803,0.035000,0.076200> rotate<0,0.000000,0> translate<13.630197,-1.535000,18.745200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.658288,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.711200,0.000000,18.288000>}
box{<0,0,-0.076200><0.052912,0.035000,0.076200> rotate<0,0.000000,0> translate<13.658288,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.665197,0.000000,25.968572>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.665197,0.000000,26.383688>}
box{<0,0,-0.076200><0.415116,0.035000,0.076200> rotate<0,90.000000,0> translate<13.665197,0.000000,26.383688> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.665197,0.000000,25.968572>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.842997,0.000000,25.790772>}
box{<0,0,-0.076200><0.251447,0.035000,0.076200> rotate<0,44.997030,0> translate<13.665197,0.000000,25.968572> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.665197,0.000000,26.060400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.463800,0.000000,26.060400>}
box{<0,0,-0.076200><1.798603,0.035000,0.076200> rotate<0,0.000000,0> translate<13.665197,0.000000,26.060400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.665197,0.000000,26.212800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.463800,0.000000,26.212800>}
box{<0,0,-0.076200><1.798603,0.035000,0.076200> rotate<0,0.000000,0> translate<13.665197,0.000000,26.212800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.665197,0.000000,26.365200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.463800,0.000000,26.365200>}
box{<0,0,-0.076200><1.798603,0.035000,0.076200> rotate<0,0.000000,0> translate<13.665197,0.000000,26.365200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.665822,-1.535000,19.575850>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.709294,-1.535000,19.651147>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-59.996495,0> translate<13.665822,-1.535000,19.575850> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.665822,-1.535000,20.781347>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.709294,-1.535000,20.706050>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,59.996495,0> translate<13.665822,-1.535000,20.781347> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.683688,-1.535000,17.398997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.800913,-1.535000,17.281769>}
box{<0,0,-0.076200><0.165783,0.035000,0.076200> rotate<0,44.997794,0> translate<13.683688,-1.535000,17.398997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.690597,0.000000,18.320309>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.690597,0.000000,19.116425>}
box{<0,0,-0.076200><0.796116,0.035000,0.076200> rotate<0,90.000000,0> translate<13.690597,0.000000,19.116425> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.690597,0.000000,18.440400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.801513,0.000000,18.440400>}
box{<0,0,-0.076200><0.110916,0.035000,0.076200> rotate<0,0.000000,0> translate<13.690597,0.000000,18.440400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.690597,0.000000,18.592800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.339200,0.000000,18.592800>}
box{<0,0,-0.076200><2.648603,0.035000,0.076200> rotate<0,0.000000,0> translate<13.690597,0.000000,18.592800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.690597,0.000000,18.745200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.339200,0.000000,18.745200>}
box{<0,0,-0.076200><2.648603,0.035000,0.076200> rotate<0,0.000000,0> translate<13.690597,0.000000,18.745200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.690597,0.000000,18.897600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.339200,0.000000,18.897600>}
box{<0,0,-0.076200><2.648603,0.035000,0.076200> rotate<0,0.000000,0> translate<13.690597,0.000000,18.897600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.690597,0.000000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.333709,0.000000,19.050000>}
box{<0,0,-0.076200><0.643113,0.035000,0.076200> rotate<0,0.000000,0> translate<13.690597,0.000000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.690597,0.000000,19.116425>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.741397,0.000000,19.167225>}
box{<0,0,-0.076200><0.071842,0.035000,0.076200> rotate<0,-44.997030,0> translate<13.690597,0.000000,19.116425> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.697547,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.478000,-1.535000,20.726400>}
box{<0,0,-0.076200><0.780453,0.035000,0.076200> rotate<0,0.000000,0> translate<13.697547,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.709084,-1.535000,17.373600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.892744,-1.535000,17.373600>}
box{<0,0,-0.076200><0.183659,0.035000,0.076200> rotate<0,0.000000,0> translate<13.709084,-1.535000,17.373600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.709294,-1.535000,19.651147>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.731797,-1.535000,19.735125>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-74.994252,0> translate<13.709294,-1.535000,19.651147> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.709294,-1.535000,20.706050>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.731797,-1.535000,20.622072>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,74.994252,0> translate<13.709294,-1.535000,20.706050> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.711200,0.000000,18.350088>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.711200,0.000000,17.432819>}
box{<0,0,-0.076200><0.917269,0.035000,0.076200> rotate<0,-90.000000,0> translate<13.711200,0.000000,17.432819> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.711200,0.000000,18.350088>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.845109,0.000000,18.483997>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<13.711200,0.000000,18.350088> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.711556,-1.535000,19.659600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.478000,-1.535000,19.659600>}
box{<0,0,-0.076200><0.766444,0.035000,0.076200> rotate<0,0.000000,0> translate<13.711556,-1.535000,19.659600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.725769,0.000000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.463800,0.000000,25.908000>}
box{<0,0,-0.076200><1.738031,0.035000,0.076200> rotate<0,0.000000,0> translate<13.725769,0.000000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.731797,-1.535000,19.735125>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.731797,-1.535000,20.102403>}
box{<0,0,-0.076200><0.367278,0.035000,0.076200> rotate<0,90.000000,0> translate<13.731797,-1.535000,20.102403> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.731797,-1.535000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.478000,-1.535000,19.812000>}
box{<0,0,-0.076200><0.746203,0.035000,0.076200> rotate<0,0.000000,0> translate<13.731797,-1.535000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.731797,-1.535000,19.964400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.478000,-1.535000,19.964400>}
box{<0,0,-0.076200><0.746203,0.035000,0.076200> rotate<0,0.000000,0> translate<13.731797,-1.535000,19.964400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.731797,-1.535000,20.254791>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.731797,-1.535000,20.622072>}
box{<0,0,-0.076200><0.367281,0.035000,0.076200> rotate<0,90.000000,0> translate<13.731797,-1.535000,20.622072> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.731797,-1.535000,20.269200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.478000,-1.535000,20.269200>}
box{<0,0,-0.076200><0.746203,0.035000,0.076200> rotate<0,0.000000,0> translate<13.731797,-1.535000,20.269200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.731797,-1.535000,20.421600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.478000,-1.535000,20.421600>}
box{<0,0,-0.076200><0.746203,0.035000,0.076200> rotate<0,0.000000,0> translate<13.731797,-1.535000,20.421600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.731797,-1.535000,20.574000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.478000,-1.535000,20.574000>}
box{<0,0,-0.076200><0.746203,0.035000,0.076200> rotate<0,0.000000,0> translate<13.731797,-1.535000,20.574000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.741397,0.000000,19.167225>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.329200,0.000000,19.755031>}
box{<0,0,-0.076200><0.831281,0.035000,0.076200> rotate<0,-44.997182,0> translate<13.741397,0.000000,19.167225> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.776569,0.000000,19.202400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.329200,0.000000,19.202400>}
box{<0,0,-0.076200><0.552631,0.035000,0.076200> rotate<0,0.000000,0> translate<13.776569,0.000000,19.202400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.800913,-1.535000,17.281769>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.995400,-1.535000,17.476256>}
box{<0,0,-0.076200><0.275047,0.035000,0.076200> rotate<0,-44.997030,0> translate<13.800913,-1.535000,17.281769> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.842997,0.000000,25.790772>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.046197,0.000000,25.587572>}
box{<0,0,-0.076200><0.287368,0.035000,0.076200> rotate<0,44.997030,0> translate<13.842997,0.000000,25.790772> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.845109,0.000000,18.483997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.734488,0.000000,18.483997>}
box{<0,0,-0.076200><0.889378,0.035000,0.076200> rotate<0,0.000000,0> translate<13.845109,0.000000,18.483997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.878169,0.000000,25.755600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.463800,0.000000,25.755600>}
box{<0,0,-0.076200><1.585631,0.035000,0.076200> rotate<0,0.000000,0> translate<13.878169,0.000000,25.755600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.928969,0.000000,19.354800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.329200,0.000000,19.354800>}
box{<0,0,-0.076200><0.400231,0.035000,0.076200> rotate<0,0.000000,0> translate<13.928969,0.000000,19.354800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.995400,-1.535000,17.476256>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.248341,-1.535000,17.729197>}
box{<0,0,-0.076200><0.357712,0.035000,0.076200> rotate<0,-44.997030,0> translate<13.995400,-1.535000,17.476256> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.030569,0.000000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.463800,0.000000,25.603200>}
box{<0,0,-0.076200><1.433231,0.035000,0.076200> rotate<0,0.000000,0> translate<14.030569,0.000000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.046197,0.000000,23.758772>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.046197,0.000000,25.587572>}
box{<0,0,-0.076200><1.828800,0.035000,0.076200> rotate<0,90.000000,0> translate<14.046197,0.000000,25.587572> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.046197,0.000000,23.758772>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.401797,0.000000,23.403172>}
box{<0,0,-0.076200><0.502894,0.035000,0.076200> rotate<0,44.997030,0> translate<14.046197,0.000000,23.758772> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.046197,0.000000,23.774400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.279200,0.000000,23.774400>}
box{<0,0,-0.076200><6.233003,0.035000,0.076200> rotate<0,0.000000,0> translate<14.046197,0.000000,23.774400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.046197,0.000000,23.926800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.406909,0.000000,23.926800>}
box{<0,0,-0.076200><3.360712,0.035000,0.076200> rotate<0,0.000000,0> translate<14.046197,0.000000,23.926800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.046197,0.000000,24.079200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.339200,0.000000,24.079200>}
box{<0,0,-0.076200><3.293003,0.035000,0.076200> rotate<0,0.000000,0> translate<14.046197,0.000000,24.079200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.046197,0.000000,24.231600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.339200,0.000000,24.231600>}
box{<0,0,-0.076200><3.293003,0.035000,0.076200> rotate<0,0.000000,0> translate<14.046197,0.000000,24.231600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.046197,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.339200,0.000000,24.384000>}
box{<0,0,-0.076200><3.293003,0.035000,0.076200> rotate<0,0.000000,0> translate<14.046197,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.046197,0.000000,24.536400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.339200,0.000000,24.536400>}
box{<0,0,-0.076200><3.293003,0.035000,0.076200> rotate<0,0.000000,0> translate<14.046197,0.000000,24.536400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.046197,0.000000,24.688800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.339200,0.000000,24.688800>}
box{<0,0,-0.076200><3.293003,0.035000,0.076200> rotate<0,0.000000,0> translate<14.046197,0.000000,24.688800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.046197,0.000000,24.841200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.339200,0.000000,24.841200>}
box{<0,0,-0.076200><3.293003,0.035000,0.076200> rotate<0,0.000000,0> translate<14.046197,0.000000,24.841200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.046197,0.000000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.108703,0.000000,24.993600>}
box{<0,0,-0.076200><2.062506,0.035000,0.076200> rotate<0,0.000000,0> translate<14.046197,0.000000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.046197,0.000000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.956303,0.000000,25.146000>}
box{<0,0,-0.076200><1.910106,0.035000,0.076200> rotate<0,0.000000,0> translate<14.046197,0.000000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.046197,0.000000,25.298400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.803903,0.000000,25.298400>}
box{<0,0,-0.076200><1.757706,0.035000,0.076200> rotate<0,0.000000,0> translate<14.046197,0.000000,25.298400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.046197,0.000000,25.450800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.579509,0.000000,25.450800>}
box{<0,0,-0.076200><1.533312,0.035000,0.076200> rotate<0,0.000000,0> translate<14.046197,0.000000,25.450800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.081369,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.329200,0.000000,19.507200>}
box{<0,0,-0.076200><0.247831,0.035000,0.076200> rotate<0,0.000000,0> translate<14.081369,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.182969,0.000000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.279200,0.000000,23.622000>}
box{<0,0,-0.076200><6.096231,0.035000,0.076200> rotate<0,0.000000,0> translate<14.182969,0.000000,23.622000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.233769,0.000000,19.659600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.329200,0.000000,19.659600>}
box{<0,0,-0.076200><0.095431,0.035000,0.076200> rotate<0,0.000000,0> translate<14.233769,0.000000,19.659600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.248341,-1.535000,17.729197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.478000,-1.535000,17.729197>}
box{<0,0,-0.076200><0.229659,0.035000,0.076200> rotate<0,0.000000,0> translate<14.248341,-1.535000,17.729197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.329200,0.000000,19.054509>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.463109,0.000000,18.920600>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<14.329200,0.000000,19.054509> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.329200,0.000000,19.523888>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.329200,0.000000,19.054509>}
box{<0,0,-0.076200><0.469378,0.035000,0.076200> rotate<0,-90.000000,0> translate<14.329200,0.000000,19.054509> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.329200,0.000000,19.523888>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.344513,0.000000,19.539200>}
box{<0,0,-0.076200><0.021655,0.035000,0.076200> rotate<0,-44.997030,0> translate<14.329200,0.000000,19.523888> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.329200,0.000000,19.554509>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.344513,0.000000,19.539200>}
box{<0,0,-0.076200><0.021653,0.035000,0.076200> rotate<0,44.991183,0> translate<14.329200,0.000000,19.554509> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.329200,0.000000,19.755031>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.329200,0.000000,19.554509>}
box{<0,0,-0.076200><0.200522,0.035000,0.076200> rotate<0,-90.000000,0> translate<14.329200,0.000000,19.554509> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.335369,0.000000,23.469600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.364109,0.000000,23.469600>}
box{<0,0,-0.076200><6.028741,0.035000,0.076200> rotate<0,0.000000,0> translate<14.335369,0.000000,23.469600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.401797,0.000000,22.691972>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.401797,0.000000,23.403172>}
box{<0,0,-0.076200><0.711200,0.035000,0.076200> rotate<0,90.000000,0> translate<14.401797,0.000000,23.403172> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.401797,0.000000,22.691972>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.449541,0.000000,22.644225>}
box{<0,0,-0.076200><0.067522,0.035000,0.076200> rotate<0,44.998905,0> translate<14.401797,0.000000,22.691972> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.401797,0.000000,22.707600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.279200,0.000000,22.707600>}
box{<0,0,-0.076200><5.877403,0.035000,0.076200> rotate<0,0.000000,0> translate<14.401797,0.000000,22.707600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.401797,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.279200,0.000000,22.860000>}
box{<0,0,-0.076200><5.877403,0.035000,0.076200> rotate<0,0.000000,0> translate<14.401797,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.401797,0.000000,23.012400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.279200,0.000000,23.012400>}
box{<0,0,-0.076200><5.877403,0.035000,0.076200> rotate<0,0.000000,0> translate<14.401797,0.000000,23.012400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.401797,0.000000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,0.000000,23.164800>}
box{<0,0,-0.076200><10.100278,0.035000,0.076200> rotate<0,0.000000,0> translate<14.401797,0.000000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.401797,0.000000,23.317200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,0.000000,23.317200>}
box{<0,0,-0.076200><10.100278,0.035000,0.076200> rotate<0,0.000000,0> translate<14.401797,0.000000,23.317200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.446750,-1.535000,25.184050>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.478000,-1.535000,25.064909>}
box{<0,0,-0.076200><0.123171,0.035000,0.076200> rotate<0,75.297711,0> translate<14.446750,-1.535000,25.184050> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.446750,-1.535000,25.184050>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.478000,-1.535000,25.237522>}
box{<0,0,-0.076200><0.061934,0.035000,0.076200> rotate<0,-59.693217,0> translate<14.446750,-1.535000,25.184050> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.449541,0.000000,22.644225>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.463109,0.000000,22.657797>}
box{<0,0,-0.076200><0.019191,0.035000,0.076200> rotate<0,-45.003627,0> translate<14.449541,0.000000,22.644225> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.450597,-1.535000,17.892431>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.478000,-1.535000,17.760894>}
box{<0,0,-0.076200><0.134362,0.035000,0.076200> rotate<0,78.226765,0> translate<14.450597,-1.535000,17.892431> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.450597,-1.535000,17.892431>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.478000,-1.535000,17.934256>}
box{<0,0,-0.076200><0.050003,0.035000,0.076200> rotate<0,-56.764026,0> translate<14.450597,-1.535000,17.892431> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.463109,0.000000,18.920600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.502488,0.000000,18.920600>}
box{<0,0,-0.076200><1.039378,0.035000,0.076200> rotate<0,0.000000,0> translate<14.463109,0.000000,18.920600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.463109,0.000000,22.657797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.502488,0.000000,22.657797>}
box{<0,0,-0.076200><1.039378,0.035000,0.076200> rotate<0,0.000000,0> translate<14.463109,0.000000,22.657797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.478000,-1.535000,17.760894>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.478000,-1.535000,17.729197>}
box{<0,0,-0.076200><0.031697,0.035000,0.076200> rotate<0,-90.000000,0> translate<14.478000,-1.535000,17.729197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.478000,-1.535000,25.064909>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.478000,-1.535000,17.934256>}
box{<0,0,-0.076200><7.130653,0.035000,0.076200> rotate<0,-90.000000,0> translate<14.478000,-1.535000,17.934256> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.478000,-1.535000,25.299456>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.478000,-1.535000,25.237522>}
box{<0,0,-0.076200><0.061934,0.035000,0.076200> rotate<0,-90.000000,0> translate<14.478000,-1.535000,25.237522> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.478000,-1.535000,25.299456>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.565097,-1.535000,25.386550>}
box{<0,0,-0.076200><0.123171,0.035000,0.076200> rotate<0,-44.996002,0> translate<14.478000,-1.535000,25.299456> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.565097,-1.535000,25.386550>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.519400,-1.535000,27.019472>}
box{<0,0,-0.076200><1.891330,0.035000,0.076200> rotate<0,-59.693428,0> translate<14.565097,-1.535000,25.386550> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.734488,0.000000,18.483997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.868397,0.000000,18.350088>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<14.734488,0.000000,18.483997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.778084,0.000000,18.440400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.339200,0.000000,18.440400>}
box{<0,0,-0.076200><1.561116,0.035000,0.076200> rotate<0,0.000000,0> translate<14.778084,0.000000,18.440400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.868397,0.000000,17.693772>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.868397,0.000000,18.350088>}
box{<0,0,-0.076200><0.656316,0.035000,0.076200> rotate<0,90.000000,0> translate<14.868397,0.000000,18.350088> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.868397,0.000000,17.693772>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.909172,0.000000,17.652997>}
box{<0,0,-0.076200><0.057665,0.035000,0.076200> rotate<0,44.997030,0> translate<14.868397,0.000000,17.693772> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.868397,0.000000,17.830800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.501659,0.000000,17.830800>}
box{<0,0,-0.076200><0.633263,0.035000,0.076200> rotate<0,0.000000,0> translate<14.868397,0.000000,17.830800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.868397,0.000000,17.983200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.377600,0.000000,17.983200>}
box{<0,0,-0.076200><1.509203,0.035000,0.076200> rotate<0,0.000000,0> translate<14.868397,0.000000,17.983200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.868397,0.000000,18.135600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.339200,0.000000,18.135600>}
box{<0,0,-0.076200><1.470803,0.035000,0.076200> rotate<0,0.000000,0> translate<14.868397,0.000000,18.135600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.868397,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.339200,0.000000,18.288000>}
box{<0,0,-0.076200><1.470803,0.035000,0.076200> rotate<0,0.000000,0> translate<14.868397,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.883769,0.000000,17.678400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.349259,0.000000,17.678400>}
box{<0,0,-0.076200><0.465491,0.035000,0.076200> rotate<0,0.000000,0> translate<14.883769,0.000000,17.678400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.909172,0.000000,17.652997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.323856,0.000000,17.652997>}
box{<0,0,-0.076200><0.414684,0.035000,0.076200> rotate<0,0.000000,0> translate<14.909172,0.000000,17.652997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.323856,0.000000,17.652997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.527056,0.000000,17.856197>}
box{<0,0,-0.076200><0.287368,0.035000,0.076200> rotate<0,-44.997030,0> translate<15.323856,0.000000,17.652997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.341597,-1.535000,19.454238>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.341597,-1.535000,25.003675>}
box{<0,0,-0.076200><5.549437,0.035000,0.076200> rotate<0,90.000000,0> translate<15.341597,-1.535000,25.003675> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.341597,-1.535000,19.454238>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.342925,-1.535000,19.454597>}
box{<0,0,-0.076200><0.001376,0.035000,0.076200> rotate<0,-15.139985,0> translate<15.341597,-1.535000,19.454238> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.341597,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,19.507200>}
box{<0,0,-0.076200><9.160478,0.035000,0.076200> rotate<0,0.000000,0> translate<15.341597,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.341597,-1.535000,19.659600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,19.659600>}
box{<0,0,-0.076200><9.160478,0.035000,0.076200> rotate<0,0.000000,0> translate<15.341597,-1.535000,19.659600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.341597,-1.535000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,19.812000>}
box{<0,0,-0.076200><9.160478,0.035000,0.076200> rotate<0,0.000000,0> translate<15.341597,-1.535000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.341597,-1.535000,19.964400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,19.964400>}
box{<0,0,-0.076200><9.160478,0.035000,0.076200> rotate<0,0.000000,0> translate<15.341597,-1.535000,19.964400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.341597,-1.535000,20.116800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,20.116800>}
box{<0,0,-0.076200><9.160478,0.035000,0.076200> rotate<0,0.000000,0> translate<15.341597,-1.535000,20.116800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.341597,-1.535000,20.269200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,20.269200>}
box{<0,0,-0.076200><9.160478,0.035000,0.076200> rotate<0,0.000000,0> translate<15.341597,-1.535000,20.269200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.341597,-1.535000,20.421600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,20.421600>}
box{<0,0,-0.076200><9.160478,0.035000,0.076200> rotate<0,0.000000,0> translate<15.341597,-1.535000,20.421600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.341597,-1.535000,20.574000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,20.574000>}
box{<0,0,-0.076200><9.160478,0.035000,0.076200> rotate<0,0.000000,0> translate<15.341597,-1.535000,20.574000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.341597,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,20.726400>}
box{<0,0,-0.076200><9.160478,0.035000,0.076200> rotate<0,0.000000,0> translate<15.341597,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.341597,-1.535000,20.878800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,20.878800>}
box{<0,0,-0.076200><9.160478,0.035000,0.076200> rotate<0,0.000000,0> translate<15.341597,-1.535000,20.878800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.341597,-1.535000,21.031200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,21.031200>}
box{<0,0,-0.076200><9.160478,0.035000,0.076200> rotate<0,0.000000,0> translate<15.341597,-1.535000,21.031200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.341597,-1.535000,21.183600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,21.183600>}
box{<0,0,-0.076200><9.160478,0.035000,0.076200> rotate<0,0.000000,0> translate<15.341597,-1.535000,21.183600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.341597,-1.535000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,21.336000>}
box{<0,0,-0.076200><9.160478,0.035000,0.076200> rotate<0,0.000000,0> translate<15.341597,-1.535000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.341597,-1.535000,21.488400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,21.488400>}
box{<0,0,-0.076200><9.160478,0.035000,0.076200> rotate<0,0.000000,0> translate<15.341597,-1.535000,21.488400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.341597,-1.535000,21.640800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,21.640800>}
box{<0,0,-0.076200><9.160478,0.035000,0.076200> rotate<0,0.000000,0> translate<15.341597,-1.535000,21.640800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.341597,-1.535000,21.793200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,21.793200>}
box{<0,0,-0.076200><9.160478,0.035000,0.076200> rotate<0,0.000000,0> translate<15.341597,-1.535000,21.793200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.341597,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,21.945600>}
box{<0,0,-0.076200><9.160478,0.035000,0.076200> rotate<0,0.000000,0> translate<15.341597,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.341597,-1.535000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,22.098000>}
box{<0,0,-0.076200><9.160478,0.035000,0.076200> rotate<0,0.000000,0> translate<15.341597,-1.535000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.341597,-1.535000,22.250400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,22.250400>}
box{<0,0,-0.076200><9.160478,0.035000,0.076200> rotate<0,0.000000,0> translate<15.341597,-1.535000,22.250400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.341597,-1.535000,22.402800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,22.402800>}
box{<0,0,-0.076200><9.160478,0.035000,0.076200> rotate<0,0.000000,0> translate<15.341597,-1.535000,22.402800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.341597,-1.535000,22.555200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,22.555200>}
box{<0,0,-0.076200><9.160478,0.035000,0.076200> rotate<0,0.000000,0> translate<15.341597,-1.535000,22.555200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.341597,-1.535000,22.707600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,22.707600>}
box{<0,0,-0.076200><9.160478,0.035000,0.076200> rotate<0,0.000000,0> translate<15.341597,-1.535000,22.707600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.341597,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,22.860000>}
box{<0,0,-0.076200><9.160478,0.035000,0.076200> rotate<0,0.000000,0> translate<15.341597,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.341597,-1.535000,23.012400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,23.012400>}
box{<0,0,-0.076200><9.160478,0.035000,0.076200> rotate<0,0.000000,0> translate<15.341597,-1.535000,23.012400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.341597,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,23.164800>}
box{<0,0,-0.076200><9.160478,0.035000,0.076200> rotate<0,0.000000,0> translate<15.341597,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.341597,-1.535000,23.317200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,23.317200>}
box{<0,0,-0.076200><9.160478,0.035000,0.076200> rotate<0,0.000000,0> translate<15.341597,-1.535000,23.317200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.341597,-1.535000,23.469600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,23.469600>}
box{<0,0,-0.076200><9.160478,0.035000,0.076200> rotate<0,0.000000,0> translate<15.341597,-1.535000,23.469600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.341597,-1.535000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,23.622000>}
box{<0,0,-0.076200><9.160478,0.035000,0.076200> rotate<0,0.000000,0> translate<15.341597,-1.535000,23.622000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.341597,-1.535000,23.774400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,23.774400>}
box{<0,0,-0.076200><9.160478,0.035000,0.076200> rotate<0,0.000000,0> translate<15.341597,-1.535000,23.774400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.341597,-1.535000,23.926800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,23.926800>}
box{<0,0,-0.076200><9.160478,0.035000,0.076200> rotate<0,0.000000,0> translate<15.341597,-1.535000,23.926800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.341597,-1.535000,24.079200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,24.079200>}
box{<0,0,-0.076200><9.160478,0.035000,0.076200> rotate<0,0.000000,0> translate<15.341597,-1.535000,24.079200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.341597,-1.535000,24.231600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,24.231600>}
box{<0,0,-0.076200><9.160478,0.035000,0.076200> rotate<0,0.000000,0> translate<15.341597,-1.535000,24.231600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.341597,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,24.384000>}
box{<0,0,-0.076200><9.160478,0.035000,0.076200> rotate<0,0.000000,0> translate<15.341597,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.341597,-1.535000,24.536400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,24.536400>}
box{<0,0,-0.076200><9.160478,0.035000,0.076200> rotate<0,0.000000,0> translate<15.341597,-1.535000,24.536400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.341597,-1.535000,24.688800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,24.688800>}
box{<0,0,-0.076200><9.160478,0.035000,0.076200> rotate<0,0.000000,0> translate<15.341597,-1.535000,24.688800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.341597,-1.535000,24.841200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,24.841200>}
box{<0,0,-0.076200><9.160478,0.035000,0.076200> rotate<0,0.000000,0> translate<15.341597,-1.535000,24.841200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.341597,-1.535000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,24.993600>}
box{<0,0,-0.076200><9.160478,0.035000,0.076200> rotate<0,0.000000,0> translate<15.341597,-1.535000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.341597,-1.535000,25.003675>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.241200,-1.535000,26.543000>}
box{<0,0,-0.076200><1.782921,0.035000,0.076200> rotate<0,-59.693446,0> translate<15.341597,-1.535000,25.003675> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.342925,-1.535000,19.454597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.260203,-1.535000,19.454597>}
box{<0,0,-0.076200><0.917278,0.035000,0.076200> rotate<0,0.000000,0> translate<15.342925,-1.535000,19.454597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.424772,-1.535000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,25.146000>}
box{<0,0,-0.076200><9.077303,0.035000,0.076200> rotate<0,0.000000,0> translate<15.424772,-1.535000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.463800,0.000000,25.566509>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.597709,0.000000,25.432600>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<15.463800,0.000000,25.566509> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.463800,0.000000,26.655888>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.463800,0.000000,25.566509>}
box{<0,0,-0.076200><1.089378,0.035000,0.076200> rotate<0,-90.000000,0> translate<15.463800,0.000000,25.566509> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.463800,0.000000,26.655888>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.591388,0.000000,26.783472>}
box{<0,0,-0.076200><0.180434,0.035000,0.076200> rotate<0,-44.996329,0> translate<15.463800,0.000000,26.655888> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.502488,0.000000,18.920600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.636397,0.000000,19.054509>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<15.502488,0.000000,18.920600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.502488,0.000000,22.657797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.636397,0.000000,22.523888>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<15.502488,0.000000,22.657797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.513838,-1.535000,25.298400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,25.298400>}
box{<0,0,-0.076200><8.988238,0.035000,0.076200> rotate<0,0.000000,0> translate<15.513838,-1.535000,25.298400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.519400,0.000000,26.855456>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.591388,0.000000,26.783472>}
box{<0,0,-0.076200><0.101803,0.035000,0.076200> rotate<0,44.995787,0> translate<15.519400,0.000000,26.855456> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.519400,0.000000,27.297341>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.519400,0.000000,26.855456>}
box{<0,0,-0.076200><0.441884,0.035000,0.076200> rotate<0,-90.000000,0> translate<15.519400,0.000000,26.855456> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.519400,-1.535000,27.297341>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.519400,-1.535000,27.019472>}
box{<0,0,-0.076200><0.277869,0.035000,0.076200> rotate<0,-90.000000,0> translate<15.519400,-1.535000,27.019472> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.519400,0.000000,27.297341>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.831856,0.000000,27.609797>}
box{<0,0,-0.076200><0.441880,0.035000,0.076200> rotate<0,-44.997030,0> translate<15.519400,0.000000,27.297341> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.519400,-1.535000,27.297341>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.831856,-1.535000,27.609797>}
box{<0,0,-0.076200><0.441880,0.035000,0.076200> rotate<0,-44.997030,0> translate<15.519400,-1.535000,27.297341> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.527056,0.000000,17.856197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.968941,0.000000,17.856197>}
box{<0,0,-0.076200><0.441884,0.035000,0.076200> rotate<0,0.000000,0> translate<15.527056,0.000000,17.856197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.597709,0.000000,25.432600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.722600,0.000000,25.432600>}
box{<0,0,-0.076200><0.124891,0.035000,0.076200> rotate<0,0.000000,0> translate<15.597709,0.000000,25.432600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.602900,-1.535000,25.450800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,25.450800>}
box{<0,0,-0.076200><8.899175,0.035000,0.076200> rotate<0,0.000000,0> translate<15.602900,-1.535000,25.450800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.605084,0.000000,22.555200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.279200,0.000000,22.555200>}
box{<0,0,-0.076200><4.674116,0.035000,0.076200> rotate<0,0.000000,0> translate<15.605084,0.000000,22.555200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.621084,0.000000,19.539200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.636397,0.000000,19.523888>}
box{<0,0,-0.076200><0.021655,0.035000,0.076200> rotate<0,44.997030,0> translate<15.621084,0.000000,19.539200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.621084,0.000000,19.539200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.636397,0.000000,19.554509>}
box{<0,0,-0.076200><0.021653,0.035000,0.076200> rotate<0,-44.991183,0> translate<15.621084,0.000000,19.539200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.621084,0.000000,20.039200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.636397,0.000000,20.023888>}
box{<0,0,-0.076200><0.021655,0.035000,0.076200> rotate<0,44.997030,0> translate<15.621084,0.000000,20.039200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.621084,0.000000,20.039200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.636397,0.000000,20.054509>}
box{<0,0,-0.076200><0.021653,0.035000,0.076200> rotate<0,-44.991183,0> translate<15.621084,0.000000,20.039200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.621084,0.000000,20.539200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.636397,0.000000,20.523888>}
box{<0,0,-0.076200><0.021655,0.035000,0.076200> rotate<0,44.997030,0> translate<15.621084,0.000000,20.539200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.621084,0.000000,20.539200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.636397,0.000000,20.554509>}
box{<0,0,-0.076200><0.021653,0.035000,0.076200> rotate<0,-44.991183,0> translate<15.621084,0.000000,20.539200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.621084,0.000000,21.039200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.636397,0.000000,21.023888>}
box{<0,0,-0.076200><0.021655,0.035000,0.076200> rotate<0,44.997030,0> translate<15.621084,0.000000,21.039200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.621084,0.000000,21.039200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.636397,0.000000,21.054509>}
box{<0,0,-0.076200><0.021653,0.035000,0.076200> rotate<0,-44.991183,0> translate<15.621084,0.000000,21.039200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.621084,0.000000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.636397,0.000000,21.523888>}
box{<0,0,-0.076200><0.021655,0.035000,0.076200> rotate<0,44.997030,0> translate<15.621084,0.000000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.621084,0.000000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.636397,0.000000,21.554509>}
box{<0,0,-0.076200><0.021653,0.035000,0.076200> rotate<0,-44.991183,0> translate<15.621084,0.000000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.621084,0.000000,22.039200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.636397,0.000000,22.023888>}
box{<0,0,-0.076200><0.021655,0.035000,0.076200> rotate<0,44.997030,0> translate<15.621084,0.000000,22.039200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.621084,0.000000,22.039200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.636397,0.000000,22.054509>}
box{<0,0,-0.076200><0.021653,0.035000,0.076200> rotate<0,-44.991183,0> translate<15.621084,0.000000,22.039200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.629084,0.000000,21.031200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.978200,0.000000,21.031200>}
box{<0,0,-0.076200><6.349116,0.035000,0.076200> rotate<0,0.000000,0> translate<15.629084,0.000000,21.031200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.631888,0.000000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.339200,0.000000,19.050000>}
box{<0,0,-0.076200><0.707313,0.035000,0.076200> rotate<0,0.000000,0> translate<15.631888,0.000000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.636397,0.000000,19.054509>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.636397,0.000000,19.523888>}
box{<0,0,-0.076200><0.469378,0.035000,0.076200> rotate<0,90.000000,0> translate<15.636397,0.000000,19.523888> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.636397,0.000000,19.202400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.457712,0.000000,19.202400>}
box{<0,0,-0.076200><0.821316,0.035000,0.076200> rotate<0,0.000000,0> translate<15.636397,0.000000,19.202400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.636397,0.000000,19.354800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.279200,0.000000,19.354800>}
box{<0,0,-0.076200><4.642803,0.035000,0.076200> rotate<0,0.000000,0> translate<15.636397,0.000000,19.354800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.636397,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.279200,0.000000,19.507200>}
box{<0,0,-0.076200><4.642803,0.035000,0.076200> rotate<0,0.000000,0> translate<15.636397,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.636397,0.000000,19.554509>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.636397,0.000000,20.023888>}
box{<0,0,-0.076200><0.469378,0.035000,0.076200> rotate<0,90.000000,0> translate<15.636397,0.000000,20.023888> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.636397,0.000000,19.659600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.190200,0.000000,19.659600>}
box{<0,0,-0.076200><7.553803,0.035000,0.076200> rotate<0,0.000000,0> translate<15.636397,0.000000,19.659600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.636397,0.000000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.190200,0.000000,19.812000>}
box{<0,0,-0.076200><7.553803,0.035000,0.076200> rotate<0,0.000000,0> translate<15.636397,0.000000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.636397,0.000000,19.964400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.369309,0.000000,19.964400>}
box{<0,0,-0.076200><4.732912,0.035000,0.076200> rotate<0,0.000000,0> translate<15.636397,0.000000,19.964400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.636397,0.000000,20.054509>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.636397,0.000000,20.523888>}
box{<0,0,-0.076200><0.469378,0.035000,0.076200> rotate<0,90.000000,0> translate<15.636397,0.000000,20.523888> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.636397,0.000000,20.116800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.279200,0.000000,20.116800>}
box{<0,0,-0.076200><4.642803,0.035000,0.076200> rotate<0,0.000000,0> translate<15.636397,0.000000,20.116800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.636397,0.000000,20.269200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.279200,0.000000,20.269200>}
box{<0,0,-0.076200><4.642803,0.035000,0.076200> rotate<0,0.000000,0> translate<15.636397,0.000000,20.269200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.636397,0.000000,20.421600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.279200,0.000000,20.421600>}
box{<0,0,-0.076200><4.642803,0.035000,0.076200> rotate<0,0.000000,0> translate<15.636397,0.000000,20.421600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.636397,0.000000,20.554509>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.636397,0.000000,21.023888>}
box{<0,0,-0.076200><0.469378,0.035000,0.076200> rotate<0,90.000000,0> translate<15.636397,0.000000,21.023888> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.636397,0.000000,20.574000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.329313,0.000000,20.574000>}
box{<0,0,-0.076200><4.692916,0.035000,0.076200> rotate<0,0.000000,0> translate<15.636397,0.000000,20.574000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.636397,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.978200,0.000000,20.726400>}
box{<0,0,-0.076200><6.341803,0.035000,0.076200> rotate<0,0.000000,0> translate<15.636397,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.636397,0.000000,20.878800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.978200,0.000000,20.878800>}
box{<0,0,-0.076200><6.341803,0.035000,0.076200> rotate<0,0.000000,0> translate<15.636397,0.000000,20.878800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.636397,0.000000,21.054509>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.636397,0.000000,21.523888>}
box{<0,0,-0.076200><0.469378,0.035000,0.076200> rotate<0,90.000000,0> translate<15.636397,0.000000,21.523888> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.636397,0.000000,21.183600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.978200,0.000000,21.183600>}
box{<0,0,-0.076200><6.341803,0.035000,0.076200> rotate<0,0.000000,0> translate<15.636397,0.000000,21.183600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.636397,0.000000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.950309,0.000000,21.336000>}
box{<0,0,-0.076200><6.313912,0.035000,0.076200> rotate<0,0.000000,0> translate<15.636397,0.000000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.636397,0.000000,21.488400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.345309,0.000000,21.488400>}
box{<0,0,-0.076200><4.708912,0.035000,0.076200> rotate<0,0.000000,0> translate<15.636397,0.000000,21.488400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.636397,0.000000,21.554509>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.636397,0.000000,22.023888>}
box{<0,0,-0.076200><0.469378,0.035000,0.076200> rotate<0,90.000000,0> translate<15.636397,0.000000,22.023888> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.636397,0.000000,21.640800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.279200,0.000000,21.640800>}
box{<0,0,-0.076200><4.642803,0.035000,0.076200> rotate<0,0.000000,0> translate<15.636397,0.000000,21.640800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.636397,0.000000,21.793200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.279200,0.000000,21.793200>}
box{<0,0,-0.076200><4.642803,0.035000,0.076200> rotate<0,0.000000,0> translate<15.636397,0.000000,21.793200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.636397,0.000000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.279200,0.000000,21.945600>}
box{<0,0,-0.076200><4.642803,0.035000,0.076200> rotate<0,0.000000,0> translate<15.636397,0.000000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.636397,0.000000,22.054509>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.636397,0.000000,22.523888>}
box{<0,0,-0.076200><0.469378,0.035000,0.076200> rotate<0,90.000000,0> translate<15.636397,0.000000,22.523888> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.636397,0.000000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.279200,0.000000,22.098000>}
box{<0,0,-0.076200><4.642803,0.035000,0.076200> rotate<0,0.000000,0> translate<15.636397,0.000000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.636397,0.000000,22.250400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.279200,0.000000,22.250400>}
box{<0,0,-0.076200><4.642803,0.035000,0.076200> rotate<0,0.000000,0> translate<15.636397,0.000000,22.250400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.636397,0.000000,22.402800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.279200,0.000000,22.402800>}
box{<0,0,-0.076200><4.642803,0.035000,0.076200> rotate<0,0.000000,0> translate<15.636397,0.000000,22.402800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.691966,-1.535000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,25.603200>}
box{<0,0,-0.076200><8.810109,0.035000,0.076200> rotate<0,0.000000,0> translate<15.691966,-1.535000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.722600,0.000000,25.379703>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.930903,0.000000,25.171400>}
box{<0,0,-0.076200><0.294585,0.035000,0.076200> rotate<0,44.997030,0> translate<15.722600,0.000000,25.379703> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.722600,0.000000,25.432600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.722600,0.000000,25.379703>}
box{<0,0,-0.076200><0.052897,0.035000,0.076200> rotate<0,-90.000000,0> translate<15.722600,0.000000,25.379703> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.781031,-1.535000,25.755600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,25.755600>}
box{<0,0,-0.076200><8.721044,0.035000,0.076200> rotate<0,0.000000,0> translate<15.781031,-1.535000,25.755600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.831856,0.000000,27.609797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.273741,0.000000,27.609797>}
box{<0,0,-0.076200><0.441884,0.035000,0.076200> rotate<0,0.000000,0> translate<15.831856,0.000000,27.609797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.831856,-1.535000,27.609797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.273741,-1.535000,27.609797>}
box{<0,0,-0.076200><0.441884,0.035000,0.076200> rotate<0,0.000000,0> translate<15.831856,-1.535000,27.609797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.870097,-1.535000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,25.908000>}
box{<0,0,-0.076200><8.631978,0.035000,0.076200> rotate<0,0.000000,0> translate<15.870097,-1.535000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.930903,0.000000,25.171400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.134103,0.000000,24.968200>}
box{<0,0,-0.076200><0.287368,0.035000,0.076200> rotate<0,44.997030,0> translate<15.930903,0.000000,25.171400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.959159,-1.535000,26.060400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,26.060400>}
box{<0,0,-0.076200><8.542916,0.035000,0.076200> rotate<0,0.000000,0> translate<15.959159,-1.535000,26.060400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.968941,0.000000,17.856197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.145684,0.000000,17.679453>}
box{<0,0,-0.076200><0.249953,0.035000,0.076200> rotate<0,44.997030,0> translate<15.968941,0.000000,17.856197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.994338,0.000000,17.830800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.297031,0.000000,17.830800>}
box{<0,0,-0.076200><0.302694,0.035000,0.076200> rotate<0,0.000000,0> translate<15.994338,0.000000,17.830800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.048225,-1.535000,26.212800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,26.212800>}
box{<0,0,-0.076200><8.453850,0.035000,0.076200> rotate<0,0.000000,0> translate<16.048225,-1.535000,26.212800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.134103,0.000000,24.968200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.339200,0.000000,24.968200>}
box{<0,0,-0.076200><1.205097,0.035000,0.076200> rotate<0,0.000000,0> translate<16.134103,0.000000,24.968200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.137291,-1.535000,26.365200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,26.365200>}
box{<0,0,-0.076200><8.364784,0.035000,0.076200> rotate<0,0.000000,0> translate<16.137291,-1.535000,26.365200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.145684,0.000000,17.679453>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.377600,0.000000,17.911372>}
box{<0,0,-0.076200><0.327980,0.035000,0.076200> rotate<0,-44.997416,0> translate<16.145684,0.000000,17.679453> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.226353,-1.535000,26.517600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,26.517600>}
box{<0,0,-0.076200><8.275722,0.035000,0.076200> rotate<0,0.000000,0> translate<16.226353,-1.535000,26.517600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.241200,-1.535000,26.543000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.273741,-1.535000,26.543000>}
box{<0,0,-0.076200><0.032541,0.035000,0.076200> rotate<0,0.000000,0> translate<16.241200,-1.535000,26.543000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.260203,-1.535000,18.650609>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.260203,-1.535000,19.454597>}
box{<0,0,-0.076200><0.803987,0.035000,0.076200> rotate<0,90.000000,0> translate<16.260203,-1.535000,19.454597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.260203,-1.535000,18.650609>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.412591,-1.535000,18.650609>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<16.260203,-1.535000,18.650609> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.260203,-1.535000,18.745200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.412591,-1.535000,18.745200>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<16.260203,-1.535000,18.745200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.260203,-1.535000,18.897600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.412591,-1.535000,18.897600>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<16.260203,-1.535000,18.897600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.260203,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.412591,-1.535000,19.050000>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<16.260203,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.260203,-1.535000,19.202400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.412591,-1.535000,19.202400>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<16.260203,-1.535000,19.202400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.260203,-1.535000,19.354800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.412591,-1.535000,19.354800>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<16.260203,-1.535000,19.354800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.273741,-1.535000,26.543000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.586197,-1.535000,26.855456>}
box{<0,0,-0.076200><0.441880,0.035000,0.076200> rotate<0,-44.997030,0> translate<16.273741,-1.535000,26.543000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.273741,0.000000,27.609797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.586197,0.000000,27.297341>}
box{<0,0,-0.076200><0.441880,0.035000,0.076200> rotate<0,44.997030,0> translate<16.273741,0.000000,27.609797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.273741,-1.535000,27.609797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.586197,-1.535000,27.297341>}
box{<0,0,-0.076200><0.441880,0.035000,0.076200> rotate<0,44.997030,0> translate<16.273741,-1.535000,27.609797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.299138,0.000000,27.584400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.894800,0.000000,27.584400>}
box{<0,0,-0.076200><5.595662,0.035000,0.076200> rotate<0,0.000000,0> translate<16.299138,0.000000,27.584400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.299138,-1.535000,27.584400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.190200,-1.535000,27.584400>}
box{<0,0,-0.076200><6.891063,0.035000,0.076200> rotate<0,0.000000,0> translate<16.299138,-1.535000,27.584400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.339200,0.000000,18.044509>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.377600,0.000000,18.006109>}
box{<0,0,-0.076200><0.054306,0.035000,0.076200> rotate<0,44.997030,0> translate<16.339200,0.000000,18.044509> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.339200,0.000000,19.083887>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.339200,0.000000,18.044509>}
box{<0,0,-0.076200><1.039378,0.035000,0.076200> rotate<0,-90.000000,0> translate<16.339200,0.000000,18.044509> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.339200,0.000000,19.083887>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.473109,0.000000,19.217797>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<16.339200,0.000000,19.083887> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.377600,0.000000,18.006109>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.377600,0.000000,17.911372>}
box{<0,0,-0.076200><0.094738,0.035000,0.076200> rotate<0,-90.000000,0> translate<16.377600,0.000000,17.911372> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.400741,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,26.670000>}
box{<0,0,-0.076200><8.101334,0.035000,0.076200> rotate<0,0.000000,0> translate<16.400741,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.412591,-1.535000,19.454597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.412591,-1.535000,18.650609>}
box{<0,0,-0.076200><0.803987,0.035000,0.076200> rotate<0,-90.000000,0> translate<16.412591,-1.535000,18.650609> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.412591,-1.535000,19.454597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.329872,-1.535000,19.454597>}
box{<0,0,-0.076200><0.917281,0.035000,0.076200> rotate<0,0.000000,0> translate<16.412591,-1.535000,19.454597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.412609,-1.535000,18.498203>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.412609,-1.535000,18.650591>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,90.000000,0> translate<16.412609,-1.535000,18.650591> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.412609,-1.535000,18.498203>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.616597,-1.535000,18.498203>}
box{<0,0,-0.076200><1.203988,0.035000,0.076200> rotate<0,0.000000,0> translate<16.412609,-1.535000,18.498203> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.412609,-1.535000,18.592800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.857800,-1.535000,18.592800>}
box{<0,0,-0.076200><2.445191,0.035000,0.076200> rotate<0,0.000000,0> translate<16.412609,-1.535000,18.592800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.412609,-1.535000,18.650591>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.616597,-1.535000,18.650591>}
box{<0,0,-0.076200><1.203988,0.035000,0.076200> rotate<0,0.000000,0> translate<16.412609,-1.535000,18.650591> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.451538,0.000000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.894800,0.000000,27.432000>}
box{<0,0,-0.076200><5.443262,0.035000,0.076200> rotate<0,0.000000,0> translate<16.451538,0.000000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.451538,-1.535000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.190541,-1.535000,27.432000>}
box{<0,0,-0.076200><6.739003,0.035000,0.076200> rotate<0,0.000000,0> translate<16.451538,-1.535000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.473109,0.000000,19.217797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.942488,0.000000,19.217797>}
box{<0,0,-0.076200><0.469378,0.035000,0.076200> rotate<0,0.000000,0> translate<16.473109,0.000000,19.217797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.503809,0.000000,26.773072>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.586197,0.000000,26.855456>}
box{<0,0,-0.076200><0.116511,0.035000,0.076200> rotate<0,-44.995944,0> translate<16.503809,0.000000,26.773072> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.503809,0.000000,26.773072>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.620997,0.000000,26.655888>}
box{<0,0,-0.076200><0.165726,0.035000,0.076200> rotate<0,44.996266,0> translate<16.503809,0.000000,26.773072> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.553138,0.000000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.894800,0.000000,26.822400>}
box{<0,0,-0.076200><5.341662,0.035000,0.076200> rotate<0,0.000000,0> translate<16.553138,0.000000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.553141,-1.535000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.800625,-1.535000,26.822400>}
box{<0,0,-0.076200><7.247484,0.035000,0.076200> rotate<0,0.000000,0> translate<16.553141,-1.535000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.586197,0.000000,26.855456>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.586197,0.000000,27.297341>}
box{<0,0,-0.076200><0.441884,0.035000,0.076200> rotate<0,90.000000,0> translate<16.586197,0.000000,27.297341> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.586197,-1.535000,26.855456>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.586197,-1.535000,27.297341>}
box{<0,0,-0.076200><0.441884,0.035000,0.076200> rotate<0,90.000000,0> translate<16.586197,-1.535000,27.297341> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.586197,0.000000,26.974800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.894800,0.000000,26.974800>}
box{<0,0,-0.076200><5.308603,0.035000,0.076200> rotate<0,0.000000,0> translate<16.586197,0.000000,26.974800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.586197,-1.535000,26.974800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.484166,-1.535000,26.974800>}
box{<0,0,-0.076200><6.897969,0.035000,0.076200> rotate<0,0.000000,0> translate<16.586197,-1.535000,26.974800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.586197,0.000000,27.127200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.894800,0.000000,27.127200>}
box{<0,0,-0.076200><5.308603,0.035000,0.076200> rotate<0,0.000000,0> translate<16.586197,0.000000,27.127200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.586197,-1.535000,27.127200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.331766,-1.535000,27.127200>}
box{<0,0,-0.076200><6.745569,0.035000,0.076200> rotate<0,0.000000,0> translate<16.586197,-1.535000,27.127200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.586197,0.000000,27.279600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.894800,0.000000,27.279600>}
box{<0,0,-0.076200><5.308603,0.035000,0.076200> rotate<0,0.000000,0> translate<16.586197,0.000000,27.279600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.586197,-1.535000,27.279600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.253666,-1.535000,27.279600>}
box{<0,0,-0.076200><6.667469,0.035000,0.076200> rotate<0,0.000000,0> translate<16.586197,-1.535000,27.279600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.606884,0.000000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.890913,0.000000,26.670000>}
box{<0,0,-0.076200><1.284028,0.035000,0.076200> rotate<0,0.000000,0> translate<16.606884,0.000000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.620997,0.000000,25.679397>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.620997,0.000000,26.655888>}
box{<0,0,-0.076200><0.976491,0.035000,0.076200> rotate<0,90.000000,0> translate<16.620997,0.000000,26.655888> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.620997,0.000000,25.679397>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.647894,0.000000,25.679397>}
box{<0,0,-0.076200><1.026897,0.035000,0.076200> rotate<0,0.000000,0> translate<16.620997,0.000000,25.679397> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.620997,0.000000,25.755600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.876800,0.000000,25.755600>}
box{<0,0,-0.076200><1.255803,0.035000,0.076200> rotate<0,0.000000,0> translate<16.620997,0.000000,25.755600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.620997,0.000000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.876800,0.000000,25.908000>}
box{<0,0,-0.076200><1.255803,0.035000,0.076200> rotate<0,0.000000,0> translate<16.620997,0.000000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.620997,0.000000,26.060400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.876800,0.000000,26.060400>}
box{<0,0,-0.076200><1.255803,0.035000,0.076200> rotate<0,0.000000,0> translate<16.620997,0.000000,26.060400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.620997,0.000000,26.212800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.876800,0.000000,26.212800>}
box{<0,0,-0.076200><1.255803,0.035000,0.076200> rotate<0,0.000000,0> translate<16.620997,0.000000,26.212800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.620997,0.000000,26.365200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.876800,0.000000,26.365200>}
box{<0,0,-0.076200><1.255803,0.035000,0.076200> rotate<0,0.000000,0> translate<16.620997,0.000000,26.365200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.620997,0.000000,26.517600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.876800,0.000000,26.517600>}
box{<0,0,-0.076200><1.255803,0.035000,0.076200> rotate<0,0.000000,0> translate<16.620997,0.000000,26.517600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.942488,0.000000,19.217797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.957797,0.000000,19.202484>}
box{<0,0,-0.076200><0.021653,0.035000,0.076200> rotate<0,45.002877,0> translate<16.942488,0.000000,19.217797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.957797,0.000000,19.202484>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.973109,0.000000,19.217797>}
box{<0,0,-0.076200><0.021655,0.035000,0.076200> rotate<0,-44.997030,0> translate<16.957797,0.000000,19.202484> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.973109,0.000000,19.217797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.442488,0.000000,19.217797>}
box{<0,0,-0.076200><0.469378,0.035000,0.076200> rotate<0,0.000000,0> translate<16.973109,0.000000,19.217797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.329872,-1.535000,19.454597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.413850,-1.535000,19.432094>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,14.999808,0> translate<17.329872,-1.535000,19.454597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.339200,0.000000,23.994509>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.473109,0.000000,23.860600>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<17.339200,0.000000,23.994509> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.339200,0.000000,24.968200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.339200,0.000000,23.994509>}
box{<0,0,-0.076200><0.973691,0.035000,0.076200> rotate<0,-90.000000,0> translate<17.339200,0.000000,23.994509> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.413850,-1.535000,19.432094>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.489147,-1.535000,19.388622>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,29.997566,0> translate<17.413850,-1.535000,19.432094> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.442488,0.000000,19.217797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.457797,0.000000,19.202484>}
box{<0,0,-0.076200><0.021653,0.035000,0.076200> rotate<0,45.002877,0> translate<17.442488,0.000000,19.217797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.457797,0.000000,19.202484>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.473109,0.000000,19.217797>}
box{<0,0,-0.076200><0.021655,0.035000,0.076200> rotate<0,-44.997030,0> translate<17.457797,0.000000,19.202484> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.473109,0.000000,19.217797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.942488,0.000000,19.217797>}
box{<0,0,-0.076200><0.469378,0.035000,0.076200> rotate<0,0.000000,0> translate<17.473109,0.000000,19.217797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.473109,0.000000,23.860600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.942488,0.000000,23.860600>}
box{<0,0,-0.076200><0.469378,0.035000,0.076200> rotate<0,0.000000,0> translate<17.473109,0.000000,23.860600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.479478,-1.535000,17.754597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.489147,-1.535000,17.760175>}
box{<0,0,-0.076200><0.011162,0.035000,0.076200> rotate<0,-29.979661,0> translate<17.479478,-1.535000,17.754597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.479478,-1.535000,17.754597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.413256,-1.535000,17.754597>}
box{<0,0,-0.076200><1.933778,0.035000,0.076200> rotate<0,0.000000,0> translate<17.479478,-1.535000,17.754597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.489147,-1.535000,17.760175>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.550622,-1.535000,17.821650>}
box{<0,0,-0.076200><0.086939,0.035000,0.076200> rotate<0,-44.997030,0> translate<17.489147,-1.535000,17.760175> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.489147,-1.535000,19.388622>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.550622,-1.535000,19.327147>}
box{<0,0,-0.076200><0.086939,0.035000,0.076200> rotate<0,44.997030,0> translate<17.489147,-1.535000,19.388622> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.522969,-1.535000,19.354800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,19.354800>}
box{<0,0,-0.076200><6.979106,0.035000,0.076200> rotate<0,0.000000,0> translate<17.522969,-1.535000,19.354800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.550622,-1.535000,17.821650>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.594094,-1.535000,17.896947>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-59.996495,0> translate<17.550622,-1.535000,17.821650> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.550622,-1.535000,19.327147>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.594094,-1.535000,19.251850>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,59.996495,0> translate<17.550622,-1.535000,19.327147> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.555903,-1.535000,17.830800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.956709,-1.535000,17.830800>}
box{<0,0,-0.076200><1.400806,0.035000,0.076200> rotate<0,0.000000,0> translate<17.555903,-1.535000,17.830800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.594094,-1.535000,17.896947>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.616597,-1.535000,17.980925>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-74.994252,0> translate<17.594094,-1.535000,17.896947> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.594094,-1.535000,19.251850>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.616597,-1.535000,19.167872>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,74.994252,0> translate<17.594094,-1.535000,19.251850> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.607347,-1.535000,19.202400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.857800,-1.535000,19.202400>}
box{<0,0,-0.076200><1.250453,0.035000,0.076200> rotate<0,0.000000,0> translate<17.607347,-1.535000,19.202400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.616597,-1.535000,17.980925>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.616597,-1.535000,18.498203>}
box{<0,0,-0.076200><0.517278,0.035000,0.076200> rotate<0,90.000000,0> translate<17.616597,-1.535000,18.498203> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.616597,-1.535000,17.983200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.857800,-1.535000,17.983200>}
box{<0,0,-0.076200><1.241203,0.035000,0.076200> rotate<0,0.000000,0> translate<17.616597,-1.535000,17.983200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.616597,-1.535000,18.135600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.857800,-1.535000,18.135600>}
box{<0,0,-0.076200><1.241203,0.035000,0.076200> rotate<0,0.000000,0> translate<17.616597,-1.535000,18.135600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.616597,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.857800,-1.535000,18.288000>}
box{<0,0,-0.076200><1.241203,0.035000,0.076200> rotate<0,0.000000,0> translate<17.616597,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.616597,-1.535000,18.440400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.857800,-1.535000,18.440400>}
box{<0,0,-0.076200><1.241203,0.035000,0.076200> rotate<0,0.000000,0> translate<17.616597,-1.535000,18.440400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.616597,-1.535000,18.650591>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.616597,-1.535000,19.167872>}
box{<0,0,-0.076200><0.517281,0.035000,0.076200> rotate<0,90.000000,0> translate<17.616597,-1.535000,19.167872> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.616597,-1.535000,18.745200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.857800,-1.535000,18.745200>}
box{<0,0,-0.076200><1.241203,0.035000,0.076200> rotate<0,0.000000,0> translate<17.616597,-1.535000,18.745200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.616597,-1.535000,18.897600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.857800,-1.535000,18.897600>}
box{<0,0,-0.076200><1.241203,0.035000,0.076200> rotate<0,0.000000,0> translate<17.616597,-1.535000,18.897600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.616597,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.857800,-1.535000,19.050000>}
box{<0,0,-0.076200><1.241203,0.035000,0.076200> rotate<0,0.000000,0> translate<17.616597,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.647894,0.000000,25.679397>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.856197,0.000000,25.471094>}
box{<0,0,-0.076200><0.294585,0.035000,0.076200> rotate<0,44.997030,0> translate<17.647894,0.000000,25.679397> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.708597,0.000000,15.778125>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.708597,0.000000,16.835228>}
box{<0,0,-0.076200><1.057103,0.035000,0.076200> rotate<0,90.000000,0> translate<17.708597,0.000000,16.835228> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.708597,0.000000,15.778125>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.837400,0.000000,15.778125>}
box{<0,0,-0.076200><1.128803,0.035000,0.076200> rotate<0,0.000000,0> translate<17.708597,0.000000,15.778125> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.708597,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.837400,0.000000,15.849600>}
box{<0,0,-0.076200><1.128803,0.035000,0.076200> rotate<0,0.000000,0> translate<17.708597,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.708597,0.000000,16.002000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.837400,0.000000,16.002000>}
box{<0,0,-0.076200><1.128803,0.035000,0.076200> rotate<0,0.000000,0> translate<17.708597,0.000000,16.002000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.708597,0.000000,16.154400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.837400,0.000000,16.154400>}
box{<0,0,-0.076200><1.128803,0.035000,0.076200> rotate<0,0.000000,0> translate<17.708597,0.000000,16.154400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.708597,0.000000,16.306800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.837400,0.000000,16.306800>}
box{<0,0,-0.076200><1.128803,0.035000,0.076200> rotate<0,0.000000,0> translate<17.708597,0.000000,16.306800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.708597,0.000000,16.459200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.837400,0.000000,16.459200>}
box{<0,0,-0.076200><1.128803,0.035000,0.076200> rotate<0,0.000000,0> translate<17.708597,0.000000,16.459200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.708597,0.000000,16.611600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.837400,0.000000,16.611600>}
box{<0,0,-0.076200><1.128803,0.035000,0.076200> rotate<0,0.000000,0> translate<17.708597,0.000000,16.611600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.708597,0.000000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.837400,0.000000,16.764000>}
box{<0,0,-0.076200><1.128803,0.035000,0.076200> rotate<0,0.000000,0> translate<17.708597,0.000000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.708597,0.000000,16.835228>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.840572,0.000000,16.967200>}
box{<0,0,-0.076200><0.186639,0.035000,0.076200> rotate<0,-44.996352,0> translate<17.708597,0.000000,16.835228> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.724091,0.000000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.876800,0.000000,25.603200>}
box{<0,0,-0.076200><0.152709,0.035000,0.076200> rotate<0,0.000000,0> translate<17.724091,0.000000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.789769,0.000000,16.916400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.902313,0.000000,16.916400>}
box{<0,0,-0.076200><1.112544,0.035000,0.076200> rotate<0,0.000000,0> translate<17.789769,0.000000,16.916400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.840572,0.000000,16.967200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.033997,0.000000,17.160625>}
box{<0,0,-0.076200><0.273544,0.035000,0.076200> rotate<0,-44.997030,0> translate<17.840572,0.000000,16.967200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.856197,0.000000,25.471094>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.063397,0.000000,25.263894>}
box{<0,0,-0.076200><0.293025,0.035000,0.076200> rotate<0,44.997030,0> translate<17.856197,0.000000,25.471094> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.876491,0.000000,25.450800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.992509,0.000000,25.450800>}
box{<0,0,-0.076200><0.116019,0.035000,0.076200> rotate<0,0.000000,0> translate<17.876491,0.000000,25.450800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.876800,0.000000,25.566509>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.010709,0.000000,25.432600>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<17.876800,0.000000,25.566509> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.876800,0.000000,26.655888>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.876800,0.000000,25.566509>}
box{<0,0,-0.076200><1.089378,0.035000,0.076200> rotate<0,-90.000000,0> translate<17.876800,0.000000,25.566509> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.876800,0.000000,26.655888>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.010709,0.000000,26.789797>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<17.876800,0.000000,26.655888> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.942172,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.085800,0.000000,17.068800>}
box{<0,0,-0.076200><1.143628,0.035000,0.076200> rotate<0,0.000000,0> translate<17.942172,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.942488,0.000000,19.217797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.076397,0.000000,19.083887>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<17.942488,0.000000,19.217797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.942488,0.000000,23.860600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.076397,0.000000,23.994509>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<17.942488,0.000000,23.860600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.957884,0.000000,19.202400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.957712,0.000000,19.202400>}
box{<0,0,-0.076200><0.999828,0.035000,0.076200> rotate<0,0.000000,0> translate<17.957884,0.000000,19.202400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.008688,0.000000,23.926800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.906909,0.000000,23.926800>}
box{<0,0,-0.076200><0.898222,0.035000,0.076200> rotate<0,0.000000,0> translate<18.008688,0.000000,23.926800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.010709,0.000000,25.432600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.852200,0.000000,25.432600>}
box{<0,0,-0.076200><0.841491,0.035000,0.076200> rotate<0,0.000000,0> translate<18.010709,0.000000,25.432600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.010709,0.000000,26.789797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.759087,0.000000,26.789797>}
box{<0,0,-0.076200><1.748378,0.035000,0.076200> rotate<0,0.000000,0> translate<18.010709,0.000000,26.789797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.028891,0.000000,25.298400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.852200,0.000000,25.298400>}
box{<0,0,-0.076200><0.823309,0.035000,0.076200> rotate<0,0.000000,0> translate<18.028891,0.000000,25.298400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.033997,0.000000,17.160625>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.033997,0.000000,18.002109>}
box{<0,0,-0.076200><0.841484,0.035000,0.076200> rotate<0,90.000000,0> translate<18.033997,0.000000,18.002109> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.033997,0.000000,17.221200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.167231,0.000000,17.221200>}
box{<0,0,-0.076200><1.133234,0.035000,0.076200> rotate<0,0.000000,0> translate<18.033997,0.000000,17.221200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.033997,0.000000,17.373600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.202400,0.000000,17.373600>}
box{<0,0,-0.076200><1.168403,0.035000,0.076200> rotate<0,0.000000,0> translate<18.033997,0.000000,17.373600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.033997,0.000000,17.526000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.065625,0.000000,17.526000>}
box{<0,0,-0.076200><1.031628,0.035000,0.076200> rotate<0,0.000000,0> translate<18.033997,0.000000,17.526000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.033997,0.000000,17.678400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.913225,0.000000,17.678400>}
box{<0,0,-0.076200><0.879228,0.035000,0.076200> rotate<0,0.000000,0> translate<18.033997,0.000000,17.678400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.033997,0.000000,17.830800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.877600,0.000000,17.830800>}
box{<0,0,-0.076200><0.843603,0.035000,0.076200> rotate<0,0.000000,0> translate<18.033997,0.000000,17.830800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.033997,0.000000,17.983200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.877600,0.000000,17.983200>}
box{<0,0,-0.076200><0.843603,0.035000,0.076200> rotate<0,0.000000,0> translate<18.033997,0.000000,17.983200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.033997,0.000000,18.002109>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.076397,0.000000,18.044509>}
box{<0,0,-0.076200><0.059963,0.035000,0.076200> rotate<0,-44.997030,0> translate<18.033997,0.000000,18.002109> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.063397,0.000000,25.046884>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.063397,0.000000,25.263894>}
box{<0,0,-0.076200><0.217009,0.035000,0.076200> rotate<0,90.000000,0> translate<18.063397,0.000000,25.263894> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.063397,0.000000,25.046884>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.076397,0.000000,25.033888>}
box{<0,0,-0.076200><0.018383,0.035000,0.076200> rotate<0,44.990143,0> translate<18.063397,0.000000,25.046884> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.063397,0.000000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.852200,0.000000,25.146000>}
box{<0,0,-0.076200><0.788803,0.035000,0.076200> rotate<0,0.000000,0> translate<18.063397,0.000000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.076397,0.000000,18.044509>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.076397,0.000000,19.083887>}
box{<0,0,-0.076200><1.039378,0.035000,0.076200> rotate<0,90.000000,0> translate<18.076397,0.000000,19.083887> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.076397,0.000000,18.135600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.839200,0.000000,18.135600>}
box{<0,0,-0.076200><0.762803,0.035000,0.076200> rotate<0,0.000000,0> translate<18.076397,0.000000,18.135600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.076397,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.839200,0.000000,18.288000>}
box{<0,0,-0.076200><0.762803,0.035000,0.076200> rotate<0,0.000000,0> translate<18.076397,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.076397,0.000000,18.440400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.839200,0.000000,18.440400>}
box{<0,0,-0.076200><0.762803,0.035000,0.076200> rotate<0,0.000000,0> translate<18.076397,0.000000,18.440400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.076397,0.000000,18.592800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.839200,0.000000,18.592800>}
box{<0,0,-0.076200><0.762803,0.035000,0.076200> rotate<0,0.000000,0> translate<18.076397,0.000000,18.592800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.076397,0.000000,18.745200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.839200,0.000000,18.745200>}
box{<0,0,-0.076200><0.762803,0.035000,0.076200> rotate<0,0.000000,0> translate<18.076397,0.000000,18.745200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.076397,0.000000,18.897600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.839200,0.000000,18.897600>}
box{<0,0,-0.076200><0.762803,0.035000,0.076200> rotate<0,0.000000,0> translate<18.076397,0.000000,18.897600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.076397,0.000000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.839200,0.000000,19.050000>}
box{<0,0,-0.076200><0.762803,0.035000,0.076200> rotate<0,0.000000,0> translate<18.076397,0.000000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.076397,0.000000,23.994509>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.076397,0.000000,25.033888>}
box{<0,0,-0.076200><1.039378,0.035000,0.076200> rotate<0,90.000000,0> translate<18.076397,0.000000,25.033888> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.076397,0.000000,24.079200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.839200,0.000000,24.079200>}
box{<0,0,-0.076200><0.762803,0.035000,0.076200> rotate<0,0.000000,0> translate<18.076397,0.000000,24.079200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.076397,0.000000,24.231600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.839200,0.000000,24.231600>}
box{<0,0,-0.076200><0.762803,0.035000,0.076200> rotate<0,0.000000,0> translate<18.076397,0.000000,24.231600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.076397,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.839200,0.000000,24.384000>}
box{<0,0,-0.076200><0.762803,0.035000,0.076200> rotate<0,0.000000,0> translate<18.076397,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.076397,0.000000,24.536400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.839200,0.000000,24.536400>}
box{<0,0,-0.076200><0.762803,0.035000,0.076200> rotate<0,0.000000,0> translate<18.076397,0.000000,24.536400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.076397,0.000000,24.688800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.839200,0.000000,24.688800>}
box{<0,0,-0.076200><0.762803,0.035000,0.076200> rotate<0,0.000000,0> translate<18.076397,0.000000,24.688800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.076397,0.000000,24.841200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.839200,0.000000,24.841200>}
box{<0,0,-0.076200><0.762803,0.035000,0.076200> rotate<0,0.000000,0> translate<18.076397,0.000000,24.841200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.076397,0.000000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.839200,0.000000,24.993600>}
box{<0,0,-0.076200><0.762803,0.035000,0.076200> rotate<0,0.000000,0> translate<18.076397,0.000000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.837400,0.000000,16.851488>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.837400,0.000000,15.778125>}
box{<0,0,-0.076200><1.073362,0.035000,0.076200> rotate<0,-90.000000,0> translate<18.837400,0.000000,15.778125> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.837400,0.000000,16.851488>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.971309,0.000000,16.985397>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<18.837400,0.000000,16.851488> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.839200,0.000000,18.044509>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.877600,0.000000,18.006113>}
box{<0,0,-0.076200><0.054304,0.035000,0.076200> rotate<0,44.994699,0> translate<18.839200,0.000000,18.044509> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.839200,0.000000,19.083887>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.839200,0.000000,18.044509>}
box{<0,0,-0.076200><1.039378,0.035000,0.076200> rotate<0,-90.000000,0> translate<18.839200,0.000000,18.044509> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.839200,0.000000,19.083887>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.973109,0.000000,19.217797>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<18.839200,0.000000,19.083887> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.839200,0.000000,23.994509>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.973109,0.000000,23.860600>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<18.839200,0.000000,23.994509> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.839200,0.000000,25.033888>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.839200,0.000000,23.994509>}
box{<0,0,-0.076200><1.039378,0.035000,0.076200> rotate<0,-90.000000,0> translate<18.839200,0.000000,23.994509> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.839200,0.000000,25.033888>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.852200,0.000000,25.046888>}
box{<0,0,-0.076200><0.018385,0.035000,0.076200> rotate<0,-44.997030,0> translate<18.839200,0.000000,25.033888> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.852200,0.000000,25.432600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.852200,0.000000,25.046888>}
box{<0,0,-0.076200><0.385713,0.035000,0.076200> rotate<0,-90.000000,0> translate<18.852200,0.000000,25.046888> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.857800,-1.535000,17.929709>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.991709,-1.535000,17.795800>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<18.857800,-1.535000,17.929709> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.857800,-1.535000,19.219088>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.857800,-1.535000,17.929709>}
box{<0,0,-0.076200><1.289378,0.035000,0.076200> rotate<0,-90.000000,0> translate<18.857800,-1.535000,17.929709> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.857800,-1.535000,19.219088>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.991709,-1.535000,19.352997>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<18.857800,-1.535000,19.219088> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.877600,0.000000,17.714025>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.202400,0.000000,17.389225>}
box{<0,0,-0.076200><0.459337,0.035000,0.076200> rotate<0,44.997030,0> translate<18.877600,0.000000,17.714025> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.877600,0.000000,18.006113>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.877600,0.000000,17.714025>}
box{<0,0,-0.076200><0.292088,0.035000,0.076200> rotate<0,-90.000000,0> translate<18.877600,0.000000,17.714025> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.971309,0.000000,16.985397>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.085800,0.000000,16.985397>}
box{<0,0,-0.076200><0.114491,0.035000,0.076200> rotate<0,0.000000,0> translate<18.971309,0.000000,16.985397> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.973109,0.000000,19.217797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.442488,0.000000,19.217797>}
box{<0,0,-0.076200><0.469378,0.035000,0.076200> rotate<0,0.000000,0> translate<18.973109,0.000000,19.217797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.973109,0.000000,23.860600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.442488,0.000000,23.860600>}
box{<0,0,-0.076200><0.469378,0.035000,0.076200> rotate<0,0.000000,0> translate<18.973109,0.000000,23.860600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.991709,-1.535000,17.795800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.454463,-1.535000,17.795800>}
box{<0,0,-0.076200><0.462753,0.035000,0.076200> rotate<0,0.000000,0> translate<18.991709,-1.535000,17.795800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.991709,-1.535000,19.352997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.081088,-1.535000,19.352997>}
box{<0,0,-0.076200><2.089378,0.035000,0.076200> rotate<0,0.000000,0> translate<18.991709,-1.535000,19.352997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.085800,0.000000,17.139772>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.085800,0.000000,16.985397>}
box{<0,0,-0.076200><0.154375,0.035000,0.076200> rotate<0,-90.000000,0> translate<19.085800,0.000000,16.985397> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.085800,0.000000,17.139772>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.202400,0.000000,17.256369>}
box{<0,0,-0.076200><0.164895,0.035000,0.076200> rotate<0,-44.996262,0> translate<19.085800,0.000000,17.139772> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.202400,0.000000,17.389225>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.202400,0.000000,17.256369>}
box{<0,0,-0.076200><0.132856,0.035000,0.076200> rotate<0,-90.000000,0> translate<19.202400,0.000000,17.256369> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.413256,-1.535000,17.754597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.454463,-1.535000,17.795800>}
box{<0,0,-0.076200><0.058272,0.035000,0.076200> rotate<0,-44.994858,0> translate<19.413256,-1.535000,17.754597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.442488,0.000000,19.217797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.576397,0.000000,19.083887>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<19.442488,0.000000,19.217797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.442488,0.000000,23.860600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.576397,0.000000,23.994509>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<19.442488,0.000000,23.860600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.457884,0.000000,19.202400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.957712,0.000000,19.202400>}
box{<0,0,-0.076200><0.499828,0.035000,0.076200> rotate<0,0.000000,0> translate<19.457884,0.000000,19.202400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.508688,0.000000,23.926800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.906909,0.000000,23.926800>}
box{<0,0,-0.076200><0.398222,0.035000,0.076200> rotate<0,0.000000,0> translate<19.508688,0.000000,23.926800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.537997,0.000000,17.987572>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.537997,0.000000,18.006113>}
box{<0,0,-0.076200><0.018541,0.035000,0.076200> rotate<0,90.000000,0> translate<19.537997,0.000000,18.006113> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.537997,0.000000,17.987572>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.669372,0.000000,17.856197>}
box{<0,0,-0.076200><0.185792,0.035000,0.076200> rotate<0,44.997030,0> translate<19.537997,0.000000,17.987572> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.537997,0.000000,18.006113>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.576397,0.000000,18.044509>}
box{<0,0,-0.076200><0.054304,0.035000,0.076200> rotate<0,-44.994699,0> translate<19.537997,0.000000,18.006113> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.542369,0.000000,17.983200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.877600,0.000000,17.983200>}
box{<0,0,-0.076200><0.335231,0.035000,0.076200> rotate<0,0.000000,0> translate<19.542369,0.000000,17.983200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.563397,0.000000,25.046888>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.563397,0.000000,25.432600>}
box{<0,0,-0.076200><0.385713,0.035000,0.076200> rotate<0,90.000000,0> translate<19.563397,0.000000,25.432600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.563397,0.000000,25.046888>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.576397,0.000000,25.033888>}
box{<0,0,-0.076200><0.018385,0.035000,0.076200> rotate<0,44.997030,0> translate<19.563397,0.000000,25.046888> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.563397,0.000000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.852200,0.000000,25.146000>}
box{<0,0,-0.076200><0.288803,0.035000,0.076200> rotate<0,0.000000,0> translate<19.563397,0.000000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.563397,0.000000,25.298400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.944109,0.000000,25.298400>}
box{<0,0,-0.076200><0.380712,0.035000,0.076200> rotate<0,0.000000,0> translate<19.563397,0.000000,25.298400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.563397,0.000000,25.432600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.759087,0.000000,25.432600>}
box{<0,0,-0.076200><0.195691,0.035000,0.076200> rotate<0,0.000000,0> translate<19.563397,0.000000,25.432600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.576397,0.000000,18.044509>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.576397,0.000000,19.083887>}
box{<0,0,-0.076200><1.039378,0.035000,0.076200> rotate<0,90.000000,0> translate<19.576397,0.000000,19.083887> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.576397,0.000000,18.135600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.839200,0.000000,18.135600>}
box{<0,0,-0.076200><0.262803,0.035000,0.076200> rotate<0,0.000000,0> translate<19.576397,0.000000,18.135600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.576397,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.839200,0.000000,18.288000>}
box{<0,0,-0.076200><0.262803,0.035000,0.076200> rotate<0,0.000000,0> translate<19.576397,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.576397,0.000000,18.440400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.839200,0.000000,18.440400>}
box{<0,0,-0.076200><0.262803,0.035000,0.076200> rotate<0,0.000000,0> translate<19.576397,0.000000,18.440400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.576397,0.000000,18.592800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.839200,0.000000,18.592800>}
box{<0,0,-0.076200><0.262803,0.035000,0.076200> rotate<0,0.000000,0> translate<19.576397,0.000000,18.592800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.576397,0.000000,18.745200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.839200,0.000000,18.745200>}
box{<0,0,-0.076200><0.262803,0.035000,0.076200> rotate<0,0.000000,0> translate<19.576397,0.000000,18.745200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.576397,0.000000,18.897600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.839200,0.000000,18.897600>}
box{<0,0,-0.076200><0.262803,0.035000,0.076200> rotate<0,0.000000,0> translate<19.576397,0.000000,18.897600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.576397,0.000000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.839200,0.000000,19.050000>}
box{<0,0,-0.076200><0.262803,0.035000,0.076200> rotate<0,0.000000,0> translate<19.576397,0.000000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.576397,0.000000,23.994509>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.576397,0.000000,25.033888>}
box{<0,0,-0.076200><1.039378,0.035000,0.076200> rotate<0,90.000000,0> translate<19.576397,0.000000,25.033888> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.576397,0.000000,24.079200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.839200,0.000000,24.079200>}
box{<0,0,-0.076200><0.262803,0.035000,0.076200> rotate<0,0.000000,0> translate<19.576397,0.000000,24.079200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.576397,0.000000,24.231600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.839200,0.000000,24.231600>}
box{<0,0,-0.076200><0.262803,0.035000,0.076200> rotate<0,0.000000,0> translate<19.576397,0.000000,24.231600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.576397,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.839200,0.000000,24.384000>}
box{<0,0,-0.076200><0.262803,0.035000,0.076200> rotate<0,0.000000,0> translate<19.576397,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.576397,0.000000,24.536400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.839200,0.000000,24.536400>}
box{<0,0,-0.076200><0.262803,0.035000,0.076200> rotate<0,0.000000,0> translate<19.576397,0.000000,24.536400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.576397,0.000000,24.688800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.839200,0.000000,24.688800>}
box{<0,0,-0.076200><0.262803,0.035000,0.076200> rotate<0,0.000000,0> translate<19.576397,0.000000,24.688800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.576397,0.000000,24.841200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.839200,0.000000,24.841200>}
box{<0,0,-0.076200><0.262803,0.035000,0.076200> rotate<0,0.000000,0> translate<19.576397,0.000000,24.841200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.576397,0.000000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.839200,0.000000,24.993600>}
box{<0,0,-0.076200><0.262803,0.035000,0.076200> rotate<0,0.000000,0> translate<19.576397,0.000000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.669372,0.000000,17.856197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.802228,0.000000,17.856197>}
box{<0,0,-0.076200><0.132856,0.035000,0.076200> rotate<0,0.000000,0> translate<19.669372,0.000000,17.856197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.759087,0.000000,25.432600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.892997,0.000000,25.566509>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<19.759087,0.000000,25.432600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.759087,0.000000,26.789797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.892997,0.000000,26.655888>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<19.759087,0.000000,26.789797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.777287,0.000000,25.450800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.096509,0.000000,25.450800>}
box{<0,0,-0.076200><0.319222,0.035000,0.076200> rotate<0,0.000000,0> translate<19.777287,0.000000,25.450800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.802228,0.000000,17.856197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.877600,0.000000,17.931569>}
box{<0,0,-0.076200><0.106592,0.035000,0.076200> rotate<0,-44.997030,0> translate<19.802228,0.000000,17.856197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.839200,0.000000,18.044509>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.877600,0.000000,18.006113>}
box{<0,0,-0.076200><0.054304,0.035000,0.076200> rotate<0,44.994699,0> translate<19.839200,0.000000,18.044509> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.839200,0.000000,19.083887>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.839200,0.000000,18.044509>}
box{<0,0,-0.076200><1.039378,0.035000,0.076200> rotate<0,-90.000000,0> translate<19.839200,0.000000,18.044509> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.839200,0.000000,19.083887>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.973109,0.000000,19.217797>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<19.839200,0.000000,19.083887> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.839200,0.000000,23.994509>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.973109,0.000000,23.860600>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<19.839200,0.000000,23.994509> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.839200,0.000000,25.033888>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.839200,0.000000,23.994509>}
box{<0,0,-0.076200><1.039378,0.035000,0.076200> rotate<0,-90.000000,0> translate<19.839200,0.000000,23.994509> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.839200,0.000000,25.033888>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.852200,0.000000,25.046884>}
box{<0,0,-0.076200><0.018383,0.035000,0.076200> rotate<0,-44.990143,0> translate<19.839200,0.000000,25.033888> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.852200,0.000000,25.206494>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.852200,0.000000,25.046884>}
box{<0,0,-0.076200><0.159609,0.035000,0.076200> rotate<0,-90.000000,0> translate<19.852200,0.000000,25.046884> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.852200,0.000000,25.206494>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.124009,0.000000,25.478300>}
box{<0,0,-0.076200><0.384394,0.035000,0.076200> rotate<0,-44.996701,0> translate<19.852200,0.000000,25.206494> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.877600,0.000000,18.006113>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.877600,0.000000,17.931569>}
box{<0,0,-0.076200><0.074544,0.035000,0.076200> rotate<0,-90.000000,0> translate<19.877600,0.000000,17.931569> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.878884,0.000000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.049913,0.000000,26.670000>}
box{<0,0,-0.076200><0.171028,0.035000,0.076200> rotate<0,0.000000,0> translate<19.878884,0.000000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.892997,0.000000,25.566509>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.892997,0.000000,26.655888>}
box{<0,0,-0.076200><1.089378,0.035000,0.076200> rotate<0,90.000000,0> translate<19.892997,0.000000,26.655888> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.892997,0.000000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.035800,0.000000,25.603200>}
box{<0,0,-0.076200><0.142803,0.035000,0.076200> rotate<0,0.000000,0> translate<19.892997,0.000000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.892997,0.000000,25.755600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.035800,0.000000,25.755600>}
box{<0,0,-0.076200><0.142803,0.035000,0.076200> rotate<0,0.000000,0> translate<19.892997,0.000000,25.755600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.892997,0.000000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.035800,0.000000,25.908000>}
box{<0,0,-0.076200><0.142803,0.035000,0.076200> rotate<0,0.000000,0> translate<19.892997,0.000000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.892997,0.000000,26.060400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.035800,0.000000,26.060400>}
box{<0,0,-0.076200><0.142803,0.035000,0.076200> rotate<0,0.000000,0> translate<19.892997,0.000000,26.060400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.892997,0.000000,26.212800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.035800,0.000000,26.212800>}
box{<0,0,-0.076200><0.142803,0.035000,0.076200> rotate<0,0.000000,0> translate<19.892997,0.000000,26.212800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.892997,0.000000,26.365200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.035800,0.000000,26.365200>}
box{<0,0,-0.076200><0.142803,0.035000,0.076200> rotate<0,0.000000,0> translate<19.892997,0.000000,26.365200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.892997,0.000000,26.517600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.035800,0.000000,26.517600>}
box{<0,0,-0.076200><0.142803,0.035000,0.076200> rotate<0,0.000000,0> translate<19.892997,0.000000,26.517600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.973109,0.000000,19.217797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.279200,0.000000,19.217797>}
box{<0,0,-0.076200><0.306091,0.035000,0.076200> rotate<0,0.000000,0> translate<19.973109,0.000000,19.217797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.973109,0.000000,23.860600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.279200,0.000000,23.860600>}
box{<0,0,-0.076200><0.306091,0.035000,0.076200> rotate<0,0.000000,0> translate<19.973109,0.000000,23.860600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.994597,0.000000,15.778125>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.994597,0.000000,16.827256>}
box{<0,0,-0.076200><1.049131,0.035000,0.076200> rotate<0,90.000000,0> translate<19.994597,0.000000,16.827256> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.994597,0.000000,15.778125>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,0.000000,15.778125>}
box{<0,0,-0.076200><4.507478,0.035000,0.076200> rotate<0,0.000000,0> translate<19.994597,0.000000,15.778125> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.994597,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,0.000000,15.849600>}
box{<0,0,-0.076200><4.507478,0.035000,0.076200> rotate<0,0.000000,0> translate<19.994597,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.994597,0.000000,16.002000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,0.000000,16.002000>}
box{<0,0,-0.076200><4.507478,0.035000,0.076200> rotate<0,0.000000,0> translate<19.994597,0.000000,16.002000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.994597,0.000000,16.154400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,0.000000,16.154400>}
box{<0,0,-0.076200><4.507478,0.035000,0.076200> rotate<0,0.000000,0> translate<19.994597,0.000000,16.154400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.994597,0.000000,16.306800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,0.000000,16.306800>}
box{<0,0,-0.076200><4.507478,0.035000,0.076200> rotate<0,0.000000,0> translate<19.994597,0.000000,16.306800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.994597,0.000000,16.459200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,0.000000,16.459200>}
box{<0,0,-0.076200><4.507478,0.035000,0.076200> rotate<0,0.000000,0> translate<19.994597,0.000000,16.459200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.994597,0.000000,16.611600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.102709,0.000000,16.611600>}
box{<0,0,-0.076200><2.108112,0.035000,0.076200> rotate<0,0.000000,0> translate<19.994597,0.000000,16.611600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.994597,0.000000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.978200,0.000000,16.764000>}
box{<0,0,-0.076200><1.983603,0.035000,0.076200> rotate<0,0.000000,0> translate<19.994597,0.000000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.994597,0.000000,16.827256>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.058341,0.000000,16.891000>}
box{<0,0,-0.076200><0.090147,0.035000,0.076200> rotate<0,-44.997030,0> translate<19.994597,0.000000,16.827256> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.035800,0.000000,25.566509>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.124009,0.000000,25.478300>}
box{<0,0,-0.076200><0.124747,0.035000,0.076200> rotate<0,44.997030,0> translate<20.035800,0.000000,25.566509> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.035800,0.000000,26.655888>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.035800,0.000000,25.566509>}
box{<0,0,-0.076200><1.089378,0.035000,0.076200> rotate<0,-90.000000,0> translate<20.035800,0.000000,25.566509> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.035800,0.000000,26.655888>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.169709,0.000000,26.789797>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<20.035800,0.000000,26.655888> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.058341,0.000000,16.891000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.978200,0.000000,16.891000>}
box{<0,0,-0.076200><1.919859,0.035000,0.076200> rotate<0,0.000000,0> translate<20.058341,0.000000,16.891000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.169709,0.000000,26.789797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.059088,0.000000,26.789797>}
box{<0,0,-0.076200><0.889378,0.035000,0.076200> rotate<0,0.000000,0> translate<20.169709,0.000000,26.789797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.279200,0.000000,19.523888>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.279200,0.000000,19.217797>}
box{<0,0,-0.076200><0.306091,0.035000,0.076200> rotate<0,-90.000000,0> translate<20.279200,0.000000,19.217797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.279200,0.000000,19.523888>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.413109,0.000000,19.657797>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<20.279200,0.000000,19.523888> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.279200,0.000000,20.054509>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.413109,0.000000,19.920600>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<20.279200,0.000000,20.054509> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.279200,0.000000,20.523888>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.279200,0.000000,20.054509>}
box{<0,0,-0.076200><0.469378,0.035000,0.076200> rotate<0,-90.000000,0> translate<20.279200,0.000000,20.054509> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.279200,0.000000,20.523888>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.413109,0.000000,20.657797>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<20.279200,0.000000,20.523888> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.279200,0.000000,21.554509>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.413109,0.000000,21.420600>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<20.279200,0.000000,21.554509> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.279200,0.000000,22.023888>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.279200,0.000000,21.554509>}
box{<0,0,-0.076200><0.469378,0.035000,0.076200> rotate<0,-90.000000,0> translate<20.279200,0.000000,21.554509> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.279200,0.000000,22.023888>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.294512,0.000000,22.039197>}
box{<0,0,-0.076200><0.021653,0.035000,0.076200> rotate<0,-44.991183,0> translate<20.279200,0.000000,22.023888> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.279200,0.000000,22.054509>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.294512,0.000000,22.039197>}
box{<0,0,-0.076200><0.021655,0.035000,0.076200> rotate<0,44.997030,0> translate<20.279200,0.000000,22.054509> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.279200,0.000000,22.523888>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.279200,0.000000,22.054509>}
box{<0,0,-0.076200><0.469378,0.035000,0.076200> rotate<0,-90.000000,0> translate<20.279200,0.000000,22.054509> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.279200,0.000000,22.523888>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.294512,0.000000,22.539197>}
box{<0,0,-0.076200><0.021653,0.035000,0.076200> rotate<0,-44.991183,0> translate<20.279200,0.000000,22.523888> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.279200,0.000000,22.554509>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.294512,0.000000,22.539197>}
box{<0,0,-0.076200><0.021655,0.035000,0.076200> rotate<0,44.997030,0> translate<20.279200,0.000000,22.554509> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.279200,0.000000,23.023888>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.279200,0.000000,22.554509>}
box{<0,0,-0.076200><0.469378,0.035000,0.076200> rotate<0,-90.000000,0> translate<20.279200,0.000000,22.554509> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.279200,0.000000,23.023888>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.413109,0.000000,23.157797>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<20.279200,0.000000,23.023888> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.279200,0.000000,23.554509>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.413109,0.000000,23.420600>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<20.279200,0.000000,23.554509> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.279200,0.000000,23.860600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.279200,0.000000,23.554509>}
box{<0,0,-0.076200><0.306091,0.035000,0.076200> rotate<0,-90.000000,0> translate<20.279200,0.000000,23.554509> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.413109,0.000000,19.657797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.452488,0.000000,19.657797>}
box{<0,0,-0.076200><1.039378,0.035000,0.076200> rotate<0,0.000000,0> translate<20.413109,0.000000,19.657797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.413109,0.000000,19.920600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.452488,0.000000,19.920600>}
box{<0,0,-0.076200><1.039378,0.035000,0.076200> rotate<0,0.000000,0> translate<20.413109,0.000000,19.920600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.413109,0.000000,20.657797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.452488,0.000000,20.657797>}
box{<0,0,-0.076200><1.039378,0.035000,0.076200> rotate<0,0.000000,0> translate<20.413109,0.000000,20.657797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.413109,0.000000,21.420600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.452488,0.000000,21.420600>}
box{<0,0,-0.076200><1.039378,0.035000,0.076200> rotate<0,0.000000,0> translate<20.413109,0.000000,21.420600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.413109,0.000000,23.157797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.452488,0.000000,23.157797>}
box{<0,0,-0.076200><1.039378,0.035000,0.076200> rotate<0,0.000000,0> translate<20.413109,0.000000,23.157797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.413109,0.000000,23.420600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.452488,0.000000,23.420600>}
box{<0,0,-0.076200><1.039378,0.035000,0.076200> rotate<0,0.000000,0> translate<20.413109,0.000000,23.420600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.537997,0.000000,17.754597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.537997,0.000000,18.006113>}
box{<0,0,-0.076200><0.251516,0.035000,0.076200> rotate<0,90.000000,0> translate<20.537997,0.000000,18.006113> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.537997,0.000000,17.754597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.107309,0.000000,17.754597>}
box{<0,0,-0.076200><1.569312,0.035000,0.076200> rotate<0,0.000000,0> translate<20.537997,0.000000,17.754597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.537997,0.000000,17.830800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.190200,0.000000,17.830800>}
box{<0,0,-0.076200><2.652203,0.035000,0.076200> rotate<0,0.000000,0> translate<20.537997,0.000000,17.830800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.537997,0.000000,17.983200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.190200,0.000000,17.983200>}
box{<0,0,-0.076200><2.652203,0.035000,0.076200> rotate<0,0.000000,0> translate<20.537997,0.000000,17.983200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.537997,0.000000,18.006113>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.576397,0.000000,18.044509>}
box{<0,0,-0.076200><0.054304,0.035000,0.076200> rotate<0,-44.994699,0> translate<20.537997,0.000000,18.006113> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.576397,0.000000,18.044509>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.576397,0.000000,18.920600>}
box{<0,0,-0.076200><0.876091,0.035000,0.076200> rotate<0,90.000000,0> translate<20.576397,0.000000,18.920600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.576397,0.000000,18.135600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.144816,0.000000,18.135600>}
box{<0,0,-0.076200><0.568419,0.035000,0.076200> rotate<0,0.000000,0> translate<20.576397,0.000000,18.135600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.576397,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.992416,0.000000,18.288000>}
box{<0,0,-0.076200><0.416019,0.035000,0.076200> rotate<0,0.000000,0> translate<20.576397,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.576397,0.000000,18.440400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.929600,0.000000,18.440400>}
box{<0,0,-0.076200><0.353203,0.035000,0.076200> rotate<0,0.000000,0> translate<20.576397,0.000000,18.440400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.576397,0.000000,18.592800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.929600,0.000000,18.592800>}
box{<0,0,-0.076200><0.353203,0.035000,0.076200> rotate<0,0.000000,0> translate<20.576397,0.000000,18.592800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.576397,0.000000,18.745200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.858503,0.000000,18.745200>}
box{<0,0,-0.076200><0.282106,0.035000,0.076200> rotate<0,0.000000,0> translate<20.576397,0.000000,18.745200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.576397,0.000000,18.897600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.706103,0.000000,18.897600>}
box{<0,0,-0.076200><0.129706,0.035000,0.076200> rotate<0,0.000000,0> translate<20.576397,0.000000,18.897600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.576397,0.000000,18.920600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.683103,0.000000,18.920600>}
box{<0,0,-0.076200><0.106706,0.035000,0.076200> rotate<0,0.000000,0> translate<20.576397,0.000000,18.920600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.683103,0.000000,18.920600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.929600,0.000000,18.674103>}
box{<0,0,-0.076200><0.348599,0.035000,0.076200> rotate<0,44.997030,0> translate<20.683103,0.000000,18.920600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.929600,0.000000,18.350816>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.271816,0.000000,18.008600>}
box{<0,0,-0.076200><0.483966,0.035000,0.076200> rotate<0,44.997030,0> translate<20.929600,0.000000,18.350816> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.929600,0.000000,18.674103>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.929600,0.000000,18.350816>}
box{<0,0,-0.076200><0.323288,0.035000,0.076200> rotate<0,-90.000000,0> translate<20.929600,0.000000,18.350816> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.059088,0.000000,26.789797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.192997,0.000000,26.655888>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<21.059088,0.000000,26.789797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.081088,-1.535000,19.352997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.214997,-1.535000,19.219088>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<21.081088,-1.535000,19.352997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.178884,0.000000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.894800,0.000000,26.670000>}
box{<0,0,-0.076200><0.715916,0.035000,0.076200> rotate<0,0.000000,0> translate<21.178884,0.000000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.184113,-1.535000,16.949969>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.214997,-1.535000,16.919087>}
box{<0,0,-0.076200><0.043675,0.035000,0.076200> rotate<0,44.994132,0> translate<21.184113,-1.535000,16.949969> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.184113,-1.535000,16.949969>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.767319,-1.535000,17.553228>}
box{<0,0,-0.076200><0.839078,0.035000,0.076200> rotate<0,-45.965262,0> translate<21.184113,-1.535000,16.949969> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.192997,0.000000,26.598597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.192997,0.000000,26.655888>}
box{<0,0,-0.076200><0.057291,0.035000,0.076200> rotate<0,90.000000,0> translate<21.192997,0.000000,26.655888> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.192997,0.000000,26.598597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.894800,0.000000,26.598597>}
box{<0,0,-0.076200><0.701803,0.035000,0.076200> rotate<0,0.000000,0> translate<21.192997,0.000000,26.598597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.214997,-1.535000,15.778125>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.214997,-1.535000,16.919087>}
box{<0,0,-0.076200><1.140962,0.035000,0.076200> rotate<0,90.000000,0> translate<21.214997,-1.535000,16.919087> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.214997,-1.535000,15.778125>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,15.778125>}
box{<0,0,-0.076200><3.287078,0.035000,0.076200> rotate<0,0.000000,0> translate<21.214997,-1.535000,15.778125> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.214997,-1.535000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,15.849600>}
box{<0,0,-0.076200><3.287078,0.035000,0.076200> rotate<0,0.000000,0> translate<21.214997,-1.535000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.214997,-1.535000,16.002000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,16.002000>}
box{<0,0,-0.076200><3.287078,0.035000,0.076200> rotate<0,0.000000,0> translate<21.214997,-1.535000,16.002000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.214997,-1.535000,16.154400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,16.154400>}
box{<0,0,-0.076200><3.287078,0.035000,0.076200> rotate<0,0.000000,0> translate<21.214997,-1.535000,16.154400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.214997,-1.535000,16.306800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,16.306800>}
box{<0,0,-0.076200><3.287078,0.035000,0.076200> rotate<0,0.000000,0> translate<21.214997,-1.535000,16.306800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.214997,-1.535000,16.459200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,16.459200>}
box{<0,0,-0.076200><3.287078,0.035000,0.076200> rotate<0,0.000000,0> translate<21.214997,-1.535000,16.459200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.214997,-1.535000,16.611600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,16.611600>}
box{<0,0,-0.076200><3.287078,0.035000,0.076200> rotate<0,0.000000,0> translate<21.214997,-1.535000,16.611600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.214997,-1.535000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,16.764000>}
box{<0,0,-0.076200><3.287078,0.035000,0.076200> rotate<0,0.000000,0> translate<21.214997,-1.535000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.214997,-1.535000,16.916400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,16.916400>}
box{<0,0,-0.076200><3.287078,0.035000,0.076200> rotate<0,0.000000,0> translate<21.214997,-1.535000,16.916400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.214997,-1.535000,19.120175>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.214997,-1.535000,19.219088>}
box{<0,0,-0.076200><0.098913,0.035000,0.076200> rotate<0,90.000000,0> translate<21.214997,-1.535000,19.219088> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.214997,-1.535000,19.120175>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.271816,-1.535000,19.176997>}
box{<0,0,-0.076200><0.080356,0.035000,0.076200> rotate<0,-44.998606,0> translate<21.214997,-1.535000,19.120175> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.214997,-1.535000,19.202400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,19.202400>}
box{<0,0,-0.076200><3.287078,0.035000,0.076200> rotate<0,0.000000,0> translate<21.214997,-1.535000,19.202400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.271816,0.000000,18.008600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.755781,0.000000,18.008600>}
box{<0,0,-0.076200><0.483966,0.035000,0.076200> rotate<0,0.000000,0> translate<21.271816,0.000000,18.008600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.271816,-1.535000,19.176997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.755781,-1.535000,19.176997>}
box{<0,0,-0.076200><0.483966,0.035000,0.076200> rotate<0,0.000000,0> translate<21.271816,-1.535000,19.176997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.298991,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,17.068800>}
box{<0,0,-0.076200><3.203084,0.035000,0.076200> rotate<0,0.000000,0> translate<21.298991,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.446325,-1.535000,17.221200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,17.221200>}
box{<0,0,-0.076200><3.055750,0.035000,0.076200> rotate<0,0.000000,0> translate<21.446325,-1.535000,17.221200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.452488,0.000000,19.657797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.586397,0.000000,19.523888>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<21.452488,0.000000,19.657797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.452488,0.000000,19.920600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.490884,0.000000,19.959000>}
box{<0,0,-0.076200><0.054304,0.035000,0.076200> rotate<0,-44.999361,0> translate<21.452488,0.000000,19.920600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.452488,0.000000,20.657797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.490884,0.000000,20.619397>}
box{<0,0,-0.076200><0.054304,0.035000,0.076200> rotate<0,44.999361,0> translate<21.452488,0.000000,20.657797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.452488,0.000000,21.420600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.586397,0.000000,21.554509>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<21.452488,0.000000,21.420600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.452488,0.000000,23.157797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.586397,0.000000,23.023888>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<21.452488,0.000000,23.157797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.452488,0.000000,23.420600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.586397,0.000000,23.554509>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<21.452488,0.000000,23.420600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.490884,0.000000,19.959000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.315972,0.000000,19.959000>}
box{<0,0,-0.076200><0.825088,0.035000,0.076200> rotate<0,0.000000,0> translate<21.490884,0.000000,19.959000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.490884,0.000000,20.619397>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.978200,0.000000,20.619397>}
box{<0,0,-0.076200><0.487316,0.035000,0.076200> rotate<0,0.000000,0> translate<21.490884,0.000000,20.619397> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.501487,0.000000,23.469600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,0.000000,23.469600>}
box{<0,0,-0.076200><3.000588,0.035000,0.076200> rotate<0,0.000000,0> translate<21.501487,0.000000,23.469600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.520288,0.000000,21.488400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.927400,0.000000,21.488400>}
box{<0,0,-0.076200><0.407113,0.035000,0.076200> rotate<0,0.000000,0> translate<21.520288,0.000000,21.488400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.586397,0.000000,19.176997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.586397,0.000000,19.523888>}
box{<0,0,-0.076200><0.346891,0.035000,0.076200> rotate<0,90.000000,0> translate<21.586397,0.000000,19.523888> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.586397,0.000000,19.176997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.755781,0.000000,19.176997>}
box{<0,0,-0.076200><0.169384,0.035000,0.076200> rotate<0,0.000000,0> translate<21.586397,0.000000,19.176997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.586397,0.000000,19.202400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.190200,0.000000,19.202400>}
box{<0,0,-0.076200><1.603803,0.035000,0.076200> rotate<0,0.000000,0> translate<21.586397,0.000000,19.202400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.586397,0.000000,19.354800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.190200,0.000000,19.354800>}
box{<0,0,-0.076200><1.603803,0.035000,0.076200> rotate<0,0.000000,0> translate<21.586397,0.000000,19.354800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.586397,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.190200,0.000000,19.507200>}
box{<0,0,-0.076200><1.603803,0.035000,0.076200> rotate<0,0.000000,0> translate<21.586397,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.586397,0.000000,21.554509>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.586397,0.000000,21.945600>}
box{<0,0,-0.076200><0.391091,0.035000,0.076200> rotate<0,90.000000,0> translate<21.586397,0.000000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.586397,0.000000,21.640800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.927400,0.000000,21.640800>}
box{<0,0,-0.076200><0.341003,0.035000,0.076200> rotate<0,0.000000,0> translate<21.586397,0.000000,21.640800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.586397,0.000000,21.793200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.783425,0.000000,21.793200>}
box{<0,0,-0.076200><0.197028,0.035000,0.076200> rotate<0,0.000000,0> translate<21.586397,0.000000,21.793200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.586397,0.000000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.631025,0.000000,21.945600>}
box{<0,0,-0.076200><0.044628,0.035000,0.076200> rotate<0,0.000000,0> translate<21.586397,0.000000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.586397,0.000000,22.605997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.586397,0.000000,23.023888>}
box{<0,0,-0.076200><0.417891,0.035000,0.076200> rotate<0,90.000000,0> translate<21.586397,0.000000,23.023888> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.586397,0.000000,22.605997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.904572,0.000000,22.605997>}
box{<0,0,-0.076200><0.318175,0.035000,0.076200> rotate<0,0.000000,0> translate<21.586397,0.000000,22.605997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.586397,0.000000,22.707600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,0.000000,22.707600>}
box{<0,0,-0.076200><2.915678,0.035000,0.076200> rotate<0,0.000000,0> translate<21.586397,0.000000,22.707600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.586397,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,0.000000,22.860000>}
box{<0,0,-0.076200><2.915678,0.035000,0.076200> rotate<0,0.000000,0> translate<21.586397,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.586397,0.000000,23.012400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,0.000000,23.012400>}
box{<0,0,-0.076200><2.915678,0.035000,0.076200> rotate<0,0.000000,0> translate<21.586397,0.000000,23.012400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.586397,0.000000,23.554509>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.586397,0.000000,23.583225>}
box{<0,0,-0.076200><0.028716,0.035000,0.076200> rotate<0,90.000000,0> translate<21.586397,0.000000,23.583225> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.586397,0.000000,23.583225>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.828372,0.000000,23.825200>}
box{<0,0,-0.076200><0.342204,0.035000,0.076200> rotate<0,-44.997030,0> translate<21.586397,0.000000,23.583225> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.593659,-1.535000,17.373600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,17.373600>}
box{<0,0,-0.076200><2.908416,0.035000,0.076200> rotate<0,0.000000,0> translate<21.593659,-1.535000,17.373600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.625172,0.000000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,0.000000,23.622000>}
box{<0,0,-0.076200><2.876903,0.035000,0.076200> rotate<0,0.000000,0> translate<21.625172,0.000000,23.622000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.631025,0.000000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.927400,0.000000,21.649225>}
box{<0,0,-0.076200><0.419138,0.035000,0.076200> rotate<0,44.997030,0> translate<21.631025,0.000000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.740994,-1.535000,17.526000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,17.526000>}
box{<0,0,-0.076200><2.761081,0.035000,0.076200> rotate<0,0.000000,0> translate<21.740994,-1.535000,17.526000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.755781,0.000000,18.008600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.097997,0.000000,18.350816>}
box{<0,0,-0.076200><0.483966,0.035000,0.076200> rotate<0,-44.997030,0> translate<21.755781,0.000000,18.008600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.755781,0.000000,19.176997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.097997,0.000000,18.834781>}
box{<0,0,-0.076200><0.483966,0.035000,0.076200> rotate<0,44.997030,0> translate<21.755781,0.000000,19.176997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.755781,-1.535000,19.176997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.097997,-1.535000,18.834781>}
box{<0,0,-0.076200><0.483966,0.035000,0.076200> rotate<0,44.997030,0> translate<21.755781,-1.535000,19.176997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.767319,-1.535000,17.553228>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.869397,-1.535000,17.655303>}
box{<0,0,-0.076200><0.144358,0.035000,0.076200> rotate<0,-44.996153,0> translate<21.767319,-1.535000,17.553228> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.777572,0.000000,23.774400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,0.000000,23.774400>}
box{<0,0,-0.076200><2.724503,0.035000,0.076200> rotate<0,0.000000,0> translate<21.777572,0.000000,23.774400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.828372,0.000000,23.825200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.678372,0.000000,23.825200>}
box{<0,0,-0.076200><0.850000,0.035000,0.076200> rotate<0,0.000000,0> translate<21.828372,0.000000,23.825200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.869397,-1.535000,17.655303>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.869397,-1.535000,17.658816>}
box{<0,0,-0.076200><0.003513,0.035000,0.076200> rotate<0,90.000000,0> translate<21.869397,-1.535000,17.658816> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.869397,-1.535000,17.658816>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.871834,-1.535000,17.661334>}
box{<0,0,-0.076200><0.003505,0.035000,0.076200> rotate<0,-45.936159,0> translate<21.869397,-1.535000,17.658816> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.869397,-1.535000,17.805559>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.869397,-1.535000,18.122216>}
box{<0,0,-0.076200><0.316656,0.035000,0.076200> rotate<0,90.000000,0> translate<21.869397,-1.535000,18.122216> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.869397,-1.535000,17.805559>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.871834,-1.535000,17.661334>}
box{<0,0,-0.076200><0.144246,0.035000,0.076200> rotate<0,89.025879,0> translate<21.869397,-1.535000,17.805559> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.869397,-1.535000,17.830800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,17.830800>}
box{<0,0,-0.076200><2.632678,0.035000,0.076200> rotate<0,0.000000,0> translate<21.869397,-1.535000,17.830800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.869397,-1.535000,17.983200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,17.983200>}
box{<0,0,-0.076200><2.632678,0.035000,0.076200> rotate<0,0.000000,0> translate<21.869397,-1.535000,17.983200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.869397,-1.535000,18.122216>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.097997,-1.535000,18.350816>}
box{<0,0,-0.076200><0.323289,0.035000,0.076200> rotate<0,-44.997030,0> translate<21.869397,-1.535000,18.122216> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.871547,-1.535000,17.678400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,17.678400>}
box{<0,0,-0.076200><2.630528,0.035000,0.076200> rotate<0,0.000000,0> translate<21.871547,-1.535000,17.678400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.882778,0.000000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.190200,0.000000,19.050000>}
box{<0,0,-0.076200><1.307422,0.035000,0.076200> rotate<0,0.000000,0> translate<21.882778,0.000000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.882778,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,19.050000>}
box{<0,0,-0.076200><2.619297,0.035000,0.076200> rotate<0,0.000000,0> translate<21.882778,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.882781,0.000000,18.135600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.190200,0.000000,18.135600>}
box{<0,0,-0.076200><1.307419,0.035000,0.076200> rotate<0,0.000000,0> translate<21.882781,0.000000,18.135600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.882781,-1.535000,18.135600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,18.135600>}
box{<0,0,-0.076200><2.619294,0.035000,0.076200> rotate<0,0.000000,0> translate<21.882781,-1.535000,18.135600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.894800,0.000000,28.117475>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.894800,0.000000,26.598597>}
box{<0,0,-0.076200><1.518878,0.035000,0.076200> rotate<0,-90.000000,0> translate<21.894800,0.000000,26.598597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.904572,0.000000,22.605997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.097997,0.000000,22.412572>}
box{<0,0,-0.076200><0.273544,0.035000,0.076200> rotate<0,44.997030,0> translate<21.904572,0.000000,22.605997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.927400,0.000000,21.358909>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.026513,0.000000,21.259797>}
box{<0,0,-0.076200><0.140166,0.035000,0.076200> rotate<0,44.997030,0> translate<21.927400,0.000000,21.358909> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.927400,0.000000,21.649225>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.927400,0.000000,21.358909>}
box{<0,0,-0.076200><0.290316,0.035000,0.076200> rotate<0,-90.000000,0> translate<21.927400,0.000000,21.358909> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.955369,0.000000,22.555200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,0.000000,22.555200>}
box{<0,0,-0.076200><2.546706,0.035000,0.076200> rotate<0,0.000000,0> translate<21.955369,0.000000,22.555200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.978200,0.000000,16.736109>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.112109,0.000000,16.602200>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<21.978200,0.000000,16.736109> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.978200,0.000000,16.891000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.978200,0.000000,16.736109>}
box{<0,0,-0.076200><0.154891,0.035000,0.076200> rotate<0,-90.000000,0> translate<21.978200,0.000000,16.736109> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.978200,0.000000,21.211488>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.978200,0.000000,20.619397>}
box{<0,0,-0.076200><0.592091,0.035000,0.076200> rotate<0,-90.000000,0> translate<21.978200,0.000000,20.619397> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.978200,0.000000,21.211488>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.026513,0.000000,21.259797>}
box{<0,0,-0.076200><0.068322,0.035000,0.076200> rotate<0,-44.995177,0> translate<21.978200,0.000000,21.211488> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.035178,0.000000,18.897600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.190200,0.000000,18.897600>}
box{<0,0,-0.076200><1.155022,0.035000,0.076200> rotate<0,0.000000,0> translate<22.035178,0.000000,18.897600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.035178,-1.535000,18.897600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,18.897600>}
box{<0,0,-0.076200><2.466897,0.035000,0.076200> rotate<0,0.000000,0> translate<22.035178,-1.535000,18.897600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.035181,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.190200,0.000000,18.288000>}
box{<0,0,-0.076200><1.155019,0.035000,0.076200> rotate<0,0.000000,0> translate<22.035181,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.035181,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,18.288000>}
box{<0,0,-0.076200><2.466894,0.035000,0.076200> rotate<0,0.000000,0> translate<22.035181,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.097997,0.000000,18.350816>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.097997,0.000000,18.834781>}
box{<0,0,-0.076200><0.483966,0.035000,0.076200> rotate<0,90.000000,0> translate<22.097997,0.000000,18.834781> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.097997,-1.535000,18.350816>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.097997,-1.535000,18.834781>}
box{<0,0,-0.076200><0.483966,0.035000,0.076200> rotate<0,90.000000,0> translate<22.097997,-1.535000,18.834781> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.097997,0.000000,18.440400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.190200,0.000000,18.440400>}
box{<0,0,-0.076200><1.092203,0.035000,0.076200> rotate<0,0.000000,0> translate<22.097997,0.000000,18.440400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.097997,-1.535000,18.440400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,18.440400>}
box{<0,0,-0.076200><2.404078,0.035000,0.076200> rotate<0,0.000000,0> translate<22.097997,-1.535000,18.440400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.097997,0.000000,18.592800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.190200,0.000000,18.592800>}
box{<0,0,-0.076200><1.092203,0.035000,0.076200> rotate<0,0.000000,0> translate<22.097997,0.000000,18.592800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.097997,-1.535000,18.592800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,18.592800>}
box{<0,0,-0.076200><2.404078,0.035000,0.076200> rotate<0,0.000000,0> translate<22.097997,-1.535000,18.592800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.097997,0.000000,18.745200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.190200,0.000000,18.745200>}
box{<0,0,-0.076200><1.092203,0.035000,0.076200> rotate<0,0.000000,0> translate<22.097997,0.000000,18.745200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.097997,-1.535000,18.745200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,18.745200>}
box{<0,0,-0.076200><2.404078,0.035000,0.076200> rotate<0,0.000000,0> translate<22.097997,-1.535000,18.745200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.097997,0.000000,22.412572>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.128372,0.000000,22.382197>}
box{<0,0,-0.076200><0.042957,0.035000,0.076200> rotate<0,44.997030,0> translate<22.097997,0.000000,22.412572> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.107309,0.000000,17.754597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.112109,0.000000,17.759397>}
box{<0,0,-0.076200><0.006788,0.035000,0.076200> rotate<0,-44.997030,0> translate<22.107309,0.000000,17.754597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.107769,0.000000,22.402800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,0.000000,22.402800>}
box{<0,0,-0.076200><2.394306,0.035000,0.076200> rotate<0,0.000000,0> translate<22.107769,0.000000,22.402800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.112109,0.000000,16.602200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.201488,0.000000,16.602200>}
box{<0,0,-0.076200><1.089378,0.035000,0.076200> rotate<0,0.000000,0> translate<22.112109,0.000000,16.602200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.112109,0.000000,17.759397>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.143144,0.000000,17.759397>}
box{<0,0,-0.076200><1.031034,0.035000,0.076200> rotate<0,0.000000,0> translate<22.112109,0.000000,17.759397> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.128372,0.000000,22.382197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.150688,0.000000,22.382197>}
box{<0,0,-0.076200><1.022316,0.035000,0.076200> rotate<0,0.000000,0> translate<22.128372,0.000000,22.382197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.243197,0.000000,25.696797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.243197,0.000000,26.390600>}
box{<0,0,-0.076200><0.693803,0.035000,0.076200> rotate<0,90.000000,0> translate<22.243197,0.000000,26.390600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.243197,0.000000,25.696797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.299088,0.000000,25.696797>}
box{<0,0,-0.076200><0.055891,0.035000,0.076200> rotate<0,0.000000,0> translate<22.243197,0.000000,25.696797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.243197,0.000000,25.755600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,0.000000,25.755600>}
box{<0,0,-0.076200><2.258878,0.035000,0.076200> rotate<0,0.000000,0> translate<22.243197,0.000000,25.755600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.243197,0.000000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,0.000000,25.908000>}
box{<0,0,-0.076200><2.258878,0.035000,0.076200> rotate<0,0.000000,0> translate<22.243197,0.000000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.243197,0.000000,26.060400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,0.000000,26.060400>}
box{<0,0,-0.076200><2.258878,0.035000,0.076200> rotate<0,0.000000,0> translate<22.243197,0.000000,26.060400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.243197,0.000000,26.212800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,0.000000,26.212800>}
box{<0,0,-0.076200><2.258878,0.035000,0.076200> rotate<0,0.000000,0> translate<22.243197,0.000000,26.212800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.243197,0.000000,26.365200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,0.000000,26.365200>}
box{<0,0,-0.076200><2.258878,0.035000,0.076200> rotate<0,0.000000,0> translate<22.243197,0.000000,26.365200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.243197,0.000000,26.390600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,0.000000,26.390600>}
box{<0,0,-0.076200><2.258878,0.035000,0.076200> rotate<0,0.000000,0> translate<22.243197,0.000000,26.390600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.299088,0.000000,25.696797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.432997,0.000000,25.562888>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<22.299088,0.000000,25.696797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.315972,0.000000,19.959000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.545172,0.000000,20.188200>}
box{<0,0,-0.076200><0.324138,0.035000,0.076200> rotate<0,-44.997030,0> translate<22.315972,0.000000,19.959000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.321372,0.000000,19.964400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.190200,0.000000,19.964400>}
box{<0,0,-0.076200><0.868828,0.035000,0.076200> rotate<0,0.000000,0> translate<22.321372,0.000000,19.964400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.392684,0.000000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.616112,0.000000,25.603200>}
box{<0,0,-0.076200><0.223428,0.035000,0.076200> rotate<0,0.000000,0> translate<22.392684,0.000000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.432997,0.000000,24.513766>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.432997,0.000000,25.562888>}
box{<0,0,-0.076200><1.049122,0.035000,0.076200> rotate<0,90.000000,0> translate<22.432997,0.000000,25.562888> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.432997,0.000000,24.513766>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.575800,0.000000,24.656572>}
box{<0,0,-0.076200><0.201956,0.035000,0.076200> rotate<0,-44.997657,0> translate<22.432997,0.000000,24.513766> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.432997,0.000000,24.536400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.455631,0.000000,24.536400>}
box{<0,0,-0.076200><0.022634,0.035000,0.076200> rotate<0,0.000000,0> translate<22.432997,0.000000,24.536400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.432997,0.000000,24.688800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.575800,0.000000,24.688800>}
box{<0,0,-0.076200><0.142803,0.035000,0.076200> rotate<0,0.000000,0> translate<22.432997,0.000000,24.688800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.432997,0.000000,24.841200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.575800,0.000000,24.841200>}
box{<0,0,-0.076200><0.142803,0.035000,0.076200> rotate<0,0.000000,0> translate<22.432997,0.000000,24.841200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.432997,0.000000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.575800,0.000000,24.993600>}
box{<0,0,-0.076200><0.142803,0.035000,0.076200> rotate<0,0.000000,0> translate<22.432997,0.000000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.432997,0.000000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.575800,0.000000,25.146000>}
box{<0,0,-0.076200><0.142803,0.035000,0.076200> rotate<0,0.000000,0> translate<22.432997,0.000000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.432997,0.000000,25.298400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.575800,0.000000,25.298400>}
box{<0,0,-0.076200><0.142803,0.035000,0.076200> rotate<0,0.000000,0> translate<22.432997,0.000000,25.298400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.432997,0.000000,25.450800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.575800,0.000000,25.450800>}
box{<0,0,-0.076200><0.142803,0.035000,0.076200> rotate<0,0.000000,0> translate<22.432997,0.000000,25.450800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.473772,0.000000,20.116800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.190200,0.000000,20.116800>}
box{<0,0,-0.076200><0.716428,0.035000,0.076200> rotate<0,0.000000,0> translate<22.473772,0.000000,20.116800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.545172,0.000000,20.188200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.190200,0.000000,20.188200>}
box{<0,0,-0.076200><0.645028,0.035000,0.076200> rotate<0,0.000000,0> translate<22.545172,0.000000,20.188200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.575800,0.000000,25.562888>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.575800,0.000000,24.656572>}
box{<0,0,-0.076200><0.906316,0.035000,0.076200> rotate<0,-90.000000,0> translate<22.575800,0.000000,24.656572> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.575800,0.000000,25.562888>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.709709,0.000000,25.696797>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<22.575800,0.000000,25.562888> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.678372,0.000000,23.825200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.092772,0.000000,24.239600>}
box{<0,0,-0.076200><0.586050,0.035000,0.076200> rotate<0,-44.997030,0> translate<22.678372,0.000000,23.825200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.709709,0.000000,25.696797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.999088,0.000000,25.696797>}
box{<0,0,-0.076200><1.289378,0.035000,0.076200> rotate<0,0.000000,0> translate<22.709709,0.000000,25.696797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.779972,0.000000,23.926800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,0.000000,23.926800>}
box{<0,0,-0.076200><1.722103,0.035000,0.076200> rotate<0,0.000000,0> translate<22.779972,0.000000,23.926800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.932372,0.000000,24.079200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,0.000000,24.079200>}
box{<0,0,-0.076200><1.569703,0.035000,0.076200> rotate<0,0.000000,0> translate<22.932372,0.000000,24.079200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.084772,0.000000,24.231600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,0.000000,24.231600>}
box{<0,0,-0.076200><1.417303,0.035000,0.076200> rotate<0,0.000000,0> translate<23.084772,0.000000,24.231600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.092772,0.000000,24.239600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.999088,0.000000,24.239600>}
box{<0,0,-0.076200><0.906316,0.035000,0.076200> rotate<0,0.000000,0> translate<23.092772,0.000000,24.239600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.143144,0.000000,17.759397>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.190200,0.000000,17.806456>}
box{<0,0,-0.076200><0.066550,0.035000,0.076200> rotate<0,-44.998932,0> translate<23.143144,0.000000,17.759397> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.150688,0.000000,22.382197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.284597,0.000000,22.248287>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<23.150688,0.000000,22.382197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.190200,0.000000,20.188200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.190200,0.000000,17.806456>}
box{<0,0,-0.076200><2.381744,0.035000,0.076200> rotate<0,-90.000000,0> translate<23.190200,0.000000,17.806456> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.190200,-1.535000,27.432825>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.306206,-1.535000,27.152759>}
box{<0,0,-0.076200><0.303141,0.035000,0.076200> rotate<0,67.495673,0> translate<23.190200,-1.535000,27.432825> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.190200,-1.535000,27.735972>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.190200,-1.535000,27.432825>}
box{<0,0,-0.076200><0.303147,0.035000,0.076200> rotate<0,-90.000000,0> translate<23.190200,-1.535000,27.432825> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.190200,-1.535000,27.735972>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.306206,-1.535000,28.016038>}
box{<0,0,-0.076200><0.303141,0.035000,0.076200> rotate<0,-67.495673,0> translate<23.190200,-1.535000,27.735972> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.201488,0.000000,16.602200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.335397,0.000000,16.736109>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<23.201488,0.000000,16.602200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.210888,0.000000,16.611600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,0.000000,16.611600>}
box{<0,0,-0.076200><1.291187,0.035000,0.076200> rotate<0,0.000000,0> translate<23.210888,0.000000,16.611600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.236284,0.000000,21.310597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.284597,0.000000,21.358909>}
box{<0,0,-0.076200><0.068324,0.035000,0.076200> rotate<0,-44.997030,0> translate<23.236284,0.000000,21.310597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.236284,0.000000,21.310597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.335397,0.000000,21.211488>}
box{<0,0,-0.076200><0.140164,0.035000,0.076200> rotate<0,44.996127,0> translate<23.236284,0.000000,21.310597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.261688,0.000000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,0.000000,21.336000>}
box{<0,0,-0.076200><1.240388,0.035000,0.076200> rotate<0,0.000000,0> translate<23.261688,0.000000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.282484,0.000000,22.250400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,0.000000,22.250400>}
box{<0,0,-0.076200><1.219591,0.035000,0.076200> rotate<0,0.000000,0> translate<23.282484,0.000000,22.250400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.284597,0.000000,21.358909>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.284597,0.000000,22.248287>}
box{<0,0,-0.076200><0.889378,0.035000,0.076200> rotate<0,90.000000,0> translate<23.284597,0.000000,22.248287> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.284597,0.000000,21.488400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,0.000000,21.488400>}
box{<0,0,-0.076200><1.217478,0.035000,0.076200> rotate<0,0.000000,0> translate<23.284597,0.000000,21.488400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.284597,0.000000,21.640800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,0.000000,21.640800>}
box{<0,0,-0.076200><1.217478,0.035000,0.076200> rotate<0,0.000000,0> translate<23.284597,0.000000,21.640800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.284597,0.000000,21.793200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,0.000000,21.793200>}
box{<0,0,-0.076200><1.217478,0.035000,0.076200> rotate<0,0.000000,0> translate<23.284597,0.000000,21.793200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.284597,0.000000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,0.000000,21.945600>}
box{<0,0,-0.076200><1.217478,0.035000,0.076200> rotate<0,0.000000,0> translate<23.284597,0.000000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.284597,0.000000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,0.000000,22.098000>}
box{<0,0,-0.076200><1.217478,0.035000,0.076200> rotate<0,0.000000,0> translate<23.284597,0.000000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.306206,-1.535000,27.152759>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.520559,-1.535000,26.938406>}
box{<0,0,-0.076200><0.303141,0.035000,0.076200> rotate<0,44.997030,0> translate<23.306206,-1.535000,27.152759> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.306206,-1.535000,28.016038>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.407647,-1.535000,28.117475>}
box{<0,0,-0.076200><0.143456,0.035000,0.076200> rotate<0,-44.996148,0> translate<23.306206,-1.535000,28.016038> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.335397,0.000000,16.736109>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.335397,0.000000,16.749000>}
box{<0,0,-0.076200><0.012891,0.035000,0.076200> rotate<0,90.000000,0> translate<23.335397,0.000000,16.749000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.335397,0.000000,16.749000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.354056,0.000000,16.749000>}
box{<0,0,-0.076200><0.018659,0.035000,0.076200> rotate<0,0.000000,0> translate<23.335397,0.000000,16.749000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.335397,0.000000,21.198597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.335397,0.000000,21.211488>}
box{<0,0,-0.076200><0.012891,0.035000,0.076200> rotate<0,90.000000,0> translate<23.335397,0.000000,21.211488> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.335397,0.000000,21.198597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.684256,0.000000,21.198597>}
box{<0,0,-0.076200><0.348859,0.035000,0.076200> rotate<0,0.000000,0> translate<23.335397,0.000000,21.198597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.354056,0.000000,16.749000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.053797,0.000000,17.448741>}
box{<0,0,-0.076200><0.989583,0.035000,0.076200> rotate<0,-44.997030,0> translate<23.354056,0.000000,16.749000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.369056,0.000000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,0.000000,16.764000>}
box{<0,0,-0.076200><1.133019,0.035000,0.076200> rotate<0,0.000000,0> translate<23.369056,0.000000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.520559,-1.535000,26.938406>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.800625,-1.535000,26.822400>}
box{<0,0,-0.076200><0.303141,0.035000,0.076200> rotate<0,22.498388,0> translate<23.520559,-1.535000,26.938406> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.521456,0.000000,16.916400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,0.000000,16.916400>}
box{<0,0,-0.076200><0.980619,0.035000,0.076200> rotate<0,0.000000,0> translate<23.521456,0.000000,16.916400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.673856,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,0.000000,17.068800>}
box{<0,0,-0.076200><0.828219,0.035000,0.076200> rotate<0,0.000000,0> translate<23.673856,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.684256,0.000000,21.198597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.800856,0.000000,21.081997>}
box{<0,0,-0.076200><0.164897,0.035000,0.076200> rotate<0,44.997030,0> translate<23.684256,0.000000,21.198597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.699253,0.000000,21.183600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,0.000000,21.183600>}
box{<0,0,-0.076200><0.802822,0.035000,0.076200> rotate<0,0.000000,0> translate<23.699253,0.000000,21.183600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.800625,-1.535000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.103772,-1.535000,26.822400>}
box{<0,0,-0.076200><0.303147,0.035000,0.076200> rotate<0,0.000000,0> translate<23.800625,-1.535000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.800856,0.000000,21.081997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.053797,0.000000,20.829056>}
box{<0,0,-0.076200><0.357712,0.035000,0.076200> rotate<0,44.997030,0> translate<23.800856,0.000000,21.081997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.826256,0.000000,17.221200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,0.000000,17.221200>}
box{<0,0,-0.076200><0.675819,0.035000,0.076200> rotate<0,0.000000,0> translate<23.826256,0.000000,17.221200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.851653,0.000000,21.031200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,0.000000,21.031200>}
box{<0,0,-0.076200><0.650422,0.035000,0.076200> rotate<0,0.000000,0> translate<23.851653,0.000000,21.031200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.978656,0.000000,17.373600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,0.000000,17.373600>}
box{<0,0,-0.076200><0.523419,0.035000,0.076200> rotate<0,0.000000,0> translate<23.978656,0.000000,17.373600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.999088,0.000000,24.239600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.132997,0.000000,24.373509>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<23.999088,0.000000,24.239600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.999088,0.000000,25.696797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.132997,0.000000,25.562888>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<23.999088,0.000000,25.696797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.004053,0.000000,20.878800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,0.000000,20.878800>}
box{<0,0,-0.076200><0.498022,0.035000,0.076200> rotate<0,0.000000,0> translate<24.004053,0.000000,20.878800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.053797,0.000000,17.448741>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.053797,0.000000,20.829056>}
box{<0,0,-0.076200><3.380316,0.035000,0.076200> rotate<0,90.000000,0> translate<24.053797,0.000000,20.829056> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.053797,0.000000,17.526000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,0.000000,17.526000>}
box{<0,0,-0.076200><0.448278,0.035000,0.076200> rotate<0,0.000000,0> translate<24.053797,0.000000,17.526000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.053797,0.000000,17.678400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,0.000000,17.678400>}
box{<0,0,-0.076200><0.448278,0.035000,0.076200> rotate<0,0.000000,0> translate<24.053797,0.000000,17.678400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.053797,0.000000,17.830800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,0.000000,17.830800>}
box{<0,0,-0.076200><0.448278,0.035000,0.076200> rotate<0,0.000000,0> translate<24.053797,0.000000,17.830800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.053797,0.000000,17.983200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,0.000000,17.983200>}
box{<0,0,-0.076200><0.448278,0.035000,0.076200> rotate<0,0.000000,0> translate<24.053797,0.000000,17.983200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.053797,0.000000,18.135600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,0.000000,18.135600>}
box{<0,0,-0.076200><0.448278,0.035000,0.076200> rotate<0,0.000000,0> translate<24.053797,0.000000,18.135600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.053797,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,0.000000,18.288000>}
box{<0,0,-0.076200><0.448278,0.035000,0.076200> rotate<0,0.000000,0> translate<24.053797,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.053797,0.000000,18.440400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,0.000000,18.440400>}
box{<0,0,-0.076200><0.448278,0.035000,0.076200> rotate<0,0.000000,0> translate<24.053797,0.000000,18.440400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.053797,0.000000,18.592800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,0.000000,18.592800>}
box{<0,0,-0.076200><0.448278,0.035000,0.076200> rotate<0,0.000000,0> translate<24.053797,0.000000,18.592800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.053797,0.000000,18.745200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,0.000000,18.745200>}
box{<0,0,-0.076200><0.448278,0.035000,0.076200> rotate<0,0.000000,0> translate<24.053797,0.000000,18.745200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.053797,0.000000,18.897600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,0.000000,18.897600>}
box{<0,0,-0.076200><0.448278,0.035000,0.076200> rotate<0,0.000000,0> translate<24.053797,0.000000,18.897600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.053797,0.000000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,0.000000,19.050000>}
box{<0,0,-0.076200><0.448278,0.035000,0.076200> rotate<0,0.000000,0> translate<24.053797,0.000000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.053797,0.000000,19.202400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,0.000000,19.202400>}
box{<0,0,-0.076200><0.448278,0.035000,0.076200> rotate<0,0.000000,0> translate<24.053797,0.000000,19.202400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.053797,0.000000,19.354800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,0.000000,19.354800>}
box{<0,0,-0.076200><0.448278,0.035000,0.076200> rotate<0,0.000000,0> translate<24.053797,0.000000,19.354800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.053797,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,0.000000,19.507200>}
box{<0,0,-0.076200><0.448278,0.035000,0.076200> rotate<0,0.000000,0> translate<24.053797,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.053797,0.000000,19.659600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,0.000000,19.659600>}
box{<0,0,-0.076200><0.448278,0.035000,0.076200> rotate<0,0.000000,0> translate<24.053797,0.000000,19.659600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.053797,0.000000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,0.000000,19.812000>}
box{<0,0,-0.076200><0.448278,0.035000,0.076200> rotate<0,0.000000,0> translate<24.053797,0.000000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.053797,0.000000,19.964400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,0.000000,19.964400>}
box{<0,0,-0.076200><0.448278,0.035000,0.076200> rotate<0,0.000000,0> translate<24.053797,0.000000,19.964400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.053797,0.000000,20.116800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,0.000000,20.116800>}
box{<0,0,-0.076200><0.448278,0.035000,0.076200> rotate<0,0.000000,0> translate<24.053797,0.000000,20.116800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.053797,0.000000,20.269200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,0.000000,20.269200>}
box{<0,0,-0.076200><0.448278,0.035000,0.076200> rotate<0,0.000000,0> translate<24.053797,0.000000,20.269200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.053797,0.000000,20.421600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,0.000000,20.421600>}
box{<0,0,-0.076200><0.448278,0.035000,0.076200> rotate<0,0.000000,0> translate<24.053797,0.000000,20.421600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.053797,0.000000,20.574000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,0.000000,20.574000>}
box{<0,0,-0.076200><0.448278,0.035000,0.076200> rotate<0,0.000000,0> translate<24.053797,0.000000,20.574000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.053797,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,0.000000,20.726400>}
box{<0,0,-0.076200><0.448278,0.035000,0.076200> rotate<0,0.000000,0> translate<24.053797,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.092684,0.000000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,0.000000,25.603200>}
box{<0,0,-0.076200><0.409391,0.035000,0.076200> rotate<0,0.000000,0> translate<24.092684,0.000000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.103772,-1.535000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.383838,-1.535000,26.938406>}
box{<0,0,-0.076200><0.303141,0.035000,0.076200> rotate<0,-22.498388,0> translate<24.103772,-1.535000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.103772,-1.535000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,26.822400>}
box{<0,0,-0.076200><0.398303,0.035000,0.076200> rotate<0,0.000000,0> translate<24.103772,-1.535000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.132997,0.000000,24.373509>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.132997,0.000000,25.562888>}
box{<0,0,-0.076200><1.189378,0.035000,0.076200> rotate<0,90.000000,0> translate<24.132997,0.000000,25.562888> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.132997,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,0.000000,24.384000>}
box{<0,0,-0.076200><0.369078,0.035000,0.076200> rotate<0,0.000000,0> translate<24.132997,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.132997,0.000000,24.536400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,0.000000,24.536400>}
box{<0,0,-0.076200><0.369078,0.035000,0.076200> rotate<0,0.000000,0> translate<24.132997,0.000000,24.536400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.132997,0.000000,24.688800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,0.000000,24.688800>}
box{<0,0,-0.076200><0.369078,0.035000,0.076200> rotate<0,0.000000,0> translate<24.132997,0.000000,24.688800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.132997,0.000000,24.841200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,0.000000,24.841200>}
box{<0,0,-0.076200><0.369078,0.035000,0.076200> rotate<0,0.000000,0> translate<24.132997,0.000000,24.841200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.132997,0.000000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,0.000000,24.993600>}
box{<0,0,-0.076200><0.369078,0.035000,0.076200> rotate<0,0.000000,0> translate<24.132997,0.000000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.132997,0.000000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,0.000000,25.146000>}
box{<0,0,-0.076200><0.369078,0.035000,0.076200> rotate<0,0.000000,0> translate<24.132997,0.000000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.132997,0.000000,25.298400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,0.000000,25.298400>}
box{<0,0,-0.076200><0.369078,0.035000,0.076200> rotate<0,0.000000,0> translate<24.132997,0.000000,25.298400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.132997,0.000000,25.450800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,0.000000,25.450800>}
box{<0,0,-0.076200><0.369078,0.035000,0.076200> rotate<0,0.000000,0> translate<24.132997,0.000000,25.450800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.383838,-1.535000,26.938406>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,27.056647>}
box{<0,0,-0.076200><0.167215,0.035000,0.076200> rotate<0,-44.997787,0> translate<24.383838,-1.535000,26.938406> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.420228,-1.535000,26.974800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,26.974800>}
box{<0,0,-0.076200><0.081847,0.035000,0.076200> rotate<0,0.000000,0> translate<24.420228,-1.535000,26.974800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,0.000000,26.390600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,0.000000,15.778125>}
box{<0,0,-0.076200><10.612475,0.035000,0.076200> rotate<0,-90.000000,0> translate<24.502075,0.000000,15.778125> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,27.056647>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.502075,-1.535000,15.778125>}
box{<0,0,-0.076200><11.278522,0.035000,0.076200> rotate<0,-90.000000,0> translate<24.502075,-1.535000,15.778125> }
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
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.275319,-1.536000,17.999137>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.381241,-1.536000,17.893213>}
box{<0,0,-0.063500><0.149798,0.036000,0.063500> rotate<0,44.997875,0> translate<23.275319,-1.536000,17.999137> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.381241,-1.536000,17.893213>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.381241,-1.536000,17.681366>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,-90.000000,0> translate<23.381241,-1.536000,17.681366> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.381241,-1.536000,17.681366>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.275319,-1.536000,17.575444>}
box{<0,0,-0.063500><0.149796,0.036000,0.063500> rotate<0,-44.997030,0> translate<23.275319,-1.536000,17.575444> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.275319,-1.536000,17.575444>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.851622,-1.536000,17.575444>}
box{<0,0,-0.063500><0.423697,0.036000,0.063500> rotate<0,0.000000,0> translate<22.851622,-1.536000,17.575444> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.851622,-1.536000,17.575444>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.745700,-1.536000,17.681366>}
box{<0,0,-0.063500><0.149796,0.036000,0.063500> rotate<0,44.997030,0> translate<22.745700,-1.536000,17.681366> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.745700,-1.536000,17.681366>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.745700,-1.536000,17.893213>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,90.000000,0> translate<22.745700,-1.536000,17.893213> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.745700,-1.536000,17.893213>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.851622,-1.536000,17.999137>}
box{<0,0,-0.063500><0.149798,0.036000,0.063500> rotate<0,-44.997875,0> translate<22.745700,-1.536000,17.893213> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.381241,-1.536000,18.277081>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.275319,-1.536000,18.277081>}
box{<0,0,-0.063500><0.105922,0.036000,0.063500> rotate<0,0.000000,0> translate<23.275319,-1.536000,18.277081> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.275319,-1.536000,18.277081>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.063469,-1.536000,18.488928>}
box{<0,0,-0.063500><0.299599,0.036000,0.063500> rotate<0,44.996608,0> translate<23.063469,-1.536000,18.488928> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.063469,-1.536000,18.488928>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.275319,-1.536000,18.700775>}
box{<0,0,-0.063500><0.299599,0.036000,0.063500> rotate<0,-44.996608,0> translate<23.063469,-1.536000,18.488928> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.275319,-1.536000,18.700775>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.381241,-1.536000,18.700775>}
box{<0,0,-0.063500><0.105922,0.036000,0.063500> rotate<0,0.000000,0> translate<23.275319,-1.536000,18.700775> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.063469,-1.536000,18.488928>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.745700,-1.536000,18.488928>}
box{<0,0,-0.063500><0.317769,0.036000,0.063500> rotate<0,0.000000,0> translate<22.745700,-1.536000,18.488928> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.745700,-1.536000,18.978719>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.381241,-1.536000,18.978719>}
box{<0,0,-0.063500><0.635541,0.036000,0.063500> rotate<0,0.000000,0> translate<22.745700,-1.536000,18.978719> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.381241,-1.536000,18.978719>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.381241,-1.536000,19.296488>}
box{<0,0,-0.063500><0.317769,0.036000,0.063500> rotate<0,90.000000,0> translate<23.381241,-1.536000,19.296488> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.381241,-1.536000,19.296488>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.275319,-1.536000,19.402413>}
box{<0,0,-0.063500><0.149798,0.036000,0.063500> rotate<0,44.997875,0> translate<23.275319,-1.536000,19.402413> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.275319,-1.536000,19.402413>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.063469,-1.536000,19.402413>}
box{<0,0,-0.063500><0.211850,0.036000,0.063500> rotate<0,0.000000,0> translate<23.063469,-1.536000,19.402413> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.063469,-1.536000,19.402413>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.957547,-1.536000,19.296488>}
box{<0,0,-0.063500><0.149798,0.036000,0.063500> rotate<0,-44.997875,0> translate<22.957547,-1.536000,19.296488> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.957547,-1.536000,19.296488>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.957547,-1.536000,18.978719>}
box{<0,0,-0.063500><0.317769,0.036000,0.063500> rotate<0,-90.000000,0> translate<22.957547,-1.536000,18.978719> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.957547,-1.536000,19.190566>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.745700,-1.536000,19.402413>}
box{<0,0,-0.063500><0.299597,0.036000,0.063500> rotate<0,44.997030,0> translate<22.745700,-1.536000,19.402413> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.745700,-1.536000,19.680356>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.381241,-1.536000,19.680356>}
box{<0,0,-0.063500><0.635541,0.036000,0.063500> rotate<0,0.000000,0> translate<22.745700,-1.536000,19.680356> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.381241,-1.536000,19.680356>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.381241,-1.536000,20.104050>}
box{<0,0,-0.063500><0.423694,0.036000,0.063500> rotate<0,90.000000,0> translate<23.381241,-1.536000,20.104050> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.063469,-1.536000,19.680356>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.063469,-1.536000,19.892203>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,90.000000,0> translate<23.063469,-1.536000,19.892203> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.381241,-1.536000,20.805688>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.275319,-1.536000,20.593841>}
box{<0,0,-0.063500><0.236851,0.036000,0.063500> rotate<0,-63.431100,0> translate<23.275319,-1.536000,20.593841> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.275319,-1.536000,20.593841>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.063469,-1.536000,20.381994>}
box{<0,0,-0.063500><0.299599,0.036000,0.063500> rotate<0,-44.996608,0> translate<23.063469,-1.536000,20.381994> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.063469,-1.536000,20.381994>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.851622,-1.536000,20.381994>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,0.000000,0> translate<22.851622,-1.536000,20.381994> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.851622,-1.536000,20.381994>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.745700,-1.536000,20.487916>}
box{<0,0,-0.063500><0.149796,0.036000,0.063500> rotate<0,44.997030,0> translate<22.745700,-1.536000,20.487916> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.745700,-1.536000,20.487916>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.745700,-1.536000,20.699763>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,90.000000,0> translate<22.745700,-1.536000,20.699763> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.745700,-1.536000,20.699763>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.851622,-1.536000,20.805688>}
box{<0,0,-0.063500><0.149798,0.036000,0.063500> rotate<0,-44.997875,0> translate<22.745700,-1.536000,20.699763> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.851622,-1.536000,20.805688>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.957547,-1.536000,20.805688>}
box{<0,0,-0.063500><0.105925,0.036000,0.063500> rotate<0,0.000000,0> translate<22.851622,-1.536000,20.805688> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.957547,-1.536000,20.805688>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.063469,-1.536000,20.699763>}
box{<0,0,-0.063500><0.149798,0.036000,0.063500> rotate<0,44.997875,0> translate<22.957547,-1.536000,20.805688> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.063469,-1.536000,20.699763>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.063469,-1.536000,20.381994>}
box{<0,0,-0.063500><0.317769,0.036000,0.063500> rotate<0,-90.000000,0> translate<23.063469,-1.536000,20.381994> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.851622,-1.536000,21.083631>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.745700,-1.536000,21.189553>}
box{<0,0,-0.063500><0.149796,0.036000,0.063500> rotate<0,44.997030,0> translate<22.745700,-1.536000,21.189553> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.745700,-1.536000,21.189553>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.745700,-1.536000,21.401400>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,90.000000,0> translate<22.745700,-1.536000,21.401400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.745700,-1.536000,21.401400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.851622,-1.536000,21.507325>}
box{<0,0,-0.063500><0.149798,0.036000,0.063500> rotate<0,-44.997875,0> translate<22.745700,-1.536000,21.401400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.851622,-1.536000,21.507325>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.275319,-1.536000,21.507325>}
box{<0,0,-0.063500><0.423697,0.036000,0.063500> rotate<0,0.000000,0> translate<22.851622,-1.536000,21.507325> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.275319,-1.536000,21.507325>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.381241,-1.536000,21.401400>}
box{<0,0,-0.063500><0.149798,0.036000,0.063500> rotate<0,44.997875,0> translate<23.275319,-1.536000,21.507325> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.381241,-1.536000,21.401400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.381241,-1.536000,21.189553>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,-90.000000,0> translate<23.381241,-1.536000,21.189553> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.381241,-1.536000,21.189553>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.275319,-1.536000,21.083631>}
box{<0,0,-0.063500><0.149796,0.036000,0.063500> rotate<0,-44.997030,0> translate<23.275319,-1.536000,21.083631> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.275319,-1.536000,21.083631>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.169394,-1.536000,21.083631>}
box{<0,0,-0.063500><0.105925,0.036000,0.063500> rotate<0,0.000000,0> translate<23.169394,-1.536000,21.083631> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.169394,-1.536000,21.083631>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.063469,-1.536000,21.189553>}
box{<0,0,-0.063500><0.149798,0.036000,0.063500> rotate<0,44.996185,0> translate<23.063469,-1.536000,21.189553> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.063469,-1.536000,21.189553>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.063469,-1.536000,21.507325>}
box{<0,0,-0.063500><0.317772,0.036000,0.063500> rotate<0,90.000000,0> translate<23.063469,-1.536000,21.507325> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.275319,-1.536000,21.785269>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.381241,-1.536000,21.891191>}
box{<0,0,-0.063500><0.149796,0.036000,0.063500> rotate<0,-44.997030,0> translate<23.275319,-1.536000,21.785269> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.381241,-1.536000,21.891191>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.381241,-1.536000,22.103038>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,90.000000,0> translate<23.381241,-1.536000,22.103038> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.381241,-1.536000,22.103038>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.275319,-1.536000,22.208963>}
box{<0,0,-0.063500><0.149798,0.036000,0.063500> rotate<0,44.997875,0> translate<23.275319,-1.536000,22.208963> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.275319,-1.536000,22.208963>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.169394,-1.536000,22.208963>}
box{<0,0,-0.063500><0.105925,0.036000,0.063500> rotate<0,0.000000,0> translate<23.169394,-1.536000,22.208963> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.169394,-1.536000,22.208963>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.063469,-1.536000,22.103038>}
box{<0,0,-0.063500><0.149801,0.036000,0.063500> rotate<0,-44.997030,0> translate<23.063469,-1.536000,22.103038> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.063469,-1.536000,22.103038>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.063469,-1.536000,21.997116>}
box{<0,0,-0.063500><0.105922,0.036000,0.063500> rotate<0,-90.000000,0> translate<23.063469,-1.536000,21.997116> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.063469,-1.536000,22.103038>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.957547,-1.536000,22.208963>}
box{<0,0,-0.063500><0.149798,0.036000,0.063500> rotate<0,44.997875,0> translate<22.957547,-1.536000,22.208963> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.957547,-1.536000,22.208963>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.851622,-1.536000,22.208963>}
box{<0,0,-0.063500><0.105925,0.036000,0.063500> rotate<0,0.000000,0> translate<22.851622,-1.536000,22.208963> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.851622,-1.536000,22.208963>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.745700,-1.536000,22.103038>}
box{<0,0,-0.063500><0.149798,0.036000,0.063500> rotate<0,-44.997875,0> translate<22.745700,-1.536000,22.103038> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.745700,-1.536000,22.103038>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.745700,-1.536000,21.891191>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,-90.000000,0> translate<22.745700,-1.536000,21.891191> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.745700,-1.536000,21.891191>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.851622,-1.536000,21.785269>}
box{<0,0,-0.063500><0.149796,0.036000,0.063500> rotate<0,44.997030,0> translate<22.745700,-1.536000,21.891191> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.381241,-1.536000,22.910600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.275319,-1.536000,22.698753>}
box{<0,0,-0.063500><0.236851,0.036000,0.063500> rotate<0,-63.431100,0> translate<23.275319,-1.536000,22.698753> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.275319,-1.536000,22.698753>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.063469,-1.536000,22.486906>}
box{<0,0,-0.063500><0.299599,0.036000,0.063500> rotate<0,-44.996608,0> translate<23.063469,-1.536000,22.486906> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.063469,-1.536000,22.486906>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.851622,-1.536000,22.486906>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,0.000000,0> translate<22.851622,-1.536000,22.486906> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.851622,-1.536000,22.486906>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.745700,-1.536000,22.592828>}
box{<0,0,-0.063500><0.149796,0.036000,0.063500> rotate<0,44.997030,0> translate<22.745700,-1.536000,22.592828> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.745700,-1.536000,22.592828>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.745700,-1.536000,22.804675>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,90.000000,0> translate<22.745700,-1.536000,22.804675> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.745700,-1.536000,22.804675>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.851622,-1.536000,22.910600>}
box{<0,0,-0.063500><0.149798,0.036000,0.063500> rotate<0,-44.997875,0> translate<22.745700,-1.536000,22.804675> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.851622,-1.536000,22.910600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.957547,-1.536000,22.910600>}
box{<0,0,-0.063500><0.105925,0.036000,0.063500> rotate<0,0.000000,0> translate<22.851622,-1.536000,22.910600> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.957547,-1.536000,22.910600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.063469,-1.536000,22.804675>}
box{<0,0,-0.063500><0.149798,0.036000,0.063500> rotate<0,44.997875,0> translate<22.957547,-1.536000,22.910600> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.063469,-1.536000,22.804675>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.063469,-1.536000,22.486906>}
box{<0,0,-0.063500><0.317769,0.036000,0.063500> rotate<0,-90.000000,0> translate<23.063469,-1.536000,22.486906> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.063469,-1.536000,23.188544>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.063469,-1.536000,23.612238>}
box{<0,0,-0.063500><0.423694,0.036000,0.063500> rotate<0,90.000000,0> translate<23.063469,-1.536000,23.612238> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.745700,-1.536000,23.890181>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.381241,-1.536000,23.890181>}
box{<0,0,-0.063500><0.635541,0.036000,0.063500> rotate<0,0.000000,0> translate<22.745700,-1.536000,23.890181> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.381241,-1.536000,23.890181>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.381241,-1.536000,24.207950>}
box{<0,0,-0.063500><0.317769,0.036000,0.063500> rotate<0,90.000000,0> translate<23.381241,-1.536000,24.207950> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.381241,-1.536000,24.207950>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.275319,-1.536000,24.313875>}
box{<0,0,-0.063500><0.149798,0.036000,0.063500> rotate<0,44.997875,0> translate<23.275319,-1.536000,24.313875> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.275319,-1.536000,24.313875>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.169394,-1.536000,24.313875>}
box{<0,0,-0.063500><0.105925,0.036000,0.063500> rotate<0,0.000000,0> translate<23.169394,-1.536000,24.313875> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.169394,-1.536000,24.313875>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.063469,-1.536000,24.207950>}
box{<0,0,-0.063500><0.149801,0.036000,0.063500> rotate<0,-44.997030,0> translate<23.063469,-1.536000,24.207950> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.063469,-1.536000,24.207950>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.957547,-1.536000,24.313875>}
box{<0,0,-0.063500><0.149798,0.036000,0.063500> rotate<0,44.997875,0> translate<22.957547,-1.536000,24.313875> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.957547,-1.536000,24.313875>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.851622,-1.536000,24.313875>}
box{<0,0,-0.063500><0.105925,0.036000,0.063500> rotate<0,0.000000,0> translate<22.851622,-1.536000,24.313875> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.851622,-1.536000,24.313875>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.745700,-1.536000,24.207950>}
box{<0,0,-0.063500><0.149798,0.036000,0.063500> rotate<0,-44.997875,0> translate<22.745700,-1.536000,24.207950> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.745700,-1.536000,24.207950>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.745700,-1.536000,23.890181>}
box{<0,0,-0.063500><0.317769,0.036000,0.063500> rotate<0,-90.000000,0> translate<22.745700,-1.536000,23.890181> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.063469,-1.536000,23.890181>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.063469,-1.536000,24.207950>}
box{<0,0,-0.063500><0.317769,0.036000,0.063500> rotate<0,90.000000,0> translate<23.063469,-1.536000,24.207950> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.745700,-1.536000,24.697741>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.745700,-1.536000,24.909588>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,90.000000,0> translate<22.745700,-1.536000,24.909588> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.745700,-1.536000,24.909588>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.851622,-1.536000,25.015512>}
box{<0,0,-0.063500><0.149798,0.036000,0.063500> rotate<0,-44.997875,0> translate<22.745700,-1.536000,24.909588> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.851622,-1.536000,25.015512>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.063469,-1.536000,25.015512>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,0.000000,0> translate<22.851622,-1.536000,25.015512> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.063469,-1.536000,25.015512>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.169394,-1.536000,24.909588>}
box{<0,0,-0.063500><0.149801,0.036000,0.063500> rotate<0,44.997030,0> translate<23.063469,-1.536000,25.015512> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.169394,-1.536000,24.909588>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.169394,-1.536000,24.697741>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,-90.000000,0> translate<23.169394,-1.536000,24.697741> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.169394,-1.536000,24.697741>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.063469,-1.536000,24.591819>}
box{<0,0,-0.063500><0.149798,0.036000,0.063500> rotate<0,-44.996185,0> translate<23.063469,-1.536000,24.591819> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.063469,-1.536000,24.591819>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.851622,-1.536000,24.591819>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,0.000000,0> translate<22.851622,-1.536000,24.591819> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.851622,-1.536000,24.591819>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.745700,-1.536000,24.697741>}
box{<0,0,-0.063500><0.149796,0.036000,0.063500> rotate<0,44.997030,0> translate<22.745700,-1.536000,24.697741> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.745700,-1.536000,25.293456>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.381241,-1.536000,25.293456>}
box{<0,0,-0.063500><0.635541,0.036000,0.063500> rotate<0,0.000000,0> translate<22.745700,-1.536000,25.293456> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.381241,-1.536000,25.293456>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.381241,-1.536000,25.611225>}
box{<0,0,-0.063500><0.317769,0.036000,0.063500> rotate<0,90.000000,0> translate<23.381241,-1.536000,25.611225> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.381241,-1.536000,25.611225>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.275319,-1.536000,25.717150>}
box{<0,0,-0.063500><0.149798,0.036000,0.063500> rotate<0,44.997875,0> translate<23.275319,-1.536000,25.717150> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.275319,-1.536000,25.717150>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.169394,-1.536000,25.717150>}
box{<0,0,-0.063500><0.105925,0.036000,0.063500> rotate<0,0.000000,0> translate<23.169394,-1.536000,25.717150> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.169394,-1.536000,25.717150>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.063469,-1.536000,25.611225>}
box{<0,0,-0.063500><0.149801,0.036000,0.063500> rotate<0,-44.997030,0> translate<23.063469,-1.536000,25.611225> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.063469,-1.536000,25.611225>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.957547,-1.536000,25.717150>}
box{<0,0,-0.063500><0.149798,0.036000,0.063500> rotate<0,44.997875,0> translate<22.957547,-1.536000,25.717150> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.957547,-1.536000,25.717150>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.851622,-1.536000,25.717150>}
box{<0,0,-0.063500><0.105925,0.036000,0.063500> rotate<0,0.000000,0> translate<22.851622,-1.536000,25.717150> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.851622,-1.536000,25.717150>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.745700,-1.536000,25.611225>}
box{<0,0,-0.063500><0.149798,0.036000,0.063500> rotate<0,-44.997875,0> translate<22.745700,-1.536000,25.611225> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.745700,-1.536000,25.611225>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.745700,-1.536000,25.293456>}
box{<0,0,-0.063500><0.317769,0.036000,0.063500> rotate<0,-90.000000,0> translate<22.745700,-1.536000,25.293456> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.063469,-1.536000,25.293456>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.063469,-1.536000,25.611225>}
box{<0,0,-0.063500><0.317769,0.036000,0.063500> rotate<0,90.000000,0> translate<23.063469,-1.536000,25.611225> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.026394,-1.536000,20.908231>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.602700,-1.536000,21.120078>}
box{<0,0,-0.063500><0.473704,0.036000,0.063500> rotate<0,26.563298,0> translate<21.602700,-1.536000,21.120078> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.602700,-1.536000,21.120078>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.026394,-1.536000,21.331925>}
box{<0,0,-0.063500><0.473704,0.036000,0.063500> rotate<0,-26.563298,0> translate<21.602700,-1.536000,21.120078> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.708622,-1.536000,21.609869>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.132319,-1.536000,21.609869>}
box{<0,0,-0.063500><0.423697,0.036000,0.063500> rotate<0,0.000000,0> translate<21.708622,-1.536000,21.609869> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.132319,-1.536000,21.609869>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.238241,-1.536000,21.715791>}
box{<0,0,-0.063500><0.149796,0.036000,0.063500> rotate<0,-44.997030,0> translate<22.132319,-1.536000,21.609869> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.238241,-1.536000,21.715791>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.238241,-1.536000,21.927637>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,90.000000,0> translate<22.238241,-1.536000,21.927637> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.238241,-1.536000,21.927637>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.132319,-1.536000,22.033563>}
box{<0,0,-0.063500><0.149798,0.036000,0.063500> rotate<0,44.997875,0> translate<22.132319,-1.536000,22.033563> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.132319,-1.536000,22.033563>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.708622,-1.536000,22.033563>}
box{<0,0,-0.063500><0.423697,0.036000,0.063500> rotate<0,0.000000,0> translate<21.708622,-1.536000,22.033563> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.708622,-1.536000,22.033563>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.602700,-1.536000,21.927637>}
box{<0,0,-0.063500><0.149798,0.036000,0.063500> rotate<0,-44.997875,0> translate<21.602700,-1.536000,21.927637> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.602700,-1.536000,21.927637>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.602700,-1.536000,21.715791>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,-90.000000,0> translate<21.602700,-1.536000,21.715791> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.602700,-1.536000,21.715791>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.708622,-1.536000,21.609869>}
box{<0,0,-0.063500><0.149796,0.036000,0.063500> rotate<0,44.997030,0> translate<21.602700,-1.536000,21.715791> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.708622,-1.536000,21.609869>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.132319,-1.536000,22.033563>}
box{<0,0,-0.063500><0.599196,0.036000,0.063500> rotate<0,-44.996819,0> translate<21.708622,-1.536000,21.609869> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.602700,-1.536000,22.311506>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.708622,-1.536000,22.311506>}
box{<0,0,-0.063500><0.105922,0.036000,0.063500> rotate<0,0.000000,0> translate<21.602700,-1.536000,22.311506> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.708622,-1.536000,22.311506>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.708622,-1.536000,22.417428>}
box{<0,0,-0.063500><0.105922,0.036000,0.063500> rotate<0,90.000000,0> translate<21.708622,-1.536000,22.417428> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.708622,-1.536000,22.417428>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.602700,-1.536000,22.417428>}
box{<0,0,-0.063500><0.105922,0.036000,0.063500> rotate<0,0.000000,0> translate<21.602700,-1.536000,22.417428> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.602700,-1.536000,22.417428>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.602700,-1.536000,22.311506>}
box{<0,0,-0.063500><0.105922,0.036000,0.063500> rotate<0,-90.000000,0> translate<21.602700,-1.536000,22.311506> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.026394,-1.536000,22.662325>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.238241,-1.536000,22.874172>}
box{<0,0,-0.063500><0.299597,0.036000,0.063500> rotate<0,-44.997030,0> translate<22.026394,-1.536000,22.662325> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.238241,-1.536000,22.874172>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.602700,-1.536000,22.874172>}
box{<0,0,-0.063500><0.635541,0.036000,0.063500> rotate<0,0.000000,0> translate<21.602700,-1.536000,22.874172> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.602700,-1.536000,22.662325>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.602700,-1.536000,23.086019>}
box{<0,0,-0.063500><0.423694,0.036000,0.063500> rotate<0,90.000000,0> translate<21.602700,-1.536000,23.086019> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.883394,-1.536000,18.335553>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.095241,-1.536000,18.547400>}
box{<0,0,-0.063500><0.299597,0.036000,0.063500> rotate<0,-44.997030,0> translate<20.883394,-1.536000,18.335553> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.095241,-1.536000,18.547400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.459700,-1.536000,18.547400>}
box{<0,0,-0.063500><0.635541,0.036000,0.063500> rotate<0,0.000000,0> translate<20.459700,-1.536000,18.547400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.459700,-1.536000,18.335553>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.459700,-1.536000,18.759247>}
box{<0,0,-0.063500><0.423694,0.036000,0.063500> rotate<0,90.000000,0> translate<20.459700,-1.536000,18.759247> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.989319,-1.536000,19.037191>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.095241,-1.536000,19.143113>}
box{<0,0,-0.063500><0.149796,0.036000,0.063500> rotate<0,-44.997030,0> translate<20.989319,-1.536000,19.037191> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.095241,-1.536000,19.143113>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.095241,-1.536000,19.354959>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,90.000000,0> translate<21.095241,-1.536000,19.354959> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.095241,-1.536000,19.354959>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.989319,-1.536000,19.460884>}
box{<0,0,-0.063500><0.149798,0.036000,0.063500> rotate<0,44.997875,0> translate<20.989319,-1.536000,19.460884> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.989319,-1.536000,19.460884>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.883394,-1.536000,19.460884>}
box{<0,0,-0.063500><0.105925,0.036000,0.063500> rotate<0,0.000000,0> translate<20.883394,-1.536000,19.460884> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.883394,-1.536000,19.460884>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.777469,-1.536000,19.354959>}
box{<0,0,-0.063500><0.149801,0.036000,0.063500> rotate<0,-44.997030,0> translate<20.777469,-1.536000,19.354959> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.777469,-1.536000,19.354959>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.671547,-1.536000,19.460884>}
box{<0,0,-0.063500><0.149798,0.036000,0.063500> rotate<0,44.997875,0> translate<20.671547,-1.536000,19.460884> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.671547,-1.536000,19.460884>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.565622,-1.536000,19.460884>}
box{<0,0,-0.063500><0.105925,0.036000,0.063500> rotate<0,0.000000,0> translate<20.565622,-1.536000,19.460884> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.565622,-1.536000,19.460884>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.459700,-1.536000,19.354959>}
box{<0,0,-0.063500><0.149798,0.036000,0.063500> rotate<0,-44.997875,0> translate<20.459700,-1.536000,19.354959> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.459700,-1.536000,19.354959>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.459700,-1.536000,19.143113>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,-90.000000,0> translate<20.459700,-1.536000,19.143113> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.459700,-1.536000,19.143113>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.565622,-1.536000,19.037191>}
box{<0,0,-0.063500><0.149796,0.036000,0.063500> rotate<0,44.997030,0> translate<20.459700,-1.536000,19.143113> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.565622,-1.536000,19.037191>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.671547,-1.536000,19.037191>}
box{<0,0,-0.063500><0.105925,0.036000,0.063500> rotate<0,0.000000,0> translate<20.565622,-1.536000,19.037191> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.671547,-1.536000,19.037191>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.777469,-1.536000,19.143113>}
box{<0,0,-0.063500><0.149796,0.036000,0.063500> rotate<0,-44.997030,0> translate<20.671547,-1.536000,19.037191> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.777469,-1.536000,19.143113>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.883394,-1.536000,19.037191>}
box{<0,0,-0.063500><0.149798,0.036000,0.063500> rotate<0,44.996185,0> translate<20.777469,-1.536000,19.143113> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.883394,-1.536000,19.037191>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.989319,-1.536000,19.037191>}
box{<0,0,-0.063500><0.105925,0.036000,0.063500> rotate<0,0.000000,0> translate<20.883394,-1.536000,19.037191> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.777469,-1.536000,19.143113>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.777469,-1.536000,19.354959>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,90.000000,0> translate<20.777469,-1.536000,19.354959> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.459700,-1.536000,20.440466>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.883394,-1.536000,20.440466>}
box{<0,0,-0.063500><0.423694,0.036000,0.063500> rotate<0,0.000000,0> translate<20.459700,-1.536000,20.440466> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.883394,-1.536000,20.440466>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.095241,-1.536000,20.652313>}
box{<0,0,-0.063500><0.299597,0.036000,0.063500> rotate<0,-44.997030,0> translate<20.883394,-1.536000,20.440466> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.095241,-1.536000,20.652313>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.883394,-1.536000,20.864159>}
box{<0,0,-0.063500><0.299597,0.036000,0.063500> rotate<0,44.997030,0> translate<20.883394,-1.536000,20.864159> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.883394,-1.536000,20.864159>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.459700,-1.536000,20.864159>}
box{<0,0,-0.063500><0.423694,0.036000,0.063500> rotate<0,0.000000,0> translate<20.459700,-1.536000,20.864159> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.777469,-1.536000,20.440466>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.777469,-1.536000,20.864159>}
box{<0,0,-0.063500><0.423694,0.036000,0.063500> rotate<0,90.000000,0> translate<20.777469,-1.536000,20.864159> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.247853,-1.536000,21.142103>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.883394,-1.536000,21.142103>}
box{<0,0,-0.063500><0.635541,0.036000,0.063500> rotate<0,0.000000,0> translate<20.247853,-1.536000,21.142103> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.883394,-1.536000,21.142103>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.883394,-1.536000,21.459872>}
box{<0,0,-0.063500><0.317769,0.036000,0.063500> rotate<0,90.000000,0> translate<20.883394,-1.536000,21.459872> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.883394,-1.536000,21.459872>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.777469,-1.536000,21.565797>}
box{<0,0,-0.063500><0.149801,0.036000,0.063500> rotate<0,44.997030,0> translate<20.777469,-1.536000,21.565797> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.777469,-1.536000,21.565797>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.565622,-1.536000,21.565797>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,0.000000,0> translate<20.565622,-1.536000,21.565797> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.565622,-1.536000,21.565797>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.459700,-1.536000,21.459872>}
box{<0,0,-0.063500><0.149798,0.036000,0.063500> rotate<0,-44.997875,0> translate<20.459700,-1.536000,21.459872> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.459700,-1.536000,21.459872>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.459700,-1.536000,21.142103>}
box{<0,0,-0.063500><0.317769,0.036000,0.063500> rotate<0,-90.000000,0> translate<20.459700,-1.536000,21.142103> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.459700,-1.536000,21.843741>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.883394,-1.536000,21.843741>}
box{<0,0,-0.063500><0.423694,0.036000,0.063500> rotate<0,0.000000,0> translate<20.459700,-1.536000,21.843741> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.671547,-1.536000,21.843741>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.883394,-1.536000,22.055588>}
box{<0,0,-0.063500><0.299597,0.036000,0.063500> rotate<0,-44.997030,0> translate<20.671547,-1.536000,21.843741> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.883394,-1.536000,22.055588>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.883394,-1.536000,22.161509>}
box{<0,0,-0.063500><0.105922,0.036000,0.063500> rotate<0,90.000000,0> translate<20.883394,-1.536000,22.161509> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.459700,-1.536000,23.553769>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.459700,-1.536000,23.130075>}
box{<0,0,-0.063500><0.423694,0.036000,0.063500> rotate<0,-90.000000,0> translate<20.459700,-1.536000,23.130075> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.459700,-1.536000,23.130075>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.883394,-1.536000,23.553769>}
box{<0,0,-0.063500><0.599193,0.036000,0.063500> rotate<0,-44.997030,0> translate<20.459700,-1.536000,23.130075> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.883394,-1.536000,23.553769>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.989319,-1.536000,23.553769>}
box{<0,0,-0.063500><0.105925,0.036000,0.063500> rotate<0,0.000000,0> translate<20.883394,-1.536000,23.553769> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.989319,-1.536000,23.553769>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.095241,-1.536000,23.447844>}
box{<0,0,-0.063500><0.149798,0.036000,0.063500> rotate<0,44.997875,0> translate<20.989319,-1.536000,23.553769> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.095241,-1.536000,23.447844>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.095241,-1.536000,23.235997>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,-90.000000,0> translate<21.095241,-1.536000,23.235997> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.095241,-1.536000,23.235997>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.989319,-1.536000,23.130075>}
box{<0,0,-0.063500><0.149796,0.036000,0.063500> rotate<0,-44.997030,0> translate<20.989319,-1.536000,23.130075> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.565622,-1.536000,23.831713>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.989319,-1.536000,23.831713>}
box{<0,0,-0.063500><0.423697,0.036000,0.063500> rotate<0,0.000000,0> translate<20.565622,-1.536000,23.831713> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.989319,-1.536000,23.831713>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.095241,-1.536000,23.937634>}
box{<0,0,-0.063500><0.149796,0.036000,0.063500> rotate<0,-44.997030,0> translate<20.989319,-1.536000,23.831713> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.095241,-1.536000,23.937634>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.095241,-1.536000,24.149481>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,90.000000,0> translate<21.095241,-1.536000,24.149481> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.095241,-1.536000,24.149481>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.989319,-1.536000,24.255406>}
box{<0,0,-0.063500><0.149798,0.036000,0.063500> rotate<0,44.997875,0> translate<20.989319,-1.536000,24.255406> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.989319,-1.536000,24.255406>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.565622,-1.536000,24.255406>}
box{<0,0,-0.063500><0.423697,0.036000,0.063500> rotate<0,0.000000,0> translate<20.565622,-1.536000,24.255406> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.565622,-1.536000,24.255406>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.459700,-1.536000,24.149481>}
box{<0,0,-0.063500><0.149798,0.036000,0.063500> rotate<0,-44.997875,0> translate<20.459700,-1.536000,24.149481> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.459700,-1.536000,24.149481>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.459700,-1.536000,23.937634>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,-90.000000,0> translate<20.459700,-1.536000,23.937634> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.459700,-1.536000,23.937634>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.565622,-1.536000,23.831713>}
box{<0,0,-0.063500><0.149796,0.036000,0.063500> rotate<0,44.997030,0> translate<20.459700,-1.536000,23.937634> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.565622,-1.536000,23.831713>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.989319,-1.536000,24.255406>}
box{<0,0,-0.063500><0.599196,0.036000,0.063500> rotate<0,-44.996819,0> translate<20.565622,-1.536000,23.831713> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.883394,-1.536000,24.533350>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.095241,-1.536000,24.745197>}
box{<0,0,-0.063500><0.299597,0.036000,0.063500> rotate<0,-44.997030,0> translate<20.883394,-1.536000,24.533350> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.095241,-1.536000,24.745197>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.459700,-1.536000,24.745197>}
box{<0,0,-0.063500><0.635541,0.036000,0.063500> rotate<0,0.000000,0> translate<20.459700,-1.536000,24.745197> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.459700,-1.536000,24.533350>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.459700,-1.536000,24.957044>}
box{<0,0,-0.063500><0.423694,0.036000,0.063500> rotate<0,90.000000,0> translate<20.459700,-1.536000,24.957044> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.989319,-1.536000,25.234988>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.095241,-1.536000,25.340909>}
box{<0,0,-0.063500><0.149796,0.036000,0.063500> rotate<0,-44.997030,0> translate<20.989319,-1.536000,25.234988> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.095241,-1.536000,25.340909>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.095241,-1.536000,25.552756>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,90.000000,0> translate<21.095241,-1.536000,25.552756> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.095241,-1.536000,25.552756>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.989319,-1.536000,25.658681>}
box{<0,0,-0.063500><0.149798,0.036000,0.063500> rotate<0,44.997875,0> translate<20.989319,-1.536000,25.658681> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.989319,-1.536000,25.658681>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.883394,-1.536000,25.658681>}
box{<0,0,-0.063500><0.105925,0.036000,0.063500> rotate<0,0.000000,0> translate<20.883394,-1.536000,25.658681> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.883394,-1.536000,25.658681>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.777469,-1.536000,25.552756>}
box{<0,0,-0.063500><0.149801,0.036000,0.063500> rotate<0,-44.997030,0> translate<20.777469,-1.536000,25.552756> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.777469,-1.536000,25.552756>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.777469,-1.536000,25.446834>}
box{<0,0,-0.063500><0.105922,0.036000,0.063500> rotate<0,-90.000000,0> translate<20.777469,-1.536000,25.446834> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.777469,-1.536000,25.552756>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.671547,-1.536000,25.658681>}
box{<0,0,-0.063500><0.149798,0.036000,0.063500> rotate<0,44.997875,0> translate<20.671547,-1.536000,25.658681> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.671547,-1.536000,25.658681>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.565622,-1.536000,25.658681>}
box{<0,0,-0.063500><0.105925,0.036000,0.063500> rotate<0,0.000000,0> translate<20.565622,-1.536000,25.658681> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.565622,-1.536000,25.658681>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.459700,-1.536000,25.552756>}
box{<0,0,-0.063500><0.149798,0.036000,0.063500> rotate<0,-44.997875,0> translate<20.459700,-1.536000,25.552756> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.459700,-1.536000,25.552756>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.459700,-1.536000,25.340909>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,-90.000000,0> translate<20.459700,-1.536000,25.340909> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.459700,-1.536000,25.340909>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.565622,-1.536000,25.234988>}
box{<0,0,-0.063500><0.149796,0.036000,0.063500> rotate<0,44.997030,0> translate<20.459700,-1.536000,25.340909> }
//C1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.340600,0.000000,26.425000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.340600,0.000000,26.915000>}
box{<0,0,-0.076200><0.490000,0.036000,0.076200> rotate<0,90.000000,0> translate<21.340600,0.000000,26.915000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.788600,0.000000,26.915000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.788600,0.000000,26.425000>}
box{<0,0,-0.076200><0.490000,0.036000,0.076200> rotate<0,-90.000000,0> translate<21.788600,0.000000,26.425000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<21.534100,0.000000,26.670000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<21.595100,0.000000,26.670000>}
box{<0,0,-0.203200><0.061000,0.036000,0.203200> rotate<0,0.000000,0> translate<21.534100,0.000000,26.670000> }
box{<-0.150000,0,-0.299950><0.150000,0.036000,0.299950> rotate<0,-90.000000,0> translate<21.569450,0.000000,26.266000>}
box{<-0.150000,0,-0.299950><0.150000,0.036000,0.299950> rotate<0,-90.000000,0> translate<21.569450,0.000000,27.078800>}
//C3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.050400,0.000000,25.887200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.560400,0.000000,25.887200>}
box{<0,0,-0.076200><0.490000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.560400,0.000000,25.887200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.560400,0.000000,26.335200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.050400,0.000000,26.335200>}
box{<0,0,-0.076200><0.490000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.560400,0.000000,26.335200> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<17.805400,0.000000,26.080700>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<17.805400,0.000000,26.141700>}
box{<0,0,-0.203200><0.061000,0.036000,0.203200> rotate<0,90.000000,0> translate<17.805400,0.000000,26.141700> }
box{<-0.150000,0,-0.299950><0.150000,0.036000,0.299950> rotate<0,-180.000000,0> translate<18.209400,0.000000,26.116050>}
box{<-0.150000,0,-0.299950><0.150000,0.036000,0.299950> rotate<0,-180.000000,0> translate<17.396600,0.000000,26.116050>}
//C4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.184000,0.000000,27.182600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.694000,0.000000,27.182600>}
box{<0,0,-0.076200><0.490000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.694000,0.000000,27.182600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.694000,0.000000,27.630600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.184000,0.000000,27.630600>}
box{<0,0,-0.076200><0.490000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.694000,0.000000,27.630600> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<19.939000,0.000000,27.376100>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<19.939000,0.000000,27.437100>}
box{<0,0,-0.203200><0.061000,0.036000,0.203200> rotate<0,90.000000,0> translate<19.939000,0.000000,27.437100> }
box{<-0.150000,0,-0.299950><0.150000,0.036000,0.299950> rotate<0,-180.000000,0> translate<20.343000,0.000000,27.411450>}
box{<-0.150000,0,-0.299950><0.150000,0.036000,0.299950> rotate<0,-180.000000,0> translate<19.530200,0.000000,27.411450>}
//C5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.535000,0.000000,16.530800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.025000,0.000000,16.530800>}
box{<0,0,-0.076200><0.490000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.535000,0.000000,16.530800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.025000,0.000000,16.082800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.535000,0.000000,16.082800>}
box{<0,0,-0.076200><0.490000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.535000,0.000000,16.082800> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<17.780000,0.000000,16.337300>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<17.780000,0.000000,16.276300>}
box{<0,0,-0.203200><0.061000,0.036000,0.203200> rotate<0,-90.000000,0> translate<17.780000,0.000000,16.276300> }
box{<-0.150000,0,-0.299950><0.150000,0.036000,0.299950> rotate<0,-0.000000,0> translate<17.376000,0.000000,16.301950>}
box{<-0.150000,0,-0.299950><0.150000,0.036000,0.299950> rotate<0,-0.000000,0> translate<18.188800,0.000000,16.301950>}
cylinder{<0,0,0><0,0.036000,0>0.012700 translate<19.875231,0.000000,16.218116>}
cylinder{<0,0,0><0,0.036000,0>0.012700 translate<19.811675,0.000000,16.154563>}
box{<0,0,-0.012700><0.089880,0.036000,0.012700> rotate<0,-44.995622,0> translate<19.811675,0.000000,16.154563> }
cylinder{<0,0,0><0,0.036000,0>0.012700 translate<19.811675,0.000000,16.154563>}
cylinder{<0,0,0><0,0.036000,0>0.012700 translate<19.811675,0.000000,16.027453>}
box{<0,0,-0.012700><0.127109,0.036000,0.012700> rotate<0,-90.000000,0> translate<19.811675,0.000000,16.027453> }
cylinder{<0,0,0><0,0.036000,0>0.012700 translate<19.811675,0.000000,16.027453>}
cylinder{<0,0,0><0,0.036000,0>0.012700 translate<19.875231,0.000000,15.963900>}
box{<0,0,-0.012700><0.089880,0.036000,0.012700> rotate<0,44.995622,0> translate<19.811675,0.000000,16.027453> }
cylinder{<0,0,0><0,0.036000,0>0.012700 translate<19.875231,0.000000,15.963900>}
cylinder{<0,0,0><0,0.036000,0>0.012700 translate<20.129447,0.000000,15.963900>}
box{<0,0,-0.012700><0.254216,0.036000,0.012700> rotate<0,0.000000,0> translate<19.875231,0.000000,15.963900> }
cylinder{<0,0,0><0,0.036000,0>0.012700 translate<20.129447,0.000000,15.963900>}
cylinder{<0,0,0><0,0.036000,0>0.012700 translate<20.193000,0.000000,16.027453>}
box{<0,0,-0.012700><0.089878,0.036000,0.012700> rotate<0,-44.997030,0> translate<20.129447,0.000000,15.963900> }
cylinder{<0,0,0><0,0.036000,0>0.012700 translate<20.193000,0.000000,16.027453>}
cylinder{<0,0,0><0,0.036000,0>0.012700 translate<20.193000,0.000000,16.154563>}
box{<0,0,-0.012700><0.127109,0.036000,0.012700> rotate<0,90.000000,0> translate<20.193000,0.000000,16.154563> }
cylinder{<0,0,0><0,0.036000,0>0.012700 translate<20.193000,0.000000,16.154563>}
cylinder{<0,0,0><0,0.036000,0>0.012700 translate<20.129447,0.000000,16.218116>}
box{<0,0,-0.012700><0.089878,0.036000,0.012700> rotate<0,44.997030,0> translate<20.129447,0.000000,16.218116> }
cylinder{<0,0,0><0,0.036000,0>0.012700 translate<19.811675,0.000000,16.592322>}
cylinder{<0,0,0><0,0.036000,0>0.012700 translate<19.811675,0.000000,16.338106>}
box{<0,0,-0.012700><0.254216,0.036000,0.012700> rotate<0,-90.000000,0> translate<19.811675,0.000000,16.338106> }
cylinder{<0,0,0><0,0.036000,0>0.012700 translate<19.811675,0.000000,16.338106>}
cylinder{<0,0,0><0,0.036000,0>0.012700 translate<20.002337,0.000000,16.338106>}
box{<0,0,-0.012700><0.190662,0.036000,0.012700> rotate<0,0.000000,0> translate<19.811675,0.000000,16.338106> }
cylinder{<0,0,0><0,0.036000,0>0.012700 translate<20.002337,0.000000,16.338106>}
cylinder{<0,0,0><0,0.036000,0>0.012700 translate<19.938784,0.000000,16.465212>}
box{<0,0,-0.012700><0.142109,0.036000,0.012700> rotate<0,63.430762,0> translate<19.938784,0.000000,16.465212> }
cylinder{<0,0,0><0,0.036000,0>0.012700 translate<19.938784,0.000000,16.465212>}
cylinder{<0,0,0><0,0.036000,0>0.012700 translate<19.938784,0.000000,16.528769>}
box{<0,0,-0.012700><0.063556,0.036000,0.012700> rotate<0,90.000000,0> translate<19.938784,0.000000,16.528769> }
cylinder{<0,0,0><0,0.036000,0>0.012700 translate<19.938784,0.000000,16.528769>}
cylinder{<0,0,0><0,0.036000,0>0.012700 translate<20.002337,0.000000,16.592322>}
box{<0,0,-0.012700><0.089878,0.036000,0.012700> rotate<0,-44.997030,0> translate<19.938784,0.000000,16.528769> }
cylinder{<0,0,0><0,0.036000,0>0.012700 translate<20.002337,0.000000,16.592322>}
cylinder{<0,0,0><0,0.036000,0>0.012700 translate<20.129447,0.000000,16.592322>}
box{<0,0,-0.012700><0.127109,0.036000,0.012700> rotate<0,0.000000,0> translate<20.002337,0.000000,16.592322> }
cylinder{<0,0,0><0,0.036000,0>0.012700 translate<20.129447,0.000000,16.592322>}
cylinder{<0,0,0><0,0.036000,0>0.012700 translate<20.193000,0.000000,16.528769>}
box{<0,0,-0.012700><0.089878,0.036000,0.012700> rotate<0,44.997030,0> translate<20.129447,0.000000,16.592322> }
cylinder{<0,0,0><0,0.036000,0>0.012700 translate<20.193000,0.000000,16.528769>}
cylinder{<0,0,0><0,0.036000,0>0.012700 translate<20.193000,0.000000,16.401659>}
box{<0,0,-0.012700><0.127109,0.036000,0.012700> rotate<0,-90.000000,0> translate<20.193000,0.000000,16.401659> }
cylinder{<0,0,0><0,0.036000,0>0.012700 translate<20.193000,0.000000,16.401659>}
cylinder{<0,0,0><0,0.036000,0>0.012700 translate<20.129447,0.000000,16.338106>}
box{<0,0,-0.012700><0.089878,0.036000,0.012700> rotate<0,-44.997030,0> translate<20.129447,0.000000,16.338106> }
//C6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.637400,0.000000,25.887200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.147400,0.000000,25.887200>}
box{<0,0,-0.076200><0.490000,0.036000,0.076200> rotate<0,0.000000,0> translate<15.147400,0.000000,25.887200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.147400,0.000000,26.335200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.637400,0.000000,26.335200>}
box{<0,0,-0.076200><0.490000,0.036000,0.076200> rotate<0,0.000000,0> translate<15.147400,0.000000,26.335200> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<15.392400,0.000000,26.080700>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<15.392400,0.000000,26.141700>}
box{<0,0,-0.203200><0.061000,0.036000,0.203200> rotate<0,90.000000,0> translate<15.392400,0.000000,26.141700> }
box{<-0.150000,0,-0.299950><0.150000,0.036000,0.299950> rotate<0,-180.000000,0> translate<15.796400,0.000000,26.116050>}
box{<-0.150000,0,-0.299950><0.150000,0.036000,0.299950> rotate<0,-180.000000,0> translate<14.983600,0.000000,26.116050>}
//C7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.432800,0.000000,17.585800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.432800,0.000000,18.075800>}
box{<0,0,-0.076200><0.490000,0.036000,0.076200> rotate<0,90.000000,0> translate<22.432800,0.000000,18.075800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.880800,0.000000,18.075800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.880800,0.000000,17.585800>}
box{<0,0,-0.076200><0.490000,0.036000,0.076200> rotate<0,-90.000000,0> translate<22.880800,0.000000,17.585800> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<22.626300,0.000000,17.830800>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<22.687300,0.000000,17.830800>}
box{<0,0,-0.203200><0.061000,0.036000,0.203200> rotate<0,0.000000,0> translate<22.626300,0.000000,17.830800> }
box{<-0.150000,0,-0.299950><0.150000,0.036000,0.299950> rotate<0,-90.000000,0> translate<22.661650,0.000000,17.426800>}
box{<-0.150000,0,-0.299950><0.150000,0.036000,0.299950> rotate<0,-90.000000,0> translate<22.661650,0.000000,18.239600>}
//C8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.884800,0.000000,17.581400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.394800,0.000000,17.581400>}
box{<0,0,-0.076200><0.490000,0.036000,0.076200> rotate<0,0.000000,0> translate<13.394800,0.000000,17.581400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.394800,0.000000,18.029400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.884800,0.000000,18.029400>}
box{<0,0,-0.076200><0.490000,0.036000,0.076200> rotate<0,0.000000,0> translate<13.394800,0.000000,18.029400> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<13.639800,0.000000,17.774900>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<13.639800,0.000000,17.835900>}
box{<0,0,-0.203200><0.061000,0.036000,0.203200> rotate<0,90.000000,0> translate<13.639800,0.000000,17.835900> }
box{<-0.150000,0,-0.299950><0.150000,0.036000,0.299950> rotate<0,-180.000000,0> translate<14.043800,0.000000,17.810250>}
box{<-0.150000,0,-0.299950><0.150000,0.036000,0.299950> rotate<0,-180.000000,0> translate<13.231000,0.000000,17.810250>}
//C9 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.821000,0.000000,16.530800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.311000,0.000000,16.530800>}
box{<0,0,-0.076200><0.490000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.821000,0.000000,16.530800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.311000,0.000000,16.082800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.821000,0.000000,16.082800>}
box{<0,0,-0.076200><0.490000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.821000,0.000000,16.082800> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<20.066000,0.000000,16.337300>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<20.066000,0.000000,16.276300>}
box{<0,0,-0.203200><0.061000,0.036000,0.203200> rotate<0,-90.000000,0> translate<20.066000,0.000000,16.276300> }
box{<-0.150000,0,-0.299950><0.150000,0.036000,0.299950> rotate<0,-0.000000,0> translate<19.662000,0.000000,16.301950>}
box{<-0.150000,0,-0.299950><0.150000,0.036000,0.299950> rotate<0,-0.000000,0> translate<20.474800,0.000000,16.301950>}
//C10 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.880800,0.000000,20.361800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.880800,0.000000,19.871800>}
box{<0,0,-0.076200><0.490000,0.036000,0.076200> rotate<0,-90.000000,0> translate<22.880800,0.000000,19.871800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.432800,0.000000,19.871800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.432800,0.000000,20.361800>}
box{<0,0,-0.076200><0.490000,0.036000,0.076200> rotate<0,90.000000,0> translate<22.432800,0.000000,20.361800> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<22.687300,0.000000,20.116800>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<22.626300,0.000000,20.116800>}
box{<0,0,-0.203200><0.061000,0.036000,0.203200> rotate<0,0.000000,0> translate<22.626300,0.000000,20.116800> }
box{<-0.150000,0,-0.299950><0.150000,0.036000,0.299950> rotate<0,-270.000000,0> translate<22.651950,0.000000,20.520800>}
box{<-0.150000,0,-0.299950><0.150000,0.036000,0.299950> rotate<0,-270.000000,0> translate<22.651950,0.000000,19.708000>}
//C11 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.382000,0.000000,22.208600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.382000,0.000000,22.698600>}
box{<0,0,-0.076200><0.490000,0.036000,0.076200> rotate<0,90.000000,0> translate<22.382000,0.000000,22.698600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.830000,0.000000,22.698600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.830000,0.000000,22.208600>}
box{<0,0,-0.076200><0.490000,0.036000,0.076200> rotate<0,-90.000000,0> translate<22.830000,0.000000,22.208600> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<22.575500,0.000000,22.453600>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<22.636500,0.000000,22.453600>}
box{<0,0,-0.203200><0.061000,0.036000,0.203200> rotate<0,0.000000,0> translate<22.575500,0.000000,22.453600> }
box{<-0.150000,0,-0.299950><0.150000,0.036000,0.299950> rotate<0,-90.000000,0> translate<22.610850,0.000000,22.049600>}
box{<-0.150000,0,-0.299950><0.150000,0.036000,0.299950> rotate<0,-90.000000,0> translate<22.610850,0.000000,22.862400>}
//C14 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.401600,-1.536000,18.978600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.401600,-1.536000,19.578600>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,90.000000,0> translate<13.401600,-1.536000,19.578600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.201600,-1.536000,18.978600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.201600,-1.536000,19.578600>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,90.000000,0> translate<12.201600,-1.536000,19.578600> }
//C15 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.420200,0.000000,16.530800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.910200,0.000000,16.530800>}
box{<0,0,-0.076200><0.490000,0.036000,0.076200> rotate<0,0.000000,0> translate<13.420200,0.000000,16.530800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.910200,0.000000,16.082800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.420200,0.000000,16.082800>}
box{<0,0,-0.076200><0.490000,0.036000,0.076200> rotate<0,0.000000,0> translate<13.420200,0.000000,16.082800> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<13.665200,0.000000,16.337300>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<13.665200,0.000000,16.276300>}
box{<0,0,-0.203200><0.061000,0.036000,0.203200> rotate<0,-90.000000,0> translate<13.665200,0.000000,16.276300> }
box{<-0.150000,0,-0.299950><0.150000,0.036000,0.299950> rotate<0,-0.000000,0> translate<13.261200,0.000000,16.301950>}
box{<-0.150000,0,-0.299950><0.150000,0.036000,0.299950> rotate<0,-0.000000,0> translate<14.074000,0.000000,16.301950>}
//CYRF6936 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.957800,0.000000,18.542000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.957800,0.000000,18.973800>}
box{<0,0,-0.063500><0.431800,0.036000,0.063500> rotate<0,90.000000,0> translate<14.957800,0.000000,18.973800> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.957800,0.000000,24.079200>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.957800,0.000000,24.536400>}
box{<0,0,-0.063500><0.457200,0.036000,0.063500> rotate<0,90.000000,0> translate<14.957800,0.000000,24.536400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.957800,0.000000,24.536400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.417800,0.000000,24.536400>}
box{<0,0,-0.063500><0.460000,0.036000,0.063500> rotate<0,0.000000,0> translate<14.957800,0.000000,24.536400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.574000,0.000000,24.536400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.955000,0.000000,24.536400>}
box{<0,0,-0.063500><0.381000,0.036000,0.063500> rotate<0,0.000000,0> translate<20.574000,0.000000,24.536400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.907000,0.000000,18.980500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.516500,0.000000,18.590000>}
box{<0,0,-0.063500><0.552250,0.036000,0.063500> rotate<0,-44.997030,0> translate<20.516500,0.000000,18.590000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.417800,0.000000,18.542000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.957800,0.000000,18.542000>}
box{<0,0,-0.063500><0.460000,0.036000,0.063500> rotate<0,0.000000,0> translate<14.957800,0.000000,18.542000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.955000,0.000000,24.536400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.955000,0.000000,24.155400>}
box{<0,0,-0.063500><0.381000,0.036000,0.063500> rotate<0,-90.000000,0> translate<20.955000,0.000000,24.155400> }
difference{
cylinder{<21.132800,0,18.364200><21.132800,0.036000,18.364200>0.350000 translate<0,0.000000,0>}
cylinder{<21.132800,-0.1,18.364200><21.132800,0.135000,18.364200>0.000000 translate<0,0.000000,0>}}
//GND silk screen
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.444750,-1.536000,27.542463>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.537963,-1.536000,27.635675>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<13.444750,-1.536000,27.542463> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.537963,-1.536000,27.635675>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.724388,-1.536000,27.635675>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<13.537963,-1.536000,27.635675> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.724388,-1.536000,27.635675>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.817600,-1.536000,27.542463>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<13.724388,-1.536000,27.635675> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.817600,-1.536000,27.542463>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.817600,-1.536000,27.169613>}
box{<0,0,-0.025400><0.372850,0.036000,0.025400> rotate<0,-90.000000,0> translate<13.817600,-1.536000,27.169613> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.817600,-1.536000,27.169613>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.724388,-1.536000,27.076400>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<13.724388,-1.536000,27.076400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.724388,-1.536000,27.076400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.537963,-1.536000,27.076400>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<13.537963,-1.536000,27.076400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.537963,-1.536000,27.076400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.444750,-1.536000,27.169613>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<13.444750,-1.536000,27.169613> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.444750,-1.536000,27.169613>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.444750,-1.536000,27.356038>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,90.000000,0> translate<13.444750,-1.536000,27.356038> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.444750,-1.536000,27.356038>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.631175,-1.536000,27.356038>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<13.444750,-1.536000,27.356038> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.256291,-1.536000,27.076400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.256291,-1.536000,27.635675>}
box{<0,0,-0.025400><0.559275,0.036000,0.025400> rotate<0,90.000000,0> translate<13.256291,-1.536000,27.635675> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.256291,-1.536000,27.635675>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.883441,-1.536000,27.076400>}
box{<0,0,-0.025400><0.672165,0.036000,0.025400> rotate<0,-56.306216,0> translate<12.883441,-1.536000,27.076400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.883441,-1.536000,27.076400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.883441,-1.536000,27.635675>}
box{<0,0,-0.025400><0.559275,0.036000,0.025400> rotate<0,90.000000,0> translate<12.883441,-1.536000,27.635675> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.694981,-1.536000,27.635675>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.694981,-1.536000,27.076400>}
box{<0,0,-0.025400><0.559275,0.036000,0.025400> rotate<0,-90.000000,0> translate<12.694981,-1.536000,27.076400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.694981,-1.536000,27.076400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.415344,-1.536000,27.076400>}
box{<0,0,-0.025400><0.279638,0.036000,0.025400> rotate<0,0.000000,0> translate<12.415344,-1.536000,27.076400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.415344,-1.536000,27.076400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.322131,-1.536000,27.169613>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<12.322131,-1.536000,27.169613> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.322131,-1.536000,27.169613>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.322131,-1.536000,27.542463>}
box{<0,0,-0.025400><0.372850,0.036000,0.025400> rotate<0,90.000000,0> translate<12.322131,-1.536000,27.542463> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.322131,-1.536000,27.542463>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.415344,-1.536000,27.635675>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<12.322131,-1.536000,27.542463> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.415344,-1.536000,27.635675>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.694981,-1.536000,27.635675>}
box{<0,0,-0.025400><0.279638,0.036000,0.025400> rotate<0,0.000000,0> translate<12.415344,-1.536000,27.635675> }
//IRQ silk screen
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.817600,-1.536000,22.123400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.631175,-1.536000,22.123400>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<13.631175,-1.536000,22.123400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.724388,-1.536000,22.123400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.724388,-1.536000,22.682675>}
box{<0,0,-0.025400><0.559275,0.036000,0.025400> rotate<0,90.000000,0> translate<13.724388,-1.536000,22.682675> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.817600,-1.536000,22.682675>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.631175,-1.536000,22.682675>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<13.631175,-1.536000,22.682675> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.443394,-1.536000,22.123400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.443394,-1.536000,22.682675>}
box{<0,0,-0.025400><0.559275,0.036000,0.025400> rotate<0,90.000000,0> translate<13.443394,-1.536000,22.682675> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.443394,-1.536000,22.682675>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.163756,-1.536000,22.682675>}
box{<0,0,-0.025400><0.279637,0.036000,0.025400> rotate<0,0.000000,0> translate<13.163756,-1.536000,22.682675> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.163756,-1.536000,22.682675>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.070544,-1.536000,22.589462>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<13.070544,-1.536000,22.589462> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.070544,-1.536000,22.589462>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.070544,-1.536000,22.403037>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,-90.000000,0> translate<13.070544,-1.536000,22.403037> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.070544,-1.536000,22.403037>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.163756,-1.536000,22.309825>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<13.070544,-1.536000,22.403037> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.163756,-1.536000,22.309825>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.443394,-1.536000,22.309825>}
box{<0,0,-0.025400><0.279637,0.036000,0.025400> rotate<0,0.000000,0> translate<13.163756,-1.536000,22.309825> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.256969,-1.536000,22.309825>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.070544,-1.536000,22.123400>}
box{<0,0,-0.025400><0.263645,0.036000,0.025400> rotate<0,-44.997030,0> translate<13.070544,-1.536000,22.123400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.882084,-1.536000,22.216613>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.882084,-1.536000,22.589462>}
box{<0,0,-0.025400><0.372850,0.036000,0.025400> rotate<0,90.000000,0> translate<12.882084,-1.536000,22.589462> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.882084,-1.536000,22.589462>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.788872,-1.536000,22.682675>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<12.788872,-1.536000,22.682675> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.788872,-1.536000,22.682675>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.602447,-1.536000,22.682675>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<12.602447,-1.536000,22.682675> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.602447,-1.536000,22.682675>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.509234,-1.536000,22.589462>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<12.509234,-1.536000,22.589462> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.509234,-1.536000,22.589462>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.509234,-1.536000,22.216613>}
box{<0,0,-0.025400><0.372850,0.036000,0.025400> rotate<0,-90.000000,0> translate<12.509234,-1.536000,22.216613> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.509234,-1.536000,22.216613>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.602447,-1.536000,22.123400>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<12.509234,-1.536000,22.216613> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.602447,-1.536000,22.123400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.788872,-1.536000,22.123400>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<12.602447,-1.536000,22.123400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.788872,-1.536000,22.123400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.882084,-1.536000,22.216613>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<12.788872,-1.536000,22.123400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.695659,-1.536000,22.309825>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.509234,-1.536000,22.123400>}
box{<0,0,-0.025400><0.263645,0.036000,0.025400> rotate<0,-44.997030,0> translate<12.509234,-1.536000,22.123400> }
//L1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.860400,0.000000,24.536200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.148400,0.000000,24.536200>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<22.148400,0.000000,24.536200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.860400,0.000000,25.387200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.148400,0.000000,25.387200>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<22.148400,0.000000,25.387200> }
box{<-0.250050,0,-0.475000><0.250050,0.036000,0.475000> rotate<0,-180.000000,0> translate<23.092550,0.000000,24.963100>}
box{<-0.250050,0,-0.475000><0.250050,0.036000,0.475000> rotate<0,-180.000000,0> translate<21.924150,0.000000,24.963100>}
//L2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.719400,0.000000,26.335200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.209400,0.000000,26.335200>}
box{<0,0,-0.076200><0.490000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.719400,0.000000,26.335200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.209400,0.000000,25.887200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.719400,0.000000,25.887200>}
box{<0,0,-0.076200><0.490000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.719400,0.000000,25.887200> }
box{<-0.150000,0,-0.299950><0.150000,0.036000,0.299950> rotate<0,-0.000000,0> translate<19.560400,0.000000,26.106350>}
box{<-0.150000,0,-0.299950><0.150000,0.036000,0.299950> rotate<0,-0.000000,0> translate<20.373200,0.000000,26.106350>}
//MISO silk screen
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.198600,-1.536000,18.821400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.198600,-1.536000,19.380675>}
box{<0,0,-0.025400><0.559275,0.036000,0.025400> rotate<0,90.000000,0> translate<14.198600,-1.536000,19.380675> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.198600,-1.536000,19.380675>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.012175,-1.536000,19.194250>}
box{<0,0,-0.025400><0.263645,0.036000,0.025400> rotate<0,-44.997030,0> translate<14.012175,-1.536000,19.194250> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.012175,-1.536000,19.194250>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.825750,-1.536000,19.380675>}
box{<0,0,-0.025400><0.263645,0.036000,0.025400> rotate<0,44.997030,0> translate<13.825750,-1.536000,19.380675> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.825750,-1.536000,19.380675>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.825750,-1.536000,18.821400>}
box{<0,0,-0.025400><0.559275,0.036000,0.025400> rotate<0,-90.000000,0> translate<13.825750,-1.536000,18.821400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.637291,-1.536000,18.821400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.450866,-1.536000,18.821400>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<13.450866,-1.536000,18.821400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.544078,-1.536000,18.821400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.544078,-1.536000,19.380675>}
box{<0,0,-0.025400><0.559275,0.036000,0.025400> rotate<0,90.000000,0> translate<13.544078,-1.536000,19.380675> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.637291,-1.536000,19.380675>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.450866,-1.536000,19.380675>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<13.450866,-1.536000,19.380675> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.890234,-1.536000,19.287463>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.983447,-1.536000,19.380675>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<12.890234,-1.536000,19.287463> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.983447,-1.536000,19.380675>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.169872,-1.536000,19.380675>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<12.983447,-1.536000,19.380675> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.169872,-1.536000,19.380675>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.263084,-1.536000,19.287463>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<13.169872,-1.536000,19.380675> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.263084,-1.536000,19.287463>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.263084,-1.536000,19.194250>}
box{<0,0,-0.025400><0.093212,0.036000,0.025400> rotate<0,-90.000000,0> translate<13.263084,-1.536000,19.194250> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.263084,-1.536000,19.194250>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.169872,-1.536000,19.101038>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<13.169872,-1.536000,19.101038> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.169872,-1.536000,19.101038>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.983447,-1.536000,19.101038>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<12.983447,-1.536000,19.101038> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.983447,-1.536000,19.101038>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.890234,-1.536000,19.007825>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<12.890234,-1.536000,19.007825> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.890234,-1.536000,19.007825>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.890234,-1.536000,18.914613>}
box{<0,0,-0.025400><0.093212,0.036000,0.025400> rotate<0,-90.000000,0> translate<12.890234,-1.536000,18.914613> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.890234,-1.536000,18.914613>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.983447,-1.536000,18.821400>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<12.890234,-1.536000,18.914613> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.983447,-1.536000,18.821400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.169872,-1.536000,18.821400>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<12.983447,-1.536000,18.821400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.169872,-1.536000,18.821400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.263084,-1.536000,18.914613>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<13.169872,-1.536000,18.821400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.422137,-1.536000,19.380675>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.608563,-1.536000,19.380675>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<12.422137,-1.536000,19.380675> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.608563,-1.536000,19.380675>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.701775,-1.536000,19.287463>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<12.608563,-1.536000,19.380675> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.701775,-1.536000,19.287463>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.701775,-1.536000,18.914613>}
box{<0,0,-0.025400><0.372850,0.036000,0.025400> rotate<0,-90.000000,0> translate<12.701775,-1.536000,18.914613> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.701775,-1.536000,18.914613>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.608563,-1.536000,18.821400>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<12.608563,-1.536000,18.821400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.608563,-1.536000,18.821400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.422137,-1.536000,18.821400>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<12.422137,-1.536000,18.821400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.422137,-1.536000,18.821400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.328925,-1.536000,18.914613>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<12.328925,-1.536000,18.914613> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.328925,-1.536000,18.914613>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.328925,-1.536000,19.287463>}
box{<0,0,-0.025400><0.372850,0.036000,0.025400> rotate<0,90.000000,0> translate<12.328925,-1.536000,19.287463> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.328925,-1.536000,19.287463>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.422137,-1.536000,19.380675>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<12.328925,-1.536000,19.287463> }
//MOSI silk screen
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.198600,-1.536000,20.345400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.198600,-1.536000,20.904675>}
box{<0,0,-0.025400><0.559275,0.036000,0.025400> rotate<0,90.000000,0> translate<14.198600,-1.536000,20.904675> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.198600,-1.536000,20.904675>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.012175,-1.536000,20.718250>}
box{<0,0,-0.025400><0.263645,0.036000,0.025400> rotate<0,-44.997030,0> translate<14.012175,-1.536000,20.718250> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.012175,-1.536000,20.718250>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.825750,-1.536000,20.904675>}
box{<0,0,-0.025400><0.263645,0.036000,0.025400> rotate<0,44.997030,0> translate<13.825750,-1.536000,20.904675> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.825750,-1.536000,20.904675>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.825750,-1.536000,20.345400>}
box{<0,0,-0.025400><0.559275,0.036000,0.025400> rotate<0,-90.000000,0> translate<13.825750,-1.536000,20.345400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.357653,-1.536000,20.904675>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.544078,-1.536000,20.904675>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<13.357653,-1.536000,20.904675> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.544078,-1.536000,20.904675>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.637291,-1.536000,20.811463>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<13.544078,-1.536000,20.904675> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.637291,-1.536000,20.811463>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.637291,-1.536000,20.438613>}
box{<0,0,-0.025400><0.372850,0.036000,0.025400> rotate<0,-90.000000,0> translate<13.637291,-1.536000,20.438613> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.637291,-1.536000,20.438613>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.544078,-1.536000,20.345400>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<13.544078,-1.536000,20.345400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.544078,-1.536000,20.345400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.357653,-1.536000,20.345400>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<13.357653,-1.536000,20.345400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.357653,-1.536000,20.345400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.264441,-1.536000,20.438613>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<13.264441,-1.536000,20.438613> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.264441,-1.536000,20.438613>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.264441,-1.536000,20.811463>}
box{<0,0,-0.025400><0.372850,0.036000,0.025400> rotate<0,90.000000,0> translate<13.264441,-1.536000,20.811463> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.264441,-1.536000,20.811463>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.357653,-1.536000,20.904675>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<13.264441,-1.536000,20.811463> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.703131,-1.536000,20.811463>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.796344,-1.536000,20.904675>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<12.703131,-1.536000,20.811463> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.796344,-1.536000,20.904675>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.982769,-1.536000,20.904675>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<12.796344,-1.536000,20.904675> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.982769,-1.536000,20.904675>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.075981,-1.536000,20.811463>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<12.982769,-1.536000,20.904675> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.075981,-1.536000,20.811463>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.075981,-1.536000,20.718250>}
box{<0,0,-0.025400><0.093212,0.036000,0.025400> rotate<0,-90.000000,0> translate<13.075981,-1.536000,20.718250> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.075981,-1.536000,20.718250>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.982769,-1.536000,20.625038>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<12.982769,-1.536000,20.625038> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.982769,-1.536000,20.625038>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.796344,-1.536000,20.625038>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<12.796344,-1.536000,20.625038> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.796344,-1.536000,20.625038>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.703131,-1.536000,20.531825>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<12.703131,-1.536000,20.531825> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.703131,-1.536000,20.531825>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.703131,-1.536000,20.438613>}
box{<0,0,-0.025400><0.093212,0.036000,0.025400> rotate<0,-90.000000,0> translate<12.703131,-1.536000,20.438613> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.703131,-1.536000,20.438613>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.796344,-1.536000,20.345400>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<12.703131,-1.536000,20.438613> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.796344,-1.536000,20.345400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.982769,-1.536000,20.345400>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<12.796344,-1.536000,20.345400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.982769,-1.536000,20.345400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.075981,-1.536000,20.438613>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<12.982769,-1.536000,20.345400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.514672,-1.536000,20.345400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.328247,-1.536000,20.345400>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<12.328247,-1.536000,20.345400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.421459,-1.536000,20.345400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.421459,-1.536000,20.904675>}
box{<0,0,-0.025400><0.559275,0.036000,0.025400> rotate<0,90.000000,0> translate<12.421459,-1.536000,20.904675> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.514672,-1.536000,20.904675>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.328247,-1.536000,20.904675>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<12.328247,-1.536000,20.904675> }
//SCK silk screen
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.444750,-1.536000,24.240462>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.537963,-1.536000,24.333675>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<13.444750,-1.536000,24.240462> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.537963,-1.536000,24.333675>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.724388,-1.536000,24.333675>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<13.537963,-1.536000,24.333675> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.724388,-1.536000,24.333675>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.817600,-1.536000,24.240462>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<13.724388,-1.536000,24.333675> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.817600,-1.536000,24.240462>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.817600,-1.536000,24.147250>}
box{<0,0,-0.025400><0.093212,0.036000,0.025400> rotate<0,-90.000000,0> translate<13.817600,-1.536000,24.147250> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.817600,-1.536000,24.147250>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.724388,-1.536000,24.054037>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<13.724388,-1.536000,24.054037> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.724388,-1.536000,24.054037>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.537963,-1.536000,24.054037>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<13.537963,-1.536000,24.054037> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.537963,-1.536000,24.054037>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.444750,-1.536000,23.960825>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<13.444750,-1.536000,23.960825> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.444750,-1.536000,23.960825>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.444750,-1.536000,23.867612>}
box{<0,0,-0.025400><0.093212,0.036000,0.025400> rotate<0,-90.000000,0> translate<13.444750,-1.536000,23.867612> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.444750,-1.536000,23.867612>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.537963,-1.536000,23.774400>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<13.444750,-1.536000,23.867612> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.537963,-1.536000,23.774400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.724388,-1.536000,23.774400>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<13.537963,-1.536000,23.774400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.724388,-1.536000,23.774400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.817600,-1.536000,23.867612>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<13.724388,-1.536000,23.774400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.883441,-1.536000,24.240462>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.976653,-1.536000,24.333675>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<12.883441,-1.536000,24.240462> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.976653,-1.536000,24.333675>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.163078,-1.536000,24.333675>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<12.976653,-1.536000,24.333675> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.163078,-1.536000,24.333675>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.256291,-1.536000,24.240462>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<13.163078,-1.536000,24.333675> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.256291,-1.536000,24.240462>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.256291,-1.536000,23.867612>}
box{<0,0,-0.025400><0.372850,0.036000,0.025400> rotate<0,-90.000000,0> translate<13.256291,-1.536000,23.867612> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.256291,-1.536000,23.867612>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.163078,-1.536000,23.774400>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<13.163078,-1.536000,23.774400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.163078,-1.536000,23.774400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.976653,-1.536000,23.774400>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<12.976653,-1.536000,23.774400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.976653,-1.536000,23.774400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.883441,-1.536000,23.867612>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<12.883441,-1.536000,23.867612> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.694981,-1.536000,24.333675>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.694981,-1.536000,23.774400>}
box{<0,0,-0.025400><0.559275,0.036000,0.025400> rotate<0,-90.000000,0> translate<12.694981,-1.536000,23.774400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.694981,-1.536000,23.960825>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.322131,-1.536000,24.333675>}
box{<0,0,-0.025400><0.527290,0.036000,0.025400> rotate<0,44.997030,0> translate<12.322131,-1.536000,24.333675> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.601769,-1.536000,24.054037>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.322131,-1.536000,23.774400>}
box{<0,0,-0.025400><0.395467,0.036000,0.025400> rotate<0,-44.997030,0> translate<12.322131,-1.536000,23.774400> }
//VCC silk screen
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<15.501534,-1.536000,17.348675>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<15.501534,-1.536000,16.975825>}
box{<0,0,-0.025400><0.372850,0.036000,0.025400> rotate<0,-90.000000,0> translate<15.501534,-1.536000,16.975825> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<15.501534,-1.536000,16.975825>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<15.315109,-1.536000,16.789400>}
box{<0,0,-0.025400><0.263645,0.036000,0.025400> rotate<0,-44.997030,0> translate<15.315109,-1.536000,16.789400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<15.315109,-1.536000,16.789400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<15.128684,-1.536000,16.975825>}
box{<0,0,-0.025400><0.263645,0.036000,0.025400> rotate<0,44.997030,0> translate<15.128684,-1.536000,16.975825> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<15.128684,-1.536000,16.975825>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<15.128684,-1.536000,17.348675>}
box{<0,0,-0.025400><0.372850,0.036000,0.025400> rotate<0,90.000000,0> translate<15.128684,-1.536000,17.348675> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.567375,-1.536000,17.255463>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.660588,-1.536000,17.348675>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<14.567375,-1.536000,17.255463> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.660588,-1.536000,17.348675>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.847012,-1.536000,17.348675>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<14.660588,-1.536000,17.348675> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.847012,-1.536000,17.348675>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.940225,-1.536000,17.255463>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<14.847012,-1.536000,17.348675> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.940225,-1.536000,17.255463>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.940225,-1.536000,16.882613>}
box{<0,0,-0.025400><0.372850,0.036000,0.025400> rotate<0,-90.000000,0> translate<14.940225,-1.536000,16.882613> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.940225,-1.536000,16.882613>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.847012,-1.536000,16.789400>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<14.847012,-1.536000,16.789400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.847012,-1.536000,16.789400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.660588,-1.536000,16.789400>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<14.660588,-1.536000,16.789400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.660588,-1.536000,16.789400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.567375,-1.536000,16.882613>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<14.567375,-1.536000,16.882613> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.006066,-1.536000,17.255463>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.099278,-1.536000,17.348675>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<14.006066,-1.536000,17.255463> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.099278,-1.536000,17.348675>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.285703,-1.536000,17.348675>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<14.099278,-1.536000,17.348675> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.285703,-1.536000,17.348675>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.378916,-1.536000,17.255463>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<14.285703,-1.536000,17.348675> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.378916,-1.536000,17.255463>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.378916,-1.536000,16.882613>}
box{<0,0,-0.025400><0.372850,0.036000,0.025400> rotate<0,-90.000000,0> translate<14.378916,-1.536000,16.882613> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.378916,-1.536000,16.882613>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.285703,-1.536000,16.789400>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<14.285703,-1.536000,16.789400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.285703,-1.536000,16.789400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.099278,-1.536000,16.789400>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<14.099278,-1.536000,16.789400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.099278,-1.536000,16.789400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.006066,-1.536000,16.882613>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<14.006066,-1.536000,16.882613> }
//Y1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.586400,-1.536000,15.824400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.786400,-1.536000,15.824400>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<17.586400,-1.536000,15.824400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.686400,-1.536000,17.124400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.686400,-1.536000,17.724400>}
box{<0,0,-0.101600><0.600000,0.036000,0.101600> rotate<0,90.000000,0> translate<20.686400,-1.536000,17.724400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.786400,-1.536000,19.024400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.586400,-1.536000,19.024400>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<17.586400,-1.536000,19.024400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.686400,-1.536000,17.124400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.686400,-1.536000,17.724400>}
box{<0,0,-0.101600><0.600000,0.036000,0.101600> rotate<0,90.000000,0> translate<15.686400,-1.536000,17.724400> }
//_SS silk screen
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.817600,-1.536000,25.332187>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.444750,-1.536000,25.332187>}
box{<0,0,-0.025400><0.372850,0.036000,0.025400> rotate<0,0.000000,0> translate<13.444750,-1.536000,25.332187> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.883441,-1.536000,25.891463>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.976653,-1.536000,25.984675>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<12.883441,-1.536000,25.891463> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.976653,-1.536000,25.984675>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.163078,-1.536000,25.984675>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<12.976653,-1.536000,25.984675> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.163078,-1.536000,25.984675>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.256291,-1.536000,25.891463>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<13.163078,-1.536000,25.984675> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.256291,-1.536000,25.891463>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.256291,-1.536000,25.798250>}
box{<0,0,-0.025400><0.093213,0.036000,0.025400> rotate<0,-90.000000,0> translate<13.256291,-1.536000,25.798250> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.256291,-1.536000,25.798250>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.163078,-1.536000,25.705037>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<13.163078,-1.536000,25.705037> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.163078,-1.536000,25.705037>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.976653,-1.536000,25.705037>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<12.976653,-1.536000,25.705037> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.976653,-1.536000,25.705037>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.883441,-1.536000,25.611825>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<12.883441,-1.536000,25.611825> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.883441,-1.536000,25.611825>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.883441,-1.536000,25.518612>}
box{<0,0,-0.025400><0.093212,0.036000,0.025400> rotate<0,-90.000000,0> translate<12.883441,-1.536000,25.518612> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.883441,-1.536000,25.518612>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.976653,-1.536000,25.425400>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<12.883441,-1.536000,25.518612> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.976653,-1.536000,25.425400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.163078,-1.536000,25.425400>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<12.976653,-1.536000,25.425400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.163078,-1.536000,25.425400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.256291,-1.536000,25.518612>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<13.163078,-1.536000,25.425400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.322131,-1.536000,25.891463>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.415344,-1.536000,25.984675>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<12.322131,-1.536000,25.891463> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.415344,-1.536000,25.984675>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.601769,-1.536000,25.984675>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<12.415344,-1.536000,25.984675> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.601769,-1.536000,25.984675>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.694981,-1.536000,25.891463>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<12.601769,-1.536000,25.984675> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.694981,-1.536000,25.891463>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.694981,-1.536000,25.798250>}
box{<0,0,-0.025400><0.093213,0.036000,0.025400> rotate<0,-90.000000,0> translate<12.694981,-1.536000,25.798250> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.694981,-1.536000,25.798250>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.601769,-1.536000,25.705037>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<12.601769,-1.536000,25.705037> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.601769,-1.536000,25.705037>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.415344,-1.536000,25.705037>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<12.415344,-1.536000,25.705037> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.415344,-1.536000,25.705037>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.322131,-1.536000,25.611825>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<12.322131,-1.536000,25.611825> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.322131,-1.536000,25.611825>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.322131,-1.536000,25.518612>}
box{<0,0,-0.025400><0.093212,0.036000,0.025400> rotate<0,-90.000000,0> translate<12.322131,-1.536000,25.518612> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.322131,-1.536000,25.518612>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.415344,-1.536000,25.425400>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<12.322131,-1.536000,25.518612> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.415344,-1.536000,25.425400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.601769,-1.536000,25.425400>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<12.415344,-1.536000,25.425400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.601769,-1.536000,25.425400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.694981,-1.536000,25.518612>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<12.601769,-1.536000,25.425400> }
texture{col_slk}
}
#end
translate<mac_x_ver,mac_y_ver,mac_z_ver>
rotate<mac_x_rot,mac_y_rot,mac_z_rot>
}//End union
#end

#if(use_file_as_inc=off)
object{  TINYRF(-18.332400,0,-21.947800,pcb_rotate_x,pcb_rotate_y,pcb_rotate_z)
#if(pcb_upsidedown=on)
rotate pcb_rotdir*180
#end
}
#end


//Parts not found in 3dpack.dat or 3dusrpac.dat are:
//GND	SOLDER_PAD.05X.05	SOLDER_PAD_.05X.05
//IRQ	SOLDER_PAD.05X.05	SOLDER_PAD_.05X.05
//L1		0603
//MISO	SOLDER_PAD.05X.05	SOLDER_PAD_.05X.05
//MOSI	SOLDER_PAD.05X.05	SOLDER_PAD_.05X.05
//SCK	SOLDER_PAD.05X.05	SOLDER_PAD_.05X.05
//VCC	SOLDER_PAD.05X.05	SOLDER_PAD_.05X.05
//_SS	SOLDER_PAD.05X.05	SOLDER_PAD_.05X.05
