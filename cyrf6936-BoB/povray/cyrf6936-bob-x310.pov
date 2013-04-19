//POVRay-File created by 3d41.ulp v###VERSIONDUMMY###
///Users/jmoreland/.dropbox-alt/Dropbox/Projects/quadcopter/rf/cyrf6936-BOB/cyrf6936-bob.brd
//4/17/13 1:24 PM

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

#local pcb_rotate_x = 310;
#local pcb_rotate_y = 0;
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

#local lgt1_pos_x = 7;
#local lgt1_pos_y = 19;
#local lgt1_pos_z = 17;
#local lgt1_intense = 0.709221;
#local lgt2_pos_x = -7;
#local lgt2_pos_y = 19;
#local lgt2_pos_z = 17;
#local lgt2_intense = 0.709221;
#local lgt3_pos_x = 7;
#local lgt3_pos_y = 19;
#local lgt3_pos_z = -12;
#local lgt3_intense = 0.709221;
#local lgt4_pos_x = -7;
#local lgt4_pos_y = 19;
#local lgt4_pos_z = -12;
#local lgt4_intense = 0.709221;

//Do not change these values
#declare pcb_height = 1.500000;
#declare pcb_cuheight = 0.035000;
#declare pcb_x_size = 19.050000;
#declare pcb_y_size = 33.883600;
#declare pcb_layer1_used = 1;
#declare pcb_layer16_used = 1;
#declare inc_testmode = off;
#declare global_seed=seed(875);
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

#declare col_brd = texture{pigment{Gray10}}
#declare col_wrs = texture{pigment{Gray50}}
#declare col_pds = texture{pigment{Gray70}}
#declare col_hls = texture{pigment{Gray30}}
#declare col_bgr = White;
#declare col_slk = texture{pigment{Gray90}}
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
	//translate<-9.525000,0,-16.941800>
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
<8.890000,4.216400><27.940000,4.216400>
<27.940000,4.216400><27.940000,38.100000>
<27.940000,38.100000><8.890000,38.100000>
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
#ifndef(pack_C1) #declare global_pack_C1=yes; object {CAP_SMD_CHIP_0402()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<21.920200,0.000000,25.806400>translate<0,0.035000,0> }#end		//SMD Capacitor 0402 C1  0402-CAP
#ifndef(pack_C3) #declare global_pack_C3=yes; object {CAP_SMD_CHIP_0402()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<18.262600,0.000000,25.146000>translate<0,0.035000,0> }#end		//SMD Capacitor 0402 C3  0402-CAP
#ifndef(pack_C4) #declare global_pack_C4=yes; object {CAP_SMD_CHIP_0402()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<21.259800,0.000000,28.117800>translate<0,0.035000,0> }#end		//SMD Capacitor 0402 C4  0402-CAP
#ifndef(pack_C5) #declare global_pack_C5=yes; object {CAP_SMD_CHIP_0402()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<17.449800,0.000000,13.665200>translate<0,0.035000,0> }#end		//SMD Capacitor 0402 C5  0402-CAP
#ifndef(pack_C6) #declare global_pack_C6=yes; object {CAP_SMD_CHIP_0402()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<15.011400,0.000000,25.146000>translate<0,0.035000,0> }#end		//SMD Capacitor 0402 C6  0402-CAP
#ifndef(pack_C7) #declare global_pack_C7=yes; object {CAP_SMD_CHIP_0402()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<22.529800,0.000000,18.923000>translate<0,0.035000,0> }#end		//SMD Capacitor 0402 C7  0402-CAP
#ifndef(pack_C8) #declare global_pack_C8=yes; object {CAP_SMD_CHIP_0402()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<14.401800,0.000000,14.300200>translate<0,0.035000,0> }#end		//SMD Capacitor 0402 C8  0402-CAP
#ifndef(pack_C9) #declare global_pack_C9=yes; object {CAP_SMD_CHIP_0402()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<19.456400,0.000000,13.665200>translate<0,0.035000,0> }#end		//SMD Capacitor 0402 C9  0402-CAP
#ifndef(pack_C10) #declare global_pack_C10=yes; object {CAP_SMD_CHIP_0402()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<23.723600,0.000000,18.923000>translate<0,0.035000,0> }#end		//SMD Capacitor 0402 C10  0402-CAP
#ifndef(pack_C11) #declare global_pack_C11=yes; object {CAP_SMD_CHIP_0402()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<22.529800,0.000000,21.539200>translate<0,0.035000,0> }#end		//SMD Capacitor 0402 C11  0402-CAP
#ifndef(pack_C14) #declare global_pack_C14=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<11.709400,0.000000,10.845800>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C14  0805
#ifndef(pack_C15) #declare global_pack_C15=yes; object {CAP_SMD_CHIP_0402()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<14.401800,0.000000,12.801600>translate<0,0.035000,0> }#end		//SMD Capacitor 0402 C15  0402-CAP
#ifndef(pack_L2) #declare global_pack_L2=yes; object {CAP_SMD_CHIP_0402()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<19.558000,0.000000,26.441400>translate<0,0.035000,0> }#end		//SMD Capacitor 0402 L2  C0402
#ifndef(pack_Y1) #declare global_pack_Y1=yes; object {SPC_XTAL_5MM_SMD("",3,)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<18.643600,0.000000,7.112000>}#end		//Quarz 4,9MM SMD Y1  HC49UP
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
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<22.529800,0.000000,18.273000>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<22.529800,0.000000,19.573000>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<15.051800,0.000000,14.300200>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<13.751800,0.000000,14.300200>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<19.456400,0.000000,14.315200>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<19.456400,0.000000,13.015200>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<23.723600,0.000000,19.573000>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<23.723600,0.000000,18.273000>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<22.529800,0.000000,20.889200>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<22.529800,0.000000,22.189200>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<11.709400,0.000000,11.745800>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<11.709400,0.000000,9.945800>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<15.051800,0.000000,12.801600>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<13.751800,0.000000,12.801600>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<25.056200,0.000000,25.171400>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<23.356200,0.000000,25.171400>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<18.908000,0.000000,26.441400>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<20.208000,0.000000,26.441400>}
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
object{TOOLS_PCB_SMD(5.334000,1.930400,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<13.817600,0.000000,7.112000>}
object{TOOLS_PCB_SMD(5.334000,1.930400,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<23.469600,0.000000,7.112000>}
//Pads/Vias
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<12.801600,0,14.325600> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<14.122400,0,16.408400> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<23.723600,0,17.221200> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<19.456400,0,21.564600> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<18.592800,0,21.564600> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<17.729200,0,21.564600> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<16.865600,0,21.564600> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<16.002000,0,21.564600> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<19.456400,0,20.675600> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<18.592800,0,20.675600> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<17.729200,0,20.675600> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<16.865600,0,20.675600> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<16.002000,0,20.675600> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<19.456400,0,19.812000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<18.592800,0,19.812000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<17.729200,0,19.812000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<16.865600,0,19.812000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<16.002000,0,19.812000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<19.456400,0,18.923000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<18.592800,0,18.923000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<17.729200,0,18.923000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<16.865600,0,18.923000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<16.002000,0,18.923000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<19.456400,0,18.059400> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<18.592800,0,18.059400> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<17.729200,0,18.059400> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<16.865600,0,18.059400> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<16.002000,0,18.059400> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<13.385800,0,25.146000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<13.893800,0,22.809200> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<19.481800,0,12.115800> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<17.500600,0,12.090400> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<10.414000,0,10.922000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<10.414000,0,13.462000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<10.414000,0,16.002000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<10.414000,0,18.542000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<10.414000,0,21.082000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<10.414000,0,23.622000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.508000,0.304800,1,16,1,0) translate<10.414000,0,28.702000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<10.414000,0,5.842000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<10.414000,0,8.382000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<24.130000,0,28.702000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<23.114000,0,28.702000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<19.304000,0,28.702000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<18.034000,0,28.702000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<11.684000,0,28.702000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<16.764000,0,28.702000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<15.494000,0,28.702000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<14.224000,0,28.702000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<12.954000,0,28.702000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<26.416000,0,28.702000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<23.622000,0,8.890000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<21.082000,0,5.842000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<18.542000,0,5.842000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<16.002000,0,5.842000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<13.462000,0,5.842000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<25.273000,0,28.702000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<13.462000,0,8.382000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<16.002000,0,8.382000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<18.542000,0,8.382000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<21.082000,0,8.382000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<21.082000,0,10.922000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<18.542000,0,10.922000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<16.002000,0,10.922000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<13.462000,0,10.922000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<13.462000,0,18.542000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<13.462000,0,21.082000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<13.462000,0,27.178000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<23.622000,0,15.621000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<21.082000,0,13.462000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<23.622000,0,10.922000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<16.002000,0,27.178000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<10.414000,0,25.654000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<10.414000,0,27.178000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<23.622000,0,21.590000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<23.622000,0,5.842000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<26.670000,0,5.842000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<26.670000,0,10.922000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<26.670000,0,13.462000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<26.670000,0,16.002000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<26.670000,0,18.542000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<26.670000,0,21.082000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<26.670000,0,23.622000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<26.670000,0,5.842000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<26.670000,0,8.382000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<26.670000,0,25.654000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<26.670000,0,27.178000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<15.773400,0,15.265400> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<15.113000,0,26.289000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<19.456400,0,15.265400> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<22.377400,0,17.094200> texture{col_thl}}
object{TOOLS_PCB_VIA(0.533400,0.381000,1,16,1,0) translate<14.655800,0,29.972000> texture{col_thl}}
#end
#if(pcb_wires=on)
union{
//Signals
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.709400,0.000000,11.745800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.709400,0.000000,15.011400>}
box{<0,0,-0.203200><3.265600,0.035000,0.203200> rotate<0,90.000000,0> translate<11.709400,0.000000,15.011400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.709400,0.000000,15.011400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.293600,0.000000,15.595600>}
box{<0,0,-0.203200><0.826184,0.035000,0.203200> rotate<0,-44.997030,0> translate<11.709400,0.000000,15.011400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.852400,0.000000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.877800,0.000000,25.120600>}
box{<0,0,-0.152400><0.035921,0.035000,0.152400> rotate<0,44.997030,0> translate<12.852400,0.000000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.801600,0.000000,14.325600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.726400,0.000000,14.325600>}
box{<0,0,-0.152400><0.924800,0.035000,0.152400> rotate<0,0.000000,0> translate<12.801600,0.000000,14.325600> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.293600,0.000000,15.595600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.341600,0.000000,15.595600>}
box{<0,0,-0.203200><3.048000,0.035000,0.203200> rotate<0,0.000000,0> translate<12.293600,0.000000,15.595600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.341600,0.000000,15.595600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.379700,0.000000,15.633700>}
box{<0,0,-0.152400><0.053882,0.035000,0.152400> rotate<0,-44.997030,0> translate<15.341600,0.000000,15.595600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.341600,0.000000,15.595600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.443200,0.000000,15.595600>}
box{<0,0,-0.203200><0.101600,0.035000,0.203200> rotate<0,0.000000,0> translate<15.341600,0.000000,15.595600> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.443200,0.000000,15.595600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.773400,0.000000,15.265400>}
box{<0,0,-0.203200><0.466973,0.035000,0.203200> rotate<0,44.997030,0> translate<15.443200,0.000000,15.595600> }
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
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.449800,0.000000,12.090400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.500600,0.000000,12.090400>}
box{<0,0,-0.127000><0.050800,0.035000,0.127000> rotate<0,0.000000,0> translate<17.449800,0.000000,12.090400> }
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
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.456400,0.000000,12.115800>}
box{<0,0,-0.152400><0.899400,0.035000,0.152400> rotate<0,-90.000000,0> translate<19.456400,0.000000,12.115800> }
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
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.456400,0.000000,12.115800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.481800,0.000000,12.115800>}
box{<0,0,-0.127000><0.025400,0.035000,0.127000> rotate<0,0.000000,0> translate<19.456400,0.000000,12.115800> }
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
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.678800,0.000000,17.040200>}
box{<0,0,-0.152400><0.521800,0.035000,0.152400> rotate<0,-90.000000,0> translate<20.678800,0.000000,17.040200> }
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
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.678800,0.000000,22.558400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.488400,0.000000,23.368000>}
box{<0,0,-0.152400><1.144947,0.035000,0.152400> rotate<0,-44.997030,0> translate<20.678800,0.000000,22.558400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.678800,0.000000,20.062000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.702600,0.000000,20.062000>}
box{<0,0,-0.152400><1.023800,0.035000,0.152400> rotate<0,0.000000,0> translate<20.678800,0.000000,20.062000> }
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
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.678800,0.000000,21.062000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.357000,0.000000,21.062000>}
box{<0,0,-0.152400><1.678200,0.035000,0.152400> rotate<0,0.000000,0> translate<20.678800,0.000000,21.062000> }
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
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.377400,0.000000,18.262600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.519400,0.000000,18.262600>}
box{<0,0,-0.127000><0.142000,0.035000,0.127000> rotate<0,0.000000,0> translate<22.377400,0.000000,18.262600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.996400,0.000000,22.199600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.519400,0.000000,22.199600>}
box{<0,0,-0.152400><0.523000,0.035000,0.152400> rotate<0,0.000000,0> translate<21.996400,0.000000,22.199600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.519400,0.000000,18.262600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.529800,0.000000,18.273000>}
box{<0,0,-0.127000><0.014708,0.035000,0.127000> rotate<0,-44.997030,0> translate<22.519400,0.000000,18.262600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.678800,0.000000,19.562000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.529800,0.000000,19.562000>}
box{<0,0,-0.127000><1.851000,0.035000,0.127000> rotate<0,0.000000,0> translate<20.678800,0.000000,19.562000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.529800,0.000000,19.573000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.529800,0.000000,19.562000>}
box{<0,0,-0.127000><0.011000,0.035000,0.127000> rotate<0,-90.000000,0> translate<22.529800,0.000000,19.562000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.702600,0.000000,20.062000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.529800,0.000000,20.889200>}
box{<0,0,-0.152400><1.169837,0.035000,0.152400> rotate<0,-44.997030,0> translate<21.702600,0.000000,20.062000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.357000,0.000000,21.062000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.529800,0.000000,20.889200>}
box{<0,0,-0.127000><0.244376,0.035000,0.127000> rotate<0,44.997030,0> translate<22.357000,0.000000,21.062000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.519400,0.000000,22.199600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.529800,0.000000,22.189200>}
box{<0,0,-0.152400><0.014708,0.035000,0.152400> rotate<0,44.997030,0> translate<22.519400,0.000000,22.199600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.529800,0.000000,20.889200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.540200,0.000000,20.878800>}
box{<0,0,-0.127000><0.014708,0.035000,0.127000> rotate<0,44.997030,0> translate<22.529800,0.000000,20.889200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.377400,0.000000,17.094200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.936200,0.000000,16.535400>}
box{<0,0,-0.152400><0.790263,0.035000,0.152400> rotate<0,44.997030,0> translate<22.377400,0.000000,17.094200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.987000,0.000000,14.732000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.987000,0.000000,7.594600>}
box{<0,0,-0.152400><7.137400,0.035000,0.152400> rotate<0,-90.000000,0> translate<22.987000,0.000000,7.594600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.678800,0.000000,17.040200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.987000,0.000000,14.732000>}
box{<0,0,-0.152400><3.264288,0.035000,0.152400> rotate<0,44.997030,0> translate<20.678800,0.000000,17.040200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.540200,0.000000,20.878800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.114000,0.000000,20.878800>}
box{<0,0,-0.152400><0.573800,0.035000,0.152400> rotate<0,0.000000,0> translate<22.540200,0.000000,20.878800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.920200,0.000000,25.156400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.341200,0.000000,25.156400>}
box{<0,0,-0.152400><1.421000,0.035000,0.152400> rotate<0,0.000000,0> translate<21.920200,0.000000,25.156400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.341200,0.000000,25.156400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.356200,0.000000,25.171400>}
box{<0,0,-0.152400><0.021213,0.035000,0.152400> rotate<0,-44.997030,0> translate<23.341200,0.000000,25.156400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.987000,0.000000,7.594600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.469600,0.000000,7.112000>}
box{<0,0,-0.152400><0.682499,0.035000,0.152400> rotate<0,44.997030,0> translate<22.987000,0.000000,7.594600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.723600,0.000000,18.273000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.723600,0.000000,17.221200>}
box{<0,0,-0.152400><1.051800,0.035000,0.152400> rotate<0,-90.000000,0> translate<23.723600,0.000000,17.221200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.114000,0.000000,20.878800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.723600,0.000000,20.269200>}
box{<0,0,-0.152400><0.862105,0.035000,0.152400> rotate<0,44.997030,0> translate<23.114000,0.000000,20.878800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.723600,0.000000,19.573000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.723600,0.000000,20.269200>}
box{<0,0,-0.152400><0.696200,0.035000,0.152400> rotate<0,90.000000,0> translate<23.723600,0.000000,20.269200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.936200,0.000000,16.535400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.977600,0.000000,16.535400>}
box{<0,0,-0.152400><1.041400,0.035000,0.152400> rotate<0,0.000000,0> translate<22.936200,0.000000,16.535400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.723600,0.000000,19.573000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.242000,0.000000,19.573000>}
box{<0,0,-0.127000><0.518400,0.035000,0.127000> rotate<0,0.000000,0> translate<23.723600,0.000000,19.573000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.977600,0.000000,16.535400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.714200,0.000000,17.272000>}
box{<0,0,-0.152400><1.041710,0.035000,0.152400> rotate<0,-44.997030,0> translate<23.977600,0.000000,16.535400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.242000,0.000000,19.573000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.714200,0.000000,19.100800>}
box{<0,0,-0.152400><0.667792,0.035000,0.152400> rotate<0,44.997030,0> translate<24.242000,0.000000,19.573000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.714200,0.000000,17.272000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.714200,0.000000,19.100800>}
box{<0,0,-0.152400><1.828800,0.035000,0.152400> rotate<0,90.000000,0> translate<24.714200,0.000000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.488400,0.000000,23.368000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.942800,0.000000,23.368000>}
box{<0,0,-0.152400><3.454400,0.035000,0.152400> rotate<0,0.000000,0> translate<21.488400,0.000000,23.368000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.942800,0.000000,23.368000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.450800,0.000000,23.876000>}
box{<0,0,-0.152400><0.718420,0.035000,0.152400> rotate<0,-44.997030,0> translate<24.942800,0.000000,23.368000> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,28.956000>}
box{<0,0,-0.076200><24.409403,0.035000,0.076200> rotate<0,90.000000,0> translate<9.220197,0.000000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,4.546597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,30.683200>}
box{<0,0,-0.076200><26.136603,0.035000,0.076200> rotate<0,90.000000,0> translate<9.220197,-1.535000,30.683200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,4.546597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,4.546597>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,4.546597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,4.546597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,4.546597>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,4.546597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,4.572000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,4.572000>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,4.572000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,4.572000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,4.572000>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,4.572000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,4.724400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,4.724400>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,4.724400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,4.724400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,4.724400>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,4.724400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,4.876800>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,4.876800>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,5.029200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,5.029200>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,5.029200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,5.029200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,5.029200>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,5.029200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,5.181600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,5.181600>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,5.181600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,5.181600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,5.181600>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,5.181600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,5.334000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,5.334000>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,5.334000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,5.334000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,5.334000>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,5.334000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,5.486400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,5.486400>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,5.486400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,5.486400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,5.486400>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,5.486400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,5.638800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,5.638800>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,5.638800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,5.638800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,5.638800>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,5.638800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,5.791200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,5.791200>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,5.791200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,5.791200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,5.791200>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,5.791200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,5.943600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.682509,0.000000,5.943600>}
box{<0,0,-0.076200><11.462313,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,5.943600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,5.943600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,5.943600>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,5.943600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.574000,0.000000,6.096000>}
box{<0,0,-0.076200><11.353803,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,6.096000>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,6.248400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.574000,0.000000,6.248400>}
box{<0,0,-0.076200><11.353803,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,6.248400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,6.248400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,6.248400>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,6.248400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,6.400800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.574000,0.000000,6.400800>}
box{<0,0,-0.076200><11.353803,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,6.400800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,6.400800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,6.400800>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,6.400800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,6.553200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.574000,0.000000,6.553200>}
box{<0,0,-0.076200><11.353803,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,6.553200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,6.553200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,6.553200>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,6.553200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,6.705600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.574000,0.000000,6.705600>}
box{<0,0,-0.076200><11.353803,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,6.705600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,6.705600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,6.705600>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,6.705600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,6.858000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.574000,0.000000,6.858000>}
box{<0,0,-0.076200><11.353803,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,6.858000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,6.858000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,6.858000>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,6.858000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,7.010400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.574000,0.000000,7.010400>}
box{<0,0,-0.076200><11.353803,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,7.010400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,7.010400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,7.010400>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,7.010400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,7.162800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.574000,0.000000,7.162800>}
box{<0,0,-0.076200><11.353803,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,7.162800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,7.162800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,7.162800>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,7.162800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.574000,0.000000,7.315200>}
box{<0,0,-0.076200><11.353803,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,7.315200>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,7.467600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.574000,0.000000,7.467600>}
box{<0,0,-0.076200><11.353803,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,7.467600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,7.467600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,7.467600>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,7.467600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.574000,0.000000,7.620000>}
box{<0,0,-0.076200><11.353803,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,7.620000>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,7.772400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.574000,0.000000,7.772400>}
box{<0,0,-0.076200><11.353803,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,7.772400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,7.772400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,7.772400>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,7.772400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,7.924800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.574000,0.000000,7.924800>}
box{<0,0,-0.076200><11.353803,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,7.924800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,7.924800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,7.924800>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,7.924800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,8.077200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.574000,0.000000,8.077200>}
box{<0,0,-0.076200><11.353803,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,8.077200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,8.077200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,8.077200>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,8.077200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,8.229600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.631713,0.000000,8.229600>}
box{<0,0,-0.076200><11.411516,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,8.229600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,8.229600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,8.229600>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,8.229600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.606000,0.000000,8.382000>}
box{<0,0,-0.076200><13.385803,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,8.382000>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.606000,0.000000,8.534400>}
box{<0,0,-0.076200><13.385803,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,8.534400>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,8.686800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.606000,0.000000,8.686800>}
box{<0,0,-0.076200><13.385803,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,8.686800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,8.686800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,8.686800>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,8.686800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,8.839200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.606000,0.000000,8.839200>}
box{<0,0,-0.076200><13.385803,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,8.839200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,8.839200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,8.839200>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,8.839200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,8.991600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.606000,0.000000,8.991600>}
box{<0,0,-0.076200><13.385803,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,8.991600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,8.991600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,8.991600>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,8.991600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.606000,0.000000,9.144000>}
box{<0,0,-0.076200><13.385803,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,9.144000>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,9.296400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.606000,0.000000,9.296400>}
box{<0,0,-0.076200><13.385803,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,9.296400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,9.296400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,9.296400>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,9.296400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,9.448800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.606000,0.000000,9.448800>}
box{<0,0,-0.076200><13.385803,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,9.448800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,9.448800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,9.448800>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,9.448800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,9.601200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.606000,0.000000,9.601200>}
box{<0,0,-0.076200><13.385803,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,9.601200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,9.601200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,9.601200>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,9.601200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.606000,0.000000,9.753600>}
box{<0,0,-0.076200><13.385803,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,9.753600>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,9.906000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.606000,0.000000,9.906000>}
box{<0,0,-0.076200><13.385803,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,9.906000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,9.906000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,9.906000>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,9.906000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,10.058400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.606000,0.000000,10.058400>}
box{<0,0,-0.076200><13.385803,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,10.058400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,10.058400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,10.058400>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,10.058400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,10.210800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.606000,0.000000,10.210800>}
box{<0,0,-0.076200><13.385803,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,10.210800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,10.210800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,10.210800>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,10.210800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,10.363200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.606000,0.000000,10.363200>}
box{<0,0,-0.076200><13.385803,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,10.363200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,10.363200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,10.363200>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,10.363200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,10.515600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.606000,0.000000,10.515600>}
box{<0,0,-0.076200><13.385803,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,10.515600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,10.515600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,10.515600>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,10.515600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,10.668000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.606000,0.000000,10.668000>}
box{<0,0,-0.076200><13.385803,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,10.668000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,10.668000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,10.668000>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,10.668000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,10.820400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.606000,0.000000,10.820400>}
box{<0,0,-0.076200><13.385803,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,10.820400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,10.820400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,10.820400>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,10.820400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.606000,0.000000,10.972800>}
box{<0,0,-0.076200><13.385803,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,10.972800>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,11.125200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.006709,0.000000,11.125200>}
box{<0,0,-0.076200><1.786512,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,11.125200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,11.125200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,11.125200>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,11.125200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,11.277600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.880800,0.000000,11.277600>}
box{<0,0,-0.076200><1.660603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,11.277600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,11.277600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,11.277600>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,11.277600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.880800,0.000000,11.430000>}
box{<0,0,-0.076200><1.660603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,11.430000>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,11.582400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.880800,0.000000,11.582400>}
box{<0,0,-0.076200><1.660603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,11.582400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,11.582400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,11.582400>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,11.582400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,11.734800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.880800,0.000000,11.734800>}
box{<0,0,-0.076200><1.660603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,11.734800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,11.734800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,11.734800>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,11.734800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,11.887200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.880800,0.000000,11.887200>}
box{<0,0,-0.076200><1.660603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,11.887200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,11.887200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,11.887200>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,11.887200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,12.039600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.880800,0.000000,12.039600>}
box{<0,0,-0.076200><1.660603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,12.039600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,12.039600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,12.039600>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,12.039600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.880800,0.000000,12.192000>}
box{<0,0,-0.076200><1.660603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,12.192000>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,12.344400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.984713,0.000000,12.344400>}
box{<0,0,-0.076200><1.764516,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,12.344400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,12.344400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,12.344400>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,12.344400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,12.496800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.277600,0.000000,12.496800>}
box{<0,0,-0.076200><2.057403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,12.496800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,12.496800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,12.496800>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,12.496800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,12.649200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.277600,0.000000,12.649200>}
box{<0,0,-0.076200><2.057403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,12.649200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,12.649200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,12.649200>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,12.649200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,12.801600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.277600,0.000000,12.801600>}
box{<0,0,-0.076200><2.057403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,12.801600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,12.801600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,12.801600>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,12.801600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.277600,0.000000,12.954000>}
box{<0,0,-0.076200><2.057403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,12.954000>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,13.106400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.277600,0.000000,13.106400>}
box{<0,0,-0.076200><2.057403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,13.106400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,13.106400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,13.106400>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,13.106400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,13.258800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.277600,0.000000,13.258800>}
box{<0,0,-0.076200><2.057403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,13.258800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,13.258800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,13.258800>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,13.258800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.277600,0.000000,13.411200>}
box{<0,0,-0.076200><2.057403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,13.411200>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,13.563600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.277600,0.000000,13.563600>}
box{<0,0,-0.076200><2.057403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,13.563600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,13.563600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,13.563600>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,13.563600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.277600,0.000000,13.716000>}
box{<0,0,-0.076200><2.057403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,13.716000>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,13.868400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.277600,0.000000,13.868400>}
box{<0,0,-0.076200><2.057403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,13.868400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,13.868400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,13.868400>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,13.868400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,14.020800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.277600,0.000000,14.020800>}
box{<0,0,-0.076200><2.057403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,14.020800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,14.020800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,14.020800>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,14.020800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,14.173200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.277600,0.000000,14.173200>}
box{<0,0,-0.076200><2.057403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,14.173200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,14.173200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,14.173200>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,14.173200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,14.325600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.277600,0.000000,14.325600>}
box{<0,0,-0.076200><2.057403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,14.325600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,14.325600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,14.325600>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,14.325600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,14.478000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.277600,0.000000,14.478000>}
box{<0,0,-0.076200><2.057403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,14.478000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,14.478000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,14.478000>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,14.478000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.277600,0.000000,14.630400>}
box{<0,0,-0.076200><2.057403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,14.630400>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,14.782800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.277600,0.000000,14.782800>}
box{<0,0,-0.076200><2.057403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,14.782800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,14.782800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,14.782800>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,14.782800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,14.935200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.277600,0.000000,14.935200>}
box{<0,0,-0.076200><2.057403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,14.935200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,14.935200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.457019,-1.535000,14.935200>}
box{<0,0,-0.076200><6.236822,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,14.935200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,15.087600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.277600,0.000000,15.087600>}
box{<0,0,-0.076200><2.057403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,15.087600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,15.087600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.315141,-1.535000,15.087600>}
box{<0,0,-0.076200><6.094944,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,15.087600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.327344,0.000000,15.240000>}
box{<0,0,-0.076200><2.107147,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.162741,-1.535000,15.240000>}
box{<0,0,-0.076200><5.942544,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,15.392400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.479744,0.000000,15.392400>}
box{<0,0,-0.076200><2.259547,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,15.392400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,15.392400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.010341,-1.535000,15.392400>}
box{<0,0,-0.076200><5.790144,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,15.392400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,15.544800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.632144,0.000000,15.544800>}
box{<0,0,-0.076200><2.411947,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,15.544800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,15.544800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.857941,-1.535000,15.544800>}
box{<0,0,-0.076200><5.637744,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,15.544800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,15.697200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.784544,0.000000,15.697200>}
box{<0,0,-0.076200><2.564347,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,15.697200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,15.697200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.705541,-1.535000,15.697200>}
box{<0,0,-0.076200><5.485344,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,15.697200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.936944,0.000000,15.849600>}
box{<0,0,-0.076200><2.716747,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,15.849600>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,16.002000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.089344,0.000000,16.002000>}
box{<0,0,-0.076200><2.869147,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,16.002000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,16.002000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,16.002000>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,16.002000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,16.154400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,16.154400>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,16.154400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,16.154400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.072800,0.000000,16.154400>}
box{<0,0,-0.076200><6.852603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,16.154400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,16.306800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,16.306800>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,16.306800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,16.306800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.072800,0.000000,16.306800>}
box{<0,0,-0.076200><6.852603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,16.306800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,16.459200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,16.459200>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,16.459200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,16.459200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.072800,0.000000,16.459200>}
box{<0,0,-0.076200><6.852603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,16.459200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,16.611600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,16.611600>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,16.611600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,16.611600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.072800,0.000000,16.611600>}
box{<0,0,-0.076200><6.852603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,16.611600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,16.764000>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.072800,0.000000,16.764000>}
box{<0,0,-0.076200><6.852603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,16.916400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,16.916400>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,16.916400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,16.916400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.072800,0.000000,16.916400>}
box{<0,0,-0.076200><6.852603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,16.916400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,17.068800>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.085200,0.000000,17.068800>}
box{<0,0,-0.076200><6.865003,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,17.221200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.181309,0.000000,17.221200>}
box{<0,0,-0.076200><4.961113,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,17.221200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,17.221200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,17.221200>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,17.221200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,17.373600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.075200,0.000000,17.373600>}
box{<0,0,-0.076200><4.855003,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,17.373600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,17.373600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,17.373600>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,17.373600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,17.526000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.075200,0.000000,17.526000>}
box{<0,0,-0.076200><4.855003,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,17.526000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,17.526000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,17.526000>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,17.526000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,17.678400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.075200,0.000000,17.678400>}
box{<0,0,-0.076200><4.855003,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,17.678400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,17.678400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,17.678400>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,17.678400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,17.830800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.075200,0.000000,17.830800>}
box{<0,0,-0.076200><4.855003,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,17.830800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,17.830800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,17.830800>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,17.830800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,17.983200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.075200,0.000000,17.983200>}
box{<0,0,-0.076200><4.855003,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,17.983200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,17.983200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,17.983200>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,17.983200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,18.135600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.075200,0.000000,18.135600>}
box{<0,0,-0.076200><4.855003,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,18.135600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,18.135600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,18.135600>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,18.135600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.075200,0.000000,18.288000>}
box{<0,0,-0.076200><4.855003,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,18.288000>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,18.440400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.075200,0.000000,18.440400>}
box{<0,0,-0.076200><4.855003,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,18.440400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,18.440400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,18.440400>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,18.440400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,18.592800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.075200,0.000000,18.592800>}
box{<0,0,-0.076200><4.855003,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,18.592800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,18.592800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,18.592800>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,18.592800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,18.745200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.075200,0.000000,18.745200>}
box{<0,0,-0.076200><4.855003,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,18.745200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,18.745200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,18.745200>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,18.745200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,18.897600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.075200,0.000000,18.897600>}
box{<0,0,-0.076200><4.855003,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,18.897600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,18.897600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,18.897600>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,18.897600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.075200,0.000000,19.050000>}
box{<0,0,-0.076200><4.855003,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,19.050000>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,19.202400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.075200,0.000000,19.202400>}
box{<0,0,-0.076200><4.855003,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,19.202400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,19.202400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,19.202400>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,19.202400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,19.354800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.075200,0.000000,19.354800>}
box{<0,0,-0.076200><4.855003,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,19.354800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,19.354800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,19.354800>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,19.354800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.075200,0.000000,19.507200>}
box{<0,0,-0.076200><4.855003,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,19.507200>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,19.659600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.075200,0.000000,19.659600>}
box{<0,0,-0.076200><4.855003,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,19.659600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,19.659600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,19.659600>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,19.659600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.090513,0.000000,19.812000>}
box{<0,0,-0.076200><4.870316,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,19.812000>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,19.964400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.075200,0.000000,19.964400>}
box{<0,0,-0.076200><4.855003,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,19.964400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,19.964400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,19.964400>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,19.964400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,20.116800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.075200,0.000000,20.116800>}
box{<0,0,-0.076200><4.855003,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,20.116800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,20.116800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,20.116800>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,20.116800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,20.269200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.075200,0.000000,20.269200>}
box{<0,0,-0.076200><4.855003,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,20.269200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,20.269200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,20.269200>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,20.269200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,20.421600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.075200,0.000000,20.421600>}
box{<0,0,-0.076200><4.855003,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,20.421600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,20.421600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,20.421600>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,20.421600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,20.574000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.075200,0.000000,20.574000>}
box{<0,0,-0.076200><4.855003,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,20.574000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,20.574000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,20.574000>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,20.574000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.075200,0.000000,20.726400>}
box{<0,0,-0.076200><4.855003,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,20.726400>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,20.878800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.157313,0.000000,20.878800>}
box{<0,0,-0.076200><4.937116,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,20.878800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,20.878800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,20.878800>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,20.878800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,21.031200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,21.031200>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,21.031200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,21.031200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.025200,0.000000,21.031200>}
box{<0,0,-0.076200><10.805003,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,21.031200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,21.183600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,21.183600>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,21.183600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,21.183600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.025200,0.000000,21.183600>}
box{<0,0,-0.076200><10.805003,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,21.183600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,21.336000>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.064512,0.000000,21.336000>}
box{<0,0,-0.076200><10.844316,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,21.488400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,21.488400>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,21.488400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,21.488400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,21.488400>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,21.488400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,21.640800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,21.640800>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,21.640800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,21.640800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,21.640800>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,21.640800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,21.793200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,21.793200>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,21.793200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,21.793200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.059309,0.000000,21.793200>}
box{<0,0,-0.076200><10.839113,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,21.793200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,21.945600>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.025200,0.000000,21.945600>}
box{<0,0,-0.076200><10.805003,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,22.098000>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.025200,0.000000,22.098000>}
box{<0,0,-0.076200><10.805003,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,22.250400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,22.250400>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,22.250400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,22.250400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.102109,0.000000,22.250400>}
box{<0,0,-0.076200><7.881913,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,22.250400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,22.402800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,22.402800>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,22.402800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,22.402800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.085200,0.000000,22.402800>}
box{<0,0,-0.076200><7.865003,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,22.402800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,22.555200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.578744,-1.535000,22.555200>}
box{<0,0,-0.076200><5.358547,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,22.555200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,22.555200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.085200,0.000000,22.555200>}
box{<0,0,-0.076200><7.865003,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,22.555200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,22.707600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,22.707600>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,22.707600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,22.707600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.072800,0.000000,22.707600>}
box{<0,0,-0.076200><7.852603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,22.707600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.587094,-1.535000,22.860000>}
box{<0,0,-0.076200><5.366897,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.072800,0.000000,22.860000>}
box{<0,0,-0.076200><7.852603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,23.012400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.591269,-1.535000,23.012400>}
box{<0,0,-0.076200><5.371072,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,23.012400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,23.012400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.072800,0.000000,23.012400>}
box{<0,0,-0.076200><7.852603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,23.012400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.595447,-1.535000,23.164800>}
box{<0,0,-0.076200><5.375250,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,23.164800> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.633025,-1.535000,24.536400>}
box{<0,0,-0.076200><5.412828,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,24.536400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,24.536400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.147709,0.000000,24.536400>}
box{<0,0,-0.076200><5.927513,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,24.536400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,24.688800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.637200,-1.535000,24.688800>}
box{<0,0,-0.076200><5.417003,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,24.688800> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.666428,-1.535000,25.755600>}
box{<0,0,-0.076200><5.446231,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,25.755600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,25.755600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.107581,0.000000,25.755600>}
box{<0,0,-0.076200><5.887384,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,25.755600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.670603,-1.535000,25.908000>}
box{<0,0,-0.076200><5.450406,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.847419,0.000000,25.908000>}
box{<0,0,-0.076200><5.627222,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,26.060400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.674778,-1.535000,26.060400>}
box{<0,0,-0.076200><5.454581,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,26.060400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,26.060400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.695019,0.000000,26.060400>}
box{<0,0,-0.076200><5.474822,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,26.060400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,26.212800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.655800,0.000000,26.212800>}
box{<0,0,-0.076200><5.435603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,26.212800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,26.212800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.655800,-1.535000,26.212800>}
box{<0,0,-0.076200><5.435603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,26.212800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,26.365200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.655800,0.000000,26.365200>}
box{<0,0,-0.076200><5.435603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,26.365200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,26.365200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.655800,-1.535000,26.365200>}
box{<0,0,-0.076200><5.435603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,26.365200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,26.517600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.695022,0.000000,26.517600>}
box{<0,0,-0.076200><5.474825,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,26.517600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,26.517600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.695022,-1.535000,26.517600>}
box{<0,0,-0.076200><5.474825,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,26.517600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.847422,0.000000,26.670000>}
box{<0,0,-0.076200><5.627225,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.847422,-1.535000,26.670000>}
box{<0,0,-0.076200><5.627225,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780000,0.000000,26.822400>}
box{<0,0,-0.076200><8.559803,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,26.822400>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,26.974800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780000,0.000000,26.974800>}
box{<0,0,-0.076200><8.559803,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,26.974800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,26.974800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,26.974800>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,26.974800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,27.127200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780000,0.000000,27.127200>}
box{<0,0,-0.076200><8.559803,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,27.127200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,27.127200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,27.127200>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,27.127200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,27.279600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780000,0.000000,27.279600>}
box{<0,0,-0.076200><8.559803,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,27.279600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,27.279600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,27.279600>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,27.279600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780000,0.000000,27.432000>}
box{<0,0,-0.076200><8.559803,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,27.432000>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,27.584400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.005800,0.000000,27.584400>}
box{<0,0,-0.076200><11.785603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,27.584400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,27.584400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,27.584400>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,27.584400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,27.736800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.005800,0.000000,27.736800>}
box{<0,0,-0.076200><11.785603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,27.736800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,27.736800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,27.736800>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,27.736800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,27.889200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.005800,0.000000,27.889200>}
box{<0,0,-0.076200><11.785603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,27.889200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,27.889200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,27.889200>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,27.889200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.005800,0.000000,28.041600>}
box{<0,0,-0.076200><11.785603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,28.041600>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.005800,0.000000,28.194000>}
box{<0,0,-0.076200><11.785603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,28.194000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,28.194000>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,28.194000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,28.346400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.005800,0.000000,28.346400>}
box{<0,0,-0.076200><11.785603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,28.346400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,28.346400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,28.346400>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,28.346400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,28.498800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.005800,0.000000,28.498800>}
box{<0,0,-0.076200><11.785603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,28.498800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,28.498800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,28.498800>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,28.498800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,28.651200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.005800,0.000000,28.651200>}
box{<0,0,-0.076200><11.785603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,28.651200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,28.651200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,28.651200>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,28.651200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,28.803600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.005800,0.000000,28.803600>}
box{<0,0,-0.076200><11.785603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,28.803600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,28.803600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,28.803600>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,28.803600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.005800,0.000000,28.956000>}
box{<0,0,-0.076200><11.785603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,28.956000>}
box{<0,0,-0.076200><18.389603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,28.956000> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.361738,-1.535000,29.565600>}
box{<0,0,-0.076200><5.141541,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,29.565600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.209338,-1.535000,29.718000>}
box{<0,0,-0.076200><4.989141,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,29.718000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,29.870400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.160500,-1.535000,29.870400>}
box{<0,0,-0.076200><4.940303,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,29.870400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,30.022800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.160500,-1.535000,30.022800>}
box{<0,0,-0.076200><4.940303,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,30.022800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,30.175200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.160500,-1.535000,30.175200>}
box{<0,0,-0.076200><4.940303,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,30.175200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,30.327600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.310941,-1.535000,30.327600>}
box{<0,0,-0.076200><5.090744,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,30.327600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.005800,-1.535000,30.480000>}
box{<0,0,-0.076200><11.785603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,30.632400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.005800,-1.535000,30.632400>}
box{<0,0,-0.076200><11.785603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,30.632400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,30.683200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.005800,-1.535000,30.683200>}
box{<0,0,-0.076200><11.785603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,30.683200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.880800,0.000000,11.251109>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.014709,0.000000,11.117200>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<10.880800,0.000000,11.251109> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.880800,0.000000,12.240488>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.880800,0.000000,11.251109>}
box{<0,0,-0.076200><0.989378,0.035000,0.076200> rotate<0,-90.000000,0> translate<10.880800,0.000000,11.251109> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.880800,0.000000,12.240488>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.014709,0.000000,12.374397>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<10.880800,0.000000,12.240488> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.014709,0.000000,11.117200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.404088,0.000000,11.117200>}
box{<0,0,-0.076200><1.389378,0.035000,0.076200> rotate<0,0.000000,0> translate<11.014709,0.000000,11.117200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.014709,0.000000,12.374397>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.277600,0.000000,12.374397>}
box{<0,0,-0.076200><0.262891,0.035000,0.076200> rotate<0,0.000000,0> translate<11.014709,0.000000,12.374397> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.277600,0.000000,15.190256>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.277600,0.000000,12.374397>}
box{<0,0,-0.076200><2.815859,0.035000,0.076200> rotate<0,-90.000000,0> translate<11.277600,0.000000,12.374397> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.277600,0.000000,15.190256>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.861800,0.000000,15.774456>}
box{<0,0,-0.076200><0.826184,0.035000,0.076200> rotate<0,-44.997030,0> translate<11.277600,0.000000,15.190256> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.861800,0.000000,15.774456>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.114741,0.000000,16.027397>}
box{<0,0,-0.076200><0.357712,0.035000,0.076200> rotate<0,-44.997030,0> translate<11.861800,0.000000,15.774456> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.114741,0.000000,16.027397>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.622056,0.000000,16.027397>}
box{<0,0,-0.076200><3.507316,0.035000,0.076200> rotate<0,0.000000,0> translate<12.114741,0.000000,16.027397> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.141197,0.000000,12.374397>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.141197,0.000000,14.832541>}
box{<0,0,-0.076200><2.458144,0.035000,0.076200> rotate<0,90.000000,0> translate<12.141197,0.000000,14.832541> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.141197,0.000000,12.374397>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.404088,0.000000,12.374397>}
box{<0,0,-0.076200><0.262891,0.035000,0.076200> rotate<0,0.000000,0> translate<12.141197,0.000000,12.374397> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.141197,0.000000,12.496800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.173200,0.000000,12.496800>}
box{<0,0,-0.076200><1.032003,0.035000,0.076200> rotate<0,0.000000,0> translate<12.141197,0.000000,12.496800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.141197,0.000000,12.649200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.173200,0.000000,12.649200>}
box{<0,0,-0.076200><1.032003,0.035000,0.076200> rotate<0,0.000000,0> translate<12.141197,0.000000,12.649200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.141197,0.000000,12.801600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.173200,0.000000,12.801600>}
box{<0,0,-0.076200><1.032003,0.035000,0.076200> rotate<0,0.000000,0> translate<12.141197,0.000000,12.801600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.141197,0.000000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.173200,0.000000,12.954000>}
box{<0,0,-0.076200><1.032003,0.035000,0.076200> rotate<0,0.000000,0> translate<12.141197,0.000000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.141197,0.000000,13.106400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.173200,0.000000,13.106400>}
box{<0,0,-0.076200><1.032003,0.035000,0.076200> rotate<0,0.000000,0> translate<12.141197,0.000000,13.106400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.141197,0.000000,13.258800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.173200,0.000000,13.258800>}
box{<0,0,-0.076200><1.032003,0.035000,0.076200> rotate<0,0.000000,0> translate<12.141197,0.000000,13.258800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.141197,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.238113,0.000000,13.411200>}
box{<0,0,-0.076200><1.096916,0.035000,0.076200> rotate<0,0.000000,0> translate<12.141197,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.141197,0.000000,13.563600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.670800,0.000000,13.563600>}
box{<0,0,-0.076200><2.529603,0.035000,0.076200> rotate<0,0.000000,0> translate<12.141197,0.000000,13.563600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.141197,0.000000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.512709,0.000000,13.716000>}
box{<0,0,-0.076200><2.371512,0.035000,0.076200> rotate<0,0.000000,0> translate<12.141197,0.000000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.141197,0.000000,13.868400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.473200,0.000000,13.868400>}
box{<0,0,-0.076200><2.332003,0.035000,0.076200> rotate<0,0.000000,0> translate<12.141197,0.000000,13.868400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.141197,0.000000,14.020800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.473200,0.000000,14.020800>}
box{<0,0,-0.076200><2.332003,0.035000,0.076200> rotate<0,0.000000,0> translate<12.141197,0.000000,14.020800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.141197,0.000000,14.173200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.473200,0.000000,14.173200>}
box{<0,0,-0.076200><2.332003,0.035000,0.076200> rotate<0,0.000000,0> translate<12.141197,0.000000,14.173200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.141197,0.000000,14.325600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.473200,0.000000,14.325600>}
box{<0,0,-0.076200><2.332003,0.035000,0.076200> rotate<0,0.000000,0> translate<12.141197,0.000000,14.325600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.141197,0.000000,14.478000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.473200,0.000000,14.478000>}
box{<0,0,-0.076200><2.332003,0.035000,0.076200> rotate<0,0.000000,0> translate<12.141197,0.000000,14.478000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.141197,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.473200,0.000000,14.630400>}
box{<0,0,-0.076200><2.332003,0.035000,0.076200> rotate<0,0.000000,0> translate<12.141197,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.141197,0.000000,14.782800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.473200,0.000000,14.782800>}
box{<0,0,-0.076200><2.332003,0.035000,0.076200> rotate<0,0.000000,0> translate<12.141197,0.000000,14.782800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.141197,0.000000,14.832541>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.472456,0.000000,15.163800>}
box{<0,0,-0.076200><0.468472,0.035000,0.076200> rotate<0,-44.997030,0> translate<12.141197,0.000000,14.832541> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.243856,0.000000,14.935200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.563512,0.000000,14.935200>}
box{<0,0,-0.076200><2.319656,0.035000,0.076200> rotate<0,0.000000,0> translate<12.243856,0.000000,14.935200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.396256,0.000000,15.087600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.056788,0.000000,15.087600>}
box{<0,0,-0.076200><2.660531,0.035000,0.076200> rotate<0,0.000000,0> translate<12.396256,0.000000,15.087600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.404088,0.000000,11.117200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.537997,0.000000,11.251109>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<12.404088,0.000000,11.117200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.404088,0.000000,12.374397>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.537997,0.000000,12.240488>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<12.404088,0.000000,12.374397> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.412088,0.000000,11.125200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.606000,0.000000,11.125200>}
box{<0,0,-0.076200><10.193913,0.035000,0.076200> rotate<0,0.000000,0> translate<12.412088,0.000000,11.125200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.434084,0.000000,12.344400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.173200,0.000000,12.344400>}
box{<0,0,-0.076200><0.739116,0.035000,0.076200> rotate<0,0.000000,0> translate<12.434084,0.000000,12.344400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.472456,0.000000,15.163800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.132988,0.000000,15.163800>}
box{<0,0,-0.076200><2.660531,0.035000,0.076200> rotate<0,0.000000,0> translate<12.472456,0.000000,15.163800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.537997,0.000000,11.251109>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.537997,0.000000,12.240488>}
box{<0,0,-0.076200><0.989378,0.035000,0.076200> rotate<0,90.000000,0> translate<12.537997,0.000000,12.240488> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.537997,0.000000,11.277600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.606000,0.000000,11.277600>}
box{<0,0,-0.076200><10.068003,0.035000,0.076200> rotate<0,0.000000,0> translate<12.537997,0.000000,11.277600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.537997,0.000000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.786781,0.000000,11.430000>}
box{<0,0,-0.076200><1.248784,0.035000,0.076200> rotate<0,0.000000,0> translate<12.537997,0.000000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.537997,0.000000,11.582400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.634381,0.000000,11.582400>}
box{<0,0,-0.076200><1.096384,0.035000,0.076200> rotate<0,0.000000,0> translate<12.537997,0.000000,11.582400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.537997,0.000000,11.734800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.481981,0.000000,11.734800>}
box{<0,0,-0.076200><0.943984,0.035000,0.076200> rotate<0,0.000000,0> translate<12.537997,0.000000,11.734800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.537997,0.000000,11.887200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.370800,0.000000,11.887200>}
box{<0,0,-0.076200><0.832803,0.035000,0.076200> rotate<0,0.000000,0> translate<12.537997,0.000000,11.887200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.537997,0.000000,12.039600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.370800,0.000000,12.039600>}
box{<0,0,-0.076200><0.832803,0.035000,0.076200> rotate<0,0.000000,0> translate<12.537997,0.000000,12.039600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.537997,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.238109,0.000000,12.192000>}
box{<0,0,-0.076200><0.700112,0.035000,0.076200> rotate<0,0.000000,0> translate<12.537997,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.173200,0.000000,12.256909>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.307109,0.000000,12.123000>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<13.173200,0.000000,12.256909> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.173200,0.000000,13.346288>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.173200,0.000000,12.256909>}
box{<0,0,-0.076200><1.089378,0.035000,0.076200> rotate<0,-90.000000,0> translate<13.173200,0.000000,12.256909> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.173200,0.000000,13.346288>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.307109,0.000000,13.480197>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<13.173200,0.000000,13.346288> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.639800,0.000000,11.576981>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.862981,0.000000,11.353800>}
box{<0,0,-0.076200><0.315626,0.035000,0.076200> rotate<0,44.997030,0> translate<13.639800,0.000000,11.576981> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.075200,0.000000,18.296688>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.075200,0.000000,17.827309>}
box{<0,0,-0.076200><0.469378,0.035000,0.076200> rotate<0,-90.000000,0> translate<14.075200,0.000000,17.827309> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.075200,0.000000,18.296688>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.090513,0.000000,18.312000>}
box{<0,0,-0.076200><0.021655,0.035000,0.076200> rotate<0,-44.997030,0> translate<14.075200,0.000000,18.296688> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.075200,0.000000,18.327309>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.090513,0.000000,18.312000>}
box{<0,0,-0.076200><0.021653,0.035000,0.076200> rotate<0,44.991183,0> translate<14.075200,0.000000,18.327309> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.075200,0.000000,18.796688>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.075200,0.000000,18.327309>}
box{<0,0,-0.076200><0.469378,0.035000,0.076200> rotate<0,-90.000000,0> translate<14.075200,0.000000,18.327309> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.075200,0.000000,18.796688>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.090513,0.000000,18.812000>}
box{<0,0,-0.076200><0.021655,0.035000,0.076200> rotate<0,-44.997030,0> translate<14.075200,0.000000,18.796688> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.075200,0.000000,18.827309>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.090513,0.000000,18.812000>}
box{<0,0,-0.076200><0.021653,0.035000,0.076200> rotate<0,44.991183,0> translate<14.075200,0.000000,18.827309> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.075200,0.000000,19.296688>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.075200,0.000000,18.827309>}
box{<0,0,-0.076200><0.469378,0.035000,0.076200> rotate<0,-90.000000,0> translate<14.075200,0.000000,18.827309> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.075200,0.000000,19.296688>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.090513,0.000000,19.312000>}
box{<0,0,-0.076200><0.021655,0.035000,0.076200> rotate<0,-44.997030,0> translate<14.075200,0.000000,19.296688> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.075200,0.000000,19.327309>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.090513,0.000000,19.312000>}
box{<0,0,-0.076200><0.021653,0.035000,0.076200> rotate<0,44.991183,0> translate<14.075200,0.000000,19.327309> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.075200,0.000000,19.796688>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.075200,0.000000,19.327309>}
box{<0,0,-0.076200><0.469378,0.035000,0.076200> rotate<0,-90.000000,0> translate<14.075200,0.000000,19.327309> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.075200,0.000000,19.796688>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.090513,0.000000,19.812000>}
box{<0,0,-0.076200><0.021655,0.035000,0.076200> rotate<0,-44.997030,0> translate<14.075200,0.000000,19.796688> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.075200,0.000000,19.827309>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.090513,0.000000,19.812000>}
box{<0,0,-0.076200><0.021653,0.035000,0.076200> rotate<0,44.991183,0> translate<14.075200,0.000000,19.827309> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.075200,0.000000,20.296688>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.075200,0.000000,19.827309>}
box{<0,0,-0.076200><0.469378,0.035000,0.076200> rotate<0,-90.000000,0> translate<14.075200,0.000000,19.827309> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.075200,0.000000,20.296688>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.090513,0.000000,20.312000>}
box{<0,0,-0.076200><0.021655,0.035000,0.076200> rotate<0,-44.997030,0> translate<14.075200,0.000000,20.296688> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.075200,0.000000,20.327309>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.090513,0.000000,20.312000>}
box{<0,0,-0.076200><0.021653,0.035000,0.076200> rotate<0,44.991183,0> translate<14.075200,0.000000,20.327309> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.075200,0.000000,20.796688>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.075200,0.000000,20.327309>}
box{<0,0,-0.076200><0.469378,0.035000,0.076200> rotate<0,-90.000000,0> translate<14.075200,0.000000,20.327309> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.075200,0.000000,20.796688>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.209109,0.000000,20.930597>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<14.075200,0.000000,20.796688> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.160500,-1.535000,29.766838>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.450638,-1.535000,29.476700>}
box{<0,0,-0.076200><0.410316,0.035000,0.076200> rotate<0,44.997030,0> translate<14.160500,-1.535000,29.766838> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.160500,-1.535000,30.177159>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.160500,-1.535000,29.766838>}
box{<0,0,-0.076200><0.410322,0.035000,0.076200> rotate<0,-90.000000,0> translate<14.160500,-1.535000,29.766838> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.160500,-1.535000,30.177159>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.450638,-1.535000,30.467297>}
box{<0,0,-0.076200><0.410316,0.035000,0.076200> rotate<0,-44.997030,0> translate<14.160500,-1.535000,30.177159> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.171409,0.000000,12.123000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.178616,0.000000,12.115797>}
box{<0,0,-0.076200><0.010189,0.035000,0.076200> rotate<0,44.984605,0> translate<14.171409,0.000000,12.123000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.171409,0.000000,12.123000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.196487,0.000000,12.123000>}
box{<0,0,-0.076200><0.025078,0.035000,0.076200> rotate<0,0.000000,0> translate<14.171409,0.000000,12.123000> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.450638,-1.535000,29.476700>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.860959,-1.535000,29.476700>}
box{<0,0,-0.076200><0.410322,0.035000,0.076200> rotate<0,0.000000,0> translate<14.450638,-1.535000,29.476700> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.450638,-1.535000,30.467297>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.860959,-1.535000,30.467297>}
box{<0,0,-0.076200><0.410322,0.035000,0.076200> rotate<0,0.000000,0> translate<14.450638,-1.535000,30.467297> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.316200,-1.535000,15.086541>}
box{<0,0,-0.076200><1.041710,0.035000,0.076200> rotate<0,44.997030,0> translate<14.579600,-1.535000,15.823141> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,22.408631>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,15.823141>}
box{<0,0,-0.076200><6.585491,0.035000,0.076200> rotate<0,-90.000000,0> translate<14.579600,-1.535000,15.823141> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,22.759456>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,22.586556>}
box{<0,0,-0.076200><0.172900,0.035000,0.076200> rotate<0,-90.000000,0> translate<14.579600,-1.535000,22.586556> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,22.759456>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.584472,-1.535000,22.764325>}
box{<0,0,-0.076200><0.006888,0.035000,0.076200> rotate<0,-44.978650,0> translate<14.579600,-1.535000,22.759456> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.584472,-1.535000,22.764325>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.675316,-1.535000,26.080106>}
box{<0,0,-0.076200><3.317025,0.035000,0.076200> rotate<0,-88.424802,0> translate<14.584472,-1.535000,22.764325> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.655800,-1.535000,26.099619>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.675316,-1.535000,26.080106>}
box{<0,0,-0.076200><0.027597,0.035000,0.076200> rotate<0,44.992443,0> translate<14.655800,-1.535000,26.099619> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.655800,0.000000,26.099619>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.923619,0.000000,25.831800>}
box{<0,0,-0.076200><0.378753,0.035000,0.076200> rotate<0,44.997030,0> translate<14.655800,0.000000,26.099619> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.655800,0.000000,26.478378>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.655800,0.000000,26.099619>}
box{<0,0,-0.076200><0.378759,0.035000,0.076200> rotate<0,-90.000000,0> translate<14.655800,0.000000,26.099619> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.655800,-1.535000,26.478378>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.655800,-1.535000,26.099619>}
box{<0,0,-0.076200><0.378759,0.035000,0.076200> rotate<0,-90.000000,0> translate<14.655800,-1.535000,26.099619> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.655800,0.000000,26.478378>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.923619,0.000000,26.746197>}
box{<0,0,-0.076200><0.378753,0.035000,0.076200> rotate<0,-44.997030,0> translate<14.655800,0.000000,26.478378> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.655800,-1.535000,26.478378>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.923619,-1.535000,26.746197>}
box{<0,0,-0.076200><0.378753,0.035000,0.076200> rotate<0,-44.997030,0> translate<14.655800,-1.535000,26.478378> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.670800,0.000000,13.621600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.670800,0.000000,13.480197>}
box{<0,0,-0.076200><0.141403,0.035000,0.076200> rotate<0,-90.000000,0> translate<14.670800,0.000000,13.480197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.860959,-1.535000,29.476700>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.151097,-1.535000,29.766838>}
box{<0,0,-0.076200><0.410316,0.035000,0.076200> rotate<0,-44.997030,0> translate<14.860959,-1.535000,29.476700> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.860959,-1.535000,30.467297>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.151097,-1.535000,30.177159>}
box{<0,0,-0.076200><0.410316,0.035000,0.076200> rotate<0,44.997030,0> translate<14.860959,-1.535000,30.467297> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.923619,0.000000,25.831800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.031381,0.000000,25.831800>}
box{<0,0,-0.076200><0.107762,0.035000,0.076200> rotate<0,0.000000,0> translate<14.923619,0.000000,25.831800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.923619,0.000000,26.746197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.302378,0.000000,26.746197>}
box{<0,0,-0.076200><0.378759,0.035000,0.076200> rotate<0,0.000000,0> translate<14.923619,0.000000,26.746197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.923619,-1.535000,26.746197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.302378,-1.535000,26.746197>}
box{<0,0,-0.076200><0.378759,0.035000,0.076200> rotate<0,0.000000,0> translate<14.923619,-1.535000,26.746197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.947981,0.000000,14.978797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.132988,0.000000,15.163800>}
box{<0,0,-0.076200><0.261636,0.035000,0.076200> rotate<0,-44.996546,0> translate<14.947981,0.000000,14.978797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.949859,-1.535000,29.565600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.005800,-1.535000,29.565600>}
box{<0,0,-0.076200><6.055941,0.035000,0.076200> rotate<0,0.000000,0> translate<14.949859,-1.535000,29.565600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.000656,-1.535000,30.327600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.005800,-1.535000,30.327600>}
box{<0,0,-0.076200><6.005144,0.035000,0.076200> rotate<0,0.000000,0> translate<15.000656,-1.535000,30.327600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.031381,0.000000,25.831800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.127650,0.000000,25.735534>}
box{<0,0,-0.076200><0.136142,0.035000,0.076200> rotate<0,44.996100,0> translate<15.031381,0.000000,25.831800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.082800,0.000000,24.601309>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.216709,0.000000,24.467400>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<15.082800,0.000000,24.601309> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.082800,0.000000,25.690688>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.082800,0.000000,24.601309>}
box{<0,0,-0.076200><1.089378,0.035000,0.076200> rotate<0,-90.000000,0> translate<15.082800,0.000000,24.601309> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.082800,0.000000,25.690688>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.127650,0.000000,25.735534>}
box{<0,0,-0.076200><0.063425,0.035000,0.076200> rotate<0,-44.995034,0> translate<15.082800,0.000000,25.690688> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.102259,-1.535000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.005800,-1.535000,29.718000>}
box{<0,0,-0.076200><5.903541,0.035000,0.076200> rotate<0,0.000000,0> translate<15.102259,-1.535000,29.718000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.151097,-1.535000,29.766838>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.151097,-1.535000,30.177159>}
box{<0,0,-0.076200><0.410322,0.035000,0.076200> rotate<0,90.000000,0> translate<15.151097,-1.535000,30.177159> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.151097,-1.535000,29.870400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.005800,-1.535000,29.870400>}
box{<0,0,-0.076200><5.854703,0.035000,0.076200> rotate<0,0.000000,0> translate<15.151097,-1.535000,29.870400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.151097,-1.535000,30.022800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.005800,-1.535000,30.022800>}
box{<0,0,-0.076200><5.854703,0.035000,0.076200> rotate<0,0.000000,0> translate<15.151097,-1.535000,30.022800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.151097,-1.535000,30.175200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.005800,-1.535000,30.175200>}
box{<0,0,-0.076200><5.854703,0.035000,0.076200> rotate<0,0.000000,0> translate<15.151097,-1.535000,30.175200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.216709,0.000000,24.467400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.801181,0.000000,24.467400>}
box{<0,0,-0.076200><0.584472,0.035000,0.076200> rotate<0,0.000000,0> translate<15.216709,0.000000,24.467400> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.302378,0.000000,26.746197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.570197,0.000000,26.478378>}
box{<0,0,-0.076200><0.378753,0.035000,0.076200> rotate<0,44.997030,0> translate<15.302378,0.000000,26.746197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.302378,-1.535000,26.746197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.570197,-1.535000,26.478378>}
box{<0,0,-0.076200><0.378753,0.035000,0.076200> rotate<0,44.997030,0> translate<15.302378,-1.535000,26.746197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.316200,-1.535000,15.076019>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.584019,-1.535000,14.808200>}
box{<0,0,-0.076200><0.378753,0.035000,0.076200> rotate<0,44.997030,0> translate<15.316200,-1.535000,15.076019> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.316200,-1.535000,15.086541>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.316200,-1.535000,15.076019>}
box{<0,0,-0.076200><0.010522,0.035000,0.076200> rotate<0,-90.000000,0> translate<15.316200,-1.535000,15.076019> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.378575,0.000000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780000,0.000000,26.670000>}
box{<0,0,-0.076200><2.401425,0.035000,0.076200> rotate<0,0.000000,0> translate<15.378575,0.000000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.378575,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,26.670000>}
box{<0,0,-0.076200><12.231225,0.035000,0.076200> rotate<0,0.000000,0> translate<15.378575,-1.535000,26.670000> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.055103,0.000000,17.983200>}
box{<0,0,-0.076200><3.672706,0.035000,0.076200> rotate<0,0.000000,0> translate<15.382397,0.000000,17.983200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.382397,0.000000,18.135600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.973800,0.000000,18.135600>}
box{<0,0,-0.076200><3.591403,0.035000,0.076200> rotate<0,0.000000,0> translate<15.382397,0.000000,18.135600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.382397,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.973800,0.000000,18.288000>}
box{<0,0,-0.076200><3.591403,0.035000,0.076200> rotate<0,0.000000,0> translate<15.382397,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.382397,0.000000,18.327309>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.382397,0.000000,18.796688>}
box{<0,0,-0.076200><0.469378,0.035000,0.076200> rotate<0,90.000000,0> translate<15.382397,0.000000,18.796688> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.382397,0.000000,18.440400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.973800,0.000000,18.440400>}
box{<0,0,-0.076200><3.591403,0.035000,0.076200> rotate<0,0.000000,0> translate<15.382397,0.000000,18.440400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.382397,0.000000,18.592800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.973800,0.000000,18.592800>}
box{<0,0,-0.076200><3.591403,0.035000,0.076200> rotate<0,0.000000,0> translate<15.382397,0.000000,18.592800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.382397,0.000000,18.745200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.973800,0.000000,18.745200>}
box{<0,0,-0.076200><3.591403,0.035000,0.076200> rotate<0,0.000000,0> translate<15.382397,0.000000,18.745200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.382397,0.000000,18.827309>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.382397,0.000000,19.296688>}
box{<0,0,-0.076200><0.469378,0.035000,0.076200> rotate<0,90.000000,0> translate<15.382397,0.000000,19.296688> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.382397,0.000000,18.897600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.973800,0.000000,18.897600>}
box{<0,0,-0.076200><3.591403,0.035000,0.076200> rotate<0,0.000000,0> translate<15.382397,0.000000,18.897600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.382397,0.000000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.973800,0.000000,19.050000>}
box{<0,0,-0.076200><3.591403,0.035000,0.076200> rotate<0,0.000000,0> translate<15.382397,0.000000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.382397,0.000000,19.202400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.029706,0.000000,19.202400>}
box{<0,0,-0.076200><3.647309,0.035000,0.076200> rotate<0,0.000000,0> translate<15.382397,0.000000,19.202400> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.901456,-1.535000,15.722597>}
box{<0,0,-0.076200><0.648077,0.035000,0.076200> rotate<0,44.997030,0> translate<15.443197,-1.535000,16.180856> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.920200,-1.535000,16.916400>}
box{<0,0,-0.076200><6.477003,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,16.916400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.920200,-1.535000,17.068800>}
box{<0,0,-0.076200><6.477003,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,17.221200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.920200,-1.535000,17.221200>}
box{<0,0,-0.076200><6.477003,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,17.221200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,17.373600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.010222,-1.535000,17.373600>}
box{<0,0,-0.076200><6.567025,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,17.373600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,17.526000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.162622,-1.535000,17.526000>}
box{<0,0,-0.076200><6.719425,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,17.526000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,17.678400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,17.678400>}
box{<0,0,-0.076200><12.166603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,17.678400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,17.830800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,17.830800>}
box{<0,0,-0.076200><12.166603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,17.830800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,17.983200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,17.983200>}
box{<0,0,-0.076200><12.166603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,17.983200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,18.135600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,18.135600>}
box{<0,0,-0.076200><12.166603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,18.135600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,18.288000>}
box{<0,0,-0.076200><12.166603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,18.440400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,18.440400>}
box{<0,0,-0.076200><12.166603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,18.440400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,18.592800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,18.592800>}
box{<0,0,-0.076200><12.166603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,18.592800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,18.745200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,18.745200>}
box{<0,0,-0.076200><12.166603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,18.745200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,18.897600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,18.897600>}
box{<0,0,-0.076200><12.166603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,18.897600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,19.050000>}
box{<0,0,-0.076200><12.166603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,19.202400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,19.202400>}
box{<0,0,-0.076200><12.166603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,19.202400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,19.354800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,19.354800>}
box{<0,0,-0.076200><12.166603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,19.354800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,19.507200>}
box{<0,0,-0.076200><12.166603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,19.659600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,19.659600>}
box{<0,0,-0.076200><12.166603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,19.659600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,19.812000>}
box{<0,0,-0.076200><12.166603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,19.964400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,19.964400>}
box{<0,0,-0.076200><12.166603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,19.964400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,20.116800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,20.116800>}
box{<0,0,-0.076200><12.166603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,20.116800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,20.269200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,20.269200>}
box{<0,0,-0.076200><12.166603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,20.269200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,20.421600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,20.421600>}
box{<0,0,-0.076200><12.166603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,20.421600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,20.574000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,20.574000>}
box{<0,0,-0.076200><12.166603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,20.574000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,20.726400>}
box{<0,0,-0.076200><12.166603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,20.878800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,20.878800>}
box{<0,0,-0.076200><12.166603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,20.878800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,21.031200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,21.031200>}
box{<0,0,-0.076200><12.166603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,21.031200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,21.183600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,21.183600>}
box{<0,0,-0.076200><12.166603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,21.183600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,21.336000>}
box{<0,0,-0.076200><12.166603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,21.488400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,21.488400>}
box{<0,0,-0.076200><12.166603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,21.488400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,21.640800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,21.640800>}
box{<0,0,-0.076200><12.166603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,21.640800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,21.793200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,21.793200>}
box{<0,0,-0.076200><12.166603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,21.793200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,21.945600>}
box{<0,0,-0.076200><12.166603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,22.098000>}
box{<0,0,-0.076200><12.166603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,22.250400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,22.250400>}
box{<0,0,-0.076200><12.166603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,22.250400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,22.402800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,22.402800>}
box{<0,0,-0.076200><12.166603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,22.402800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,22.555200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,22.555200>}
box{<0,0,-0.076200><12.166603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,22.555200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,22.574650>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.538913,-1.535000,26.068338>}
box{<0,0,-0.076200><3.494998,0.035000,0.076200> rotate<0,-88.424839,0> translate<15.443197,-1.535000,22.574650> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.446838,-1.535000,22.707600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,22.707600>}
box{<0,0,-0.076200><12.162962,0.035000,0.076200> rotate<0,0.000000,0> translate<15.446838,-1.535000,22.707600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.451013,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,22.860000>}
box{<0,0,-0.076200><12.158787,0.035000,0.076200> rotate<0,0.000000,0> translate<15.451013,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.455188,-1.535000,23.012400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,23.012400>}
box{<0,0,-0.076200><12.154612,0.035000,0.076200> rotate<0,0.000000,0> translate<15.455188,-1.535000,23.012400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.459363,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,23.164800>}
box{<0,0,-0.076200><12.150437,0.035000,0.076200> rotate<0,0.000000,0> translate<15.459363,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.463538,-1.535000,23.317200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,23.317200>}
box{<0,0,-0.076200><12.146262,0.035000,0.076200> rotate<0,0.000000,0> translate<15.463538,-1.535000,23.317200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.467713,-1.535000,23.469600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,23.469600>}
box{<0,0,-0.076200><12.142087,0.035000,0.076200> rotate<0,0.000000,0> translate<15.467713,-1.535000,23.469600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.469653,-1.535000,16.154400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.512744,-1.535000,16.154400>}
box{<0,0,-0.076200><6.043091,0.035000,0.076200> rotate<0,0.000000,0> translate<15.469653,-1.535000,16.154400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.471891,-1.535000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,23.622000>}
box{<0,0,-0.076200><12.137909,0.035000,0.076200> rotate<0,0.000000,0> translate<15.471891,-1.535000,23.622000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.476066,-1.535000,23.774400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,23.774400>}
box{<0,0,-0.076200><12.133734,0.035000,0.076200> rotate<0,0.000000,0> translate<15.476066,-1.535000,23.774400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.480241,-1.535000,23.926800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,23.926800>}
box{<0,0,-0.076200><12.129559,0.035000,0.076200> rotate<0,0.000000,0> translate<15.480241,-1.535000,23.926800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.484416,-1.535000,24.079200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,24.079200>}
box{<0,0,-0.076200><12.125384,0.035000,0.076200> rotate<0,0.000000,0> translate<15.484416,-1.535000,24.079200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.488591,-1.535000,24.231600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,24.231600>}
box{<0,0,-0.076200><12.121209,0.035000,0.076200> rotate<0,0.000000,0> translate<15.488591,-1.535000,24.231600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.492766,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,24.384000>}
box{<0,0,-0.076200><12.117034,0.035000,0.076200> rotate<0,0.000000,0> translate<15.492766,-1.535000,24.384000> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,24.536400>}
box{<0,0,-0.076200><12.112859,0.035000,0.076200> rotate<0,0.000000,0> translate<15.496941,-1.535000,24.536400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.501116,-1.535000,24.688800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,24.688800>}
box{<0,0,-0.076200><12.108684,0.035000,0.076200> rotate<0,0.000000,0> translate<15.501116,-1.535000,24.688800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.505291,-1.535000,24.841200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,24.841200>}
box{<0,0,-0.076200><12.104509,0.035000,0.076200> rotate<0,0.000000,0> translate<15.505291,-1.535000,24.841200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.509466,-1.535000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,24.993600>}
box{<0,0,-0.076200><12.100334,0.035000,0.076200> rotate<0,0.000000,0> translate<15.509466,-1.535000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.513641,-1.535000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,25.146000>}
box{<0,0,-0.076200><12.096159,0.035000,0.076200> rotate<0,0.000000,0> translate<15.513641,-1.535000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.517816,-1.535000,25.298400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,25.298400>}
box{<0,0,-0.076200><12.091984,0.035000,0.076200> rotate<0,0.000000,0> translate<15.517816,-1.535000,25.298400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.521994,-1.535000,25.450800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,25.450800>}
box{<0,0,-0.076200><12.087806,0.035000,0.076200> rotate<0,0.000000,0> translate<15.521994,-1.535000,25.450800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.526169,-1.535000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,25.603200>}
box{<0,0,-0.076200><12.083631,0.035000,0.076200> rotate<0,0.000000,0> translate<15.526169,-1.535000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.530344,-1.535000,25.755600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,25.755600>}
box{<0,0,-0.076200><12.079456,0.035000,0.076200> rotate<0,0.000000,0> translate<15.530344,-1.535000,25.755600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.530975,0.000000,26.517600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780000,0.000000,26.517600>}
box{<0,0,-0.076200><2.249025,0.035000,0.076200> rotate<0,0.000000,0> translate<15.530975,0.000000,26.517600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.530975,-1.535000,26.517600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,26.517600>}
box{<0,0,-0.076200><12.078825,0.035000,0.076200> rotate<0,0.000000,0> translate<15.530975,-1.535000,26.517600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.534519,-1.535000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,25.908000>}
box{<0,0,-0.076200><12.075281,0.035000,0.076200> rotate<0,0.000000,0> translate<15.534519,-1.535000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.538694,-1.535000,26.060400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,26.060400>}
box{<0,0,-0.076200><12.071106,0.035000,0.076200> rotate<0,0.000000,0> translate<15.538694,-1.535000,26.060400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.538913,-1.535000,26.068338>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.570197,-1.535000,26.099619>}
box{<0,0,-0.076200><0.044241,0.035000,0.076200> rotate<0,-44.994169,0> translate<15.538913,-1.535000,26.068338> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.565484,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.824200,0.000000,13.411200>}
box{<0,0,-0.076200><0.258716,0.035000,0.076200> rotate<0,0.000000,0> translate<15.565484,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.565488,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.666384,0.000000,12.192000>}
box{<0,0,-0.076200><0.100897,0.035000,0.076200> rotate<0,0.000000,0> translate<15.565488,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.570197,-1.535000,26.099619>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.570197,-1.535000,26.478378>}
box{<0,0,-0.076200><0.378759,0.035000,0.076200> rotate<0,90.000000,0> translate<15.570197,-1.535000,26.478378> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.570197,-1.535000,26.212800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,26.212800>}
box{<0,0,-0.076200><12.039603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.570197,-1.535000,26.212800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.570197,-1.535000,26.365200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,26.365200>}
box{<0,0,-0.076200><12.039603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.570197,-1.535000,26.365200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.570197,0.000000,26.370616>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.570197,0.000000,26.478378>}
box{<0,0,-0.076200><0.107762,0.035000,0.076200> rotate<0,90.000000,0> translate<15.570197,0.000000,26.478378> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.570197,0.000000,26.370616>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.042397,0.000000,25.898416>}
box{<0,0,-0.076200><0.667792,0.035000,0.076200> rotate<0,44.997030,0> translate<15.570197,0.000000,26.370616> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.575613,0.000000,26.365200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780000,0.000000,26.365200>}
box{<0,0,-0.076200><2.204388,0.035000,0.076200> rotate<0,0.000000,0> translate<15.575613,0.000000,26.365200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.584019,-1.535000,14.808200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.962778,-1.535000,14.808200>}
box{<0,0,-0.076200><0.378759,0.035000,0.076200> rotate<0,0.000000,0> translate<15.584019,-1.535000,14.808200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.590181,0.000000,12.115797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.824200,0.000000,12.349816>}
box{<0,0,-0.076200><0.330952,0.035000,0.076200> rotate<0,-44.997030,0> translate<15.590181,0.000000,12.115797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.590888,0.000000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.824200,0.000000,13.716000>}
box{<0,0,-0.076200><0.233313,0.035000,0.076200> rotate<0,0.000000,0> translate<15.590888,0.000000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.622053,-1.535000,16.002000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.360344,-1.535000,16.002000>}
box{<0,0,-0.076200><5.738291,0.035000,0.076200> rotate<0,0.000000,0> translate<15.622053,-1.535000,16.002000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.622056,0.000000,16.027397>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.809319,0.000000,15.840131>}
box{<0,0,-0.076200><0.264831,0.035000,0.076200> rotate<0,44.997508,0> translate<15.622056,0.000000,16.027397> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.855013,0.000000,14.808200>}
box{<0,0,-0.076200><0.317657,0.035000,0.076200> rotate<0,-44.997429,0> translate<15.630397,0.000000,14.583581> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.799853,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.818788,0.000000,15.849600>}
box{<0,0,-0.076200><0.018934,0.035000,0.076200> rotate<0,0.000000,0> translate<15.799853,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.801181,0.000000,24.467400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.072800,0.000000,23.195781>}
box{<0,0,-0.076200><1.798340,0.035000,0.076200> rotate<0,44.997030,0> translate<15.801181,0.000000,24.467400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.809319,0.000000,15.840131>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.072800,0.000000,16.103616>}
box{<0,0,-0.076200><0.372621,0.035000,0.076200> rotate<0,-44.997370,0> translate<15.809319,0.000000,15.840131> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.824200,0.000000,14.762816>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.824200,0.000000,12.349816>}
box{<0,0,-0.076200><2.413000,0.035000,0.076200> rotate<0,-90.000000,0> translate<15.824200,0.000000,12.349816> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.824200,0.000000,14.762816>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.869588,0.000000,14.808200>}
box{<0,0,-0.076200><0.064185,0.035000,0.076200> rotate<0,-44.995058,0> translate<15.824200,0.000000,14.762816> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.829613,0.000000,14.782800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.844188,0.000000,14.782800>}
box{<0,0,-0.076200><0.014575,0.035000,0.076200> rotate<0,0.000000,0> translate<15.829613,0.000000,14.782800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.855013,0.000000,14.808200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.869588,0.000000,14.808200>}
box{<0,0,-0.076200><0.014575,0.035000,0.076200> rotate<0,0.000000,0> translate<15.855013,0.000000,14.808200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.880413,0.000000,26.060400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780000,0.000000,26.060400>}
box{<0,0,-0.076200><1.899588,0.035000,0.076200> rotate<0,0.000000,0> translate<15.880413,0.000000,26.060400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.901456,-1.535000,15.722597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.962778,-1.535000,15.722597>}
box{<0,0,-0.076200><0.061322,0.035000,0.076200> rotate<0,0.000000,0> translate<15.901456,-1.535000,15.722597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.905816,0.000000,11.353800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.363016,0.000000,11.811000>}
box{<0,0,-0.076200><0.646578,0.035000,0.076200> rotate<0,-44.997030,0> translate<15.905816,0.000000,11.353800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.962778,-1.535000,14.808200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.988178,-1.535000,14.833600>}
box{<0,0,-0.076200><0.035921,0.035000,0.076200> rotate<0,-44.997030,0> translate<15.962778,-1.535000,14.808200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.962778,-1.535000,15.722597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.988178,-1.535000,15.697197>}
box{<0,0,-0.076200><0.035921,0.035000,0.076200> rotate<0,44.997030,0> translate<15.962778,-1.535000,15.722597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.982016,0.000000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.606000,0.000000,11.430000>}
box{<0,0,-0.076200><6.623984,0.035000,0.076200> rotate<0,0.000000,0> translate<15.982016,0.000000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.988175,-1.535000,15.697200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.241622,-1.535000,15.697200>}
box{<0,0,-0.076200><3.253447,0.035000,0.076200> rotate<0,0.000000,0> translate<15.988175,-1.535000,15.697200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.988178,-1.535000,14.833600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.241619,-1.535000,14.833600>}
box{<0,0,-0.076200><3.253441,0.035000,0.076200> rotate<0,0.000000,0> translate<15.988178,-1.535000,14.833600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.988178,-1.535000,15.697197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.241619,-1.535000,15.697197>}
box{<0,0,-0.076200><3.253441,0.035000,0.076200> rotate<0,0.000000,0> translate<15.988178,-1.535000,15.697197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.032813,0.000000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780000,0.000000,25.908000>}
box{<0,0,-0.076200><1.747187,0.035000,0.076200> rotate<0,0.000000,0> translate<16.032813,0.000000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.042397,0.000000,25.824597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.042397,0.000000,25.898416>}
box{<0,0,-0.076200><0.073819,0.035000,0.076200> rotate<0,90.000000,0> translate<16.042397,0.000000,25.898416> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.042397,0.000000,25.824597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.106088,0.000000,25.824597>}
box{<0,0,-0.076200><0.063691,0.035000,0.076200> rotate<0,0.000000,0> translate<16.042397,0.000000,25.824597> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.106088,0.000000,25.824597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.239997,0.000000,25.690688>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<16.106088,0.000000,25.824597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.134416,0.000000,11.582400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.606000,0.000000,11.582400>}
box{<0,0,-0.076200><6.471584,0.035000,0.076200> rotate<0,0.000000,0> translate<16.134416,0.000000,11.582400> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.606000,0.000000,11.734800>}
box{<0,0,-0.076200><6.319184,0.035000,0.076200> rotate<0,0.000000,0> translate<16.286816,0.000000,11.734800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.352612,0.000000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780000,0.000000,24.993600>}
box{<0,0,-0.076200><1.427388,0.035000,0.076200> rotate<0,0.000000,0> translate<16.352612,0.000000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.363016,0.000000,11.811000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.586197,0.000000,12.034181>}
box{<0,0,-0.076200><0.315626,0.035000,0.076200> rotate<0,-44.997030,0> translate<16.363016,0.000000,11.811000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.439216,0.000000,11.887200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.606000,0.000000,11.887200>}
box{<0,0,-0.076200><6.166784,0.035000,0.076200> rotate<0,0.000000,0> translate<16.439216,0.000000,11.887200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.505012,0.000000,24.841200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780000,0.000000,24.841200>}
box{<0,0,-0.076200><1.274988,0.035000,0.076200> rotate<0,0.000000,0> translate<16.505012,0.000000,24.841200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.586197,0.000000,12.034181>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.586197,0.000000,14.447181>}
box{<0,0,-0.076200><2.413000,0.035000,0.076200> rotate<0,90.000000,0> translate<16.586197,0.000000,14.447181> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.586197,0.000000,12.039600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.606000,0.000000,12.039600>}
box{<0,0,-0.076200><6.019803,0.035000,0.076200> rotate<0,0.000000,0> translate<16.586197,0.000000,12.039600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.586197,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.606000,0.000000,12.192000>}
box{<0,0,-0.076200><6.019803,0.035000,0.076200> rotate<0,0.000000,0> translate<16.586197,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.586197,0.000000,12.344400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.606000,0.000000,12.344400>}
box{<0,0,-0.076200><6.019803,0.035000,0.076200> rotate<0,0.000000,0> translate<16.586197,0.000000,12.344400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.586197,0.000000,12.496800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.606000,0.000000,12.496800>}
box{<0,0,-0.076200><6.019803,0.035000,0.076200> rotate<0,0.000000,0> translate<16.586197,0.000000,12.496800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.586197,0.000000,12.649200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.606000,0.000000,12.649200>}
box{<0,0,-0.076200><6.019803,0.035000,0.076200> rotate<0,0.000000,0> translate<16.586197,0.000000,12.649200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.586197,0.000000,12.801600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.606000,0.000000,12.801600>}
box{<0,0,-0.076200><6.019803,0.035000,0.076200> rotate<0,0.000000,0> translate<16.586197,0.000000,12.801600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.586197,0.000000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.606000,0.000000,12.954000>}
box{<0,0,-0.076200><6.019803,0.035000,0.076200> rotate<0,0.000000,0> translate<16.586197,0.000000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.586197,0.000000,13.106400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.606000,0.000000,13.106400>}
box{<0,0,-0.076200><6.019803,0.035000,0.076200> rotate<0,0.000000,0> translate<16.586197,0.000000,13.106400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.586197,0.000000,13.258800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.606000,0.000000,13.258800>}
box{<0,0,-0.076200><6.019803,0.035000,0.076200> rotate<0,0.000000,0> translate<16.586197,0.000000,13.258800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.586197,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.606000,0.000000,13.411200>}
box{<0,0,-0.076200><6.019803,0.035000,0.076200> rotate<0,0.000000,0> translate<16.586197,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.586197,0.000000,13.563600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.606000,0.000000,13.563600>}
box{<0,0,-0.076200><6.019803,0.035000,0.076200> rotate<0,0.000000,0> translate<16.586197,0.000000,13.563600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.586197,0.000000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.606000,0.000000,13.716000>}
box{<0,0,-0.076200><6.019803,0.035000,0.076200> rotate<0,0.000000,0> translate<16.586197,0.000000,13.716000> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.075400,0.000000,14.935200>}
box{<0,0,-0.076200><1.240603,0.035000,0.076200> rotate<0,0.000000,0> translate<17.834797,0.000000,14.935200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.834797,0.000000,15.087600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.999200,0.000000,15.087600>}
box{<0,0,-0.076200><1.164403,0.035000,0.076200> rotate<0,0.000000,0> translate<17.834797,0.000000,15.087600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.834797,0.000000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.942981,0.000000,15.240000>}
box{<0,0,-0.076200><1.108184,0.035000,0.076200> rotate<0,0.000000,0> translate<17.834797,0.000000,15.240000> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.572800,0.000000,15.610181>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.999200,0.000000,15.183781>}
box{<0,0,-0.076200><0.603021,0.035000,0.076200> rotate<0,44.997030,0> translate<18.572800,0.000000,15.610181> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.075400,0.000000,14.893797>}
box{<0,0,-0.076200><0.163691,0.035000,0.076200> rotate<0,0.000000,0> translate<18.911709,0.000000,14.893797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.973800,0.000000,18.064503>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.182103,0.000000,17.856200>}
box{<0,0,-0.076200><0.294585,0.035000,0.076200> rotate<0,44.997030,0> translate<18.973800,0.000000,18.064503> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.973800,0.000000,19.146494>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.973800,0.000000,18.064503>}
box{<0,0,-0.076200><1.081991,0.035000,0.076200> rotate<0,-90.000000,0> translate<18.973800,0.000000,18.064503> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.973800,0.000000,19.146494>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.182103,0.000000,19.354797>}
box{<0,0,-0.076200><0.294585,0.035000,0.076200> rotate<0,-44.997030,0> translate<18.973800,0.000000,19.146494> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.999200,0.000000,15.076019>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.075400,0.000000,14.999819>}
box{<0,0,-0.076200><0.107763,0.035000,0.076200> rotate<0,44.997030,0> translate<18.999200,0.000000,15.076019> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.999200,0.000000,15.183781>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.999200,0.000000,15.076019>}
box{<0,0,-0.076200><0.107762,0.035000,0.076200> rotate<0,-90.000000,0> translate<18.999200,0.000000,15.076019> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.075400,0.000000,14.999819>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.075400,0.000000,14.893797>}
box{<0,0,-0.076200><0.106022,0.035000,0.076200> rotate<0,-90.000000,0> translate<19.075400,0.000000,14.893797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.182103,0.000000,17.856200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.476694,0.000000,17.856200>}
box{<0,0,-0.076200><0.294591,0.035000,0.076200> rotate<0,0.000000,0> translate<19.182103,0.000000,17.856200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.182103,0.000000,19.354797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.476694,0.000000,19.354797>}
box{<0,0,-0.076200><0.294591,0.035000,0.076200> rotate<0,0.000000,0> translate<19.182103,0.000000,19.354797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.188488,0.000000,17.490597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.322397,0.000000,17.356687>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<19.188488,0.000000,17.490597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.188488,0.000000,22.133400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.322397,0.000000,22.267309>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<19.188488,0.000000,22.133400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.241619,-1.535000,14.833600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.267019,-1.535000,14.808200>}
box{<0,0,-0.076200><0.035921,0.035000,0.076200> rotate<0,44.997030,0> translate<19.241619,-1.535000,14.833600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.241619,-1.535000,15.697197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.267019,-1.535000,15.722597>}
box{<0,0,-0.076200><0.035921,0.035000,0.076200> rotate<0,-44.997030,0> translate<19.241619,-1.535000,15.697197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.267019,-1.535000,14.808200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.645778,-1.535000,14.808200>}
box{<0,0,-0.076200><0.378759,0.035000,0.076200> rotate<0,0.000000,0> translate<19.267019,-1.535000,14.808200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.267019,-1.535000,15.722597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.645778,-1.535000,15.722597>}
box{<0,0,-0.076200><0.378759,0.035000,0.076200> rotate<0,0.000000,0> translate<19.267019,-1.535000,15.722597> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.572800,0.000000,15.920616>}
box{<0,0,-0.076200><0.164617,0.035000,0.076200> rotate<0,-44.997799,0> translate<19.456400,0.000000,15.804213> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.476694,0.000000,17.856200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.684997,0.000000,18.064503>}
box{<0,0,-0.076200><0.294585,0.035000,0.076200> rotate<0,-44.997030,0> translate<19.476694,0.000000,17.856200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.476694,0.000000,19.354797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.684997,0.000000,19.146494>}
box{<0,0,-0.076200><0.294585,0.035000,0.076200> rotate<0,44.997030,0> translate<19.476694,0.000000,19.354797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.572800,0.000000,16.994816>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.572800,0.000000,15.920616>}
box{<0,0,-0.076200><1.074200,0.035000,0.076200> rotate<0,-90.000000,0> translate<19.572800,0.000000,15.920616> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.572800,0.000000,16.994816>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.585200,0.000000,17.007213>}
box{<0,0,-0.076200><0.017534,0.035000,0.076200> rotate<0,-44.989810,0> translate<19.572800,0.000000,16.994816> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.572800,0.000000,22.629181>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.585200,0.000000,22.616784>}
box{<0,0,-0.076200><0.017534,0.035000,0.076200> rotate<0,44.989810,0> translate<19.572800,0.000000,22.629181> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.572800,0.000000,24.003000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.572800,0.000000,22.629181>}
box{<0,0,-0.076200><1.373819,0.035000,0.076200> rotate<0,-90.000000,0> translate<19.572800,0.000000,22.629181> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.585200,0.000000,17.356687>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.585200,0.000000,17.007213>}
box{<0,0,-0.076200><0.349475,0.035000,0.076200> rotate<0,-90.000000,0> translate<19.585200,0.000000,17.007213> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.585200,0.000000,17.356687>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.719109,0.000000,17.490597>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<19.585200,0.000000,17.356687> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.585200,0.000000,22.267309>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.719109,0.000000,22.133400>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<19.585200,0.000000,22.267309> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.585200,0.000000,22.616784>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.585200,0.000000,22.267309>}
box{<0,0,-0.076200><0.349475,0.035000,0.076200> rotate<0,-90.000000,0> translate<19.585200,0.000000,22.267309> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.603694,0.000000,17.983200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.762381,0.000000,17.983200>}
box{<0,0,-0.076200><2.158687,0.035000,0.076200> rotate<0,0.000000,0> translate<19.603694,0.000000,17.983200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.629091,0.000000,19.202400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.045000,0.000000,19.202400>}
box{<0,0,-0.076200><3.415909,0.035000,0.076200> rotate<0,0.000000,0> translate<19.629091,0.000000,19.202400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.645778,-1.535000,14.808200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.671178,-1.535000,14.833600>}
box{<0,0,-0.076200><0.035921,0.035000,0.076200> rotate<0,-44.997030,0> translate<19.645778,-1.535000,14.808200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.645778,-1.535000,15.722597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.671178,-1.535000,15.697197>}
box{<0,0,-0.076200><0.035921,0.035000,0.076200> rotate<0,44.997030,0> translate<19.645778,-1.535000,15.722597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.671175,-1.535000,15.697200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.055544,-1.535000,15.697200>}
box{<0,0,-0.076200><1.384369,0.035000,0.076200> rotate<0,0.000000,0> translate<19.671175,-1.535000,15.697200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.671178,-1.535000,14.833600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.413256,-1.535000,14.833600>}
box{<0,0,-0.076200><1.742078,0.035000,0.076200> rotate<0,0.000000,0> translate<19.671178,-1.535000,14.833600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.671178,-1.535000,15.697197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.055541,-1.535000,15.697197>}
box{<0,0,-0.076200><1.384363,0.035000,0.076200> rotate<0,0.000000,0> translate<19.671178,-1.535000,15.697197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.684997,0.000000,18.064503>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.684997,0.000000,19.146494>}
box{<0,0,-0.076200><1.081991,0.035000,0.076200> rotate<0,90.000000,0> translate<19.684997,0.000000,19.146494> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.684997,0.000000,18.135600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.609981,0.000000,18.135600>}
box{<0,0,-0.076200><1.924984,0.035000,0.076200> rotate<0,0.000000,0> translate<19.684997,0.000000,18.135600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.684997,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.064509,0.000000,18.288000>}
box{<0,0,-0.076200><0.379513,0.035000,0.076200> rotate<0,0.000000,0> translate<19.684997,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.684997,0.000000,18.440400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.025200,0.000000,18.440400>}
box{<0,0,-0.076200><0.340203,0.035000,0.076200> rotate<0,0.000000,0> translate<19.684997,0.000000,18.440400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.684997,0.000000,18.592800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.025200,0.000000,18.592800>}
box{<0,0,-0.076200><0.340203,0.035000,0.076200> rotate<0,0.000000,0> translate<19.684997,0.000000,18.592800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.684997,0.000000,18.745200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.025200,0.000000,18.745200>}
box{<0,0,-0.076200><0.340203,0.035000,0.076200> rotate<0,0.000000,0> translate<19.684997,0.000000,18.745200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.684997,0.000000,18.897600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.126113,0.000000,18.897600>}
box{<0,0,-0.076200><0.441116,0.035000,0.076200> rotate<0,0.000000,0> translate<19.684997,0.000000,18.897600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.684997,0.000000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.123309,0.000000,19.050000>}
box{<0,0,-0.076200><3.438313,0.035000,0.076200> rotate<0,0.000000,0> translate<19.684997,0.000000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.719109,0.000000,17.490597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.025200,0.000000,17.490597>}
box{<0,0,-0.076200><0.306091,0.035000,0.076200> rotate<0,0.000000,0> translate<19.719109,0.000000,17.490597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.719109,0.000000,22.133400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.025200,0.000000,22.133400>}
box{<0,0,-0.076200><0.306091,0.035000,0.076200> rotate<0,0.000000,0> translate<19.719109,0.000000,22.133400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.837397,0.000000,14.893797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.837397,0.000000,14.999819>}
box{<0,0,-0.076200><0.106022,0.035000,0.076200> rotate<0,90.000000,0> translate<19.837397,0.000000,14.999819> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.837397,0.000000,14.893797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.001088,0.000000,14.893797>}
box{<0,0,-0.076200><0.163691,0.035000,0.076200> rotate<0,0.000000,0> translate<19.837397,0.000000,14.893797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.837397,0.000000,14.935200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.244981,0.000000,14.935200>}
box{<0,0,-0.076200><2.407584,0.035000,0.076200> rotate<0,0.000000,0> translate<19.837397,0.000000,14.935200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.837397,0.000000,14.999819>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.913597,0.000000,15.076019>}
box{<0,0,-0.076200><0.107763,0.035000,0.076200> rotate<0,-44.997030,0> translate<19.837397,0.000000,14.999819> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.913597,0.000000,15.076019>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.913597,0.000000,15.183781>}
box{<0,0,-0.076200><0.107762,0.035000,0.076200> rotate<0,90.000000,0> translate<19.913597,0.000000,15.183781> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.913597,0.000000,15.087600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.092581,0.000000,15.087600>}
box{<0,0,-0.076200><2.178984,0.035000,0.076200> rotate<0,0.000000,0> translate<19.913597,0.000000,15.087600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.913597,0.000000,15.183781>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.334797,0.000000,15.604981>}
box{<0,0,-0.076200><0.595667,0.035000,0.076200> rotate<0,-44.997030,0> translate<19.913597,0.000000,15.183781> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.969816,0.000000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.940181,0.000000,15.240000>}
box{<0,0,-0.076200><1.970366,0.035000,0.076200> rotate<0,0.000000,0> translate<19.969816,0.000000,15.240000> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.112084,0.000000,14.782800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.397381,0.000000,14.782800>}
box{<0,0,-0.076200><2.285297,0.035000,0.076200> rotate<0,0.000000,0> translate<20.112084,0.000000,14.782800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.122216,0.000000,15.392400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.787781,0.000000,15.392400>}
box{<0,0,-0.076200><1.665566,0.035000,0.076200> rotate<0,0.000000,0> translate<20.122216,0.000000,15.392400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.132888,0.000000,13.868400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.606000,0.000000,13.868400>}
box{<0,0,-0.076200><2.473112,0.035000,0.076200> rotate<0,0.000000,0> translate<20.132888,0.000000,13.868400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.134997,0.000000,13.870509>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.134997,0.000000,14.759888>}
box{<0,0,-0.076200><0.889378,0.035000,0.076200> rotate<0,90.000000,0> translate<20.134997,0.000000,14.759888> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.134997,0.000000,14.020800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.606000,0.000000,14.020800>}
box{<0,0,-0.076200><2.471003,0.035000,0.076200> rotate<0,0.000000,0> translate<20.134997,0.000000,14.020800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.134997,0.000000,14.173200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.606000,0.000000,14.173200>}
box{<0,0,-0.076200><2.471003,0.035000,0.076200> rotate<0,0.000000,0> translate<20.134997,0.000000,14.173200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.134997,0.000000,14.325600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.606000,0.000000,14.325600>}
box{<0,0,-0.076200><2.471003,0.035000,0.076200> rotate<0,0.000000,0> translate<20.134997,0.000000,14.325600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.134997,0.000000,14.478000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.606000,0.000000,14.478000>}
box{<0,0,-0.076200><2.471003,0.035000,0.076200> rotate<0,0.000000,0> translate<20.134997,0.000000,14.478000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.134997,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.549781,0.000000,14.630400>}
box{<0,0,-0.076200><2.414784,0.035000,0.076200> rotate<0,0.000000,0> translate<20.134997,0.000000,14.630400> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.508581,0.000000,21.430597>}
box{<0,0,-0.076200><0.349472,0.035000,0.076200> rotate<0,0.000000,0> translate<20.159109,0.000000,21.430597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.159109,0.000000,21.693400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.508581,0.000000,21.693400>}
box{<0,0,-0.076200><0.349472,0.035000,0.076200> rotate<0,0.000000,0> translate<20.159109,0.000000,21.693400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.274616,0.000000,15.544800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.635381,0.000000,15.544800>}
box{<0,0,-0.076200><1.360766,0.035000,0.076200> rotate<0,0.000000,0> translate<20.274616,0.000000,15.544800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.334797,0.000000,15.604981>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.334797,0.000000,16.845388>}
box{<0,0,-0.076200><1.240406,0.035000,0.076200> rotate<0,90.000000,0> translate<20.334797,0.000000,16.845388> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.334797,0.000000,15.697200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.482981,0.000000,15.697200>}
box{<0,0,-0.076200><1.148184,0.035000,0.076200> rotate<0,0.000000,0> translate<20.334797,0.000000,15.697200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.334797,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.330581,0.000000,15.849600>}
box{<0,0,-0.076200><0.995784,0.035000,0.076200> rotate<0,0.000000,0> translate<20.334797,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.334797,0.000000,16.002000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.178181,0.000000,16.002000>}
box{<0,0,-0.076200><0.843384,0.035000,0.076200> rotate<0,0.000000,0> translate<20.334797,0.000000,16.002000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.334797,0.000000,16.154400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.025781,0.000000,16.154400>}
box{<0,0,-0.076200><0.690984,0.035000,0.076200> rotate<0,0.000000,0> translate<20.334797,0.000000,16.154400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.334797,0.000000,16.306800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.873381,0.000000,16.306800>}
box{<0,0,-0.076200><0.538584,0.035000,0.076200> rotate<0,0.000000,0> translate<20.334797,0.000000,16.306800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.334797,0.000000,16.459200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.720981,0.000000,16.459200>}
box{<0,0,-0.076200><0.386184,0.035000,0.076200> rotate<0,0.000000,0> translate<20.334797,0.000000,16.459200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.334797,0.000000,16.611600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.568581,0.000000,16.611600>}
box{<0,0,-0.076200><0.233784,0.035000,0.076200> rotate<0,0.000000,0> translate<20.334797,0.000000,16.611600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.334797,0.000000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.416181,0.000000,16.764000>}
box{<0,0,-0.076200><0.081384,0.035000,0.076200> rotate<0,0.000000,0> translate<20.334797,0.000000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.334797,0.000000,16.845388>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.606000,0.000000,14.574181>}
box{<0,0,-0.076200><3.211968,0.035000,0.076200> rotate<0,44.997070,0> translate<20.334797,0.000000,16.845388> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.508581,0.000000,21.430597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.520981,0.000000,21.442997>}
box{<0,0,-0.076200><0.017536,0.035000,0.076200> rotate<0,-44.997030,0> translate<20.508581,0.000000,21.430597> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.860416,0.000000,19.681000>}
box{<0,0,-0.076200><1.339434,0.035000,0.076200> rotate<0,0.000000,0> translate<20.520981,0.000000,19.681000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.520981,0.000000,21.442997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.960313,0.000000,21.442997>}
box{<0,0,-0.076200><1.439331,0.035000,0.076200> rotate<0,0.000000,0> translate<20.520981,0.000000,21.442997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.520981,0.000000,21.681000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.836616,0.000000,21.681000>}
box{<0,0,-0.076200><0.315634,0.035000,0.076200> rotate<0,0.000000,0> translate<20.520981,0.000000,21.681000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.574000,0.000000,6.052109>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.707909,0.000000,5.918200>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<20.574000,0.000000,6.052109> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.574000,0.000000,8.171888>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.574000,0.000000,6.052109>}
box{<0,0,-0.076200><2.119778,0.035000,0.076200> rotate<0,-90.000000,0> translate<20.574000,0.000000,6.052109> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.574000,0.000000,8.171888>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.707909,0.000000,8.305797>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<20.574000,0.000000,8.171888> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.707909,0.000000,5.918200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.231288,0.000000,5.918200>}
box{<0,0,-0.076200><5.523378,0.035000,0.076200> rotate<0,0.000000,0> translate<20.707909,0.000000,5.918200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.707909,0.000000,8.305797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.606000,0.000000,8.305797>}
box{<0,0,-0.076200><1.898091,0.035000,0.076200> rotate<0,0.000000,0> translate<20.707909,0.000000,8.305797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.836616,0.000000,17.942997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.849016,0.000000,17.930597>}
box{<0,0,-0.076200><0.017536,0.035000,0.076200> rotate<0,44.997030,0> translate<20.836616,0.000000,17.942997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.836616,0.000000,21.681000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.849016,0.000000,21.693400>}
box{<0,0,-0.076200><0.017536,0.035000,0.076200> rotate<0,-44.997030,0> translate<20.836616,0.000000,21.681000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.849016,0.000000,17.930597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.198488,0.000000,17.930597>}
box{<0,0,-0.076200><0.349472,0.035000,0.076200> rotate<0,0.000000,0> translate<20.849016,0.000000,17.930597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.849016,0.000000,21.693400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.198488,0.000000,21.693400>}
box{<0,0,-0.076200><0.349472,0.035000,0.076200> rotate<0,0.000000,0> translate<20.849016,0.000000,21.693400> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.064409,0.000000,17.193400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.198488,0.000000,17.193400>}
box{<0,0,-0.076200><0.134078,0.035000,0.076200> rotate<0,0.000000,0> translate<21.064409,0.000000,17.193400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.064409,0.000000,17.193400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.144816,0.000000,15.112997>}
box{<0,0,-0.076200><2.942137,0.035000,0.076200> rotate<0,44.996987,0> translate<21.064409,0.000000,17.193400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.089809,0.000000,22.430597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.198488,0.000000,22.430597>}
box{<0,0,-0.076200><0.108678,0.035000,0.076200> rotate<0,0.000000,0> translate<21.089809,0.000000,22.430597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.089809,0.000000,22.430597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.646216,0.000000,22.987000>}
box{<0,0,-0.076200><0.786875,0.035000,0.076200> rotate<0,-44.996869,0> translate<21.089809,0.000000,22.430597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.189013,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.920200,0.000000,17.068800>}
box{<0,0,-0.076200><0.731188,0.035000,0.076200> rotate<0,0.000000,0> translate<21.189013,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.198488,0.000000,17.193400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.332397,0.000000,17.327309>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<21.198488,0.000000,17.193400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.198488,0.000000,17.930597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.332397,0.000000,17.796688>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<21.198488,0.000000,17.930597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.198488,0.000000,21.693400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.332397,0.000000,21.827309>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<21.198488,0.000000,21.693400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.198488,0.000000,22.430597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.332397,0.000000,22.296688>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<21.198488,0.000000,22.430597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.214413,0.000000,22.555200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,22.555200>}
box{<0,0,-0.076200><6.395387,0.035000,0.076200> rotate<0,0.000000,0> translate<21.214413,0.000000,22.555200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.226284,0.000000,22.402800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,22.402800>}
box{<0,0,-0.076200><6.383516,0.035000,0.076200> rotate<0,0.000000,0> translate<21.226284,0.000000,22.402800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.226288,0.000000,17.221200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.920200,0.000000,17.221200>}
box{<0,0,-0.076200><0.693912,0.035000,0.076200> rotate<0,0.000000,0> translate<21.226288,0.000000,17.221200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.298284,0.000000,17.830800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.851200,0.000000,17.830800>}
box{<0,0,-0.076200><0.552916,0.035000,0.076200> rotate<0,0.000000,0> translate<21.298284,0.000000,17.830800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.298288,0.000000,21.793200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,21.793200>}
box{<0,0,-0.076200><6.311512,0.035000,0.076200> rotate<0,0.000000,0> translate<21.298288,0.000000,21.793200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.332397,0.000000,17.327309>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.332397,0.000000,17.796688>}
box{<0,0,-0.076200><0.469378,0.035000,0.076200> rotate<0,90.000000,0> translate<21.332397,0.000000,17.796688> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.332397,0.000000,17.373600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.996400,0.000000,17.373600>}
box{<0,0,-0.076200><0.664003,0.035000,0.076200> rotate<0,0.000000,0> translate<21.332397,0.000000,17.373600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.332397,0.000000,17.526000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.996400,0.000000,17.526000>}
box{<0,0,-0.076200><0.664003,0.035000,0.076200> rotate<0,0.000000,0> translate<21.332397,0.000000,17.526000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.332397,0.000000,17.678400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.996400,0.000000,17.678400>}
box{<0,0,-0.076200><0.664003,0.035000,0.076200> rotate<0,0.000000,0> translate<21.332397,0.000000,17.678400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.332397,0.000000,21.827309>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.332397,0.000000,22.296688>}
box{<0,0,-0.076200><0.469378,0.035000,0.076200> rotate<0,90.000000,0> translate<21.332397,0.000000,22.296688> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.332397,0.000000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,21.945600>}
box{<0,0,-0.076200><6.277403,0.035000,0.076200> rotate<0,0.000000,0> translate<21.332397,0.000000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.332397,0.000000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,22.098000>}
box{<0,0,-0.076200><6.277403,0.035000,0.076200> rotate<0,0.000000,0> translate<21.332397,0.000000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.332397,0.000000,22.250400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,22.250400>}
box{<0,0,-0.076200><6.277403,0.035000,0.076200> rotate<0,0.000000,0> translate<21.332397,0.000000,22.250400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.341413,0.000000,16.916400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.920200,0.000000,16.916400>}
box{<0,0,-0.076200><0.578788,0.035000,0.076200> rotate<0,0.000000,0> translate<21.341413,0.000000,16.916400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.366813,0.000000,22.707600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,22.707600>}
box{<0,0,-0.076200><6.242987,0.035000,0.076200> rotate<0,0.000000,0> translate<21.366813,0.000000,22.707600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.413256,-1.535000,14.833600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.666197,-1.535000,15.086541>}
box{<0,0,-0.076200><0.357712,0.035000,0.076200> rotate<0,-44.997030,0> translate<21.413256,-1.535000,14.833600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.493813,0.000000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.061019,0.000000,16.764000>}
box{<0,0,-0.076200><0.567206,0.035000,0.076200> rotate<0,0.000000,0> translate<21.493813,0.000000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.514856,-1.535000,14.935200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,14.935200>}
box{<0,0,-0.076200><6.094944,0.035000,0.076200> rotate<0,0.000000,0> translate<21.514856,-1.535000,14.935200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.519213,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,22.860000>}
box{<0,0,-0.076200><6.090587,0.035000,0.076200> rotate<0,0.000000,0> translate<21.519213,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.564581,0.000000,18.181000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.640800,0.000000,18.104781>}
box{<0,0,-0.076200><0.107790,0.035000,0.076200> rotate<0,44.997030,0> translate<21.564581,0.000000,18.181000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.640800,0.000000,18.104781>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.851200,0.000000,17.894381>}
box{<0,0,-0.076200><0.297551,0.035000,0.076200> rotate<0,44.997030,0> translate<21.640800,0.000000,18.104781> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.646213,0.000000,16.611600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.321181,0.000000,16.611600>}
box{<0,0,-0.076200><0.674969,0.035000,0.076200> rotate<0,0.000000,0> translate<21.646213,0.000000,16.611600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.646216,0.000000,22.987000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.100616,0.000000,22.987000>}
box{<0,0,-0.076200><3.454400,0.035000,0.076200> rotate<0,0.000000,0> translate<21.646216,0.000000,22.987000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.666197,-1.535000,15.086541>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.809197,-1.535000,16.229541>}
box{<0,0,-0.076200><1.616446,0.035000,0.076200> rotate<0,-44.997030,0> translate<21.666197,-1.535000,15.086541> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.667256,-1.535000,15.087600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,15.087600>}
box{<0,0,-0.076200><5.942544,0.035000,0.076200> rotate<0,0.000000,0> translate<21.667256,-1.535000,15.087600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.798613,0.000000,16.459200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.473581,0.000000,16.459200>}
box{<0,0,-0.076200><0.674969,0.035000,0.076200> rotate<0,0.000000,0> translate<21.798613,0.000000,16.459200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.819656,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,15.240000>}
box{<0,0,-0.076200><5.790144,0.035000,0.076200> rotate<0,0.000000,0> translate<21.819656,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.851200,0.000000,17.828309>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.985109,0.000000,17.694400>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<21.851200,0.000000,17.828309> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.851200,0.000000,17.894381>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.851200,0.000000,17.828309>}
box{<0,0,-0.076200><0.066072,0.035000,0.076200> rotate<0,-90.000000,0> translate<21.851200,0.000000,17.828309> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.860416,0.000000,19.681000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.490016,0.000000,20.310600>}
box{<0,0,-0.076200><0.890389,0.035000,0.076200> rotate<0,-44.997030,0> translate<21.860416,0.000000,19.681000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.880216,0.000000,18.942997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.978362,0.000000,18.844847>}
box{<0,0,-0.076200><0.138803,0.035000,0.076200> rotate<0,44.997942,0> translate<21.880216,0.000000,18.942997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.920200,-1.535000,16.904819>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.945600,-1.535000,16.879419>}
box{<0,0,-0.076200><0.035921,0.035000,0.076200> rotate<0,44.997030,0> translate<21.920200,-1.535000,16.904819> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.920200,0.000000,16.904819>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.188019,0.000000,16.637000>}
box{<0,0,-0.076200><0.378753,0.035000,0.076200> rotate<0,44.997030,0> translate<21.920200,0.000000,16.904819> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.920200,0.000000,17.283578>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.920200,0.000000,16.904819>}
box{<0,0,-0.076200><0.378759,0.035000,0.076200> rotate<0,-90.000000,0> translate<21.920200,0.000000,16.904819> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.920200,-1.535000,17.283578>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.920200,-1.535000,16.904819>}
box{<0,0,-0.076200><0.378759,0.035000,0.076200> rotate<0,-90.000000,0> translate<21.920200,-1.535000,16.904819> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.920200,0.000000,17.283578>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.996400,0.000000,17.359775>}
box{<0,0,-0.076200><0.107761,0.035000,0.076200> rotate<0,-44.995855,0> translate<21.920200,0.000000,17.283578> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.920200,-1.535000,17.283578>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.188019,-1.535000,17.551397>}
box{<0,0,-0.076200><0.378753,0.035000,0.076200> rotate<0,-44.997030,0> translate<21.920200,-1.535000,17.283578> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.925612,0.000000,18.897600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.333200,0.000000,18.897600>}
box{<0,0,-0.076200><2.407588,0.035000,0.076200> rotate<0,0.000000,0> translate<21.925612,0.000000,18.897600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.945600,-1.535000,16.879419>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.945600,-1.535000,16.587256>}
box{<0,0,-0.076200><0.292162,0.035000,0.076200> rotate<0,-90.000000,0> translate<21.945600,-1.535000,16.587256> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.951013,0.000000,16.306800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.625981,0.000000,16.306800>}
box{<0,0,-0.076200><0.674969,0.035000,0.076200> rotate<0,0.000000,0> translate<21.951013,0.000000,16.306800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.960313,0.000000,21.442997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.985109,0.000000,21.467797>}
box{<0,0,-0.076200><0.035070,0.035000,0.076200> rotate<0,-45.000640,0> translate<21.960313,0.000000,21.442997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.972056,-1.535000,15.392400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,15.392400>}
box{<0,0,-0.076200><5.637744,0.035000,0.076200> rotate<0,0.000000,0> translate<21.972056,-1.535000,15.392400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.978362,0.000000,18.844847>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.985109,0.000000,18.851597>}
box{<0,0,-0.076200><0.009544,0.035000,0.076200> rotate<0,-45.010295,0> translate<21.978362,0.000000,18.844847> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.985109,0.000000,17.694400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.996400,0.000000,17.694400>}
box{<0,0,-0.076200><0.011291,0.035000,0.076200> rotate<0,0.000000,0> translate<21.985109,0.000000,17.694400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.985109,0.000000,18.851597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.074488,0.000000,18.851597>}
box{<0,0,-0.076200><1.089378,0.035000,0.076200> rotate<0,0.000000,0> translate<21.985109,0.000000,18.851597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.985109,0.000000,21.467797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.074488,0.000000,21.467797>}
box{<0,0,-0.076200><1.089378,0.035000,0.076200> rotate<0,0.000000,0> translate<21.985109,0.000000,21.467797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.991416,0.000000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.045000,0.000000,19.812000>}
box{<0,0,-0.076200><1.053584,0.035000,0.076200> rotate<0,0.000000,0> translate<21.991416,0.000000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.996400,0.000000,17.694400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.996400,0.000000,17.359775>}
box{<0,0,-0.076200><0.334625,0.035000,0.076200> rotate<0,-90.000000,0> translate<21.996400,0.000000,17.359775> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.103413,0.000000,16.154400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.778381,0.000000,16.154400>}
box{<0,0,-0.076200><0.674969,0.035000,0.076200> rotate<0,0.000000,0> translate<22.103413,0.000000,16.154400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.124456,-1.535000,15.544800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,15.544800>}
box{<0,0,-0.076200><5.485344,0.035000,0.076200> rotate<0,0.000000,0> translate<22.124456,-1.535000,15.544800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.143816,0.000000,19.964400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.045000,0.000000,19.964400>}
box{<0,0,-0.076200><0.901184,0.035000,0.076200> rotate<0,0.000000,0> translate<22.143816,0.000000,19.964400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.188019,0.000000,16.637000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.295781,0.000000,16.637000>}
box{<0,0,-0.076200><0.107762,0.035000,0.076200> rotate<0,0.000000,0> translate<22.188019,0.000000,16.637000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.188019,-1.535000,17.551397>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.566778,-1.535000,17.551397>}
box{<0,0,-0.076200><0.378759,0.035000,0.076200> rotate<0,0.000000,0> translate<22.188019,-1.535000,17.551397> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.255813,0.000000,16.002000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,16.002000>}
box{<0,0,-0.076200><5.353987,0.035000,0.076200> rotate<0,0.000000,0> translate<22.255813,0.000000,16.002000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.276856,-1.535000,15.697200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,15.697200>}
box{<0,0,-0.076200><5.332944,0.035000,0.076200> rotate<0,0.000000,0> translate<22.276856,-1.535000,15.697200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.295781,0.000000,16.637000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.555200,0.000000,16.377581>}
box{<0,0,-0.076200><0.366874,0.035000,0.076200> rotate<0,44.997030,0> translate<22.295781,0.000000,16.637000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.296216,0.000000,20.116800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.144113,0.000000,20.116800>}
box{<0,0,-0.076200><0.847897,0.035000,0.076200> rotate<0,0.000000,0> translate<22.296216,0.000000,20.116800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.408213,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,15.849600>}
box{<0,0,-0.076200><5.201587,0.035000,0.076200> rotate<0,0.000000,0> translate<22.408213,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.429256,-1.535000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,15.849600>}
box{<0,0,-0.076200><5.180544,0.035000,0.076200> rotate<0,0.000000,0> translate<22.429256,-1.535000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.448616,0.000000,20.269200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.184784,0.000000,20.269200>}
box{<0,0,-0.076200><0.736169,0.035000,0.076200> rotate<0,0.000000,0> translate<22.448616,0.000000,20.269200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.490016,0.000000,20.310600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.074488,0.000000,20.310600>}
box{<0,0,-0.076200><0.584472,0.035000,0.076200> rotate<0,0.000000,0> translate<22.490016,0.000000,20.310600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.555200,0.000000,16.377581>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.778381,0.000000,16.154400>}
box{<0,0,-0.076200><0.315626,0.035000,0.076200> rotate<0,44.997030,0> translate<22.555200,0.000000,16.377581> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.560613,0.000000,15.697200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,15.697200>}
box{<0,0,-0.076200><5.049187,0.035000,0.076200> rotate<0,0.000000,0> translate<22.560613,0.000000,15.697200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.566778,-1.535000,17.551397>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.834597,-1.535000,17.283578>}
box{<0,0,-0.076200><0.378753,0.035000,0.076200> rotate<0,44.997030,0> translate<22.566778,-1.535000,17.551397> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.581656,-1.535000,16.002000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,16.002000>}
box{<0,0,-0.076200><5.028144,0.035000,0.076200> rotate<0,0.000000,0> translate<22.581656,-1.535000,16.002000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.592175,-1.535000,17.526000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,17.526000>}
box{<0,0,-0.076200><5.017625,0.035000,0.076200> rotate<0,0.000000,0> translate<22.592175,-1.535000,17.526000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.606000,0.000000,14.574181>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.606000,0.000000,8.305797>}
box{<0,0,-0.076200><6.268384,0.035000,0.076200> rotate<0,-90.000000,0> translate<22.606000,0.000000,8.305797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.682197,0.000000,27.558997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.682197,0.000000,28.956000>}
box{<0,0,-0.076200><1.397003,0.035000,0.076200> rotate<0,90.000000,0> translate<22.682197,0.000000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.682197,0.000000,27.558997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.193563,0.000000,27.558997>}
box{<0,0,-0.076200><3.511366,0.035000,0.076200> rotate<0,0.000000,0> translate<22.682197,0.000000,27.558997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.682197,0.000000,27.584400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,27.584400>}
box{<0,0,-0.076200><4.927603,0.035000,0.076200> rotate<0,0.000000,0> translate<22.682197,0.000000,27.584400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.682197,0.000000,27.736800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,27.736800>}
box{<0,0,-0.076200><4.927603,0.035000,0.076200> rotate<0,0.000000,0> translate<22.682197,0.000000,27.736800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.682197,0.000000,27.889200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,27.889200>}
box{<0,0,-0.076200><4.927603,0.035000,0.076200> rotate<0,0.000000,0> translate<22.682197,0.000000,27.889200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.682197,0.000000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,28.041600>}
box{<0,0,-0.076200><4.927603,0.035000,0.076200> rotate<0,0.000000,0> translate<22.682197,0.000000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.682197,0.000000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,28.194000>}
box{<0,0,-0.076200><4.927603,0.035000,0.076200> rotate<0,0.000000,0> translate<22.682197,0.000000,28.194000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.682197,0.000000,28.346400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,28.346400>}
box{<0,0,-0.076200><4.927603,0.035000,0.076200> rotate<0,0.000000,0> translate<22.682197,0.000000,28.346400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.682197,0.000000,28.498800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,28.498800>}
box{<0,0,-0.076200><4.927603,0.035000,0.076200> rotate<0,0.000000,0> translate<22.682197,0.000000,28.498800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.682197,0.000000,28.651200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,28.651200>}
box{<0,0,-0.076200><4.927603,0.035000,0.076200> rotate<0,0.000000,0> translate<22.682197,0.000000,28.651200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.682197,0.000000,28.803600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,28.803600>}
box{<0,0,-0.076200><4.927603,0.035000,0.076200> rotate<0,0.000000,0> translate<22.682197,0.000000,28.803600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.682197,0.000000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,28.956000>}
box{<0,0,-0.076200><4.927603,0.035000,0.076200> rotate<0,0.000000,0> translate<22.682197,0.000000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.713013,0.000000,15.544800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,15.544800>}
box{<0,0,-0.076200><4.896787,0.035000,0.076200> rotate<0,0.000000,0> translate<22.713013,0.000000,15.544800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.734056,-1.535000,16.154400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,16.154400>}
box{<0,0,-0.076200><4.875744,0.035000,0.076200> rotate<0,0.000000,0> translate<22.734056,-1.535000,16.154400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.744575,-1.535000,17.373600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,17.373600>}
box{<0,0,-0.076200><4.865225,0.035000,0.076200> rotate<0,0.000000,0> translate<22.744575,-1.535000,17.373600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.758397,0.000000,17.359775>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.758397,0.000000,17.694400>}
box{<0,0,-0.076200><0.334625,0.035000,0.076200> rotate<0,90.000000,0> translate<22.758397,0.000000,17.694400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.758397,0.000000,17.359775>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.834597,0.000000,17.283578>}
box{<0,0,-0.076200><0.107761,0.035000,0.076200> rotate<0,44.995855,0> translate<22.758397,0.000000,17.359775> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.758397,0.000000,17.373600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.276984,0.000000,17.373600>}
box{<0,0,-0.076200><1.518587,0.035000,0.076200> rotate<0,0.000000,0> translate<22.758397,0.000000,17.373600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.758397,0.000000,17.526000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.333200,0.000000,17.526000>}
box{<0,0,-0.076200><1.574803,0.035000,0.076200> rotate<0,0.000000,0> translate<22.758397,0.000000,17.526000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.758397,0.000000,17.678400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.333200,0.000000,17.678400>}
box{<0,0,-0.076200><1.574803,0.035000,0.076200> rotate<0,0.000000,0> translate<22.758397,0.000000,17.678400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.758397,0.000000,17.694400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.074488,0.000000,17.694400>}
box{<0,0,-0.076200><0.316091,0.035000,0.076200> rotate<0,0.000000,0> translate<22.758397,0.000000,17.694400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.778381,0.000000,16.154400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.135416,0.000000,16.154400>}
box{<0,0,-0.076200><1.357034,0.035000,0.076200> rotate<0,0.000000,0> translate<22.778381,0.000000,16.154400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.809197,-1.535000,16.229541>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.809197,-1.535000,16.879419>}
box{<0,0,-0.076200><0.649878,0.035000,0.076200> rotate<0,90.000000,0> translate<22.809197,-1.535000,16.879419> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.809197,-1.535000,16.306800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,16.306800>}
box{<0,0,-0.076200><4.800603,0.035000,0.076200> rotate<0,0.000000,0> translate<22.809197,-1.535000,16.306800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.809197,-1.535000,16.459200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,16.459200>}
box{<0,0,-0.076200><4.800603,0.035000,0.076200> rotate<0,0.000000,0> translate<22.809197,-1.535000,16.459200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.809197,-1.535000,16.611600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,16.611600>}
box{<0,0,-0.076200><4.800603,0.035000,0.076200> rotate<0,0.000000,0> translate<22.809197,-1.535000,16.611600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.809197,-1.535000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,16.764000>}
box{<0,0,-0.076200><4.800603,0.035000,0.076200> rotate<0,0.000000,0> translate<22.809197,-1.535000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.809197,-1.535000,16.879419>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.834597,-1.535000,16.904819>}
box{<0,0,-0.076200><0.035921,0.035000,0.076200> rotate<0,-44.997030,0> translate<22.809197,-1.535000,16.879419> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.834597,-1.535000,16.904819>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.834597,-1.535000,17.283578>}
box{<0,0,-0.076200><0.378759,0.035000,0.076200> rotate<0,90.000000,0> translate<22.834597,-1.535000,17.283578> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.834597,-1.535000,16.916400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,16.916400>}
box{<0,0,-0.076200><4.775203,0.035000,0.076200> rotate<0,0.000000,0> translate<22.834597,-1.535000,16.916400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.834597,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,17.068800>}
box{<0,0,-0.076200><4.775203,0.035000,0.076200> rotate<0,0.000000,0> translate<22.834597,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.834597,0.000000,17.175816>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.834597,0.000000,17.283578>}
box{<0,0,-0.076200><0.107762,0.035000,0.076200> rotate<0,90.000000,0> translate<22.834597,0.000000,17.283578> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.834597,0.000000,17.175816>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.094016,0.000000,16.916397>}
box{<0,0,-0.076200><0.366874,0.035000,0.076200> rotate<0,44.997030,0> translate<22.834597,0.000000,17.175816> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.834597,0.000000,17.221200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.124584,0.000000,17.221200>}
box{<0,0,-0.076200><1.289987,0.035000,0.076200> rotate<0,0.000000,0> translate<22.834597,0.000000,17.221200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.834597,-1.535000,17.221200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,17.221200>}
box{<0,0,-0.076200><4.775203,0.035000,0.076200> rotate<0,0.000000,0> translate<22.834597,-1.535000,17.221200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.865413,0.000000,15.392400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,15.392400>}
box{<0,0,-0.076200><4.744387,0.035000,0.076200> rotate<0,0.000000,0> translate<22.865413,0.000000,15.392400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.941613,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.972184,0.000000,17.068800>}
box{<0,0,-0.076200><1.030572,0.035000,0.076200> rotate<0,0.000000,0> translate<22.941613,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.017813,0.000000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,15.240000>}
box{<0,0,-0.076200><4.591987,0.035000,0.076200> rotate<0,0.000000,0> translate<23.017813,0.000000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.045000,0.000000,19.128309>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.178909,0.000000,18.994400>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<23.045000,0.000000,19.128309> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.045000,0.000000,20.017688>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.045000,0.000000,19.128309>}
box{<0,0,-0.076200><0.889378,0.035000,0.076200> rotate<0,-90.000000,0> translate<23.045000,0.000000,19.128309> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.045000,0.000000,20.017688>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.178909,0.000000,20.151597>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<23.045000,0.000000,20.017688> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.074488,0.000000,17.694400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.208397,0.000000,17.828309>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<23.074488,0.000000,17.694400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.074488,0.000000,18.851597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.208397,0.000000,18.717688>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<23.074488,0.000000,18.851597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.074488,0.000000,20.310600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.108934,0.000000,20.345050>}
box{<0,0,-0.076200><0.048717,0.035000,0.076200> rotate<0,-44.999629,0> translate<23.074488,0.000000,20.310600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.074488,0.000000,21.467797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.208397,0.000000,21.333887>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<23.074488,0.000000,21.467797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.094013,0.000000,16.916400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.819784,0.000000,16.916400>}
box{<0,0,-0.076200><0.725772,0.035000,0.076200> rotate<0,0.000000,0> translate<23.094013,0.000000,16.916400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.094016,0.000000,16.916397>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.819781,0.000000,16.916397>}
box{<0,0,-0.076200><0.725766,0.035000,0.076200> rotate<0,0.000000,0> translate<23.094016,0.000000,16.916397> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.108934,0.000000,20.345050>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.302388,0.000000,20.151597>}
box{<0,0,-0.076200><0.273584,0.035000,0.076200> rotate<0,44.997030,0> translate<23.108934,0.000000,20.345050> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.144816,0.000000,15.112997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.367997,0.000000,14.889816>}
box{<0,0,-0.076200><0.315626,0.035000,0.076200> rotate<0,44.997030,0> translate<23.144816,0.000000,15.112997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.170213,0.000000,15.087600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,15.087600>}
box{<0,0,-0.076200><4.439587,0.035000,0.076200> rotate<0,0.000000,0> translate<23.170213,0.000000,15.087600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.178909,0.000000,18.994400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.268287,0.000000,18.994400>}
box{<0,0,-0.076200><1.089378,0.035000,0.076200> rotate<0,0.000000,0> translate<23.178909,0.000000,18.994400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.178909,0.000000,20.151597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.302388,0.000000,20.151597>}
box{<0,0,-0.076200><0.123478,0.035000,0.076200> rotate<0,0.000000,0> translate<23.178909,0.000000,20.151597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.180884,0.000000,18.745200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.333200,0.000000,18.745200>}
box{<0,0,-0.076200><1.152316,0.035000,0.076200> rotate<0,0.000000,0> translate<23.180884,0.000000,18.745200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.206284,0.000000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,21.336000>}
box{<0,0,-0.076200><4.403516,0.035000,0.076200> rotate<0,0.000000,0> translate<23.206284,0.000000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.208397,0.000000,17.828309>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.208397,0.000000,18.717688>}
box{<0,0,-0.076200><0.889378,0.035000,0.076200> rotate<0,90.000000,0> translate<23.208397,0.000000,18.717688> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.208397,0.000000,21.259797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.208397,0.000000,21.333887>}
box{<0,0,-0.076200><0.074091,0.035000,0.076200> rotate<0,90.000000,0> translate<23.208397,0.000000,21.333887> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.208397,0.000000,21.259797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.271816,0.000000,21.259797>}
box{<0,0,-0.076200><0.063419,0.035000,0.076200> rotate<0,0.000000,0> translate<23.208397,0.000000,21.259797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.271816,0.000000,21.259797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.494997,0.000000,21.036616>}
box{<0,0,-0.076200><0.315626,0.035000,0.076200> rotate<0,44.997030,0> translate<23.271816,0.000000,21.259797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.322613,0.000000,14.935200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,14.935200>}
box{<0,0,-0.076200><4.287187,0.035000,0.076200> rotate<0,0.000000,0> translate<23.322613,0.000000,14.935200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.348012,0.000000,21.183600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,21.183600>}
box{<0,0,-0.076200><4.261788,0.035000,0.076200> rotate<0,0.000000,0> translate<23.348012,0.000000,21.183600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.367997,0.000000,8.305797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.367997,0.000000,14.889816>}
box{<0,0,-0.076200><6.584019,0.035000,0.076200> rotate<0,90.000000,0> translate<23.367997,0.000000,14.889816> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.367997,0.000000,8.305797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.231288,0.000000,8.305797>}
box{<0,0,-0.076200><2.863291,0.035000,0.076200> rotate<0,0.000000,0> translate<23.367997,0.000000,8.305797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.367997,0.000000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,8.382000>}
box{<0,0,-0.076200><4.241803,0.035000,0.076200> rotate<0,0.000000,0> translate<23.367997,0.000000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.367997,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,8.534400>}
box{<0,0,-0.076200><4.241803,0.035000,0.076200> rotate<0,0.000000,0> translate<23.367997,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.367997,0.000000,8.686800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,8.686800>}
box{<0,0,-0.076200><4.241803,0.035000,0.076200> rotate<0,0.000000,0> translate<23.367997,0.000000,8.686800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.367997,0.000000,8.839200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,8.839200>}
box{<0,0,-0.076200><4.241803,0.035000,0.076200> rotate<0,0.000000,0> translate<23.367997,0.000000,8.839200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.367997,0.000000,8.991600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,8.991600>}
box{<0,0,-0.076200><4.241803,0.035000,0.076200> rotate<0,0.000000,0> translate<23.367997,0.000000,8.991600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.367997,0.000000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,9.144000>}
box{<0,0,-0.076200><4.241803,0.035000,0.076200> rotate<0,0.000000,0> translate<23.367997,0.000000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.367997,0.000000,9.296400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,9.296400>}
box{<0,0,-0.076200><4.241803,0.035000,0.076200> rotate<0,0.000000,0> translate<23.367997,0.000000,9.296400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.367997,0.000000,9.448800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,9.448800>}
box{<0,0,-0.076200><4.241803,0.035000,0.076200> rotate<0,0.000000,0> translate<23.367997,0.000000,9.448800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.367997,0.000000,9.601200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,9.601200>}
box{<0,0,-0.076200><4.241803,0.035000,0.076200> rotate<0,0.000000,0> translate<23.367997,0.000000,9.601200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.367997,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,9.753600>}
box{<0,0,-0.076200><4.241803,0.035000,0.076200> rotate<0,0.000000,0> translate<23.367997,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.367997,0.000000,9.906000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,9.906000>}
box{<0,0,-0.076200><4.241803,0.035000,0.076200> rotate<0,0.000000,0> translate<23.367997,0.000000,9.906000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.367997,0.000000,10.058400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,10.058400>}
box{<0,0,-0.076200><4.241803,0.035000,0.076200> rotate<0,0.000000,0> translate<23.367997,0.000000,10.058400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.367997,0.000000,10.210800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,10.210800>}
box{<0,0,-0.076200><4.241803,0.035000,0.076200> rotate<0,0.000000,0> translate<23.367997,0.000000,10.210800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.367997,0.000000,10.363200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,10.363200>}
box{<0,0,-0.076200><4.241803,0.035000,0.076200> rotate<0,0.000000,0> translate<23.367997,0.000000,10.363200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.367997,0.000000,10.515600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,10.515600>}
box{<0,0,-0.076200><4.241803,0.035000,0.076200> rotate<0,0.000000,0> translate<23.367997,0.000000,10.515600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.367997,0.000000,10.668000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,10.668000>}
box{<0,0,-0.076200><4.241803,0.035000,0.076200> rotate<0,0.000000,0> translate<23.367997,0.000000,10.668000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.367997,0.000000,10.820400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,10.820400>}
box{<0,0,-0.076200><4.241803,0.035000,0.076200> rotate<0,0.000000,0> translate<23.367997,0.000000,10.820400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.367997,0.000000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,10.972800>}
box{<0,0,-0.076200><4.241803,0.035000,0.076200> rotate<0,0.000000,0> translate<23.367997,0.000000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.367997,0.000000,11.125200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,11.125200>}
box{<0,0,-0.076200><4.241803,0.035000,0.076200> rotate<0,0.000000,0> translate<23.367997,0.000000,11.125200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.367997,0.000000,11.277600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,11.277600>}
box{<0,0,-0.076200><4.241803,0.035000,0.076200> rotate<0,0.000000,0> translate<23.367997,0.000000,11.277600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.367997,0.000000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,11.430000>}
box{<0,0,-0.076200><4.241803,0.035000,0.076200> rotate<0,0.000000,0> translate<23.367997,0.000000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.367997,0.000000,11.582400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,11.582400>}
box{<0,0,-0.076200><4.241803,0.035000,0.076200> rotate<0,0.000000,0> translate<23.367997,0.000000,11.582400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.367997,0.000000,11.734800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,11.734800>}
box{<0,0,-0.076200><4.241803,0.035000,0.076200> rotate<0,0.000000,0> translate<23.367997,0.000000,11.734800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.367997,0.000000,11.887200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,11.887200>}
box{<0,0,-0.076200><4.241803,0.035000,0.076200> rotate<0,0.000000,0> translate<23.367997,0.000000,11.887200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.367997,0.000000,12.039600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,12.039600>}
box{<0,0,-0.076200><4.241803,0.035000,0.076200> rotate<0,0.000000,0> translate<23.367997,0.000000,12.039600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.367997,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,12.192000>}
box{<0,0,-0.076200><4.241803,0.035000,0.076200> rotate<0,0.000000,0> translate<23.367997,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.367997,0.000000,12.344400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,12.344400>}
box{<0,0,-0.076200><4.241803,0.035000,0.076200> rotate<0,0.000000,0> translate<23.367997,0.000000,12.344400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.367997,0.000000,12.496800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,12.496800>}
box{<0,0,-0.076200><4.241803,0.035000,0.076200> rotate<0,0.000000,0> translate<23.367997,0.000000,12.496800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.367997,0.000000,12.649200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,12.649200>}
box{<0,0,-0.076200><4.241803,0.035000,0.076200> rotate<0,0.000000,0> translate<23.367997,0.000000,12.649200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.367997,0.000000,12.801600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,12.801600>}
box{<0,0,-0.076200><4.241803,0.035000,0.076200> rotate<0,0.000000,0> translate<23.367997,0.000000,12.801600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.367997,0.000000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,12.954000>}
box{<0,0,-0.076200><4.241803,0.035000,0.076200> rotate<0,0.000000,0> translate<23.367997,0.000000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.367997,0.000000,13.106400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,13.106400>}
box{<0,0,-0.076200><4.241803,0.035000,0.076200> rotate<0,0.000000,0> translate<23.367997,0.000000,13.106400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.367997,0.000000,13.258800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,13.258800>}
box{<0,0,-0.076200><4.241803,0.035000,0.076200> rotate<0,0.000000,0> translate<23.367997,0.000000,13.258800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.367997,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,13.411200>}
box{<0,0,-0.076200><4.241803,0.035000,0.076200> rotate<0,0.000000,0> translate<23.367997,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.367997,0.000000,13.563600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,13.563600>}
box{<0,0,-0.076200><4.241803,0.035000,0.076200> rotate<0,0.000000,0> translate<23.367997,0.000000,13.563600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.367997,0.000000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,13.716000>}
box{<0,0,-0.076200><4.241803,0.035000,0.076200> rotate<0,0.000000,0> translate<23.367997,0.000000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.367997,0.000000,13.868400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,13.868400>}
box{<0,0,-0.076200><4.241803,0.035000,0.076200> rotate<0,0.000000,0> translate<23.367997,0.000000,13.868400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.367997,0.000000,14.020800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,14.020800>}
box{<0,0,-0.076200><4.241803,0.035000,0.076200> rotate<0,0.000000,0> translate<23.367997,0.000000,14.020800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.367997,0.000000,14.173200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,14.173200>}
box{<0,0,-0.076200><4.241803,0.035000,0.076200> rotate<0,0.000000,0> translate<23.367997,0.000000,14.173200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.367997,0.000000,14.325600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,14.325600>}
box{<0,0,-0.076200><4.241803,0.035000,0.076200> rotate<0,0.000000,0> translate<23.367997,0.000000,14.325600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.367997,0.000000,14.478000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,14.478000>}
box{<0,0,-0.076200><4.241803,0.035000,0.076200> rotate<0,0.000000,0> translate<23.367997,0.000000,14.478000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.367997,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,14.630400>}
box{<0,0,-0.076200><4.241803,0.035000,0.076200> rotate<0,0.000000,0> translate<23.367997,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.367997,0.000000,14.782800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,14.782800>}
box{<0,0,-0.076200><4.241803,0.035000,0.076200> rotate<0,0.000000,0> translate<23.367997,0.000000,14.782800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.494997,0.000000,21.036616>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.104597,0.000000,20.427016>}
box{<0,0,-0.076200><0.862105,0.035000,0.076200> rotate<0,44.997030,0> translate<23.494997,0.000000,21.036616> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.500412,0.000000,21.031200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,21.031200>}
box{<0,0,-0.076200><4.109388,0.035000,0.076200> rotate<0,0.000000,0> translate<23.500412,0.000000,21.031200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.652812,0.000000,20.878800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,20.878800>}
box{<0,0,-0.076200><3.956988,0.035000,0.076200> rotate<0,0.000000,0> translate<23.652812,0.000000,20.878800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.805212,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,20.726400>}
box{<0,0,-0.076200><3.804588,0.035000,0.076200> rotate<0,0.000000,0> translate<23.805212,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.819781,0.000000,16.916397>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.333200,0.000000,17.429816>}
box{<0,0,-0.076200><0.726084,0.035000,0.076200> rotate<0,-44.997030,0> translate<23.819781,0.000000,16.916397> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.907563,-1.535000,29.006800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.952197,-1.535000,29.051434>}
box{<0,0,-0.076200><0.063123,0.035000,0.076200> rotate<0,-44.997030,0> translate<23.907563,-1.535000,29.006800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.952197,-1.535000,29.051434>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.952197,-1.535000,30.683200>}
box{<0,0,-0.076200><1.631766,0.035000,0.076200> rotate<0,90.000000,0> translate<23.952197,-1.535000,30.683200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.952197,-1.535000,29.108400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,29.108400>}
box{<0,0,-0.076200><3.657603,0.035000,0.076200> rotate<0,0.000000,0> translate<23.952197,-1.535000,29.108400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.952197,-1.535000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,29.260800>}
box{<0,0,-0.076200><3.657603,0.035000,0.076200> rotate<0,0.000000,0> translate<23.952197,-1.535000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.952197,-1.535000,29.413200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,29.413200>}
box{<0,0,-0.076200><3.657603,0.035000,0.076200> rotate<0,0.000000,0> translate<23.952197,-1.535000,29.413200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.952197,-1.535000,29.565600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,29.565600>}
box{<0,0,-0.076200><3.657603,0.035000,0.076200> rotate<0,0.000000,0> translate<23.952197,-1.535000,29.565600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.952197,-1.535000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,29.718000>}
box{<0,0,-0.076200><3.657603,0.035000,0.076200> rotate<0,0.000000,0> translate<23.952197,-1.535000,29.718000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.952197,-1.535000,29.870400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,29.870400>}
box{<0,0,-0.076200><3.657603,0.035000,0.076200> rotate<0,0.000000,0> translate<23.952197,-1.535000,29.870400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.952197,-1.535000,30.022800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,30.022800>}
box{<0,0,-0.076200><3.657603,0.035000,0.076200> rotate<0,0.000000,0> translate<23.952197,-1.535000,30.022800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.952197,-1.535000,30.175200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,30.175200>}
box{<0,0,-0.076200><3.657603,0.035000,0.076200> rotate<0,0.000000,0> translate<23.952197,-1.535000,30.175200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.952197,-1.535000,30.327600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,30.327600>}
box{<0,0,-0.076200><3.657603,0.035000,0.076200> rotate<0,0.000000,0> translate<23.952197,-1.535000,30.327600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.952197,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,30.480000>}
box{<0,0,-0.076200><3.657603,0.035000,0.076200> rotate<0,0.000000,0> translate<23.952197,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.952197,-1.535000,30.632400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,30.632400>}
box{<0,0,-0.076200><3.657603,0.035000,0.076200> rotate<0,0.000000,0> translate<23.952197,-1.535000,30.632400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.952197,-1.535000,30.683200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,30.683200>}
box{<0,0,-0.076200><3.657603,0.035000,0.076200> rotate<0,0.000000,0> translate<23.952197,-1.535000,30.683200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.957612,0.000000,20.574000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,20.574000>}
box{<0,0,-0.076200><3.652188,0.035000,0.076200> rotate<0,0.000000,0> translate<23.957612,0.000000,20.574000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.104597,0.000000,20.151597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.104597,0.000000,20.427016>}
box{<0,0,-0.076200><0.275419,0.035000,0.076200> rotate<0,90.000000,0> translate<24.104597,0.000000,20.427016> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.104597,0.000000,20.151597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.268287,0.000000,20.151597>}
box{<0,0,-0.076200><0.163691,0.035000,0.076200> rotate<0,0.000000,0> translate<24.104597,0.000000,20.151597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.104597,0.000000,20.269200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,20.269200>}
box{<0,0,-0.076200><3.505203,0.035000,0.076200> rotate<0,0.000000,0> translate<24.104597,0.000000,20.269200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.104597,0.000000,20.421600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,20.421600>}
box{<0,0,-0.076200><3.505203,0.035000,0.076200> rotate<0,0.000000,0> translate<24.104597,0.000000,20.421600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.135416,0.000000,16.154400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.872016,0.000000,16.891000>}
box{<0,0,-0.076200><1.041710,0.035000,0.076200> rotate<0,-44.997030,0> translate<24.135416,0.000000,16.154400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.135416,0.000000,16.154400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,16.154400>}
box{<0,0,-0.076200><3.474384,0.035000,0.076200> rotate<0,0.000000,0> translate<24.135416,0.000000,16.154400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.268287,0.000000,18.994400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.275034,0.000000,19.001150>}
box{<0,0,-0.076200><0.009544,0.035000,0.076200> rotate<0,-45.010295,0> translate<24.268287,0.000000,18.994400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.268287,0.000000,20.151597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.402197,0.000000,20.017688>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<24.268287,0.000000,20.151597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.275034,0.000000,19.001150>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.333200,0.000000,18.942981>}
box{<0,0,-0.076200><0.082261,0.035000,0.076200> rotate<0,44.998569,0> translate<24.275034,0.000000,19.001150> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.287816,0.000000,16.306800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,16.306800>}
box{<0,0,-0.076200><3.321984,0.035000,0.076200> rotate<0,0.000000,0> translate<24.287816,0.000000,16.306800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.303084,0.000000,20.116800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,20.116800>}
box{<0,0,-0.076200><3.306716,0.035000,0.076200> rotate<0,0.000000,0> translate<24.303084,0.000000,20.116800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.333200,0.000000,18.942981>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.333200,0.000000,17.429816>}
box{<0,0,-0.076200><1.513166,0.035000,0.076200> rotate<0,-90.000000,0> translate<24.333200,0.000000,17.429816> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.402197,0.000000,19.951616>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.402197,0.000000,20.017688>}
box{<0,0,-0.076200><0.066072,0.035000,0.076200> rotate<0,90.000000,0> translate<24.402197,0.000000,20.017688> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.402197,0.000000,19.951616>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.095197,0.000000,19.258616>}
box{<0,0,-0.076200><0.980050,0.035000,0.076200> rotate<0,44.997030,0> translate<24.402197,0.000000,19.951616> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.402197,0.000000,19.964400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,19.964400>}
box{<0,0,-0.076200><3.207603,0.035000,0.076200> rotate<0,0.000000,0> translate<24.402197,0.000000,19.964400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.440216,0.000000,16.459200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,16.459200>}
box{<0,0,-0.076200><3.169584,0.035000,0.076200> rotate<0,0.000000,0> translate<24.440216,0.000000,16.459200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.541813,0.000000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,19.812000>}
box{<0,0,-0.076200><3.067987,0.035000,0.076200> rotate<0,0.000000,0> translate<24.541813,0.000000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.592616,0.000000,16.611600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,16.611600>}
box{<0,0,-0.076200><3.017184,0.035000,0.076200> rotate<0,0.000000,0> translate<24.592616,0.000000,16.611600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.694213,0.000000,19.659600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,19.659600>}
box{<0,0,-0.076200><2.915587,0.035000,0.076200> rotate<0,0.000000,0> translate<24.694213,0.000000,19.659600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.745016,0.000000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,16.764000>}
box{<0,0,-0.076200><2.864784,0.035000,0.076200> rotate<0,0.000000,0> translate<24.745016,0.000000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.846613,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,19.507200>}
box{<0,0,-0.076200><2.763187,0.035000,0.076200> rotate<0,0.000000,0> translate<24.846613,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.872016,0.000000,16.891000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.095197,0.000000,17.114181>}
box{<0,0,-0.076200><0.315626,0.035000,0.076200> rotate<0,-44.997030,0> translate<24.872016,0.000000,16.891000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.897416,0.000000,16.916400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,16.916400>}
box{<0,0,-0.076200><2.712384,0.035000,0.076200> rotate<0,0.000000,0> translate<24.897416,0.000000,16.916400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.999013,0.000000,19.354800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,19.354800>}
box{<0,0,-0.076200><2.610787,0.035000,0.076200> rotate<0,0.000000,0> translate<24.999013,0.000000,19.354800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.049816,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,17.068800>}
box{<0,0,-0.076200><2.559984,0.035000,0.076200> rotate<0,0.000000,0> translate<25.049816,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.095197,0.000000,17.114181>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.095197,0.000000,19.258616>}
box{<0,0,-0.076200><2.144434,0.035000,0.076200> rotate<0,90.000000,0> translate<25.095197,0.000000,19.258616> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.095197,0.000000,17.221200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,17.221200>}
box{<0,0,-0.076200><2.514603,0.035000,0.076200> rotate<0,0.000000,0> translate<25.095197,0.000000,17.221200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.095197,0.000000,17.373600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,17.373600>}
box{<0,0,-0.076200><2.514603,0.035000,0.076200> rotate<0,0.000000,0> translate<25.095197,0.000000,17.373600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.095197,0.000000,17.526000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,17.526000>}
box{<0,0,-0.076200><2.514603,0.035000,0.076200> rotate<0,0.000000,0> translate<25.095197,0.000000,17.526000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.095197,0.000000,17.678400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,17.678400>}
box{<0,0,-0.076200><2.514603,0.035000,0.076200> rotate<0,0.000000,0> translate<25.095197,0.000000,17.678400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.095197,0.000000,17.830800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,17.830800>}
box{<0,0,-0.076200><2.514603,0.035000,0.076200> rotate<0,0.000000,0> translate<25.095197,0.000000,17.830800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.095197,0.000000,17.983200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,17.983200>}
box{<0,0,-0.076200><2.514603,0.035000,0.076200> rotate<0,0.000000,0> translate<25.095197,0.000000,17.983200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.095197,0.000000,18.135600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,18.135600>}
box{<0,0,-0.076200><2.514603,0.035000,0.076200> rotate<0,0.000000,0> translate<25.095197,0.000000,18.135600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.095197,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,18.288000>}
box{<0,0,-0.076200><2.514603,0.035000,0.076200> rotate<0,0.000000,0> translate<25.095197,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.095197,0.000000,18.440400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,18.440400>}
box{<0,0,-0.076200><2.514603,0.035000,0.076200> rotate<0,0.000000,0> translate<25.095197,0.000000,18.440400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.095197,0.000000,18.592800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,18.592800>}
box{<0,0,-0.076200><2.514603,0.035000,0.076200> rotate<0,0.000000,0> translate<25.095197,0.000000,18.592800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.095197,0.000000,18.745200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,18.745200>}
box{<0,0,-0.076200><2.514603,0.035000,0.076200> rotate<0,0.000000,0> translate<25.095197,0.000000,18.745200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.095197,0.000000,18.897600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,18.897600>}
box{<0,0,-0.076200><2.514603,0.035000,0.076200> rotate<0,0.000000,0> translate<25.095197,0.000000,18.897600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.095197,0.000000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,19.050000>}
box{<0,0,-0.076200><2.514603,0.035000,0.076200> rotate<0,0.000000,0> translate<25.095197,0.000000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.095197,0.000000,19.202400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,19.202400>}
box{<0,0,-0.076200><2.514603,0.035000,0.076200> rotate<0,0.000000,0> translate<25.095197,0.000000,19.202400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.100616,0.000000,22.987000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.323797,0.000000,23.210181>}
box{<0,0,-0.076200><0.315626,0.035000,0.076200> rotate<0,-44.997030,0> translate<25.100616,0.000000,22.987000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.126016,0.000000,23.012400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,23.012400>}
box{<0,0,-0.076200><2.483784,0.035000,0.076200> rotate<0,0.000000,0> translate<25.126016,0.000000,23.012400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.278416,0.000000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,23.164800>}
box{<0,0,-0.076200><2.331384,0.035000,0.076200> rotate<0,0.000000,0> translate<25.278416,0.000000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.323797,0.000000,23.210181>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.323797,0.000000,23.210184>}
box{<0,0,-0.076200><0.000003,0.035000,0.076200> rotate<0,90.000000,0> translate<25.323797,0.000000,23.210184> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.323797,0.000000,23.210184>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.608612,0.000000,23.495000>}
box{<0,0,-0.076200><0.402790,0.035000,0.076200> rotate<0,-44.997030,0> translate<25.323797,0.000000,23.210184> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.430813,0.000000,23.317200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,23.317200>}
box{<0,0,-0.076200><2.178987,0.035000,0.076200> rotate<0,0.000000,0> translate<25.430813,0.000000,23.317200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.583213,0.000000,23.469600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,23.469600>}
box{<0,0,-0.076200><2.026587,0.035000,0.076200> rotate<0,0.000000,0> translate<25.583213,0.000000,23.469600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.608612,0.000000,23.495000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.608616,0.000000,23.495000>}
box{<0,0,-0.076200><0.000003,0.035000,0.076200> rotate<0,0.000000,0> translate<25.608612,0.000000,23.495000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.608616,0.000000,23.495000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.831797,0.000000,23.718181>}
box{<0,0,-0.076200><0.315626,0.035000,0.076200> rotate<0,-44.997030,0> translate<25.608616,0.000000,23.495000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.735616,0.000000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,23.622000>}
box{<0,0,-0.076200><1.874184,0.035000,0.076200> rotate<0,0.000000,0> translate<25.735616,0.000000,23.622000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.831797,0.000000,23.718181>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.831797,0.000000,24.003000>}
box{<0,0,-0.076200><0.284819,0.035000,0.076200> rotate<0,90.000000,0> translate<25.831797,0.000000,24.003000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.831797,0.000000,23.774400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,23.774400>}
box{<0,0,-0.076200><1.778003,0.035000,0.076200> rotate<0,0.000000,0> translate<25.831797,0.000000,23.774400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.831797,0.000000,23.926800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,23.926800>}
box{<0,0,-0.076200><1.778003,0.035000,0.076200> rotate<0,0.000000,0> translate<25.831797,0.000000,23.926800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.831797,0.000000,24.003000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.193563,0.000000,24.003000>}
box{<0,0,-0.076200><0.361766,0.035000,0.076200> rotate<0,0.000000,0> translate<25.831797,0.000000,24.003000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.193563,0.000000,24.003000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.238197,0.000000,24.047634>}
box{<0,0,-0.076200><0.063123,0.035000,0.076200> rotate<0,-44.997030,0> translate<26.193563,0.000000,24.003000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.193563,0.000000,27.558997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.238197,0.000000,27.514363>}
box{<0,0,-0.076200><0.063123,0.035000,0.076200> rotate<0,44.997030,0> translate<26.193563,0.000000,27.558997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.231288,0.000000,5.918200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.365197,0.000000,6.052109>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<26.231288,0.000000,5.918200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.231288,0.000000,8.305797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.365197,0.000000,8.171888>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<26.231288,0.000000,8.305797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.238197,0.000000,24.047634>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.238197,0.000000,27.514363>}
box{<0,0,-0.076200><3.466728,0.035000,0.076200> rotate<0,90.000000,0> translate<26.238197,0.000000,27.514363> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.238197,0.000000,24.079200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,24.079200>}
box{<0,0,-0.076200><1.371603,0.035000,0.076200> rotate<0,0.000000,0> translate<26.238197,0.000000,24.079200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.238197,0.000000,24.231600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,24.231600>}
box{<0,0,-0.076200><1.371603,0.035000,0.076200> rotate<0,0.000000,0> translate<26.238197,0.000000,24.231600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.238197,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,24.384000>}
box{<0,0,-0.076200><1.371603,0.035000,0.076200> rotate<0,0.000000,0> translate<26.238197,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.238197,0.000000,24.536400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,24.536400>}
box{<0,0,-0.076200><1.371603,0.035000,0.076200> rotate<0,0.000000,0> translate<26.238197,0.000000,24.536400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.238197,0.000000,24.688800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,24.688800>}
box{<0,0,-0.076200><1.371603,0.035000,0.076200> rotate<0,0.000000,0> translate<26.238197,0.000000,24.688800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.238197,0.000000,24.841200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,24.841200>}
box{<0,0,-0.076200><1.371603,0.035000,0.076200> rotate<0,0.000000,0> translate<26.238197,0.000000,24.841200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.238197,0.000000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,24.993600>}
box{<0,0,-0.076200><1.371603,0.035000,0.076200> rotate<0,0.000000,0> translate<26.238197,0.000000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.238197,0.000000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,25.146000>}
box{<0,0,-0.076200><1.371603,0.035000,0.076200> rotate<0,0.000000,0> translate<26.238197,0.000000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.238197,0.000000,25.298400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,25.298400>}
box{<0,0,-0.076200><1.371603,0.035000,0.076200> rotate<0,0.000000,0> translate<26.238197,0.000000,25.298400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.238197,0.000000,25.450800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,25.450800>}
box{<0,0,-0.076200><1.371603,0.035000,0.076200> rotate<0,0.000000,0> translate<26.238197,0.000000,25.450800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.238197,0.000000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,25.603200>}
box{<0,0,-0.076200><1.371603,0.035000,0.076200> rotate<0,0.000000,0> translate<26.238197,0.000000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.238197,0.000000,25.755600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,25.755600>}
box{<0,0,-0.076200><1.371603,0.035000,0.076200> rotate<0,0.000000,0> translate<26.238197,0.000000,25.755600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.238197,0.000000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,25.908000>}
box{<0,0,-0.076200><1.371603,0.035000,0.076200> rotate<0,0.000000,0> translate<26.238197,0.000000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.238197,0.000000,26.060400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,26.060400>}
box{<0,0,-0.076200><1.371603,0.035000,0.076200> rotate<0,0.000000,0> translate<26.238197,0.000000,26.060400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.238197,0.000000,26.212800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,26.212800>}
box{<0,0,-0.076200><1.371603,0.035000,0.076200> rotate<0,0.000000,0> translate<26.238197,0.000000,26.212800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.238197,0.000000,26.365200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,26.365200>}
box{<0,0,-0.076200><1.371603,0.035000,0.076200> rotate<0,0.000000,0> translate<26.238197,0.000000,26.365200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.238197,0.000000,26.517600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,26.517600>}
box{<0,0,-0.076200><1.371603,0.035000,0.076200> rotate<0,0.000000,0> translate<26.238197,0.000000,26.517600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.238197,0.000000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,26.670000>}
box{<0,0,-0.076200><1.371603,0.035000,0.076200> rotate<0,0.000000,0> translate<26.238197,0.000000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.238197,0.000000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,26.822400>}
box{<0,0,-0.076200><1.371603,0.035000,0.076200> rotate<0,0.000000,0> translate<26.238197,0.000000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.238197,0.000000,26.974800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,26.974800>}
box{<0,0,-0.076200><1.371603,0.035000,0.076200> rotate<0,0.000000,0> translate<26.238197,0.000000,26.974800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.238197,0.000000,27.127200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,27.127200>}
box{<0,0,-0.076200><1.371603,0.035000,0.076200> rotate<0,0.000000,0> translate<26.238197,0.000000,27.127200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.238197,0.000000,27.279600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,27.279600>}
box{<0,0,-0.076200><1.371603,0.035000,0.076200> rotate<0,0.000000,0> translate<26.238197,0.000000,27.279600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.238197,0.000000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,27.432000>}
box{<0,0,-0.076200><1.371603,0.035000,0.076200> rotate<0,0.000000,0> translate<26.238197,0.000000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.256688,0.000000,5.943600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,5.943600>}
box{<0,0,-0.076200><1.353112,0.035000,0.076200> rotate<0,0.000000,0> translate<26.256688,0.000000,5.943600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.307484,0.000000,8.229600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,8.229600>}
box{<0,0,-0.076200><1.302316,0.035000,0.076200> rotate<0,0.000000,0> translate<26.307484,0.000000,8.229600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.365197,0.000000,6.052109>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.365197,0.000000,8.171888>}
box{<0,0,-0.076200><2.119778,0.035000,0.076200> rotate<0,90.000000,0> translate<26.365197,0.000000,8.171888> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.365197,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,6.096000>}
box{<0,0,-0.076200><1.244603,0.035000,0.076200> rotate<0,0.000000,0> translate<26.365197,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.365197,0.000000,6.248400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,6.248400>}
box{<0,0,-0.076200><1.244603,0.035000,0.076200> rotate<0,0.000000,0> translate<26.365197,0.000000,6.248400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.365197,0.000000,6.400800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,6.400800>}
box{<0,0,-0.076200><1.244603,0.035000,0.076200> rotate<0,0.000000,0> translate<26.365197,0.000000,6.400800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.365197,0.000000,6.553200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,6.553200>}
box{<0,0,-0.076200><1.244603,0.035000,0.076200> rotate<0,0.000000,0> translate<26.365197,0.000000,6.553200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.365197,0.000000,6.705600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,6.705600>}
box{<0,0,-0.076200><1.244603,0.035000,0.076200> rotate<0,0.000000,0> translate<26.365197,0.000000,6.705600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.365197,0.000000,6.858000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,6.858000>}
box{<0,0,-0.076200><1.244603,0.035000,0.076200> rotate<0,0.000000,0> translate<26.365197,0.000000,6.858000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.365197,0.000000,7.010400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,7.010400>}
box{<0,0,-0.076200><1.244603,0.035000,0.076200> rotate<0,0.000000,0> translate<26.365197,0.000000,7.010400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.365197,0.000000,7.162800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,7.162800>}
box{<0,0,-0.076200><1.244603,0.035000,0.076200> rotate<0,0.000000,0> translate<26.365197,0.000000,7.162800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.365197,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,7.315200>}
box{<0,0,-0.076200><1.244603,0.035000,0.076200> rotate<0,0.000000,0> translate<26.365197,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.365197,0.000000,7.467600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,7.467600>}
box{<0,0,-0.076200><1.244603,0.035000,0.076200> rotate<0,0.000000,0> translate<26.365197,0.000000,7.467600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.365197,0.000000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,7.620000>}
box{<0,0,-0.076200><1.244603,0.035000,0.076200> rotate<0,0.000000,0> translate<26.365197,0.000000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.365197,0.000000,7.772400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,7.772400>}
box{<0,0,-0.076200><1.244603,0.035000,0.076200> rotate<0,0.000000,0> translate<26.365197,0.000000,7.772400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.365197,0.000000,7.924800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,7.924800>}
box{<0,0,-0.076200><1.244603,0.035000,0.076200> rotate<0,0.000000,0> translate<26.365197,0.000000,7.924800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.365197,0.000000,8.077200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,8.077200>}
box{<0,0,-0.076200><1.244603,0.035000,0.076200> rotate<0,0.000000,0> translate<26.365197,0.000000,8.077200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,0.000000,4.546597>}
box{<0,0,-0.076200><24.409403,0.035000,0.076200> rotate<0,-90.000000,0> translate<27.609800,0.000000,4.546597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,30.683200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.609800,-1.535000,4.546597>}
box{<0,0,-0.076200><26.136603,0.035000,0.076200> rotate<0,-90.000000,0> translate<27.609800,-1.535000,4.546597> }
texture{col_pol}
}
#end
union{
//Holes(fast)/Vias
cylinder{<12.801600,0.038000,14.325600><12.801600,-1.538000,14.325600>0.152400 }
cylinder{<14.122400,0.038000,16.408400><14.122400,-1.538000,16.408400>0.152400 }
cylinder{<23.723600,0.038000,17.221200><23.723600,-1.538000,17.221200>0.152400 }
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
cylinder{<19.481800,0.038000,12.115800><19.481800,-1.538000,12.115800>0.152400 }
cylinder{<17.500600,0.038000,12.090400><17.500600,-1.538000,12.090400>0.152400 }
cylinder{<10.414000,0.038000,10.922000><10.414000,-1.538000,10.922000>0.152400 }
cylinder{<10.414000,0.038000,13.462000><10.414000,-1.538000,13.462000>0.152400 }
cylinder{<10.414000,0.038000,16.002000><10.414000,-1.538000,16.002000>0.152400 }
cylinder{<10.414000,0.038000,18.542000><10.414000,-1.538000,18.542000>0.152400 }
cylinder{<10.414000,0.038000,21.082000><10.414000,-1.538000,21.082000>0.152400 }
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
cylinder{<23.622000,0.038000,8.890000><23.622000,-1.538000,8.890000>0.152400 }
cylinder{<21.082000,0.038000,5.842000><21.082000,-1.538000,5.842000>0.152400 }
cylinder{<18.542000,0.038000,5.842000><18.542000,-1.538000,5.842000>0.152400 }
cylinder{<16.002000,0.038000,5.842000><16.002000,-1.538000,5.842000>0.152400 }
cylinder{<13.462000,0.038000,5.842000><13.462000,-1.538000,5.842000>0.152400 }
cylinder{<25.273000,0.038000,28.702000><25.273000,-1.538000,28.702000>0.152400 }
cylinder{<13.462000,0.038000,8.382000><13.462000,-1.538000,8.382000>0.152400 }
cylinder{<16.002000,0.038000,8.382000><16.002000,-1.538000,8.382000>0.152400 }
cylinder{<18.542000,0.038000,8.382000><18.542000,-1.538000,8.382000>0.152400 }
cylinder{<21.082000,0.038000,8.382000><21.082000,-1.538000,8.382000>0.152400 }
cylinder{<21.082000,0.038000,10.922000><21.082000,-1.538000,10.922000>0.152400 }
cylinder{<18.542000,0.038000,10.922000><18.542000,-1.538000,10.922000>0.152400 }
cylinder{<16.002000,0.038000,10.922000><16.002000,-1.538000,10.922000>0.152400 }
cylinder{<13.462000,0.038000,10.922000><13.462000,-1.538000,10.922000>0.152400 }
cylinder{<13.462000,0.038000,18.542000><13.462000,-1.538000,18.542000>0.152400 }
cylinder{<13.462000,0.038000,21.082000><13.462000,-1.538000,21.082000>0.152400 }
cylinder{<13.462000,0.038000,27.178000><13.462000,-1.538000,27.178000>0.152400 }
cylinder{<23.622000,0.038000,15.621000><23.622000,-1.538000,15.621000>0.152400 }
cylinder{<21.082000,0.038000,13.462000><21.082000,-1.538000,13.462000>0.152400 }
cylinder{<23.622000,0.038000,10.922000><23.622000,-1.538000,10.922000>0.152400 }
cylinder{<16.002000,0.038000,27.178000><16.002000,-1.538000,27.178000>0.152400 }
cylinder{<10.414000,0.038000,25.654000><10.414000,-1.538000,25.654000>0.152400 }
cylinder{<10.414000,0.038000,27.178000><10.414000,-1.538000,27.178000>0.152400 }
cylinder{<23.622000,0.038000,21.590000><23.622000,-1.538000,21.590000>0.152400 }
cylinder{<23.622000,0.038000,5.842000><23.622000,-1.538000,5.842000>0.152400 }
cylinder{<26.670000,0.038000,5.842000><26.670000,-1.538000,5.842000>0.152400 }
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
cylinder{<15.773400,0.038000,15.265400><15.773400,-1.538000,15.265400>0.152400 }
cylinder{<15.113000,0.038000,26.289000><15.113000,-1.538000,26.289000>0.152400 }
cylinder{<19.456400,0.038000,15.265400><19.456400,-1.538000,15.265400>0.152400 }
cylinder{<22.377400,0.038000,17.094200><22.377400,-1.538000,17.094200>0.152400 }
cylinder{<14.655800,0.038000,29.972000><14.655800,-1.538000,29.972000>0.190500 }
//Holes(fast)/Board
texture{col_hls}
}
#if(pcb_silkscreen=on)
//Silk Screen
union{
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.490519,0.000000,11.803309>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.346463,0.000000,11.659253>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,-44.997030,0> translate<9.346463,0.000000,11.659253> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.346463,0.000000,11.659253>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.346463,0.000000,11.371141>}
box{<0,0,-0.076200><0.288113,0.036000,0.076200> rotate<0,-90.000000,0> translate<9.346463,0.000000,11.371141> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.346463,0.000000,11.371141>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.490519,0.000000,11.227084>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,44.997030,0> translate<9.346463,0.000000,11.371141> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.490519,0.000000,11.227084>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.066744,0.000000,11.227084>}
box{<0,0,-0.076200><0.576225,0.036000,0.076200> rotate<0,0.000000,0> translate<9.490519,0.000000,11.227084> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.066744,0.000000,11.227084>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.210800,0.000000,11.371141>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,-44.997030,0> translate<10.066744,0.000000,11.227084> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.210800,0.000000,11.371141>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.210800,0.000000,11.659253>}
box{<0,0,-0.076200><0.288113,0.036000,0.076200> rotate<0,90.000000,0> translate<10.210800,0.000000,11.659253> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.210800,0.000000,11.659253>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.066744,0.000000,11.803309>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,44.997030,0> translate<10.066744,0.000000,11.803309> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.346463,0.000000,12.162603>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.490519,0.000000,12.162603>}
box{<0,0,-0.076200><0.144056,0.036000,0.076200> rotate<0,0.000000,0> translate<9.346463,0.000000,12.162603> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.490519,0.000000,12.162603>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.778631,0.000000,12.450716>}
box{<0,0,-0.076200><0.407453,0.036000,0.076200> rotate<0,-44.997030,0> translate<9.490519,0.000000,12.162603> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.778631,0.000000,12.450716>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.490519,0.000000,12.738828>}
box{<0,0,-0.076200><0.407453,0.036000,0.076200> rotate<0,44.997030,0> translate<9.490519,0.000000,12.738828> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.490519,0.000000,12.738828>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.346463,0.000000,12.738828>}
box{<0,0,-0.076200><0.144056,0.036000,0.076200> rotate<0,0.000000,0> translate<9.346463,0.000000,12.738828> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.778631,0.000000,12.450716>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.210800,0.000000,12.450716>}
box{<0,0,-0.076200><0.432169,0.036000,0.076200> rotate<0,0.000000,0> translate<9.778631,0.000000,12.450716> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.210800,0.000000,13.098122>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.346463,0.000000,13.098122>}
box{<0,0,-0.076200><0.864337,0.036000,0.076200> rotate<0,0.000000,0> translate<9.346463,0.000000,13.098122> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.346463,0.000000,13.098122>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.346463,0.000000,13.530291>}
box{<0,0,-0.076200><0.432169,0.036000,0.076200> rotate<0,90.000000,0> translate<9.346463,0.000000,13.530291> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.346463,0.000000,13.530291>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.490519,0.000000,13.674347>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,-44.997030,0> translate<9.346463,0.000000,13.530291> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.490519,0.000000,13.674347>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.778631,0.000000,13.674347>}
box{<0,0,-0.076200><0.288113,0.036000,0.076200> rotate<0,0.000000,0> translate<9.490519,0.000000,13.674347> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.778631,0.000000,13.674347>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.922688,0.000000,13.530291>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,44.997030,0> translate<9.778631,0.000000,13.674347> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.922688,0.000000,13.530291>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.922688,0.000000,13.098122>}
box{<0,0,-0.076200><0.432169,0.036000,0.076200> rotate<0,-90.000000,0> translate<9.922688,0.000000,13.098122> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.922688,0.000000,13.386234>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.210800,0.000000,13.674347>}
box{<0,0,-0.076200><0.407453,0.036000,0.076200> rotate<0,-44.997030,0> translate<9.922688,0.000000,13.386234> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.210800,0.000000,14.033641>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.346463,0.000000,14.033641>}
box{<0,0,-0.076200><0.864337,0.036000,0.076200> rotate<0,0.000000,0> translate<9.346463,0.000000,14.033641> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.346463,0.000000,14.033641>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.346463,0.000000,14.609866>}
box{<0,0,-0.076200><0.576225,0.036000,0.076200> rotate<0,90.000000,0> translate<9.346463,0.000000,14.609866> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.778631,0.000000,14.033641>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.778631,0.000000,14.321753>}
box{<0,0,-0.076200><0.288113,0.036000,0.076200> rotate<0,90.000000,0> translate<9.778631,0.000000,14.321753> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.346463,0.000000,15.545384>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.490519,0.000000,15.257272>}
box{<0,0,-0.076200><0.322120,0.036000,0.076200> rotate<0,63.430762,0> translate<9.346463,0.000000,15.545384> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.490519,0.000000,15.257272>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.778631,0.000000,14.969159>}
box{<0,0,-0.076200><0.407453,0.036000,0.076200> rotate<0,44.997030,0> translate<9.490519,0.000000,15.257272> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.778631,0.000000,14.969159>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.066744,0.000000,14.969159>}
box{<0,0,-0.076200><0.288113,0.036000,0.076200> rotate<0,0.000000,0> translate<9.778631,0.000000,14.969159> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.066744,0.000000,14.969159>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.210800,0.000000,15.113216>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,-44.997030,0> translate<10.066744,0.000000,14.969159> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.210800,0.000000,15.113216>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.210800,0.000000,15.401328>}
box{<0,0,-0.076200><0.288113,0.036000,0.076200> rotate<0,90.000000,0> translate<10.210800,0.000000,15.401328> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.210800,0.000000,15.401328>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.066744,0.000000,15.545384>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,44.997030,0> translate<10.066744,0.000000,15.545384> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.066744,0.000000,15.545384>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.922688,0.000000,15.545384>}
box{<0,0,-0.076200><0.144056,0.036000,0.076200> rotate<0,0.000000,0> translate<9.922688,0.000000,15.545384> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.922688,0.000000,15.545384>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.778631,0.000000,15.401328>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,-44.997030,0> translate<9.778631,0.000000,15.401328> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.778631,0.000000,15.401328>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.778631,0.000000,14.969159>}
box{<0,0,-0.076200><0.432169,0.036000,0.076200> rotate<0,-90.000000,0> translate<9.778631,0.000000,14.969159> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.066744,0.000000,15.904678>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.210800,0.000000,16.048734>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,-44.997030,0> translate<10.066744,0.000000,15.904678> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.210800,0.000000,16.048734>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.210800,0.000000,16.336847>}
box{<0,0,-0.076200><0.288112,0.036000,0.076200> rotate<0,90.000000,0> translate<10.210800,0.000000,16.336847> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.210800,0.000000,16.336847>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.066744,0.000000,16.480903>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,44.997030,0> translate<10.066744,0.000000,16.480903> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.066744,0.000000,16.480903>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.490519,0.000000,16.480903>}
box{<0,0,-0.076200><0.576225,0.036000,0.076200> rotate<0,0.000000,0> translate<9.490519,0.000000,16.480903> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.490519,0.000000,16.480903>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.346463,0.000000,16.336847>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,-44.997030,0> translate<9.346463,0.000000,16.336847> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.346463,0.000000,16.336847>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.346463,0.000000,16.048734>}
box{<0,0,-0.076200><0.288112,0.036000,0.076200> rotate<0,-90.000000,0> translate<9.346463,0.000000,16.048734> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.346463,0.000000,16.048734>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.490519,0.000000,15.904678>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,44.997030,0> translate<9.346463,0.000000,16.048734> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.490519,0.000000,15.904678>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.634575,0.000000,15.904678>}
box{<0,0,-0.076200><0.144056,0.036000,0.076200> rotate<0,0.000000,0> translate<9.490519,0.000000,15.904678> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.634575,0.000000,15.904678>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.778631,0.000000,16.048734>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,-44.997030,0> translate<9.634575,0.000000,15.904678> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.778631,0.000000,16.048734>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.778631,0.000000,16.480903>}
box{<0,0,-0.076200><0.432169,0.036000,0.076200> rotate<0,90.000000,0> translate<9.778631,0.000000,16.480903> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.490519,0.000000,16.840197>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.346463,0.000000,16.984253>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,44.997030,0> translate<9.346463,0.000000,16.984253> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.346463,0.000000,16.984253>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.346463,0.000000,17.272366>}
box{<0,0,-0.076200><0.288112,0.036000,0.076200> rotate<0,90.000000,0> translate<9.346463,0.000000,17.272366> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.346463,0.000000,17.272366>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.490519,0.000000,17.416422>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,-44.997030,0> translate<9.346463,0.000000,17.272366> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.490519,0.000000,17.416422>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.634575,0.000000,17.416422>}
box{<0,0,-0.076200><0.144056,0.036000,0.076200> rotate<0,0.000000,0> translate<9.490519,0.000000,17.416422> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.634575,0.000000,17.416422>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.778631,0.000000,17.272366>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,44.997030,0> translate<9.634575,0.000000,17.416422> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.778631,0.000000,17.272366>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.778631,0.000000,17.128309>}
box{<0,0,-0.076200><0.144056,0.036000,0.076200> rotate<0,-90.000000,0> translate<9.778631,0.000000,17.128309> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.778631,0.000000,17.272366>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.922688,0.000000,17.416422>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,-44.997030,0> translate<9.778631,0.000000,17.272366> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.922688,0.000000,17.416422>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.066744,0.000000,17.416422>}
box{<0,0,-0.076200><0.144056,0.036000,0.076200> rotate<0,0.000000,0> translate<9.922688,0.000000,17.416422> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.066744,0.000000,17.416422>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.210800,0.000000,17.272366>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,44.997030,0> translate<10.066744,0.000000,17.416422> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.210800,0.000000,17.272366>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.210800,0.000000,16.984253>}
box{<0,0,-0.076200><0.288112,0.036000,0.076200> rotate<0,-90.000000,0> translate<10.210800,0.000000,16.984253> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.210800,0.000000,16.984253>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.066744,0.000000,16.840197>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,-44.997030,0> translate<10.066744,0.000000,16.840197> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.346463,0.000000,18.351941>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.490519,0.000000,18.063828>}
box{<0,0,-0.076200><0.322120,0.036000,0.076200> rotate<0,63.430762,0> translate<9.346463,0.000000,18.351941> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.490519,0.000000,18.063828>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.778631,0.000000,17.775716>}
box{<0,0,-0.076200><0.407453,0.036000,0.076200> rotate<0,44.997030,0> translate<9.490519,0.000000,18.063828> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.778631,0.000000,17.775716>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.066744,0.000000,17.775716>}
box{<0,0,-0.076200><0.288113,0.036000,0.076200> rotate<0,0.000000,0> translate<9.778631,0.000000,17.775716> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.066744,0.000000,17.775716>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.210800,0.000000,17.919772>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,-44.997030,0> translate<10.066744,0.000000,17.775716> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.210800,0.000000,17.919772>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.210800,0.000000,18.207884>}
box{<0,0,-0.076200><0.288113,0.036000,0.076200> rotate<0,90.000000,0> translate<10.210800,0.000000,18.207884> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.210800,0.000000,18.207884>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.066744,0.000000,18.351941>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,44.997030,0> translate<10.066744,0.000000,18.351941> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.066744,0.000000,18.351941>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.922688,0.000000,18.351941>}
box{<0,0,-0.076200><0.144056,0.036000,0.076200> rotate<0,0.000000,0> translate<9.922688,0.000000,18.351941> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.922688,0.000000,18.351941>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.778631,0.000000,18.207884>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,-44.997030,0> translate<9.778631,0.000000,18.207884> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.778631,0.000000,18.207884>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.778631,0.000000,17.775716>}
box{<0,0,-0.076200><0.432169,0.036000,0.076200> rotate<0,-90.000000,0> translate<9.778631,0.000000,17.775716> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.778631,0.000000,18.711234>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.778631,0.000000,19.287459>}
box{<0,0,-0.076200><0.576225,0.036000,0.076200> rotate<0,90.000000,0> translate<9.778631,0.000000,19.287459> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.210800,0.000000,19.646753>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.346463,0.000000,19.646753>}
box{<0,0,-0.076200><0.864337,0.036000,0.076200> rotate<0,0.000000,0> translate<9.346463,0.000000,19.646753> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.346463,0.000000,19.646753>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.346463,0.000000,20.078922>}
box{<0,0,-0.076200><0.432169,0.036000,0.076200> rotate<0,90.000000,0> translate<9.346463,0.000000,20.078922> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.346463,0.000000,20.078922>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.490519,0.000000,20.222978>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,-44.997030,0> translate<9.346463,0.000000,20.078922> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.490519,0.000000,20.222978>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.634575,0.000000,20.222978>}
box{<0,0,-0.076200><0.144056,0.036000,0.076200> rotate<0,0.000000,0> translate<9.490519,0.000000,20.222978> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.634575,0.000000,20.222978>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.778631,0.000000,20.078922>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,44.997030,0> translate<9.634575,0.000000,20.222978> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.778631,0.000000,20.078922>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.922688,0.000000,20.222978>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,-44.997030,0> translate<9.778631,0.000000,20.078922> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.922688,0.000000,20.222978>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.066744,0.000000,20.222978>}
box{<0,0,-0.076200><0.144056,0.036000,0.076200> rotate<0,0.000000,0> translate<9.922688,0.000000,20.222978> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.066744,0.000000,20.222978>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.210800,0.000000,20.078922>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,44.997030,0> translate<10.066744,0.000000,20.222978> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.210800,0.000000,20.078922>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.210800,0.000000,19.646753>}
box{<0,0,-0.076200><0.432169,0.036000,0.076200> rotate<0,-90.000000,0> translate<10.210800,0.000000,19.646753> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.778631,0.000000,19.646753>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.778631,0.000000,20.078922>}
box{<0,0,-0.076200><0.432169,0.036000,0.076200> rotate<0,90.000000,0> translate<9.778631,0.000000,20.078922> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.210800,0.000000,20.726328>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.210800,0.000000,21.014441>}
box{<0,0,-0.076200><0.288113,0.036000,0.076200> rotate<0,90.000000,0> translate<10.210800,0.000000,21.014441> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.210800,0.000000,21.014441>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.066744,0.000000,21.158497>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,44.997030,0> translate<10.066744,0.000000,21.158497> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.066744,0.000000,21.158497>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.778631,0.000000,21.158497>}
box{<0,0,-0.076200><0.288113,0.036000,0.076200> rotate<0,0.000000,0> translate<9.778631,0.000000,21.158497> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.778631,0.000000,21.158497>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.634575,0.000000,21.014441>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,-44.997030,0> translate<9.634575,0.000000,21.014441> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.634575,0.000000,21.014441>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.634575,0.000000,20.726328>}
box{<0,0,-0.076200><0.288113,0.036000,0.076200> rotate<0,-90.000000,0> translate<9.634575,0.000000,20.726328> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.634575,0.000000,20.726328>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.778631,0.000000,20.582272>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,44.997030,0> translate<9.634575,0.000000,20.726328> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.778631,0.000000,20.582272>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.066744,0.000000,20.582272>}
box{<0,0,-0.076200><0.288113,0.036000,0.076200> rotate<0,0.000000,0> translate<9.778631,0.000000,20.582272> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.066744,0.000000,20.582272>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.210800,0.000000,20.726328>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,-44.997030,0> translate<10.066744,0.000000,20.582272> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.210800,0.000000,21.517791>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.346463,0.000000,21.517791>}
box{<0,0,-0.076200><0.864337,0.036000,0.076200> rotate<0,0.000000,0> translate<9.346463,0.000000,21.517791> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.346463,0.000000,21.517791>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.346463,0.000000,21.949959>}
box{<0,0,-0.076200><0.432169,0.036000,0.076200> rotate<0,90.000000,0> translate<9.346463,0.000000,21.949959> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.346463,0.000000,21.949959>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.490519,0.000000,22.094016>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,-44.997030,0> translate<9.346463,0.000000,21.949959> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.490519,0.000000,22.094016>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.634575,0.000000,22.094016>}
box{<0,0,-0.076200><0.144056,0.036000,0.076200> rotate<0,0.000000,0> translate<9.490519,0.000000,22.094016> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.634575,0.000000,22.094016>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.778631,0.000000,21.949959>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,44.997030,0> translate<9.634575,0.000000,22.094016> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.778631,0.000000,21.949959>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.922688,0.000000,22.094016>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,-44.997030,0> translate<9.778631,0.000000,21.949959> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.922688,0.000000,22.094016>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.066744,0.000000,22.094016>}
box{<0,0,-0.076200><0.144056,0.036000,0.076200> rotate<0,0.000000,0> translate<9.922688,0.000000,22.094016> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.066744,0.000000,22.094016>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.210800,0.000000,21.949959>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,44.997030,0> translate<10.066744,0.000000,22.094016> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.210800,0.000000,21.949959>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.210800,0.000000,21.517791>}
box{<0,0,-0.076200><0.432169,0.036000,0.076200> rotate<0,-90.000000,0> translate<10.210800,0.000000,21.517791> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.778631,0.000000,21.517791>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.778631,0.000000,21.949959>}
box{<0,0,-0.076200><0.432169,0.036000,0.076200> rotate<0,90.000000,0> translate<9.778631,0.000000,21.949959> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.084744,0.000000,5.302128>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.228800,0.000000,5.446184>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,-44.997030,0> translate<27.084744,0.000000,5.302128> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.228800,0.000000,5.446184>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.228800,0.000000,5.590241>}
box{<0,0,-0.076200><0.144056,0.036000,0.076200> rotate<0,90.000000,0> translate<27.228800,0.000000,5.590241> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.228800,0.000000,5.590241>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.084744,0.000000,5.734297>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,44.997030,0> translate<27.084744,0.000000,5.734297> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.084744,0.000000,5.734297>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.364463,0.000000,5.734297>}
box{<0,0,-0.076200><0.720281,0.036000,0.076200> rotate<0,0.000000,0> translate<26.364463,0.000000,5.734297> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.364463,0.000000,5.590241>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.364463,0.000000,5.878353>}
box{<0,0,-0.076200><0.288113,0.036000,0.076200> rotate<0,90.000000,0> translate<26.364463,0.000000,5.878353> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.228800,0.000000,7.173166>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.364463,0.000000,7.173166>}
box{<0,0,-0.076200><0.864337,0.036000,0.076200> rotate<0,0.000000,0> translate<26.364463,0.000000,7.173166> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.364463,0.000000,7.173166>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.652575,0.000000,7.461278>}
box{<0,0,-0.076200><0.407453,0.036000,0.076200> rotate<0,-44.997030,0> translate<26.364463,0.000000,7.173166> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.652575,0.000000,7.461278>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.364463,0.000000,7.749391>}
box{<0,0,-0.076200><0.407453,0.036000,0.076200> rotate<0,44.997030,0> translate<26.364463,0.000000,7.749391> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.364463,0.000000,7.749391>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.228800,0.000000,7.749391>}
box{<0,0,-0.076200><0.864337,0.036000,0.076200> rotate<0,0.000000,0> translate<26.364463,0.000000,7.749391> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.228800,0.000000,8.252741>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.228800,0.000000,8.540853>}
box{<0,0,-0.076200><0.288112,0.036000,0.076200> rotate<0,90.000000,0> translate<27.228800,0.000000,8.540853> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.228800,0.000000,8.540853>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.084744,0.000000,8.684909>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,44.997030,0> translate<27.084744,0.000000,8.684909> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.084744,0.000000,8.684909>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.796631,0.000000,8.684909>}
box{<0,0,-0.076200><0.288113,0.036000,0.076200> rotate<0,0.000000,0> translate<26.796631,0.000000,8.684909> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.796631,0.000000,8.684909>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.652575,0.000000,8.540853>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,-44.997030,0> translate<26.652575,0.000000,8.540853> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.652575,0.000000,8.540853>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.652575,0.000000,8.252741>}
box{<0,0,-0.076200><0.288112,0.036000,0.076200> rotate<0,-90.000000,0> translate<26.652575,0.000000,8.252741> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.652575,0.000000,8.252741>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.796631,0.000000,8.108684>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,44.997030,0> translate<26.652575,0.000000,8.252741> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.796631,0.000000,8.108684>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.084744,0.000000,8.108684>}
box{<0,0,-0.076200><0.288113,0.036000,0.076200> rotate<0,0.000000,0> translate<26.796631,0.000000,8.108684> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.084744,0.000000,8.108684>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.228800,0.000000,8.252741>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,-44.997030,0> translate<27.084744,0.000000,8.108684> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.228800,0.000000,9.044203>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.652575,0.000000,9.044203>}
box{<0,0,-0.076200><0.576225,0.036000,0.076200> rotate<0,0.000000,0> translate<26.652575,0.000000,9.044203> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.940688,0.000000,9.044203>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.652575,0.000000,9.332316>}
box{<0,0,-0.076200><0.407453,0.036000,0.076200> rotate<0,44.997030,0> translate<26.652575,0.000000,9.332316> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.652575,0.000000,9.332316>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.652575,0.000000,9.476372>}
box{<0,0,-0.076200><0.144056,0.036000,0.076200> rotate<0,90.000000,0> translate<26.652575,0.000000,9.476372> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.228800,0.000000,10.255969>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.228800,0.000000,9.967856>}
box{<0,0,-0.076200><0.288113,0.036000,0.076200> rotate<0,-90.000000,0> translate<27.228800,0.000000,9.967856> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.228800,0.000000,9.967856>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.084744,0.000000,9.823800>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,-44.997030,0> translate<27.084744,0.000000,9.823800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.084744,0.000000,9.823800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.796631,0.000000,9.823800>}
box{<0,0,-0.076200><0.288113,0.036000,0.076200> rotate<0,0.000000,0> translate<26.796631,0.000000,9.823800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.796631,0.000000,9.823800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.652575,0.000000,9.967856>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,44.997030,0> translate<26.652575,0.000000,9.967856> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.652575,0.000000,9.967856>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.652575,0.000000,10.255969>}
box{<0,0,-0.076200><0.288113,0.036000,0.076200> rotate<0,90.000000,0> translate<26.652575,0.000000,10.255969> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.652575,0.000000,10.255969>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.796631,0.000000,10.400025>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,-44.997030,0> translate<26.652575,0.000000,10.255969> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.796631,0.000000,10.400025>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.940688,0.000000,10.400025>}
box{<0,0,-0.076200><0.144056,0.036000,0.076200> rotate<0,0.000000,0> translate<26.796631,0.000000,10.400025> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.940688,0.000000,10.400025>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.940688,0.000000,9.823800>}
box{<0,0,-0.076200><0.576225,0.036000,0.076200> rotate<0,-90.000000,0> translate<26.940688,0.000000,9.823800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.364463,0.000000,10.759319>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.364463,0.000000,10.903375>}
box{<0,0,-0.076200><0.144056,0.036000,0.076200> rotate<0,90.000000,0> translate<26.364463,0.000000,10.903375> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.364463,0.000000,10.903375>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.228800,0.000000,10.903375>}
box{<0,0,-0.076200><0.864337,0.036000,0.076200> rotate<0,0.000000,0> translate<26.364463,0.000000,10.903375> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.228800,0.000000,10.759319>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.228800,0.000000,11.047431>}
box{<0,0,-0.076200><0.288113,0.036000,0.076200> rotate<0,90.000000,0> translate<27.228800,0.000000,11.047431> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.652575,0.000000,11.527053>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.652575,0.000000,11.815166>}
box{<0,0,-0.076200><0.288113,0.036000,0.076200> rotate<0,90.000000,0> translate<26.652575,0.000000,11.815166> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.652575,0.000000,11.815166>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.796631,0.000000,11.959222>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,-44.997030,0> translate<26.652575,0.000000,11.815166> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.796631,0.000000,11.959222>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.228800,0.000000,11.959222>}
box{<0,0,-0.076200><0.432169,0.036000,0.076200> rotate<0,0.000000,0> translate<26.796631,0.000000,11.959222> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.228800,0.000000,11.959222>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.228800,0.000000,11.527053>}
box{<0,0,-0.076200><0.432169,0.036000,0.076200> rotate<0,-90.000000,0> translate<27.228800,0.000000,11.527053> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.228800,0.000000,11.527053>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.084744,0.000000,11.382997>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,-44.997030,0> translate<27.084744,0.000000,11.382997> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.084744,0.000000,11.382997>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.940688,0.000000,11.527053>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,44.997030,0> translate<26.940688,0.000000,11.527053> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.940688,0.000000,11.527053>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.940688,0.000000,11.959222>}
box{<0,0,-0.076200><0.432169,0.036000,0.076200> rotate<0,90.000000,0> translate<26.940688,0.000000,11.959222> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.228800,0.000000,12.318516>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.652575,0.000000,12.318516>}
box{<0,0,-0.076200><0.576225,0.036000,0.076200> rotate<0,0.000000,0> translate<26.652575,0.000000,12.318516> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.652575,0.000000,12.318516>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.652575,0.000000,12.750684>}
box{<0,0,-0.076200><0.432169,0.036000,0.076200> rotate<0,90.000000,0> translate<26.652575,0.000000,12.750684> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.652575,0.000000,12.750684>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.796631,0.000000,12.894741>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,-44.997030,0> translate<26.652575,0.000000,12.750684> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.796631,0.000000,12.894741>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.228800,0.000000,12.894741>}
box{<0,0,-0.076200><0.432169,0.036000,0.076200> rotate<0,0.000000,0> translate<26.796631,0.000000,12.894741> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.364463,0.000000,13.830259>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.228800,0.000000,13.830259>}
box{<0,0,-0.076200><0.864337,0.036000,0.076200> rotate<0,0.000000,0> translate<26.364463,0.000000,13.830259> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.228800,0.000000,13.830259>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.228800,0.000000,13.398091>}
box{<0,0,-0.076200><0.432169,0.036000,0.076200> rotate<0,-90.000000,0> translate<27.228800,0.000000,13.398091> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.228800,0.000000,13.398091>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.084744,0.000000,13.254034>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,-44.997030,0> translate<27.084744,0.000000,13.254034> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.084744,0.000000,13.254034>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.796631,0.000000,13.254034>}
box{<0,0,-0.076200><0.288113,0.036000,0.076200> rotate<0,0.000000,0> translate<26.796631,0.000000,13.254034> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.796631,0.000000,13.254034>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.652575,0.000000,13.398091>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,44.997030,0> translate<26.652575,0.000000,13.398091> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.652575,0.000000,13.398091>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.652575,0.000000,13.830259>}
box{<0,0,-0.076200><0.432169,0.036000,0.076200> rotate<0,90.000000,0> translate<26.652575,0.000000,13.830259> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.364463,0.000000,15.701297>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.364463,0.000000,15.125072>}
box{<0,0,-0.076200><0.576225,0.036000,0.076200> rotate<0,-90.000000,0> translate<26.364463,0.000000,15.125072> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.364463,0.000000,15.125072>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.228800,0.000000,15.125072>}
box{<0,0,-0.076200><0.864337,0.036000,0.076200> rotate<0,0.000000,0> translate<26.364463,0.000000,15.125072> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.228800,0.000000,15.125072>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.228800,0.000000,15.701297>}
box{<0,0,-0.076200><0.576225,0.036000,0.076200> rotate<0,90.000000,0> translate<27.228800,0.000000,15.701297> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.796631,0.000000,15.125072>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.796631,0.000000,15.413184>}
box{<0,0,-0.076200><0.288112,0.036000,0.076200> rotate<0,90.000000,0> translate<26.796631,0.000000,15.413184> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.228800,0.000000,16.060591>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.652575,0.000000,16.060591>}
box{<0,0,-0.076200><0.576225,0.036000,0.076200> rotate<0,0.000000,0> translate<26.652575,0.000000,16.060591> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.652575,0.000000,16.060591>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.652575,0.000000,16.492759>}
box{<0,0,-0.076200><0.432169,0.036000,0.076200> rotate<0,90.000000,0> translate<26.652575,0.000000,16.492759> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.652575,0.000000,16.492759>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.796631,0.000000,16.636816>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,-44.997030,0> translate<26.652575,0.000000,16.492759> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.796631,0.000000,16.636816>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.228800,0.000000,16.636816>}
box{<0,0,-0.076200><0.432169,0.036000,0.076200> rotate<0,0.000000,0> translate<26.796631,0.000000,16.636816> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.516913,0.000000,17.284222>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.516913,0.000000,17.428278>}
box{<0,0,-0.076200><0.144056,0.036000,0.076200> rotate<0,90.000000,0> translate<27.516913,0.000000,17.428278> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.516913,0.000000,17.428278>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.372856,0.000000,17.572334>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,44.997030,0> translate<27.372856,0.000000,17.572334> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.372856,0.000000,17.572334>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.652575,0.000000,17.572334>}
box{<0,0,-0.076200><0.720281,0.036000,0.076200> rotate<0,0.000000,0> translate<26.652575,0.000000,17.572334> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.652575,0.000000,17.572334>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.652575,0.000000,17.140166>}
box{<0,0,-0.076200><0.432169,0.036000,0.076200> rotate<0,-90.000000,0> translate<26.652575,0.000000,17.140166> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.652575,0.000000,17.140166>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.796631,0.000000,16.996109>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,44.997030,0> translate<26.652575,0.000000,17.140166> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.796631,0.000000,16.996109>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.084744,0.000000,16.996109>}
box{<0,0,-0.076200><0.288113,0.036000,0.076200> rotate<0,0.000000,0> translate<26.796631,0.000000,16.996109> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.084744,0.000000,16.996109>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.228800,0.000000,17.140166>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,-44.997030,0> translate<27.084744,0.000000,16.996109> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.228800,0.000000,17.140166>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.228800,0.000000,17.572334>}
box{<0,0,-0.076200><0.432169,0.036000,0.076200> rotate<0,90.000000,0> translate<27.228800,0.000000,17.572334> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.652575,0.000000,17.931628>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.652575,0.000000,18.075684>}
box{<0,0,-0.076200><0.144056,0.036000,0.076200> rotate<0,90.000000,0> translate<26.652575,0.000000,18.075684> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.652575,0.000000,18.075684>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.228800,0.000000,18.075684>}
box{<0,0,-0.076200><0.576225,0.036000,0.076200> rotate<0,0.000000,0> translate<26.652575,0.000000,18.075684> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.228800,0.000000,17.931628>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.228800,0.000000,18.219741>}
box{<0,0,-0.076200><0.288113,0.036000,0.076200> rotate<0,90.000000,0> translate<27.228800,0.000000,18.219741> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.220406,0.000000,18.075684>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.364463,0.000000,18.075684>}
box{<0,0,-0.076200><0.144056,0.036000,0.076200> rotate<0,0.000000,0> translate<26.220406,0.000000,18.075684> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.228800,0.000000,18.555306>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.652575,0.000000,18.555306>}
box{<0,0,-0.076200><0.576225,0.036000,0.076200> rotate<0,0.000000,0> translate<26.652575,0.000000,18.555306> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.652575,0.000000,18.555306>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.652575,0.000000,18.987475>}
box{<0,0,-0.076200><0.432169,0.036000,0.076200> rotate<0,90.000000,0> translate<26.652575,0.000000,18.987475> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.652575,0.000000,18.987475>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.796631,0.000000,19.131531>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,-44.997030,0> translate<26.652575,0.000000,18.987475> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.796631,0.000000,19.131531>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.228800,0.000000,19.131531>}
box{<0,0,-0.076200><0.432169,0.036000,0.076200> rotate<0,0.000000,0> translate<26.796631,0.000000,19.131531> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.228800,0.000000,19.922994>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.228800,0.000000,19.634881>}
box{<0,0,-0.076200><0.288113,0.036000,0.076200> rotate<0,-90.000000,0> translate<27.228800,0.000000,19.634881> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.228800,0.000000,19.634881>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.084744,0.000000,19.490825>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,-44.997030,0> translate<27.084744,0.000000,19.490825> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.084744,0.000000,19.490825>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.796631,0.000000,19.490825>}
box{<0,0,-0.076200><0.288113,0.036000,0.076200> rotate<0,0.000000,0> translate<26.796631,0.000000,19.490825> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.796631,0.000000,19.490825>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.652575,0.000000,19.634881>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,44.997030,0> translate<26.652575,0.000000,19.634881> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.652575,0.000000,19.634881>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.652575,0.000000,19.922994>}
box{<0,0,-0.076200><0.288113,0.036000,0.076200> rotate<0,90.000000,0> translate<26.652575,0.000000,19.922994> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.652575,0.000000,19.922994>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.796631,0.000000,20.067050>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,-44.997030,0> translate<26.652575,0.000000,19.922994> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.796631,0.000000,20.067050>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.940688,0.000000,20.067050>}
box{<0,0,-0.076200><0.144056,0.036000,0.076200> rotate<0,0.000000,0> translate<26.796631,0.000000,20.067050> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.940688,0.000000,20.067050>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.940688,0.000000,19.490825>}
box{<0,0,-0.076200><0.576225,0.036000,0.076200> rotate<0,-90.000000,0> translate<26.940688,0.000000,19.490825> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.228800,0.000000,20.858512>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.228800,0.000000,20.570400>}
box{<0,0,-0.076200><0.288113,0.036000,0.076200> rotate<0,-90.000000,0> translate<27.228800,0.000000,20.570400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.228800,0.000000,20.570400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.084744,0.000000,20.426344>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,-44.997030,0> translate<27.084744,0.000000,20.426344> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.084744,0.000000,20.426344>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.796631,0.000000,20.426344>}
box{<0,0,-0.076200><0.288113,0.036000,0.076200> rotate<0,0.000000,0> translate<26.796631,0.000000,20.426344> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.796631,0.000000,20.426344>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.652575,0.000000,20.570400>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,44.997030,0> translate<26.652575,0.000000,20.570400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.652575,0.000000,20.570400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.652575,0.000000,20.858512>}
box{<0,0,-0.076200><0.288113,0.036000,0.076200> rotate<0,90.000000,0> translate<26.652575,0.000000,20.858512> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.652575,0.000000,20.858512>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.796631,0.000000,21.002569>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,-44.997030,0> translate<26.652575,0.000000,20.858512> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.796631,0.000000,21.002569>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.940688,0.000000,21.002569>}
box{<0,0,-0.076200><0.144056,0.036000,0.076200> rotate<0,0.000000,0> translate<26.796631,0.000000,21.002569> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.940688,0.000000,21.002569>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.940688,0.000000,20.426344>}
box{<0,0,-0.076200><0.576225,0.036000,0.076200> rotate<0,-90.000000,0> translate<26.940688,0.000000,20.426344> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.228800,0.000000,21.361863>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.652575,0.000000,21.361863>}
box{<0,0,-0.076200><0.576225,0.036000,0.076200> rotate<0,0.000000,0> translate<26.652575,0.000000,21.361863> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.940688,0.000000,21.361863>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.652575,0.000000,21.649975>}
box{<0,0,-0.076200><0.407453,0.036000,0.076200> rotate<0,44.997030,0> translate<26.652575,0.000000,21.649975> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.652575,0.000000,21.649975>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.652575,0.000000,21.794031>}
box{<0,0,-0.076200><0.144056,0.036000,0.076200> rotate<0,90.000000,0> translate<26.652575,0.000000,21.794031> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.652575,0.000000,22.141459>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.652575,0.000000,22.285516>}
box{<0,0,-0.076200><0.144056,0.036000,0.076200> rotate<0,90.000000,0> translate<26.652575,0.000000,22.285516> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.652575,0.000000,22.285516>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.228800,0.000000,22.285516>}
box{<0,0,-0.076200><0.576225,0.036000,0.076200> rotate<0,0.000000,0> translate<26.652575,0.000000,22.285516> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.228800,0.000000,22.141459>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.228800,0.000000,22.429572>}
box{<0,0,-0.076200><0.288113,0.036000,0.076200> rotate<0,90.000000,0> translate<27.228800,0.000000,22.429572> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.220406,0.000000,22.285516>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.364463,0.000000,22.285516>}
box{<0,0,-0.076200><0.144056,0.036000,0.076200> rotate<0,0.000000,0> translate<26.220406,0.000000,22.285516> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.228800,0.000000,22.765138>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.652575,0.000000,22.765138>}
box{<0,0,-0.076200><0.576225,0.036000,0.076200> rotate<0,0.000000,0> translate<26.652575,0.000000,22.765138> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.652575,0.000000,22.765138>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.652575,0.000000,23.197306>}
box{<0,0,-0.076200><0.432169,0.036000,0.076200> rotate<0,90.000000,0> translate<26.652575,0.000000,23.197306> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.652575,0.000000,23.197306>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.796631,0.000000,23.341363>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,-44.997030,0> translate<26.652575,0.000000,23.197306> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.796631,0.000000,23.341363>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.228800,0.000000,23.341363>}
box{<0,0,-0.076200><0.432169,0.036000,0.076200> rotate<0,0.000000,0> translate<26.796631,0.000000,23.341363> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.516913,0.000000,23.988769>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.516913,0.000000,24.132825>}
box{<0,0,-0.076200><0.144056,0.036000,0.076200> rotate<0,90.000000,0> translate<27.516913,0.000000,24.132825> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.516913,0.000000,24.132825>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.372856,0.000000,24.276881>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,44.997030,0> translate<27.372856,0.000000,24.276881> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.372856,0.000000,24.276881>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.652575,0.000000,24.276881>}
box{<0,0,-0.076200><0.720281,0.036000,0.076200> rotate<0,0.000000,0> translate<26.652575,0.000000,24.276881> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.652575,0.000000,24.276881>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.652575,0.000000,23.844712>}
box{<0,0,-0.076200><0.432169,0.036000,0.076200> rotate<0,-90.000000,0> translate<26.652575,0.000000,23.844712> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.652575,0.000000,23.844712>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.796631,0.000000,23.700656>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,44.997030,0> translate<26.652575,0.000000,23.844712> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.796631,0.000000,23.700656>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.084744,0.000000,23.700656>}
box{<0,0,-0.076200><0.288113,0.036000,0.076200> rotate<0,0.000000,0> translate<26.796631,0.000000,23.700656> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.084744,0.000000,23.700656>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.228800,0.000000,23.844712>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,-44.997030,0> translate<27.084744,0.000000,23.700656> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.228800,0.000000,23.844712>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.228800,0.000000,24.276881>}
box{<0,0,-0.076200><0.432169,0.036000,0.076200> rotate<0,90.000000,0> translate<27.228800,0.000000,24.276881> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.364463,0.000000,25.571694>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.228800,0.000000,25.571694>}
box{<0,0,-0.076200><0.864337,0.036000,0.076200> rotate<0,0.000000,0> translate<26.364463,0.000000,25.571694> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.228800,0.000000,25.571694>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.228800,0.000000,26.147919>}
box{<0,0,-0.076200><0.576225,0.036000,0.076200> rotate<0,90.000000,0> translate<27.228800,0.000000,26.147919> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.364463,0.000000,26.507213>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.228800,0.000000,26.507213>}
box{<0,0,-0.076200><0.864337,0.036000,0.076200> rotate<0,0.000000,0> translate<26.364463,0.000000,26.507213> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.228800,0.000000,26.507213>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.228800,0.000000,27.083438>}
box{<0,0,-0.076200><0.576225,0.036000,0.076200> rotate<0,90.000000,0> translate<27.228800,0.000000,27.083438> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.508519,0.000000,28.018956>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.364463,0.000000,27.874900>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,-44.997030,0> translate<26.364463,0.000000,27.874900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.364463,0.000000,27.874900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.364463,0.000000,27.586787>}
box{<0,0,-0.076200><0.288113,0.036000,0.076200> rotate<0,-90.000000,0> translate<26.364463,0.000000,27.586787> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.364463,0.000000,27.586787>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.508519,0.000000,27.442731>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,44.997030,0> translate<26.364463,0.000000,27.586787> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.508519,0.000000,27.442731>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.084744,0.000000,27.442731>}
box{<0,0,-0.076200><0.576225,0.036000,0.076200> rotate<0,0.000000,0> translate<26.508519,0.000000,27.442731> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.084744,0.000000,27.442731>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.228800,0.000000,27.586787>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,-44.997030,0> translate<27.084744,0.000000,27.442731> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.228800,0.000000,27.586787>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.228800,0.000000,27.874900>}
box{<0,0,-0.076200><0.288113,0.036000,0.076200> rotate<0,90.000000,0> translate<27.228800,0.000000,27.874900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.228800,0.000000,27.874900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.084744,0.000000,28.018956>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,44.997030,0> translate<27.084744,0.000000,28.018956> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.271000,0.000000,28.956000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.955000,0.000000,28.956000>}
box{<0,0,-0.101600><11.684000,0.036000,0.101600> rotate<0,0.000000,0> translate<9.271000,0.000000,28.956000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.733000,0.000000,28.956000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.559000,0.000000,28.956000>}
box{<0,0,-0.101600><4.826000,0.036000,0.101600> rotate<0,0.000000,0> translate<22.733000,0.000000,28.956000> }
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
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.305800,0.000000,18.678000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.305800,0.000000,19.168000>}
box{<0,0,-0.076200><0.490000,0.036000,0.076200> rotate<0,90.000000,0> translate<22.305800,0.000000,19.168000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.753800,0.000000,19.168000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.753800,0.000000,18.678000>}
box{<0,0,-0.076200><0.490000,0.036000,0.076200> rotate<0,-90.000000,0> translate<22.753800,0.000000,18.678000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<22.499300,0.000000,18.923000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<22.560300,0.000000,18.923000>}
box{<0,0,-0.203200><0.061000,0.036000,0.203200> rotate<0,0.000000,0> translate<22.499300,0.000000,18.923000> }
box{<-0.150000,0,-0.299950><0.150000,0.036000,0.299950> rotate<0,-90.000000,0> translate<22.534650,0.000000,18.519000>}
box{<-0.150000,0,-0.299950><0.150000,0.036000,0.299950> rotate<0,-90.000000,0> translate<22.534650,0.000000,19.331800>}
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
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.947600,0.000000,19.168000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.947600,0.000000,18.678000>}
box{<0,0,-0.076200><0.490000,0.036000,0.076200> rotate<0,-90.000000,0> translate<23.947600,0.000000,18.678000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.499600,0.000000,18.678000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.499600,0.000000,19.168000>}
box{<0,0,-0.076200><0.490000,0.036000,0.076200> rotate<0,90.000000,0> translate<23.499600,0.000000,19.168000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<23.754100,0.000000,18.923000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<23.693100,0.000000,18.923000>}
box{<0,0,-0.203200><0.061000,0.036000,0.203200> rotate<0,0.000000,0> translate<23.693100,0.000000,18.923000> }
box{<-0.150000,0,-0.299950><0.150000,0.036000,0.299950> rotate<0,-270.000000,0> translate<23.718750,0.000000,19.327000>}
box{<-0.150000,0,-0.299950><0.150000,0.036000,0.299950> rotate<0,-270.000000,0> translate<23.718750,0.000000,18.514200>}
//C11 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.305800,0.000000,21.294200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.305800,0.000000,21.784200>}
box{<0,0,-0.076200><0.490000,0.036000,0.076200> rotate<0,90.000000,0> translate<22.305800,0.000000,21.784200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.753800,0.000000,21.784200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.753800,0.000000,21.294200>}
box{<0,0,-0.076200><0.490000,0.036000,0.076200> rotate<0,-90.000000,0> translate<22.753800,0.000000,21.294200> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<22.499300,0.000000,21.539200>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<22.560300,0.000000,21.539200>}
box{<0,0,-0.203200><0.061000,0.036000,0.203200> rotate<0,0.000000,0> translate<22.499300,0.000000,21.539200> }
box{<-0.150000,0,-0.299950><0.150000,0.036000,0.299950> rotate<0,-90.000000,0> translate<22.534650,0.000000,21.135200>}
box{<-0.150000,0,-0.299950><0.150000,0.036000,0.299950> rotate<0,-90.000000,0> translate<22.534650,0.000000,21.948000>}
//C14 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.309400,0.000000,11.145800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.309400,0.000000,10.545800>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<12.309400,0.000000,10.545800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.109400,0.000000,11.145800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.109400,0.000000,10.545800>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<11.109400,0.000000,10.545800> }
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
//U$1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.703800,0.000000,16.812000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.703800,0.000000,22.812000>}
box{<0,0,-0.063500><6.000000,0.036000,0.063500> rotate<0,90.000000,0> translate<14.703800,0.000000,22.812000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.703800,0.000000,22.812000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.703800,0.000000,22.812000>}
box{<0,0,-0.063500><6.000000,0.036000,0.063500> rotate<0,0.000000,0> translate<14.703800,0.000000,22.812000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.703800,0.000000,22.812000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.703800,0.000000,17.304100>}
box{<0,0,-0.063500><5.507900,0.036000,0.063500> rotate<0,-90.000000,0> translate<20.703800,0.000000,17.304100> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.703800,0.000000,17.304100>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.211700,0.000000,16.812000>}
box{<0,0,-0.063500><0.695934,0.036000,0.063500> rotate<0,-44.997030,0> translate<20.211700,0.000000,16.812000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.211700,0.000000,16.812000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.703800,0.000000,16.812000>}
box{<0,0,-0.063500><5.507900,0.036000,0.063500> rotate<0,0.000000,0> translate<14.703800,0.000000,16.812000> }
difference{
cylinder{<20.878800,0,16.637000><20.878800,0.036000,16.637000>0.350000 translate<0,0.000000,0>}
cylinder{<20.878800,-0.1,16.637000><20.878800,0.135000,16.637000>0.000000 translate<0,0.000000,0>}}
//Y1 silk screen
object{ARC(2.032100,0.050800,90.002059,145.773052,0.036000) translate<15.214672,0.000000,7.112000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.928600,0.000000,8.255000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.928600,0.000000,9.271000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,90.000000,0> translate<12.928600,0.000000,9.271000> }
object{ARC(2.032000,0.050800,34.228866,90.001351,0.036000) translate<22.072647,0.000000,7.112000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.358600,0.000000,8.255000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.358600,0.000000,9.271000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,90.000000,0> translate<24.358600,0.000000,9.271000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<22.072600,0.000000,5.842000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<15.214600,0.000000,5.842000>}
box{<0,0,-0.025400><6.858000,0.036000,0.025400> rotate<0,0.000000,0> translate<15.214600,0.000000,5.842000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<22.072600,0.000000,5.080000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<15.214600,0.000000,5.080000>}
box{<0,0,-0.025400><6.858000,0.036000,0.025400> rotate<0,0.000000,0> translate<15.214600,0.000000,5.080000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<15.214600,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<22.072600,0.000000,8.382000>}
box{<0,0,-0.025400><6.858000,0.036000,0.025400> rotate<0,0.000000,0> translate<15.214600,0.000000,8.382000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.104600,0.000000,4.699000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.182600,0.000000,4.699000>}
box{<0,0,-0.076200><10.922000,0.036000,0.076200> rotate<0,0.000000,0> translate<13.182600,0.000000,4.699000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.358600,0.000000,6.731000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.120600,0.000000,6.731000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<24.358600,0.000000,6.731000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.358600,0.000000,7.493000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.120600,0.000000,7.493000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<24.358600,0.000000,7.493000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.120600,0.000000,6.731000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.120600,0.000000,7.493000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,90.000000,0> translate<25.120600,0.000000,7.493000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<24.104600,0.000000,4.953000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.358600,0.000000,5.969000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.358600,0.000000,8.255000>}
box{<0,0,-0.076200><2.286000,0.036000,0.076200> rotate<0,90.000000,0> translate<24.358600,0.000000,8.255000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.358600,0.000000,4.953000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.358600,0.000000,5.969000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,90.000000,0> translate<24.358600,0.000000,5.969000> }
object{ARC(1.270000,0.050800,269.999105,295.841933,0.036000) translate<22.072619,0.000000,7.112000>}
object{ARC(1.270000,0.050800,64.158067,90.000895,0.036000) translate<22.072619,0.000000,7.112000>}
object{ARC(2.032000,0.050800,270.003387,325.774544,0.036000) translate<22.072481,0.000000,7.112000>}
object{ARC(1.270009,0.050800,295.842738,424.157262,0.036000) translate<22.072600,0.000000,7.112000>}
object{ARC(2.032041,0.050800,325.771894,394.228106,0.036000) translate<22.072600,0.000000,7.112000>}
object{ARC(2.032000,0.050800,214.228866,270.001351,0.036000) translate<15.214553,0.000000,7.112000>}
object{ARC(1.270009,0.050800,115.842738,244.157262,0.036000) translate<15.214600,0.000000,7.112000>}
object{ARC(1.270000,0.050800,244.158067,270.000895,0.036000) translate<15.214581,0.000000,7.112000>}
object{ARC(1.270000,0.050800,89.999105,115.841933,0.036000) translate<15.214581,0.000000,7.112000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.166600,0.000000,6.731000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.166600,0.000000,7.493000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,90.000000,0> translate<12.166600,0.000000,7.493000> }
object{ARC(2.032041,0.050800,145.771894,214.228106,0.036000) translate<15.214600,0.000000,7.112000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.928600,0.000000,5.969000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.928600,0.000000,6.731000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,90.000000,0> translate<12.928600,0.000000,6.731000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.928600,0.000000,6.731000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.928600,0.000000,7.493000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,90.000000,0> translate<12.928600,0.000000,7.493000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.928600,0.000000,7.493000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.928600,0.000000,8.255000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,90.000000,0> translate<12.928600,0.000000,8.255000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.928600,0.000000,4.953000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.928600,0.000000,5.969000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,90.000000,0> translate<12.928600,0.000000,5.969000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<13.182600,0.000000,4.953000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.928600,0.000000,6.731000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.166600,0.000000,6.731000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<12.166600,0.000000,6.731000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.928600,0.000000,7.493000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.166600,0.000000,7.493000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<12.166600,0.000000,7.493000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<15.214600,0.000000,9.144000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<22.072600,0.000000,9.144000>}
box{<0,0,-0.025400><6.858000,0.036000,0.025400> rotate<0,0.000000,0> translate<15.214600,0.000000,9.144000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.104600,0.000000,9.525000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.182600,0.000000,9.525000>}
box{<0,0,-0.076200><10.922000,0.036000,0.076200> rotate<0,0.000000,0> translate<13.182600,0.000000,9.525000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<24.104600,0.000000,9.271000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<13.182600,0.000000,9.271000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.389600,0.000000,7.747000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.389600,0.000000,6.477000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<18.389600,0.000000,6.477000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.389600,0.000000,6.477000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.897600,0.000000,6.477000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<18.389600,0.000000,6.477000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.897600,0.000000,6.477000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.897600,0.000000,7.747000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<18.897600,0.000000,7.747000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.897600,0.000000,7.747000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.389600,0.000000,7.747000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<18.389600,0.000000,7.747000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.008600,0.000000,7.747000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.008600,0.000000,7.112000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,-90.000000,0> translate<18.008600,0.000000,7.112000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.008600,0.000000,7.112000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.008600,0.000000,6.477000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,-90.000000,0> translate<18.008600,0.000000,6.477000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<18.008600,0.000000,7.112000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<17.627600,0.000000,7.112000>}
box{<0,0,-0.025400><0.381000,0.036000,0.025400> rotate<0,0.000000,0> translate<17.627600,0.000000,7.112000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.278600,0.000000,7.747000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.278600,0.000000,7.112000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,-90.000000,0> translate<19.278600,0.000000,7.112000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.278600,0.000000,7.112000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.278600,0.000000,6.477000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,-90.000000,0> translate<19.278600,0.000000,6.477000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.278600,0.000000,7.112000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.659600,0.000000,7.112000>}
box{<0,0,-0.025400><0.381000,0.036000,0.025400> rotate<0,0.000000,0> translate<19.278600,0.000000,7.112000> }
texture{col_slk}
}
#end
translate<mac_x_ver,mac_y_ver,mac_z_ver>
rotate<mac_x_rot,mac_y_rot,mac_z_rot>
}//End union
#end

#if(use_file_as_inc=off)
object{  CYRF6936_BOB(-18.415000,0,-21.158200,pcb_rotate_x,pcb_rotate_y,pcb_rotate_z)
#if(pcb_upsidedown=on)
rotate pcb_rotdir*180
#end
}
#end


//Parts not found in 3dpack.dat or 3dusrpac.dat are:
//L1		0603
//U$1	CYRF6936	QFN40
