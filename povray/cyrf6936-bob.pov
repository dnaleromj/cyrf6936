//POVRay-File created by 3d41.ulp v###VERSIONDUMMY###
///Users/jmoreland/.dropbox-alt/Dropbox/Projects/quadcopter/rf/cyrf6936-BOB/cyrf6936-bob.brd
//4/17/13 5:27 PM

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
#local cam_y = 145;
#local cam_z = -77;
#local cam_a = 20;
#local cam_look_x = 0;
#local cam_look_y = -3;
#local cam_look_z = 0;

#local pcb_rotate_x = 350;
#local pcb_rotate_y = 90;
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

#local lgt1_pos_x = 6;
#local lgt1_pos_y = 19;
#local lgt1_pos_z = 17;
#local lgt1_intense = 0.708914;
#local lgt2_pos_x = -6;
#local lgt2_pos_y = 19;
#local lgt2_pos_z = 17;
#local lgt2_intense = 0.708914;
#local lgt3_pos_x = 6;
#local lgt3_pos_y = 19;
#local lgt3_pos_z = -12;
#local lgt3_intense = 0.708914;
#local lgt4_pos_x = -6;
#local lgt4_pos_y = 19;
#local lgt4_pos_z = -12;
#local lgt4_intense = 0.708914;

//Do not change these values
#declare pcb_height = 1.500000;
#declare pcb_cuheight = 0.035000;
#declare pcb_x_size = 18.415000;
#declare pcb_y_size = 33.883600;
#declare pcb_layer1_used = 1;
#declare pcb_layer16_used = 1;
#declare inc_testmode = off;
#declare global_seed=seed(176);
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
#declare global_pcb_real_hole = 2.000000;

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
	//translate<-9.207500,0,-16.941800>
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
<8.890000,4.216400><27.305000,4.216400>
<27.305000,4.216400><27.305000,38.100000>
<27.305000,38.100000><8.890000,38.100000>
<8.890000,38.100000><8.890000,4.216400>
texture{col_brd}}
}//End union(PCB)
//Holes(real)/Parts
//Holes(real)/Board
//Holes(real)/Vias
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
#ifndef(pack_C14) #declare global_pack_C14=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<13.919200,0.000000,10.566400>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C14 2.2uF 0805
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
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<13.019200,0.000000,10.566400>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<14.819200,0.000000,10.566400>}
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
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<13.741400,0,15.036800> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<14.122400,0,16.408400> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<23.495000,0,17.145000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<19.456400,0,21.564600> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<18.592800,0,21.564600> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<17.729200,0,21.564600> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<16.865600,0,21.564600> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<16.002000,0,21.564600> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<19.456400,0,20.675600> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<18.592800,0,20.675600> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<17.729200,0,20.675600> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<16.865600,0,20.675600> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<16.002000,0,20.675600> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<19.456400,0,19.812000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<18.592800,0,19.812000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<17.729200,0,19.812000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<16.865600,0,19.812000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<16.002000,0,19.812000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<19.456400,0,18.923000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<18.592800,0,18.923000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<17.729200,0,18.923000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<16.865600,0,18.923000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<16.002000,0,18.923000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<19.456400,0,18.059400> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<18.592800,0,18.059400> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<17.729200,0,18.059400> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<16.865600,0,18.059400> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<16.002000,0,18.059400> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<13.385800,0,25.146000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<13.893800,0,22.809200> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<19.481800,0,11.938000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<17.449800,0,11.938000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<10.414000,0,10.820400> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<10.414000,0,13.360400> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<10.414000,0,15.900400> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<10.414000,0,18.440400> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<10.414000,0,20.980400> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<10.414000,0,23.622000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<10.414000,0,28.702000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<10.414000,0,5.842000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<10.414000,0,8.382000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<24.130000,0,28.702000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<23.114000,0,28.702000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<19.304000,0,28.702000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<18.034000,0,28.702000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<11.684000,0,28.702000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<16.764000,0,28.702000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<15.494000,0,28.702000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<14.224000,0,28.702000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<12.954000,0,28.702000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<26.416000,0,28.702000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<23.596600,0,8.382000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<21.132800,0,5.867400> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<18.542000,0,5.842000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<16.002000,0,5.842000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<13.462000,0,5.842000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<25.273000,0,28.702000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<13.462000,0,8.382000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<15.494000,0,8.382000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<18.897600,0,8.382000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<18.897600,0,10.922000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<13.970000,0,10.922000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<13.462000,0,17.526000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<13.462000,0,21.590000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<13.462000,0,27.178000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<23.622000,0,15.621000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<21.082000,0,13.462000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<23.622000,0,10.922000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<16.002000,0,27.178000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<10.414000,0,26.162000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<10.414000,0,27.178000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<23.622000,0,21.590000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<23.622000,0,5.867400> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<26.670000,0,10.922000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<26.670000,0,13.462000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<26.670000,0,16.002000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<26.670000,0,18.542000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<26.670000,0,21.082000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<26.670000,0,23.622000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<26.670000,0,5.842000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<26.670000,0,8.382000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<26.670000,0,25.654000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<26.670000,0,27.178000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.533400,0.381000,1,16,1,0) translate<14.655800,0,29.972000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<15.773400,0,15.265400> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<15.113000,0,26.289000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<19.456400,0,15.265400> texture{col_thl}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<22.377400,0,17.094200> texture{col_thl}}
#end
#if(pcb_wires=on)
union{
//Signals
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.511200,0.000000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.019200,0.000000,10.566400>}
box{<0,0,-0.203200><0.508000,0.035000,0.203200> rotate<0,0.000000,0> translate<12.511200,0.000000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.192000,0.000000,18.161000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.093000,0.000000,19.062000>}
box{<0,0,-0.127000><1.274206,0.035000,0.127000> rotate<0,-44.997030,0> translate<12.192000,0.000000,18.161000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.303000,0.000000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.093000,0.000000,20.562000>}
box{<0,0,-0.127000><2.531442,0.035000,0.127000> rotate<0,44.997030,0> translate<11.303000,0.000000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.700000,0.000000,18.034000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.228000,0.000000,18.562000>}
box{<0,0,-0.127000><0.746705,0.035000,0.127000> rotate<0,-44.997030,0> translate<12.700000,0.000000,18.034000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.511200,0.000000,14.924200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.335000,0.000000,15.748000>}
box{<0,0,-0.203200><1.165029,0.035000,0.203200> rotate<0,-44.997030,0> translate<12.511200,0.000000,14.924200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.726400,0.000000,14.325600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.741400,0.000000,15.036800>}
box{<0,0,-0.152400><0.711358,0.035000,0.152400> rotate<0,-88.785887,0> translate<13.726400,0.000000,14.325600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.751800,0.000000,12.801600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.751800,0.000000,12.003800>}
box{<0,0,-0.152400><0.797800,0.035000,0.152400> rotate<0,-90.000000,0> translate<13.751800,0.000000,12.003800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.726400,0.000000,14.325600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.751800,0.000000,14.300200>}
box{<0,0,-0.152400><0.035921,0.035000,0.152400> rotate<0,44.997030,0> translate<13.726400,0.000000,14.325600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.893800,0.000000,22.809200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.981600,0.000000,22.809200>}
box{<0,0,-0.152400><0.087800,0.035000,0.152400> rotate<0,0.000000,0> translate<13.893800,0.000000,22.809200> }
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
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.981600,0.000000,22.809200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.728800,0.000000,22.062000>}
box{<0,0,-0.152400><1.056700,0.035000,0.152400> rotate<0,44.997030,0> translate<13.981600,0.000000,22.809200> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.011400,-1.535000,22.580600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.113000,-1.535000,26.289000>}
box{<0,0,-0.203200><3.709792,0.035000,0.203200> rotate<0,-88.424809,0> translate<15.011400,-1.535000,22.580600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.335000,0.000000,15.748000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.290800,0.000000,15.748000>}
box{<0,0,-0.203200><1.955800,0.035000,0.203200> rotate<0,0.000000,0> translate<13.335000,0.000000,15.748000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.453800,0.000000,22.787000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.453800,0.000000,22.112800>}
box{<0,0,-0.152400><0.674200,0.035000,0.152400> rotate<0,-90.000000,0> translate<15.453800,0.000000,22.112800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.113000,0.000000,26.289000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.661400,0.000000,25.740600>}
box{<0,0,-0.152400><0.775555,0.035000,0.152400> rotate<0,44.997030,0> translate<15.113000,0.000000,26.289000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.661400,0.000000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.661400,0.000000,25.740600>}
box{<0,0,-0.152400><0.594600,0.035000,0.152400> rotate<0,90.000000,0> translate<15.661400,0.000000,25.740600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.020800,0.000000,11.734800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.748000,0.000000,11.734800>}
box{<0,0,-0.152400><1.727200,0.035000,0.152400> rotate<0,0.000000,0> translate<14.020800,0.000000,11.734800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.011400,-1.535000,16.002000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.748000,-1.535000,15.265400>}
box{<0,0,-0.203200><1.041710,0.035000,0.203200> rotate<0,44.997030,0> translate<15.011400,-1.535000,16.002000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.051800,0.000000,14.543800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.773400,0.000000,15.265400>}
box{<0,0,-0.152400><1.020497,0.035000,0.152400> rotate<0,-44.997030,0> translate<15.051800,0.000000,14.543800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.290800,0.000000,15.748000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.773400,0.000000,15.265400>}
box{<0,0,-0.203200><0.682499,0.035000,0.203200> rotate<0,44.997030,0> translate<15.290800,0.000000,15.748000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.748000,-1.535000,15.265400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.773400,-1.535000,15.265400>}
box{<0,0,-0.203200><0.025400,0.035000,0.203200> rotate<0,0.000000,0> translate<15.748000,-1.535000,15.265400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.453800,0.000000,16.837000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.951200,0.000000,16.837000>}
box{<0,0,-0.127000><0.497400,0.035000,0.127000> rotate<0,0.000000,0> translate<15.453800,0.000000,16.837000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.951200,0.000000,16.837000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.951200,0.000000,19.304000>}
box{<0,0,-0.152400><2.467000,0.035000,0.152400> rotate<0,90.000000,0> translate<15.951200,0.000000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.953800,0.000000,22.787000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.953800,0.000000,21.564600>}
box{<0,0,-0.152400><1.222400,0.035000,0.152400> rotate<0,-90.000000,0> translate<15.953800,0.000000,21.564600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.728800,0.000000,21.564600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.002000,0.000000,21.564600>}
box{<0,0,-0.152400><1.273200,0.035000,0.152400> rotate<0,0.000000,0> translate<14.728800,0.000000,21.564600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.453800,0.000000,22.112800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.002000,0.000000,21.564600>}
box{<0,0,-0.152400><0.775272,0.035000,0.152400> rotate<0,44.997030,0> translate<15.453800,0.000000,22.112800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.953800,0.000000,21.564600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.002000,0.000000,21.564600>}
box{<0,0,-0.127000><0.048200,0.035000,0.127000> rotate<0,0.000000,0> translate<15.953800,0.000000,21.564600> }
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
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.773400,0.000000,15.265400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.453800,0.000000,15.945800>}
box{<0,0,-0.152400><0.962231,0.035000,0.152400> rotate<0,-44.997030,0> translate<15.773400,0.000000,15.265400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.453800,0.000000,16.837000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.453800,0.000000,15.945800>}
box{<0,0,-0.152400><0.891200,0.035000,0.152400> rotate<0,-90.000000,0> translate<16.453800,0.000000,15.945800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.453800,0.000000,22.787000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.453800,0.000000,21.564600>}
box{<0,0,-0.152400><1.222400,0.035000,0.152400> rotate<0,-90.000000,0> translate<16.453800,0.000000,21.564600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.453800,0.000000,21.564600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.865600,0.000000,21.564600>}
box{<0,0,-0.127000><0.411800,0.035000,0.127000> rotate<0,0.000000,0> translate<16.453800,0.000000,21.564600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.205200,0.000000,14.605000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.953800,0.000000,15.353600>}
box{<0,0,-0.152400><1.058680,0.035000,0.152400> rotate<0,-44.997030,0> translate<16.205200,0.000000,14.605000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.953800,0.000000,16.837000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.953800,0.000000,15.353600>}
box{<0,0,-0.152400><1.483400,0.035000,0.152400> rotate<0,-90.000000,0> translate<16.953800,0.000000,15.353600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.951200,0.000000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.953800,0.000000,19.304000>}
box{<0,0,-0.127000><1.002600,0.035000,0.127000> rotate<0,0.000000,0> translate<15.951200,0.000000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.953800,0.000000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.953800,0.000000,19.812000>}
box{<0,0,-0.127000><0.508000,0.035000,0.127000> rotate<0,90.000000,0> translate<16.953800,0.000000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.953800,0.000000,22.787000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.953800,0.000000,19.812000>}
box{<0,0,-0.152400><2.975000,0.035000,0.152400> rotate<0,-90.000000,0> translate<16.953800,0.000000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.129000,0.000000,35.814000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.272000,0.000000,35.814000>}
box{<0,0,-0.254000><1.143000,0.035000,0.254000> rotate<0,0.000000,0> translate<16.129000,0.000000,35.814000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.272000,0.000000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.272000,0.000000,35.814000>}
box{<0,0,-0.254000><3.810000,0.035000,0.254000> rotate<0,90.000000,0> translate<17.272000,0.000000,35.814000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.449800,0.000000,12.090400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.449800,0.000000,11.938000>}
box{<0,0,-0.127000><0.152400,0.035000,0.127000> rotate<0,-90.000000,0> translate<17.449800,0.000000,11.938000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.449800,0.000000,13.015200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.449800,0.000000,12.090400>}
box{<0,0,-0.152400><0.924800,0.035000,0.152400> rotate<0,-90.000000,0> translate<17.449800,0.000000,12.090400> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.953800,0.000000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.703800,0.000000,19.812000>}
box{<0,0,-0.203200><0.750000,0.035000,0.203200> rotate<0,0.000000,0> translate<16.953800,0.000000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.729200,0.000000,21.564600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.953800,0.000000,21.789200>}
box{<0,0,-0.152400><0.317632,0.035000,0.152400> rotate<0,-44.997030,0> translate<17.729200,0.000000,21.564600> }
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
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.453800,0.000000,16.837000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.453800,0.000000,17.920400>}
box{<0,0,-0.152400><1.083400,0.035000,0.152400> rotate<0,90.000000,0> translate<18.453800,0.000000,17.920400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.453800,0.000000,22.787000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.453800,0.000000,21.703600>}
box{<0,0,-0.152400><1.083400,0.035000,0.152400> rotate<0,-90.000000,0> translate<18.453800,0.000000,21.703600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.627600,0.000000,24.536400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.453800,0.000000,23.710200>}
box{<0,0,-0.152400><1.168423,0.035000,0.152400> rotate<0,44.997030,0> translate<17.627600,0.000000,24.536400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.453800,0.000000,22.787000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.453800,0.000000,23.710200>}
box{<0,0,-0.152400><0.923200,0.035000,0.152400> rotate<0,90.000000,0> translate<18.453800,0.000000,23.710200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.453800,0.000000,17.920400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.592800,0.000000,18.059400>}
box{<0,0,-0.152400><0.196576,0.035000,0.152400> rotate<0,-44.997030,0> translate<18.453800,0.000000,17.920400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.453800,0.000000,21.703600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.592800,0.000000,21.564600>}
box{<0,0,-0.152400><0.196576,0.035000,0.152400> rotate<0,44.997030,0> translate<18.453800,0.000000,21.703600> }
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
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.329400,0.000000,18.211800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.329400,0.000000,18.999200>}
box{<0,0,-0.127000><0.787400,0.035000,0.127000> rotate<0,90.000000,0> translate<19.329400,0.000000,18.999200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.703800,0.000000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.329400,0.000000,19.812000>}
box{<0,0,-0.127000><1.625600,0.035000,0.127000> rotate<0,0.000000,0> translate<17.703800,0.000000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.329400,0.000000,19.075400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.329400,0.000000,19.812000>}
box{<0,0,-0.127000><0.736600,0.035000,0.127000> rotate<0,90.000000,0> translate<19.329400,0.000000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.453800,0.000000,22.787000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.453800,0.000000,21.567200>}
box{<0,0,-0.152400><1.219800,0.035000,0.152400> rotate<0,-90.000000,0> translate<19.453800,0.000000,21.567200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.456400,0.000000,13.015200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.456400,0.000000,11.938000>}
box{<0,0,-0.152400><1.077200,0.035000,0.152400> rotate<0,-90.000000,0> translate<19.456400,0.000000,11.938000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.773400,-1.535000,15.265400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.456400,-1.535000,15.265400>}
box{<0,0,-0.203200><3.683000,0.035000,0.203200> rotate<0,0.000000,0> translate<15.773400,-1.535000,15.265400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.953800,0.000000,15.768000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.456400,0.000000,15.265400>}
box{<0,0,-0.152400><0.710784,0.035000,0.152400> rotate<0,44.997030,0> translate<18.953800,0.000000,15.768000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.456400,0.000000,14.315200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.456400,0.000000,15.265400>}
box{<0,0,-0.152400><0.950200,0.035000,0.152400> rotate<0,90.000000,0> translate<19.456400,0.000000,15.265400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.453800,0.000000,16.837000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.456400,0.000000,16.837000>}
box{<0,0,-0.127000><0.002600,0.035000,0.127000> rotate<0,0.000000,0> translate<19.453800,0.000000,16.837000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.456400,0.000000,16.837000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.456400,0.000000,18.059400>}
box{<0,0,-0.152400><1.222400,0.035000,0.152400> rotate<0,90.000000,0> translate<19.456400,0.000000,18.059400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.456400,0.000000,18.062000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.456400,0.000000,18.059400>}
box{<0,0,-0.127000><0.002600,0.035000,0.127000> rotate<0,-90.000000,0> translate<19.456400,0.000000,18.059400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.453800,0.000000,21.567200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.456400,0.000000,21.564600>}
box{<0,0,-0.152400><0.003677,0.035000,0.152400> rotate<0,44.997030,0> translate<19.453800,0.000000,21.567200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.456400,0.000000,21.564600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.459000,0.000000,21.562000>}
box{<0,0,-0.152400><0.003677,0.035000,0.152400> rotate<0,44.997030,0> translate<19.456400,0.000000,21.564600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.456400,0.000000,11.938000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.481800,0.000000,11.938000>}
box{<0,0,-0.127000><0.025400,0.035000,0.127000> rotate<0,0.000000,0> translate<19.456400,0.000000,11.938000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<18.415000,0.000000,35.814000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<19.558000,0.000000,35.814000>}
box{<0,0,-0.254000><1.143000,0.035000,0.254000> rotate<0,0.000000,0> translate<18.415000,0.000000,35.814000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<19.558000,0.000000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<19.558000,0.000000,35.814000>}
box{<0,0,-0.254000><3.810000,0.035000,0.254000> rotate<0,90.000000,0> translate<19.558000,0.000000,35.814000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.456400,0.000000,15.265400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.953800,0.000000,15.762800>}
box{<0,0,-0.152400><0.703430,0.035000,0.152400> rotate<0,-44.997030,0> translate<19.456400,0.000000,15.265400> }
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
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.456400,0.000000,18.062000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.678800,0.000000,18.062000>}
box{<0,0,-0.152400><1.222400,0.035000,0.152400> rotate<0,0.000000,0> translate<19.456400,0.000000,18.062000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.329400,0.000000,19.075400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.678800,0.000000,19.050000>}
box{<0,0,-0.152400><1.349639,0.035000,0.152400> rotate<0,1.078290,0> translate<19.329400,0.000000,19.075400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.678800,0.000000,19.562000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.678800,0.000000,19.050000>}
box{<0,0,-0.152400><0.512000,0.035000,0.152400> rotate<0,-90.000000,0> translate<20.678800,0.000000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.674800,0.000000,19.558000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.678800,0.000000,19.562000>}
box{<0,0,-0.127000><0.005657,0.035000,0.127000> rotate<0,-44.997030,0> translate<20.674800,0.000000,19.558000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.678800,0.000000,20.562000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.678800,0.000000,20.062000>}
box{<0,0,-0.152400><0.500000,0.035000,0.152400> rotate<0,-90.000000,0> translate<20.678800,0.000000,20.062000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.459000,0.000000,21.562000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.678800,0.000000,21.562000>}
box{<0,0,-0.152400><1.219800,0.035000,0.152400> rotate<0,0.000000,0> translate<19.459000,0.000000,21.562000> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.456400,-1.535000,15.265400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.234400,-1.535000,15.265400>}
box{<0,0,-0.203200><1.778000,0.035000,0.203200> rotate<0,0.000000,0> translate<19.456400,-1.535000,15.265400> }
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
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.655800,0.000000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.844000,0.000000,29.972000>}
box{<0,0,-0.254000><7.188200,0.035000,0.254000> rotate<0,0.000000,0> translate<14.655800,0.000000,29.972000> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.377400,-1.535000,17.094200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.377400,-1.535000,16.408400>}
box{<0,0,-0.203200><0.685800,0.035000,0.203200> rotate<0,-90.000000,0> translate<22.377400,-1.535000,16.408400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.377400,0.000000,18.262600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.377400,0.000000,17.094200>}
box{<0,0,-0.152400><1.168400,0.035000,0.152400> rotate<0,-90.000000,0> translate<22.377400,0.000000,17.094200> }
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
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.377400,0.000000,17.094200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.936200,0.000000,16.535400>}
box{<0,0,-0.152400><0.790263,0.035000,0.152400> rotate<0,44.997030,0> translate<22.377400,0.000000,17.094200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.920200,0.000000,25.156400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.341200,0.000000,25.156400>}
box{<0,0,-0.152400><1.421000,0.035000,0.152400> rotate<0,0.000000,0> translate<21.920200,0.000000,25.156400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.341200,0.000000,25.156400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.356200,0.000000,25.171400>}
box{<0,0,-0.152400><0.021213,0.035000,0.152400> rotate<0,-44.997030,0> translate<23.341200,0.000000,25.156400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.495000,0.000000,17.145000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.723600,0.000000,18.171400>}
box{<0,0,-0.152400><1.051549,0.035000,0.152400> rotate<0,-77.438896,0> translate<23.495000,0.000000,17.145000> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,4.546597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,8.661400>}
box{<0,0,-0.076200><4.114803,0.035000,0.076200> rotate<0,90.000000,0> translate<9.220197,0.000000,8.661400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,4.546597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,30.683200>}
box{<0,0,-0.076200><26.136603,0.035000,0.076200> rotate<0,90.000000,0> translate<9.220197,-1.535000,30.683200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,4.546597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,4.546597>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,4.546597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,4.546597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,4.546597>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,4.546597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,4.572000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,4.572000>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,4.572000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,4.572000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,4.572000>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,4.572000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,4.724400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,4.724400>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,4.724400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,4.724400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,4.724400>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,4.724400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,4.876800>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,4.876800>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,5.029200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,5.029200>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,5.029200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,5.029200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,5.029200>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,5.029200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,5.181600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,5.181600>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,5.181600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,5.181600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,5.181600>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,5.181600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,5.334000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,5.334000>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,5.334000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,5.334000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,5.334000>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,5.334000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,5.486400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,5.486400>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,5.486400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,5.486400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,5.486400>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,5.486400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,5.638800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,5.638800>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,5.638800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,5.638800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,5.638800>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,5.638800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,5.791200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,5.791200>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,5.791200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,5.791200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,5.791200>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,5.791200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,5.943600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,5.943600>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,5.943600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,5.943600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,5.943600>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,5.943600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,6.096000>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,6.096000>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,6.248400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,6.248400>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,6.248400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,6.248400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,6.248400>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,6.248400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,6.400800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,6.400800>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,6.400800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,6.400800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,6.400800>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,6.400800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,6.553200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,6.553200>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,6.553200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,6.553200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,6.553200>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,6.553200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,6.705600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,6.705600>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,6.705600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,6.705600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,6.705600>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,6.705600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,6.858000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,6.858000>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,6.858000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,6.858000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,6.858000>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,6.858000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,7.010400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,7.010400>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,7.010400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,7.010400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,7.010400>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,7.010400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,7.162800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,7.162800>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,7.162800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,7.162800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,7.162800>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,7.162800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,7.315200>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,7.315200>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,7.467600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,7.467600>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,7.467600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,7.467600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,7.467600>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,7.467600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.603109,0.000000,7.620000>}
box{<0,0,-0.076200><10.382913,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,7.620000>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,7.772400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.569000,0.000000,7.772400>}
box{<0,0,-0.076200><10.348803,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,7.772400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,7.772400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,7.772400>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,7.772400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,7.924800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.569000,0.000000,7.924800>}
box{<0,0,-0.076200><10.348803,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,7.924800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,7.924800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,7.924800>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,7.924800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,8.077200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.569000,0.000000,8.077200>}
box{<0,0,-0.076200><10.348803,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,8.077200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,8.077200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,8.077200>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,8.077200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,8.229600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.569000,0.000000,8.229600>}
box{<0,0,-0.076200><10.348803,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,8.229600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,8.229600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,8.229600>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,8.229600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.569000,0.000000,8.382000>}
box{<0,0,-0.076200><10.348803,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,8.382000>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.569000,0.000000,8.534400>}
box{<0,0,-0.076200><10.348803,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,8.534400> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.722741,0.000000,10.388597>}
box{<0,0,-0.076200><2.502544,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,10.388597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,10.515600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.849744,0.000000,10.515600>}
box{<0,0,-0.076200><2.629547,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,10.515600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,10.515600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,10.515600>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,10.515600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,10.668000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.002144,0.000000,10.668000>}
box{<0,0,-0.076200><2.781947,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,10.668000> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.774703,0.000000,12.801597>}
box{<0,0,-0.076200><1.554506,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,12.801597> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.578103,0.000000,20.574000>}
box{<0,0,-0.076200><3.357906,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,20.574000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,20.574000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,20.574000>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,20.574000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.425703,0.000000,20.726400>}
box{<0,0,-0.076200><3.205506,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,20.726400>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,20.878800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.273303,0.000000,20.878800>}
box{<0,0,-0.076200><3.053106,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,20.878800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,20.878800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,20.878800>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,20.878800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,21.031200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.120903,0.000000,21.031200>}
box{<0,0,-0.076200><2.900706,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,21.031200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,21.031200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,21.031200>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,21.031200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,21.183600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.968503,0.000000,21.183600>}
box{<0,0,-0.076200><2.748306,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,21.183600> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,28.956000>}
box{<0,0,-0.076200><5.994403,0.035000,0.076200> rotate<0,90.000000,0> translate<9.220197,0.000000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,22.961597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.778688,0.000000,22.961597>}
box{<0,0,-0.076200><2.558491,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,22.961597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,23.012400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.591269,-1.535000,23.012400>}
box{<0,0,-0.076200><5.371072,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,23.012400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,23.012400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.072800,0.000000,23.012400>}
box{<0,0,-0.076200><7.852603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,23.012400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.595444,-1.535000,23.164800>}
box{<0,0,-0.076200><5.375247,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.072800,0.000000,23.164800>}
box{<0,0,-0.076200><7.852603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,23.317200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.599622,-1.535000,23.317200>}
box{<0,0,-0.076200><5.379425,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,23.317200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,23.317200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.951381,0.000000,23.317200>}
box{<0,0,-0.076200><7.731184,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,23.317200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,23.469600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.603797,-1.535000,23.469600>}
box{<0,0,-0.076200><5.383600,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,23.469600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,23.469600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.798981,0.000000,23.469600>}
box{<0,0,-0.076200><7.578784,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,23.469600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.607972,-1.535000,23.622000>}
box{<0,0,-0.076200><5.387775,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,23.622000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.646581,0.000000,23.622000>}
box{<0,0,-0.076200><7.426384,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,23.622000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,23.774400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.612147,-1.535000,23.774400>}
box{<0,0,-0.076200><5.391950,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,23.774400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,23.774400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.494181,0.000000,23.774400>}
box{<0,0,-0.076200><7.273984,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,23.774400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,23.926800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.616322,-1.535000,23.926800>}
box{<0,0,-0.076200><5.396125,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,23.926800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,23.926800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.341781,0.000000,23.926800>}
box{<0,0,-0.076200><7.121584,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,23.926800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,24.079200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.620497,-1.535000,24.079200>}
box{<0,0,-0.076200><5.400300,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,24.079200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,24.079200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.189381,0.000000,24.079200>}
box{<0,0,-0.076200><6.969184,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,24.079200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,24.231600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.624672,-1.535000,24.231600>}
box{<0,0,-0.076200><5.404475,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,24.231600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,24.231600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.036981,0.000000,24.231600>}
box{<0,0,-0.076200><6.816784,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,24.231600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.628847,-1.535000,24.384000>}
box{<0,0,-0.076200><5.408650,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.884581,0.000000,24.384000>}
box{<0,0,-0.076200><6.664384,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,24.536400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.633022,-1.535000,24.536400>}
box{<0,0,-0.076200><5.412825,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,24.536400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,24.536400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.147709,0.000000,24.536400>}
box{<0,0,-0.076200><5.927513,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,24.536400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,24.688800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.637197,-1.535000,24.688800>}
box{<0,0,-0.076200><5.417000,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,24.688800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,24.688800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.082800,0.000000,24.688800>}
box{<0,0,-0.076200><5.862603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,24.688800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,24.841200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.641375,-1.535000,24.841200>}
box{<0,0,-0.076200><5.421178,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,24.841200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,24.841200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.082800,0.000000,24.841200>}
box{<0,0,-0.076200><5.862603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,24.841200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.645550,-1.535000,24.993600>}
box{<0,0,-0.076200><5.425353,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.082800,0.000000,24.993600>}
box{<0,0,-0.076200><5.862603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.649725,-1.535000,25.146000>}
box{<0,0,-0.076200><5.429528,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.082800,0.000000,25.146000>}
box{<0,0,-0.076200><5.862603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,25.298400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.653900,-1.535000,25.298400>}
box{<0,0,-0.076200><5.433703,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,25.298400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,25.298400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.082800,0.000000,25.298400>}
box{<0,0,-0.076200><5.862603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,25.298400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,25.450800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.658075,-1.535000,25.450800>}
box{<0,0,-0.076200><5.437878,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,25.450800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,25.450800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.082800,0.000000,25.450800>}
box{<0,0,-0.076200><5.862603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,25.450800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.662250,-1.535000,25.603200>}
box{<0,0,-0.076200><5.442053,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.082800,0.000000,25.603200>}
box{<0,0,-0.076200><5.862603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,25.755600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.666425,-1.535000,25.755600>}
box{<0,0,-0.076200><5.446228,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,25.755600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,25.755600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.892056,0.000000,25.755600>}
box{<0,0,-0.076200><5.671859,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,25.755600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.670600,-1.535000,25.908000>}
box{<0,0,-0.076200><5.450403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.739656,0.000000,25.908000>}
box{<0,0,-0.076200><5.519459,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,25.908000> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.005800,0.000000,27.584400>}
box{<0,0,-0.076200><11.785603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,27.584400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,27.584400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,27.584400>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,27.584400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,27.736800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.005800,0.000000,27.736800>}
box{<0,0,-0.076200><11.785603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,27.736800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,27.736800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,27.736800>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,27.736800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,27.889200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.005800,0.000000,27.889200>}
box{<0,0,-0.076200><11.785603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,27.889200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,27.889200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,27.889200>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,27.889200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.005800,0.000000,28.041600>}
box{<0,0,-0.076200><11.785603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,28.041600>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.005800,0.000000,28.194000>}
box{<0,0,-0.076200><11.785603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,28.194000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,28.194000>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,28.194000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,28.346400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.005800,0.000000,28.346400>}
box{<0,0,-0.076200><11.785603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,28.346400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,28.346400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,28.346400>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,28.346400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,28.498800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.005800,0.000000,28.498800>}
box{<0,0,-0.076200><11.785603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,28.498800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,28.498800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,28.498800>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,28.498800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,28.651200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.005800,0.000000,28.651200>}
box{<0,0,-0.076200><11.785603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,28.651200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,28.651200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,28.651200>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,28.651200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,28.803600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.005800,0.000000,28.803600>}
box{<0,0,-0.076200><11.785603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,28.803600> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.730503,0.000000,20.421600>}
box{<0,0,-0.076200><1.991228,0.035000,0.076200> rotate<0,0.000000,0> translate<10.739275,0.000000,20.421600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.739281,0.000000,20.421597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.778688,0.000000,20.421597>}
box{<0,0,-0.076200><1.039406,0.035000,0.076200> rotate<0,0.000000,0> translate<10.739281,0.000000,20.421597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.774703,0.000000,12.801597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.587509,0.000000,13.614400>}
box{<0,0,-0.076200><1.149479,0.035000,0.076200> rotate<0,-44.996920,0> translate<10.774703,0.000000,12.801597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.722741,0.000000,10.388597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.079400,0.000000,10.745256>}
box{<0,0,-0.076200><0.504393,0.035000,0.076200> rotate<0,-44.997030,0> translate<11.722741,0.000000,10.388597> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.848194,0.000000,21.303909>}
box{<0,0,-0.076200><0.098299,0.035000,0.076200> rotate<0,-44.998318,0> translate<11.778688,0.000000,21.234400> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.569000,0.000000,8.686800>}
box{<0,0,-0.076200><7.764913,0.035000,0.076200> rotate<0,0.000000,0> translate<11.804088,0.000000,8.686800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.829488,0.000000,11.125200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.079400,0.000000,11.125200>}
box{<0,0,-0.076200><0.249912,0.035000,0.076200> rotate<0,0.000000,0> translate<11.829488,0.000000,11.125200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.848194,0.000000,21.303909>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.734509,0.000000,20.417597>}
box{<0,0,-0.076200><1.253437,0.035000,0.076200> rotate<0,44.996929,0> translate<11.848194,0.000000,21.303909> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.880284,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.072800,0.000000,22.860000>}
box{<0,0,-0.076200><5.192516,0.035000,0.076200> rotate<0,0.000000,0> translate<11.880284,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,8.795309>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,9.357141>}
box{<0,0,-0.076200><0.561831,0.035000,0.076200> rotate<0,90.000000,0> translate<11.912597,0.000000,9.357141> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,8.839200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.569000,0.000000,8.839200>}
box{<0,0,-0.076200><7.656403,0.035000,0.076200> rotate<0,0.000000,0> translate<11.912597,0.000000,8.839200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,8.991600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.617113,0.000000,8.991600>}
box{<0,0,-0.076200><7.704516,0.035000,0.076200> rotate<0,0.000000,0> translate<11.912597,0.000000,8.991600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,9.144000>}
box{<0,0,-0.076200><15.062203,0.035000,0.076200> rotate<0,0.000000,0> translate<11.912597,0.000000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,9.296400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,9.296400>}
box{<0,0,-0.076200><15.062203,0.035000,0.076200> rotate<0,0.000000,0> translate<11.912597,0.000000,9.296400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,9.357141>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.408884,0.000000,9.853428>}
box{<0,0,-0.076200><0.701857,0.035000,0.076200> rotate<0,-44.997030,0> translate<11.912597,0.000000,9.357141> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.102109,0.000000,22.250400>}
box{<0,0,-0.076200><5.189513,0.035000,0.076200> rotate<0,0.000000,0> translate<11.912597,0.000000,22.250400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,22.402800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.085200,0.000000,22.402800>}
box{<0,0,-0.076200><5.172603,0.035000,0.076200> rotate<0,0.000000,0> translate<11.912597,0.000000,22.402800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,22.555200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.085200,0.000000,22.555200>}
box{<0,0,-0.076200><5.172603,0.035000,0.076200> rotate<0,0.000000,0> translate<11.912597,0.000000,22.555200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,22.707600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.072800,0.000000,22.707600>}
box{<0,0,-0.076200><5.160203,0.035000,0.076200> rotate<0,0.000000,0> translate<11.912597,0.000000,22.707600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.932891,0.000000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.079400,0.000000,12.954000>}
box{<0,0,-0.076200><0.146509,0.035000,0.076200> rotate<0,0.000000,0> translate<11.932891,0.000000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.004256,0.000000,9.448800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,9.448800>}
box{<0,0,-0.076200><14.970544,0.035000,0.076200> rotate<0,0.000000,0> translate<12.004256,0.000000,9.448800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.059891,0.000000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.025200,0.000000,22.098000>}
box{<0,0,-0.076200><7.965309,0.035000,0.076200> rotate<0,0.000000,0> translate<12.059891,0.000000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.079400,0.000000,13.100509>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.079400,0.000000,10.745256>}
box{<0,0,-0.076200><2.355253,0.035000,0.076200> rotate<0,-90.000000,0> translate<12.079400,0.000000,10.745256> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.156656,0.000000,9.601200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,9.601200>}
box{<0,0,-0.076200><14.818144,0.035000,0.076200> rotate<0,0.000000,0> translate<12.156656,0.000000,9.601200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.212291,0.000000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.025200,0.000000,21.945600>}
box{<0,0,-0.076200><7.812909,0.035000,0.076200> rotate<0,0.000000,0> translate<12.212291,0.000000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.309056,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.508709,0.000000,9.753600>}
box{<0,0,-0.076200><0.199653,0.035000,0.076200> rotate<0,0.000000,0> translate<12.309056,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.364691,0.000000,21.793200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.059309,0.000000,21.793200>}
box{<0,0,-0.076200><7.694619,0.035000,0.076200> rotate<0,0.000000,0> translate<12.364691,0.000000,21.793200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.408884,0.000000,9.853428>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.524509,0.000000,9.737800>}
box{<0,0,-0.076200><0.163521,0.035000,0.076200> rotate<0,44.997804,0> translate<12.408884,0.000000,9.853428> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.517091,0.000000,21.640800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.853313,0.000000,21.640800>}
box{<0,0,-0.076200><9.336222,0.035000,0.076200> rotate<0,0.000000,0> translate<12.517091,0.000000,21.640800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.524509,0.000000,9.737800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.513888,0.000000,9.737800>}
box{<0,0,-0.076200><0.989378,0.035000,0.076200> rotate<0,0.000000,0> translate<12.524509,0.000000,9.737800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.669491,0.000000,21.488400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.851200,0.000000,21.488400>}
box{<0,0,-0.076200><9.181709,0.035000,0.076200> rotate<0,0.000000,0> translate<12.669491,0.000000,21.488400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.821891,0.000000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.064512,0.000000,21.336000>}
box{<0,0,-0.076200><7.242622,0.035000,0.076200> rotate<0,0.000000,0> translate<12.821891,0.000000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.942997,0.000000,11.394997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.942997,0.000000,14.745341>}
box{<0,0,-0.076200><3.350344,0.035000,0.076200> rotate<0,90.000000,0> translate<12.942997,0.000000,14.745341> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.942997,0.000000,11.394997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.513888,0.000000,11.394997>}
box{<0,0,-0.076200><0.570891,0.035000,0.076200> rotate<0,0.000000,0> translate<12.942997,0.000000,11.394997> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.670800,0.000000,13.563600>}
box{<0,0,-0.076200><1.727803,0.035000,0.076200> rotate<0,0.000000,0> translate<12.942997,0.000000,13.563600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.942997,0.000000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.512709,0.000000,13.716000>}
box{<0,0,-0.076200><1.569712,0.035000,0.076200> rotate<0,0.000000,0> translate<12.942997,0.000000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.942997,0.000000,13.868400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.473200,0.000000,13.868400>}
box{<0,0,-0.076200><1.530203,0.035000,0.076200> rotate<0,0.000000,0> translate<12.942997,0.000000,13.868400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.942997,0.000000,14.020800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.473200,0.000000,14.020800>}
box{<0,0,-0.076200><1.530203,0.035000,0.076200> rotate<0,0.000000,0> translate<12.942997,0.000000,14.020800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.942997,0.000000,14.173200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.473200,0.000000,14.173200>}
box{<0,0,-0.076200><1.530203,0.035000,0.076200> rotate<0,0.000000,0> translate<12.942997,0.000000,14.173200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.942997,0.000000,14.325600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.473200,0.000000,14.325600>}
box{<0,0,-0.076200><1.530203,0.035000,0.076200> rotate<0,0.000000,0> translate<12.942997,0.000000,14.325600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.942997,0.000000,14.478000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.473200,0.000000,14.478000>}
box{<0,0,-0.076200><1.530203,0.035000,0.076200> rotate<0,0.000000,0> translate<12.942997,0.000000,14.478000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.942997,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.473200,0.000000,14.630400>}
box{<0,0,-0.076200><1.530203,0.035000,0.076200> rotate<0,0.000000,0> translate<12.942997,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.942997,0.000000,14.745341>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.513856,0.000000,15.316200>}
box{<0,0,-0.076200><0.807317,0.035000,0.076200> rotate<0,-44.997030,0> translate<12.942997,0.000000,14.745341> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.974291,0.000000,21.183600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.025200,0.000000,21.183600>}
box{<0,0,-0.076200><7.050909,0.035000,0.076200> rotate<0,0.000000,0> translate<12.974291,0.000000,21.183600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.980456,0.000000,14.782800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.473200,0.000000,14.782800>}
box{<0,0,-0.076200><1.492744,0.035000,0.076200> rotate<0,0.000000,0> translate<12.980456,0.000000,14.782800> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.072800,0.000000,16.306800>}
box{<0,0,-0.076200><3.017203,0.035000,0.076200> rotate<0,0.000000,0> translate<13.055597,0.000000,16.306800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.055597,0.000000,16.459200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.072800,0.000000,16.459200>}
box{<0,0,-0.076200><3.017203,0.035000,0.076200> rotate<0,0.000000,0> translate<13.055597,0.000000,16.459200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.055597,0.000000,16.611600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.072800,0.000000,16.611600>}
box{<0,0,-0.076200><3.017203,0.035000,0.076200> rotate<0,0.000000,0> translate<13.055597,0.000000,16.611600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.055597,0.000000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.072800,0.000000,16.764000>}
box{<0,0,-0.076200><3.017203,0.035000,0.076200> rotate<0,0.000000,0> translate<13.055597,0.000000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.055597,0.000000,16.916400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.072800,0.000000,16.916400>}
box{<0,0,-0.076200><3.017203,0.035000,0.076200> rotate<0,0.000000,0> translate<13.055597,0.000000,16.916400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.055597,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.085200,0.000000,17.068800>}
box{<0,0,-0.076200><3.029603,0.035000,0.076200> rotate<0,0.000000,0> translate<13.055597,0.000000,17.068800> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.126691,0.000000,21.031200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.025200,0.000000,21.031200>}
box{<0,0,-0.076200><6.898509,0.035000,0.076200> rotate<0,0.000000,0> translate<13.126691,0.000000,21.031200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.132856,0.000000,14.935200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.563512,0.000000,14.935200>}
box{<0,0,-0.076200><1.430656,0.035000,0.076200> rotate<0,0.000000,0> translate<13.132856,0.000000,14.935200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.152094,0.000000,17.983200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.075200,0.000000,17.983200>}
box{<0,0,-0.076200><0.923106,0.035000,0.076200> rotate<0,0.000000,0> translate<13.152094,0.000000,17.983200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.156141,0.000000,16.179797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.469656,0.000000,16.179797>}
box{<0,0,-0.076200><2.313516,0.035000,0.076200> rotate<0,0.000000,0> translate<13.156141,0.000000,16.179797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.173200,0.000000,12.256909>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.307109,0.000000,12.123000>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<13.173200,0.000000,12.256909> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.173200,0.000000,13.346288>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.173200,0.000000,12.256909>}
box{<0,0,-0.076200><1.089378,0.035000,0.076200> rotate<0,-90.000000,0> translate<13.173200,0.000000,12.256909> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.173200,0.000000,13.346288>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.307109,0.000000,13.480197>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<13.173200,0.000000,13.346288> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.240294,0.000000,20.917597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.196112,0.000000,20.917597>}
box{<0,0,-0.076200><0.955819,0.035000,0.076200> rotate<0,0.000000,0> translate<13.240294,0.000000,20.917597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.285256,0.000000,15.087600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.056788,0.000000,15.087600>}
box{<0,0,-0.076200><1.771531,0.035000,0.076200> rotate<0,0.000000,0> translate<13.285256,0.000000,15.087600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.304494,0.000000,18.135600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.075200,0.000000,18.135600>}
box{<0,0,-0.076200><0.770706,0.035000,0.076200> rotate<0,0.000000,0> translate<13.304494,0.000000,18.135600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.307109,0.000000,12.123000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.370800,0.000000,12.123000>}
box{<0,0,-0.076200><0.063691,0.035000,0.076200> rotate<0,0.000000,0> translate<13.307109,0.000000,12.123000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.307109,0.000000,13.480197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.196487,0.000000,13.480197>}
box{<0,0,-0.076200><0.889378,0.035000,0.076200> rotate<0,0.000000,0> translate<13.307109,0.000000,13.480197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.370800,0.000000,11.845981>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.639800,0.000000,11.576981>}
box{<0,0,-0.076200><0.380423,0.035000,0.076200> rotate<0,44.997030,0> translate<13.370800,0.000000,11.845981> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.370800,0.000000,12.123000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.370800,0.000000,11.845981>}
box{<0,0,-0.076200><0.277019,0.035000,0.076200> rotate<0,-90.000000,0> translate<13.370800,0.000000,11.845981> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.375294,0.000000,18.206400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.075200,0.000000,18.206400>}
box{<0,0,-0.076200><0.699906,0.035000,0.076200> rotate<0,0.000000,0> translate<13.375294,0.000000,18.206400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.437656,0.000000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.188141,0.000000,15.240000>}
box{<0,0,-0.076200><1.750484,0.035000,0.076200> rotate<0,0.000000,0> translate<13.437656,0.000000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.513856,0.000000,15.316200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.111941,0.000000,15.316200>}
box{<0,0,-0.076200><1.598084,0.035000,0.076200> rotate<0,0.000000,0> translate<13.513856,0.000000,15.316200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.513888,0.000000,9.737800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.647797,0.000000,9.871709>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<13.513888,0.000000,9.737800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.513888,0.000000,11.394997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.647797,0.000000,11.261088>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<13.513888,0.000000,11.394997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.529688,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,9.753600>}
box{<0,0,-0.076200><13.445113,0.035000,0.076200> rotate<0,0.000000,0> translate<13.529688,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.631284,0.000000,11.277600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.903113,0.000000,11.277600>}
box{<0,0,-0.076200><2.271828,0.035000,0.076200> rotate<0,0.000000,0> translate<13.631284,0.000000,11.277600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.639800,0.000000,11.576981>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.862981,0.000000,11.353800>}
box{<0,0,-0.076200><0.315626,0.035000,0.076200> rotate<0,44.997030,0> translate<13.639800,0.000000,11.576981> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.647797,0.000000,9.871709>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.647797,0.000000,11.261088>}
box{<0,0,-0.076200><1.389378,0.035000,0.076200> rotate<0,90.000000,0> translate<13.647797,0.000000,11.261088> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.647797,0.000000,9.906000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.917109,0.000000,9.906000>}
box{<0,0,-0.076200><2.269312,0.035000,0.076200> rotate<0,0.000000,0> translate<13.647797,0.000000,9.906000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.647797,0.000000,10.058400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.869000,0.000000,10.058400>}
box{<0,0,-0.076200><2.221203,0.035000,0.076200> rotate<0,0.000000,0> translate<13.647797,0.000000,10.058400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.647797,0.000000,10.210800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.869000,0.000000,10.210800>}
box{<0,0,-0.076200><2.221203,0.035000,0.076200> rotate<0,0.000000,0> translate<13.647797,0.000000,10.210800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.647797,0.000000,10.363200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.869000,0.000000,10.363200>}
box{<0,0,-0.076200><2.221203,0.035000,0.076200> rotate<0,0.000000,0> translate<13.647797,0.000000,10.363200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.647797,0.000000,10.515600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.869000,0.000000,10.515600>}
box{<0,0,-0.076200><2.221203,0.035000,0.076200> rotate<0,0.000000,0> translate<13.647797,0.000000,10.515600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.647797,0.000000,10.668000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.869000,0.000000,10.668000>}
box{<0,0,-0.076200><2.221203,0.035000,0.076200> rotate<0,0.000000,0> translate<13.647797,0.000000,10.668000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.647797,0.000000,10.820400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.869000,0.000000,10.820400>}
box{<0,0,-0.076200><2.221203,0.035000,0.076200> rotate<0,0.000000,0> translate<13.647797,0.000000,10.820400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.647797,0.000000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.869000,0.000000,10.972800>}
box{<0,0,-0.076200><2.221203,0.035000,0.076200> rotate<0,0.000000,0> translate<13.647797,0.000000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.647797,0.000000,11.125200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.869000,0.000000,11.125200>}
box{<0,0,-0.076200><2.221203,0.035000,0.076200> rotate<0,0.000000,0> translate<13.647797,0.000000,11.125200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.862981,0.000000,11.353800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.905816,0.000000,11.353800>}
box{<0,0,-0.076200><2.042834,0.035000,0.076200> rotate<0,0.000000,0> translate<13.862981,0.000000,11.353800> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.171409,0.000000,12.123000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.178616,0.000000,12.115797>}
box{<0,0,-0.076200><0.010189,0.035000,0.076200> rotate<0,44.984605,0> translate<14.171409,0.000000,12.123000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.171409,0.000000,12.123000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.196487,0.000000,12.123000>}
box{<0,0,-0.076200><0.025078,0.035000,0.076200> rotate<0,0.000000,0> translate<14.171409,0.000000,12.123000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.178616,0.000000,12.115797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.590181,0.000000,12.115797>}
box{<0,0,-0.076200><1.411566,0.035000,0.076200> rotate<0,0.000000,0> translate<14.178616,0.000000,12.115797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.196112,0.000000,20.917597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.209109,0.000000,20.930597>}
box{<0,0,-0.076200><0.018383,0.035000,0.076200> rotate<0,-45.003917,0> translate<14.196112,0.000000,20.917597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.196487,0.000000,12.123000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.330397,0.000000,12.256909>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<14.196487,0.000000,12.123000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.196487,0.000000,13.480197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.330397,0.000000,13.346288>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<14.196487,0.000000,13.480197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.209109,0.000000,17.193400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.248488,0.000000,17.193400>}
box{<0,0,-0.076200><1.039378,0.035000,0.076200> rotate<0,0.000000,0> translate<14.209109,0.000000,17.193400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.209109,0.000000,20.930597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.248488,0.000000,20.930597>}
box{<0,0,-0.076200><1.039378,0.035000,0.076200> rotate<0,0.000000,0> translate<14.209109,0.000000,20.930597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.265484,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.538113,0.000000,13.411200>}
box{<0,0,-0.076200><0.272628,0.035000,0.076200> rotate<0,0.000000,0> translate<14.265484,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.265488,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.538109,0.000000,12.192000>}
box{<0,0,-0.076200><0.272622,0.035000,0.076200> rotate<0,0.000000,0> translate<14.265488,0.000000,12.192000> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.892056,0.000000,25.755600>}
box{<0,0,-0.076200><0.441880,0.035000,0.076200> rotate<0,44.997030,0> translate<14.579600,0.000000,26.068056> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.670800,0.000000,13.621600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.670800,0.000000,13.480197>}
box{<0,0,-0.076200><0.141403,0.035000,0.076200> rotate<0,-90.000000,0> translate<14.670800,0.000000,13.480197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.892056,0.000000,25.755600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.107584,0.000000,25.755600>}
box{<0,0,-0.076200><0.215528,0.035000,0.076200> rotate<0,0.000000,0> translate<14.892056,0.000000,25.755600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.892056,0.000000,26.822397>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.333941,0.000000,26.822397>}
box{<0,0,-0.076200><0.441884,0.035000,0.076200> rotate<0,0.000000,0> translate<14.892056,0.000000,26.822397> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.892056,-1.535000,26.822397>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.333941,-1.535000,26.822397>}
box{<0,0,-0.076200><0.441884,0.035000,0.076200> rotate<0,0.000000,0> translate<14.892056,-1.535000,26.822397> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.947981,0.000000,14.978797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.198666,0.000000,15.229478>}
box{<0,0,-0.076200><0.354519,0.035000,0.076200> rotate<0,-44.996673,0> translate<14.947981,0.000000,14.978797> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.111941,0.000000,15.316200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.198666,0.000000,15.229478>}
box{<0,0,-0.076200><0.122645,0.035000,0.076200> rotate<0,44.995998,0> translate<15.111941,0.000000,15.316200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.216709,0.000000,24.467400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.801181,0.000000,24.467400>}
box{<0,0,-0.076200><0.584472,0.035000,0.076200> rotate<0,0.000000,0> translate<15.216709,0.000000,24.467400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.240000,-1.535000,15.044456>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.552456,-1.535000,14.732000>}
box{<0,0,-0.076200><0.441880,0.035000,0.076200> rotate<0,44.997030,0> translate<15.240000,-1.535000,15.044456> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.240000,-1.535000,15.162741>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.240000,-1.535000,15.044456>}
box{<0,0,-0.076200><0.118284,0.035000,0.076200> rotate<0,-90.000000,0> translate<15.240000,-1.535000,15.044456> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.248488,0.000000,17.193400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.382397,0.000000,17.327309>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<15.248488,0.000000,17.193400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.248488,0.000000,20.930597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.382397,0.000000,20.796688>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<15.248488,0.000000,20.930597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.276288,0.000000,17.221200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.085200,0.000000,17.221200>}
box{<0,0,-0.076200><0.808912,0.035000,0.076200> rotate<0,0.000000,0> translate<15.276288,0.000000,17.221200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.300284,0.000000,20.878800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.025200,0.000000,20.878800>}
box{<0,0,-0.076200><4.724916,0.035000,0.076200> rotate<0,0.000000,0> translate<15.300284,0.000000,20.878800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.333941,0.000000,26.822397>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.646397,0.000000,26.509941>}
box{<0,0,-0.076200><0.441880,0.035000,0.076200> rotate<0,44.997030,0> translate<15.333941,0.000000,26.822397> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.333941,-1.535000,26.822397>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.646397,-1.535000,26.509941>}
box{<0,0,-0.076200><0.441880,0.035000,0.076200> rotate<0,44.997030,0> translate<15.333941,-1.535000,26.822397> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.367084,0.000000,17.812000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.382397,0.000000,17.796688>}
box{<0,0,-0.076200><0.021655,0.035000,0.076200> rotate<0,44.997030,0> translate<15.367084,0.000000,17.812000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.367084,0.000000,17.812000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.382397,0.000000,17.827309>}
box{<0,0,-0.076200><0.021653,0.035000,0.076200> rotate<0,-44.991183,0> translate<15.367084,0.000000,17.812000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.367084,0.000000,18.312000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.382397,0.000000,18.296688>}
box{<0,0,-0.076200><0.021655,0.035000,0.076200> rotate<0,44.997030,0> translate<15.367084,0.000000,18.312000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.367084,0.000000,18.312000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.382397,0.000000,18.327309>}
box{<0,0,-0.076200><0.021653,0.035000,0.076200> rotate<0,-44.991183,0> translate<15.367084,0.000000,18.312000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.367084,0.000000,18.812000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.382397,0.000000,18.796688>}
box{<0,0,-0.076200><0.021655,0.035000,0.076200> rotate<0,44.997030,0> translate<15.367084,0.000000,18.812000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.367084,0.000000,18.812000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.382397,0.000000,18.827309>}
box{<0,0,-0.076200><0.021653,0.035000,0.076200> rotate<0,-44.991183,0> translate<15.367084,0.000000,18.812000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.367084,0.000000,19.312000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.382397,0.000000,19.296688>}
box{<0,0,-0.076200><0.021655,0.035000,0.076200> rotate<0,44.997030,0> translate<15.367084,0.000000,19.312000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.367084,0.000000,19.312000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.382397,0.000000,19.327309>}
box{<0,0,-0.076200><0.021653,0.035000,0.076200> rotate<0,-44.991183,0> translate<15.367084,0.000000,19.312000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.367084,0.000000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.382397,0.000000,19.796688>}
box{<0,0,-0.076200><0.021655,0.035000,0.076200> rotate<0,44.997030,0> translate<15.367084,0.000000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.367084,0.000000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.382397,0.000000,19.827309>}
box{<0,0,-0.076200><0.021653,0.035000,0.076200> rotate<0,-44.991183,0> translate<15.367084,0.000000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.367084,0.000000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.040509,0.000000,19.812000>}
box{<0,0,-0.076200><4.673425,0.035000,0.076200> rotate<0,0.000000,0> translate<15.367084,0.000000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.367084,0.000000,20.312000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.382397,0.000000,20.296688>}
box{<0,0,-0.076200><0.021655,0.035000,0.076200> rotate<0,44.997030,0> translate<15.367084,0.000000,20.312000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.367084,0.000000,20.312000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.382397,0.000000,20.327309>}
box{<0,0,-0.076200><0.021653,0.035000,0.076200> rotate<0,-44.991183,0> translate<15.367084,0.000000,20.312000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.382397,0.000000,17.327309>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.382397,0.000000,17.796688>}
box{<0,0,-0.076200><0.469378,0.035000,0.076200> rotate<0,90.000000,0> translate<15.382397,0.000000,17.796688> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.382397,0.000000,17.373600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.102113,0.000000,17.373600>}
box{<0,0,-0.076200><0.719716,0.035000,0.076200> rotate<0,0.000000,0> translate<15.382397,0.000000,17.373600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.382397,0.000000,17.526000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.025200,0.000000,17.526000>}
box{<0,0,-0.076200><4.642803,0.035000,0.076200> rotate<0,0.000000,0> translate<15.382397,0.000000,17.526000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.382397,0.000000,17.678400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.025200,0.000000,17.678400>}
box{<0,0,-0.076200><4.642803,0.035000,0.076200> rotate<0,0.000000,0> translate<15.382397,0.000000,17.678400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.382397,0.000000,17.827309>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.382397,0.000000,18.296688>}
box{<0,0,-0.076200><0.469378,0.035000,0.076200> rotate<0,90.000000,0> translate<15.382397,0.000000,18.296688> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.382397,0.000000,17.830800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.059313,0.000000,17.830800>}
box{<0,0,-0.076200><4.676916,0.035000,0.076200> rotate<0,0.000000,0> translate<15.382397,0.000000,17.830800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.382397,0.000000,17.983200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.762381,0.000000,17.983200>}
box{<0,0,-0.076200><6.379984,0.035000,0.076200> rotate<0,0.000000,0> translate<15.382397,0.000000,17.983200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.382397,0.000000,18.135600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.609981,0.000000,18.135600>}
box{<0,0,-0.076200><6.227584,0.035000,0.076200> rotate<0,0.000000,0> translate<15.382397,0.000000,18.135600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.382397,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.064509,0.000000,18.288000>}
box{<0,0,-0.076200><4.682112,0.035000,0.076200> rotate<0,0.000000,0> translate<15.382397,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.382397,0.000000,18.327309>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.382397,0.000000,18.796688>}
box{<0,0,-0.076200><0.469378,0.035000,0.076200> rotate<0,90.000000,0> translate<15.382397,0.000000,18.796688> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.382397,0.000000,18.440400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.025200,0.000000,18.440400>}
box{<0,0,-0.076200><4.642803,0.035000,0.076200> rotate<0,0.000000,0> translate<15.382397,0.000000,18.440400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.382397,0.000000,18.592800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.025200,0.000000,18.592800>}
box{<0,0,-0.076200><4.642803,0.035000,0.076200> rotate<0,0.000000,0> translate<15.382397,0.000000,18.592800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.382397,0.000000,18.745200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.025200,0.000000,18.745200>}
box{<0,0,-0.076200><4.642803,0.035000,0.076200> rotate<0,0.000000,0> translate<15.382397,0.000000,18.745200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.382397,0.000000,18.827309>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.382397,0.000000,19.296688>}
box{<0,0,-0.076200><0.469378,0.035000,0.076200> rotate<0,90.000000,0> translate<15.382397,0.000000,19.296688> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.382397,0.000000,18.897600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.126113,0.000000,18.897600>}
box{<0,0,-0.076200><4.743716,0.035000,0.076200> rotate<0,0.000000,0> translate<15.382397,0.000000,18.897600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.382397,0.000000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.045000,0.000000,19.050000>}
box{<0,0,-0.076200><7.662603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.382397,0.000000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.382397,0.000000,19.202400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.045000,0.000000,19.202400>}
box{<0,0,-0.076200><7.662603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.382397,0.000000,19.202400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.382397,0.000000,19.327309>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.382397,0.000000,19.796688>}
box{<0,0,-0.076200><0.469378,0.035000,0.076200> rotate<0,90.000000,0> translate<15.382397,0.000000,19.796688> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.382397,0.000000,19.354800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.045000,0.000000,19.354800>}
box{<0,0,-0.076200><7.662603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.382397,0.000000,19.354800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.382397,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.045000,0.000000,19.507200>}
box{<0,0,-0.076200><7.662603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.382397,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.382397,0.000000,19.659600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.045000,0.000000,19.659600>}
box{<0,0,-0.076200><7.662603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.382397,0.000000,19.659600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.382397,0.000000,19.827309>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.382397,0.000000,20.296688>}
box{<0,0,-0.076200><0.469378,0.035000,0.076200> rotate<0,90.000000,0> translate<15.382397,0.000000,20.296688> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.382397,0.000000,19.964400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.025200,0.000000,19.964400>}
box{<0,0,-0.076200><4.642803,0.035000,0.076200> rotate<0,0.000000,0> translate<15.382397,0.000000,19.964400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.382397,0.000000,20.116800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.025200,0.000000,20.116800>}
box{<0,0,-0.076200><4.642803,0.035000,0.076200> rotate<0,0.000000,0> translate<15.382397,0.000000,20.116800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.382397,0.000000,20.269200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.025200,0.000000,20.269200>}
box{<0,0,-0.076200><4.642803,0.035000,0.076200> rotate<0,0.000000,0> translate<15.382397,0.000000,20.269200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.382397,0.000000,20.327309>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.382397,0.000000,20.796688>}
box{<0,0,-0.076200><0.469378,0.035000,0.076200> rotate<0,90.000000,0> translate<15.382397,0.000000,20.796688> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.382397,0.000000,20.421600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.025200,0.000000,20.421600>}
box{<0,0,-0.076200><4.642803,0.035000,0.076200> rotate<0,0.000000,0> translate<15.382397,0.000000,20.421600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.382397,0.000000,20.574000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.025200,0.000000,20.574000>}
box{<0,0,-0.076200><4.642803,0.035000,0.076200> rotate<0,0.000000,0> translate<15.382397,0.000000,20.574000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.382397,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.025200,0.000000,20.726400>}
box{<0,0,-0.076200><4.642803,0.035000,0.076200> rotate<0,0.000000,0> translate<15.382397,0.000000,20.726400> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.469656,0.000000,16.179797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.809319,0.000000,15.840131>}
box{<0,0,-0.076200><0.480358,0.035000,0.076200> rotate<0,44.997294,0> translate<15.469656,0.000000,16.179797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.471891,-1.535000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,23.622000>}
box{<0,0,-0.076200><11.502909,0.035000,0.076200> rotate<0,0.000000,0> translate<15.471891,-1.535000,23.622000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.476066,-1.535000,23.774400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,23.774400>}
box{<0,0,-0.076200><11.498734,0.035000,0.076200> rotate<0,0.000000,0> translate<15.476066,-1.535000,23.774400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.480241,-1.535000,23.926800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,23.926800>}
box{<0,0,-0.076200><11.494559,0.035000,0.076200> rotate<0,0.000000,0> translate<15.480241,-1.535000,23.926800> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.495053,0.000000,16.154400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.072800,0.000000,16.154400>}
box{<0,0,-0.076200><0.577747,0.035000,0.076200> rotate<0,0.000000,0> translate<15.495053,0.000000,16.154400> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.778813,0.000000,14.732000>}
box{<0,0,-0.076200><0.209894,0.035000,0.076200> rotate<0,-44.997633,0> translate<15.630397,0.000000,14.583581> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.042397,0.000000,25.898416>}
box{<0,0,-0.076200><0.560026,0.035000,0.076200> rotate<0,44.996804,0> translate<15.646397,0.000000,26.294412> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.646397,0.000000,26.365200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780000,0.000000,26.365200>}
box{<0,0,-0.076200><2.133603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.646397,0.000000,26.365200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.646397,-1.535000,26.365200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,26.365200>}
box{<0,0,-0.076200><11.328403,0.035000,0.076200> rotate<0,0.000000,0> translate<15.646397,-1.535000,26.365200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.647453,0.000000,16.002000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.971188,0.000000,16.002000>}
box{<0,0,-0.076200><0.323734,0.035000,0.076200> rotate<0,0.000000,0> translate<15.647453,0.000000,16.002000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.677213,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.824200,0.000000,14.630400>}
box{<0,0,-0.076200><0.146987,0.035000,0.076200> rotate<0,0.000000,0> translate<15.677213,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.728013,0.000000,26.212800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780000,0.000000,26.212800>}
box{<0,0,-0.076200><2.051988,0.035000,0.076200> rotate<0,0.000000,0> translate<15.728013,0.000000,26.212800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.774453,-1.535000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.207944,-1.535000,15.849600>}
box{<0,0,-0.076200><5.433491,0.035000,0.076200> rotate<0,0.000000,0> translate<15.774453,-1.535000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.778813,0.000000,14.732000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.824200,0.000000,14.732000>}
box{<0,0,-0.076200><0.045388,0.035000,0.076200> rotate<0,0.000000,0> translate<15.778813,0.000000,14.732000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.799853,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.818788,0.000000,15.849600>}
box{<0,0,-0.076200><0.018934,0.035000,0.076200> rotate<0,0.000000,0> translate<15.799853,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.801181,0.000000,24.467400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.072800,0.000000,23.195781>}
box{<0,0,-0.076200><1.798340,0.035000,0.076200> rotate<0,44.997030,0> translate<15.801181,0.000000,24.467400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.809319,0.000000,15.840131>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.072800,0.000000,16.103616>}
box{<0,0,-0.076200><0.372621,0.035000,0.076200> rotate<0,-44.997370,0> translate<15.809319,0.000000,15.840131> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.824200,0.000000,14.732000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.824200,0.000000,12.349816>}
box{<0,0,-0.076200><2.382184,0.035000,0.076200> rotate<0,-90.000000,0> translate<15.824200,0.000000,12.349816> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.825256,-1.535000,15.798797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.994341,-1.535000,15.798797>}
box{<0,0,-0.076200><0.169084,0.035000,0.076200> rotate<0,0.000000,0> translate<15.825256,-1.535000,15.798797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.869000,0.000000,9.954109>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.002909,0.000000,9.820200>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<15.869000,0.000000,9.954109> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.869000,0.000000,11.243488>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.869000,0.000000,9.954109>}
box{<0,0,-0.076200><1.289378,0.035000,0.076200> rotate<0,-90.000000,0> translate<15.869000,0.000000,9.954109> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.869000,0.000000,11.243488>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.002909,0.000000,11.377397>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<15.869000,0.000000,11.243488> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.880413,0.000000,26.060400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780000,0.000000,26.060400>}
box{<0,0,-0.076200><1.899588,0.035000,0.076200> rotate<0,0.000000,0> translate<15.880413,0.000000,26.060400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.905816,0.000000,11.353800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.363016,0.000000,11.811000>}
box{<0,0,-0.076200><0.646578,0.035000,0.076200> rotate<0,-44.997030,0> translate<15.905816,0.000000,11.353800> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780000,0.000000,25.908000>}
box{<0,0,-0.076200><1.747187,0.035000,0.076200> rotate<0,0.000000,0> translate<16.032813,0.000000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.042397,0.000000,25.824597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.042397,0.000000,25.898416>}
box{<0,0,-0.076200><0.073819,0.035000,0.076200> rotate<0,90.000000,0> translate<16.042397,0.000000,25.898416> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.042397,0.000000,25.824597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.106088,0.000000,25.824597>}
box{<0,0,-0.076200><0.063691,0.035000,0.076200> rotate<0,0.000000,0> translate<16.042397,0.000000,25.824597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.045141,-1.535000,14.782800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.184656,-1.535000,14.782800>}
box{<0,0,-0.076200><3.139516,0.035000,0.076200> rotate<0,0.000000,0> translate<16.045141,-1.535000,14.782800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.072800,0.000000,16.994816>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.072800,0.000000,16.103616>}
box{<0,0,-0.076200><0.891200,0.035000,0.076200> rotate<0,-90.000000,0> translate<16.072800,0.000000,16.103616> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.072800,0.000000,16.994816>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.085200,0.000000,17.007213>}
box{<0,0,-0.076200><0.017534,0.035000,0.076200> rotate<0,-44.989810,0> translate<16.072800,0.000000,16.994816> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.085200,0.000000,17.356687>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.085200,0.000000,17.007213>}
box{<0,0,-0.076200><0.349475,0.035000,0.076200> rotate<0,-90.000000,0> translate<16.085200,0.000000,17.007213> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.085200,0.000000,17.356687>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.219109,0.000000,17.490597>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<16.085200,0.000000,17.356687> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.175084,0.000000,25.755600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780000,0.000000,25.755600>}
box{<0,0,-0.076200><1.604916,0.035000,0.076200> rotate<0,0.000000,0> translate<16.175084,0.000000,25.755600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.219109,0.000000,17.490597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.688488,0.000000,17.490597>}
box{<0,0,-0.076200><0.469378,0.035000,0.076200> rotate<0,0.000000,0> translate<16.219109,0.000000,17.490597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.239997,0.000000,25.106216>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.239997,0.000000,25.690688>}
box{<0,0,-0.076200><0.584472,0.035000,0.076200> rotate<0,90.000000,0> translate<16.239997,0.000000,25.690688> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.239997,0.000000,25.106216>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.834797,0.000000,23.511416>}
box{<0,0,-0.076200><2.255388,0.035000,0.076200> rotate<0,44.997030,0> translate<16.239997,0.000000,25.106216> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.239997,0.000000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780000,0.000000,25.146000>}
box{<0,0,-0.076200><1.540003,0.035000,0.076200> rotate<0,0.000000,0> translate<16.239997,0.000000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.239997,0.000000,25.298400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780000,0.000000,25.298400>}
box{<0,0,-0.076200><1.540003,0.035000,0.076200> rotate<0,0.000000,0> translate<16.239997,0.000000,25.298400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.239997,0.000000,25.450800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780000,0.000000,25.450800>}
box{<0,0,-0.076200><1.540003,0.035000,0.076200> rotate<0,0.000000,0> translate<16.239997,0.000000,25.450800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.239997,0.000000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780000,0.000000,25.603200>}
box{<0,0,-0.076200><1.540003,0.035000,0.076200> rotate<0,0.000000,0> translate<16.239997,0.000000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.286816,0.000000,11.734800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.344788,0.000000,11.734800>}
box{<0,0,-0.076200><5.057972,0.035000,0.076200> rotate<0,0.000000,0> translate<16.286816,0.000000,11.734800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.352612,0.000000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780000,0.000000,24.993600>}
box{<0,0,-0.076200><1.427388,0.035000,0.076200> rotate<0,0.000000,0> translate<16.352612,0.000000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.363016,0.000000,11.811000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.586197,0.000000,12.034181>}
box{<0,0,-0.076200><0.315626,0.035000,0.076200> rotate<0,-44.997030,0> translate<16.363016,0.000000,11.811000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.439216,0.000000,11.887200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.497188,0.000000,11.887200>}
box{<0,0,-0.076200><5.057972,0.035000,0.076200> rotate<0,0.000000,0> translate<16.439216,0.000000,11.887200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.505012,0.000000,24.841200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780000,0.000000,24.841200>}
box{<0,0,-0.076200><1.274988,0.035000,0.076200> rotate<0,0.000000,0> translate<16.505012,0.000000,24.841200> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.513800,0.000000,12.344400>}
box{<0,0,-0.076200><4.927603,0.035000,0.076200> rotate<0,0.000000,0> translate<16.586197,0.000000,12.344400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.586197,0.000000,12.496800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.513800,0.000000,12.496800>}
box{<0,0,-0.076200><4.927603,0.035000,0.076200> rotate<0,0.000000,0> translate<16.586197,0.000000,12.496800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.586197,0.000000,12.649200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.513800,0.000000,12.649200>}
box{<0,0,-0.076200><4.927603,0.035000,0.076200> rotate<0,0.000000,0> translate<16.586197,0.000000,12.649200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.586197,0.000000,12.801600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.513800,0.000000,12.801600>}
box{<0,0,-0.076200><4.927603,0.035000,0.076200> rotate<0,0.000000,0> translate<16.586197,0.000000,12.801600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.586197,0.000000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.513800,0.000000,12.954000>}
box{<0,0,-0.076200><4.927603,0.035000,0.076200> rotate<0,0.000000,0> translate<16.586197,0.000000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.586197,0.000000,13.106400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.513800,0.000000,13.106400>}
box{<0,0,-0.076200><4.927603,0.035000,0.076200> rotate<0,0.000000,0> translate<16.586197,0.000000,13.106400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.586197,0.000000,13.258800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.513800,0.000000,13.258800>}
box{<0,0,-0.076200><4.927603,0.035000,0.076200> rotate<0,0.000000,0> translate<16.586197,0.000000,13.258800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.586197,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.513800,0.000000,13.411200>}
box{<0,0,-0.076200><4.927603,0.035000,0.076200> rotate<0,0.000000,0> translate<16.586197,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.586197,0.000000,13.563600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.513800,0.000000,13.563600>}
box{<0,0,-0.076200><4.927603,0.035000,0.076200> rotate<0,0.000000,0> translate<16.586197,0.000000,13.563600> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.657412,0.000000,24.688800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780000,0.000000,24.688800>}
box{<0,0,-0.076200><1.122588,0.035000,0.076200> rotate<0,0.000000,0> translate<16.657412,0.000000,24.688800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.688488,0.000000,17.490597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.703797,0.000000,17.475284>}
box{<0,0,-0.076200><0.021653,0.035000,0.076200> rotate<0,45.002877,0> translate<16.688488,0.000000,17.490597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.703797,0.000000,17.475284>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.719109,0.000000,17.490597>}
box{<0,0,-0.076200><0.021655,0.035000,0.076200> rotate<0,-44.997030,0> translate<16.703797,0.000000,17.475284> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.719109,0.000000,17.490597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.188488,0.000000,17.490597>}
box{<0,0,-0.076200><0.469378,0.035000,0.076200> rotate<0,0.000000,0> translate<16.719109,0.000000,17.490597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.769413,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.771200,0.000000,14.630400>}
box{<0,0,-0.076200><0.001787,0.035000,0.076200> rotate<0,0.000000,0> translate<16.769413,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.771200,0.000000,13.870509>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.905109,0.000000,13.736600>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<16.771200,0.000000,13.870509> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.771200,0.000000,14.632188>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.771200,0.000000,13.870509>}
box{<0,0,-0.076200><0.761678,0.035000,0.076200> rotate<0,-90.000000,0> translate<16.771200,0.000000,13.870509> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.809812,0.000000,24.536400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780000,0.000000,24.536400>}
box{<0,0,-0.076200><0.970188,0.035000,0.076200> rotate<0,0.000000,0> translate<16.809812,0.000000,24.536400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.905109,0.000000,13.736600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.994488,0.000000,13.736600>}
box{<0,0,-0.076200><1.089378,0.035000,0.076200> rotate<0,0.000000,0> translate<16.905109,0.000000,13.736600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.962212,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780000,0.000000,24.384000>}
box{<0,0,-0.076200><0.817788,0.035000,0.076200> rotate<0,0.000000,0> translate<16.962212,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.072800,0.000000,22.629181>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.085200,0.000000,22.616784>}
box{<0,0,-0.076200><0.017534,0.035000,0.076200> rotate<0,44.989810,0> translate<17.072800,0.000000,22.629181> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.072800,0.000000,23.195781>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.072800,0.000000,22.629181>}
box{<0,0,-0.076200><0.566600,0.035000,0.076200> rotate<0,-90.000000,0> translate<17.072800,0.000000,22.629181> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.085200,0.000000,22.267309>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.219109,0.000000,22.133400>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<17.085200,0.000000,22.267309> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.085200,0.000000,22.616784>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.085200,0.000000,22.267309>}
box{<0,0,-0.076200><0.349475,0.035000,0.076200> rotate<0,-90.000000,0> translate<17.085200,0.000000,22.267309> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.114612,0.000000,24.231600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780000,0.000000,24.231600>}
box{<0,0,-0.076200><0.665388,0.035000,0.076200> rotate<0,0.000000,0> translate<17.114612,0.000000,24.231600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.188488,0.000000,17.490597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.203797,0.000000,17.475284>}
box{<0,0,-0.076200><0.021653,0.035000,0.076200> rotate<0,45.002877,0> translate<17.188488,0.000000,17.490597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.203797,0.000000,17.475284>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.219109,0.000000,17.490597>}
box{<0,0,-0.076200><0.021655,0.035000,0.076200> rotate<0,-44.997030,0> translate<17.203797,0.000000,17.475284> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.219109,0.000000,17.490597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.688488,0.000000,17.490597>}
box{<0,0,-0.076200><0.469378,0.035000,0.076200> rotate<0,0.000000,0> translate<17.219109,0.000000,17.490597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.219109,0.000000,22.133400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.688488,0.000000,22.133400>}
box{<0,0,-0.076200><0.469378,0.035000,0.076200> rotate<0,0.000000,0> translate<17.219109,0.000000,22.133400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.267012,0.000000,24.079200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780000,0.000000,24.079200>}
box{<0,0,-0.076200><0.512988,0.035000,0.076200> rotate<0,0.000000,0> translate<17.267012,0.000000,24.079200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.419412,0.000000,23.926800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.572800,0.000000,23.926800>}
box{<0,0,-0.076200><1.153388,0.035000,0.076200> rotate<0,0.000000,0> translate<17.419412,0.000000,23.926800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.571813,0.000000,23.774400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.572800,0.000000,23.774400>}
box{<0,0,-0.076200><1.000988,0.035000,0.076200> rotate<0,0.000000,0> translate<17.571813,0.000000,23.774400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.688488,0.000000,17.490597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.822397,0.000000,17.356687>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<17.688488,0.000000,17.490597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.688488,0.000000,22.133400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.822397,0.000000,22.267309>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<17.688488,0.000000,22.133400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.724213,0.000000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.572800,0.000000,23.622000>}
box{<0,0,-0.076200><0.848588,0.035000,0.076200> rotate<0,0.000000,0> translate<17.724213,0.000000,23.622000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780000,0.000000,24.047634>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.824634,0.000000,24.003000>}
box{<0,0,-0.076200><0.063123,0.035000,0.076200> rotate<0,44.997030,0> translate<17.780000,0.000000,24.047634> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780000,0.000000,27.514363>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780000,0.000000,24.047634>}
box{<0,0,-0.076200><3.466728,0.035000,0.076200> rotate<0,-90.000000,0> translate<17.780000,0.000000,24.047634> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780000,0.000000,27.514363>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.824634,0.000000,27.558997>}
box{<0,0,-0.076200><0.063123,0.035000,0.076200> rotate<0,-44.997030,0> translate<17.780000,0.000000,27.514363> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.805484,0.000000,17.373600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.602113,0.000000,17.373600>}
box{<0,0,-0.076200><0.796628,0.035000,0.076200> rotate<0,0.000000,0> translate<17.805484,0.000000,17.373600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.805488,0.000000,22.250400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.602109,0.000000,22.250400>}
box{<0,0,-0.076200><0.796622,0.035000,0.076200> rotate<0,0.000000,0> translate<17.805488,0.000000,22.250400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.822397,0.000000,17.007213>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.822397,0.000000,17.356687>}
box{<0,0,-0.076200><0.349475,0.035000,0.076200> rotate<0,90.000000,0> translate<17.822397,0.000000,17.356687> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.822397,0.000000,17.007213>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.834797,0.000000,16.994816>}
box{<0,0,-0.076200><0.017534,0.035000,0.076200> rotate<0,44.989810,0> translate<17.822397,0.000000,17.007213> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.822397,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.585200,0.000000,17.068800>}
box{<0,0,-0.076200><0.762803,0.035000,0.076200> rotate<0,0.000000,0> translate<17.822397,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.822397,0.000000,17.221200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.585200,0.000000,17.221200>}
box{<0,0,-0.076200><0.762803,0.035000,0.076200> rotate<0,0.000000,0> translate<17.822397,0.000000,17.221200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.822397,0.000000,22.267309>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.822397,0.000000,22.616784>}
box{<0,0,-0.076200><0.349475,0.035000,0.076200> rotate<0,90.000000,0> translate<17.822397,0.000000,22.616784> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.822397,0.000000,22.402800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.585200,0.000000,22.402800>}
box{<0,0,-0.076200><0.762803,0.035000,0.076200> rotate<0,0.000000,0> translate<17.822397,0.000000,22.402800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.822397,0.000000,22.555200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.585200,0.000000,22.555200>}
box{<0,0,-0.076200><0.762803,0.035000,0.076200> rotate<0,0.000000,0> translate<17.822397,0.000000,22.555200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.822397,0.000000,22.616784>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.834797,0.000000,22.629181>}
box{<0,0,-0.076200><0.017534,0.035000,0.076200> rotate<0,-44.989810,0> translate<17.822397,0.000000,22.616784> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.824634,0.000000,24.003000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.572800,0.000000,24.003000>}
box{<0,0,-0.076200><0.748166,0.035000,0.076200> rotate<0,0.000000,0> translate<17.824634,0.000000,24.003000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.824634,0.000000,27.558997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.005800,0.000000,27.558997>}
box{<0,0,-0.076200><3.181166,0.035000,0.076200> rotate<0,0.000000,0> translate<17.824634,0.000000,27.558997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.834797,0.000000,14.893797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.834797,0.000000,16.994816>}
box{<0,0,-0.076200><2.101019,0.035000,0.076200> rotate<0,90.000000,0> translate<17.834797,0.000000,16.994816> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.834797,0.000000,16.154400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.572800,0.000000,16.154400>}
box{<0,0,-0.076200><0.738003,0.035000,0.076200> rotate<0,0.000000,0> translate<17.834797,0.000000,16.154400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.834797,0.000000,16.306800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.572800,0.000000,16.306800>}
box{<0,0,-0.076200><0.738003,0.035000,0.076200> rotate<0,0.000000,0> translate<17.834797,0.000000,16.306800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.834797,0.000000,16.459200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.572800,0.000000,16.459200>}
box{<0,0,-0.076200><0.738003,0.035000,0.076200> rotate<0,0.000000,0> translate<17.834797,0.000000,16.459200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.834797,0.000000,16.611600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.572800,0.000000,16.611600>}
box{<0,0,-0.076200><0.738003,0.035000,0.076200> rotate<0,0.000000,0> translate<17.834797,0.000000,16.611600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.834797,0.000000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.572800,0.000000,16.764000>}
box{<0,0,-0.076200><0.738003,0.035000,0.076200> rotate<0,0.000000,0> translate<17.834797,0.000000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.834797,0.000000,16.916400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.572800,0.000000,16.916400>}
box{<0,0,-0.076200><0.738003,0.035000,0.076200> rotate<0,0.000000,0> translate<17.834797,0.000000,16.916400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.834797,0.000000,22.629181>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.834797,0.000000,23.511416>}
box{<0,0,-0.076200><0.882234,0.035000,0.076200> rotate<0,90.000000,0> translate<17.834797,0.000000,23.511416> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.834797,0.000000,22.707600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.572800,0.000000,22.707600>}
box{<0,0,-0.076200><0.738003,0.035000,0.076200> rotate<0,0.000000,0> translate<17.834797,0.000000,22.707600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.834797,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.572800,0.000000,22.860000>}
box{<0,0,-0.076200><0.738003,0.035000,0.076200> rotate<0,0.000000,0> translate<17.834797,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.834797,0.000000,23.012400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.572800,0.000000,23.012400>}
box{<0,0,-0.076200><0.738003,0.035000,0.076200> rotate<0,0.000000,0> translate<17.834797,0.000000,23.012400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.834797,0.000000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.572800,0.000000,23.164800>}
box{<0,0,-0.076200><0.738003,0.035000,0.076200> rotate<0,0.000000,0> translate<17.834797,0.000000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.834797,0.000000,23.317200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.572800,0.000000,23.317200>}
box{<0,0,-0.076200><0.738003,0.035000,0.076200> rotate<0,0.000000,0> translate<17.834797,0.000000,23.317200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.834797,0.000000,23.469600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.572800,0.000000,23.469600>}
box{<0,0,-0.076200><0.738003,0.035000,0.076200> rotate<0,0.000000,0> translate<17.834797,0.000000,23.469600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.994488,0.000000,13.736600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.128397,0.000000,13.870509>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<17.994488,0.000000,13.736600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.994488,0.000000,14.893797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.128397,0.000000,14.759888>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<17.994488,0.000000,14.893797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.092288,0.000000,9.820200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.226197,0.000000,9.954109>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<18.092288,0.000000,9.820200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.092288,0.000000,11.377397>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.226197,0.000000,11.243488>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<18.092288,0.000000,11.377397> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.105484,0.000000,14.782800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.800712,0.000000,14.782800>}
box{<0,0,-0.076200><0.695228,0.035000,0.076200> rotate<0,0.000000,0> translate<18.105484,0.000000,14.782800> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.178088,0.000000,9.906000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.617109,0.000000,9.906000>}
box{<0,0,-0.076200><1.439022,0.035000,0.076200> rotate<0,0.000000,0> translate<18.178088,0.000000,9.906000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.192084,0.000000,11.277600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.603113,0.000000,11.277600>}
box{<0,0,-0.076200><1.411028,0.035000,0.076200> rotate<0,0.000000,0> translate<18.192084,0.000000,11.277600> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.572800,0.000000,15.610181>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.923000,0.000000,15.259984>}
box{<0,0,-0.076200><0.495255,0.035000,0.076200> rotate<0,44.996775,0> translate<18.572800,0.000000,15.610181> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.572800,0.000000,16.994816>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.572800,0.000000,15.610181>}
box{<0,0,-0.076200><1.384634,0.035000,0.076200> rotate<0,-90.000000,0> translate<18.572800,0.000000,15.610181> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.572800,0.000000,16.994816>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.585200,0.000000,17.007213>}
box{<0,0,-0.076200><0.017534,0.035000,0.076200> rotate<0,-44.989810,0> translate<18.572800,0.000000,16.994816> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.572800,0.000000,22.629181>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.585200,0.000000,22.616781>}
box{<0,0,-0.076200><0.017536,0.035000,0.076200> rotate<0,44.997030,0> translate<18.572800,0.000000,22.629181> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.572800,0.000000,24.003000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.572800,0.000000,22.629181>}
box{<0,0,-0.076200><1.373819,0.035000,0.076200> rotate<0,-90.000000,0> translate<18.572800,0.000000,22.629181> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.585200,0.000000,17.356687>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.585200,0.000000,17.007213>}
box{<0,0,-0.076200><0.349475,0.035000,0.076200> rotate<0,-90.000000,0> translate<18.585200,0.000000,17.007213> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.585200,0.000000,17.356687>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.719109,0.000000,17.490597>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<18.585200,0.000000,17.356687> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.585200,0.000000,22.267309>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.719109,0.000000,22.133400>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<18.585200,0.000000,22.267309> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.585200,0.000000,22.616781>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.585200,0.000000,22.267309>}
box{<0,0,-0.076200><0.349472,0.035000,0.076200> rotate<0,-90.000000,0> translate<18.585200,0.000000,22.267309> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.719109,0.000000,17.490597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.188488,0.000000,17.490597>}
box{<0,0,-0.076200><0.469378,0.035000,0.076200> rotate<0,0.000000,0> translate<18.719109,0.000000,17.490597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.719109,0.000000,22.133400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.188488,0.000000,22.133400>}
box{<0,0,-0.076200><0.469378,0.035000,0.076200> rotate<0,0.000000,0> translate<18.719109,0.000000,22.133400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.777800,0.000000,13.870509>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.911709,0.000000,13.736600>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<18.777800,0.000000,13.870509> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.777800,0.000000,14.759888>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.777800,0.000000,13.870509>}
box{<0,0,-0.076200><0.889378,0.035000,0.076200> rotate<0,-90.000000,0> translate<18.777800,0.000000,13.870509> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.777800,0.000000,14.759888>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.911709,0.000000,14.893797>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<18.777800,0.000000,14.759888> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.133856,-1.535000,14.833600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.235456,-1.535000,14.732000>}
box{<0,0,-0.076200><0.143684,0.035000,0.076200> rotate<0,44.997030,0> translate<19.133856,-1.535000,14.833600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.133856,-1.535000,15.697197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.235456,-1.535000,15.798797>}
box{<0,0,-0.076200><0.143684,0.035000,0.076200> rotate<0,-44.997030,0> translate<19.133856,-1.535000,15.697197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.188488,0.000000,17.490597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.322397,0.000000,17.356687>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<19.188488,0.000000,17.490597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.188488,0.000000,22.133400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.322397,0.000000,22.267309>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<19.188488,0.000000,22.133400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.235456,-1.535000,14.732000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.677341,-1.535000,14.732000>}
box{<0,0,-0.076200><0.441884,0.035000,0.076200> rotate<0,0.000000,0> translate<19.235456,-1.535000,14.732000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.235456,-1.535000,15.798797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.677341,-1.535000,15.798797>}
box{<0,0,-0.076200><0.441884,0.035000,0.076200> rotate<0,0.000000,0> translate<19.235456,-1.535000,15.798797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.305484,0.000000,17.373600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.602113,0.000000,17.373600>}
box{<0,0,-0.076200><0.296628,0.035000,0.076200> rotate<0,0.000000,0> translate<19.305484,0.000000,17.373600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.305488,0.000000,22.250400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.602109,0.000000,22.250400>}
box{<0,0,-0.076200><0.296622,0.035000,0.076200> rotate<0,0.000000,0> translate<19.305488,0.000000,22.250400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.322397,0.000000,17.007213>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.322397,0.000000,17.356687>}
box{<0,0,-0.076200><0.349475,0.035000,0.076200> rotate<0,90.000000,0> translate<19.322397,0.000000,17.356687> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.322397,0.000000,17.007213>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.334797,0.000000,16.994816>}
box{<0,0,-0.076200><0.017534,0.035000,0.076200> rotate<0,44.989810,0> translate<19.322397,0.000000,17.007213> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.322397,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.585200,0.000000,17.068800>}
box{<0,0,-0.076200><0.262803,0.035000,0.076200> rotate<0,0.000000,0> translate<19.322397,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.322397,0.000000,17.221200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.585200,0.000000,17.221200>}
box{<0,0,-0.076200><0.262803,0.035000,0.076200> rotate<0,0.000000,0> translate<19.322397,0.000000,17.221200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.322397,0.000000,22.267309>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.322397,0.000000,22.616781>}
box{<0,0,-0.076200><0.349472,0.035000,0.076200> rotate<0,90.000000,0> translate<19.322397,0.000000,22.616781> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.322397,0.000000,22.402800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.585200,0.000000,22.402800>}
box{<0,0,-0.076200><0.262803,0.035000,0.076200> rotate<0,0.000000,0> translate<19.322397,0.000000,22.402800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.322397,0.000000,22.555200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.585200,0.000000,22.555200>}
box{<0,0,-0.076200><0.262803,0.035000,0.076200> rotate<0,0.000000,0> translate<19.322397,0.000000,22.555200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.322397,0.000000,22.616781>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.334797,0.000000,22.629181>}
box{<0,0,-0.076200><0.017536,0.035000,0.076200> rotate<0,-44.997030,0> translate<19.322397,0.000000,22.616781> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.334797,0.000000,15.925816>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.334797,0.000000,16.994816>}
box{<0,0,-0.076200><1.069000,0.035000,0.076200> rotate<0,90.000000,0> translate<19.334797,0.000000,16.994816> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.334797,0.000000,15.925816>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.456400,0.000000,15.804213>}
box{<0,0,-0.076200><0.171973,0.035000,0.076200> rotate<0,44.997030,0> translate<19.334797,0.000000,15.925816> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.334797,0.000000,16.002000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.572800,0.000000,16.002000>}
box{<0,0,-0.076200><0.238003,0.035000,0.076200> rotate<0,0.000000,0> translate<19.334797,0.000000,16.002000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.334797,0.000000,16.154400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.572800,0.000000,16.154400>}
box{<0,0,-0.076200><0.238003,0.035000,0.076200> rotate<0,0.000000,0> translate<19.334797,0.000000,16.154400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.334797,0.000000,16.306800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.572800,0.000000,16.306800>}
box{<0,0,-0.076200><0.238003,0.035000,0.076200> rotate<0,0.000000,0> translate<19.334797,0.000000,16.306800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.334797,0.000000,16.459200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.572800,0.000000,16.459200>}
box{<0,0,-0.076200><0.238003,0.035000,0.076200> rotate<0,0.000000,0> translate<19.334797,0.000000,16.459200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.334797,0.000000,16.611600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.572800,0.000000,16.611600>}
box{<0,0,-0.076200><0.238003,0.035000,0.076200> rotate<0,0.000000,0> translate<19.334797,0.000000,16.611600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.334797,0.000000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.572800,0.000000,16.764000>}
box{<0,0,-0.076200><0.238003,0.035000,0.076200> rotate<0,0.000000,0> translate<19.334797,0.000000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.334797,0.000000,16.916400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.572800,0.000000,16.916400>}
box{<0,0,-0.076200><0.238003,0.035000,0.076200> rotate<0,0.000000,0> translate<19.334797,0.000000,16.916400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.334797,0.000000,22.629181>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.334797,0.000000,24.003000>}
box{<0,0,-0.076200><1.373819,0.035000,0.076200> rotate<0,90.000000,0> translate<19.334797,0.000000,24.003000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.334797,0.000000,22.707600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.572800,0.000000,22.707600>}
box{<0,0,-0.076200><0.238003,0.035000,0.076200> rotate<0,0.000000,0> translate<19.334797,0.000000,22.707600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.334797,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.572800,0.000000,22.860000>}
box{<0,0,-0.076200><0.238003,0.035000,0.076200> rotate<0,0.000000,0> translate<19.334797,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.334797,0.000000,23.012400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.572800,0.000000,23.012400>}
box{<0,0,-0.076200><0.238003,0.035000,0.076200> rotate<0,0.000000,0> translate<19.334797,0.000000,23.012400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.334797,0.000000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.572800,0.000000,23.164800>}
box{<0,0,-0.076200><0.238003,0.035000,0.076200> rotate<0,0.000000,0> translate<19.334797,0.000000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.334797,0.000000,23.317200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.572800,0.000000,23.317200>}
box{<0,0,-0.076200><0.238003,0.035000,0.076200> rotate<0,0.000000,0> translate<19.334797,0.000000,23.317200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.334797,0.000000,23.469600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.572800,0.000000,23.469600>}
box{<0,0,-0.076200><0.238003,0.035000,0.076200> rotate<0,0.000000,0> translate<19.334797,0.000000,23.469600> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.411013,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.501788,0.000000,15.849600>}
box{<0,0,-0.076200><0.090775,0.035000,0.076200> rotate<0,0.000000,0> translate<19.411013,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.456400,0.000000,15.804213>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.572800,0.000000,15.920613>}
box{<0,0,-0.076200><0.164614,0.035000,0.076200> rotate<0,-44.997030,0> translate<19.456400,0.000000,15.804213> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.569000,0.000000,7.654109>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.702909,0.000000,7.520200>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<19.569000,0.000000,7.654109> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.569000,0.000000,8.943487>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.569000,0.000000,7.654109>}
box{<0,0,-0.076200><1.289378,0.035000,0.076200> rotate<0,-90.000000,0> translate<19.569000,0.000000,7.654109> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.572800,0.000000,16.994816>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.572800,0.000000,15.920613>}
box{<0,0,-0.076200><1.074203,0.035000,0.076200> rotate<0,-90.000000,0> translate<19.572800,0.000000,15.920613> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.572800,0.000000,16.994816>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.585200,0.000000,17.007216>}
box{<0,0,-0.076200><0.017536,0.035000,0.076200> rotate<0,-44.997030,0> translate<19.572800,0.000000,16.994816> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.572800,0.000000,22.629181>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.585200,0.000000,22.616781>}
box{<0,0,-0.076200><0.017536,0.035000,0.076200> rotate<0,44.997030,0> translate<19.572800,0.000000,22.629181> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.572800,0.000000,24.003000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.572800,0.000000,22.629181>}
box{<0,0,-0.076200><1.373819,0.035000,0.076200> rotate<0,-90.000000,0> translate<19.572800,0.000000,22.629181> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.585200,0.000000,17.356687>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.585200,0.000000,17.007216>}
box{<0,0,-0.076200><0.349472,0.035000,0.076200> rotate<0,-90.000000,0> translate<19.585200,0.000000,17.007216> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.585200,0.000000,17.356687>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.719109,0.000000,17.490597>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<19.585200,0.000000,17.356687> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.585200,0.000000,22.267309>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.719109,0.000000,22.133400>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<19.585200,0.000000,22.267309> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.585200,0.000000,22.616781>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.585200,0.000000,22.267309>}
box{<0,0,-0.076200><0.349472,0.035000,0.076200> rotate<0,-90.000000,0> translate<19.585200,0.000000,22.267309> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.677341,-1.535000,14.732000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.778941,-1.535000,14.833600>}
box{<0,0,-0.076200><0.143684,0.035000,0.076200> rotate<0,-44.997030,0> translate<19.677341,-1.535000,14.732000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.677341,-1.535000,15.798797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.778941,-1.535000,15.697197>}
box{<0,0,-0.076200><0.143684,0.035000,0.076200> rotate<0,44.997030,0> translate<19.677341,-1.535000,15.798797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.702909,0.000000,7.520200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.792288,0.000000,7.520200>}
box{<0,0,-0.076200><2.089378,0.035000,0.076200> rotate<0,0.000000,0> translate<19.702909,0.000000,7.520200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.702909,0.000000,9.077397>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.792288,0.000000,9.077397>}
box{<0,0,-0.076200><2.089378,0.035000,0.076200> rotate<0,0.000000,0> translate<19.702909,0.000000,9.077397> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.702909,0.000000,9.820200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.792288,0.000000,9.820200>}
box{<0,0,-0.076200><2.089378,0.035000,0.076200> rotate<0,0.000000,0> translate<19.702909,0.000000,9.820200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.702909,0.000000,11.377397>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.987384,0.000000,11.377397>}
box{<0,0,-0.076200><1.284475,0.035000,0.076200> rotate<0,0.000000,0> translate<19.702909,0.000000,11.377397> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.719109,0.000000,17.490597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.025200,0.000000,17.490597>}
box{<0,0,-0.076200><0.306091,0.035000,0.076200> rotate<0,0.000000,0> translate<19.719109,0.000000,17.490597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.719109,0.000000,22.133400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.025200,0.000000,22.133400>}
box{<0,0,-0.076200><0.306091,0.035000,0.076200> rotate<0,0.000000,0> translate<19.719109,0.000000,22.133400> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.001088,0.000000,13.736600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.134997,0.000000,13.870509>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<20.001088,0.000000,13.736600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.001088,0.000000,14.893797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.134997,0.000000,14.759888>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<20.001088,0.000000,14.893797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.025200,0.000000,17.796688>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.025200,0.000000,17.490597>}
box{<0,0,-0.076200><0.306091,0.035000,0.076200> rotate<0,-90.000000,0> translate<20.025200,0.000000,17.490597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.025200,0.000000,17.796688>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.159109,0.000000,17.930597>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<20.025200,0.000000,17.796688> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.025200,0.000000,18.327309>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.159109,0.000000,18.193400>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<20.025200,0.000000,18.327309> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.025200,0.000000,18.796688>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.025200,0.000000,18.327309>}
box{<0,0,-0.076200><0.469378,0.035000,0.076200> rotate<0,-90.000000,0> translate<20.025200,0.000000,18.327309> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.025200,0.000000,18.796688>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.159109,0.000000,18.930597>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<20.025200,0.000000,18.796688> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.025200,0.000000,19.827309>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.159109,0.000000,19.693400>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<20.025200,0.000000,19.827309> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.025200,0.000000,20.296688>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.025200,0.000000,19.827309>}
box{<0,0,-0.076200><0.469378,0.035000,0.076200> rotate<0,-90.000000,0> translate<20.025200,0.000000,19.827309> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.025200,0.000000,20.296688>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.040513,0.000000,20.311997>}
box{<0,0,-0.076200><0.021653,0.035000,0.076200> rotate<0,-44.991183,0> translate<20.025200,0.000000,20.296688> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.025200,0.000000,20.327309>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.040513,0.000000,20.311997>}
box{<0,0,-0.076200><0.021655,0.035000,0.076200> rotate<0,44.997030,0> translate<20.025200,0.000000,20.327309> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.025200,0.000000,20.796688>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.025200,0.000000,20.327309>}
box{<0,0,-0.076200><0.469378,0.035000,0.076200> rotate<0,-90.000000,0> translate<20.025200,0.000000,20.327309> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.025200,0.000000,20.796688>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.040513,0.000000,20.811997>}
box{<0,0,-0.076200><0.021653,0.035000,0.076200> rotate<0,-44.991183,0> translate<20.025200,0.000000,20.796688> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.025200,0.000000,20.827309>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.040513,0.000000,20.811997>}
box{<0,0,-0.076200><0.021655,0.035000,0.076200> rotate<0,44.997030,0> translate<20.025200,0.000000,20.827309> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.025200,0.000000,21.296688>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.025200,0.000000,20.827309>}
box{<0,0,-0.076200><0.469378,0.035000,0.076200> rotate<0,-90.000000,0> translate<20.025200,0.000000,20.827309> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.025200,0.000000,21.296688>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.159109,0.000000,21.430597>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<20.025200,0.000000,21.296688> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.025200,0.000000,21.827309>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.159109,0.000000,21.693400>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<20.025200,0.000000,21.827309> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.025200,0.000000,22.133400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.025200,0.000000,21.827309>}
box{<0,0,-0.076200><0.306091,0.035000,0.076200> rotate<0,-90.000000,0> translate<20.025200,0.000000,21.827309> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.159109,0.000000,17.930597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.508581,0.000000,17.930597>}
box{<0,0,-0.076200><0.349472,0.035000,0.076200> rotate<0,0.000000,0> translate<20.159109,0.000000,17.930597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.159109,0.000000,18.193400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.508581,0.000000,18.193400>}
box{<0,0,-0.076200><0.349472,0.035000,0.076200> rotate<0,0.000000,0> translate<20.159109,0.000000,18.193400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.159109,0.000000,18.930597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.508581,0.000000,18.930597>}
box{<0,0,-0.076200><0.349472,0.035000,0.076200> rotate<0,0.000000,0> translate<20.159109,0.000000,18.930597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.159109,0.000000,19.693400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.508581,0.000000,19.693400>}
box{<0,0,-0.076200><0.349472,0.035000,0.076200> rotate<0,0.000000,0> translate<20.159109,0.000000,19.693400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.159109,0.000000,21.430597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.198488,0.000000,21.430597>}
box{<0,0,-0.076200><1.039378,0.035000,0.076200> rotate<0,0.000000,0> translate<20.159109,0.000000,21.430597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.159109,0.000000,21.693400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.508581,0.000000,21.693400>}
box{<0,0,-0.076200><0.349472,0.035000,0.076200> rotate<0,0.000000,0> translate<20.159109,0.000000,21.693400> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.508581,0.000000,17.930597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.520981,0.000000,17.942997>}
box{<0,0,-0.076200><0.017536,0.035000,0.076200> rotate<0,-44.997030,0> translate<20.508581,0.000000,17.930597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.508581,0.000000,18.193400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.520981,0.000000,18.181000>}
box{<0,0,-0.076200><0.017536,0.035000,0.076200> rotate<0,44.997030,0> translate<20.508581,0.000000,18.193400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.508581,0.000000,18.930597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.520981,0.000000,18.942997>}
box{<0,0,-0.076200><0.017536,0.035000,0.076200> rotate<0,-44.997030,0> translate<20.508581,0.000000,18.930597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.508581,0.000000,19.693400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.520981,0.000000,19.681000>}
box{<0,0,-0.076200><0.017536,0.035000,0.076200> rotate<0,44.997030,0> translate<20.508581,0.000000,19.693400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.508581,0.000000,21.693400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.520981,0.000000,21.681000>}
box{<0,0,-0.076200><0.017536,0.035000,0.076200> rotate<0,44.997030,0> translate<20.508581,0.000000,21.693400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.520981,0.000000,17.942997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.836616,0.000000,17.942997>}
box{<0,0,-0.076200><0.315634,0.035000,0.076200> rotate<0,0.000000,0> translate<20.520981,0.000000,17.942997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.520981,0.000000,18.181000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.564581,0.000000,18.181000>}
box{<0,0,-0.076200><1.043600,0.035000,0.076200> rotate<0,0.000000,0> translate<20.520981,0.000000,18.181000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.520981,0.000000,18.942997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.880216,0.000000,18.942997>}
box{<0,0,-0.076200><1.359234,0.035000,0.076200> rotate<0,0.000000,0> translate<20.520981,0.000000,18.942997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.520981,0.000000,19.681000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.836616,0.000000,19.681000>}
box{<0,0,-0.076200><0.315634,0.035000,0.076200> rotate<0,0.000000,0> translate<20.520981,0.000000,19.681000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.520981,0.000000,21.681000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.836616,0.000000,21.681000>}
box{<0,0,-0.076200><0.315634,0.035000,0.076200> rotate<0,0.000000,0> translate<20.520981,0.000000,21.681000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.836616,0.000000,17.942997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.849016,0.000000,17.930597>}
box{<0,0,-0.076200><0.017536,0.035000,0.076200> rotate<0,44.997030,0> translate<20.836616,0.000000,17.942997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.836616,0.000000,19.681000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.849016,0.000000,19.693400>}
box{<0,0,-0.076200><0.017536,0.035000,0.076200> rotate<0,-44.997030,0> translate<20.836616,0.000000,19.681000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.836616,0.000000,21.681000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.849016,0.000000,21.693400>}
box{<0,0,-0.076200><0.017536,0.035000,0.076200> rotate<0,-44.997030,0> translate<20.836616,0.000000,21.681000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.849016,0.000000,17.930597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.198488,0.000000,17.930597>}
box{<0,0,-0.076200><0.349472,0.035000,0.076200> rotate<0,0.000000,0> translate<20.849016,0.000000,17.930597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.849016,0.000000,19.693400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.198488,0.000000,19.693400>}
box{<0,0,-0.076200><0.349472,0.035000,0.076200> rotate<0,0.000000,0> translate<20.849016,0.000000,19.693400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.849016,0.000000,21.693400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.198488,0.000000,21.693400>}
box{<0,0,-0.076200><0.349472,0.035000,0.076200> rotate<0,0.000000,0> translate<20.849016,0.000000,21.693400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.987384,0.000000,11.377397>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.513800,0.000000,11.903816>}
box{<0,0,-0.076200><0.744466,0.035000,0.076200> rotate<0,-44.997200,0> translate<20.987384,0.000000,11.377397> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.005800,0.000000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.005800,0.000000,27.558997>}
box{<0,0,-0.076200><1.397003,0.035000,0.076200> rotate<0,-90.000000,0> translate<21.005800,0.000000,27.558997> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.198488,0.000000,17.930597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.332397,0.000000,17.796688>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<21.198488,0.000000,17.930597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.198488,0.000000,19.693400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.211484,0.000000,19.706400>}
box{<0,0,-0.076200><0.018383,0.035000,0.076200> rotate<0,-45.003917,0> translate<21.198488,0.000000,19.693400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.198488,0.000000,21.430597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.211484,0.000000,21.417597>}
box{<0,0,-0.076200><0.018383,0.035000,0.076200> rotate<0,45.003917,0> translate<21.198488,0.000000,21.430597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.198488,0.000000,21.693400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.332397,0.000000,21.827309>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<21.198488,0.000000,21.693400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.198488,0.000000,22.430597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.332397,0.000000,22.296688>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<21.198488,0.000000,22.430597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.211484,0.000000,19.706400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.545094,0.000000,19.706400>}
box{<0,0,-0.076200><0.333609,0.035000,0.076200> rotate<0,0.000000,0> translate<21.211484,0.000000,19.706400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.211484,0.000000,21.417597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.851200,0.000000,21.417597>}
box{<0,0,-0.076200><0.639716,0.035000,0.076200> rotate<0,0.000000,0> translate<21.211484,0.000000,21.417597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.214413,0.000000,22.555200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,22.555200>}
box{<0,0,-0.076200><5.760388,0.035000,0.076200> rotate<0,0.000000,0> translate<21.214413,0.000000,22.555200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.226284,0.000000,22.402800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,22.402800>}
box{<0,0,-0.076200><5.748516,0.035000,0.076200> rotate<0,0.000000,0> translate<21.226284,0.000000,22.402800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.226288,0.000000,17.221200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.844000,0.000000,17.221200>}
box{<0,0,-0.076200><0.617712,0.035000,0.076200> rotate<0,0.000000,0> translate<21.226288,0.000000,17.221200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.265213,0.000000,16.611600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.105656,0.000000,16.611600>}
box{<0,0,-0.076200><0.840444,0.035000,0.076200> rotate<0,0.000000,0> translate<21.265213,0.000000,16.611600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.298284,0.000000,17.830800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.851200,0.000000,17.830800>}
box{<0,0,-0.076200><0.552916,0.035000,0.076200> rotate<0,0.000000,0> translate<21.298284,0.000000,17.830800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.298288,0.000000,21.793200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,21.793200>}
box{<0,0,-0.076200><5.676513,0.035000,0.076200> rotate<0,0.000000,0> translate<21.298288,0.000000,21.793200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.332397,0.000000,17.327309>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.332397,0.000000,17.796688>}
box{<0,0,-0.076200><0.469378,0.035000,0.076200> rotate<0,90.000000,0> translate<21.332397,0.000000,17.796688> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.332397,0.000000,17.373600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.902459,0.000000,17.373600>}
box{<0,0,-0.076200><0.570062,0.035000,0.076200> rotate<0,0.000000,0> translate<21.332397,0.000000,17.373600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.332397,0.000000,17.526000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.996400,0.000000,17.526000>}
box{<0,0,-0.076200><0.664003,0.035000,0.076200> rotate<0,0.000000,0> translate<21.332397,0.000000,17.526000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.332397,0.000000,17.678400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.899509,0.000000,17.678400>}
box{<0,0,-0.076200><0.567113,0.035000,0.076200> rotate<0,0.000000,0> translate<21.332397,0.000000,17.678400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.332397,0.000000,21.827309>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.332397,0.000000,22.296688>}
box{<0,0,-0.076200><0.469378,0.035000,0.076200> rotate<0,90.000000,0> translate<21.332397,0.000000,22.296688> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.332397,0.000000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,21.945600>}
box{<0,0,-0.076200><5.642403,0.035000,0.076200> rotate<0,0.000000,0> translate<21.332397,0.000000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.332397,0.000000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,22.098000>}
box{<0,0,-0.076200><5.642403,0.035000,0.076200> rotate<0,0.000000,0> translate<21.332397,0.000000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.332397,0.000000,22.250400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,22.250400>}
box{<0,0,-0.076200><5.642403,0.035000,0.076200> rotate<0,0.000000,0> translate<21.332397,0.000000,22.250400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.366813,0.000000,22.707600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,22.707600>}
box{<0,0,-0.076200><5.607988,0.035000,0.076200> rotate<0,0.000000,0> translate<21.366813,0.000000,22.707600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.413256,-1.535000,14.833600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.666197,-1.535000,15.086541>}
box{<0,0,-0.076200><0.357712,0.035000,0.076200> rotate<0,-44.997030,0> translate<21.413256,-1.535000,14.833600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.417613,0.000000,16.459200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.473581,0.000000,16.459200>}
box{<0,0,-0.076200><1.055969,0.035000,0.076200> rotate<0,0.000000,0> translate<21.417613,0.000000,16.459200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.513800,0.000000,15.285381>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.513800,0.000000,11.903816>}
box{<0,0,-0.076200><3.381566,0.035000,0.076200> rotate<0,-90.000000,0> translate<21.513800,0.000000,11.903816> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.514856,-1.535000,14.935200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,14.935200>}
box{<0,0,-0.076200><5.459944,0.035000,0.076200> rotate<0,0.000000,0> translate<21.514856,-1.535000,14.935200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.519213,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,22.860000>}
box{<0,0,-0.076200><5.455588,0.035000,0.076200> rotate<0,0.000000,0> translate<21.519213,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.545094,0.000000,19.706400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.454094,0.000000,20.615400>}
box{<0,0,-0.076200><1.285520,0.035000,0.076200> rotate<0,-44.997030,0> translate<21.545094,0.000000,19.706400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.564581,0.000000,18.181000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.640800,0.000000,18.104781>}
box{<0,0,-0.076200><0.107790,0.035000,0.076200> rotate<0,44.997030,0> translate<21.564581,0.000000,18.181000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.570013,0.000000,16.306800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.625981,0.000000,16.306800>}
box{<0,0,-0.076200><1.055969,0.035000,0.076200> rotate<0,0.000000,0> translate<21.570013,0.000000,16.306800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.640800,0.000000,18.104781>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.851200,0.000000,17.894381>}
box{<0,0,-0.076200><0.297551,0.035000,0.076200> rotate<0,44.997030,0> translate<21.640800,0.000000,18.104781> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.650694,0.000000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.045000,0.000000,19.812000>}
box{<0,0,-0.076200><1.394306,0.035000,0.076200> rotate<0,0.000000,0> translate<21.650694,0.000000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.666197,-1.535000,15.086541>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.809197,-1.535000,16.229541>}
box{<0,0,-0.076200><1.616446,0.035000,0.076200> rotate<0,-44.997030,0> translate<21.666197,-1.535000,15.086541> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.667256,-1.535000,15.087600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,15.087600>}
box{<0,0,-0.076200><5.307544,0.035000,0.076200> rotate<0,0.000000,0> translate<21.667256,-1.535000,15.087600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.671613,0.000000,23.012400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,23.012400>}
box{<0,0,-0.076200><5.303187,0.035000,0.076200> rotate<0,0.000000,0> translate<21.671613,0.000000,23.012400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.722413,0.000000,16.154400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.778381,0.000000,16.154400>}
box{<0,0,-0.076200><1.055969,0.035000,0.076200> rotate<0,0.000000,0> translate<21.722413,0.000000,16.154400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.792288,0.000000,7.520200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.926197,0.000000,7.654109>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<21.792288,0.000000,7.520200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.792288,0.000000,9.077397>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.926197,0.000000,8.943487>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<21.792288,0.000000,9.077397> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.792288,0.000000,9.820200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.926197,0.000000,9.954109>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<21.792288,0.000000,9.820200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.798616,0.000000,23.139400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.253016,0.000000,23.139400>}
box{<0,0,-0.076200><3.454400,0.035000,0.076200> rotate<0,0.000000,0> translate<21.798616,0.000000,23.139400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.803094,0.000000,19.964400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.093312,0.000000,19.964400>}
box{<0,0,-0.076200><1.290219,0.035000,0.076200> rotate<0,0.000000,0> translate<21.803094,0.000000,19.964400> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.996400,0.000000,17.467541>}
box{<0,0,-0.076200><0.215526,0.035000,0.076200> rotate<0,-44.997030,0> translate<21.844000,0.000000,17.315141> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.844000,-1.535000,17.315141>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.156456,-1.535000,17.627597>}
box{<0,0,-0.076200><0.441880,0.035000,0.076200> rotate<0,-44.997030,0> translate<21.844000,-1.535000,17.315141> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.851200,0.000000,17.726709>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.985109,0.000000,17.592800>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<21.851200,0.000000,17.726709> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.851200,0.000000,17.894381>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.851200,0.000000,17.726709>}
box{<0,0,-0.076200><0.167672,0.035000,0.076200> rotate<0,-90.000000,0> translate<21.851200,0.000000,17.726709> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.851200,0.000000,21.638687>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.851200,0.000000,21.417597>}
box{<0,0,-0.076200><0.221091,0.035000,0.076200> rotate<0,-90.000000,0> translate<21.851200,0.000000,21.417597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.851200,0.000000,21.638687>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.985109,0.000000,21.772597>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<21.851200,0.000000,21.638687> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.874813,0.000000,16.002000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,16.002000>}
box{<0,0,-0.076200><5.099988,0.035000,0.076200> rotate<0,0.000000,0> translate<21.874813,0.000000,16.002000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.878084,0.000000,8.991600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,8.991600>}
box{<0,0,-0.076200><5.096716,0.035000,0.076200> rotate<0,0.000000,0> translate<21.878084,0.000000,8.991600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.878087,0.000000,9.906000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,9.906000>}
box{<0,0,-0.076200><5.096713,0.035000,0.076200> rotate<0,0.000000,0> translate<21.878087,0.000000,9.906000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.880216,0.000000,18.942997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.073216,0.000000,18.749997>}
box{<0,0,-0.076200><0.272943,0.035000,0.076200> rotate<0,44.997030,0> translate<21.880216,0.000000,18.942997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.892088,0.000000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,7.620000>}
box{<0,0,-0.076200><5.082712,0.035000,0.076200> rotate<0,0.000000,0> translate<21.892088,0.000000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.925612,0.000000,18.897600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.174109,0.000000,18.897600>}
box{<0,0,-0.076200><1.248497,0.035000,0.076200> rotate<0,0.000000,0> translate<21.925612,0.000000,18.897600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.926197,0.000000,7.654109>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.926197,0.000000,8.943487>}
box{<0,0,-0.076200><1.289378,0.035000,0.076200> rotate<0,90.000000,0> translate<21.926197,0.000000,8.943487> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.955494,0.000000,20.116800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.342600,0.000000,20.116800>}
box{<0,0,-0.076200><1.387106,0.035000,0.076200> rotate<0,0.000000,0> translate<21.955494,0.000000,20.116800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.965212,0.000000,11.277600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,11.277600>}
box{<0,0,-0.076200><5.009588,0.035000,0.076200> rotate<0,0.000000,0> translate<21.965212,0.000000,11.277600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.972056,-1.535000,15.392400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,15.392400>}
box{<0,0,-0.076200><5.002744,0.035000,0.076200> rotate<0,0.000000,0> translate<21.972056,-1.535000,15.392400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.985109,0.000000,17.592800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.996400,0.000000,17.592800>}
box{<0,0,-0.076200><0.011291,0.035000,0.076200> rotate<0,0.000000,0> translate<21.985109,0.000000,17.592800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.985109,0.000000,21.772597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.074488,0.000000,21.772597>}
box{<0,0,-0.076200><1.089378,0.035000,0.076200> rotate<0,0.000000,0> translate<21.985109,0.000000,21.772597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.996400,0.000000,17.592800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.996400,0.000000,17.467541>}
box{<0,0,-0.076200><0.125259,0.035000,0.076200> rotate<0,-90.000000,0> translate<21.996400,0.000000,17.467541> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.027213,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,15.849600>}
box{<0,0,-0.076200><4.947588,0.035000,0.076200> rotate<0,0.000000,0> translate<22.027213,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.052616,0.000000,15.824197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.275797,0.000000,15.601016>}
box{<0,0,-0.076200><0.315626,0.035000,0.076200> rotate<0,44.997030,0> translate<22.052616,0.000000,15.824197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.073216,0.000000,18.749997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.074488,0.000000,18.749997>}
box{<0,0,-0.076200><1.001272,0.035000,0.076200> rotate<0,0.000000,0> translate<22.073216,0.000000,18.749997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.107894,0.000000,20.269200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.220703,0.000000,20.269200>}
box{<0,0,-0.076200><1.112809,0.035000,0.076200> rotate<0,0.000000,0> translate<22.107894,0.000000,20.269200> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.260294,0.000000,20.421600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.068303,0.000000,20.421600>}
box{<0,0,-0.076200><0.808009,0.035000,0.076200> rotate<0,0.000000,0> translate<22.260294,0.000000,20.421600> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.412694,0.000000,20.574000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.915903,0.000000,20.574000>}
box{<0,0,-0.076200><0.503209,0.035000,0.076200> rotate<0,0.000000,0> translate<22.412694,0.000000,20.574000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.429256,-1.535000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,15.849600>}
box{<0,0,-0.076200><4.545544,0.035000,0.076200> rotate<0,0.000000,0> translate<22.429256,-1.535000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.454094,0.000000,20.615400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.874503,0.000000,20.615400>}
box{<0,0,-0.076200><0.420409,0.035000,0.076200> rotate<0,0.000000,0> translate<22.454094,0.000000,20.615400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.555200,0.000000,16.377581>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.778381,0.000000,16.154400>}
box{<0,0,-0.076200><0.315626,0.035000,0.076200> rotate<0,44.997030,0> translate<22.555200,0.000000,16.377581> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.581656,-1.535000,16.002000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,16.002000>}
box{<0,0,-0.076200><4.393144,0.035000,0.076200> rotate<0,0.000000,0> translate<22.581656,-1.535000,16.002000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.598341,-1.535000,17.627597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.910797,-1.535000,17.315141>}
box{<0,0,-0.076200><0.441880,0.035000,0.076200> rotate<0,44.997030,0> translate<22.598341,-1.535000,17.627597> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.758397,0.000000,17.467541>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.758397,0.000000,17.592800>}
box{<0,0,-0.076200><0.125259,0.035000,0.076200> rotate<0,90.000000,0> translate<22.758397,0.000000,17.592800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.758397,0.000000,17.467541>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.910797,0.000000,17.315141>}
box{<0,0,-0.076200><0.215526,0.035000,0.076200> rotate<0,44.997030,0> translate<22.758397,0.000000,17.467541> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.758397,0.000000,17.526000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.333200,0.000000,17.526000>}
box{<0,0,-0.076200><1.574803,0.035000,0.076200> rotate<0,0.000000,0> translate<22.758397,0.000000,17.526000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.758397,0.000000,17.592800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.074488,0.000000,17.592800>}
box{<0,0,-0.076200><0.316091,0.035000,0.076200> rotate<0,0.000000,0> translate<22.758397,0.000000,17.592800> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.874503,0.000000,20.615400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.342600,0.000000,20.147303>}
box{<0,0,-0.076200><0.661989,0.035000,0.076200> rotate<0,44.997030,0> translate<22.874503,0.000000,20.615400> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.045000,0.000000,19.026709>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.178909,0.000000,18.892800>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<23.045000,0.000000,19.026709> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.045000,0.000000,19.916087>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.045000,0.000000,19.026709>}
box{<0,0,-0.076200><0.889378,0.035000,0.076200> rotate<0,-90.000000,0> translate<23.045000,0.000000,19.026709> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.045000,0.000000,19.916087>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.178909,0.000000,20.049997>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<23.045000,0.000000,19.916087> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.074488,0.000000,17.592800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.208397,0.000000,17.726709>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<23.074488,0.000000,17.592800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.074488,0.000000,18.749997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.208397,0.000000,18.616088>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<23.074488,0.000000,18.749997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.074488,0.000000,21.772597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.208397,0.000000,21.638687>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<23.074488,0.000000,21.772597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.079284,0.000000,18.745200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.333200,0.000000,18.745200>}
box{<0,0,-0.076200><1.253916,0.035000,0.076200> rotate<0,0.000000,0> translate<23.079284,0.000000,18.745200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.094013,0.000000,16.916400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.819784,0.000000,16.916400>}
box{<0,0,-0.076200><0.725772,0.035000,0.076200> rotate<0,0.000000,0> translate<23.094013,0.000000,16.916400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.094016,0.000000,16.916397>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.819781,0.000000,16.916397>}
box{<0,0,-0.076200><0.725766,0.035000,0.076200> rotate<0,0.000000,0> translate<23.094016,0.000000,16.916397> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.160087,0.000000,17.678400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.333200,0.000000,17.678400>}
box{<0,0,-0.076200><1.173113,0.035000,0.076200> rotate<0,0.000000,0> translate<23.160087,0.000000,17.678400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.178909,0.000000,18.892800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.268287,0.000000,18.892800>}
box{<0,0,-0.076200><1.089378,0.035000,0.076200> rotate<0,0.000000,0> translate<23.178909,0.000000,18.892800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.178909,0.000000,20.049997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.342600,0.000000,20.049997>}
box{<0,0,-0.076200><0.163691,0.035000,0.076200> rotate<0,0.000000,0> translate<23.178909,0.000000,20.049997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.206284,0.000000,21.640800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,21.640800>}
box{<0,0,-0.076200><3.768516,0.035000,0.076200> rotate<0,0.000000,0> translate<23.206284,0.000000,21.640800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.208397,0.000000,17.726709>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.208397,0.000000,18.616088>}
box{<0,0,-0.076200><0.889378,0.035000,0.076200> rotate<0,90.000000,0> translate<23.208397,0.000000,18.616088> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.208397,0.000000,17.830800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.333200,0.000000,17.830800>}
box{<0,0,-0.076200><1.124803,0.035000,0.076200> rotate<0,0.000000,0> translate<23.208397,0.000000,17.830800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.208397,0.000000,17.983200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.333200,0.000000,17.983200>}
box{<0,0,-0.076200><1.124803,0.035000,0.076200> rotate<0,0.000000,0> translate<23.208397,0.000000,17.983200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.208397,0.000000,18.135600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.333200,0.000000,18.135600>}
box{<0,0,-0.076200><1.124803,0.035000,0.076200> rotate<0,0.000000,0> translate<23.208397,0.000000,18.135600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.208397,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.333200,0.000000,18.288000>}
box{<0,0,-0.076200><1.124803,0.035000,0.076200> rotate<0,0.000000,0> translate<23.208397,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.208397,0.000000,18.440400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.333200,0.000000,18.440400>}
box{<0,0,-0.076200><1.124803,0.035000,0.076200> rotate<0,0.000000,0> translate<23.208397,0.000000,18.440400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.208397,0.000000,18.592800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.333200,0.000000,18.592800>}
box{<0,0,-0.076200><1.124803,0.035000,0.076200> rotate<0,0.000000,0> translate<23.208397,0.000000,18.592800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.208397,0.000000,21.287294>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.208397,0.000000,21.638687>}
box{<0,0,-0.076200><0.351394,0.035000,0.076200> rotate<0,90.000000,0> translate<23.208397,0.000000,21.638687> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.208397,0.000000,21.287294>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.845494,0.000000,20.650197>}
box{<0,0,-0.076200><0.900991,0.035000,0.076200> rotate<0,44.997030,0> translate<23.208397,0.000000,21.287294> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.208397,0.000000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,21.336000>}
box{<0,0,-0.076200><3.766403,0.035000,0.076200> rotate<0,0.000000,0> translate<23.208397,0.000000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.208397,0.000000,21.488400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,21.488400>}
box{<0,0,-0.076200><3.766403,0.035000,0.076200> rotate<0,0.000000,0> translate<23.208397,0.000000,21.488400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.312091,0.000000,21.183600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,21.183600>}
box{<0,0,-0.076200><3.662709,0.035000,0.076200> rotate<0,0.000000,0> translate<23.312091,0.000000,21.183600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.342600,0.000000,20.147303>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.342600,0.000000,20.049997>}
box{<0,0,-0.076200><0.097306,0.035000,0.076200> rotate<0,-90.000000,0> translate<23.342600,0.000000,20.049997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.464491,0.000000,21.031200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,21.031200>}
box{<0,0,-0.076200><3.510309,0.035000,0.076200> rotate<0,0.000000,0> translate<23.464491,0.000000,21.031200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.616891,0.000000,20.878800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,20.878800>}
box{<0,0,-0.076200><3.357909,0.035000,0.076200> rotate<0,0.000000,0> translate<23.616891,0.000000,20.878800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.769291,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,20.726400>}
box{<0,0,-0.076200><3.205509,0.035000,0.076200> rotate<0,0.000000,0> translate<23.769291,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.819781,0.000000,16.916397>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.333200,0.000000,17.429816>}
box{<0,0,-0.076200><0.726084,0.035000,0.076200> rotate<0,-44.997030,0> translate<23.819781,0.000000,16.916397> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.845494,0.000000,20.650197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.881416,0.000000,20.650197>}
box{<0,0,-0.076200><0.035922,0.035000,0.076200> rotate<0,0.000000,0> translate<23.845494,0.000000,20.650197> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.325834,0.000000,18.950350>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.333200,0.000000,18.942981>}
box{<0,0,-0.076200><0.010419,0.035000,0.076200> rotate<0,45.009181,0> translate<24.325834,0.000000,18.950350> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.333200,0.000000,18.942981>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.333200,0.000000,17.429816>}
box{<0,0,-0.076200><1.513166,0.035000,0.076200> rotate<0,-90.000000,0> translate<24.333200,0.000000,17.429816> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,4.546597>}
box{<0,0,-0.076200><24.409403,0.035000,0.076200> rotate<0,-90.000000,0> translate<26.974800,0.000000,4.546597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,30.683200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,4.546597>}
box{<0,0,-0.076200><26.136603,0.035000,0.076200> rotate<0,-90.000000,0> translate<26.974800,-1.535000,4.546597> }
texture{col_pol}
}
#end
union{
//Holes(fast)/Vias
cylinder{<13.741400,0.038000,15.036800><13.741400,-1.538000,15.036800>0.152400 }
cylinder{<14.122400,0.038000,16.408400><14.122400,-1.538000,16.408400>0.152400 }
cylinder{<23.495000,0.038000,17.145000><23.495000,-1.538000,17.145000>0.152400 }
cylinder{<19.456400,0.038000,21.564600><19.456400,-1.538000,21.564600>0.152400 }
cylinder{<18.592800,0.038000,21.564600><18.592800,-1.538000,21.564600>0.152400 }
cylinder{<17.729200,0.038000,21.564600><17.729200,-1.538000,21.564600>0.152400 }
cylinder{<16.865600,0.038000,21.564600><16.865600,-1.538000,21.564600>0.152400 }
cylinder{<16.002000,0.038000,21.564600><16.002000,-1.538000,21.564600>0.152400 }
cylinder{<19.456400,0.038000,20.675600><19.456400,-1.538000,20.675600>0.152400 }
cylinder{<18.592800,0.038000,20.675600><18.592800,-1.538000,20.675600>0.152400 }
cylinder{<17.729200,0.038000,20.675600><17.729200,-1.538000,20.675600>0.152400 }
cylinder{<16.865600,0.038000,20.675600><16.865600,-1.538000,20.675600>0.152400 }
cylinder{<16.002000,0.038000,20.675600><16.002000,-1.538000,20.675600>0.152400 }
cylinder{<19.456400,0.038000,19.812000><19.456400,-1.538000,19.812000>0.152400 }
cylinder{<18.592800,0.038000,19.812000><18.592800,-1.538000,19.812000>0.152400 }
cylinder{<17.729200,0.038000,19.812000><17.729200,-1.538000,19.812000>0.152400 }
cylinder{<16.865600,0.038000,19.812000><16.865600,-1.538000,19.812000>0.152400 }
cylinder{<16.002000,0.038000,19.812000><16.002000,-1.538000,19.812000>0.152400 }
cylinder{<19.456400,0.038000,18.923000><19.456400,-1.538000,18.923000>0.152400 }
cylinder{<18.592800,0.038000,18.923000><18.592800,-1.538000,18.923000>0.152400 }
cylinder{<17.729200,0.038000,18.923000><17.729200,-1.538000,18.923000>0.152400 }
cylinder{<16.865600,0.038000,18.923000><16.865600,-1.538000,18.923000>0.152400 }
cylinder{<16.002000,0.038000,18.923000><16.002000,-1.538000,18.923000>0.152400 }
cylinder{<19.456400,0.038000,18.059400><19.456400,-1.538000,18.059400>0.152400 }
cylinder{<18.592800,0.038000,18.059400><18.592800,-1.538000,18.059400>0.152400 }
cylinder{<17.729200,0.038000,18.059400><17.729200,-1.538000,18.059400>0.152400 }
cylinder{<16.865600,0.038000,18.059400><16.865600,-1.538000,18.059400>0.152400 }
cylinder{<16.002000,0.038000,18.059400><16.002000,-1.538000,18.059400>0.152400 }
cylinder{<13.385800,0.038000,25.146000><13.385800,-1.538000,25.146000>0.152400 }
cylinder{<13.893800,0.038000,22.809200><13.893800,-1.538000,22.809200>0.152400 }
cylinder{<19.481800,0.038000,11.938000><19.481800,-1.538000,11.938000>0.152400 }
cylinder{<17.449800,0.038000,11.938000><17.449800,-1.538000,11.938000>0.152400 }
cylinder{<10.414000,0.038000,10.820400><10.414000,-1.538000,10.820400>0.152400 }
cylinder{<10.414000,0.038000,13.360400><10.414000,-1.538000,13.360400>0.152400 }
cylinder{<10.414000,0.038000,15.900400><10.414000,-1.538000,15.900400>0.152400 }
cylinder{<10.414000,0.038000,18.440400><10.414000,-1.538000,18.440400>0.152400 }
cylinder{<10.414000,0.038000,20.980400><10.414000,-1.538000,20.980400>0.152400 }
cylinder{<10.414000,0.038000,23.622000><10.414000,-1.538000,23.622000>0.152400 }
cylinder{<10.414000,0.038000,28.702000><10.414000,-1.538000,28.702000>0.152400 }
cylinder{<10.414000,0.038000,5.842000><10.414000,-1.538000,5.842000>0.152400 }
cylinder{<10.414000,0.038000,8.382000><10.414000,-1.538000,8.382000>0.152400 }
cylinder{<24.130000,0.038000,28.702000><24.130000,-1.538000,28.702000>0.152400 }
cylinder{<23.114000,0.038000,28.702000><23.114000,-1.538000,28.702000>0.152400 }
cylinder{<19.304000,0.038000,28.702000><19.304000,-1.538000,28.702000>0.152400 }
cylinder{<18.034000,0.038000,28.702000><18.034000,-1.538000,28.702000>0.152400 }
cylinder{<11.684000,0.038000,28.702000><11.684000,-1.538000,28.702000>0.152400 }
cylinder{<16.764000,0.038000,28.702000><16.764000,-1.538000,28.702000>0.152400 }
cylinder{<15.494000,0.038000,28.702000><15.494000,-1.538000,28.702000>0.152400 }
cylinder{<14.224000,0.038000,28.702000><14.224000,-1.538000,28.702000>0.152400 }
cylinder{<12.954000,0.038000,28.702000><12.954000,-1.538000,28.702000>0.152400 }
cylinder{<26.416000,0.038000,28.702000><26.416000,-1.538000,28.702000>0.152400 }
cylinder{<23.596600,0.038000,8.382000><23.596600,-1.538000,8.382000>0.152400 }
cylinder{<21.132800,0.038000,5.867400><21.132800,-1.538000,5.867400>0.152400 }
cylinder{<18.542000,0.038000,5.842000><18.542000,-1.538000,5.842000>0.152400 }
cylinder{<16.002000,0.038000,5.842000><16.002000,-1.538000,5.842000>0.152400 }
cylinder{<13.462000,0.038000,5.842000><13.462000,-1.538000,5.842000>0.152400 }
cylinder{<25.273000,0.038000,28.702000><25.273000,-1.538000,28.702000>0.152400 }
cylinder{<13.462000,0.038000,8.382000><13.462000,-1.538000,8.382000>0.152400 }
cylinder{<15.494000,0.038000,8.382000><15.494000,-1.538000,8.382000>0.152400 }
cylinder{<18.897600,0.038000,8.382000><18.897600,-1.538000,8.382000>0.152400 }
cylinder{<18.897600,0.038000,10.922000><18.897600,-1.538000,10.922000>0.152400 }
cylinder{<13.970000,0.038000,10.922000><13.970000,-1.538000,10.922000>0.152400 }
cylinder{<13.462000,0.038000,17.526000><13.462000,-1.538000,17.526000>0.152400 }
cylinder{<13.462000,0.038000,21.590000><13.462000,-1.538000,21.590000>0.152400 }
cylinder{<13.462000,0.038000,27.178000><13.462000,-1.538000,27.178000>0.152400 }
cylinder{<23.622000,0.038000,15.621000><23.622000,-1.538000,15.621000>0.152400 }
cylinder{<21.082000,0.038000,13.462000><21.082000,-1.538000,13.462000>0.152400 }
cylinder{<23.622000,0.038000,10.922000><23.622000,-1.538000,10.922000>0.152400 }
cylinder{<16.002000,0.038000,27.178000><16.002000,-1.538000,27.178000>0.152400 }
cylinder{<10.414000,0.038000,26.162000><10.414000,-1.538000,26.162000>0.152400 }
cylinder{<10.414000,0.038000,27.178000><10.414000,-1.538000,27.178000>0.152400 }
cylinder{<23.622000,0.038000,21.590000><23.622000,-1.538000,21.590000>0.152400 }
cylinder{<23.622000,0.038000,5.867400><23.622000,-1.538000,5.867400>0.152400 }
cylinder{<26.670000,0.038000,10.922000><26.670000,-1.538000,10.922000>0.152400 }
cylinder{<26.670000,0.038000,13.462000><26.670000,-1.538000,13.462000>0.152400 }
cylinder{<26.670000,0.038000,16.002000><26.670000,-1.538000,16.002000>0.152400 }
cylinder{<26.670000,0.038000,18.542000><26.670000,-1.538000,18.542000>0.152400 }
cylinder{<26.670000,0.038000,21.082000><26.670000,-1.538000,21.082000>0.152400 }
cylinder{<26.670000,0.038000,23.622000><26.670000,-1.538000,23.622000>0.152400 }
cylinder{<26.670000,0.038000,5.842000><26.670000,-1.538000,5.842000>0.152400 }
cylinder{<26.670000,0.038000,8.382000><26.670000,-1.538000,8.382000>0.152400 }
cylinder{<26.670000,0.038000,25.654000><26.670000,-1.538000,25.654000>0.152400 }
cylinder{<26.670000,0.038000,27.178000><26.670000,-1.538000,27.178000>0.152400 }
cylinder{<14.655800,0.038000,29.972000><14.655800,-1.538000,29.972000>0.190500 }
cylinder{<15.773400,0.038000,15.265400><15.773400,-1.538000,15.265400>0.152400 }
cylinder{<15.113000,0.038000,26.289000><15.113000,-1.538000,26.289000>0.152400 }
cylinder{<19.456400,0.038000,15.265400><19.456400,-1.538000,15.265400>0.152400 }
cylinder{<22.377400,0.038000,17.094200><22.377400,-1.538000,17.094200>0.152400 }
//Holes(fast)/Board
texture{col_hls}
}
#if(pcb_silkscreen=on)
//Silk Screen
union{
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.523159,0.000000,12.424459>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.396050,0.000000,12.297350>}
box{<0,0,-0.063500><0.179760,0.036000,0.063500> rotate<0,-44.997030,0> translate<24.396050,0.000000,12.297350> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.396050,0.000000,12.297350>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.396050,0.000000,12.043131>}
box{<0,0,-0.063500><0.254219,0.036000,0.063500> rotate<0,-90.000000,0> translate<24.396050,0.000000,12.043131> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.396050,0.000000,12.043131>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.523159,0.000000,11.916025>}
box{<0,0,-0.063500><0.179758,0.036000,0.063500> rotate<0,44.996326,0> translate<24.396050,0.000000,12.043131> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.523159,0.000000,11.916025>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.031594,0.000000,11.916025>}
box{<0,0,-0.063500><0.508434,0.036000,0.063500> rotate<0,0.000000,0> translate<24.523159,0.000000,11.916025> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.031594,0.000000,11.916025>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.158700,0.000000,12.043131>}
box{<0,0,-0.063500><0.179755,0.036000,0.063500> rotate<0,-44.997030,0> translate<25.031594,0.000000,11.916025> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.158700,0.000000,12.043131>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.158700,0.000000,12.297350>}
box{<0,0,-0.063500><0.254219,0.036000,0.063500> rotate<0,90.000000,0> translate<25.158700,0.000000,12.297350> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.158700,0.000000,12.297350>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.031594,0.000000,12.424459>}
box{<0,0,-0.063500><0.179758,0.036000,0.063500> rotate<0,44.997734,0> translate<25.031594,0.000000,12.424459> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.396050,0.000000,12.734603>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.523159,0.000000,12.734603>}
box{<0,0,-0.063500><0.127109,0.036000,0.063500> rotate<0,0.000000,0> translate<24.396050,0.000000,12.734603> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.523159,0.000000,12.734603>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.777375,0.000000,12.988819>}
box{<0,0,-0.063500><0.359515,0.036000,0.063500> rotate<0,-44.997030,0> translate<24.523159,0.000000,12.734603> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.777375,0.000000,12.988819>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.523159,0.000000,13.243037>}
box{<0,0,-0.063500><0.359517,0.036000,0.063500> rotate<0,44.997382,0> translate<24.523159,0.000000,13.243037> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.523159,0.000000,13.243037>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.396050,0.000000,13.243037>}
box{<0,0,-0.063500><0.127109,0.036000,0.063500> rotate<0,0.000000,0> translate<24.396050,0.000000,13.243037> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.777375,0.000000,12.988819>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.158700,0.000000,12.988819>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<24.777375,0.000000,12.988819> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.158700,0.000000,13.553181>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.396050,0.000000,13.553181>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,0.000000,0> translate<24.396050,0.000000,13.553181> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.396050,0.000000,13.553181>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.396050,0.000000,13.934506>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,90.000000,0> translate<24.396050,0.000000,13.934506> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.396050,0.000000,13.934506>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.523159,0.000000,14.061616>}
box{<0,0,-0.063500><0.179760,0.036000,0.063500> rotate<0,-44.997030,0> translate<24.396050,0.000000,13.934506> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.523159,0.000000,14.061616>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.777375,0.000000,14.061616>}
box{<0,0,-0.063500><0.254216,0.036000,0.063500> rotate<0,0.000000,0> translate<24.523159,0.000000,14.061616> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.777375,0.000000,14.061616>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.904484,0.000000,13.934506>}
box{<0,0,-0.063500><0.179760,0.036000,0.063500> rotate<0,44.997030,0> translate<24.777375,0.000000,14.061616> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.904484,0.000000,13.934506>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.904484,0.000000,13.553181>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,-90.000000,0> translate<24.904484,0.000000,13.553181> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.904484,0.000000,13.807397>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.158700,0.000000,14.061616>}
box{<0,0,-0.063500><0.359517,0.036000,0.063500> rotate<0,-44.997382,0> translate<24.904484,0.000000,13.807397> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.158700,0.000000,14.371759>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.396050,0.000000,14.371759>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,0.000000,0> translate<24.396050,0.000000,14.371759> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.396050,0.000000,14.371759>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.396050,0.000000,14.880194>}
box{<0,0,-0.063500><0.508434,0.036000,0.063500> rotate<0,90.000000,0> translate<24.396050,0.000000,14.880194> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.777375,0.000000,14.371759>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.777375,0.000000,14.625975>}
box{<0,0,-0.063500><0.254216,0.036000,0.063500> rotate<0,90.000000,0> translate<24.777375,0.000000,14.625975> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.396050,0.000000,15.698772>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.523159,0.000000,15.444553>}
box{<0,0,-0.063500><0.284225,0.036000,0.063500> rotate<0,63.430762,0> translate<24.396050,0.000000,15.698772> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.523159,0.000000,15.444553>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.777375,0.000000,15.190338>}
box{<0,0,-0.063500><0.359515,0.036000,0.063500> rotate<0,44.997030,0> translate<24.523159,0.000000,15.444553> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.777375,0.000000,15.190338>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.031594,0.000000,15.190338>}
box{<0,0,-0.063500><0.254219,0.036000,0.063500> rotate<0,0.000000,0> translate<24.777375,0.000000,15.190338> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.031594,0.000000,15.190338>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.158700,0.000000,15.317444>}
box{<0,0,-0.063500><0.179755,0.036000,0.063500> rotate<0,-44.997030,0> translate<25.031594,0.000000,15.190338> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.158700,0.000000,15.317444>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.158700,0.000000,15.571663>}
box{<0,0,-0.063500><0.254219,0.036000,0.063500> rotate<0,90.000000,0> translate<25.158700,0.000000,15.571663> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.158700,0.000000,15.571663>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.031594,0.000000,15.698772>}
box{<0,0,-0.063500><0.179758,0.036000,0.063500> rotate<0,44.997734,0> translate<25.031594,0.000000,15.698772> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.031594,0.000000,15.698772>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.904484,0.000000,15.698772>}
box{<0,0,-0.063500><0.127109,0.036000,0.063500> rotate<0,0.000000,0> translate<24.904484,0.000000,15.698772> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.904484,0.000000,15.698772>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.777375,0.000000,15.571663>}
box{<0,0,-0.063500><0.179760,0.036000,0.063500> rotate<0,-44.997030,0> translate<24.777375,0.000000,15.571663> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.777375,0.000000,15.571663>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.777375,0.000000,15.190338>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,-90.000000,0> translate<24.777375,0.000000,15.190338> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.031594,0.000000,16.008916>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.158700,0.000000,16.136022>}
box{<0,0,-0.063500><0.179755,0.036000,0.063500> rotate<0,-44.997030,0> translate<25.031594,0.000000,16.008916> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.158700,0.000000,16.136022>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.158700,0.000000,16.390241>}
box{<0,0,-0.063500><0.254219,0.036000,0.063500> rotate<0,90.000000,0> translate<25.158700,0.000000,16.390241> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.158700,0.000000,16.390241>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.031594,0.000000,16.517350>}
box{<0,0,-0.063500><0.179758,0.036000,0.063500> rotate<0,44.997734,0> translate<25.031594,0.000000,16.517350> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.031594,0.000000,16.517350>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.523159,0.000000,16.517350>}
box{<0,0,-0.063500><0.508434,0.036000,0.063500> rotate<0,0.000000,0> translate<24.523159,0.000000,16.517350> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.523159,0.000000,16.517350>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.396050,0.000000,16.390241>}
box{<0,0,-0.063500><0.179760,0.036000,0.063500> rotate<0,-44.997030,0> translate<24.396050,0.000000,16.390241> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.396050,0.000000,16.390241>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.396050,0.000000,16.136022>}
box{<0,0,-0.063500><0.254219,0.036000,0.063500> rotate<0,-90.000000,0> translate<24.396050,0.000000,16.136022> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.396050,0.000000,16.136022>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.523159,0.000000,16.008916>}
box{<0,0,-0.063500><0.179758,0.036000,0.063500> rotate<0,44.996326,0> translate<24.396050,0.000000,16.136022> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.523159,0.000000,16.008916>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.650266,0.000000,16.008916>}
box{<0,0,-0.063500><0.127106,0.036000,0.063500> rotate<0,0.000000,0> translate<24.523159,0.000000,16.008916> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.650266,0.000000,16.008916>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.777375,0.000000,16.136022>}
box{<0,0,-0.063500><0.179758,0.036000,0.063500> rotate<0,-44.996326,0> translate<24.650266,0.000000,16.008916> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.777375,0.000000,16.136022>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.777375,0.000000,16.517350>}
box{<0,0,-0.063500><0.381328,0.036000,0.063500> rotate<0,90.000000,0> translate<24.777375,0.000000,16.517350> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.523159,0.000000,16.827494>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.396050,0.000000,16.954600>}
box{<0,0,-0.063500><0.179758,0.036000,0.063500> rotate<0,44.996326,0> translate<24.396050,0.000000,16.954600> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.396050,0.000000,16.954600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.396050,0.000000,17.208819>}
box{<0,0,-0.063500><0.254219,0.036000,0.063500> rotate<0,90.000000,0> translate<24.396050,0.000000,17.208819> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.396050,0.000000,17.208819>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.523159,0.000000,17.335928>}
box{<0,0,-0.063500><0.179760,0.036000,0.063500> rotate<0,-44.997030,0> translate<24.396050,0.000000,17.208819> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.523159,0.000000,17.335928>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.650266,0.000000,17.335928>}
box{<0,0,-0.063500><0.127106,0.036000,0.063500> rotate<0,0.000000,0> translate<24.523159,0.000000,17.335928> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.650266,0.000000,17.335928>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.777375,0.000000,17.208819>}
box{<0,0,-0.063500><0.179760,0.036000,0.063500> rotate<0,44.997030,0> translate<24.650266,0.000000,17.335928> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.777375,0.000000,17.208819>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.777375,0.000000,17.081709>}
box{<0,0,-0.063500><0.127109,0.036000,0.063500> rotate<0,-90.000000,0> translate<24.777375,0.000000,17.081709> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.777375,0.000000,17.208819>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.904484,0.000000,17.335928>}
box{<0,0,-0.063500><0.179760,0.036000,0.063500> rotate<0,-44.997030,0> translate<24.777375,0.000000,17.208819> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.904484,0.000000,17.335928>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.031594,0.000000,17.335928>}
box{<0,0,-0.063500><0.127109,0.036000,0.063500> rotate<0,0.000000,0> translate<24.904484,0.000000,17.335928> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.031594,0.000000,17.335928>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.158700,0.000000,17.208819>}
box{<0,0,-0.063500><0.179758,0.036000,0.063500> rotate<0,44.997734,0> translate<25.031594,0.000000,17.335928> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.158700,0.000000,17.208819>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.158700,0.000000,16.954600>}
box{<0,0,-0.063500><0.254219,0.036000,0.063500> rotate<0,-90.000000,0> translate<25.158700,0.000000,16.954600> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.158700,0.000000,16.954600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.031594,0.000000,16.827494>}
box{<0,0,-0.063500><0.179755,0.036000,0.063500> rotate<0,-44.997030,0> translate<25.031594,0.000000,16.827494> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.396050,0.000000,18.154506>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.523159,0.000000,17.900288>}
box{<0,0,-0.063500><0.284225,0.036000,0.063500> rotate<0,63.430762,0> translate<24.396050,0.000000,18.154506> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.523159,0.000000,17.900288>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.777375,0.000000,17.646072>}
box{<0,0,-0.063500><0.359515,0.036000,0.063500> rotate<0,44.997030,0> translate<24.523159,0.000000,17.900288> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.777375,0.000000,17.646072>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.031594,0.000000,17.646072>}
box{<0,0,-0.063500><0.254219,0.036000,0.063500> rotate<0,0.000000,0> translate<24.777375,0.000000,17.646072> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.031594,0.000000,17.646072>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.158700,0.000000,17.773178>}
box{<0,0,-0.063500><0.179755,0.036000,0.063500> rotate<0,-44.997030,0> translate<25.031594,0.000000,17.646072> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.158700,0.000000,17.773178>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.158700,0.000000,18.027397>}
box{<0,0,-0.063500><0.254219,0.036000,0.063500> rotate<0,90.000000,0> translate<25.158700,0.000000,18.027397> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.158700,0.000000,18.027397>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.031594,0.000000,18.154506>}
box{<0,0,-0.063500><0.179758,0.036000,0.063500> rotate<0,44.997734,0> translate<25.031594,0.000000,18.154506> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.031594,0.000000,18.154506>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.904484,0.000000,18.154506>}
box{<0,0,-0.063500><0.127109,0.036000,0.063500> rotate<0,0.000000,0> translate<24.904484,0.000000,18.154506> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.904484,0.000000,18.154506>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.777375,0.000000,18.027397>}
box{<0,0,-0.063500><0.179760,0.036000,0.063500> rotate<0,-44.997030,0> translate<24.777375,0.000000,18.027397> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.777375,0.000000,18.027397>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.777375,0.000000,17.646072>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,-90.000000,0> translate<24.777375,0.000000,17.646072> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.777375,0.000000,18.464650>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.777375,0.000000,18.973084>}
box{<0,0,-0.063500><0.508434,0.036000,0.063500> rotate<0,90.000000,0> translate<24.777375,0.000000,18.973084> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.158700,0.000000,19.283228>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.396050,0.000000,19.283228>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,0.000000,0> translate<24.396050,0.000000,19.283228> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.396050,0.000000,19.283228>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.396050,0.000000,19.664553>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,90.000000,0> translate<24.396050,0.000000,19.664553> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.396050,0.000000,19.664553>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.523159,0.000000,19.791663>}
box{<0,0,-0.063500><0.179760,0.036000,0.063500> rotate<0,-44.997030,0> translate<24.396050,0.000000,19.664553> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.523159,0.000000,19.791663>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.650266,0.000000,19.791663>}
box{<0,0,-0.063500><0.127106,0.036000,0.063500> rotate<0,0.000000,0> translate<24.523159,0.000000,19.791663> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.650266,0.000000,19.791663>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.777375,0.000000,19.664553>}
box{<0,0,-0.063500><0.179760,0.036000,0.063500> rotate<0,44.997030,0> translate<24.650266,0.000000,19.791663> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.777375,0.000000,19.664553>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.904484,0.000000,19.791663>}
box{<0,0,-0.063500><0.179760,0.036000,0.063500> rotate<0,-44.997030,0> translate<24.777375,0.000000,19.664553> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.904484,0.000000,19.791663>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.031594,0.000000,19.791663>}
box{<0,0,-0.063500><0.127109,0.036000,0.063500> rotate<0,0.000000,0> translate<24.904484,0.000000,19.791663> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.031594,0.000000,19.791663>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.158700,0.000000,19.664553>}
box{<0,0,-0.063500><0.179758,0.036000,0.063500> rotate<0,44.997734,0> translate<25.031594,0.000000,19.791663> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.158700,0.000000,19.664553>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.158700,0.000000,19.283228>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,-90.000000,0> translate<25.158700,0.000000,19.283228> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.777375,0.000000,19.283228>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.777375,0.000000,19.664553>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,90.000000,0> translate<24.777375,0.000000,19.664553> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.158700,0.000000,20.228912>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.158700,0.000000,20.483131>}
box{<0,0,-0.063500><0.254219,0.036000,0.063500> rotate<0,90.000000,0> translate<25.158700,0.000000,20.483131> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.158700,0.000000,20.483131>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.031594,0.000000,20.610241>}
box{<0,0,-0.063500><0.179758,0.036000,0.063500> rotate<0,44.997734,0> translate<25.031594,0.000000,20.610241> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.031594,0.000000,20.610241>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.777375,0.000000,20.610241>}
box{<0,0,-0.063500><0.254219,0.036000,0.063500> rotate<0,0.000000,0> translate<24.777375,0.000000,20.610241> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.777375,0.000000,20.610241>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.650266,0.000000,20.483131>}
box{<0,0,-0.063500><0.179760,0.036000,0.063500> rotate<0,-44.997030,0> translate<24.650266,0.000000,20.483131> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.650266,0.000000,20.483131>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.650266,0.000000,20.228912>}
box{<0,0,-0.063500><0.254219,0.036000,0.063500> rotate<0,-90.000000,0> translate<24.650266,0.000000,20.228912> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.650266,0.000000,20.228912>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.777375,0.000000,20.101806>}
box{<0,0,-0.063500><0.179758,0.036000,0.063500> rotate<0,44.996326,0> translate<24.650266,0.000000,20.228912> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.777375,0.000000,20.101806>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.031594,0.000000,20.101806>}
box{<0,0,-0.063500><0.254219,0.036000,0.063500> rotate<0,0.000000,0> translate<24.777375,0.000000,20.101806> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.031594,0.000000,20.101806>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.158700,0.000000,20.228912>}
box{<0,0,-0.063500><0.179755,0.036000,0.063500> rotate<0,-44.997030,0> translate<25.031594,0.000000,20.101806> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.158700,0.000000,20.920384>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.396050,0.000000,20.920384>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,0.000000,0> translate<24.396050,0.000000,20.920384> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.396050,0.000000,20.920384>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.396050,0.000000,21.301709>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,90.000000,0> translate<24.396050,0.000000,21.301709> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.396050,0.000000,21.301709>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.523159,0.000000,21.428819>}
box{<0,0,-0.063500><0.179760,0.036000,0.063500> rotate<0,-44.997030,0> translate<24.396050,0.000000,21.301709> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.523159,0.000000,21.428819>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.650266,0.000000,21.428819>}
box{<0,0,-0.063500><0.127106,0.036000,0.063500> rotate<0,0.000000,0> translate<24.523159,0.000000,21.428819> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.650266,0.000000,21.428819>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.777375,0.000000,21.301709>}
box{<0,0,-0.063500><0.179760,0.036000,0.063500> rotate<0,44.997030,0> translate<24.650266,0.000000,21.428819> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.777375,0.000000,21.301709>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.904484,0.000000,21.428819>}
box{<0,0,-0.063500><0.179760,0.036000,0.063500> rotate<0,-44.997030,0> translate<24.777375,0.000000,21.301709> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.904484,0.000000,21.428819>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.031594,0.000000,21.428819>}
box{<0,0,-0.063500><0.127109,0.036000,0.063500> rotate<0,0.000000,0> translate<24.904484,0.000000,21.428819> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.031594,0.000000,21.428819>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.158700,0.000000,21.301709>}
box{<0,0,-0.063500><0.179758,0.036000,0.063500> rotate<0,44.997734,0> translate<25.031594,0.000000,21.428819> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.158700,0.000000,21.301709>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.158700,0.000000,20.920384>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,-90.000000,0> translate<25.158700,0.000000,20.920384> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.777375,0.000000,20.920384>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.777375,0.000000,21.301709>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,90.000000,0> translate<24.777375,0.000000,21.301709> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.271978,0.000000,8.173947>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.377900,0.000000,8.279869>}
box{<0,0,-0.063500><0.149796,0.036000,0.063500> rotate<0,-44.997030,0> translate<26.271978,0.000000,8.173947> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.377900,0.000000,8.279869>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.377900,0.000000,8.385794>}
box{<0,0,-0.063500><0.105925,0.036000,0.063500> rotate<0,90.000000,0> translate<26.377900,0.000000,8.385794> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.377900,0.000000,8.385794>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.271978,0.000000,8.491716>}
box{<0,0,-0.063500><0.149796,0.036000,0.063500> rotate<0,44.997030,0> translate<26.271978,0.000000,8.491716> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.271978,0.000000,8.491716>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.742359,0.000000,8.491716>}
box{<0,0,-0.063500><0.529619,0.036000,0.063500> rotate<0,0.000000,0> translate<25.742359,0.000000,8.491716> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.742359,0.000000,8.385794>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.742359,0.000000,8.597641>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,90.000000,0> translate<25.742359,0.000000,8.597641> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.377900,0.000000,9.577222>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.742359,0.000000,9.577222>}
box{<0,0,-0.063500><0.635541,0.036000,0.063500> rotate<0,0.000000,0> translate<25.742359,0.000000,9.577222> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.742359,0.000000,9.577222>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.954206,0.000000,9.789069>}
box{<0,0,-0.063500><0.299597,0.036000,0.063500> rotate<0,-44.997030,0> translate<25.742359,0.000000,9.577222> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.954206,0.000000,9.789069>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.742359,0.000000,10.000916>}
box{<0,0,-0.063500><0.299597,0.036000,0.063500> rotate<0,44.997030,0> translate<25.742359,0.000000,10.000916> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.742359,0.000000,10.000916>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.377900,0.000000,10.000916>}
box{<0,0,-0.063500><0.635541,0.036000,0.063500> rotate<0,0.000000,0> translate<25.742359,0.000000,10.000916> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.377900,0.000000,10.384781>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.377900,0.000000,10.596628>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,90.000000,0> translate<26.377900,0.000000,10.596628> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.377900,0.000000,10.596628>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.271978,0.000000,10.702553>}
box{<0,0,-0.063500><0.149798,0.036000,0.063500> rotate<0,44.997875,0> translate<26.271978,0.000000,10.702553> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.271978,0.000000,10.702553>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.060131,0.000000,10.702553>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,0.000000,0> translate<26.060131,0.000000,10.702553> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.060131,0.000000,10.702553>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.954206,0.000000,10.596628>}
box{<0,0,-0.063500><0.149801,0.036000,0.063500> rotate<0,-44.997030,0> translate<25.954206,0.000000,10.596628> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.954206,0.000000,10.596628>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.954206,0.000000,10.384781>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,-90.000000,0> translate<25.954206,0.000000,10.384781> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.954206,0.000000,10.384781>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.060131,0.000000,10.278859>}
box{<0,0,-0.063500><0.149798,0.036000,0.063500> rotate<0,44.996185,0> translate<25.954206,0.000000,10.384781> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.060131,0.000000,10.278859>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.271978,0.000000,10.278859>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,0.000000,0> translate<26.060131,0.000000,10.278859> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.271978,0.000000,10.278859>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.377900,0.000000,10.384781>}
box{<0,0,-0.063500><0.149796,0.036000,0.063500> rotate<0,-44.997030,0> translate<26.271978,0.000000,10.278859> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.377900,0.000000,10.980497>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.954206,0.000000,10.980497>}
box{<0,0,-0.063500><0.423694,0.036000,0.063500> rotate<0,0.000000,0> translate<25.954206,0.000000,10.980497> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.166053,0.000000,10.980497>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.954206,0.000000,11.192344>}
box{<0,0,-0.063500><0.299597,0.036000,0.063500> rotate<0,44.997030,0> translate<25.954206,0.000000,11.192344> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.954206,0.000000,11.192344>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.954206,0.000000,11.298266>}
box{<0,0,-0.063500><0.105922,0.036000,0.063500> rotate<0,90.000000,0> translate<25.954206,0.000000,11.298266> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.377900,0.000000,11.882963>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.377900,0.000000,11.671116>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,-90.000000,0> translate<26.377900,0.000000,11.671116> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.377900,0.000000,11.671116>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.271978,0.000000,11.565194>}
box{<0,0,-0.063500><0.149796,0.036000,0.063500> rotate<0,-44.997030,0> translate<26.271978,0.000000,11.565194> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.271978,0.000000,11.565194>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.060131,0.000000,11.565194>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,0.000000,0> translate<26.060131,0.000000,11.565194> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.060131,0.000000,11.565194>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.954206,0.000000,11.671116>}
box{<0,0,-0.063500><0.149798,0.036000,0.063500> rotate<0,44.996185,0> translate<25.954206,0.000000,11.671116> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.954206,0.000000,11.671116>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.954206,0.000000,11.882963>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,90.000000,0> translate<25.954206,0.000000,11.882963> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.954206,0.000000,11.882963>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.060131,0.000000,11.988888>}
box{<0,0,-0.063500><0.149801,0.036000,0.063500> rotate<0,-44.997030,0> translate<25.954206,0.000000,11.882963> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.060131,0.000000,11.988888>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.166053,0.000000,11.988888>}
box{<0,0,-0.063500><0.105922,0.036000,0.063500> rotate<0,0.000000,0> translate<26.060131,0.000000,11.988888> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.166053,0.000000,11.988888>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.166053,0.000000,11.565194>}
box{<0,0,-0.063500><0.423694,0.036000,0.063500> rotate<0,-90.000000,0> translate<26.166053,0.000000,11.565194> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.742359,0.000000,12.266831>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.742359,0.000000,12.372753>}
box{<0,0,-0.063500><0.105922,0.036000,0.063500> rotate<0,90.000000,0> translate<25.742359,0.000000,12.372753> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.742359,0.000000,12.372753>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.377900,0.000000,12.372753>}
box{<0,0,-0.063500><0.635541,0.036000,0.063500> rotate<0,0.000000,0> translate<25.742359,0.000000,12.372753> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.377900,0.000000,12.266831>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.377900,0.000000,12.478678>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,90.000000,0> translate<26.377900,0.000000,12.478678> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.954206,0.000000,12.840513>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.954206,0.000000,13.052359>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,90.000000,0> translate<25.954206,0.000000,13.052359> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.954206,0.000000,13.052359>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.060131,0.000000,13.158284>}
box{<0,0,-0.063500><0.149801,0.036000,0.063500> rotate<0,-44.997030,0> translate<25.954206,0.000000,13.052359> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.060131,0.000000,13.158284>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.377900,0.000000,13.158284>}
box{<0,0,-0.063500><0.317769,0.036000,0.063500> rotate<0,0.000000,0> translate<26.060131,0.000000,13.158284> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.377900,0.000000,13.158284>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.377900,0.000000,12.840513>}
box{<0,0,-0.063500><0.317772,0.036000,0.063500> rotate<0,-90.000000,0> translate<26.377900,0.000000,12.840513> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.377900,0.000000,12.840513>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.271978,0.000000,12.734591>}
box{<0,0,-0.063500><0.149796,0.036000,0.063500> rotate<0,-44.997030,0> translate<26.271978,0.000000,12.734591> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.271978,0.000000,12.734591>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.166053,0.000000,12.840513>}
box{<0,0,-0.063500><0.149798,0.036000,0.063500> rotate<0,44.996185,0> translate<26.166053,0.000000,12.840513> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.166053,0.000000,12.840513>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.166053,0.000000,13.158284>}
box{<0,0,-0.063500><0.317772,0.036000,0.063500> rotate<0,90.000000,0> translate<26.166053,0.000000,13.158284> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.377900,0.000000,13.436228>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.954206,0.000000,13.436228>}
box{<0,0,-0.063500><0.423694,0.036000,0.063500> rotate<0,0.000000,0> translate<25.954206,0.000000,13.436228> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.954206,0.000000,13.436228>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.954206,0.000000,13.753997>}
box{<0,0,-0.063500><0.317769,0.036000,0.063500> rotate<0,90.000000,0> translate<25.954206,0.000000,13.753997> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.954206,0.000000,13.753997>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.060131,0.000000,13.859922>}
box{<0,0,-0.063500><0.149801,0.036000,0.063500> rotate<0,-44.997030,0> translate<25.954206,0.000000,13.753997> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.060131,0.000000,13.859922>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.377900,0.000000,13.859922>}
box{<0,0,-0.063500><0.317769,0.036000,0.063500> rotate<0,0.000000,0> translate<26.060131,0.000000,13.859922> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.742359,0.000000,14.561559>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.377900,0.000000,14.561559>}
box{<0,0,-0.063500><0.635541,0.036000,0.063500> rotate<0,0.000000,0> translate<25.742359,0.000000,14.561559> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.377900,0.000000,14.561559>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.377900,0.000000,14.243787>}
box{<0,0,-0.063500><0.317772,0.036000,0.063500> rotate<0,-90.000000,0> translate<26.377900,0.000000,14.243787> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.377900,0.000000,14.243787>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.271978,0.000000,14.137866>}
box{<0,0,-0.063500><0.149796,0.036000,0.063500> rotate<0,-44.997030,0> translate<26.271978,0.000000,14.137866> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.271978,0.000000,14.137866>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.060131,0.000000,14.137866>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,0.000000,0> translate<26.060131,0.000000,14.137866> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.060131,0.000000,14.137866>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.954206,0.000000,14.243787>}
box{<0,0,-0.063500><0.149798,0.036000,0.063500> rotate<0,44.996185,0> translate<25.954206,0.000000,14.243787> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.954206,0.000000,14.243787>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.954206,0.000000,14.561559>}
box{<0,0,-0.063500><0.317772,0.036000,0.063500> rotate<0,90.000000,0> translate<25.954206,0.000000,14.561559> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.742359,0.000000,15.964834>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.742359,0.000000,15.541141>}
box{<0,0,-0.063500><0.423694,0.036000,0.063500> rotate<0,-90.000000,0> translate<25.742359,0.000000,15.541141> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.742359,0.000000,15.541141>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.377900,0.000000,15.541141>}
box{<0,0,-0.063500><0.635541,0.036000,0.063500> rotate<0,0.000000,0> translate<25.742359,0.000000,15.541141> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.377900,0.000000,15.541141>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.377900,0.000000,15.964834>}
box{<0,0,-0.063500><0.423694,0.036000,0.063500> rotate<0,90.000000,0> translate<26.377900,0.000000,15.964834> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.060131,0.000000,15.541141>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.060131,0.000000,15.752988>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,90.000000,0> translate<26.060131,0.000000,15.752988> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.377900,0.000000,16.242778>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.954206,0.000000,16.242778>}
box{<0,0,-0.063500><0.423694,0.036000,0.063500> rotate<0,0.000000,0> translate<25.954206,0.000000,16.242778> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.954206,0.000000,16.242778>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.954206,0.000000,16.560547>}
box{<0,0,-0.063500><0.317769,0.036000,0.063500> rotate<0,90.000000,0> translate<25.954206,0.000000,16.560547> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.954206,0.000000,16.560547>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.060131,0.000000,16.666472>}
box{<0,0,-0.063500><0.149801,0.036000,0.063500> rotate<0,-44.997030,0> translate<25.954206,0.000000,16.560547> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.060131,0.000000,16.666472>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.377900,0.000000,16.666472>}
box{<0,0,-0.063500><0.317769,0.036000,0.063500> rotate<0,0.000000,0> translate<26.060131,0.000000,16.666472> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.589747,0.000000,17.156263>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.589747,0.000000,17.262184>}
box{<0,0,-0.063500><0.105922,0.036000,0.063500> rotate<0,90.000000,0> translate<26.589747,0.000000,17.262184> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.589747,0.000000,17.262184>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.483822,0.000000,17.368109>}
box{<0,0,-0.063500><0.149801,0.036000,0.063500> rotate<0,44.997030,0> translate<26.483822,0.000000,17.368109> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.483822,0.000000,17.368109>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.954206,0.000000,17.368109>}
box{<0,0,-0.063500><0.529616,0.036000,0.063500> rotate<0,0.000000,0> translate<25.954206,0.000000,17.368109> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.954206,0.000000,17.368109>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.954206,0.000000,17.050338>}
box{<0,0,-0.063500><0.317772,0.036000,0.063500> rotate<0,-90.000000,0> translate<25.954206,0.000000,17.050338> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.954206,0.000000,17.050338>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.060131,0.000000,16.944416>}
box{<0,0,-0.063500><0.149798,0.036000,0.063500> rotate<0,44.996185,0> translate<25.954206,0.000000,17.050338> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.060131,0.000000,16.944416>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.271978,0.000000,16.944416>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,0.000000,0> translate<26.060131,0.000000,16.944416> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.271978,0.000000,16.944416>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.377900,0.000000,17.050338>}
box{<0,0,-0.063500><0.149796,0.036000,0.063500> rotate<0,-44.997030,0> translate<26.271978,0.000000,16.944416> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.377900,0.000000,17.050338>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.377900,0.000000,17.368109>}
box{<0,0,-0.063500><0.317772,0.036000,0.063500> rotate<0,90.000000,0> translate<26.377900,0.000000,17.368109> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.954206,0.000000,17.646053>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.954206,0.000000,17.751975>}
box{<0,0,-0.063500><0.105922,0.036000,0.063500> rotate<0,90.000000,0> translate<25.954206,0.000000,17.751975> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.954206,0.000000,17.751975>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.377900,0.000000,17.751975>}
box{<0,0,-0.063500><0.423694,0.036000,0.063500> rotate<0,0.000000,0> translate<25.954206,0.000000,17.751975> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.377900,0.000000,17.646053>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.377900,0.000000,17.857900>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,90.000000,0> translate<26.377900,0.000000,17.857900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.636434,0.000000,17.751975>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.742359,0.000000,17.751975>}
box{<0,0,-0.063500><0.105925,0.036000,0.063500> rotate<0,0.000000,0> translate<25.636434,0.000000,17.751975> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.377900,0.000000,18.113813>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.954206,0.000000,18.113813>}
box{<0,0,-0.063500><0.423694,0.036000,0.063500> rotate<0,0.000000,0> translate<25.954206,0.000000,18.113813> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.954206,0.000000,18.113813>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.954206,0.000000,18.431581>}
box{<0,0,-0.063500><0.317769,0.036000,0.063500> rotate<0,90.000000,0> translate<25.954206,0.000000,18.431581> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.954206,0.000000,18.431581>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.060131,0.000000,18.537506>}
box{<0,0,-0.063500><0.149801,0.036000,0.063500> rotate<0,-44.997030,0> translate<25.954206,0.000000,18.431581> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.060131,0.000000,18.537506>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.377900,0.000000,18.537506>}
box{<0,0,-0.063500><0.317769,0.036000,0.063500> rotate<0,0.000000,0> translate<26.060131,0.000000,18.537506> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.377900,0.000000,19.133219>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.377900,0.000000,18.921372>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,-90.000000,0> translate<26.377900,0.000000,18.921372> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.377900,0.000000,18.921372>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.271978,0.000000,18.815450>}
box{<0,0,-0.063500><0.149796,0.036000,0.063500> rotate<0,-44.997030,0> translate<26.271978,0.000000,18.815450> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.271978,0.000000,18.815450>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.060131,0.000000,18.815450>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,0.000000,0> translate<26.060131,0.000000,18.815450> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.060131,0.000000,18.815450>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.954206,0.000000,18.921372>}
box{<0,0,-0.063500><0.149798,0.036000,0.063500> rotate<0,44.996185,0> translate<25.954206,0.000000,18.921372> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.954206,0.000000,18.921372>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.954206,0.000000,19.133219>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,90.000000,0> translate<25.954206,0.000000,19.133219> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.954206,0.000000,19.133219>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.060131,0.000000,19.239144>}
box{<0,0,-0.063500><0.149801,0.036000,0.063500> rotate<0,-44.997030,0> translate<25.954206,0.000000,19.133219> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.060131,0.000000,19.239144>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.166053,0.000000,19.239144>}
box{<0,0,-0.063500><0.105922,0.036000,0.063500> rotate<0,0.000000,0> translate<26.060131,0.000000,19.239144> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.166053,0.000000,19.239144>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.166053,0.000000,18.815450>}
box{<0,0,-0.063500><0.423694,0.036000,0.063500> rotate<0,-90.000000,0> translate<26.166053,0.000000,18.815450> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.377900,0.000000,19.834856>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.377900,0.000000,19.623009>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,-90.000000,0> translate<26.377900,0.000000,19.623009> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.377900,0.000000,19.623009>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.271978,0.000000,19.517088>}
box{<0,0,-0.063500><0.149796,0.036000,0.063500> rotate<0,-44.997030,0> translate<26.271978,0.000000,19.517088> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.271978,0.000000,19.517088>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.060131,0.000000,19.517088>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,0.000000,0> translate<26.060131,0.000000,19.517088> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.060131,0.000000,19.517088>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.954206,0.000000,19.623009>}
box{<0,0,-0.063500><0.149798,0.036000,0.063500> rotate<0,44.996185,0> translate<25.954206,0.000000,19.623009> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.954206,0.000000,19.623009>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.954206,0.000000,19.834856>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,90.000000,0> translate<25.954206,0.000000,19.834856> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.954206,0.000000,19.834856>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.060131,0.000000,19.940781>}
box{<0,0,-0.063500><0.149801,0.036000,0.063500> rotate<0,-44.997030,0> translate<25.954206,0.000000,19.834856> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.060131,0.000000,19.940781>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.166053,0.000000,19.940781>}
box{<0,0,-0.063500><0.105922,0.036000,0.063500> rotate<0,0.000000,0> translate<26.060131,0.000000,19.940781> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.166053,0.000000,19.940781>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.166053,0.000000,19.517088>}
box{<0,0,-0.063500><0.423694,0.036000,0.063500> rotate<0,-90.000000,0> translate<26.166053,0.000000,19.517088> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.377900,0.000000,20.218725>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.954206,0.000000,20.218725>}
box{<0,0,-0.063500><0.423694,0.036000,0.063500> rotate<0,0.000000,0> translate<25.954206,0.000000,20.218725> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.166053,0.000000,20.218725>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.954206,0.000000,20.430572>}
box{<0,0,-0.063500><0.299597,0.036000,0.063500> rotate<0,44.997030,0> translate<25.954206,0.000000,20.430572> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.954206,0.000000,20.430572>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.954206,0.000000,20.536494>}
box{<0,0,-0.063500><0.105922,0.036000,0.063500> rotate<0,90.000000,0> translate<25.954206,0.000000,20.536494> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.954206,0.000000,20.803422>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.954206,0.000000,20.909344>}
box{<0,0,-0.063500><0.105922,0.036000,0.063500> rotate<0,90.000000,0> translate<25.954206,0.000000,20.909344> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.954206,0.000000,20.909344>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.377900,0.000000,20.909344>}
box{<0,0,-0.063500><0.423694,0.036000,0.063500> rotate<0,0.000000,0> translate<25.954206,0.000000,20.909344> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.377900,0.000000,20.803422>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.377900,0.000000,21.015269>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,90.000000,0> translate<26.377900,0.000000,21.015269> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.636434,0.000000,20.909344>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.742359,0.000000,20.909344>}
box{<0,0,-0.063500><0.105925,0.036000,0.063500> rotate<0,0.000000,0> translate<25.636434,0.000000,20.909344> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.377900,0.000000,21.271181>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.954206,0.000000,21.271181>}
box{<0,0,-0.063500><0.423694,0.036000,0.063500> rotate<0,0.000000,0> translate<25.954206,0.000000,21.271181> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.954206,0.000000,21.271181>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.954206,0.000000,21.588950>}
box{<0,0,-0.063500><0.317769,0.036000,0.063500> rotate<0,90.000000,0> translate<25.954206,0.000000,21.588950> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.954206,0.000000,21.588950>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.060131,0.000000,21.694875>}
box{<0,0,-0.063500><0.149801,0.036000,0.063500> rotate<0,-44.997030,0> translate<25.954206,0.000000,21.588950> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.060131,0.000000,21.694875>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.377900,0.000000,21.694875>}
box{<0,0,-0.063500><0.317769,0.036000,0.063500> rotate<0,0.000000,0> translate<26.060131,0.000000,21.694875> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.589747,0.000000,22.184666>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.589747,0.000000,22.290588>}
box{<0,0,-0.063500><0.105922,0.036000,0.063500> rotate<0,90.000000,0> translate<26.589747,0.000000,22.290588> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.589747,0.000000,22.290588>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.483822,0.000000,22.396513>}
box{<0,0,-0.063500><0.149801,0.036000,0.063500> rotate<0,44.997030,0> translate<26.483822,0.000000,22.396513> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.483822,0.000000,22.396513>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.954206,0.000000,22.396513>}
box{<0,0,-0.063500><0.529616,0.036000,0.063500> rotate<0,0.000000,0> translate<25.954206,0.000000,22.396513> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.954206,0.000000,22.396513>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.954206,0.000000,22.078741>}
box{<0,0,-0.063500><0.317772,0.036000,0.063500> rotate<0,-90.000000,0> translate<25.954206,0.000000,22.078741> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.954206,0.000000,22.078741>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.060131,0.000000,21.972819>}
box{<0,0,-0.063500><0.149798,0.036000,0.063500> rotate<0,44.996185,0> translate<25.954206,0.000000,22.078741> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.060131,0.000000,21.972819>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.271978,0.000000,21.972819>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,0.000000,0> translate<26.060131,0.000000,21.972819> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.271978,0.000000,21.972819>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.377900,0.000000,22.078741>}
box{<0,0,-0.063500><0.149796,0.036000,0.063500> rotate<0,-44.997030,0> translate<26.271978,0.000000,21.972819> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.377900,0.000000,22.078741>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.377900,0.000000,22.396513>}
box{<0,0,-0.063500><0.317772,0.036000,0.063500> rotate<0,90.000000,0> translate<26.377900,0.000000,22.396513> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.742359,0.000000,23.376094>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.377900,0.000000,23.376094>}
box{<0,0,-0.063500><0.635541,0.036000,0.063500> rotate<0,0.000000,0> translate<25.742359,0.000000,23.376094> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.377900,0.000000,23.376094>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.377900,0.000000,23.799788>}
box{<0,0,-0.063500><0.423694,0.036000,0.063500> rotate<0,90.000000,0> translate<26.377900,0.000000,23.799788> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.742359,0.000000,24.077731>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.377900,0.000000,24.077731>}
box{<0,0,-0.063500><0.635541,0.036000,0.063500> rotate<0,0.000000,0> translate<25.742359,0.000000,24.077731> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.377900,0.000000,24.077731>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.377900,0.000000,24.501425>}
box{<0,0,-0.063500><0.423694,0.036000,0.063500> rotate<0,90.000000,0> translate<26.377900,0.000000,24.501425> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.848281,0.000000,25.203063>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.742359,0.000000,25.097138>}
box{<0,0,-0.063500><0.149798,0.036000,0.063500> rotate<0,-44.997875,0> translate<25.742359,0.000000,25.097138> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.742359,0.000000,25.097138>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.742359,0.000000,24.885291>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,-90.000000,0> translate<25.742359,0.000000,24.885291> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.742359,0.000000,24.885291>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.848281,0.000000,24.779369>}
box{<0,0,-0.063500><0.149796,0.036000,0.063500> rotate<0,44.997030,0> translate<25.742359,0.000000,24.885291> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.848281,0.000000,24.779369>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.271978,0.000000,24.779369>}
box{<0,0,-0.063500><0.423697,0.036000,0.063500> rotate<0,0.000000,0> translate<25.848281,0.000000,24.779369> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.271978,0.000000,24.779369>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.377900,0.000000,24.885291>}
box{<0,0,-0.063500><0.149796,0.036000,0.063500> rotate<0,-44.997030,0> translate<26.271978,0.000000,24.779369> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.377900,0.000000,24.885291>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.377900,0.000000,25.097138>}
box{<0,0,-0.063500><0.211847,0.036000,0.063500> rotate<0,90.000000,0> translate<26.377900,0.000000,25.097138> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.377900,0.000000,25.097138>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.271978,0.000000,25.203063>}
box{<0,0,-0.063500><0.149798,0.036000,0.063500> rotate<0,44.997875,0> translate<26.271978,0.000000,25.203063> }
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
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.619200,0.000000,11.166400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.219200,0.000000,11.166400>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<13.619200,0.000000,11.166400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.619200,0.000000,9.966400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.219200,0.000000,9.966400>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<13.619200,0.000000,9.966400> }
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
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<15.846756,0.000000,23.707063>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<15.753544,0.000000,23.800275>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<15.753544,0.000000,23.800275> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<15.753544,0.000000,23.800275>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<15.567119,0.000000,23.800275>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<15.567119,0.000000,23.800275> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<15.567119,0.000000,23.800275>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<15.473906,0.000000,23.707063>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<15.473906,0.000000,23.707063> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<15.473906,0.000000,23.707063>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<15.473906,0.000000,23.334212>}
box{<0,0,-0.025400><0.372850,0.036000,0.025400> rotate<0,-90.000000,0> translate<15.473906,0.000000,23.334212> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<15.473906,0.000000,23.334212>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<15.567119,0.000000,23.241000>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<15.473906,0.000000,23.334212> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<15.567119,0.000000,23.241000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<15.753544,0.000000,23.241000>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<15.567119,0.000000,23.241000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<15.753544,0.000000,23.241000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<15.846756,0.000000,23.334212>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<15.753544,0.000000,23.241000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<16.035216,0.000000,23.800275>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<16.035216,0.000000,23.707063>}
box{<0,0,-0.025400><0.093212,0.036000,0.025400> rotate<0,-90.000000,0> translate<16.035216,0.000000,23.707063> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<16.035216,0.000000,23.707063>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<16.221641,0.000000,23.520637>}
box{<0,0,-0.025400><0.263645,0.036000,0.025400> rotate<0,44.997030,0> translate<16.035216,0.000000,23.707063> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<16.221641,0.000000,23.520637>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<16.408066,0.000000,23.707063>}
box{<0,0,-0.025400><0.263645,0.036000,0.025400> rotate<0,-44.997030,0> translate<16.221641,0.000000,23.520637> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<16.408066,0.000000,23.707063>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<16.408066,0.000000,23.800275>}
box{<0,0,-0.025400><0.093212,0.036000,0.025400> rotate<0,90.000000,0> translate<16.408066,0.000000,23.800275> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<16.221641,0.000000,23.520637>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<16.221641,0.000000,23.241000>}
box{<0,0,-0.025400><0.279637,0.036000,0.025400> rotate<0,-90.000000,0> translate<16.221641,0.000000,23.241000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<16.596525,0.000000,23.241000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<16.596525,0.000000,23.800275>}
box{<0,0,-0.025400><0.559275,0.036000,0.025400> rotate<0,90.000000,0> translate<16.596525,0.000000,23.800275> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<16.596525,0.000000,23.800275>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<16.876162,0.000000,23.800275>}
box{<0,0,-0.025400><0.279637,0.036000,0.025400> rotate<0,0.000000,0> translate<16.596525,0.000000,23.800275> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<16.876162,0.000000,23.800275>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<16.969375,0.000000,23.707063>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<16.876162,0.000000,23.800275> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<16.969375,0.000000,23.707063>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<16.969375,0.000000,23.520637>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,-90.000000,0> translate<16.969375,0.000000,23.520637> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<16.969375,0.000000,23.520637>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<16.876162,0.000000,23.427425>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<16.876162,0.000000,23.427425> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<16.876162,0.000000,23.427425>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<16.596525,0.000000,23.427425>}
box{<0,0,-0.025400><0.279637,0.036000,0.025400> rotate<0,0.000000,0> translate<16.596525,0.000000,23.427425> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<16.782950,0.000000,23.427425>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<16.969375,0.000000,23.241000>}
box{<0,0,-0.025400><0.263645,0.036000,0.025400> rotate<0,44.997030,0> translate<16.782950,0.000000,23.427425> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<17.157834,0.000000,23.241000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<17.157834,0.000000,23.800275>}
box{<0,0,-0.025400><0.559275,0.036000,0.025400> rotate<0,90.000000,0> translate<17.157834,0.000000,23.800275> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<17.157834,0.000000,23.800275>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<17.530684,0.000000,23.800275>}
box{<0,0,-0.025400><0.372850,0.036000,0.025400> rotate<0,0.000000,0> translate<17.157834,0.000000,23.800275> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<17.157834,0.000000,23.520637>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<17.344259,0.000000,23.520637>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<17.157834,0.000000,23.520637> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<18.091994,0.000000,23.800275>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<17.905569,0.000000,23.707063>}
box{<0,0,-0.025400><0.208429,0.036000,0.025400> rotate<0,-26.563298,0> translate<17.905569,0.000000,23.707063> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<17.905569,0.000000,23.707063>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<17.719144,0.000000,23.520637>}
box{<0,0,-0.025400><0.263645,0.036000,0.025400> rotate<0,-44.997030,0> translate<17.719144,0.000000,23.520637> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<17.719144,0.000000,23.520637>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<17.719144,0.000000,23.334212>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,-90.000000,0> translate<17.719144,0.000000,23.334212> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<17.719144,0.000000,23.334212>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<17.812356,0.000000,23.241000>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<17.719144,0.000000,23.334212> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<17.812356,0.000000,23.241000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<17.998781,0.000000,23.241000>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<17.812356,0.000000,23.241000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<17.998781,0.000000,23.241000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<18.091994,0.000000,23.334212>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<17.998781,0.000000,23.241000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<18.091994,0.000000,23.334212>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<18.091994,0.000000,23.427425>}
box{<0,0,-0.025400><0.093212,0.036000,0.025400> rotate<0,90.000000,0> translate<18.091994,0.000000,23.427425> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<18.091994,0.000000,23.427425>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<17.998781,0.000000,23.520637>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<17.998781,0.000000,23.520637> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<17.998781,0.000000,23.520637>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<17.719144,0.000000,23.520637>}
box{<0,0,-0.025400><0.279637,0.036000,0.025400> rotate<0,0.000000,0> translate<17.719144,0.000000,23.520637> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<18.280453,0.000000,23.334212>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<18.373666,0.000000,23.241000>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<18.280453,0.000000,23.334212> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<18.373666,0.000000,23.241000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<18.560091,0.000000,23.241000>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<18.373666,0.000000,23.241000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<18.560091,0.000000,23.241000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<18.653303,0.000000,23.334212>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<18.560091,0.000000,23.241000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<18.653303,0.000000,23.334212>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<18.653303,0.000000,23.707063>}
box{<0,0,-0.025400><0.372850,0.036000,0.025400> rotate<0,90.000000,0> translate<18.653303,0.000000,23.707063> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<18.653303,0.000000,23.707063>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<18.560091,0.000000,23.800275>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<18.560091,0.000000,23.800275> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<18.560091,0.000000,23.800275>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<18.373666,0.000000,23.800275>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<18.373666,0.000000,23.800275> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<18.373666,0.000000,23.800275>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<18.280453,0.000000,23.707063>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<18.280453,0.000000,23.707063> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<18.280453,0.000000,23.707063>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<18.280453,0.000000,23.613850>}
box{<0,0,-0.025400><0.093212,0.036000,0.025400> rotate<0,-90.000000,0> translate<18.280453,0.000000,23.613850> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<18.280453,0.000000,23.613850>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<18.373666,0.000000,23.520637>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<18.280453,0.000000,23.613850> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<18.373666,0.000000,23.520637>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<18.653303,0.000000,23.520637>}
box{<0,0,-0.025400><0.279637,0.036000,0.025400> rotate<0,0.000000,0> translate<18.373666,0.000000,23.520637> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<18.841763,0.000000,23.707063>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<18.934975,0.000000,23.800275>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<18.841763,0.000000,23.707063> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<18.934975,0.000000,23.800275>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.121400,0.000000,23.800275>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<18.934975,0.000000,23.800275> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.121400,0.000000,23.800275>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.214613,0.000000,23.707063>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<19.121400,0.000000,23.800275> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.214613,0.000000,23.707063>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.214613,0.000000,23.613850>}
box{<0,0,-0.025400><0.093212,0.036000,0.025400> rotate<0,-90.000000,0> translate<19.214613,0.000000,23.613850> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.214613,0.000000,23.613850>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.121400,0.000000,23.520637>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<19.121400,0.000000,23.520637> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.121400,0.000000,23.520637>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.028188,0.000000,23.520637>}
box{<0,0,-0.025400><0.093212,0.036000,0.025400> rotate<0,0.000000,0> translate<19.028188,0.000000,23.520637> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.121400,0.000000,23.520637>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.214613,0.000000,23.427425>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<19.121400,0.000000,23.520637> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.214613,0.000000,23.427425>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.214613,0.000000,23.334212>}
box{<0,0,-0.025400><0.093212,0.036000,0.025400> rotate<0,-90.000000,0> translate<19.214613,0.000000,23.334212> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.214613,0.000000,23.334212>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.121400,0.000000,23.241000>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<19.121400,0.000000,23.241000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.121400,0.000000,23.241000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<18.934975,0.000000,23.241000>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<18.934975,0.000000,23.241000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<18.934975,0.000000,23.241000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<18.841763,0.000000,23.334212>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<18.841763,0.000000,23.334212> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.775922,0.000000,23.800275>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.589497,0.000000,23.707063>}
box{<0,0,-0.025400><0.208429,0.036000,0.025400> rotate<0,-26.563298,0> translate<19.589497,0.000000,23.707063> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.589497,0.000000,23.707063>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.403072,0.000000,23.520637>}
box{<0,0,-0.025400><0.263645,0.036000,0.025400> rotate<0,-44.997030,0> translate<19.403072,0.000000,23.520637> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.403072,0.000000,23.520637>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.403072,0.000000,23.334212>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,-90.000000,0> translate<19.403072,0.000000,23.334212> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.403072,0.000000,23.334212>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.496284,0.000000,23.241000>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<19.403072,0.000000,23.334212> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.496284,0.000000,23.241000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.682709,0.000000,23.241000>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<19.496284,0.000000,23.241000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.682709,0.000000,23.241000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.775922,0.000000,23.334212>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<19.682709,0.000000,23.241000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.775922,0.000000,23.334212>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.775922,0.000000,23.427425>}
box{<0,0,-0.025400><0.093212,0.036000,0.025400> rotate<0,90.000000,0> translate<19.775922,0.000000,23.427425> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.775922,0.000000,23.427425>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.682709,0.000000,23.520637>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<19.682709,0.000000,23.520637> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.682709,0.000000,23.520637>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.403072,0.000000,23.520637>}
box{<0,0,-0.025400><0.279637,0.036000,0.025400> rotate<0,0.000000,0> translate<19.403072,0.000000,23.520637> }
//GND silk screen
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.167850,0.000000,26.043863>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.074637,0.000000,26.137075>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<11.074637,0.000000,26.137075> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.074637,0.000000,26.137075>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.888212,0.000000,26.137075>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<10.888212,0.000000,26.137075> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.888212,0.000000,26.137075>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.795000,0.000000,26.043863>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<10.795000,0.000000,26.043863> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.795000,0.000000,26.043863>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.795000,0.000000,25.671012>}
box{<0,0,-0.025400><0.372850,0.036000,0.025400> rotate<0,-90.000000,0> translate<10.795000,0.000000,25.671012> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.795000,0.000000,25.671012>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.888212,0.000000,25.577800>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<10.795000,0.000000,25.671012> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.888212,0.000000,25.577800>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.074637,0.000000,25.577800>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<10.888212,0.000000,25.577800> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.074637,0.000000,25.577800>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.167850,0.000000,25.671012>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<11.074637,0.000000,25.577800> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.167850,0.000000,25.671012>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.167850,0.000000,25.857437>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,90.000000,0> translate<11.167850,0.000000,25.857437> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.167850,0.000000,25.857437>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.981425,0.000000,25.857437>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<10.981425,0.000000,25.857437> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.356309,0.000000,25.577800>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.356309,0.000000,26.137075>}
box{<0,0,-0.025400><0.559275,0.036000,0.025400> rotate<0,90.000000,0> translate<11.356309,0.000000,26.137075> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.356309,0.000000,26.137075>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.729159,0.000000,25.577800>}
box{<0,0,-0.025400><0.672165,0.036000,0.025400> rotate<0,56.306216,0> translate<11.356309,0.000000,26.137075> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.729159,0.000000,25.577800>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.729159,0.000000,26.137075>}
box{<0,0,-0.025400><0.559275,0.036000,0.025400> rotate<0,90.000000,0> translate<11.729159,0.000000,26.137075> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.917619,0.000000,26.137075>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.917619,0.000000,25.577800>}
box{<0,0,-0.025400><0.559275,0.036000,0.025400> rotate<0,-90.000000,0> translate<11.917619,0.000000,25.577800> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.917619,0.000000,25.577800>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.197256,0.000000,25.577800>}
box{<0,0,-0.025400><0.279637,0.036000,0.025400> rotate<0,0.000000,0> translate<11.917619,0.000000,25.577800> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.197256,0.000000,25.577800>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.290469,0.000000,25.671012>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<12.197256,0.000000,25.577800> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.290469,0.000000,25.671012>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.290469,0.000000,26.043863>}
box{<0,0,-0.025400><0.372850,0.036000,0.025400> rotate<0,90.000000,0> translate<12.290469,0.000000,26.043863> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.290469,0.000000,26.043863>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.197256,0.000000,26.137075>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<12.197256,0.000000,26.137075> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.197256,0.000000,26.137075>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.917619,0.000000,26.137075>}
box{<0,0,-0.025400><0.279637,0.036000,0.025400> rotate<0,0.000000,0> translate<11.917619,0.000000,26.137075> }
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
object{  CYRF6936_BOB(-18.097500,0,-21.158200,pcb_rotate_x,pcb_rotate_y,pcb_rotate_z)
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
