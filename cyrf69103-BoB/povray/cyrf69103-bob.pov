//POVRay-File created by 3d41.ulp v###VERSIONDUMMY###
///Users/jmoreland/.dropbox-alt/Dropbox/Projects/quadcopter/cyrf6936/cyrf69103-BoB/cyrf69103-bob.brd
//4/22/13 3:58 PM

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

#declare col_preset = 2;
#declare pin_short = on;

#declare e3d_environment = off;

#local cam_x = 0;
#local cam_y = 132;
#local cam_z = -70;
#local cam_a = 20;
#local cam_look_x = 0;
#local cam_look_y = -3;
#local cam_look_z = 0;

#local pcb_rotate_x = 5;
#local pcb_rotate_y = 5;
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
#declare global_seed=seed(643);
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


#macro CYRF69103_BOB(mac_x_ver,mac_y_ver,mac_z_ver,mac_x_rot,mac_y_rot,mac_z_rot)
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
}//End difference(reale Bohrungen/Durchbrüche)
#end
#if(pcb_parts=on)//Parts
union{
#ifndef(pack_C1) #declare global_pack_C1=yes; object {CAP_SMD_CHIP_0402()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<21.920200,0.000000,25.806400>translate<0,0.035000,0> }#end		//SMD Capacitor 0402 C1 15pF 0402-CAP
#ifndef(pack_C2) #declare global_pack_C2=yes; object {CAP_SMD_CHIP_0402()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<19.608800,0.000000,14.097000>translate<0,0.035000,0> }#end		//SMD Capacitor 0402 C2 0.47uF 0402-CAP
#ifndef(pack_C3) #declare global_pack_C3=yes; object {CAP_SMD_CHIP_0402()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<18.262600,0.000000,25.146000>translate<0,0.035000,0> }#end		//SMD Capacitor 0402 C3 2.0pF 0402-CAP
#ifndef(pack_C4) #declare global_pack_C4=yes; object {CAP_SMD_CHIP_0402()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<21.259800,0.000000,28.117800>translate<0,0.035000,0> }#end		//SMD Capacitor 0402 C4 1.5pF 0402-CAP
#ifndef(pack_C5) #declare global_pack_C5=yes; object {CAP_SMD_CHIP_0402()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<12.623800,0.000000,23.063200>translate<0,0.035000,0> }#end		//SMD Capacitor 0402 C5 0.1uF 0402-CAP
#ifndef(pack_C6) #declare global_pack_C6=yes; object {CAP_SMD_CHIP_0402()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<15.011400,0.000000,25.146000>translate<0,0.035000,0> }#end		//SMD Capacitor 0402 C6 0.047uF 0402-CAP
#ifndef(pack_C7) #declare global_pack_C7=yes; object {CAP_SMD_CHIP_0402()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<22.529800,0.000000,18.821400>translate<0,0.035000,0> }#end		//SMD Capacitor 0402 C7 0.047uF 0402-CAP
#ifndef(pack_C8) #declare global_pack_C8=yes; object {CAP_SMD_CHIP_0402()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<16.433800,0.000000,14.097000>translate<0,0.035000,0> }#end		//SMD Capacitor 0402 C8 0.047uF 0402-CAP
#ifndef(pack_C9) #declare global_pack_C9=yes; object {CAP_SMD_CHIP_0402()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<19.634200,0.000000,11.506200>translate<0,0.035000,0> }#end		//SMD Capacitor 0402 C9 0.047uF 0402-CAP
#ifndef(pack_C10) #declare global_pack_C10=yes; object {CAP_SMD_CHIP_0402()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<23.723600,0.000000,18.821400>translate<0,0.035000,0> }#end		//SMD Capacitor 0402 C10 0.047uF 0402-CAP
#ifndef(pack_C11) #declare global_pack_C11=yes; object {CAP_SMD_CHIP_0402()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<22.529800,0.000000,21.844000>translate<0,0.035000,0> }#end		//SMD Capacitor 0402 C11 0.047uF 0402-CAP
#ifndef(pack_C14) #declare global_pack_C14=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<14.376400,0.000000,8.991600>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C14 2.2uF 0805
#ifndef(pack_C15) #declare global_pack_C15=yes; object {CAP_SMD_CHIP_0402()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<17.856200,0.000000,14.097000>translate<0,0.035000,0> }#end		//SMD Capacitor 0402 C15 0.47uF 0402-CAP
#ifndef(pack_D1) #declare global_pack_D1=yes; object {DIODE_SMD_LED_CHIP_0603(Red,0.500000,0.000000,)translate<0,0,0> rotate<0,90.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<13.589000,0.000000,14.097000>translate<0,0.035000,0> }#end		//SMD-LED im 0603 D1 RED LED-0603
#ifndef(pack_D2) #declare global_pack_D2=yes; object {DIODE_SMD_LED_CHIP_0603(Red,0.500000,0.000000,)translate<0,0,0> rotate<0,90.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<13.563600,0.000000,11.150600>translate<0,0.035000,0> }#end		//SMD-LED im 0603 D2 GREEN LED-0603
#ifndef(pack_L2) #declare global_pack_L2=yes; object {CAP_SMD_CHIP_0402()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<19.558000,0.000000,26.441400>translate<0,0.035000,0> }#end		//SMD Capacitor 0402 L2 1.8nH C0402
#ifndef(pack_R1) #declare global_pack_R1=yes; object {RES_SMD_CHIP_0402("0R0",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<14.986000,0.000000,14.097000>translate<0,0.035000,0> }#end		//SMD Resistor 0402 R1  0402-RES
#ifndef(pack_R2) #declare global_pack_R2=yes; object {RES_SMD_CHIP_0402("0R0",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<14.935200,0.000000,11.201400>translate<0,0.035000,0> }#end		//SMD Resistor 0402 R2  0402-RES
#ifndef(pack_U_1) #declare global_pack_U_1=yes; object {IC_SMD_MLF_40_050MM("CYRF69103",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<17.475200,0.000000,20.574000>translate<0,0.035000,0> }#end		//SMD IC MLF40 Package U$1 CYRF69103 QFN40
#ifndef(pack_Y1) #declare global_pack_Y1=yes; object {SPC_CRES_ABRACON_ABM3B_GRND("",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<24.028400,0.000000,13.766800>}#end		//SMD Ceramic Resonator Y1  CRYSTAL-SMD-5X3
}//End union
#end
#if(pcb_pads_smds=on)
//Pads&SMD/Parts
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<21.920200,0.000000,25.156400>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<21.920200,0.000000,26.456400>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<19.608800,0.000000,14.747000>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<19.608800,0.000000,13.447000>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<18.912600,0.000000,25.146000>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<17.612600,0.000000,25.146000>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<21.909800,0.000000,28.117800>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<20.609800,0.000000,28.117800>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<12.623800,0.000000,22.413200>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<12.623800,0.000000,23.713200>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<15.661400,0.000000,25.146000>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<14.361400,0.000000,25.146000>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<22.529800,0.000000,18.171400>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<22.529800,0.000000,19.471400>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<16.433800,0.000000,14.747000>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<16.433800,0.000000,13.447000>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<19.634200,0.000000,12.156200>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<19.634200,0.000000,10.856200>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<23.723600,0.000000,19.471400>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<23.723600,0.000000,18.171400>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<22.529800,0.000000,21.194000>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<22.529800,0.000000,22.494000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<13.476400,0.000000,8.991600>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<15.276400,0.000000,8.991600>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<17.856200,0.000000,13.447000>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<17.856200,0.000000,14.747000>}
object{TOOLS_PCB_SMD(0.800000,0.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<13.589000,0.000000,13.347000>}
object{TOOLS_PCB_SMD(0.800000,0.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<13.589000,0.000000,14.847000>}
object{TOOLS_PCB_SMD(0.800000,0.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<13.563600,0.000000,10.400600>}
object{TOOLS_PCB_SMD(0.800000,0.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<13.563600,0.000000,11.900600>}
object{TOOLS_PCB_SMD(2.540000,1.270000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<14.478000,0.000000,27.178000>}
object{TOOLS_PCB_SMD(2.540000,1.270000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<10.414000,0.000000,17.018000>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<18.908000,0.000000,26.441400>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<20.208000,0.000000,26.441400>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<25.056200,0.000000,25.171400>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<23.356200,0.000000,25.171400>}
object{TOOLS_PCB_SMD(2.540000,1.270000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<10.414000,0.000000,11.938000>}
object{TOOLS_PCB_SMD(2.540000,1.270000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<10.414000,0.000000,14.478000>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<14.986000,0.000000,14.747000>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<14.986000,0.000000,13.447000>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<14.935200,0.000000,11.851400>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<14.935200,0.000000,10.551400>}
object{TOOLS_PCB_SMD(2.540000,1.270000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<10.414000,0.000000,19.558000>}
object{TOOLS_PCB_SMD(2.540000,1.270000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<10.414000,0.000000,24.638000>}
object{TOOLS_PCB_SMD(2.540000,1.270000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<10.414000,-1.537000,24.638000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<20.450200,0.000000,18.324000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<20.450200,0.000000,18.824000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<20.450200,0.000000,19.324000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<20.450200,0.000000,19.824000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<20.450200,0.000000,20.324000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<20.450200,0.000000,20.824000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<20.450200,0.000000,21.324000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<20.450200,0.000000,21.824000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<20.450200,0.000000,22.324000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<20.450200,0.000000,22.824000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<19.725200,0.000000,23.549000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<19.225200,0.000000,23.549000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<18.725200,0.000000,23.549000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<18.225200,0.000000,23.549000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<17.725200,0.000000,23.549000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<17.225200,0.000000,23.549000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<16.725200,0.000000,23.549000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<16.225200,0.000000,23.549000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<15.725200,0.000000,23.549000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<15.225200,0.000000,23.549000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<14.500200,0.000000,22.824000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<14.500200,0.000000,22.324000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<14.500200,0.000000,21.824000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<14.500200,0.000000,21.324000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<14.500200,0.000000,20.824000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<14.500200,0.000000,20.324000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<14.500200,0.000000,19.824000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<14.500200,0.000000,19.324000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<14.500200,0.000000,18.824000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<14.500200,0.000000,18.324000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<15.225200,0.000000,17.599000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<15.725200,0.000000,17.599000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<16.225200,0.000000,17.599000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<16.725200,0.000000,17.599000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<17.225200,0.000000,17.599000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<17.725200,0.000000,17.599000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<18.225200,0.000000,17.599000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<18.725200,0.000000,17.599000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<19.225200,0.000000,17.599000>}
object{TOOLS_PCB_SMD(0.280000,0.850000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<19.725200,0.000000,17.599000>}
object{TOOLS_PCB_SMD(4.500000,4.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<17.475200,0.000000,20.574000>}
object{TOOLS_PCB_SMD(2.540000,1.270000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<10.414000,0.000000,9.525000>}
object{TOOLS_PCB_SMD(2.540000,1.270000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<10.414000,-1.537000,27.178000>}
object{TOOLS_PCB_SMD(2.540000,1.270000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<10.414000,0.000000,27.178000>}
object{TOOLS_PCB_SMD(1.900000,1.100000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<25.878400,0.000000,14.916800>}
object{TOOLS_PCB_SMD(1.900000,1.100000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<22.178400,0.000000,14.916800>}
object{TOOLS_PCB_SMD(1.900000,1.100000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<22.178400,0.000000,12.616800>}
object{TOOLS_PCB_SMD(1.900000,1.100000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<25.878400,0.000000,12.616800>}
object{TOOLS_PCB_SMD(2.540000,1.270000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<10.414000,0.000000,22.098000>}
//Pads/Vias
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<14.300200,0,15.849600> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<13.411200,0,17.627600> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<23.647400,0,17.195800> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<19.253200,0,20.574000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<18.389600,0,20.574000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<17.475200,0,20.574000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<16.560800,0,20.574000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<15.697200,0,20.574000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<19.253200,0,19.659600> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<18.389600,0,19.659600> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<17.475200,0,19.659600> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<16.560800,0,19.659600> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<15.697200,0,19.659600> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<19.253200,0,18.770600> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<18.389600,0,18.770600> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<17.475200,0,18.770600> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<16.560800,0,18.770600> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<15.697200,0,18.770600> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<16.560800,0,21.513800> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<15.697200,0,21.513800> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<15.697200,0,22.377400> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<12.776200,0,25.298400> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<18.567400,0,10.871200> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<17.195800,0,12.547600> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<10.414000,0,10.769600> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<10.414000,0,13.208000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<10.414000,0,15.798800> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<10.414000,0,18.288000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<10.414000,0,20.828000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<10.414000,0,23.418800> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<10.414000,0,28.702000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<10.414000,0,8.331200> texture{col_wrs}}
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
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<12.446000,0,8.331200> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<16.357600,0,8.382000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<18.897600,0,8.382000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<16.357600,0,10.871200> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<21.234400,0,8.382000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<14.325600,0,23.926800> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<12.395200,0,26.873200> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<12.395200,0,27.889200> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<24.384000,0,15.925800> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<21.234400,0,10.922000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<23.622000,0,10.922000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<16.713200,0,27.787600> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<10.464800,0,25.908000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<23.622000,0,21.590000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<26.670000,0,10.922000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<26.670000,0,13.716000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<26.670000,0,16.205200> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<26.670000,0,18.542000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<26.670000,0,21.082000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<26.670000,0,23.622000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<26.670000,0,8.382000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<26.670000,0,25.654000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<26.670000,0,27.178000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.533400,0.381000,1,16,1,0) translate<14.655800,0,29.972000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<24.434800,0,13.665200> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<15.570200,0,12.649200> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<20.015200,0,15.849600> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<17.475200,0,21.513800> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<18.389600,0,21.513800> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<19.253200,0,21.513800> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<16.560800,0,22.377400> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<17.475200,0,22.377400> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<18.389600,0,22.377400> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<19.253200,0,22.377400> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<21.488400,0,20.116800> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<13.614400,0,22.402800> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<16.078200,0,16.027400> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<15.011400,0,26.035000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.609600,0.304800,1,16,1,0) translate<22.377400,0,17.094200> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<11.557000,0,26.035000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<13.868400,0,16.560800> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<16.103600,0,16.002000> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<19.761200,0,16.662400> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<12.750800,0,21.539200> texture{col_wrs}}
object{TOOLS_PCB_VIA(0.457200,0.304800,1,16,1,0) translate<9.550400,0,25.806400> texture{col_wrs}}
#end
#if(pcb_wires=on)
union{
//Signals
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.550400,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.550400,-1.535000,25.806400>}
box{<0,0,-0.152400><2.641600,0.035000,0.152400> rotate<0,90.000000,0> translate<9.550400,-1.535000,25.806400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.550400,0.000000,25.806400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.550400,0.000000,26.314400>}
box{<0,0,-0.152400><0.508000,0.035000,0.152400> rotate<0,90.000000,0> translate<9.550400,0.000000,26.314400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.550400,0.000000,26.314400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.414000,0.000000,27.178000>}
box{<0,0,-0.152400><1.221315,0.035000,0.152400> rotate<0,-44.997030,0> translate<9.550400,0.000000,26.314400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.414000,0.000000,24.638000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.515600,0.000000,24.536400>}
box{<0,0,-0.152400><0.143684,0.035000,0.152400> rotate<0,44.997030,0> translate<10.414000,0.000000,24.638000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.414000,0.000000,19.558000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.664000,0.000000,20.062000>}
box{<0,0,-0.127000><0.562598,0.035000,0.127000> rotate<0,-63.612930,0> translate<10.414000,0.000000,19.558000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<10.414000,0.000000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<10.871200,0.000000,21.640800>}
box{<0,0,-0.101600><0.646578,0.035000,0.101600> rotate<0,44.997030,0> translate<10.414000,0.000000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.550400,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.176000,-1.535000,21.539200>}
box{<0,0,-0.152400><2.298946,0.035000,0.152400> rotate<0,44.997030,0> translate<9.550400,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<10.414000,0.000000,19.558000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<11.180000,0.000000,20.324000>}
box{<0,0,-0.101600><1.083288,0.035000,0.101600> rotate<0,-44.997030,0> translate<10.414000,0.000000,19.558000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.414000,0.000000,9.525000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.469800,0.000000,9.525000>}
box{<0,0,-0.152400><1.055800,0.035000,0.152400> rotate<0,0.000000,0> translate<10.414000,0.000000,9.525000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<10.664000,0.000000,20.062000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<11.519600,0.000000,19.206400>}
box{<0,0,-0.101600><1.210001,0.035000,0.101600> rotate<0,44.997030,0> translate<10.664000,0.000000,20.062000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.414000,-1.535000,27.178000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.557000,-1.535000,26.035000>}
box{<0,0,-0.152400><1.616446,0.035000,0.152400> rotate<0,44.997030,0> translate<10.414000,-1.535000,27.178000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<10.871200,0.000000,21.640800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<11.887200,0.000000,21.640800>}
box{<0,0,-0.101600><1.016000,0.035000,0.101600> rotate<0,0.000000,0> translate<10.871200,0.000000,21.640800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<10.414000,0.000000,14.478000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<11.938000,0.000000,16.002000>}
box{<0,0,-0.101600><2.155261,0.035000,0.101600> rotate<0,-44.997030,0> translate<10.414000,0.000000,14.478000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<11.938000,0.000000,17.983200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<11.938000,0.000000,16.002000>}
box{<0,0,-0.101600><1.981200,0.035000,0.101600> rotate<0,-90.000000,0> translate<11.938000,0.000000,16.002000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<10.414000,0.000000,11.938000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<11.988800,0.000000,13.512800>}
box{<0,0,-0.101600><2.227104,0.035000,0.101600> rotate<0,-44.997030,0> translate<10.414000,0.000000,11.938000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<11.988800,0.000000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<11.988800,0.000000,13.512800>}
box{<0,0,-0.101600><1.930400,0.035000,0.101600> rotate<0,-90.000000,0> translate<11.988800,0.000000,13.512800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<10.414000,0.000000,17.018000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<12.090400,0.000000,18.694400>}
box{<0,0,-0.101600><2.370788,0.035000,0.101600> rotate<0,-44.997030,0> translate<10.414000,0.000000,17.018000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<12.090400,0.000000,19.558000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<12.090400,0.000000,18.694400>}
box{<0,0,-0.101600><0.863600,0.035000,0.101600> rotate<0,-90.000000,0> translate<12.090400,0.000000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<11.988800,0.000000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<12.344400,0.000000,15.798800>}
box{<0,0,-0.101600><0.502894,0.035000,0.101600> rotate<0,-44.997030,0> translate<11.988800,0.000000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<12.344400,0.000000,17.830800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<12.344400,0.000000,15.798800>}
box{<0,0,-0.101600><2.032000,0.035000,0.101600> rotate<0,-90.000000,0> translate<12.344400,0.000000,15.798800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<12.090400,0.000000,19.558000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<12.356400,0.000000,19.824000>}
box{<0,0,-0.101600><0.376181,0.035000,0.101600> rotate<0,-44.997030,0> translate<12.090400,0.000000,19.558000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.469800,0.000000,9.525000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.511200,0.000000,10.566400>}
box{<0,0,-0.203200><1.472762,0.035000,0.203200> rotate<0,-44.997030,0> translate<11.469800,0.000000,9.525000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.511200,0.000000,9.956800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.511200,0.000000,10.566400>}
box{<0,0,-0.203200><0.609600,0.035000,0.203200> rotate<0,90.000000,0> translate<12.511200,0.000000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.511200,0.000000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.511200,0.000000,15.305200>}
box{<0,0,-0.203200><4.738800,0.035000,0.203200> rotate<0,90.000000,0> translate<12.511200,0.000000,15.305200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.623800,0.000000,22.413200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.623800,0.000000,21.666200>}
box{<0,0,-0.152400><0.747000,0.035000,0.152400> rotate<0,-90.000000,0> translate<12.623800,0.000000,21.666200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.414000,-1.535000,24.638000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.649200,-1.535000,22.402800>}
box{<0,0,-0.152400><3.161050,0.035000,0.152400> rotate<0,44.997030,0> translate<10.414000,-1.535000,24.638000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<11.887200,0.000000,21.640800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<12.704000,0.000000,20.824000>}
box{<0,0,-0.101600><1.155130,0.035000,0.101600> rotate<0,44.997030,0> translate<11.887200,0.000000,21.640800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.176000,-1.535000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.750800,-1.535000,21.539200>}
box{<0,0,-0.152400><1.574800,0.035000,0.152400> rotate<0,0.000000,0> translate<11.176000,-1.535000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.623800,0.000000,21.666200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.750800,0.000000,21.539200>}
box{<0,0,-0.152400><0.179605,0.035000,0.152400> rotate<0,44.997030,0> translate<12.623800,0.000000,21.666200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.852400,0.000000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.877800,0.000000,25.120600>}
box{<0,0,-0.152400><0.035921,0.035000,0.152400> rotate<0,44.997030,0> translate<12.852400,0.000000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<12.623800,0.000000,22.413200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<13.213000,0.000000,21.824000>}
box{<0,0,-0.101600><0.833255,0.035000,0.101600> rotate<0,44.997030,0> translate<12.623800,0.000000,22.413200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<11.938000,0.000000,17.983200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<13.278800,0.000000,19.324000>}
box{<0,0,-0.101600><1.896178,0.035000,0.101600> rotate<0,-44.997030,0> translate<11.938000,0.000000,17.983200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<12.344400,0.000000,17.830800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<13.337600,0.000000,18.824000>}
box{<0,0,-0.101600><1.404597,0.035000,0.101600> rotate<0,-44.997030,0> translate<12.344400,0.000000,17.830800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.515600,0.000000,24.536400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.360400,0.000000,24.536400>}
box{<0,0,-0.152400><2.844800,0.035000,0.152400> rotate<0,0.000000,0> translate<10.515600,0.000000,24.536400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.511200,0.000000,9.956800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.476400,0.000000,8.991600>}
box{<0,0,-0.203200><1.364999,0.035000,0.203200> rotate<0,44.997030,0> translate<12.511200,0.000000,9.956800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.649200,-1.535000,22.402800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.614400,-1.535000,22.402800>}
box{<0,0,-0.152400><0.965200,0.035000,0.152400> rotate<0,0.000000,0> translate<12.649200,-1.535000,22.402800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.360400,0.000000,24.536400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.665200,0.000000,24.231600>}
box{<0,0,-0.152400><0.431052,0.035000,0.152400> rotate<0,44.997030,0> translate<13.360400,0.000000,24.536400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.665200,0.000000,23.012400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.665200,0.000000,24.231600>}
box{<0,0,-0.152400><1.219200,0.035000,0.152400> rotate<0,90.000000,0> translate<13.665200,0.000000,24.231600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.614400,0.000000,22.402800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.693200,0.000000,22.324000>}
box{<0,0,-0.152400><0.111440,0.035000,0.152400> rotate<0,44.997030,0> translate<13.614400,0.000000,22.402800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.511200,0.000000,15.305200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.766800,0.000000,16.560800>}
box{<0,0,-0.203200><1.775687,0.035000,0.203200> rotate<0,-44.997030,0> translate<12.511200,0.000000,15.305200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.665200,0.000000,23.012400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.853600,0.000000,22.824000>}
box{<0,0,-0.152400><0.266438,0.035000,0.152400> rotate<0,44.997030,0> translate<13.665200,0.000000,23.012400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.766800,0.000000,16.560800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.868400,0.000000,16.560800>}
box{<0,0,-0.203200><0.101600,0.035000,0.203200> rotate<0,0.000000,0> translate<13.766800,0.000000,16.560800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.868400,-1.535000,16.560800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.970000,-1.535000,16.662400>}
box{<0,0,-0.127000><0.143684,0.035000,0.127000> rotate<0,-44.997030,0> translate<13.868400,-1.535000,16.560800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<13.337600,0.000000,18.824000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<14.500200,0.000000,18.824000>}
box{<0,0,-0.101600><1.162600,0.035000,0.101600> rotate<0,0.000000,0> translate<13.337600,0.000000,18.824000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<13.278800,0.000000,19.324000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<14.500200,0.000000,19.324000>}
box{<0,0,-0.101600><1.221400,0.035000,0.101600> rotate<0,0.000000,0> translate<13.278800,0.000000,19.324000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<12.356400,0.000000,19.824000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<14.500200,0.000000,19.824000>}
box{<0,0,-0.101600><2.143800,0.035000,0.101600> rotate<0,0.000000,0> translate<12.356400,0.000000,19.824000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<11.180000,0.000000,20.324000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<14.500200,0.000000,20.324000>}
box{<0,0,-0.101600><3.320200,0.035000,0.101600> rotate<0,0.000000,0> translate<11.180000,0.000000,20.324000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<12.704000,0.000000,20.824000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<14.500200,0.000000,20.824000>}
box{<0,0,-0.101600><1.796200,0.035000,0.101600> rotate<0,0.000000,0> translate<12.704000,0.000000,20.824000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<13.213000,0.000000,21.824000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<14.500200,0.000000,21.824000>}
box{<0,0,-0.101600><1.287200,0.035000,0.101600> rotate<0,0.000000,0> translate<13.213000,0.000000,21.824000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.693200,0.000000,22.324000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.500200,0.000000,22.324000>}
box{<0,0,-0.152400><0.807000,0.035000,0.152400> rotate<0,0.000000,0> translate<13.693200,0.000000,22.324000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.853600,0.000000,22.824000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.500200,0.000000,22.824000>}
box{<0,0,-0.152400><0.646600,0.035000,0.152400> rotate<0,0.000000,0> translate<13.853600,0.000000,22.824000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.563600,0.000000,10.400600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.784400,0.000000,10.400600>}
box{<0,0,-0.127000><1.220800,0.035000,0.127000> rotate<0,0.000000,0> translate<13.563600,0.000000,10.400600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.589000,0.000000,13.347000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.886000,0.000000,13.347000>}
box{<0,0,-0.127000><1.297000,0.035000,0.127000> rotate<0,0.000000,0> translate<13.589000,0.000000,13.347000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.784400,0.000000,10.400600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.935200,0.000000,10.551400>}
box{<0,0,-0.127000><0.213263,0.035000,0.127000> rotate<0,-44.997030,0> translate<14.784400,0.000000,10.400600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.886000,0.000000,13.347000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.986000,0.000000,13.447000>}
box{<0,0,-0.127000><0.141421,0.035000,0.127000> rotate<0,-44.997030,0> translate<14.886000,0.000000,13.347000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.986000,0.000000,16.103600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.986000,0.000000,14.747000>}
box{<0,0,-0.127000><1.356600,0.035000,0.127000> rotate<0,-90.000000,0> translate<14.986000,0.000000,14.747000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.795000,0.000000,35.814000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.986000,0.000000,35.814000>}
box{<0,0,-0.254000><4.191000,0.035000,0.254000> rotate<0,0.000000,0> translate<10.795000,0.000000,35.814000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.986000,0.000000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.986000,0.000000,35.814000>}
box{<0,0,-0.254000><3.810000,0.035000,0.254000> rotate<0,90.000000,0> translate<14.986000,0.000000,35.814000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.970000,-1.535000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.011400,-1.535000,16.662400>}
box{<0,0,-0.127000><1.041400,0.035000,0.127000> rotate<0,0.000000,0> translate<13.970000,-1.535000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.557000,0.000000,26.035000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.011400,0.000000,26.035000>}
box{<0,0,-0.152400><3.454400,0.035000,0.152400> rotate<0,0.000000,0> translate<11.557000,0.000000,26.035000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.011400,-1.535000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.011400,-1.535000,26.035000>}
box{<0,0,-0.203200><9.372600,0.035000,0.203200> rotate<0,90.000000,0> translate<15.011400,-1.535000,26.035000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.225200,0.000000,23.549000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.240000,0.000000,23.563800>}
box{<0,0,-0.127000><0.020930,0.035000,0.127000> rotate<0,-44.997030,0> translate<15.225200,0.000000,23.549000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.240000,0.000000,23.563800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.240000,0.000000,24.384000>}
box{<0,0,-0.127000><0.820200,0.035000,0.127000> rotate<0,90.000000,0> translate<15.240000,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.240000,0.000000,24.434800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.290800,0.000000,24.384000>}
box{<0,0,-0.127000><0.071842,0.035000,0.127000> rotate<0,44.997030,0> translate<15.240000,0.000000,24.434800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.011400,-1.535000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.646400,-1.535000,16.027400>}
box{<0,0,-0.127000><0.898026,0.035000,0.127000> rotate<0,44.997030,0> translate<15.011400,-1.535000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.011400,0.000000,26.035000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.661400,0.000000,25.740600>}
box{<0,0,-0.152400><0.713562,0.035000,0.152400> rotate<0,24.365261,0> translate<15.011400,0.000000,26.035000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.661400,0.000000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.661400,0.000000,25.740600>}
box{<0,0,-0.152400><0.594600,0.035000,0.152400> rotate<0,90.000000,0> translate<15.661400,0.000000,25.740600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.986000,0.000000,16.103600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.725200,0.000000,16.842800>}
box{<0,0,-0.127000><1.045387,0.035000,0.127000> rotate<0,-44.997030,0> translate<14.986000,0.000000,16.103600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.725200,0.000000,17.599000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.725200,0.000000,16.842800>}
box{<0,0,-0.127000><0.756200,0.035000,0.127000> rotate<0,-90.000000,0> translate<15.725200,0.000000,16.842800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.290800,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.849600,0.000000,24.384000>}
box{<0,0,-0.127000><0.558800,0.035000,0.127000> rotate<0,0.000000,0> translate<15.290800,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.646400,-1.535000,16.027400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.078200,-1.535000,16.027400>}
box{<0,0,-0.127000><0.431800,0.035000,0.127000> rotate<0,0.000000,0> translate<15.646400,-1.535000,16.027400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.103600,0.000000,16.002000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.103600,0.000000,15.077200>}
box{<0,0,-0.127000><0.924800,0.035000,0.127000> rotate<0,-90.000000,0> translate<16.103600,0.000000,15.077200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.078200,-1.535000,16.027400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.103600,-1.535000,16.002000>}
box{<0,0,-0.127000><0.035921,0.035000,0.127000> rotate<0,44.997030,0> translate<16.078200,-1.535000,16.027400> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.986000,0.000000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.129000,0.000000,32.004000>}
box{<0,0,-0.254000><1.143000,0.035000,0.254000> rotate<0,0.000000,0> translate<14.986000,0.000000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.129000,0.000000,35.814000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.129000,0.000000,32.004000>}
box{<0,0,-0.254000><3.810000,0.035000,0.254000> rotate<0,-90.000000,0> translate<16.129000,0.000000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.078200,0.000000,16.027400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.205200,0.000000,16.154400>}
box{<0,0,-0.127000><0.179605,0.035000,0.127000> rotate<0,-44.997030,0> translate<16.078200,0.000000,16.027400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.205200,0.000000,17.579000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.205200,0.000000,16.154400>}
box{<0,0,-0.127000><1.424600,0.035000,0.127000> rotate<0,-90.000000,0> translate<16.205200,0.000000,16.154400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.205200,0.000000,17.579000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.225200,0.000000,17.599000>}
box{<0,0,-0.127000><0.028284,0.035000,0.127000> rotate<0,-44.997030,0> translate<16.205200,0.000000,17.579000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.849600,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.225200,0.000000,24.008400>}
box{<0,0,-0.127000><0.531179,0.035000,0.127000> rotate<0,44.997030,0> translate<15.849600,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.225200,0.000000,23.549000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.225200,0.000000,24.008400>}
box{<0,0,-0.127000><0.459400,0.035000,0.127000> rotate<0,90.000000,0> translate<16.225200,0.000000,24.008400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<15.661400,0.000000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<16.271000,0.000000,24.536400>}
box{<0,0,-0.101600><0.862105,0.035000,0.101600> rotate<0,44.997030,0> translate<15.661400,0.000000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.103600,0.000000,15.077200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.433800,0.000000,14.747000>}
box{<0,0,-0.127000><0.466973,0.035000,0.127000> rotate<0,44.997030,0> translate<16.103600,0.000000,15.077200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.713200,0.000000,17.587000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.713200,0.000000,15.951200>}
box{<0,0,-0.127000><1.635800,0.035000,0.127000> rotate<0,-90.000000,0> translate<16.713200,0.000000,15.951200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.713200,0.000000,17.587000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.725200,0.000000,17.599000>}
box{<0,0,-0.127000><0.016971,0.035000,0.127000> rotate<0,-44.997030,0> translate<16.713200,0.000000,17.587000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.103600,-1.535000,16.002000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.764000,-1.535000,16.662400>}
box{<0,0,-0.127000><0.933947,0.035000,0.127000> rotate<0,-44.997030,0> translate<16.103600,-1.535000,16.002000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<16.271000,0.000000,24.536400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<16.865600,0.000000,24.536400>}
box{<0,0,-0.101600><0.594600,0.035000,0.101600> rotate<0,0.000000,0> translate<16.271000,0.000000,24.536400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.225200,0.000000,17.599000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.225200,0.000000,16.455200>}
box{<0,0,-0.127000><1.143800,0.035000,0.127000> rotate<0,-90.000000,0> translate<17.225200,0.000000,16.455200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<16.865600,0.000000,24.536400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<17.225200,0.000000,24.176800>}
box{<0,0,-0.101600><0.508551,0.035000,0.101600> rotate<0,44.997030,0> translate<16.865600,0.000000,24.536400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<17.225200,0.000000,23.549000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<17.225200,0.000000,24.176800>}
box{<0,0,-0.101600><0.627800,0.035000,0.101600> rotate<0,90.000000,0> translate<17.225200,0.000000,24.176800> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.129000,0.000000,35.814000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.272000,0.000000,35.814000>}
box{<0,0,-0.254000><1.143000,0.035000,0.254000> rotate<0,0.000000,0> translate<16.129000,0.000000,35.814000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.272000,0.000000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.272000,0.000000,35.814000>}
box{<0,0,-0.254000><3.810000,0.035000,0.254000> rotate<0,90.000000,0> translate<17.272000,0.000000,35.814000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.612600,0.000000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.627600,0.000000,25.131000>}
box{<0,0,-0.152400><0.021213,0.035000,0.152400> rotate<0,44.997030,0> translate<17.612600,0.000000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.627600,0.000000,24.434800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.627600,0.000000,25.131000>}
box{<0,0,-0.127000><0.696200,0.035000,0.127000> rotate<0,90.000000,0> translate<17.627600,0.000000,25.131000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.935200,0.000000,11.851400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.642600,0.000000,11.851400>}
box{<0,0,-0.127000><2.707400,0.035000,0.127000> rotate<0,0.000000,0> translate<14.935200,0.000000,11.851400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.725200,0.000000,17.599000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.725200,0.000000,16.564800>}
box{<0,0,-0.127000><1.034200,0.035000,0.127000> rotate<0,-90.000000,0> translate<17.725200,0.000000,16.564800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.433800,0.000000,14.747000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.733800,0.000000,13.447000>}
box{<0,0,-0.127000><1.838478,0.035000,0.127000> rotate<0,44.997030,0> translate<16.433800,0.000000,14.747000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.733800,0.000000,13.447000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.856200,0.000000,13.447000>}
box{<0,0,-0.127000><0.122400,0.035000,0.127000> rotate<0,0.000000,0> translate<17.733800,0.000000,13.447000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.856200,0.000000,14.808200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.856200,0.000000,14.747000>}
box{<0,0,-0.127000><0.061200,0.035000,0.127000> rotate<0,-90.000000,0> translate<17.856200,0.000000,14.747000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.713200,0.000000,15.951200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.856200,0.000000,14.808200>}
box{<0,0,-0.127000><1.616446,0.035000,0.127000> rotate<0,44.997030,0> translate<16.713200,0.000000,15.951200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.225200,0.000000,16.455200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.186400,0.000000,15.494000>}
box{<0,0,-0.127000><1.359342,0.035000,0.127000> rotate<0,44.997030,0> translate<17.225200,0.000000,16.455200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.627600,0.000000,24.434800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.225200,0.000000,23.837200>}
box{<0,0,-0.127000><0.845134,0.035000,0.127000> rotate<0,44.997030,0> translate<17.627600,0.000000,24.434800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.225200,0.000000,23.549000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.225200,0.000000,23.837200>}
box{<0,0,-0.127000><0.288200,0.035000,0.127000> rotate<0,90.000000,0> translate<18.225200,0.000000,23.837200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.725200,0.000000,16.564800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.389600,0.000000,15.900400>}
box{<0,0,-0.127000><0.939603,0.035000,0.127000> rotate<0,44.997030,0> translate<17.725200,0.000000,16.564800> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.272000,0.000000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<18.415000,0.000000,32.004000>}
box{<0,0,-0.254000><1.143000,0.035000,0.254000> rotate<0,0.000000,0> translate<17.272000,0.000000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<18.415000,0.000000,35.814000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<18.415000,0.000000,32.004000>}
box{<0,0,-0.254000><3.810000,0.035000,0.254000> rotate<0,-90.000000,0> translate<18.415000,0.000000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.186400,0.000000,15.494000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.542000,0.000000,15.494000>}
box{<0,0,-0.127000><0.355600,0.035000,0.127000> rotate<0,0.000000,0> translate<18.186400,0.000000,15.494000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.642600,0.000000,11.851400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.694400,0.000000,12.903200>}
box{<0,0,-0.127000><1.487470,0.035000,0.127000> rotate<0,-44.997030,0> translate<17.642600,0.000000,11.851400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.694400,0.000000,15.341600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.694400,0.000000,12.903200>}
box{<0,0,-0.127000><2.438400,0.035000,0.127000> rotate<0,-90.000000,0> translate<18.694400,0.000000,12.903200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.542000,0.000000,15.494000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.694400,0.000000,15.341600>}
box{<0,0,-0.127000><0.215526,0.035000,0.127000> rotate<0,44.997030,0> translate<18.542000,0.000000,15.494000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<18.725200,0.000000,23.549000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<18.725200,0.000000,24.958600>}
box{<0,0,-0.101600><1.409600,0.035000,0.101600> rotate<0,90.000000,0> translate<18.725200,0.000000,24.958600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.389600,0.000000,15.900400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.796000,0.000000,15.900400>}
box{<0,0,-0.127000><0.406400,0.035000,0.127000> rotate<0,0.000000,0> translate<18.389600,0.000000,15.900400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.908000,0.000000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.908000,0.000000,26.441400>}
box{<0,0,-0.152400><1.295400,0.035000,0.152400> rotate<0,90.000000,0> translate<18.908000,0.000000,26.441400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<18.725200,0.000000,24.958600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<18.912600,0.000000,25.146000>}
box{<0,0,-0.101600><0.265024,0.035000,0.101600> rotate<0,-44.997030,0> translate<18.725200,0.000000,24.958600> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<18.908000,0.000000,26.441400>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<18.953800,0.000000,26.441400>}
box{<0,0,-0.254000><0.045800,0.035000,0.254000> rotate<0,0.000000,0> translate<18.908000,0.000000,26.441400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.225200,0.000000,23.549000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.225200,0.000000,22.405400>}
box{<0,0,-0.127000><1.143600,0.035000,0.127000> rotate<0,-90.000000,0> translate<19.225200,0.000000,22.405400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.225200,0.000000,22.405400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.253200,0.000000,22.377400>}
box{<0,0,-0.127000><0.039598,0.035000,0.127000> rotate<0,44.997030,0> translate<19.225200,0.000000,22.405400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.405600,0.000000,15.290800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.405600,0.000000,14.950200>}
box{<0,0,-0.127000><0.340600,0.035000,0.127000> rotate<0,-90.000000,0> translate<19.405600,0.000000,14.950200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.796000,0.000000,15.900400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.405600,0.000000,15.290800>}
box{<0,0,-0.127000><0.862105,0.035000,0.127000> rotate<0,44.997030,0> translate<18.796000,0.000000,15.900400> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<18.415000,0.000000,35.814000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<19.558000,0.000000,35.814000>}
box{<0,0,-0.254000><1.143000,0.035000,0.254000> rotate<0,0.000000,0> translate<18.415000,0.000000,35.814000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<19.558000,0.000000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<19.558000,0.000000,35.814000>}
box{<0,0,-0.254000><3.810000,0.035000,0.254000> rotate<0,90.000000,0> translate<19.558000,0.000000,35.814000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.405600,0.000000,14.950200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.608800,0.000000,14.747000>}
box{<0,0,-0.127000><0.287368,0.035000,0.127000> rotate<0,44.997030,0> translate<19.405600,0.000000,14.950200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.725200,0.000000,17.599000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.725200,0.000000,16.698400>}
box{<0,0,-0.127000><0.900600,0.035000,0.127000> rotate<0,-90.000000,0> translate<19.725200,0.000000,16.698400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.225200,0.000000,17.599000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.725200,0.000000,17.599000>}
box{<0,0,-0.101600><0.500000,0.035000,0.101600> rotate<0,0.000000,0> translate<19.225200,0.000000,17.599000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.764000,-1.535000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.761200,-1.535000,16.662400>}
box{<0,0,-0.127000><2.997200,0.035000,0.127000> rotate<0,0.000000,0> translate<16.764000,-1.535000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.725200,0.000000,16.698400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.761200,0.000000,16.662400>}
box{<0,0,-0.127000><0.050912,0.035000,0.127000> rotate<0,44.997030,0> translate<19.725200,0.000000,16.698400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.725200,0.000000,23.549000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.953800,0.000000,23.777600>}
box{<0,0,-0.101600><0.323289,0.035000,0.101600> rotate<0,-44.997030,0> translate<19.725200,0.000000,23.549000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.953800,0.000000,25.654000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.953800,0.000000,25.156400>}
box{<0,0,-0.152400><0.497600,0.035000,0.152400> rotate<0,-90.000000,0> translate<19.953800,0.000000,25.156400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.953800,0.000000,23.777600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.953800,0.000000,25.654000>}
box{<0,0,-0.101600><1.876400,0.035000,0.101600> rotate<0,90.000000,0> translate<19.953800,0.000000,25.654000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.953800,0.000000,26.289000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.953800,0.000000,25.654000>}
box{<0,0,-0.152400><0.635000,0.035000,0.152400> rotate<0,-90.000000,0> translate<19.953800,0.000000,25.654000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.953800,0.000000,26.441400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.953800,0.000000,26.289000>}
box{<0,0,-0.152400><0.152400,0.035000,0.152400> rotate<0,-90.000000,0> translate<19.953800,0.000000,26.289000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.953800,0.000000,26.289000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.106200,0.000000,26.441400>}
box{<0,0,-0.152400><0.215526,0.035000,0.152400> rotate<0,-44.997030,0> translate<19.953800,0.000000,26.289000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.106200,0.000000,26.441400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.208000,0.000000,26.441400>}
box{<0,0,-0.152400><0.101800,0.035000,0.152400> rotate<0,0.000000,0> translate<20.106200,0.000000,26.441400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.634200,0.000000,12.156200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.284200,0.000000,12.156200>}
box{<0,0,-0.127000><0.650000,0.035000,0.127000> rotate<0,0.000000,0> translate<19.634200,0.000000,12.156200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.450200,0.000000,21.324000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.450200,0.000000,20.824000>}
box{<0,0,-0.101600><0.500000,0.035000,0.101600> rotate<0,-90.000000,0> translate<20.450200,0.000000,20.824000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.450200,0.000000,22.324000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.473000,0.000000,22.301200>}
box{<0,0,-0.101600><0.032244,0.035000,0.101600> rotate<0,44.997030,0> translate<20.450200,0.000000,22.324000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.761200,0.000000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.624800,0.000000,16.662400>}
box{<0,0,-0.127000><0.863600,0.035000,0.127000> rotate<0,0.000000,0> translate<19.761200,0.000000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<19.558000,0.000000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<20.701000,0.000000,32.004000>}
box{<0,0,-0.254000><1.143000,0.035000,0.254000> rotate<0,0.000000,0> translate<19.558000,0.000000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<20.701000,0.000000,35.814000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<20.701000,0.000000,32.004000>}
box{<0,0,-0.254000><3.810000,0.035000,0.254000> rotate<0,-90.000000,0> translate<20.701000,0.000000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.450200,0.000000,22.824000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.842800,0.000000,22.824000>}
box{<0,0,-0.152400><0.392600,0.035000,0.152400> rotate<0,0.000000,0> translate<20.450200,0.000000,22.824000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.284200,0.000000,12.156200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.878800,0.000000,12.750800>}
box{<0,0,-0.127000><0.840891,0.035000,0.127000> rotate<0,-44.997030,0> translate<20.284200,0.000000,12.156200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.624800,0.000000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.878800,0.000000,16.408400>}
box{<0,0,-0.127000><0.359210,0.035000,0.127000> rotate<0,44.997030,0> translate<20.624800,0.000000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.878800,0.000000,12.750800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.878800,0.000000,16.408400>}
box{<0,0,-0.127000><3.657600,0.035000,0.127000> rotate<0,90.000000,0> translate<20.878800,0.000000,16.408400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.473000,0.000000,22.301200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.132800,0.000000,22.301200>}
box{<0,0,-0.101600><0.659800,0.035000,0.101600> rotate<0,0.000000,0> translate<20.473000,0.000000,22.301200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.450200,0.000000,20.824000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.230400,0.000000,20.824000>}
box{<0,0,-0.101600><0.780200,0.035000,0.101600> rotate<0,0.000000,0> translate<20.450200,0.000000,20.824000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.450200,0.000000,18.824000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.257200,0.000000,18.824000>}
box{<0,0,-0.127000><0.807000,0.035000,0.127000> rotate<0,0.000000,0> translate<20.450200,0.000000,18.824000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.336000,0.000000,18.745200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.336000,0.000000,16.865600>}
box{<0,0,-0.127000><1.879600,0.035000,0.127000> rotate<0,-90.000000,0> translate<21.336000,0.000000,16.865600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.257200,0.000000,18.824000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.336000,0.000000,18.745200>}
box{<0,0,-0.127000><0.111440,0.035000,0.127000> rotate<0,44.997030,0> translate<21.257200,0.000000,18.824000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.450200,0.000000,19.324000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.417600,0.000000,19.324000>}
box{<0,0,-0.101600><0.967400,0.035000,0.101600> rotate<0,0.000000,0> translate<20.450200,0.000000,19.324000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.230400,0.000000,20.824000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.590000,0.000000,21.183600>}
box{<0,0,-0.101600><0.508551,0.035000,0.101600> rotate<0,-44.997030,0> translate<21.230400,0.000000,20.824000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.590000,0.000000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.590000,0.000000,21.183600>}
box{<0,0,-0.101600><0.660400,0.035000,0.101600> rotate<0,-90.000000,0> translate<21.590000,0.000000,21.183600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.132800,0.000000,22.301200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.590000,0.000000,21.844000>}
box{<0,0,-0.101600><0.646578,0.035000,0.101600> rotate<0,44.997030,0> translate<21.132800,0.000000,22.301200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.742400,0.000000,18.999200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.742400,0.000000,18.338800>}
box{<0,0,-0.101600><0.660400,0.035000,0.101600> rotate<0,-90.000000,0> translate<21.742400,0.000000,18.338800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.417600,0.000000,19.324000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.742400,0.000000,18.999200>}
box{<0,0,-0.101600><0.459337,0.035000,0.101600> rotate<0,44.997030,0> translate<21.417600,0.000000,19.324000> }
cylinder{<0,0,0><0,0.035000,0>0.000127 translate<21.844000,0.000000,28.575000>}
cylinder{<0,0,0><0,0.035000,0>0.000127 translate<21.844000,0.000000,28.183600>}
box{<0,0,-0.000127><0.391400,0.035000,0.000127> rotate<0,-90.000000,0> translate<21.844000,0.000000,28.183600> }
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
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.742400,0.000000,18.338800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.894800,0.000000,18.186400>}
box{<0,0,-0.101600><0.215526,0.035000,0.101600> rotate<0,44.997030,0> translate<21.742400,0.000000,18.338800> }
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
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.761200,-1.535000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.945600,-1.535000,16.662400>}
box{<0,0,-0.127000><2.184400,0.035000,0.127000> rotate<0,0.000000,0> translate<19.761200,-1.535000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.842800,0.000000,22.824000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.945600,0.000000,23.926800>}
box{<0,0,-0.152400><1.559595,0.035000,0.152400> rotate<0,-44.997030,0> translate<20.842800,0.000000,22.824000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.336000,0.000000,16.865600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.148800,0.000000,16.052800>}
box{<0,0,-0.127000><1.149473,0.035000,0.127000> rotate<0,44.997030,0> translate<21.336000,0.000000,16.865600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.178400,0.000000,12.616800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.210800,0.000000,12.649200>}
box{<0,0,-0.127000><0.045821,0.035000,0.127000> rotate<0,-44.997030,0> translate<22.178400,0.000000,12.616800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.945600,-1.535000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.377400,-1.535000,17.094200>}
box{<0,0,-0.127000><0.610657,0.035000,0.127000> rotate<0,-44.997030,0> translate<21.945600,-1.535000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.377400,0.000000,18.262600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.377400,0.000000,17.094200>}
box{<0,0,-0.152400><1.168400,0.035000,0.152400> rotate<0,-90.000000,0> translate<22.377400,0.000000,17.094200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.894800,0.000000,18.186400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.514800,0.000000,18.186400>}
box{<0,0,-0.101600><0.620000,0.035000,0.101600> rotate<0,0.000000,0> translate<21.894800,0.000000,18.186400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.377400,0.000000,18.262600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.519400,0.000000,18.262600>}
box{<0,0,-0.127000><0.142000,0.035000,0.127000> rotate<0,0.000000,0> translate<22.377400,0.000000,18.262600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.590000,0.000000,21.183600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.519400,0.000000,21.183600>}
box{<0,0,-0.101600><0.929400,0.035000,0.101600> rotate<0,0.000000,0> translate<21.590000,0.000000,21.183600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.514800,0.000000,18.186400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.529800,0.000000,18.171400>}
box{<0,0,-0.101600><0.021213,0.035000,0.101600> rotate<0,44.997030,0> translate<22.514800,0.000000,18.186400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.519400,0.000000,18.262600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.529800,0.000000,18.171400>}
box{<0,0,-0.127000><0.091791,0.035000,0.127000> rotate<0,83.488863,0> translate<22.519400,0.000000,18.262600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.529800,0.000000,19.471400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.529800,0.000000,19.562000>}
box{<0,0,-0.127000><0.090600,0.035000,0.127000> rotate<0,90.000000,0> translate<22.529800,0.000000,19.562000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.357000,0.000000,21.062000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.529800,0.000000,21.194000>}
box{<0,0,-0.127000><0.217448,0.035000,0.127000> rotate<0,-37.373341,0> translate<22.357000,0.000000,21.062000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.397800,0.000000,21.062000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.529800,0.000000,21.194000>}
box{<0,0,-0.127000><0.186676,0.035000,0.127000> rotate<0,-44.997030,0> translate<22.397800,0.000000,21.062000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.519400,0.000000,21.183600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.529800,0.000000,21.194000>}
box{<0,0,-0.101600><0.014708,0.035000,0.101600> rotate<0,-44.997030,0> translate<22.519400,0.000000,21.183600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.519400,0.000000,22.199600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.529800,0.000000,22.494000>}
box{<0,0,-0.152400><0.294584,0.035000,0.152400> rotate<0,-87.971000,0> translate<22.519400,0.000000,22.199600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.529800,0.000000,21.194000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.798800,0.000000,21.194000>}
box{<0,0,-0.127000><0.269000,0.035000,0.127000> rotate<0,0.000000,0> translate<22.529800,0.000000,21.194000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.377400,0.000000,17.094200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.936200,0.000000,16.535400>}
box{<0,0,-0.152400><0.790263,0.035000,0.152400> rotate<0,44.997030,0> translate<22.377400,0.000000,17.094200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.148800,0.000000,16.052800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.215600,0.000000,16.052800>}
box{<0,0,-0.127000><1.066800,0.035000,0.127000> rotate<0,0.000000,0> translate<22.148800,0.000000,16.052800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.920200,0.000000,25.156400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.341200,0.000000,25.156400>}
box{<0,0,-0.152400><1.421000,0.035000,0.152400> rotate<0,0.000000,0> translate<21.920200,0.000000,25.156400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.341200,0.000000,25.156400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.356200,0.000000,25.171400>}
box{<0,0,-0.152400><0.021213,0.035000,0.152400> rotate<0,-44.997030,0> translate<23.341200,0.000000,25.156400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.210800,0.000000,12.649200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.520400,0.000000,12.649200>}
box{<0,0,-0.127000><1.309600,0.035000,0.127000> rotate<0,0.000000,0> translate<22.210800,0.000000,12.649200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.520400,0.000000,12.649200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.723600,0.000000,12.852400>}
box{<0,0,-0.127000><0.287368,0.035000,0.127000> rotate<0,-44.997030,0> translate<23.520400,0.000000,12.649200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.723600,0.000000,15.544800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.723600,0.000000,12.852400>}
box{<0,0,-0.127000><2.692400,0.035000,0.127000> rotate<0,-90.000000,0> translate<23.723600,0.000000,12.852400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.215600,0.000000,16.052800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.723600,0.000000,15.544800>}
box{<0,0,-0.127000><0.718420,0.035000,0.127000> rotate<0,44.997030,0> translate<23.215600,0.000000,16.052800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.647400,0.000000,17.195800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.723600,0.000000,18.171400>}
box{<0,0,-0.152400><0.978571,0.035000,0.152400> rotate<0,-85.528291,0> translate<23.647400,0.000000,17.195800> }
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
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.945600,0.000000,23.926800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.790400,0.000000,23.926800>}
box{<0,0,-0.152400><2.844800,0.035000,0.152400> rotate<0,0.000000,0> translate<21.945600,0.000000,23.926800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.790400,0.000000,23.926800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.044400,0.000000,24.180800>}
box{<0,0,-0.152400><0.359210,0.035000,0.152400> rotate<0,-44.997030,0> translate<24.790400,0.000000,23.926800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.044400,0.000000,24.180800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.044400,0.000000,25.159600>}
box{<0,0,-0.152400><0.978800,0.035000,0.152400> rotate<0,90.000000,0> translate<25.044400,0.000000,25.159600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.044400,0.000000,25.159600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.056200,0.000000,25.171400>}
box{<0,0,-0.152400><0.016688,0.035000,0.152400> rotate<0,-44.997030,0> translate<25.044400,0.000000,25.159600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.056200,0.000000,25.171400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.450800,0.000000,25.157800>}
box{<0,0,-0.152400><0.394834,0.035000,0.152400> rotate<0,1.973804,0> translate<25.056200,0.000000,25.171400> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,22.956188>}
box{<0,0,-0.076200><15.259991,0.035000,0.076200> rotate<0,90.000000,0> translate<9.220197,-1.535000,22.956188> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,7.696197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,7.696197>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,7.696197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,7.696197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,7.696197>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,7.696197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,7.772400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,7.772400>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,7.772400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,7.772400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,7.772400>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,7.772400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,7.924800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,7.924800>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,7.924800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,7.924800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,7.924800>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,7.924800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,8.077200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.773959,0.000000,8.077200>}
box{<0,0,-0.076200><5.553762,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,8.077200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,8.077200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,8.077200>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,8.077200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,8.229600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.915109,0.000000,8.229600>}
box{<0,0,-0.076200><3.694912,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,8.229600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,8.229600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,8.229600>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,8.229600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.847800,0.000000,8.382000>}
box{<0,0,-0.076200><3.627603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,8.382000>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.847800,0.000000,8.534400>}
box{<0,0,-0.076200><3.627603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,8.534400> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.810625,0.000000,12.801597>}
box{<0,0,-0.076200><1.590428,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,12.801597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,12.801600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.810631,0.000000,12.801600>}
box{<0,0,-0.076200><1.590434,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,12.801600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,12.801600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,12.801600>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,12.801600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.963031,0.000000,12.954000>}
box{<0,0,-0.076200><1.742834,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,12.954000>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,13.106400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.115431,0.000000,13.106400>}
box{<0,0,-0.076200><1.895234,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,13.106400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,13.106400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,13.106400>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,13.106400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,13.258800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.267831,0.000000,13.258800>}
box{<0,0,-0.076200><2.047634,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,13.258800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,13.258800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,13.258800>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,13.258800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.420231,0.000000,13.411200>}
box{<0,0,-0.076200><2.200034,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,13.411200>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,13.563600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.572631,0.000000,13.563600>}
box{<0,0,-0.076200><2.352434,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,13.563600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,13.563600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,13.563600>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,13.563600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,13.614400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.623431,0.000000,13.614400>}
box{<0,0,-0.076200><2.403234,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,13.614400> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,14.782800>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,14.782800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,14.935200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,14.935200>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,14.935200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,15.087600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,15.087600>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,15.087600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,15.240000>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,15.341597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,16.154400>}
box{<0,0,-0.076200><0.812803,0.035000,0.076200> rotate<0,90.000000,0> translate<9.220197,0.000000,16.154400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,15.341597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.810625,0.000000,15.341597>}
box{<0,0,-0.076200><1.590428,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,15.341597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,15.392400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.861428,0.000000,15.392400>}
box{<0,0,-0.076200><1.641231,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,15.392400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,15.392400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,15.392400>}
box{<0,0,-0.076200><17.754603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,15.392400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,15.544800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.013828,0.000000,15.544800>}
box{<0,0,-0.076200><1.793631,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,15.544800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,15.544800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.806456,-1.535000,15.544800>}
box{<0,0,-0.076200><6.586259,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,15.544800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,15.697200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.166228,0.000000,15.697200>}
box{<0,0,-0.076200><1.946031,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,15.697200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,15.697200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.473703,-1.535000,15.697200>}
box{<0,0,-0.076200><6.253506,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,15.697200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.318628,0.000000,15.849600>}
box{<0,0,-0.076200><2.098431,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.321303,-1.535000,15.849600>}
box{<0,0,-0.076200><6.101106,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,16.002000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.471028,0.000000,16.002000>}
box{<0,0,-0.076200><2.250831,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,16.002000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,16.002000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.168903,-1.535000,16.002000>}
box{<0,0,-0.076200><5.948706,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,16.002000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,16.154400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.607800,0.000000,16.154400>}
box{<0,0,-0.076200><2.387603,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,16.154400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,16.154400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.628219,-1.535000,16.154400>}
box{<0,0,-0.076200><4.408022,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,16.154400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,16.306800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.475819,-1.535000,16.306800>}
box{<0,0,-0.076200><4.255622,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,16.306800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,16.459200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.411200,-1.535000,16.459200>}
box{<0,0,-0.076200><4.191003,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,16.459200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,16.611600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.411200,-1.535000,16.611600>}
box{<0,0,-0.076200><4.191003,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,16.611600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.425022,-1.535000,16.764000>}
box{<0,0,-0.076200><4.204825,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,16.916400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.577422,-1.535000,16.916400>}
box{<0,0,-0.076200><4.357225,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,16.916400> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.810628,0.000000,17.881597>}
box{<0,0,-0.076200><1.590431,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,17.881597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,17.983200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.912231,0.000000,17.983200>}
box{<0,0,-0.076200><1.692034,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,17.983200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,17.983200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,17.983200>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,17.983200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,18.135600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.064631,0.000000,18.135600>}
box{<0,0,-0.076200><1.844434,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,18.135600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,18.135600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,18.135600>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,18.135600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.217031,0.000000,18.288000>}
box{<0,0,-0.076200><1.996834,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,18.288000>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,18.440400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.369431,0.000000,18.440400>}
box{<0,0,-0.076200><2.149234,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,18.440400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,18.440400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,18.440400>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,18.440400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,18.592800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.521831,0.000000,18.592800>}
box{<0,0,-0.076200><2.301634,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,18.592800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,18.592800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,18.592800>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,18.592800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.623431,0.000000,18.694400>}
box{<0,0,-0.076200><2.403234,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,18.694400> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.617581,0.000000,20.421597>}
box{<0,0,-0.076200><1.397384,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,20.421597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,20.421600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.617591,0.000000,20.421600>}
box{<0,0,-0.076200><1.397394,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,20.421600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,20.421600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,20.421600>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,20.421600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,20.574000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.963028,0.000000,20.574000>}
box{<0,0,-0.076200><1.742831,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,20.574000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,20.574000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,20.574000>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,20.574000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.334628,0.000000,20.726400>}
box{<0,0,-0.076200><3.114431,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,20.726400>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,20.878800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.182228,0.000000,20.878800>}
box{<0,0,-0.076200><2.962031,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,20.878800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,20.878800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,20.878800>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,20.878800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,21.031200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.029828,0.000000,21.031200>}
box{<0,0,-0.076200><2.809631,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,21.031200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,21.031200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,21.031200>}
box{<0,0,-0.076200><5.359403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,21.031200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,21.183600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.992781,-1.535000,21.183600>}
box{<0,0,-0.076200><1.772584,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,21.183600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,21.183600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.877428,0.000000,21.183600>}
box{<0,0,-0.076200><2.657231,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,21.183600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,21.234400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.778688,0.000000,21.234400>}
box{<0,0,-0.076200><2.558491,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,21.234400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.840381,-1.535000,21.336000>}
box{<0,0,-0.076200><1.620184,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,21.488400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.687981,-1.535000,21.488400>}
box{<0,0,-0.076200><1.467784,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,21.488400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,21.640800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.535581,-1.535000,21.640800>}
box{<0,0,-0.076200><1.315384,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,21.640800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,21.793200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.383181,-1.535000,21.793200>}
box{<0,0,-0.076200><1.162984,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,21.793200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.230781,-1.535000,21.945600>}
box{<0,0,-0.076200><1.010584,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.078381,-1.535000,22.098000>}
box{<0,0,-0.076200><0.858184,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,22.250400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.925981,-1.535000,22.250400>}
box{<0,0,-0.076200><0.705784,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,22.250400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,22.402800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.773581,-1.535000,22.402800>}
box{<0,0,-0.076200><0.553384,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,22.402800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,22.555200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.621181,-1.535000,22.555200>}
box{<0,0,-0.076200><0.400984,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,22.555200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,22.707600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.468781,-1.535000,22.707600>}
box{<0,0,-0.076200><0.248584,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,22.707600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.316381,-1.535000,22.860000>}
box{<0,0,-0.076200><0.096184,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,22.956188>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.392581,-1.535000,22.783800>}
box{<0,0,-0.076200><0.243791,0.035000,0.076200> rotate<0,44.997549,0> translate<9.220197,-1.535000,22.956188> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,22.961597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,23.774400>}
box{<0,0,-0.076200><0.812803,0.035000,0.076200> rotate<0,90.000000,0> translate<9.220197,0.000000,23.774400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,22.961597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.778688,0.000000,22.961597>}
box{<0,0,-0.076200><2.558491,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,22.961597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,23.012400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.284200,0.000000,23.012400>}
box{<0,0,-0.076200><4.064003,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,23.012400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.907063,0.000000,23.164800>}
box{<0,0,-0.076200><2.686866,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,23.317200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.844275,0.000000,23.317200>}
box{<0,0,-0.076200><2.624078,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,23.317200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,23.469600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.843600,0.000000,23.469600>}
box{<0,0,-0.076200><2.623403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,23.469600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.843600,0.000000,23.622000>}
box{<0,0,-0.076200><2.623403,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,23.622000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,23.774400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.778688,0.000000,23.774400>}
box{<0,0,-0.076200><2.558491,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,23.774400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,26.122772>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,26.314400>}
box{<0,0,-0.076200><0.191628,0.035000,0.076200> rotate<0,90.000000,0> translate<9.220197,-1.535000,26.314400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,26.122772>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.361019,-1.535000,26.263597>}
box{<0,0,-0.076200><0.199154,0.035000,0.076200> rotate<0,-44.997666,0> translate<9.220197,-1.535000,26.122772> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,26.212800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.310225,-1.535000,26.212800>}
box{<0,0,-0.076200><0.090028,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,26.212800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,26.314400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.738781,-1.535000,26.314400>}
box{<0,0,-0.076200><1.518584,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,26.314400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,28.041597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,28.956000>}
box{<0,0,-0.076200><0.914403,0.035000,0.076200> rotate<0,90.000000,0> translate<9.220197,0.000000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,28.041597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,30.683200>}
box{<0,0,-0.076200><2.641603,0.035000,0.076200> rotate<0,90.000000,0> translate<9.220197,-1.535000,30.683200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,28.041597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.778688,0.000000,28.041597>}
box{<0,0,-0.076200><2.558491,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,28.041597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,-1.535000,28.041597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.778688,-1.535000,28.041597>}
box{<0,0,-0.076200><2.558491,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,-1.535000,28.041597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.220197,0.000000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.969628,0.000000,28.041600>}
box{<0,0,-0.076200><3.749431,0.035000,0.076200> rotate<0,0.000000,0> translate<9.220197,0.000000,28.041600> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.361019,-1.535000,26.263597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.739778,-1.535000,26.263597>}
box{<0,0,-0.076200><0.378759,0.035000,0.076200> rotate<0,0.000000,0> translate<9.361019,-1.535000,26.263597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.392581,-1.535000,22.783800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.018181,-1.535000,21.158200>}
box{<0,0,-0.076200><2.298946,0.035000,0.076200> rotate<0,44.997030,0> translate<9.392581,-1.535000,22.783800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.739778,-1.535000,26.263597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.007597,-1.535000,25.995778>}
box{<0,0,-0.076200><0.378753,0.035000,0.076200> rotate<0,44.997030,0> translate<9.739778,-1.535000,26.263597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.790575,-1.535000,26.212800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.840381,-1.535000,26.212800>}
box{<0,0,-0.076200><1.049806,0.035000,0.076200> rotate<0,0.000000,0> translate<9.790575,-1.535000,26.212800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.892172,0.000000,25.501597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.007597,0.000000,25.617019>}
box{<0,0,-0.076200><0.163233,0.035000,0.076200> rotate<0,-44.996255,0> translate<9.892172,0.000000,25.501597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.892172,0.000000,25.501597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.778688,0.000000,25.501597>}
box{<0,0,-0.076200><1.886516,0.035000,0.076200> rotate<0,0.000000,0> translate<9.892172,0.000000,25.501597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.931397,-1.535000,23.322616>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.931397,-1.535000,23.774400>}
box{<0,0,-0.076200><0.451784,0.035000,0.076200> rotate<0,90.000000,0> translate<9.931397,-1.535000,23.774400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.931397,-1.535000,23.322616>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.333816,-1.535000,21.920197>}
box{<0,0,-0.076200><1.983320,0.035000,0.076200> rotate<0,44.997030,0> translate<9.931397,-1.535000,23.322616> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.931397,-1.535000,23.469600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.043581,-1.535000,23.469600>}
box{<0,0,-0.076200><1.112184,0.035000,0.076200> rotate<0,0.000000,0> translate<9.931397,-1.535000,23.469600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.931397,-1.535000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.891181,-1.535000,23.622000>}
box{<0,0,-0.076200><0.959784,0.035000,0.076200> rotate<0,0.000000,0> translate<9.931397,-1.535000,23.622000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.931397,-1.535000,23.774400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.738781,-1.535000,23.774400>}
box{<0,0,-0.076200><0.807384,0.035000,0.076200> rotate<0,0.000000,0> translate<9.931397,-1.535000,23.774400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.931397,-1.535000,25.501597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.931397,-1.535000,25.540819>}
box{<0,0,-0.076200><0.039222,0.035000,0.076200> rotate<0,90.000000,0> translate<9.931397,-1.535000,25.540819> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.931397,-1.535000,25.501597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.778688,-1.535000,25.501597>}
box{<0,0,-0.076200><1.847291,0.035000,0.076200> rotate<0,0.000000,0> translate<9.931397,-1.535000,25.501597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.931397,-1.535000,25.540819>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.007597,-1.535000,25.617019>}
box{<0,0,-0.076200><0.107763,0.035000,0.076200> rotate<0,-44.997030,0> translate<9.931397,-1.535000,25.540819> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.931397,0.000000,26.071978>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.931397,0.000000,26.156581>}
box{<0,0,-0.076200><0.084603,0.035000,0.076200> rotate<0,90.000000,0> translate<9.931397,0.000000,26.156581> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.931397,0.000000,26.071978>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.007597,0.000000,25.995778>}
box{<0,0,-0.076200><0.107763,0.035000,0.076200> rotate<0,44.997030,0> translate<9.931397,0.000000,26.071978> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.931397,0.000000,26.156581>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.089213,0.000000,26.314400>}
box{<0,0,-0.076200><0.223187,0.035000,0.076200> rotate<0,-44.997597,0> translate<9.931397,0.000000,26.156581> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.936813,-1.535000,23.317200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.195981,-1.535000,23.317200>}
box{<0,0,-0.076200><1.259169,0.035000,0.076200> rotate<0,0.000000,0> translate<9.936813,-1.535000,23.317200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.942975,-1.535000,26.060400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.992781,-1.535000,26.060400>}
box{<0,0,-0.076200><1.049806,0.035000,0.076200> rotate<0,0.000000,0> translate<9.942975,-1.535000,26.060400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.942975,0.000000,26.060400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.099800,0.000000,26.060400>}
box{<0,0,-0.076200><1.156825,0.035000,0.076200> rotate<0,0.000000,0> translate<9.942975,0.000000,26.060400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.987613,0.000000,26.212800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.099800,0.000000,26.212800>}
box{<0,0,-0.076200><1.112187,0.035000,0.076200> rotate<0,0.000000,0> translate<9.987613,0.000000,26.212800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.993775,0.000000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.342219,0.000000,25.603200>}
box{<0,0,-0.076200><1.348444,0.035000,0.076200> rotate<0,0.000000,0> translate<9.993775,0.000000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.993778,-1.535000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.342219,-1.535000,25.603200>}
box{<0,0,-0.076200><1.348441,0.035000,0.076200> rotate<0,0.000000,0> translate<9.993778,-1.535000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.007597,0.000000,25.617019>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.007597,0.000000,25.995778>}
box{<0,0,-0.076200><0.378759,0.035000,0.076200> rotate<0,90.000000,0> translate<10.007597,0.000000,25.995778> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.007597,-1.535000,25.617019>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.007597,-1.535000,25.995778>}
box{<0,0,-0.076200><0.378759,0.035000,0.076200> rotate<0,90.000000,0> translate<10.007597,-1.535000,25.995778> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.007597,0.000000,25.755600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.189819,0.000000,25.755600>}
box{<0,0,-0.076200><1.182222,0.035000,0.076200> rotate<0,0.000000,0> translate<10.007597,0.000000,25.755600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.007597,-1.535000,25.755600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.189819,-1.535000,25.755600>}
box{<0,0,-0.076200><1.182222,0.035000,0.076200> rotate<0,0.000000,0> translate<10.007597,-1.535000,25.755600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.007597,0.000000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.099800,0.000000,25.908000>}
box{<0,0,-0.076200><1.092203,0.035000,0.076200> rotate<0,0.000000,0> translate<10.007597,0.000000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.007597,-1.535000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.099800,-1.535000,25.908000>}
box{<0,0,-0.076200><1.092203,0.035000,0.076200> rotate<0,0.000000,0> translate<10.007597,-1.535000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.089213,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.348381,-1.535000,23.164800>}
box{<0,0,-0.076200><1.259169,0.035000,0.076200> rotate<0,0.000000,0> translate<10.089213,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.089213,0.000000,26.314400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.189825,0.000000,26.314400>}
box{<0,0,-0.076200><1.100613,0.035000,0.076200> rotate<0,0.000000,0> translate<10.089213,0.000000,26.314400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.241613,-1.535000,23.012400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.500781,-1.535000,23.012400>}
box{<0,0,-0.076200><1.259169,0.035000,0.076200> rotate<0,0.000000,0> translate<10.241613,-1.535000,23.012400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.394013,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.653181,-1.535000,22.860000>}
box{<0,0,-0.076200><1.259169,0.035000,0.076200> rotate<0,0.000000,0> translate<10.394013,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.546413,-1.535000,22.707600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.805581,-1.535000,22.707600>}
box{<0,0,-0.076200><1.259169,0.035000,0.076200> rotate<0,0.000000,0> translate<10.546413,-1.535000,22.707600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.617581,0.000000,20.421597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.690062,0.000000,20.446013>}
box{<0,0,-0.076200><0.076483,0.035000,0.076200> rotate<0,-18.615094,0> translate<10.617581,0.000000,20.421597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.690062,0.000000,20.446013>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.739284,0.000000,20.421597>}
box{<0,0,-0.076200><0.054945,0.035000,0.076200> rotate<0,26.381142,0> translate<10.690062,0.000000,20.446013> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.698813,-1.535000,22.555200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.957981,-1.535000,22.555200>}
box{<0,0,-0.076200><1.259169,0.035000,0.076200> rotate<0,0.000000,0> translate<10.698813,-1.535000,22.555200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.738781,-1.535000,23.774400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.491381,-1.535000,22.021800>}
box{<0,0,-0.076200><2.478551,0.035000,0.076200> rotate<0,44.997030,0> translate<10.738781,-1.535000,23.774400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.738781,-1.535000,26.314400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.099800,-1.535000,25.953381>}
box{<0,0,-0.076200><0.510558,0.035000,0.076200> rotate<0,44.997030,0> translate<10.738781,-1.535000,26.314400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.739278,0.000000,20.421600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.810628,0.000000,20.421600>}
box{<0,0,-0.076200><0.071350,0.035000,0.076200> rotate<0,0.000000,0> translate<10.739278,0.000000,20.421600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.739284,0.000000,20.421597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.810625,0.000000,20.421597>}
box{<0,0,-0.076200><0.071341,0.035000,0.076200> rotate<0,0.000000,0> translate<10.739284,0.000000,20.421597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.810625,0.000000,12.801597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.623431,0.000000,13.614400>}
box{<0,0,-0.076200><1.149479,0.035000,0.076200> rotate<0,-44.996920,0> translate<10.810625,0.000000,12.801597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.810625,0.000000,15.341597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.607800,0.000000,16.138772>}
box{<0,0,-0.076200><1.127376,0.035000,0.076200> rotate<0,-44.997030,0> translate<10.810625,0.000000,15.341597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.810625,0.000000,20.421597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.043225,0.000000,20.654197>}
box{<0,0,-0.076200><0.328946,0.035000,0.076200> rotate<0,-44.997030,0> translate<10.810625,0.000000,20.421597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.810628,0.000000,17.881597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.623431,0.000000,18.694400>}
box{<0,0,-0.076200><1.149477,0.035000,0.076200> rotate<0,-44.997030,0> translate<10.810628,0.000000,17.881597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.851213,-1.535000,22.402800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.110381,-1.535000,22.402800>}
box{<0,0,-0.076200><1.259169,0.035000,0.076200> rotate<0,0.000000,0> translate<10.851213,-1.535000,22.402800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.003613,-1.535000,22.250400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.262781,-1.535000,22.250400>}
box{<0,0,-0.076200><1.259169,0.035000,0.076200> rotate<0,0.000000,0> translate<11.003613,-1.535000,22.250400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.018181,-1.535000,21.158200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.485219,-1.535000,21.158200>}
box{<0,0,-0.076200><1.467037,0.035000,0.076200> rotate<0,0.000000,0> translate<11.018181,-1.535000,21.158200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.043225,0.000000,20.654197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.406831,0.000000,20.654197>}
box{<0,0,-0.076200><1.363606,0.035000,0.076200> rotate<0,0.000000,0> translate<11.043225,0.000000,20.654197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.099800,0.000000,25.845619>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.367619,0.000000,25.577800>}
box{<0,0,-0.076200><0.378753,0.035000,0.076200> rotate<0,44.997030,0> translate<11.099800,0.000000,25.845619> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.099800,-1.535000,25.845619>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.367619,-1.535000,25.577800>}
box{<0,0,-0.076200><0.378753,0.035000,0.076200> rotate<0,44.997030,0> translate<11.099800,-1.535000,25.845619> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.099800,-1.535000,25.953381>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.099800,-1.535000,25.845619>}
box{<0,0,-0.076200><0.107762,0.035000,0.076200> rotate<0,-90.000000,0> translate<11.099800,-1.535000,25.845619> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.099800,0.000000,26.224378>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.099800,0.000000,25.845619>}
box{<0,0,-0.076200><0.378759,0.035000,0.076200> rotate<0,-90.000000,0> translate<11.099800,0.000000,25.845619> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.099800,0.000000,26.224378>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.189825,0.000000,26.314400>}
box{<0,0,-0.076200><0.127312,0.035000,0.076200> rotate<0,-44.996036,0> translate<11.099800,0.000000,26.224378> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.156013,-1.535000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.415181,-1.535000,22.098000>}
box{<0,0,-0.076200><1.259169,0.035000,0.076200> rotate<0,0.000000,0> translate<11.156013,-1.535000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.308413,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.510622,-1.535000,21.945600>}
box{<0,0,-0.076200><1.202209,0.035000,0.076200> rotate<0,0.000000,0> translate<11.308413,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.333816,-1.535000,21.920197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.485219,-1.535000,21.920197>}
box{<0,0,-0.076200><1.151403,0.035000,0.076200> rotate<0,0.000000,0> translate<11.333816,-1.535000,21.920197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.367619,0.000000,25.577800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.746378,0.000000,25.577800>}
box{<0,0,-0.076200><0.378759,0.035000,0.076200> rotate<0,0.000000,0> translate<11.367619,0.000000,25.577800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.367619,-1.535000,25.577800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.746378,-1.535000,25.577800>}
box{<0,0,-0.076200><0.378759,0.035000,0.076200> rotate<0,0.000000,0> translate<11.367619,-1.535000,25.577800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.607800,0.000000,16.154400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.607800,0.000000,16.138772>}
box{<0,0,-0.076200><0.015628,0.035000,0.076200> rotate<0,-90.000000,0> translate<11.607800,0.000000,16.138772> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.722744,0.000000,10.388597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.079400,0.000000,10.745253>}
box{<0,0,-0.076200><0.504388,0.035000,0.076200> rotate<0,-44.997030,0> translate<11.722744,0.000000,10.388597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.744566,0.000000,12.801597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.778688,0.000000,12.801597>}
box{<0,0,-0.076200><0.034122,0.035000,0.076200> rotate<0,0.000000,0> translate<11.744566,0.000000,12.801597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.744566,0.000000,12.801597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.079400,0.000000,13.136431>}
box{<0,0,-0.076200><0.473527,0.035000,0.076200> rotate<0,-44.997030,0> translate<11.744566,0.000000,12.801597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.744569,0.000000,12.801600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.079400,0.000000,12.801600>}
box{<0,0,-0.076200><0.334831,0.035000,0.076200> rotate<0,0.000000,0> translate<11.744569,0.000000,12.801600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.746378,0.000000,25.577800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.822578,0.000000,25.654000>}
box{<0,0,-0.076200><0.107763,0.035000,0.076200> rotate<0,-44.997030,0> translate<11.746378,0.000000,25.577800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.746378,-1.535000,25.577800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.014197,-1.535000,25.845619>}
box{<0,0,-0.076200><0.378753,0.035000,0.076200> rotate<0,-44.997030,0> translate<11.746378,-1.535000,25.577800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.771778,0.000000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.681200,0.000000,25.603200>}
box{<0,0,-0.076200><1.909422,0.035000,0.076200> rotate<0,0.000000,0> translate<11.771778,0.000000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.771778,-1.535000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,25.603200>}
box{<0,0,-0.076200><2.807822,0.035000,0.076200> rotate<0,0.000000,0> translate<11.771778,-1.535000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.778688,0.000000,8.661400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,8.795309>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<11.778688,0.000000,8.661400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.778688,0.000000,11.074400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,11.208309>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<11.778688,0.000000,11.074400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.778688,0.000000,12.801597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,12.667688>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<11.778688,0.000000,12.801597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.778688,0.000000,21.234400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.802656,0.000000,21.258372>}
box{<0,0,-0.076200><0.033899,0.035000,0.076200> rotate<0,-45.000765,0> translate<11.778688,0.000000,21.234400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.778688,0.000000,22.961597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,22.827687>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<11.778688,0.000000,22.961597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.778688,0.000000,23.774400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.843600,0.000000,23.839316>}
box{<0,0,-0.076200><0.091802,0.035000,0.076200> rotate<0,-44.998409,0> translate<11.778688,0.000000,23.774400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.778688,0.000000,23.774400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.547588,0.000000,23.774400>}
box{<0,0,-0.076200><0.768900,0.035000,0.076200> rotate<0,0.000000,0> translate<11.778688,0.000000,23.774400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.778688,0.000000,25.501597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,25.367688>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<11.778688,0.000000,25.501597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.778688,-1.535000,25.501597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,-1.535000,25.367688>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<11.778688,-1.535000,25.501597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.778688,0.000000,28.041597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,27.907688>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<11.778688,0.000000,28.041597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.778688,-1.535000,28.041597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,-1.535000,27.907688>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<11.778688,-1.535000,28.041597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.797547,-1.535000,23.793263>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,-1.535000,23.908309>}
box{<0,0,-0.076200><0.162703,0.035000,0.076200> rotate<0,-44.996252,0> translate<11.797547,-1.535000,23.793263> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.797547,-1.535000,23.793263>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.807016,-1.535000,22.783797>}
box{<0,0,-0.076200><1.427602,0.035000,0.076200> rotate<0,44.996941,0> translate<11.797547,-1.535000,23.793263> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.802656,0.000000,21.258372>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.406831,0.000000,20.654197>}
box{<0,0,-0.076200><0.854432,0.035000,0.076200> rotate<0,44.997030,0> translate<11.802656,0.000000,21.258372> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.804088,0.000000,8.686800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.847800,0.000000,8.686800>}
box{<0,0,-0.076200><1.043712,0.035000,0.076200> rotate<0,0.000000,0> translate<11.804088,0.000000,8.686800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.816413,-1.535000,23.774400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,23.774400>}
box{<0,0,-0.076200><2.763188,0.035000,0.076200> rotate<0,0.000000,0> translate<11.816413,-1.535000,23.774400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.822578,0.000000,25.654000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.685094,0.000000,25.654000>}
box{<0,0,-0.076200><1.862516,0.035000,0.076200> rotate<0,0.000000,0> translate<11.822578,0.000000,25.654000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.829484,0.000000,25.450800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.681200,0.000000,25.450800>}
box{<0,0,-0.076200><1.851716,0.035000,0.076200> rotate<0,0.000000,0> translate<11.829484,0.000000,25.450800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.829484,-1.535000,25.450800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,25.450800>}
box{<0,0,-0.076200><2.750116,0.035000,0.076200> rotate<0,0.000000,0> translate<11.829484,-1.535000,25.450800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.829488,0.000000,11.125200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.079400,0.000000,11.125200>}
box{<0,0,-0.076200><0.249912,0.035000,0.076200> rotate<0,0.000000,0> translate<11.829488,0.000000,11.125200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.843600,0.000000,23.319725>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.866103,0.000000,23.235747>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,74.994252,0> translate<11.843600,0.000000,23.319725> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.843600,0.000000,23.637003>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.843600,0.000000,23.319725>}
box{<0,0,-0.076200><0.317278,0.035000,0.076200> rotate<0,-90.000000,0> translate<11.843600,0.000000,23.319725> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.843600,0.000000,23.637003>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.547588,0.000000,23.637003>}
box{<0,0,-0.076200><0.703988,0.035000,0.076200> rotate<0,0.000000,0> translate<11.843600,0.000000,23.637003> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.843600,0.000000,23.789391>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.547588,0.000000,23.789391>}
box{<0,0,-0.076200><0.703988,0.035000,0.076200> rotate<0,0.000000,0> translate<11.843600,0.000000,23.789391> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.843600,0.000000,23.839316>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.843600,0.000000,23.789391>}
box{<0,0,-0.076200><0.049925,0.035000,0.076200> rotate<0,-90.000000,0> translate<11.843600,0.000000,23.789391> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.851428,-1.535000,26.387144>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,-1.535000,26.448309>}
box{<0,0,-0.076200><0.086503,0.035000,0.076200> rotate<0,-44.995567,0> translate<11.851428,-1.535000,26.387144> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.851428,-1.535000,26.387144>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.014197,-1.535000,26.224378>}
box{<0,0,-0.076200><0.230188,0.035000,0.076200> rotate<0,44.996480,0> translate<11.851428,-1.535000,26.387144> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.866103,0.000000,23.235747>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.909575,0.000000,23.160450>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,59.996495,0> translate<11.866103,0.000000,23.235747> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.873375,-1.535000,26.365200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.587259,-1.535000,26.365200>}
box{<0,0,-0.076200><2.713884,0.035000,0.076200> rotate<0,0.000000,0> translate<11.873375,-1.535000,26.365200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.880281,0.000000,26.415997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,26.448309>}
box{<0,0,-0.076200><0.045699,0.035000,0.076200> rotate<0,-44.994260,0> translate<11.880281,0.000000,26.415997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.880281,0.000000,26.415997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.900184,0.000000,26.415997>}
box{<0,0,-0.076200><1.019903,0.035000,0.076200> rotate<0,0.000000,0> translate<11.880281,0.000000,26.415997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.880284,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.947313,0.000000,22.860000>}
box{<0,0,-0.076200><0.067028,0.035000,0.076200> rotate<0,0.000000,0> translate<11.880284,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.896969,0.000000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.079400,0.000000,12.954000>}
box{<0,0,-0.076200><0.182431,0.035000,0.076200> rotate<0,0.000000,0> translate<11.896969,0.000000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.909575,0.000000,23.160450>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.971050,0.000000,23.098975>}
box{<0,0,-0.076200><0.086939,0.035000,0.076200> rotate<0,44.997030,0> translate<11.909575,0.000000,23.160450> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,8.795309>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,9.357144>}
box{<0,0,-0.076200><0.561834,0.035000,0.076200> rotate<0,90.000000,0> translate<11.912597,0.000000,9.357144> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,8.839200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.847800,0.000000,8.839200>}
box{<0,0,-0.076200><0.935203,0.035000,0.076200> rotate<0,0.000000,0> translate<11.912597,0.000000,8.839200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,8.991600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.847800,0.000000,8.991600>}
box{<0,0,-0.076200><0.935203,0.035000,0.076200> rotate<0,0.000000,0> translate<11.912597,0.000000,8.991600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.713341,0.000000,9.144000>}
box{<0,0,-0.076200><0.800744,0.035000,0.076200> rotate<0,0.000000,0> translate<11.912597,0.000000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,9.296400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.560941,0.000000,9.296400>}
box{<0,0,-0.076200><0.648344,0.035000,0.076200> rotate<0,0.000000,0> translate<11.912597,0.000000,9.296400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,9.357144>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.206397,0.000000,9.650944>}
box{<0,0,-0.076200><0.415496,0.035000,0.076200> rotate<0,-44.997030,0> translate<11.912597,0.000000,9.357144> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,21.970997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,22.827687>}
box{<0,0,-0.076200><0.856691,0.035000,0.076200> rotate<0,90.000000,0> translate<11.912597,0.000000,22.827687> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,21.970997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.945200,0.000000,21.970997>}
box{<0,0,-0.076200><0.032603,0.035000,0.076200> rotate<0,0.000000,0> translate<11.912597,0.000000,21.970997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.945200,0.000000,22.098000>}
box{<0,0,-0.076200><0.032603,0.035000,0.076200> rotate<0,0.000000,0> translate<11.912597,0.000000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,22.250400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.945200,0.000000,22.250400>}
box{<0,0,-0.076200><0.032603,0.035000,0.076200> rotate<0,0.000000,0> translate<11.912597,0.000000,22.250400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,22.402800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.945200,0.000000,22.402800>}
box{<0,0,-0.076200><0.032603,0.035000,0.076200> rotate<0,0.000000,0> translate<11.912597,0.000000,22.402800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,22.555200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.945200,0.000000,22.555200>}
box{<0,0,-0.076200><0.032603,0.035000,0.076200> rotate<0,0.000000,0> translate<11.912597,0.000000,22.555200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,22.707600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.945200,0.000000,22.707600>}
box{<0,0,-0.076200><0.032603,0.035000,0.076200> rotate<0,0.000000,0> translate<11.912597,0.000000,22.707600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,-1.535000,23.908309>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,-1.535000,25.367688>}
box{<0,0,-0.076200><1.459378,0.035000,0.076200> rotate<0,90.000000,0> translate<11.912597,-1.535000,25.367688> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,-1.535000,23.926800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,23.926800>}
box{<0,0,-0.076200><2.667003,0.035000,0.076200> rotate<0,0.000000,0> translate<11.912597,-1.535000,23.926800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,-1.535000,24.079200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,24.079200>}
box{<0,0,-0.076200><2.667003,0.035000,0.076200> rotate<0,0.000000,0> translate<11.912597,-1.535000,24.079200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,-1.535000,24.231600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,24.231600>}
box{<0,0,-0.076200><2.667003,0.035000,0.076200> rotate<0,0.000000,0> translate<11.912597,-1.535000,24.231600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,24.384000>}
box{<0,0,-0.076200><2.667003,0.035000,0.076200> rotate<0,0.000000,0> translate<11.912597,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,-1.535000,24.536400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,24.536400>}
box{<0,0,-0.076200><2.667003,0.035000,0.076200> rotate<0,0.000000,0> translate<11.912597,-1.535000,24.536400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,-1.535000,24.688800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,24.688800>}
box{<0,0,-0.076200><2.667003,0.035000,0.076200> rotate<0,0.000000,0> translate<11.912597,-1.535000,24.688800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,-1.535000,24.841200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,24.841200>}
box{<0,0,-0.076200><2.667003,0.035000,0.076200> rotate<0,0.000000,0> translate<11.912597,-1.535000,24.841200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,24.917397>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,25.367688>}
box{<0,0,-0.076200><0.450291,0.035000,0.076200> rotate<0,90.000000,0> translate<11.912597,0.000000,25.367688> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,24.917397>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.518216,0.000000,24.917397>}
box{<0,0,-0.076200><1.605619,0.035000,0.076200> rotate<0,0.000000,0> translate<11.912597,0.000000,24.917397> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.681197,0.000000,24.993600>}
box{<0,0,-0.076200><1.768600,0.035000,0.076200> rotate<0,0.000000,0> translate<11.912597,0.000000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,-1.535000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,24.993600>}
box{<0,0,-0.076200><2.667003,0.035000,0.076200> rotate<0,0.000000,0> translate<11.912597,-1.535000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.285188,0.000000,25.146000>}
box{<0,0,-0.076200><2.372591,0.035000,0.076200> rotate<0,0.000000,0> translate<11.912597,0.000000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,-1.535000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,25.146000>}
box{<0,0,-0.076200><2.667003,0.035000,0.076200> rotate<0,0.000000,0> translate<11.912597,-1.535000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,25.298400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.681200,0.000000,25.298400>}
box{<0,0,-0.076200><1.768603,0.035000,0.076200> rotate<0,0.000000,0> translate<11.912597,0.000000,25.298400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,-1.535000,25.298400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,25.298400>}
box{<0,0,-0.076200><2.667003,0.035000,0.076200> rotate<0,0.000000,0> translate<11.912597,-1.535000,25.298400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,26.448309>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,27.907688>}
box{<0,0,-0.076200><1.459378,0.035000,0.076200> rotate<0,90.000000,0> translate<11.912597,0.000000,27.907688> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,-1.535000,26.448309>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,-1.535000,27.907688>}
box{<0,0,-0.076200><1.459378,0.035000,0.076200> rotate<0,90.000000,0> translate<11.912597,-1.535000,27.907688> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,26.517600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.877797,0.000000,26.517600>}
box{<0,0,-0.076200><0.965200,0.035000,0.076200> rotate<0,0.000000,0> translate<11.912597,0.000000,26.517600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,-1.535000,26.517600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.739659,-1.535000,26.517600>}
box{<0,0,-0.076200><2.827063,0.035000,0.076200> rotate<0,0.000000,0> translate<11.912597,-1.535000,26.517600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.877797,0.000000,26.670000>}
box{<0,0,-0.076200><0.965200,0.035000,0.076200> rotate<0,0.000000,0> translate<11.912597,0.000000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,26.670000>}
box{<0,0,-0.076200><15.062203,0.035000,0.076200> rotate<0,0.000000,0> translate<11.912597,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.877797,0.000000,26.822400>}
box{<0,0,-0.076200><0.965200,0.035000,0.076200> rotate<0,0.000000,0> translate<11.912597,0.000000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,-1.535000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,26.822400>}
box{<0,0,-0.076200><15.062203,0.035000,0.076200> rotate<0,0.000000,0> translate<11.912597,-1.535000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,26.974800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.877797,0.000000,26.974800>}
box{<0,0,-0.076200><0.965200,0.035000,0.076200> rotate<0,0.000000,0> translate<11.912597,0.000000,26.974800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,-1.535000,26.974800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,26.974800>}
box{<0,0,-0.076200><15.062203,0.035000,0.076200> rotate<0,0.000000,0> translate<11.912597,-1.535000,26.974800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,27.127200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.401788,0.000000,27.127200>}
box{<0,0,-0.076200><2.489191,0.035000,0.076200> rotate<0,0.000000,0> translate<11.912597,0.000000,27.127200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,-1.535000,27.127200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,27.127200>}
box{<0,0,-0.076200><15.062203,0.035000,0.076200> rotate<0,0.000000,0> translate<11.912597,-1.535000,27.127200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,27.279600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.877800,0.000000,27.279600>}
box{<0,0,-0.076200><0.965203,0.035000,0.076200> rotate<0,0.000000,0> translate<11.912597,0.000000,27.279600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,-1.535000,27.279600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,27.279600>}
box{<0,0,-0.076200><15.062203,0.035000,0.076200> rotate<0,0.000000,0> translate<11.912597,-1.535000,27.279600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.877800,0.000000,27.432000>}
box{<0,0,-0.076200><0.965203,0.035000,0.076200> rotate<0,0.000000,0> translate<11.912597,0.000000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,-1.535000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,27.432000>}
box{<0,0,-0.076200><15.062203,0.035000,0.076200> rotate<0,0.000000,0> translate<11.912597,-1.535000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,27.584400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.877800,0.000000,27.584400>}
box{<0,0,-0.076200><0.965203,0.035000,0.076200> rotate<0,0.000000,0> translate<11.912597,0.000000,27.584400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,-1.535000,27.584400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,27.584400>}
box{<0,0,-0.076200><15.062203,0.035000,0.076200> rotate<0,0.000000,0> translate<11.912597,-1.535000,27.584400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,27.736800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.877800,0.000000,27.736800>}
box{<0,0,-0.076200><0.965203,0.035000,0.076200> rotate<0,0.000000,0> translate<11.912597,0.000000,27.736800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,-1.535000,27.736800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,27.736800>}
box{<0,0,-0.076200><15.062203,0.035000,0.076200> rotate<0,0.000000,0> translate<11.912597,-1.535000,27.736800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,0.000000,27.889200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.886572,0.000000,27.889200>}
box{<0,0,-0.076200><0.973975,0.035000,0.076200> rotate<0,0.000000,0> translate<11.912597,0.000000,27.889200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.912597,-1.535000,27.889200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,27.889200>}
box{<0,0,-0.076200><15.062203,0.035000,0.076200> rotate<0,0.000000,0> translate<11.912597,-1.535000,27.889200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.924178,-1.535000,25.755600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.536456,-1.535000,25.755600>}
box{<0,0,-0.076200><2.612278,0.035000,0.076200> rotate<0,0.000000,0> translate<11.924178,-1.535000,25.755600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.945200,0.000000,22.857888>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.945200,0.000000,21.970997>}
box{<0,0,-0.076200><0.886891,0.035000,0.076200> rotate<0,-90.000000,0> translate<11.945200,0.000000,21.970997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.945200,0.000000,22.857888>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.079109,0.000000,22.991797>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<11.945200,0.000000,22.857888> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.968813,-1.535000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,23.622000>}
box{<0,0,-0.076200><2.610788,0.035000,0.076200> rotate<0,0.000000,0> translate<11.968813,-1.535000,23.622000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.971050,0.000000,23.098975>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.046347,0.000000,23.055503>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,29.997566,0> translate<11.971050,0.000000,23.098975> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.004253,0.000000,9.448800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.408541,0.000000,9.448800>}
box{<0,0,-0.076200><0.404288,0.035000,0.076200> rotate<0,0.000000,0> translate<12.004253,0.000000,9.448800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.014197,-1.535000,25.845619>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.014197,-1.535000,26.224378>}
box{<0,0,-0.076200><0.378759,0.035000,0.076200> rotate<0,90.000000,0> translate<12.014197,-1.535000,26.224378> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.014197,-1.535000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.478000,-1.535000,25.908000>}
box{<0,0,-0.076200><2.463803,0.035000,0.076200> rotate<0,0.000000,0> translate<12.014197,-1.535000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.014197,-1.535000,26.060400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.478000,-1.535000,26.060400>}
box{<0,0,-0.076200><2.463803,0.035000,0.076200> rotate<0,0.000000,0> translate<12.014197,-1.535000,26.060400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.014197,-1.535000,26.212800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.478000,-1.535000,26.212800>}
box{<0,0,-0.076200><2.463803,0.035000,0.076200> rotate<0,0.000000,0> translate<12.014197,-1.535000,26.212800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.046347,0.000000,23.055503>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.130325,0.000000,23.033000>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,14.999808,0> translate<12.046347,0.000000,23.055503> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.049369,0.000000,13.106400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.079400,0.000000,13.106400>}
box{<0,0,-0.076200><0.030031,0.035000,0.076200> rotate<0,0.000000,0> translate<12.049369,0.000000,13.106400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.079109,0.000000,22.991797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.168488,0.000000,22.991797>}
box{<0,0,-0.076200><1.089378,0.035000,0.076200> rotate<0,0.000000,0> translate<12.079109,0.000000,22.991797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.079400,0.000000,10.745256>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.079400,0.000000,10.745253>}
box{<0,0,-0.076200><0.000003,0.035000,0.076200> rotate<0,-90.000000,0> translate<12.079400,0.000000,10.745253> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.079400,0.000000,13.136431>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.079400,0.000000,10.745256>}
box{<0,0,-0.076200><2.391175,0.035000,0.076200> rotate<0,-90.000000,0> translate<12.079400,0.000000,10.745256> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.121213,-1.535000,23.469600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,23.469600>}
box{<0,0,-0.076200><2.458388,0.035000,0.076200> rotate<0,0.000000,0> translate<12.121213,-1.535000,23.469600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.130325,0.000000,23.033000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.547603,0.000000,23.032997>}
box{<0,0,-0.076200><0.417278,0.035000,0.076200> rotate<0,0.000429,0> translate<12.130325,0.000000,23.033000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.156653,0.000000,9.601200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.256141,0.000000,9.601200>}
box{<0,0,-0.076200><0.099488,0.035000,0.076200> rotate<0,0.000000,0> translate<12.156653,0.000000,9.601200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.206397,0.000000,9.650944>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.332341,0.000000,9.525000>}
box{<0,0,-0.076200><0.178111,0.035000,0.076200> rotate<0,44.997030,0> translate<12.206397,0.000000,9.650944> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.273613,-1.535000,23.317200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,23.317200>}
box{<0,0,-0.076200><2.305988,0.035000,0.076200> rotate<0,0.000000,0> translate<12.273613,-1.535000,23.317200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.332341,0.000000,9.525000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.847800,0.000000,9.009541>}
box{<0,0,-0.076200><0.728970,0.035000,0.076200> rotate<0,44.997030,0> translate<12.332341,0.000000,9.525000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.426013,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,23.164800>}
box{<0,0,-0.076200><2.153588,0.035000,0.076200> rotate<0,0.000000,0> translate<12.426013,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.485219,-1.535000,21.158200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.561419,-1.535000,21.082000>}
box{<0,0,-0.076200><0.107763,0.035000,0.076200> rotate<0,44.997030,0> translate<12.485219,-1.535000,21.158200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.485219,-1.535000,21.920197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.561419,-1.535000,21.996397>}
box{<0,0,-0.076200><0.107763,0.035000,0.076200> rotate<0,-44.997030,0> translate<12.485219,-1.535000,21.920197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.491381,-1.535000,22.021800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.348819,-1.535000,22.021800>}
box{<0,0,-0.076200><0.857438,0.035000,0.076200> rotate<0,0.000000,0> translate<12.491381,-1.535000,22.021800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.547588,0.000000,23.789391>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.547588,0.000000,23.637003>}
box{<0,0,-0.076200><0.152388,0.035000,0.076200> rotate<0,-90.000000,0> translate<12.547588,0.000000,23.637003> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.547603,0.000000,23.032997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.547603,0.000000,23.636988>}
box{<0,0,-0.076200><0.603991,0.035000,0.076200> rotate<0,90.000000,0> translate<12.547603,0.000000,23.636988> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.547603,0.000000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.699991,0.000000,23.164800>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<12.547603,0.000000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.547603,0.000000,23.317200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.699991,0.000000,23.317200>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<12.547603,0.000000,23.317200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.547603,0.000000,23.469600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.699991,0.000000,23.469600>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<12.547603,0.000000,23.469600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.547603,0.000000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.699991,0.000000,23.622000>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<12.547603,0.000000,23.622000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.547603,0.000000,23.636988>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.699991,0.000000,23.636988>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<12.547603,0.000000,23.636988> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.561419,-1.535000,21.082000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.940178,-1.535000,21.082000>}
box{<0,0,-0.076200><0.378759,0.035000,0.076200> rotate<0,0.000000,0> translate<12.561419,-1.535000,21.082000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.561419,-1.535000,21.996397>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.940178,-1.535000,21.996397>}
box{<0,0,-0.076200><0.378759,0.035000,0.076200> rotate<0,0.000000,0> translate<12.561419,-1.535000,21.996397> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.578413,-1.535000,23.012400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,23.012400>}
box{<0,0,-0.076200><2.001188,0.035000,0.076200> rotate<0,0.000000,0> translate<12.578413,-1.535000,23.012400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.674597,0.000000,16.079250>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.674597,0.000000,17.694025>}
box{<0,0,-0.076200><1.614775,0.035000,0.076200> rotate<0,90.000000,0> translate<12.674597,0.000000,17.694025> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.674597,0.000000,16.079250>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.335000,0.000000,16.739656>}
box{<0,0,-0.076200><0.933953,0.035000,0.076200> rotate<0,-44.997166,0> translate<12.674597,0.000000,16.079250> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.674597,0.000000,16.154400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.749747,0.000000,16.154400>}
box{<0,0,-0.076200><0.075150,0.035000,0.076200> rotate<0,0.000000,0> translate<12.674597,0.000000,16.154400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.674597,0.000000,16.306800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.902147,0.000000,16.306800>}
box{<0,0,-0.076200><0.227550,0.035000,0.076200> rotate<0,0.000000,0> translate<12.674597,0.000000,16.306800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.674597,0.000000,16.459200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.054547,0.000000,16.459200>}
box{<0,0,-0.076200><0.379950,0.035000,0.076200> rotate<0,0.000000,0> translate<12.674597,0.000000,16.459200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.674597,0.000000,16.611600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.206947,0.000000,16.611600>}
box{<0,0,-0.076200><0.532350,0.035000,0.076200> rotate<0,0.000000,0> translate<12.674597,0.000000,16.611600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.674597,0.000000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.359344,0.000000,16.764000>}
box{<0,0,-0.076200><0.684747,0.035000,0.076200> rotate<0,0.000000,0> translate<12.674597,0.000000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.674597,0.000000,16.916400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.511744,0.000000,16.916400>}
box{<0,0,-0.076200><0.837147,0.035000,0.076200> rotate<0,0.000000,0> translate<12.674597,0.000000,16.916400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.674597,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.867109,0.000000,17.068800>}
box{<0,0,-0.076200><2.192512,0.035000,0.076200> rotate<0,0.000000,0> translate<12.674597,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.674597,0.000000,17.221200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.856600,0.000000,17.221200>}
box{<0,0,-0.076200><2.182003,0.035000,0.076200> rotate<0,0.000000,0> translate<12.674597,0.000000,17.221200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.674597,0.000000,17.373600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.856600,0.000000,17.373600>}
box{<0,0,-0.076200><2.182003,0.035000,0.076200> rotate<0,0.000000,0> translate<12.674597,0.000000,17.373600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.674597,0.000000,17.526000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.856600,0.000000,17.526000>}
box{<0,0,-0.076200><2.182003,0.035000,0.076200> rotate<0,0.000000,0> translate<12.674597,0.000000,17.526000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.674597,0.000000,17.678400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.856600,0.000000,17.678400>}
box{<0,0,-0.076200><2.182003,0.035000,0.076200> rotate<0,0.000000,0> translate<12.674597,0.000000,17.678400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.674597,0.000000,17.694025>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.474372,0.000000,18.493800>}
box{<0,0,-0.076200><1.131053,0.035000,0.076200> rotate<0,-44.997030,0> translate<12.674597,0.000000,17.694025> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.699991,0.000000,23.032997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.117272,0.000000,23.033000>}
box{<0,0,-0.076200><0.417281,0.035000,0.076200> rotate<0,-0.000429,0> translate<12.699991,0.000000,23.032997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.699991,0.000000,23.636988>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.699991,0.000000,23.032997>}
box{<0,0,-0.076200><0.603991,0.035000,0.076200> rotate<0,-90.000000,0> translate<12.699991,0.000000,23.032997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.730813,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,22.860000>}
box{<0,0,-0.076200><1.848788,0.035000,0.076200> rotate<0,0.000000,0> translate<12.730813,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.807016,-1.535000,22.783797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.348819,-1.535000,22.783797>}
box{<0,0,-0.076200><0.541803,0.035000,0.076200> rotate<0,0.000000,0> translate<12.807016,-1.535000,22.783797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.811372,0.000000,17.830800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.856600,0.000000,17.830800>}
box{<0,0,-0.076200><2.045228,0.035000,0.076200> rotate<0,0.000000,0> translate<12.811372,0.000000,17.830800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.847800,0.000000,8.296909>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.981709,0.000000,8.163000>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<12.847800,0.000000,8.296909> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.847800,0.000000,9.009541>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.847800,0.000000,8.296909>}
box{<0,0,-0.076200><0.712631,0.035000,0.076200> rotate<0,-90.000000,0> translate<12.847800,0.000000,8.296909> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.877797,0.000000,27.101803>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.877800,0.000000,26.499525>}
box{<0,0,-0.076200><0.602278,0.035000,0.076200> rotate<0,89.993763,0> translate<12.877797,0.000000,27.101803> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.877797,0.000000,27.101803>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.401788,0.000000,27.101803>}
box{<0,0,-0.076200><1.523991,0.035000,0.076200> rotate<0,0.000000,0> translate<12.877797,0.000000,27.101803> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.877800,0.000000,26.499525>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.900184,0.000000,26.415997>}
box{<0,0,-0.076200><0.086475,0.035000,0.076200> rotate<0,74.993078,0> translate<12.877800,0.000000,26.499525> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.877800,0.000000,27.254191>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.401788,0.000000,27.254191>}
box{<0,0,-0.076200><1.523988,0.035000,0.076200> rotate<0,0.000000,0> translate<12.877800,0.000000,27.254191> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.877800,0.000000,27.856472>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.877800,0.000000,27.254191>}
box{<0,0,-0.076200><0.602281,0.035000,0.076200> rotate<0,-90.000000,0> translate<12.877800,0.000000,27.254191> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.877800,0.000000,27.856472>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.900303,0.000000,27.940450>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-74.994252,0> translate<12.877800,0.000000,27.856472> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.900303,0.000000,27.940450>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.943775,0.000000,28.015747>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-59.996495,0> translate<12.900303,0.000000,27.940450> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.940178,-1.535000,21.082000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.207997,-1.535000,21.349819>}
box{<0,0,-0.076200><0.378753,0.035000,0.076200> rotate<0,-44.997030,0> translate<12.940178,-1.535000,21.082000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.940178,-1.535000,21.996397>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.207997,-1.535000,21.728578>}
box{<0,0,-0.076200><0.378753,0.035000,0.076200> rotate<0,44.997030,0> translate<12.940178,-1.535000,21.996397> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.942997,0.000000,10.903281>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.942997,0.000000,11.254231>}
box{<0,0,-0.076200><0.350950,0.035000,0.076200> rotate<0,90.000000,0> translate<12.942997,0.000000,11.254231> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.942997,0.000000,10.903281>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.068909,0.000000,11.029197>}
box{<0,0,-0.076200><0.178069,0.035000,0.076200> rotate<0,-44.997741,0> translate<12.942997,0.000000,10.903281> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.942997,0.000000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.012516,0.000000,10.972800>}
box{<0,0,-0.076200><0.069519,0.035000,0.076200> rotate<0,0.000000,0> translate<12.942997,0.000000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.942997,0.000000,11.125200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.385713,0.000000,11.125200>}
box{<0,0,-0.076200><1.442716,0.035000,0.076200> rotate<0,0.000000,0> translate<12.942997,0.000000,11.125200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.942997,0.000000,11.254231>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.960850,0.000000,11.236375>}
box{<0,0,-0.076200><0.025250,0.035000,0.076200> rotate<0,45.002044,0> translate<12.942997,0.000000,11.254231> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.942997,0.000000,12.546966>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.942997,0.000000,14.226031>}
box{<0,0,-0.076200><1.679066,0.035000,0.076200> rotate<0,90.000000,0> translate<12.942997,0.000000,14.226031> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.942997,0.000000,12.546966>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.960850,0.000000,12.564822>}
box{<0,0,-0.076200><0.025250,0.035000,0.076200> rotate<0,-45.002044,0> translate<12.942997,0.000000,12.546966> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.942997,0.000000,12.649200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.937509,0.000000,12.649200>}
box{<0,0,-0.076200><4.994513,0.035000,0.076200> rotate<0,0.000000,0> translate<12.942997,0.000000,12.649200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.942997,0.000000,12.801600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.011109,0.000000,12.801600>}
box{<0,0,-0.076200><0.068112,0.035000,0.076200> rotate<0,0.000000,0> translate<12.942997,0.000000,12.801600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.942997,0.000000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.960400,0.000000,12.954000>}
box{<0,0,-0.076200><0.017403,0.035000,0.076200> rotate<0,0.000000,0> translate<12.942997,0.000000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.942997,0.000000,13.106400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.960400,0.000000,13.106400>}
box{<0,0,-0.076200><0.017403,0.035000,0.076200> rotate<0,0.000000,0> translate<12.942997,0.000000,13.106400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.942997,0.000000,13.258800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.960400,0.000000,13.258800>}
box{<0,0,-0.076200><0.017403,0.035000,0.076200> rotate<0,0.000000,0> translate<12.942997,0.000000,13.258800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.942997,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.960400,0.000000,13.411200>}
box{<0,0,-0.076200><0.017403,0.035000,0.076200> rotate<0,0.000000,0> translate<12.942997,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.942997,0.000000,13.563600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.960400,0.000000,13.563600>}
box{<0,0,-0.076200><0.017403,0.035000,0.076200> rotate<0,0.000000,0> translate<12.942997,0.000000,13.563600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.942997,0.000000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.960400,0.000000,13.716000>}
box{<0,0,-0.076200><0.017403,0.035000,0.076200> rotate<0,0.000000,0> translate<12.942997,0.000000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.942997,0.000000,13.868400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.987113,0.000000,13.868400>}
box{<0,0,-0.076200><0.044116,0.035000,0.076200> rotate<0,0.000000,0> translate<12.942997,0.000000,13.868400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.942997,0.000000,14.020800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.436513,0.000000,14.020800>}
box{<0,0,-0.076200><1.493516,0.035000,0.076200> rotate<0,0.000000,0> translate<12.942997,0.000000,14.020800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.942997,0.000000,14.173200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.002834,0.000000,14.173200>}
box{<0,0,-0.076200><0.059838,0.035000,0.076200> rotate<0,0.000000,0> translate<12.942997,0.000000,14.173200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.942997,0.000000,14.226031>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.986250,0.000000,14.182775>}
box{<0,0,-0.076200><0.061171,0.035000,0.076200> rotate<0,44.999100,0> translate<12.942997,0.000000,14.226031> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.943775,0.000000,28.015747>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.005250,0.000000,28.077222>}
box{<0,0,-0.076200><0.086939,0.035000,0.076200> rotate<0,-44.997030,0> translate<12.943775,0.000000,28.015747> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.960400,0.000000,12.852309>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.094309,0.000000,12.718400>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<12.960400,0.000000,12.852309> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.960400,0.000000,13.841688>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.960400,0.000000,12.852309>}
box{<0,0,-0.076200><0.989378,0.035000,0.076200> rotate<0,-90.000000,0> translate<12.960400,0.000000,12.852309> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.960400,0.000000,13.841688>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.094309,0.000000,13.975597>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<12.960400,0.000000,13.841688> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.960850,0.000000,11.236375>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.036147,0.000000,11.192903>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,29.997566,0> translate<12.960850,0.000000,11.236375> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.960850,0.000000,12.564822>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.036147,0.000000,12.608294>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-29.997566,0> translate<12.960850,0.000000,12.564822> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.963772,0.000000,17.983200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.952709,0.000000,17.983200>}
box{<0,0,-0.076200><0.988938,0.035000,0.076200> rotate<0,0.000000,0> translate<12.963772,0.000000,17.983200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.981709,0.000000,8.163000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.971088,0.000000,8.163000>}
box{<0,0,-0.076200><0.989378,0.035000,0.076200> rotate<0,0.000000,0> translate<12.981709,0.000000,8.163000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.986250,0.000000,14.182775>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.061547,0.000000,14.139303>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,29.997566,0> translate<12.986250,0.000000,14.182775> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.990975,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.425019,-1.535000,21.945600>}
box{<0,0,-0.076200><0.434044,0.035000,0.076200> rotate<0,0.000000,0> translate<12.990975,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.005250,0.000000,28.077222>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.080547,0.000000,28.120694>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-29.997566,0> translate<13.005250,0.000000,28.077222> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.036147,0.000000,11.192903>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.120125,0.000000,11.170400>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,14.999808,0> translate<13.036147,0.000000,11.192903> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.036147,0.000000,12.608294>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.120125,0.000000,12.630797>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-14.999808,0> translate<13.036147,0.000000,12.608294> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.041778,-1.535000,21.183600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,21.183600>}
box{<0,0,-0.076200><1.537822,0.035000,0.076200> rotate<0,0.000000,0> translate<13.041778,-1.535000,21.183600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.061547,0.000000,14.139303>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.145525,0.000000,14.116800>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,14.999808,0> translate<13.061547,0.000000,14.139303> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.068909,0.000000,11.029197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.058288,0.000000,11.029197>}
box{<0,0,-0.076200><0.989378,0.035000,0.076200> rotate<0,0.000000,0> translate<13.068909,0.000000,11.029197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.080547,0.000000,28.120694>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.164525,0.000000,28.143197>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-14.999808,0> translate<13.080547,0.000000,28.120694> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.094309,0.000000,12.718400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.083687,0.000000,12.718400>}
box{<0,0,-0.076200><0.989378,0.035000,0.076200> rotate<0,0.000000,0> translate<13.094309,0.000000,12.718400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.094309,0.000000,13.975597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.083687,0.000000,13.975597>}
box{<0,0,-0.076200><0.989378,0.035000,0.076200> rotate<0,0.000000,0> translate<13.094309,0.000000,13.975597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.116172,0.000000,18.135600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.846600,0.000000,18.135600>}
box{<0,0,-0.076200><0.730428,0.035000,0.076200> rotate<0,0.000000,0> translate<13.116172,0.000000,18.135600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.117272,0.000000,23.033000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.201250,0.000000,23.055503>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-14.999808,0> translate<13.117272,0.000000,23.033000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.120125,0.000000,11.170400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.487403,0.000000,11.170400>}
box{<0,0,-0.076200><0.367278,0.035000,0.076200> rotate<0,0.000000,0> translate<13.120125,0.000000,11.170400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.120125,0.000000,12.630797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.487403,0.000000,12.630797>}
box{<0,0,-0.076200><0.367278,0.035000,0.076200> rotate<0,0.000000,0> translate<13.120125,0.000000,12.630797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.143375,-1.535000,21.793200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,21.793200>}
box{<0,0,-0.076200><1.436225,0.035000,0.076200> rotate<0,0.000000,0> translate<13.143375,-1.535000,21.793200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.145525,0.000000,14.116800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.512803,0.000000,14.116800>}
box{<0,0,-0.076200><0.367278,0.035000,0.076200> rotate<0,0.000000,0> translate<13.145525,0.000000,14.116800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.164525,0.000000,28.143197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.401803,0.000000,28.143197>}
box{<0,0,-0.076200><1.237278,0.035000,0.076200> rotate<0,0.000000,0> translate<13.164525,0.000000,28.143197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.168488,0.000000,22.991797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.284200,0.000000,22.876081>}
box{<0,0,-0.076200><0.163644,0.035000,0.076200> rotate<0,44.997804,0> translate<13.168488,0.000000,22.991797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.194178,-1.535000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,21.336000>}
box{<0,0,-0.076200><1.385422,0.035000,0.076200> rotate<0,0.000000,0> translate<13.194178,-1.535000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.201250,0.000000,23.055503>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.276547,0.000000,23.098975>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-29.997566,0> translate<13.201250,0.000000,23.055503> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.207997,-1.535000,21.349819>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.207997,-1.535000,21.728578>}
box{<0,0,-0.076200><0.378759,0.035000,0.076200> rotate<0,90.000000,0> translate<13.207997,-1.535000,21.728578> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.207997,-1.535000,21.488400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,21.488400>}
box{<0,0,-0.076200><1.371603,0.035000,0.076200> rotate<0,0.000000,0> translate<13.207997,-1.535000,21.488400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.207997,-1.535000,21.640800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,21.640800>}
box{<0,0,-0.076200><1.371603,0.035000,0.076200> rotate<0,0.000000,0> translate<13.207997,-1.535000,21.640800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.268572,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.846600,0.000000,18.288000>}
box{<0,0,-0.076200><0.578028,0.035000,0.076200> rotate<0,0.000000,0> translate<13.268572,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.276547,0.000000,23.098975>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.284200,0.000000,23.106631>}
box{<0,0,-0.076200><0.010825,0.035000,0.076200> rotate<0,-45.008725,0> translate<13.276547,0.000000,23.098975> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.284200,0.000000,23.106631>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.284200,0.000000,22.876081>}
box{<0,0,-0.076200><0.230550,0.035000,0.076200> rotate<0,-90.000000,0> translate<13.284200,0.000000,22.876081> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.335000,0.000000,16.739656>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.587941,0.000000,16.992597>}
box{<0,0,-0.076200><0.357712,0.035000,0.076200> rotate<0,-44.997030,0> translate<13.335000,0.000000,16.739656> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.348819,-1.535000,22.021800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.425019,-1.535000,21.945600>}
box{<0,0,-0.076200><0.107763,0.035000,0.076200> rotate<0,44.997030,0> translate<13.348819,-1.535000,22.021800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.348819,-1.535000,22.783797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.425019,-1.535000,22.859997>}
box{<0,0,-0.076200><0.107763,0.035000,0.076200> rotate<0,-44.997030,0> translate<13.348819,-1.535000,22.783797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.393850,0.000000,15.577197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.512803,0.000000,15.577197>}
box{<0,0,-0.076200><0.118953,0.035000,0.076200> rotate<0,0.000000,0> translate<13.393850,0.000000,15.577197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.393850,0.000000,15.577197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.920253,0.000000,16.103600>}
box{<0,0,-0.076200><0.744446,0.035000,0.076200> rotate<0,-44.997030,0> translate<13.393850,0.000000,15.577197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.411200,-1.535000,16.371419>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.679019,-1.535000,16.103600>}
box{<0,0,-0.076200><0.378753,0.035000,0.076200> rotate<0,44.997030,0> translate<13.411200,-1.535000,16.371419> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.411200,-1.535000,16.750178>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.411200,-1.535000,16.371419>}
box{<0,0,-0.076200><0.378759,0.035000,0.076200> rotate<0,-90.000000,0> translate<13.411200,-1.535000,16.371419> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.411200,-1.535000,16.750178>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.679019,-1.535000,17.017997>}
box{<0,0,-0.076200><0.378753,0.035000,0.076200> rotate<0,-44.997030,0> translate<13.411200,-1.535000,16.750178> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.420972,0.000000,18.440400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.846600,0.000000,18.440400>}
box{<0,0,-0.076200><0.425628,0.035000,0.076200> rotate<0,0.000000,0> translate<13.420972,0.000000,18.440400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.425019,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.803778,-1.535000,21.945600>}
box{<0,0,-0.076200><0.378759,0.035000,0.076200> rotate<0,0.000000,0> translate<13.425019,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.425019,-1.535000,22.859997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.803778,-1.535000,22.859997>}
box{<0,0,-0.076200><0.378759,0.035000,0.076200> rotate<0,0.000000,0> translate<13.425019,-1.535000,22.859997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.474372,0.000000,18.493800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.846600,0.000000,18.493800>}
box{<0,0,-0.076200><0.372228,0.035000,0.076200> rotate<0,0.000000,0> translate<13.474372,0.000000,18.493800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.487403,0.000000,11.170400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.487403,0.000000,11.824388>}
box{<0,0,-0.076200><0.653987,0.035000,0.076200> rotate<0,90.000000,0> translate<13.487403,0.000000,11.824388> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.487403,0.000000,11.277600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.639791,0.000000,11.277600>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<13.487403,0.000000,11.277600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.487403,0.000000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.639791,0.000000,11.430000>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<13.487403,0.000000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.487403,0.000000,11.582400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.639791,0.000000,11.582400>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<13.487403,0.000000,11.582400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.487403,0.000000,11.734800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.639791,0.000000,11.734800>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<13.487403,0.000000,11.734800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.487403,0.000000,11.824388>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.639791,0.000000,11.824388>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<13.487403,0.000000,11.824388> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.487403,0.000000,11.976809>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.487403,0.000000,12.630797>}
box{<0,0,-0.076200><0.653988,0.035000,0.076200> rotate<0,90.000000,0> translate<13.487403,0.000000,12.630797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.487403,0.000000,11.976809>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.639791,0.000000,11.976809>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<13.487403,0.000000,11.976809> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.487403,0.000000,12.039600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.639791,0.000000,12.039600>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<13.487403,0.000000,12.039600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.487403,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.639791,0.000000,12.192000>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<13.487403,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.487403,0.000000,12.344400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.639791,0.000000,12.344400>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<13.487403,0.000000,12.344400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.487403,0.000000,12.496800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.639791,0.000000,12.496800>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<13.487403,0.000000,12.496800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.512803,0.000000,14.116800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.512803,0.000000,14.770788>}
box{<0,0,-0.076200><0.653987,0.035000,0.076200> rotate<0,90.000000,0> translate<13.512803,0.000000,14.770788> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.512803,0.000000,14.173200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.665191,0.000000,14.173200>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<13.512803,0.000000,14.173200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.512803,0.000000,14.325600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.665191,0.000000,14.325600>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<13.512803,0.000000,14.325600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.512803,0.000000,14.478000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.665191,0.000000,14.478000>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<13.512803,0.000000,14.478000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.512803,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.665191,0.000000,14.630400>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<13.512803,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.512803,0.000000,14.770788>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.665191,0.000000,14.770788>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<13.512803,0.000000,14.770788> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.512803,0.000000,14.923209>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.512803,0.000000,15.577197>}
box{<0,0,-0.076200><0.653987,0.035000,0.076200> rotate<0,90.000000,0> translate<13.512803,0.000000,15.577197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.512803,0.000000,14.923209>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.665191,0.000000,14.923209>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<13.512803,0.000000,14.923209> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.512803,0.000000,14.935200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.665191,0.000000,14.935200>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<13.512803,0.000000,14.935200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.512803,0.000000,15.087600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.665191,0.000000,15.087600>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<13.512803,0.000000,15.087600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.512803,0.000000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.665191,0.000000,15.240000>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<13.512803,0.000000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.512803,0.000000,15.392400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.665191,0.000000,15.392400>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<13.512803,0.000000,15.392400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.512803,0.000000,15.544800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.665191,0.000000,15.544800>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<13.512803,0.000000,15.544800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.513853,0.000000,15.697200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.630400,0.000000,15.697200>}
box{<0,0,-0.076200><1.116547,0.035000,0.076200> rotate<0,0.000000,0> translate<13.513853,0.000000,15.697200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.518216,0.000000,24.917397>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.681200,0.000000,24.754409>}
box{<0,0,-0.076200><0.230497,0.035000,0.076200> rotate<0,44.997579,0> translate<13.518216,0.000000,24.917397> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.587941,0.000000,16.992597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.653619,0.000000,16.992597>}
box{<0,0,-0.076200><0.065678,0.035000,0.076200> rotate<0,0.000000,0> translate<13.587941,0.000000,16.992597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.594413,0.000000,24.841200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.681197,0.000000,24.841200>}
box{<0,0,-0.076200><0.086784,0.035000,0.076200> rotate<0,0.000000,0> translate<13.594413,0.000000,24.841200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.639791,0.000000,11.170400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.007072,0.000000,11.170400>}
box{<0,0,-0.076200><0.367281,0.035000,0.076200> rotate<0,0.000000,0> translate<13.639791,0.000000,11.170400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.639791,0.000000,11.824388>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.639791,0.000000,11.170400>}
box{<0,0,-0.076200><0.653987,0.035000,0.076200> rotate<0,-90.000000,0> translate<13.639791,0.000000,11.170400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.639791,0.000000,12.630797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.639791,0.000000,11.976809>}
box{<0,0,-0.076200><0.653988,0.035000,0.076200> rotate<0,-90.000000,0> translate<13.639791,0.000000,11.976809> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.639791,0.000000,12.630797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.007072,0.000000,12.630797>}
box{<0,0,-0.076200><0.367281,0.035000,0.076200> rotate<0,0.000000,0> translate<13.639791,0.000000,12.630797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.653619,0.000000,16.992597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.679019,0.000000,17.017997>}
box{<0,0,-0.076200><0.035921,0.035000,0.076200> rotate<0,-44.997030,0> translate<13.653619,0.000000,16.992597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.665191,0.000000,14.116800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.032472,0.000000,14.116800>}
box{<0,0,-0.076200><0.367281,0.035000,0.076200> rotate<0,0.000000,0> translate<13.665191,0.000000,14.116800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.665191,0.000000,14.770788>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.665191,0.000000,14.116800>}
box{<0,0,-0.076200><0.653987,0.035000,0.076200> rotate<0,-90.000000,0> translate<13.665191,0.000000,14.116800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.665191,0.000000,15.577197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.665191,0.000000,14.923209>}
box{<0,0,-0.076200><0.653987,0.035000,0.076200> rotate<0,-90.000000,0> translate<13.665191,0.000000,14.923209> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.665191,0.000000,15.577197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.032472,0.000000,15.577197>}
box{<0,0,-0.076200><0.367281,0.035000,0.076200> rotate<0,0.000000,0> translate<13.665191,0.000000,15.577197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.666253,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.630400,0.000000,15.849600>}
box{<0,0,-0.076200><0.964147,0.035000,0.076200> rotate<0,0.000000,0> translate<13.666253,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.679019,-1.535000,16.103600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.057778,-1.535000,16.103600>}
box{<0,0,-0.076200><0.378759,0.035000,0.076200> rotate<0,0.000000,0> translate<13.679019,-1.535000,16.103600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.679019,0.000000,17.017997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.057778,0.000000,17.017997>}
box{<0,0,-0.076200><0.378759,0.035000,0.076200> rotate<0,0.000000,0> translate<13.679019,0.000000,17.017997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.679019,-1.535000,17.017997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,17.017997>}
box{<0,0,-0.076200><0.900581,0.035000,0.076200> rotate<0,0.000000,0> translate<13.679019,-1.535000,17.017997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.681197,0.000000,25.069803>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.681200,0.000000,24.754409>}
box{<0,0,-0.076200><0.315394,0.035000,0.076200> rotate<0,89.993493,0> translate<13.681197,0.000000,25.069803> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.681197,0.000000,25.069803>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.285188,0.000000,25.069803>}
box{<0,0,-0.076200><0.603991,0.035000,0.076200> rotate<0,0.000000,0> translate<13.681197,0.000000,25.069803> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.681197,0.000000,25.222191>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.681200,0.000000,25.639472>}
box{<0,0,-0.076200><0.417281,0.035000,0.076200> rotate<0,-89.993631,0> translate<13.681197,0.000000,25.222191> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.681197,0.000000,25.222191>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.285188,0.000000,25.222191>}
box{<0,0,-0.076200><0.603991,0.035000,0.076200> rotate<0,0.000000,0> translate<13.681197,0.000000,25.222191> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.681200,0.000000,25.639472>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.685094,0.000000,25.654000>}
box{<0,0,-0.076200><0.015041,0.035000,0.076200> rotate<0,-74.991553,0> translate<13.681200,0.000000,25.639472> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.803778,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.071597,-1.535000,22.213419>}
box{<0,0,-0.076200><0.378753,0.035000,0.076200> rotate<0,-44.997030,0> translate<13.803778,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.803778,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,21.945600>}
box{<0,0,-0.076200><0.775822,0.035000,0.076200> rotate<0,0.000000,0> translate<13.803778,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.803778,-1.535000,22.859997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.071597,-1.535000,22.592178>}
box{<0,0,-0.076200><0.378753,0.035000,0.076200> rotate<0,44.997030,0> translate<13.803778,-1.535000,22.859997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.818653,0.000000,16.002000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.630400,0.000000,16.002000>}
box{<0,0,-0.076200><0.811747,0.035000,0.076200> rotate<0,0.000000,0> translate<13.818653,0.000000,16.002000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.846600,0.000000,18.089309>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.980509,0.000000,17.955400>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<13.846600,0.000000,18.089309> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.846600,0.000000,18.493800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.846600,0.000000,18.089309>}
box{<0,0,-0.076200><0.404491,0.035000,0.076200> rotate<0,-90.000000,0> translate<13.846600,0.000000,18.089309> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.920253,0.000000,16.103600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.057778,0.000000,16.103600>}
box{<0,0,-0.076200><0.137525,0.035000,0.076200> rotate<0,0.000000,0> translate<13.920253,0.000000,16.103600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.956175,-1.535000,22.707600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,22.707600>}
box{<0,0,-0.076200><0.623425,0.035000,0.076200> rotate<0,0.000000,0> translate<13.956175,-1.535000,22.707600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.956178,-1.535000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,22.098000>}
box{<0,0,-0.076200><0.623422,0.035000,0.076200> rotate<0,0.000000,0> translate<13.956178,-1.535000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.971088,0.000000,8.163000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.104997,0.000000,8.296909>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<13.971088,0.000000,8.163000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.980509,0.000000,17.955400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.856600,0.000000,17.955400>}
box{<0,0,-0.076200><0.876091,0.035000,0.076200> rotate<0,0.000000,0> translate<13.980509,0.000000,17.955400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.007072,0.000000,11.170400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.091050,0.000000,11.192903>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-14.999808,0> translate<14.007072,0.000000,11.170400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.007072,0.000000,12.630797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.091050,0.000000,12.608294>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,14.999808,0> translate<14.007072,0.000000,12.630797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.019281,0.000000,9.772000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.058288,0.000000,9.772000>}
box{<0,0,-0.076200><0.039006,0.035000,0.076200> rotate<0,0.000000,0> translate<14.019281,0.000000,9.772000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.019281,0.000000,9.772000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.104997,0.000000,9.686288>}
box{<0,0,-0.076200><0.121218,0.035000,0.076200> rotate<0,44.995986,0> translate<14.019281,0.000000,9.772000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.032472,0.000000,14.116800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.116450,0.000000,14.139303>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-14.999808,0> translate<14.032472,0.000000,14.116800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.032472,0.000000,15.577197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.116450,0.000000,15.554694>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,14.999808,0> translate<14.032472,0.000000,15.577197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.037684,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.588653,0.000000,9.753600>}
box{<0,0,-0.076200><0.550969,0.035000,0.076200> rotate<0,0.000000,0> translate<14.037684,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.037688,0.000000,8.229600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.588647,0.000000,8.229600>}
box{<0,0,-0.076200><0.550959,0.035000,0.076200> rotate<0,0.000000,0> translate<14.037688,0.000000,8.229600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.046197,0.000000,23.204997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.046197,0.000000,24.365800>}
box{<0,0,-0.076200><1.160803,0.035000,0.076200> rotate<0,90.000000,0> translate<14.046197,0.000000,24.365800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.046197,0.000000,23.204997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.658016,0.000000,23.204997>}
box{<0,0,-0.076200><0.611819,0.035000,0.076200> rotate<0,0.000000,0> translate<14.046197,0.000000,23.204997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.046197,0.000000,23.317200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.754997,0.000000,23.317200>}
box{<0,0,-0.076200><0.708800,0.035000,0.076200> rotate<0,0.000000,0> translate<14.046197,0.000000,23.317200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.046197,0.000000,23.469600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.754997,0.000000,23.469600>}
box{<0,0,-0.076200><0.708800,0.035000,0.076200> rotate<0,0.000000,0> translate<14.046197,0.000000,23.469600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.046197,0.000000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.755000,0.000000,23.622000>}
box{<0,0,-0.076200><0.708803,0.035000,0.076200> rotate<0,0.000000,0> translate<14.046197,0.000000,23.622000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.046197,0.000000,23.774400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.755000,0.000000,23.774400>}
box{<0,0,-0.076200><0.708803,0.035000,0.076200> rotate<0,0.000000,0> translate<14.046197,0.000000,23.774400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.046197,0.000000,23.926800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.755000,0.000000,23.926800>}
box{<0,0,-0.076200><0.708803,0.035000,0.076200> rotate<0,0.000000,0> translate<14.046197,0.000000,23.926800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.046197,0.000000,24.079200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.771544,0.000000,24.079200>}
box{<0,0,-0.076200><0.725347,0.035000,0.076200> rotate<0,0.000000,0> translate<14.046197,0.000000,24.079200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.046197,0.000000,24.231600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.875828,0.000000,24.231600>}
box{<0,0,-0.076200><0.829631,0.035000,0.076200> rotate<0,0.000000,0> translate<14.046197,0.000000,24.231600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.046197,0.000000,24.365800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.285203,0.000000,24.365800>}
box{<0,0,-0.076200><0.239006,0.035000,0.076200> rotate<0,0.000000,0> translate<14.046197,0.000000,24.365800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.057778,-1.535000,16.103600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.260978,-1.535000,16.306800>}
box{<0,0,-0.076200><0.287368,0.035000,0.076200> rotate<0,-44.997030,0> translate<14.057778,-1.535000,16.103600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.057778,0.000000,16.103600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.325597,0.000000,16.371419>}
box{<0,0,-0.076200><0.378753,0.035000,0.076200> rotate<0,-44.997030,0> translate<14.057778,0.000000,16.103600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.057778,0.000000,17.017997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.325597,0.000000,16.750178>}
box{<0,0,-0.076200><0.378753,0.035000,0.076200> rotate<0,44.997030,0> translate<14.057778,0.000000,17.017997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.058288,0.000000,9.772000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.192197,0.000000,9.905909>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<14.058288,0.000000,9.772000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.058288,0.000000,11.029197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.192197,0.000000,10.895288>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<14.058288,0.000000,11.029197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.071597,-1.535000,22.213419>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.071597,-1.535000,22.592178>}
box{<0,0,-0.076200><0.378759,0.035000,0.076200> rotate<0,90.000000,0> translate<14.071597,-1.535000,22.592178> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.071597,-1.535000,22.250400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,22.250400>}
box{<0,0,-0.076200><0.508003,0.035000,0.076200> rotate<0,0.000000,0> translate<14.071597,-1.535000,22.250400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.071597,-1.535000,22.402800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,22.402800>}
box{<0,0,-0.076200><0.508003,0.035000,0.076200> rotate<0,0.000000,0> translate<14.071597,-1.535000,22.402800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.071597,-1.535000,22.555200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,22.555200>}
box{<0,0,-0.076200><0.508003,0.035000,0.076200> rotate<0,0.000000,0> translate<14.071597,-1.535000,22.555200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.083687,0.000000,12.718400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.217597,0.000000,12.852309>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<14.083687,0.000000,12.718400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.083687,0.000000,13.975597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.217597,0.000000,13.841688>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<14.083687,0.000000,13.975597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.091050,0.000000,11.192903>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.166347,0.000000,11.236375>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-29.997566,0> translate<14.091050,0.000000,11.192903> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.091050,0.000000,12.608294>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.166347,0.000000,12.564822>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,29.997566,0> translate<14.091050,0.000000,12.608294> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.104997,0.000000,8.296909>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.104997,0.000000,9.686288>}
box{<0,0,-0.076200><1.389378,0.035000,0.076200> rotate<0,90.000000,0> translate<14.104997,0.000000,9.686288> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.104997,0.000000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.546200,0.000000,8.382000>}
box{<0,0,-0.076200><0.441203,0.035000,0.076200> rotate<0,0.000000,0> translate<14.104997,0.000000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.104997,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.546200,0.000000,8.534400>}
box{<0,0,-0.076200><0.441203,0.035000,0.076200> rotate<0,0.000000,0> translate<14.104997,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.104997,0.000000,8.686800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.546200,0.000000,8.686800>}
box{<0,0,-0.076200><0.441203,0.035000,0.076200> rotate<0,0.000000,0> translate<14.104997,0.000000,8.686800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.104997,0.000000,8.839200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.546200,0.000000,8.839200>}
box{<0,0,-0.076200><0.441203,0.035000,0.076200> rotate<0,0.000000,0> translate<14.104997,0.000000,8.839200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.104997,0.000000,8.991600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.200188,0.000000,8.991600>}
box{<0,0,-0.076200><1.095191,0.035000,0.076200> rotate<0,0.000000,0> translate<14.104997,0.000000,8.991600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.104997,0.000000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.546200,0.000000,9.144000>}
box{<0,0,-0.076200><0.441203,0.035000,0.076200> rotate<0,0.000000,0> translate<14.104997,0.000000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.104997,0.000000,9.296400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.546200,0.000000,9.296400>}
box{<0,0,-0.076200><0.441203,0.035000,0.076200> rotate<0,0.000000,0> translate<14.104997,0.000000,9.296400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.104997,0.000000,9.448800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.546200,0.000000,9.448800>}
box{<0,0,-0.076200><0.441203,0.035000,0.076200> rotate<0,0.000000,0> translate<14.104997,0.000000,9.448800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.104997,0.000000,9.601200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.546200,0.000000,9.601200>}
box{<0,0,-0.076200><0.441203,0.035000,0.076200> rotate<0,0.000000,0> translate<14.104997,0.000000,9.601200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.108578,0.000000,16.154400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.630400,0.000000,16.154400>}
box{<0,0,-0.076200><0.521822,0.035000,0.076200> rotate<0,0.000000,0> translate<14.108578,0.000000,16.154400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.108578,-1.535000,16.154400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.016503,-1.535000,16.154400>}
box{<0,0,-0.076200><0.907925,0.035000,0.076200> rotate<0,0.000000,0> translate<14.108578,-1.535000,16.154400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.114684,0.000000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.256600,0.000000,10.972800>}
box{<0,0,-0.076200><0.141916,0.035000,0.076200> rotate<0,0.000000,0> translate<14.114684,0.000000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.116450,0.000000,14.139303>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.191747,0.000000,14.182775>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-29.997566,0> translate<14.116450,0.000000,14.139303> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.116450,0.000000,15.554694>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.191747,0.000000,15.511222>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,29.997566,0> translate<14.116450,0.000000,15.554694> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.133588,0.000000,15.544800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.630400,0.000000,15.544800>}
box{<0,0,-0.076200><0.496812,0.035000,0.076200> rotate<0,0.000000,0> translate<14.133588,0.000000,15.544800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.159375,0.000000,16.916400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.295909,0.000000,16.916400>}
box{<0,0,-0.076200><1.136534,0.035000,0.076200> rotate<0,0.000000,0> translate<14.159375,0.000000,16.916400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.166347,0.000000,11.236375>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.227822,0.000000,11.297850>}
box{<0,0,-0.076200><0.086939,0.035000,0.076200> rotate<0,-44.997030,0> translate<14.166347,0.000000,11.236375> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.166347,0.000000,12.564822>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.227822,0.000000,12.503347>}
box{<0,0,-0.076200><0.086939,0.035000,0.076200> rotate<0,44.997030,0> translate<14.166347,0.000000,12.564822> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.166888,0.000000,12.801600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.835047,0.000000,12.801600>}
box{<0,0,-0.076200><1.668159,0.035000,0.076200> rotate<0,0.000000,0> translate<14.166888,0.000000,12.801600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.175159,0.000000,14.173200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.436509,0.000000,14.173200>}
box{<0,0,-0.076200><0.261350,0.035000,0.076200> rotate<0,0.000000,0> translate<14.175159,0.000000,14.173200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.190884,0.000000,13.868400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.307400,0.000000,13.868400>}
box{<0,0,-0.076200><0.116516,0.035000,0.076200> rotate<0,0.000000,0> translate<14.190884,0.000000,13.868400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.191747,0.000000,14.182775>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.253222,0.000000,14.244250>}
box{<0,0,-0.076200><0.086939,0.035000,0.076200> rotate<0,-44.997030,0> translate<14.191747,0.000000,14.182775> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.191747,0.000000,15.511222>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.253222,0.000000,15.449747>}
box{<0,0,-0.076200><0.086939,0.035000,0.076200> rotate<0,44.997030,0> translate<14.191747,0.000000,15.511222> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.192197,0.000000,9.905909>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.192197,0.000000,10.045000>}
box{<0,0,-0.076200><0.139091,0.035000,0.076200> rotate<0,90.000000,0> translate<14.192197,0.000000,10.045000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.192197,0.000000,9.906000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.773975,0.000000,9.906000>}
box{<0,0,-0.076200><0.581778,0.035000,0.076200> rotate<0,0.000000,0> translate<14.192197,0.000000,9.906000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.192197,0.000000,10.045000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.318313,0.000000,10.045000>}
box{<0,0,-0.076200><0.126116,0.035000,0.076200> rotate<0,0.000000,0> translate<14.192197,0.000000,10.045000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.192197,0.000000,10.756197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.192197,0.000000,10.895288>}
box{<0,0,-0.076200><0.139091,0.035000,0.076200> rotate<0,90.000000,0> translate<14.192197,0.000000,10.895288> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.192197,0.000000,10.756197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.256600,0.000000,10.756197>}
box{<0,0,-0.076200><0.064403,0.035000,0.076200> rotate<0,0.000000,0> translate<14.192197,0.000000,10.756197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.192197,0.000000,10.820400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.256600,0.000000,10.820400>}
box{<0,0,-0.076200><0.064403,0.035000,0.076200> rotate<0,0.000000,0> translate<14.192197,0.000000,10.820400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.207572,0.000000,11.277600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.385709,0.000000,11.277600>}
box{<0,0,-0.076200><0.178138,0.035000,0.076200> rotate<0,0.000000,0> translate<14.207572,0.000000,11.277600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.217597,0.000000,12.852309>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.217597,0.000000,12.991400>}
box{<0,0,-0.076200><0.139091,0.035000,0.076200> rotate<0,90.000000,0> translate<14.217597,0.000000,12.991400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.217597,0.000000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.355709,0.000000,12.954000>}
box{<0,0,-0.076200><0.138113,0.035000,0.076200> rotate<0,0.000000,0> translate<14.217597,0.000000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.217597,0.000000,12.991400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.318313,0.000000,12.991400>}
box{<0,0,-0.076200><0.100716,0.035000,0.076200> rotate<0,0.000000,0> translate<14.217597,0.000000,12.991400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.217597,0.000000,13.702597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.217597,0.000000,13.841688>}
box{<0,0,-0.076200><0.139091,0.035000,0.076200> rotate<0,90.000000,0> translate<14.217597,0.000000,13.841688> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.217597,0.000000,13.702597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.307400,0.000000,13.702597>}
box{<0,0,-0.076200><0.089803,0.035000,0.076200> rotate<0,0.000000,0> translate<14.217597,0.000000,13.702597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.217597,0.000000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.307400,0.000000,13.716000>}
box{<0,0,-0.076200><0.089803,0.035000,0.076200> rotate<0,0.000000,0> translate<14.217597,0.000000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.227822,0.000000,11.297850>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.271294,0.000000,11.373147>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-59.996495,0> translate<14.227822,0.000000,11.297850> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.227822,0.000000,12.503347>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.271294,0.000000,12.428050>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,59.996495,0> translate<14.227822,0.000000,12.503347> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.231603,0.000000,12.496800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.785109,0.000000,12.496800>}
box{<0,0,-0.076200><3.553506,0.035000,0.076200> rotate<0,0.000000,0> translate<14.231603,0.000000,12.496800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.253222,0.000000,14.244250>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.296694,0.000000,14.319547>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-59.996495,0> translate<14.253222,0.000000,14.244250> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.253222,0.000000,15.449747>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.296694,0.000000,15.374450>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,59.996495,0> translate<14.253222,0.000000,15.449747> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.256600,0.000000,10.996087>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.256600,0.000000,10.756197>}
box{<0,0,-0.076200><0.239891,0.035000,0.076200> rotate<0,-90.000000,0> translate<14.256600,0.000000,10.756197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.256600,0.000000,10.996087>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.390509,0.000000,11.129997>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<14.256600,0.000000,10.996087> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.260978,0.000000,16.306800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.686306,0.000000,16.306800>}
box{<0,0,-0.076200><0.425328,0.035000,0.076200> rotate<0,0.000000,0> translate<14.260978,0.000000,16.306800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.260978,-1.535000,16.306800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.756344,-1.535000,16.306800>}
box{<0,0,-0.076200><0.495366,0.035000,0.076200> rotate<0,0.000000,0> translate<14.260978,-1.535000,16.306800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.271294,0.000000,11.373147>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.275281,0.000000,11.388031>}
box{<0,0,-0.076200><0.015409,0.035000,0.076200> rotate<0,-74.997766,0> translate<14.271294,0.000000,11.373147> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.271294,0.000000,12.428050>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.293797,0.000000,12.344072>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,74.994252,0> translate<14.271294,0.000000,12.428050> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.275281,0.000000,11.388031>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.390509,0.000000,11.272800>}
box{<0,0,-0.076200><0.162959,0.035000,0.076200> rotate<0,44.997807,0> translate<14.275281,0.000000,11.388031> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.286331,0.000000,15.392400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.630400,0.000000,15.392400>}
box{<0,0,-0.076200><0.344069,0.035000,0.076200> rotate<0,0.000000,0> translate<14.286331,0.000000,15.392400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.293709,0.000000,12.344400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.304916,0.000000,12.344400>}
box{<0,0,-0.076200><0.011206,0.035000,0.076200> rotate<0,0.000000,0> translate<14.293709,0.000000,12.344400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.293797,0.000000,12.333281>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.293797,0.000000,12.344072>}
box{<0,0,-0.076200><0.010791,0.035000,0.076200> rotate<0,90.000000,0> translate<14.293797,0.000000,12.344072> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.293797,0.000000,12.333281>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.390509,0.000000,12.429997>}
box{<0,0,-0.076200><0.136774,0.035000,0.076200> rotate<0,-44.997956,0> translate<14.293797,0.000000,12.333281> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.296694,0.000000,14.319547>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.307400,0.000000,14.359513>}
box{<0,0,-0.076200><0.041375,0.035000,0.076200> rotate<0,-74.998403,0> translate<14.296694,0.000000,14.319547> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.296694,0.000000,15.374450>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.319197,0.000000,15.290472>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,74.994252,0> translate<14.296694,0.000000,15.374450> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.298313,0.000000,14.325600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.307400,0.000000,14.325600>}
box{<0,0,-0.076200><0.009087,0.035000,0.076200> rotate<0,0.000000,0> translate<14.298313,0.000000,14.325600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.307400,0.000000,13.891688>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.307400,0.000000,13.702597>}
box{<0,0,-0.076200><0.189091,0.035000,0.076200> rotate<0,-90.000000,0> translate<14.307400,0.000000,13.702597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.307400,0.000000,13.891688>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.441309,0.000000,14.025597>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<14.307400,0.000000,13.891688> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.307400,0.000000,14.302309>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.441309,0.000000,14.168400>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<14.307400,0.000000,14.302309> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.307400,0.000000,14.359513>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.307400,0.000000,14.302309>}
box{<0,0,-0.076200><0.057203,0.035000,0.076200> rotate<0,-90.000000,0> translate<14.307400,0.000000,14.302309> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.311775,0.000000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.143509,0.000000,16.764000>}
box{<0,0,-0.076200><0.831734,0.035000,0.076200> rotate<0,0.000000,0> translate<14.311775,0.000000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.318313,0.000000,10.045000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.390509,0.000000,9.972800>}
box{<0,0,-0.076200><0.102104,0.035000,0.076200> rotate<0,44.998270,0> translate<14.318313,0.000000,10.045000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.318313,0.000000,12.991400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.441309,0.000000,12.868400>}
box{<0,0,-0.076200><0.173946,0.035000,0.076200> rotate<0,44.997758,0> translate<14.318313,0.000000,12.991400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.319197,0.000000,15.203481>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.319197,0.000000,15.290472>}
box{<0,0,-0.076200><0.086991,0.035000,0.076200> rotate<0,90.000000,0> translate<14.319197,0.000000,15.290472> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.319197,0.000000,15.203481>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.441309,0.000000,15.325597>}
box{<0,0,-0.076200><0.172695,0.035000,0.076200> rotate<0,-44.997763,0> translate<14.319197,0.000000,15.203481> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.319197,0.000000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.355716,0.000000,15.240000>}
box{<0,0,-0.076200><0.036519,0.035000,0.076200> rotate<0,0.000000,0> translate<14.319197,0.000000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.325597,0.000000,16.371419>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.325597,0.000000,16.750178>}
box{<0,0,-0.076200><0.378759,0.035000,0.076200> rotate<0,90.000000,0> translate<14.325597,0.000000,16.750178> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.325597,0.000000,16.459200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.838709,0.000000,16.459200>}
box{<0,0,-0.076200><0.513113,0.035000,0.076200> rotate<0,0.000000,0> translate<14.325597,0.000000,16.459200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.325597,0.000000,16.611600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.991109,0.000000,16.611600>}
box{<0,0,-0.076200><0.665513,0.035000,0.076200> rotate<0,0.000000,0> translate<14.325597,0.000000,16.611600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.390509,0.000000,9.972800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.479888,0.000000,9.972800>}
box{<0,0,-0.076200><1.089378,0.035000,0.076200> rotate<0,0.000000,0> translate<14.390509,0.000000,9.972800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.390509,0.000000,11.129997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.479888,0.000000,11.129997>}
box{<0,0,-0.076200><1.089378,0.035000,0.076200> rotate<0,0.000000,0> translate<14.390509,0.000000,11.129997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.390509,0.000000,11.272800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.479888,0.000000,11.272800>}
box{<0,0,-0.076200><1.089378,0.035000,0.076200> rotate<0,0.000000,0> translate<14.390509,0.000000,11.272800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.390509,0.000000,12.429997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.479888,0.000000,12.429997>}
box{<0,0,-0.076200><1.089378,0.035000,0.076200> rotate<0,0.000000,0> translate<14.390509,0.000000,12.429997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.401788,0.000000,27.254191>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.401788,0.000000,27.101803>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,-90.000000,0> translate<14.401788,0.000000,27.101803> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.401803,0.000000,27.254209>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.401803,0.000000,28.143197>}
box{<0,0,-0.076200><0.888987,0.035000,0.076200> rotate<0,90.000000,0> translate<14.401803,0.000000,28.143197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.401803,0.000000,27.254209>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.554191,0.000000,27.254209>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<14.401803,0.000000,27.254209> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.401803,0.000000,27.279600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.554191,0.000000,27.279600>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<14.401803,0.000000,27.279600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.401803,0.000000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.554191,0.000000,27.432000>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<14.401803,0.000000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.401803,0.000000,27.584400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.554191,0.000000,27.584400>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<14.401803,0.000000,27.584400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.401803,0.000000,27.736800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.554191,0.000000,27.736800>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<14.401803,0.000000,27.736800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.401803,0.000000,27.889200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.554191,0.000000,27.889200>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<14.401803,0.000000,27.889200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.401803,0.000000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.554191,0.000000,28.041600>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<14.401803,0.000000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.437591,0.000000,24.365800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.754872,0.000000,24.365800>}
box{<0,0,-0.076200><0.317281,0.035000,0.076200> rotate<0,0.000000,0> translate<14.437591,0.000000,24.365800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.437591,0.000000,25.069788>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.437591,0.000000,24.365800>}
box{<0,0,-0.076200><0.703988,0.035000,0.076200> rotate<0,-90.000000,0> translate<14.437591,0.000000,24.365800> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.441309,0.000000,12.868400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.530688,0.000000,12.868400>}
box{<0,0,-0.076200><1.089378,0.035000,0.076200> rotate<0,0.000000,0> translate<14.441309,0.000000,12.868400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.441309,0.000000,14.025597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.530688,0.000000,14.025597>}
box{<0,0,-0.076200><1.089378,0.035000,0.076200> rotate<0,0.000000,0> translate<14.441309,0.000000,14.025597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.441309,0.000000,14.168400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.530688,0.000000,14.168400>}
box{<0,0,-0.076200><1.089378,0.035000,0.076200> rotate<0,0.000000,0> translate<14.441309,0.000000,14.168400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.441309,0.000000,15.325597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.630400,0.000000,15.325597>}
box{<0,0,-0.076200><0.189091,0.035000,0.076200> rotate<0,0.000000,0> translate<14.441309,0.000000,15.325597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.478000,-1.535000,25.814056>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,25.712456>}
box{<0,0,-0.076200><0.143684,0.035000,0.076200> rotate<0,44.997030,0> translate<14.478000,-1.535000,25.814056> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.478000,-1.535000,26.255941>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.478000,-1.535000,25.814056>}
box{<0,0,-0.076200><0.441884,0.035000,0.076200> rotate<0,-90.000000,0> translate<14.478000,-1.535000,25.814056> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.478000,-1.535000,26.255941>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.790456,-1.535000,26.568397>}
box{<0,0,-0.076200><0.441880,0.035000,0.076200> rotate<0,-44.997030,0> translate<14.478000,-1.535000,26.255941> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.546200,0.000000,8.348125>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.568703,0.000000,8.264147>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,74.994252,0> translate<14.546200,0.000000,8.348125> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.546200,0.000000,8.915403>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.546200,0.000000,8.348125>}
box{<0,0,-0.076200><0.567278,0.035000,0.076200> rotate<0,-90.000000,0> translate<14.546200,0.000000,8.348125> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.546200,0.000000,8.915403>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.200188,0.000000,8.915403>}
box{<0,0,-0.076200><0.653987,0.035000,0.076200> rotate<0,0.000000,0> translate<14.546200,0.000000,8.915403> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.546200,0.000000,9.067791>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.200188,0.000000,9.067791>}
box{<0,0,-0.076200><0.653987,0.035000,0.076200> rotate<0,0.000000,0> translate<14.546200,0.000000,9.067791> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.546200,0.000000,9.635072>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.546200,0.000000,9.067791>}
box{<0,0,-0.076200><0.567281,0.035000,0.076200> rotate<0,-90.000000,0> translate<14.546200,0.000000,9.067791> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.546200,0.000000,9.635072>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.568703,0.000000,9.719050>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-74.994252,0> translate<14.546200,0.000000,9.635072> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.554191,0.000000,28.143197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.554191,0.000000,27.254209>}
box{<0,0,-0.076200><0.888987,0.035000,0.076200> rotate<0,-90.000000,0> translate<14.554191,0.000000,27.254209> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.554191,0.000000,28.143197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.791472,0.000000,28.143197>}
box{<0,0,-0.076200><1.237281,0.035000,0.076200> rotate<0,0.000000,0> translate<14.554191,0.000000,28.143197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.554209,0.000000,27.101803>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.554209,0.000000,27.254191>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,90.000000,0> translate<14.554209,0.000000,27.254191> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.554209,0.000000,27.101803>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.078197,0.000000,27.101803>}
box{<0,0,-0.076200><1.523987,0.035000,0.076200> rotate<0,0.000000,0> translate<14.554209,0.000000,27.101803> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.554209,0.000000,27.127200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780000,0.000000,27.127200>}
box{<0,0,-0.076200><3.225791,0.035000,0.076200> rotate<0,0.000000,0> translate<14.554209,0.000000,27.127200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.554209,0.000000,27.254191>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.078197,0.000000,27.254191>}
box{<0,0,-0.076200><1.523987,0.035000,0.076200> rotate<0,0.000000,0> translate<14.554209,0.000000,27.254191> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.568703,0.000000,8.264147>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.612175,0.000000,8.188850>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,59.996495,0> translate<14.568703,0.000000,8.264147> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.568703,0.000000,9.719050>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.612175,0.000000,9.794347>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-59.996495,0> translate<14.568703,0.000000,9.719050> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,25.712456>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.579600,-1.535000,17.017997>}
box{<0,0,-0.076200><8.694459,0.035000,0.076200> rotate<0,-90.000000,0> translate<14.579600,-1.535000,17.017997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.612175,0.000000,8.188850>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.673650,0.000000,8.127375>}
box{<0,0,-0.076200><0.086939,0.035000,0.076200> rotate<0,44.997030,0> translate<14.612175,0.000000,8.188850> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.612175,0.000000,9.794347>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.673650,0.000000,9.855822>}
box{<0,0,-0.076200><0.086939,0.035000,0.076200> rotate<0,-44.997030,0> translate<14.612175,0.000000,9.794347> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.630400,0.000000,16.250894>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.630400,0.000000,15.325597>}
box{<0,0,-0.076200><0.925297,0.035000,0.076200> rotate<0,-90.000000,0> translate<14.630400,0.000000,15.325597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.630400,0.000000,16.250894>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.838703,0.000000,16.459197>}
box{<0,0,-0.076200><0.294585,0.035000,0.076200> rotate<0,-44.997030,0> translate<14.630400,0.000000,16.250894> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.658016,0.000000,23.204997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.670416,0.000000,23.192597>}
box{<0,0,-0.076200><0.017536,0.035000,0.076200> rotate<0,44.997030,0> translate<14.658016,0.000000,23.204997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.670416,0.000000,23.192597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.755000,0.000000,23.192597>}
box{<0,0,-0.076200><0.084584,0.035000,0.076200> rotate<0,0.000000,0> translate<14.670416,0.000000,23.192597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.673650,0.000000,8.127375>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.748947,0.000000,8.083903>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,29.997566,0> translate<14.673650,0.000000,8.127375> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.673650,0.000000,9.855822>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.748947,0.000000,9.899294>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-29.997566,0> translate<14.673650,0.000000,9.855822> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.748947,0.000000,8.083903>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.832925,0.000000,8.061400>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,14.999808,0> translate<14.748947,0.000000,8.083903> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.748947,0.000000,9.899294>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.832925,0.000000,9.921797>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-14.999808,0> translate<14.748947,0.000000,9.899294> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.754872,0.000000,24.365800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.838850,0.000000,24.388303>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-14.999808,0> translate<14.754872,0.000000,24.365800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.754997,0.000000,23.548981>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.755000,0.000000,23.192597>}
box{<0,0,-0.076200><0.356384,0.035000,0.076200> rotate<0,89.993558,0> translate<14.754997,0.000000,23.548981> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.754997,0.000000,23.548981>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.225166,0.000000,23.548981>}
box{<0,0,-0.076200><0.470169,0.035000,0.076200> rotate<0,0.000000,0> translate<14.754997,0.000000,23.548981> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.755000,0.000000,23.549012>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.225166,0.000000,23.549012>}
box{<0,0,-0.076200><0.470166,0.035000,0.076200> rotate<0,0.000000,0> translate<14.755000,0.000000,23.549012> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.755000,0.000000,24.017472>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.755000,0.000000,23.549012>}
box{<0,0,-0.076200><0.468459,0.035000,0.076200> rotate<0,-90.000000,0> translate<14.755000,0.000000,23.549012> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.755000,0.000000,24.017472>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.777503,0.000000,24.101450>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-74.994252,0> translate<14.755000,0.000000,24.017472> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.756344,-1.535000,16.306800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.832541,-1.535000,16.230600>}
box{<0,0,-0.076200><0.107761,0.035000,0.076200> rotate<0,44.998205,0> translate<14.756344,-1.535000,16.306800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.777503,0.000000,24.101450>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.820975,0.000000,24.176747>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-59.996495,0> translate<14.777503,0.000000,24.101450> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.790456,-1.535000,26.568397>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.232341,-1.535000,26.568397>}
box{<0,0,-0.076200><0.441884,0.035000,0.076200> rotate<0,0.000000,0> translate<14.790456,-1.535000,26.568397> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.820975,0.000000,24.176747>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.882450,0.000000,24.238222>}
box{<0,0,-0.076200><0.086939,0.035000,0.076200> rotate<0,-44.997030,0> translate<14.820975,0.000000,24.176747> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.822791,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.956425,0.000000,24.384000>}
box{<0,0,-0.076200><1.133634,0.035000,0.076200> rotate<0,0.000000,0> translate<14.822791,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.832541,-1.535000,16.230600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.940303,-1.535000,16.230600>}
box{<0,0,-0.076200><0.107763,0.035000,0.076200> rotate<0,0.000000,0> translate<14.832541,-1.535000,16.230600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.832925,0.000000,8.061400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.200203,0.000000,8.061400>}
box{<0,0,-0.076200><0.367278,0.035000,0.076200> rotate<0,0.000000,0> translate<14.832925,0.000000,8.061400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.832925,0.000000,9.921797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.200203,0.000000,9.921797>}
box{<0,0,-0.076200><0.367278,0.035000,0.076200> rotate<0,0.000000,0> translate<14.832925,0.000000,9.921797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.838703,0.000000,16.459197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.324909,0.000000,16.945400>}
box{<0,0,-0.076200><0.687597,0.035000,0.076200> rotate<0,-44.996846,0> translate<14.838703,0.000000,16.459197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.838850,0.000000,24.388303>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.914147,0.000000,24.431775>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-29.997566,0> translate<14.838850,0.000000,24.388303> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.856600,0.000000,17.079309>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.990509,0.000000,16.945400>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<14.856600,0.000000,17.079309> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.856600,0.000000,17.955400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.856600,0.000000,17.079309>}
box{<0,0,-0.076200><0.876091,0.035000,0.076200> rotate<0,-90.000000,0> translate<14.856600,0.000000,17.079309> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.882450,0.000000,24.238222>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.957747,0.000000,24.281694>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-29.997566,0> translate<14.882450,0.000000,24.238222> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.914147,0.000000,24.431775>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.975622,0.000000,24.493250>}
box{<0,0,-0.076200><0.086939,0.035000,0.076200> rotate<0,-44.997030,0> translate<14.914147,0.000000,24.431775> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.940303,-1.535000,16.230600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.290800,-1.535000,15.880103>}
box{<0,0,-0.076200><0.495677,0.035000,0.076200> rotate<0,44.997030,0> translate<14.940303,-1.535000,16.230600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.957747,0.000000,24.281694>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.041725,0.000000,24.304197>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-14.999808,0> translate<14.957747,0.000000,24.281694> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.975622,0.000000,24.493250>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.019094,0.000000,24.568547>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-59.996495,0> translate<14.975622,0.000000,24.493250> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.990509,0.000000,16.945400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.324909,0.000000,16.945400>}
box{<0,0,-0.076200><0.334400,0.035000,0.076200> rotate<0,0.000000,0> translate<14.990509,0.000000,16.945400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.000531,0.000000,24.536400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.147709,0.000000,24.536400>}
box{<0,0,-0.076200><0.147178,0.035000,0.076200> rotate<0,0.000000,0> translate<15.000531,0.000000,24.536400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.019094,0.000000,24.568547>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.041597,0.000000,24.652525>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-74.994252,0> translate<15.019094,0.000000,24.568547> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.041597,0.000000,25.501600>}
box{<0,0,-0.076200><0.279409,0.035000,0.076200> rotate<0,90.000000,0> translate<15.041597,0.000000,25.501600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.041597,0.000000,25.298400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.082800,0.000000,25.298400>}
box{<0,0,-0.076200><0.041203,0.035000,0.076200> rotate<0,0.000000,0> translate<15.041597,0.000000,25.298400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.041597,0.000000,25.450800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.082800,0.000000,25.450800>}
box{<0,0,-0.076200><0.041203,0.035000,0.076200> rotate<0,0.000000,0> translate<15.041597,0.000000,25.450800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.041597,0.000000,25.501600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.082800,0.000000,25.501600>}
box{<0,0,-0.076200><0.041203,0.035000,0.076200> rotate<0,0.000000,0> translate<15.041597,0.000000,25.501600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.041725,0.000000,24.304197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.225181,0.000000,24.304197>}
box{<0,0,-0.076200><0.183456,0.035000,0.076200> rotate<0,0.000000,0> translate<15.041725,0.000000,24.304197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.082800,0.000000,24.601309>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.216709,0.000000,24.467400>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<15.082800,0.000000,24.601309> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.082800,0.000000,25.501600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.082800,0.000000,24.601309>}
box{<0,0,-0.076200><0.900291,0.035000,0.076200> rotate<0,-90.000000,0> translate<15.082800,0.000000,24.601309> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.138484,0.000000,20.574000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.153797,0.000000,20.558688>}
box{<0,0,-0.076200><0.021655,0.035000,0.076200> rotate<0,44.997030,0> translate<15.138484,0.000000,20.574000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.138484,0.000000,20.574000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.153797,0.000000,20.589309>}
box{<0,0,-0.076200><0.021653,0.035000,0.076200> rotate<0,-44.991183,0> translate<15.138484,0.000000,20.574000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.138484,0.000000,20.574000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.398988,0.000000,20.574000>}
box{<0,0,-0.076200><2.260503,0.035000,0.076200> rotate<0,0.000000,0> translate<15.138484,0.000000,20.574000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.153797,0.000000,20.497803>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.153797,0.000000,20.558688>}
box{<0,0,-0.076200><0.060884,0.035000,0.076200> rotate<0,90.000000,0> translate<15.153797,0.000000,20.558688> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.153797,0.000000,20.497803>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.398988,0.000000,20.497803>}
box{<0,0,-0.076200><2.245191,0.035000,0.076200> rotate<0,0.000000,0> translate<15.153797,0.000000,20.497803> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.153797,0.000000,20.589309>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.153797,0.000000,20.650191>}
box{<0,0,-0.076200><0.060881,0.035000,0.076200> rotate<0,90.000000,0> translate<15.153797,0.000000,20.650191> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.153797,0.000000,20.650191>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.398988,0.000000,20.650191>}
box{<0,0,-0.076200><2.245191,0.035000,0.076200> rotate<0,0.000000,0> translate<15.153797,0.000000,20.650191> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.200188,0.000000,9.067791>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.200188,0.000000,8.915403>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,-90.000000,0> translate<15.200188,0.000000,8.915403> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.200203,0.000000,8.061400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.200203,0.000000,8.915387>}
box{<0,0,-0.076200><0.853987,0.035000,0.076200> rotate<0,90.000000,0> translate<15.200203,0.000000,8.915387> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.200203,0.000000,8.077200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.352591,0.000000,8.077200>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<15.200203,0.000000,8.077200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.200203,0.000000,8.229600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.352591,0.000000,8.229600>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<15.200203,0.000000,8.229600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.200203,0.000000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.352591,0.000000,8.382000>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<15.200203,0.000000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.200203,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.352591,0.000000,8.534400>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<15.200203,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.200203,0.000000,8.686800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.352591,0.000000,8.686800>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<15.200203,0.000000,8.686800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.200203,0.000000,8.839200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.352591,0.000000,8.839200>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<15.200203,0.000000,8.839200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.200203,0.000000,8.915387>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.352591,0.000000,8.915387>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<15.200203,0.000000,8.915387> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.200203,0.000000,9.067809>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.200203,0.000000,9.921797>}
box{<0,0,-0.076200><0.853987,0.035000,0.076200> rotate<0,90.000000,0> translate<15.200203,0.000000,9.921797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.200203,0.000000,9.067809>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.352591,0.000000,9.067809>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<15.200203,0.000000,9.067809> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.200203,0.000000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.352591,0.000000,9.144000>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<15.200203,0.000000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.200203,0.000000,9.296400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.352591,0.000000,9.296400>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<15.200203,0.000000,9.296400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.200203,0.000000,9.448800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.352591,0.000000,9.448800>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<15.200203,0.000000,9.448800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.200203,0.000000,9.601200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.352591,0.000000,9.601200>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<15.200203,0.000000,9.601200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.200203,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.352591,0.000000,9.753600>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<15.200203,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.200203,0.000000,9.906000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.352591,0.000000,9.906000>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<15.200203,0.000000,9.906000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.216709,0.000000,24.467400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.873028,0.000000,24.467400>}
box{<0,0,-0.076200><0.656319,0.035000,0.076200> rotate<0,0.000000,0> translate<15.216709,0.000000,24.467400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.225166,0.000000,23.549012>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.225166,0.000000,23.548981>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,-90.000000,0> translate<15.225166,0.000000,23.548981> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.225181,0.000000,23.549031>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.225181,0.000000,24.304197>}
box{<0,0,-0.076200><0.755166,0.035000,0.076200> rotate<0,90.000000,0> translate<15.225181,0.000000,24.304197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.225181,0.000000,23.549031>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.225213,0.000000,23.549031>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<15.225181,0.000000,23.549031> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.225181,0.000000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.225213,0.000000,23.622000>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<15.225181,0.000000,23.622000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.225181,0.000000,23.774400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.225213,0.000000,23.774400>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<15.225181,0.000000,23.774400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.225181,0.000000,23.926800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.225213,0.000000,23.926800>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<15.225181,0.000000,23.926800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.225181,0.000000,24.079200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.225213,0.000000,24.079200>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<15.225181,0.000000,24.079200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.225181,0.000000,24.231600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.225213,0.000000,24.231600>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<15.225181,0.000000,24.231600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.225213,0.000000,24.304197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.225213,0.000000,23.549031>}
box{<0,0,-0.076200><0.755166,0.035000,0.076200> rotate<0,-90.000000,0> translate<15.225213,0.000000,23.549031> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.225213,0.000000,24.304197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.408672,0.000000,24.304197>}
box{<0,0,-0.076200><0.183459,0.035000,0.076200> rotate<0,0.000000,0> translate<15.225213,0.000000,24.304197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.232341,-1.535000,26.568397>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.544797,-1.535000,26.255941>}
box{<0,0,-0.076200><0.441880,0.035000,0.076200> rotate<0,44.997030,0> translate<15.232341,-1.535000,26.568397> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.283138,-1.535000,26.517600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,26.517600>}
box{<0,0,-0.076200><11.691663,0.035000,0.076200> rotate<0,0.000000,0> translate<15.283138,-1.535000,26.517600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.290800,-1.535000,15.880103>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.499103,-1.535000,15.671800>}
box{<0,0,-0.076200><0.294585,0.035000,0.076200> rotate<0,44.997030,0> translate<15.290800,-1.535000,15.880103> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.341597,0.000000,15.325597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.341597,0.000000,15.956303>}
box{<0,0,-0.076200><0.630706,0.035000,0.076200> rotate<0,90.000000,0> translate<15.341597,0.000000,15.956303> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.341597,0.000000,15.325597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.530688,0.000000,15.325597>}
box{<0,0,-0.076200><0.189091,0.035000,0.076200> rotate<0,0.000000,0> translate<15.341597,0.000000,15.325597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.341597,0.000000,15.392400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.748000,0.000000,15.392400>}
box{<0,0,-0.076200><0.406403,0.035000,0.076200> rotate<0,0.000000,0> translate<15.341597,0.000000,15.392400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.341597,0.000000,15.544800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.748000,0.000000,15.544800>}
box{<0,0,-0.076200><0.406403,0.035000,0.076200> rotate<0,0.000000,0> translate<15.341597,0.000000,15.544800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.341597,0.000000,15.697200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.654056,0.000000,15.697200>}
box{<0,0,-0.076200><0.312459,0.035000,0.076200> rotate<0,0.000000,0> translate<15.341597,0.000000,15.697200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.341597,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.544800,0.000000,15.849600>}
box{<0,0,-0.076200><0.203203,0.035000,0.076200> rotate<0,0.000000,0> translate<15.341597,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.341597,0.000000,15.956303>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.544800,0.000000,16.159509>}
box{<0,0,-0.076200><0.287375,0.035000,0.076200> rotate<0,-44.997471,0> translate<15.341597,0.000000,15.956303> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.352591,0.000000,8.061400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.719872,0.000000,8.061400>}
box{<0,0,-0.076200><0.367281,0.035000,0.076200> rotate<0,0.000000,0> translate<15.352591,0.000000,8.061400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.352591,0.000000,8.915387>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.352591,0.000000,8.061400>}
box{<0,0,-0.076200><0.853987,0.035000,0.076200> rotate<0,-90.000000,0> translate<15.352591,0.000000,8.061400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.352591,0.000000,9.921797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.352591,0.000000,9.067809>}
box{<0,0,-0.076200><0.853987,0.035000,0.076200> rotate<0,-90.000000,0> translate<15.352591,0.000000,9.067809> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.352591,0.000000,9.921797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.719872,0.000000,9.921797>}
box{<0,0,-0.076200><0.367281,0.035000,0.076200> rotate<0,0.000000,0> translate<15.352591,0.000000,9.921797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.352609,0.000000,8.915403>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.352609,0.000000,9.067791>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,90.000000,0> translate<15.352609,0.000000,9.067791> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.352609,0.000000,8.915403>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.006597,0.000000,8.915403>}
box{<0,0,-0.076200><0.653987,0.035000,0.076200> rotate<0,0.000000,0> translate<15.352609,0.000000,8.915403> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.352609,0.000000,8.991600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,8.991600>}
box{<0,0,-0.076200><11.622191,0.035000,0.076200> rotate<0,0.000000,0> translate<15.352609,0.000000,8.991600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.352609,0.000000,9.067791>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.006597,0.000000,9.067791>}
box{<0,0,-0.076200><0.653987,0.035000,0.076200> rotate<0,0.000000,0> translate<15.352609,0.000000,9.067791> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.387291,0.000000,16.002000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.544800,0.000000,16.002000>}
box{<0,0,-0.076200><0.157509,0.035000,0.076200> rotate<0,0.000000,0> translate<15.387291,0.000000,16.002000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.408672,0.000000,24.304197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.492650,0.000000,24.281694>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,14.999808,0> translate<15.408672,0.000000,24.304197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.435538,-1.535000,26.365200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,26.365200>}
box{<0,0,-0.076200><11.539263,0.035000,0.076200> rotate<0,0.000000,0> translate<15.435538,-1.535000,26.365200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,16.733494>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,25.712456>}
box{<0,0,-0.076200><8.978963,0.035000,0.076200> rotate<0,90.000000,0> translate<15.443197,-1.535000,25.712456> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,16.733494>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.736575,-1.535000,16.440113>}
box{<0,0,-0.076200><0.414902,0.035000,0.076200> rotate<0,44.997335,0> translate<15.443197,-1.535000,16.733494> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.362706,-1.535000,16.764000>}
box{<0,0,-0.076200><0.919509,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,16.916400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.515106,-1.535000,16.916400>}
box{<0,0,-0.076200><1.071909,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,16.916400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.521022,-1.535000,17.068800>}
box{<0,0,-0.076200><4.077825,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,17.068800> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,22.707600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,22.707600>}
box{<0,0,-0.076200><11.531603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,22.707600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,22.860000>}
box{<0,0,-0.076200><11.531603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,23.012400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,23.012400>}
box{<0,0,-0.076200><11.531603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,23.012400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,23.164800>}
box{<0,0,-0.076200><11.531603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,23.317200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,23.317200>}
box{<0,0,-0.076200><11.531603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,23.317200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,23.469600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,23.469600>}
box{<0,0,-0.076200><11.531603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,23.469600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,23.622000>}
box{<0,0,-0.076200><11.531603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,23.622000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,23.774400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,23.774400>}
box{<0,0,-0.076200><11.531603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,23.774400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,23.926800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,23.926800>}
box{<0,0,-0.076200><11.531603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,23.926800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,24.079200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,24.079200>}
box{<0,0,-0.076200><11.531603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,24.079200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,24.231600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,24.231600>}
box{<0,0,-0.076200><11.531603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,24.231600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,24.384000>}
box{<0,0,-0.076200><11.531603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,24.536400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,24.536400>}
box{<0,0,-0.076200><11.531603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,24.536400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,24.688800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,24.688800>}
box{<0,0,-0.076200><11.531603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,24.688800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,24.841200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,24.841200>}
box{<0,0,-0.076200><11.531603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,24.841200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,24.993600>}
box{<0,0,-0.076200><11.531603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,25.146000>}
box{<0,0,-0.076200><11.531603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,25.298400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,25.298400>}
box{<0,0,-0.076200><11.531603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,25.298400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,25.450800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,25.450800>}
box{<0,0,-0.076200><11.531603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,25.450800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,25.603200>}
box{<0,0,-0.076200><11.531603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.443197,-1.535000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.443197,-1.535000,25.712456>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.544797,-1.535000,25.814056>}
box{<0,0,-0.076200><0.143684,0.035000,0.076200> rotate<0,-44.997030,0> translate<15.443197,-1.535000,25.712456> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.479888,0.000000,9.972800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.613797,0.000000,10.106709>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<15.479888,0.000000,9.972800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.479888,0.000000,11.129997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.613797,0.000000,10.996087>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<15.479888,0.000000,11.129997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.479888,0.000000,11.272800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.613797,0.000000,11.406709>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<15.479888,0.000000,11.272800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.479888,0.000000,12.429997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.613797,0.000000,12.296088>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<15.479888,0.000000,12.429997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.484684,0.000000,11.125200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.854000,0.000000,11.125200>}
box{<0,0,-0.076200><3.369316,0.035000,0.076200> rotate<0,0.000000,0> translate<15.484684,0.000000,11.125200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.484688,0.000000,11.277600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.861484,0.000000,11.277600>}
box{<0,0,-0.076200><3.376797,0.035000,0.076200> rotate<0,0.000000,0> translate<15.484688,0.000000,11.277600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.486341,-1.535000,25.755600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,25.755600>}
box{<0,0,-0.076200><11.488459,0.035000,0.076200> rotate<0,0.000000,0> translate<15.486341,-1.535000,25.755600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.492650,0.000000,24.281694>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.567947,0.000000,24.238222>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,29.997566,0> translate<15.492650,0.000000,24.281694> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.499103,-1.535000,15.671800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.679459,-1.535000,15.671800>}
box{<0,0,-0.076200><0.180356,0.035000,0.076200> rotate<0,0.000000,0> translate<15.499103,-1.535000,15.671800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.530688,0.000000,12.868400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.664597,0.000000,13.002309>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<15.530688,0.000000,12.868400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.530688,0.000000,14.025597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.664597,0.000000,13.891688>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<15.530688,0.000000,14.025597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.530688,0.000000,14.168400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.664597,0.000000,14.302309>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<15.530688,0.000000,14.168400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.530688,0.000000,15.325597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.664597,0.000000,15.191688>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<15.530688,0.000000,15.325597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.535484,0.000000,14.020800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.740628,0.000000,14.020800>}
box{<0,0,-0.076200><0.205144,0.035000,0.076200> rotate<0,0.000000,0> translate<15.535484,0.000000,14.020800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.535488,0.000000,14.173200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.884309,0.000000,14.173200>}
box{<0,0,-0.076200><0.348822,0.035000,0.076200> rotate<0,0.000000,0> translate<15.535488,0.000000,14.173200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.539691,0.000000,16.154400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.544800,0.000000,16.154400>}
box{<0,0,-0.076200><0.005109,0.035000,0.076200> rotate<0,0.000000,0> translate<15.539691,0.000000,16.154400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.544797,-1.535000,25.814056>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.544797,-1.535000,26.255941>}
box{<0,0,-0.076200><0.441884,0.035000,0.076200> rotate<0,90.000000,0> translate<15.544797,-1.535000,26.255941> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.544797,-1.535000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,25.908000>}
box{<0,0,-0.076200><11.430003,0.035000,0.076200> rotate<0,0.000000,0> translate<15.544797,-1.535000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.544797,-1.535000,26.060400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,26.060400>}
box{<0,0,-0.076200><11.430003,0.035000,0.076200> rotate<0,0.000000,0> translate<15.544797,-1.535000,26.060400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.544797,0.000000,26.211663>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.544797,0.000000,26.212800>}
box{<0,0,-0.076200><0.001137,0.035000,0.076200> rotate<0,90.000000,0> translate<15.544797,0.000000,26.212800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.544797,0.000000,26.211663>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.743653,0.000000,26.121597>}
box{<0,0,-0.076200><0.218302,0.035000,0.076200> rotate<0,24.365032,0> translate<15.544797,0.000000,26.211663> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.544797,0.000000,26.212800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.791472,0.000000,26.212800>}
box{<0,0,-0.076200><0.246675,0.035000,0.076200> rotate<0,0.000000,0> translate<15.544797,0.000000,26.212800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.544797,-1.535000,26.212800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,26.212800>}
box{<0,0,-0.076200><11.430003,0.035000,0.076200> rotate<0,0.000000,0> translate<15.544797,-1.535000,26.212800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.544800,0.000000,15.806456>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.748000,0.000000,15.603259>}
box{<0,0,-0.076200><0.287366,0.035000,0.076200> rotate<0,44.996590,0> translate<15.544800,0.000000,15.806456> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.544800,0.000000,16.159509>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.544800,0.000000,15.806456>}
box{<0,0,-0.076200><0.353053,0.035000,0.076200> rotate<0,-90.000000,0> translate<15.544800,0.000000,15.806456> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.565091,-1.535000,16.611600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.210306,-1.535000,16.611600>}
box{<0,0,-0.076200><0.645216,0.035000,0.076200> rotate<0,0.000000,0> translate<15.565091,-1.535000,16.611600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.565484,0.000000,12.344400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.632709,0.000000,12.344400>}
box{<0,0,-0.076200><2.067225,0.035000,0.076200> rotate<0,0.000000,0> translate<15.565484,0.000000,12.344400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.565488,0.000000,10.058400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,10.058400>}
box{<0,0,-0.076200><11.409313,0.035000,0.076200> rotate<0,0.000000,0> translate<15.565488,0.000000,10.058400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.567947,0.000000,24.238222>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.603572,0.000000,24.202597>}
box{<0,0,-0.076200><0.050381,0.035000,0.076200> rotate<0,44.997030,0> translate<15.567947,0.000000,24.238222> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.574569,0.000000,24.231600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.875828,0.000000,24.231600>}
box{<0,0,-0.076200><0.301259,0.035000,0.076200> rotate<0,0.000000,0> translate<15.574569,0.000000,24.231600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.603572,0.000000,24.202597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.846825,0.000000,24.202597>}
box{<0,0,-0.076200><0.243253,0.035000,0.076200> rotate<0,0.000000,0> translate<15.603572,0.000000,24.202597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.613797,0.000000,10.106709>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.613797,0.000000,10.996087>}
box{<0,0,-0.076200><0.889378,0.035000,0.076200> rotate<0,90.000000,0> translate<15.613797,0.000000,10.996087> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.613797,0.000000,10.210800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.035447,0.000000,10.210800>}
box{<0,0,-0.076200><3.421650,0.035000,0.076200> rotate<0,0.000000,0> translate<15.613797,0.000000,10.210800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.613797,0.000000,10.363200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.885478,0.000000,10.363200>}
box{<0,0,-0.076200><3.271681,0.035000,0.076200> rotate<0,0.000000,0> translate<15.613797,0.000000,10.363200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.613797,0.000000,10.515600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.854000,0.000000,10.515600>}
box{<0,0,-0.076200><3.240203,0.035000,0.076200> rotate<0,0.000000,0> translate<15.613797,0.000000,10.515600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.613797,0.000000,10.668000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.854000,0.000000,10.668000>}
box{<0,0,-0.076200><3.240203,0.035000,0.076200> rotate<0,0.000000,0> translate<15.613797,0.000000,10.668000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.613797,0.000000,10.820400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.557987,0.000000,10.820400>}
box{<0,0,-0.076200><3.944191,0.035000,0.076200> rotate<0,0.000000,0> translate<15.613797,0.000000,10.820400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.613797,0.000000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.854000,0.000000,10.972800>}
box{<0,0,-0.076200><3.240203,0.035000,0.076200> rotate<0,0.000000,0> translate<15.613797,0.000000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.613797,0.000000,11.406709>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.613797,0.000000,11.495800>}
box{<0,0,-0.076200><0.089091,0.035000,0.076200> rotate<0,90.000000,0> translate<15.613797,0.000000,11.495800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.613797,0.000000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.941028,0.000000,11.430000>}
box{<0,0,-0.076200><3.327231,0.035000,0.076200> rotate<0,0.000000,0> translate<15.613797,0.000000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.613797,0.000000,11.495800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.789894,0.000000,11.495800>}
box{<0,0,-0.076200><2.176097,0.035000,0.076200> rotate<0,0.000000,0> translate<15.613797,0.000000,11.495800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.613797,0.000000,12.206997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.613797,0.000000,12.296088>}
box{<0,0,-0.076200><0.089091,0.035000,0.076200> rotate<0,90.000000,0> translate<15.613797,0.000000,12.296088> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.613797,0.000000,12.206997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.495303,0.000000,12.206997>}
box{<0,0,-0.076200><1.881506,0.035000,0.076200> rotate<0,0.000000,0> translate<15.613797,0.000000,12.206997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.616284,0.000000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.748000,0.000000,15.240000>}
box{<0,0,-0.076200><0.131716,0.035000,0.076200> rotate<0,0.000000,0> translate<15.616284,0.000000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.616288,0.000000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.685078,0.000000,12.954000>}
box{<0,0,-0.076200><0.068791,0.035000,0.076200> rotate<0,0.000000,0> translate<15.616288,0.000000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.664597,0.000000,13.002309>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.664597,0.000000,13.012494>}
box{<0,0,-0.076200><0.010184,0.035000,0.076200> rotate<0,90.000000,0> translate<15.664597,0.000000,13.012494> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.664597,0.000000,13.012494>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.676103,0.000000,12.969547>}
box{<0,0,-0.076200><0.044462,0.035000,0.076200> rotate<0,74.996706,0> translate<15.664597,0.000000,13.012494> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.664597,0.000000,13.881503>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.664597,0.000000,13.891688>}
box{<0,0,-0.076200><0.010184,0.035000,0.076200> rotate<0,90.000000,0> translate<15.664597,0.000000,13.891688> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.664597,0.000000,13.881503>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.676103,0.000000,13.924450>}
box{<0,0,-0.076200><0.044462,0.035000,0.076200> rotate<0,-74.996706,0> translate<15.664597,0.000000,13.881503> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.664597,0.000000,14.302309>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.664597,0.000000,15.191688>}
box{<0,0,-0.076200><0.889378,0.035000,0.076200> rotate<0,90.000000,0> translate<15.664597,0.000000,15.191688> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.664597,0.000000,14.325600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.755200,0.000000,14.325600>}
box{<0,0,-0.076200><0.090603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.664597,0.000000,14.325600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.664597,0.000000,14.478000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.755200,0.000000,14.478000>}
box{<0,0,-0.076200><0.090603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.664597,0.000000,14.478000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.664597,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.755200,0.000000,14.630400>}
box{<0,0,-0.076200><0.090603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.664597,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.664597,0.000000,14.782800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.755200,0.000000,14.782800>}
box{<0,0,-0.076200><0.090603,0.035000,0.076200> rotate<0,0.000000,0> translate<15.664597,0.000000,14.782800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.664597,0.000000,14.935200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.748000,0.000000,14.935200>}
box{<0,0,-0.076200><0.083403,0.035000,0.076200> rotate<0,0.000000,0> translate<15.664597,0.000000,14.935200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.664597,0.000000,15.087600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.748000,0.000000,15.087600>}
box{<0,0,-0.076200><0.083403,0.035000,0.076200> rotate<0,0.000000,0> translate<15.664597,0.000000,15.087600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.676103,0.000000,12.969547>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.719575,0.000000,12.894250>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,59.996495,0> translate<15.676103,0.000000,12.969547> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.676103,0.000000,13.924450>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.719575,0.000000,13.999747>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-59.996495,0> translate<15.676103,0.000000,13.924450> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.679459,-1.535000,15.671800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.857256,-1.535000,15.494000>}
box{<0,0,-0.076200><0.251445,0.035000,0.076200> rotate<0,44.997534,0> translate<15.679459,-1.535000,15.671800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.717491,-1.535000,16.459200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.755663,-1.535000,16.459200>}
box{<0,0,-0.076200><0.038172,0.035000,0.076200> rotate<0,0.000000,0> translate<15.717491,-1.535000,16.459200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.719575,0.000000,12.894250>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.781050,0.000000,12.832775>}
box{<0,0,-0.076200><0.086939,0.035000,0.076200> rotate<0,44.997030,0> translate<15.719575,0.000000,12.894250> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.719575,0.000000,13.999747>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.781050,0.000000,14.061222>}
box{<0,0,-0.076200><0.086939,0.035000,0.076200> rotate<0,-44.997030,0> translate<15.719575,0.000000,13.999747> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.719872,0.000000,8.061400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.803850,0.000000,8.083903>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-14.999808,0> translate<15.719872,0.000000,8.061400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.719872,0.000000,9.921797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.803850,0.000000,9.899294>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,14.999808,0> translate<15.719872,0.000000,9.921797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.736575,-1.535000,16.440113>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.857256,-1.535000,16.560797>}
box{<0,0,-0.076200><0.170671,0.035000,0.076200> rotate<0,-44.997772,0> translate<15.736575,-1.535000,16.440113> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.743653,0.000000,26.121597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.819216,0.000000,26.121597>}
box{<0,0,-0.076200><0.075562,0.035000,0.076200> rotate<0,0.000000,0> translate<15.743653,0.000000,26.121597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.748000,0.000000,14.929903>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.755200,0.000000,14.922703>}
box{<0,0,-0.076200><0.010182,0.035000,0.076200> rotate<0,44.997030,0> translate<15.748000,0.000000,14.929903> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.748000,0.000000,15.603259>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.748000,0.000000,14.929903>}
box{<0,0,-0.076200><0.673356,0.035000,0.076200> rotate<0,-90.000000,0> translate<15.748000,0.000000,14.929903> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.755200,0.000000,14.302309>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.889109,0.000000,14.168400>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<15.755200,0.000000,14.302309> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.755200,0.000000,14.922703>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.755200,0.000000,14.302309>}
box{<0,0,-0.076200><0.620394,0.035000,0.076200> rotate<0,-90.000000,0> translate<15.755200,0.000000,14.302309> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.778825,0.000000,9.906000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,9.906000>}
box{<0,0,-0.076200><11.195975,0.035000,0.076200> rotate<0,0.000000,0> translate<15.778825,0.000000,9.906000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.778834,0.000000,8.077200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,8.077200>}
box{<0,0,-0.076200><11.195966,0.035000,0.076200> rotate<0,0.000000,0> translate<15.778834,0.000000,8.077200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.781050,0.000000,12.832775>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.856347,0.000000,12.789303>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,29.997566,0> translate<15.781050,0.000000,12.832775> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.781050,0.000000,14.061222>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.856347,0.000000,14.104694>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-29.997566,0> translate<15.781050,0.000000,14.061222> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.791472,0.000000,26.212800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.875450,0.000000,26.235303>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-14.999808,0> translate<15.791472,0.000000,26.212800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.791472,0.000000,26.212800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780000,0.000000,26.212800>}
box{<0,0,-0.076200><1.988528,0.035000,0.076200> rotate<0,0.000000,0> translate<15.791472,0.000000,26.212800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.791472,0.000000,28.143197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.875450,0.000000,28.120694>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,14.999808,0> translate<15.791472,0.000000,28.143197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.803850,0.000000,8.083903>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.879147,0.000000,8.127375>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-29.997566,0> translate<15.803850,0.000000,8.083903> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.803850,0.000000,9.899294>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.879147,0.000000,9.855822>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,29.997566,0> translate<15.803850,0.000000,9.899294> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.819216,0.000000,26.121597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.881772,0.000000,26.059038>}
box{<0,0,-0.076200><0.088470,0.035000,0.076200> rotate<0,44.998461,0> translate<15.819216,0.000000,26.121597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.846825,0.000000,24.202597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.882450,0.000000,24.238222>}
box{<0,0,-0.076200><0.050381,0.035000,0.076200> rotate<0,-44.997030,0> translate<15.846825,0.000000,24.202597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.856347,0.000000,12.789303>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.940325,0.000000,12.766800>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,14.999808,0> translate<15.856347,0.000000,12.789303> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.856347,0.000000,14.104694>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.940325,0.000000,14.127197>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-14.999808,0> translate<15.856347,0.000000,14.104694> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.857256,-1.535000,15.494000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.299141,-1.535000,15.494000>}
box{<0,0,-0.076200><0.441884,0.035000,0.076200> rotate<0,0.000000,0> translate<15.857256,-1.535000,15.494000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.857256,-1.535000,16.560797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.159503,-1.535000,16.560797>}
box{<0,0,-0.076200><0.302247,0.035000,0.076200> rotate<0,0.000000,0> translate<15.857256,-1.535000,16.560797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.873028,0.000000,24.467400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.940800,0.000000,24.399625>}
box{<0,0,-0.076200><0.095846,0.035000,0.076200> rotate<0,44.998351,0> translate<15.873028,0.000000,24.467400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.875450,0.000000,26.235303>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.950747,0.000000,26.278775>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-29.997566,0> translate<15.875450,0.000000,26.235303> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.875450,0.000000,28.120694>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.950747,0.000000,28.077222>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,29.997566,0> translate<15.875450,0.000000,28.120694> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.879147,0.000000,8.127375>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.940622,0.000000,8.188850>}
box{<0,0,-0.076200><0.086939,0.035000,0.076200> rotate<0,-44.997030,0> translate<15.879147,0.000000,8.127375> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.879147,0.000000,9.855822>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.940622,0.000000,9.794347>}
box{<0,0,-0.076200><0.086939,0.035000,0.076200> rotate<0,44.997030,0> translate<15.879147,0.000000,9.855822> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.880413,0.000000,26.060400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780000,0.000000,26.060400>}
box{<0,0,-0.076200><1.899588,0.035000,0.076200> rotate<0,0.000000,0> translate<15.880413,0.000000,26.060400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.881772,0.000000,26.059038>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.962347,0.000000,26.022547>}
box{<0,0,-0.076200><0.088453,0.035000,0.076200> rotate<0,24.363107,0> translate<15.881772,0.000000,26.059038> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.882450,0.000000,24.238222>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.957747,0.000000,24.281694>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-29.997566,0> translate<15.882450,0.000000,24.238222> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.889109,0.000000,14.168400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.509506,0.000000,14.168400>}
box{<0,0,-0.076200><0.620397,0.035000,0.076200> rotate<0,0.000000,0> translate<15.889109,0.000000,14.168400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.940325,0.000000,12.766800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.357603,0.000000,12.766797>}
box{<0,0,-0.076200><0.417278,0.035000,0.076200> rotate<0,0.000429,0> translate<15.940325,0.000000,12.766800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.940325,0.000000,14.127197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.357603,0.000000,14.127197>}
box{<0,0,-0.076200><0.417278,0.035000,0.076200> rotate<0,0.000000,0> translate<15.940325,0.000000,14.127197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.940622,0.000000,8.188850>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.984094,0.000000,8.264147>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-59.996495,0> translate<15.940622,0.000000,8.188850> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.940622,0.000000,9.794347>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.984094,0.000000,9.719050>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,59.996495,0> translate<15.940622,0.000000,9.794347> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.940800,0.000000,24.399625>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.037394,0.000000,24.303034>}
box{<0,0,-0.076200><0.136602,0.035000,0.076200> rotate<0,44.996103,0> translate<15.940800,0.000000,24.399625> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.950747,0.000000,26.278775>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.012222,0.000000,26.340250>}
box{<0,0,-0.076200><0.086939,0.035000,0.076200> rotate<0,-44.997030,0> translate<15.950747,0.000000,26.278775> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.950747,0.000000,28.077222>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.012222,0.000000,28.015747>}
box{<0,0,-0.076200><0.086939,0.035000,0.076200> rotate<0,44.997030,0> translate<15.950747,0.000000,28.077222> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.957747,0.000000,24.281694>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.037394,0.000000,24.303034>}
box{<0,0,-0.076200><0.082456,0.035000,0.076200> rotate<0,-14.998546,0> translate<15.957747,0.000000,24.281694> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.962347,0.000000,26.022547>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.988966,0.000000,25.951844>}
box{<0,0,-0.076200><0.075548,0.035000,0.076200> rotate<0,69.364759,0> translate<15.962347,0.000000,26.022547> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.964147,0.000000,8.229600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,8.229600>}
box{<0,0,-0.076200><11.010653,0.035000,0.076200> rotate<0,0.000000,0> translate<15.964147,0.000000,8.229600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.964147,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,9.753600>}
box{<0,0,-0.076200><11.010653,0.035000,0.076200> rotate<0,0.000000,0> translate<15.964147,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.984094,0.000000,8.264147>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.006597,0.000000,8.348125>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-74.994252,0> translate<15.984094,0.000000,8.264147> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.984094,0.000000,9.719050>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.006597,0.000000,9.635072>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,74.994252,0> translate<15.984094,0.000000,9.719050> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.986369,0.000000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.929597,0.000000,28.041600>}
box{<0,0,-0.076200><3.943228,0.035000,0.076200> rotate<0,0.000000,0> translate<15.986369,0.000000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.988966,0.000000,25.951844>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.042397,0.000000,25.898416>}
box{<0,0,-0.076200><0.075561,0.035000,0.076200> rotate<0,44.995355,0> translate<15.988966,0.000000,25.951844> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.006597,0.000000,8.348125>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.006597,0.000000,8.915403>}
box{<0,0,-0.076200><0.567278,0.035000,0.076200> rotate<0,90.000000,0> translate<16.006597,0.000000,8.915403> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.006597,0.000000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,8.382000>}
box{<0,0,-0.076200><10.968203,0.035000,0.076200> rotate<0,0.000000,0> translate<16.006597,0.000000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.006597,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,8.534400>}
box{<0,0,-0.076200><10.968203,0.035000,0.076200> rotate<0,0.000000,0> translate<16.006597,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.006597,0.000000,8.686800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,8.686800>}
box{<0,0,-0.076200><10.968203,0.035000,0.076200> rotate<0,0.000000,0> translate<16.006597,0.000000,8.686800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.006597,0.000000,8.839200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,8.839200>}
box{<0,0,-0.076200><10.968203,0.035000,0.076200> rotate<0,0.000000,0> translate<16.006597,0.000000,8.839200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.006597,0.000000,9.067791>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.006597,0.000000,9.635072>}
box{<0,0,-0.076200><0.567281,0.035000,0.076200> rotate<0,90.000000,0> translate<16.006597,0.000000,9.635072> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.006597,0.000000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,9.144000>}
box{<0,0,-0.076200><10.968203,0.035000,0.076200> rotate<0,0.000000,0> translate<16.006597,0.000000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.006597,0.000000,9.296400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,9.296400>}
box{<0,0,-0.076200><10.968203,0.035000,0.076200> rotate<0,0.000000,0> translate<16.006597,0.000000,9.296400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.006597,0.000000,9.448800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,9.448800>}
box{<0,0,-0.076200><10.968203,0.035000,0.076200> rotate<0,0.000000,0> translate<16.006597,0.000000,9.448800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.006597,0.000000,9.601200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,9.601200>}
box{<0,0,-0.076200><10.968203,0.035000,0.076200> rotate<0,0.000000,0> translate<16.006597,0.000000,9.601200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.012222,0.000000,26.340250>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.055694,0.000000,26.415547>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-59.996495,0> translate<16.012222,0.000000,26.340250> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.012222,0.000000,28.015747>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.055694,0.000000,27.940450>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,59.996495,0> translate<16.012222,0.000000,28.015747> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.026625,0.000000,26.365200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780000,0.000000,26.365200>}
box{<0,0,-0.076200><1.753375,0.035000,0.076200> rotate<0,0.000000,0> translate<16.026625,0.000000,26.365200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.032813,0.000000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.151219,0.000000,25.908000>}
box{<0,0,-0.076200><1.118406,0.035000,0.076200> rotate<0,0.000000,0> translate<16.032813,0.000000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.042397,0.000000,25.824597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.042397,0.000000,25.898416>}
box{<0,0,-0.076200><0.073819,0.035000,0.076200> rotate<0,90.000000,0> translate<16.042397,0.000000,25.898416> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.042397,0.000000,25.824597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.106088,0.000000,25.824597>}
box{<0,0,-0.076200><0.063691,0.035000,0.076200> rotate<0,0.000000,0> translate<16.042397,0.000000,25.824597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.055694,0.000000,26.415547>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.078197,0.000000,26.499525>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-74.994252,0> translate<16.055694,0.000000,26.415547> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.055694,0.000000,27.940450>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.078197,0.000000,27.856472>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,74.994252,0> translate<16.055694,0.000000,27.940450> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.069428,0.000000,27.889200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.929597,0.000000,27.889200>}
box{<0,0,-0.076200><3.860169,0.035000,0.076200> rotate<0,0.000000,0> translate<16.069428,0.000000,27.889200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.078197,0.000000,26.499525>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.078197,0.000000,27.101803>}
box{<0,0,-0.076200><0.602278,0.035000,0.076200> rotate<0,90.000000,0> translate<16.078197,0.000000,27.101803> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.078197,0.000000,26.517600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780000,0.000000,26.517600>}
box{<0,0,-0.076200><1.701803,0.035000,0.076200> rotate<0,0.000000,0> translate<16.078197,0.000000,26.517600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.078197,0.000000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780000,0.000000,26.670000>}
box{<0,0,-0.076200><1.701803,0.035000,0.076200> rotate<0,0.000000,0> translate<16.078197,0.000000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.078197,0.000000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780000,0.000000,26.822400>}
box{<0,0,-0.076200><1.701803,0.035000,0.076200> rotate<0,0.000000,0> translate<16.078197,0.000000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.078197,0.000000,26.974800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780000,0.000000,26.974800>}
box{<0,0,-0.076200><1.701803,0.035000,0.076200> rotate<0,0.000000,0> translate<16.078197,0.000000,26.974800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.078197,0.000000,27.254191>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.078197,0.000000,27.856472>}
box{<0,0,-0.076200><0.602281,0.035000,0.076200> rotate<0,90.000000,0> translate<16.078197,0.000000,27.856472> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.078197,0.000000,27.279600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780000,0.000000,27.279600>}
box{<0,0,-0.076200><1.701803,0.035000,0.076200> rotate<0,0.000000,0> translate<16.078197,0.000000,27.279600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.078197,0.000000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780000,0.000000,27.432000>}
box{<0,0,-0.076200><1.701803,0.035000,0.076200> rotate<0,0.000000,0> translate<16.078197,0.000000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.078197,0.000000,27.584400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.940300,0.000000,27.584400>}
box{<0,0,-0.076200><3.862103,0.035000,0.076200> rotate<0,0.000000,0> translate<16.078197,0.000000,27.584400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.078197,0.000000,27.736800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.929597,0.000000,27.736800>}
box{<0,0,-0.076200><3.851400,0.035000,0.076200> rotate<0,0.000000,0> translate<16.078197,0.000000,27.736800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.106088,0.000000,25.824597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.239997,0.000000,25.690688>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<16.106088,0.000000,25.824597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.159503,-1.535000,16.560797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.408400,-1.535000,16.809694>}
box{<0,0,-0.076200><0.351993,0.035000,0.076200> rotate<0,-44.997030,0> translate<16.159503,-1.535000,16.560797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.175084,0.000000,25.755600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.973466,0.000000,25.755600>}
box{<0,0,-0.076200><0.798381,0.035000,0.076200> rotate<0,0.000000,0> translate<16.175084,0.000000,25.755600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.225181,0.000000,23.549031>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.225181,0.000000,24.206200>}
box{<0,0,-0.076200><0.657169,0.035000,0.076200> rotate<0,90.000000,0> translate<16.225181,0.000000,24.206200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.225181,0.000000,23.549031>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.225213,0.000000,23.549031>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<16.225181,0.000000,23.549031> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.225181,0.000000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.225213,0.000000,23.622000>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<16.225181,0.000000,23.622000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.225181,0.000000,23.774400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.225213,0.000000,23.774400>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<16.225181,0.000000,23.774400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.225181,0.000000,23.926800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.225213,0.000000,23.926800>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<16.225181,0.000000,23.926800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.225181,0.000000,24.079200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.225213,0.000000,24.079200>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<16.225181,0.000000,24.079200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.225181,0.000000,24.206200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.225213,0.000000,24.206200>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<16.225181,0.000000,24.206200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.225213,0.000000,24.206200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.225213,0.000000,23.549031>}
box{<0,0,-0.076200><0.657169,0.035000,0.076200> rotate<0,-90.000000,0> translate<16.225213,0.000000,23.549031> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.225231,0.000000,23.548981>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.225231,0.000000,23.549012>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,90.000000,0> translate<16.225231,0.000000,23.549012> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.225231,0.000000,23.548981>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.725166,0.000000,23.548981>}
box{<0,0,-0.076200><0.499934,0.035000,0.076200> rotate<0,0.000000,0> translate<16.225231,0.000000,23.548981> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.225231,0.000000,23.549012>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.695397,0.000000,23.549012>}
box{<0,0,-0.076200><0.470166,0.035000,0.076200> rotate<0,0.000000,0> translate<16.225231,0.000000,23.549012> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.239997,0.000000,25.034369>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.239997,0.000000,25.690688>}
box{<0,0,-0.076200><0.656319,0.035000,0.076200> rotate<0,90.000000,0> translate<16.239997,0.000000,25.690688> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.239997,0.000000,25.034369>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.407772,0.000000,24.866597>}
box{<0,0,-0.076200><0.237267,0.035000,0.076200> rotate<0,44.996497,0> translate<16.239997,0.000000,25.034369> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.280769,0.000000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.932397,0.000000,24.993600>}
box{<0,0,-0.076200><0.651628,0.035000,0.076200> rotate<0,0.000000,0> translate<16.280769,0.000000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.299141,-1.535000,15.494000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.611597,-1.535000,15.806456>}
box{<0,0,-0.076200><0.441880,0.035000,0.076200> rotate<0,-44.997030,0> translate<16.299141,-1.535000,15.494000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.349941,-1.535000,15.544800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,15.544800>}
box{<0,0,-0.076200><10.624859,0.035000,0.076200> rotate<0,0.000000,0> translate<16.349941,-1.535000,15.544800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.357603,0.000000,12.766797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.357603,0.000000,13.370788>}
box{<0,0,-0.076200><0.603991,0.035000,0.076200> rotate<0,90.000000,0> translate<16.357603,0.000000,13.370788> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.357603,0.000000,12.801600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.509991,0.000000,12.801600>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<16.357603,0.000000,12.801600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.357603,0.000000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.509991,0.000000,12.954000>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<16.357603,0.000000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.357603,0.000000,13.106400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.509991,0.000000,13.106400>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<16.357603,0.000000,13.106400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.357603,0.000000,13.258800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.509991,0.000000,13.258800>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<16.357603,0.000000,13.258800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.357603,0.000000,13.370788>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.509991,0.000000,13.370788>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<16.357603,0.000000,13.370788> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.357603,0.000000,13.523209>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.357603,0.000000,14.127197>}
box{<0,0,-0.076200><0.603988,0.035000,0.076200> rotate<0,90.000000,0> translate<16.357603,0.000000,14.127197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.357603,0.000000,13.523209>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.509991,0.000000,13.523209>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<16.357603,0.000000,13.523209> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.357603,0.000000,13.563600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.509991,0.000000,13.563600>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<16.357603,0.000000,13.563600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.357603,0.000000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.509991,0.000000,13.716000>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<16.357603,0.000000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.357603,0.000000,13.868400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.509991,0.000000,13.868400>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<16.357603,0.000000,13.868400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.357603,0.000000,14.020800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.509991,0.000000,14.020800>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<16.357603,0.000000,14.020800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.407772,0.000000,24.866597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.932400,0.000000,24.866597>}
box{<0,0,-0.076200><0.524628,0.035000,0.076200> rotate<0,0.000000,0> translate<16.407772,0.000000,24.866597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.408400,-1.535000,16.809694>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.616703,-1.535000,17.017997>}
box{<0,0,-0.076200><0.294585,0.035000,0.076200> rotate<0,-44.997030,0> translate<16.408400,-1.535000,16.809694> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.502341,-1.535000,15.697200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,15.697200>}
box{<0,0,-0.076200><10.472459,0.035000,0.076200> rotate<0,0.000000,0> translate<16.502341,-1.535000,15.697200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.509506,0.000000,14.168400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.550709,0.000000,14.127197>}
box{<0,0,-0.076200><0.058270,0.035000,0.076200> rotate<0,44.997030,0> translate<16.509506,0.000000,14.168400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.509991,0.000000,12.766797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.927272,0.000000,12.766800>}
box{<0,0,-0.076200><0.417281,0.035000,0.076200> rotate<0,-0.000429,0> translate<16.509991,0.000000,12.766797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.509991,0.000000,13.370788>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.509991,0.000000,12.766797>}
box{<0,0,-0.076200><0.603991,0.035000,0.076200> rotate<0,-90.000000,0> translate<16.509991,0.000000,12.766797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.509991,0.000000,14.127197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.509991,0.000000,13.523209>}
box{<0,0,-0.076200><0.603988,0.035000,0.076200> rotate<0,-90.000000,0> translate<16.509991,0.000000,13.523209> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.509991,0.000000,14.127197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.550709,0.000000,14.127197>}
box{<0,0,-0.076200><0.040719,0.035000,0.076200> rotate<0,0.000000,0> translate<16.509991,0.000000,14.127197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.611597,-1.535000,15.806456>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.611597,-1.535000,16.007103>}
box{<0,0,-0.076200><0.200647,0.035000,0.076200> rotate<0,90.000000,0> translate<16.611597,-1.535000,16.007103> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.611597,-1.535000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,15.849600>}
box{<0,0,-0.076200><10.363203,0.035000,0.076200> rotate<0,0.000000,0> translate<16.611597,-1.535000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.611597,-1.535000,16.002000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,16.002000>}
box{<0,0,-0.076200><10.363203,0.035000,0.076200> rotate<0,0.000000,0> translate<16.611597,-1.535000,16.002000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.611597,-1.535000,16.007103>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.911294,-1.535000,16.306800>}
box{<0,0,-0.076200><0.423835,0.035000,0.076200> rotate<0,-44.997030,0> translate<16.611597,-1.535000,16.007103> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.616703,-1.535000,17.017997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.470219,-1.535000,17.017997>}
box{<0,0,-0.076200><2.853516,0.035000,0.076200> rotate<0,0.000000,0> translate<16.616703,-1.535000,17.017997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.695397,0.000000,23.549012>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.725166,0.000000,23.549012>}
box{<0,0,-0.076200><0.029769,0.035000,0.076200> rotate<0,0.000000,0> translate<16.695397,0.000000,23.549012> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.725166,0.000000,23.549012>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.725166,0.000000,23.548981>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,-90.000000,0> translate<16.725166,0.000000,23.548981> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.758894,-1.535000,16.154400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,16.154400>}
box{<0,0,-0.076200><10.215906,0.035000,0.076200> rotate<0,0.000000,0> translate<16.758894,-1.535000,16.154400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.911294,-1.535000,16.306800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.470219,-1.535000,16.306800>}
box{<0,0,-0.076200><2.558925,0.035000,0.076200> rotate<0,0.000000,0> translate<16.911294,-1.535000,16.306800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.927272,0.000000,12.766800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.011250,0.000000,12.789303>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-14.999808,0> translate<16.927272,0.000000,12.766800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.932397,0.000000,25.069803>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.932400,0.000000,24.866597>}
box{<0,0,-0.076200><0.203206,0.035000,0.076200> rotate<0,89.993179,0> translate<16.932397,0.000000,25.069803> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.932397,0.000000,25.069803>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.536388,0.000000,25.069803>}
box{<0,0,-0.076200><0.603991,0.035000,0.076200> rotate<0,0.000000,0> translate<16.932397,0.000000,25.069803> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.932397,0.000000,25.222191>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.932400,0.000000,25.639472>}
box{<0,0,-0.076200><0.417281,0.035000,0.076200> rotate<0,-89.993631,0> translate<16.932397,0.000000,25.222191> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.932397,0.000000,25.222191>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.536388,0.000000,25.222191>}
box{<0,0,-0.076200><0.603991,0.035000,0.076200> rotate<0,0.000000,0> translate<16.932397,0.000000,25.222191> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.932400,0.000000,25.639472>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.954903,0.000000,25.723450>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-74.994252,0> translate<16.932400,0.000000,25.639472> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.954903,0.000000,25.723450>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.998375,0.000000,25.798747>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-59.996495,0> translate<16.954903,0.000000,25.723450> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.998375,0.000000,25.798747>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.059850,0.000000,25.860222>}
box{<0,0,-0.076200><0.086939,0.035000,0.076200> rotate<0,-44.997030,0> translate<16.998375,0.000000,25.798747> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.011250,0.000000,12.789303>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.086547,0.000000,12.832775>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-29.997566,0> translate<17.011250,0.000000,12.789303> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.032547,0.000000,12.801600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.089909,0.000000,12.801600>}
box{<0,0,-0.076200><1.057362,0.035000,0.076200> rotate<0,0.000000,0> translate<17.032547,0.000000,12.801600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.059850,0.000000,25.860222>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.135147,0.000000,25.903694>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-29.997566,0> translate<17.059850,0.000000,25.860222> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.086547,0.000000,12.832775>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.148022,0.000000,12.894250>}
box{<0,0,-0.076200><0.086939,0.035000,0.076200> rotate<0,-44.997030,0> translate<17.086547,0.000000,12.832775> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.135147,0.000000,25.903694>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.219125,0.000000,25.926197>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-14.999808,0> translate<17.135147,0.000000,25.903694> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.148022,0.000000,12.894250>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.191494,0.000000,12.969547>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-59.996495,0> translate<17.148022,0.000000,12.894250> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.182516,0.000000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.225909,0.000000,12.954000>}
box{<0,0,-0.076200><0.043394,0.035000,0.076200> rotate<0,0.000000,0> translate<17.182516,0.000000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.191494,0.000000,12.969547>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.195481,0.000000,12.984431>}
box{<0,0,-0.076200><0.015409,0.035000,0.076200> rotate<0,-74.997766,0> translate<17.191494,0.000000,12.969547> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.195481,0.000000,12.984431>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.311509,0.000000,12.868400>}
box{<0,0,-0.076200><0.164091,0.035000,0.076200> rotate<0,44.997802,0> translate<17.195481,0.000000,12.984431> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.219125,0.000000,25.926197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.536403,0.000000,25.926197>}
box{<0,0,-0.076200><0.317278,0.035000,0.076200> rotate<0,0.000000,0> translate<17.219125,0.000000,25.926197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.311509,0.000000,12.868400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.156709,0.000000,12.868400>}
box{<0,0,-0.076200><0.845200,0.035000,0.076200> rotate<0,0.000000,0> translate<17.311509,0.000000,12.868400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.398988,0.000000,20.650191>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.398988,0.000000,20.497803>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,-90.000000,0> translate<17.398988,0.000000,20.497803> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.399003,0.000000,18.252597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.399003,0.000000,20.497788>}
box{<0,0,-0.076200><2.245191,0.035000,0.076200> rotate<0,90.000000,0> translate<17.399003,0.000000,20.497788> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.399003,0.000000,18.252597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.459888,0.000000,18.252597>}
box{<0,0,-0.076200><0.060884,0.035000,0.076200> rotate<0,0.000000,0> translate<17.399003,0.000000,18.252597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.399003,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.551391,0.000000,18.288000>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.399003,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.399003,0.000000,18.440400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.551391,0.000000,18.440400>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.399003,0.000000,18.440400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.399003,0.000000,18.592800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.551391,0.000000,18.592800>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.399003,0.000000,18.592800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.399003,0.000000,18.745200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.551391,0.000000,18.745200>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.399003,0.000000,18.745200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.399003,0.000000,18.897600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.551391,0.000000,18.897600>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.399003,0.000000,18.897600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.399003,0.000000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.551391,0.000000,19.050000>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.399003,0.000000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.399003,0.000000,19.202400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.551391,0.000000,19.202400>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.399003,0.000000,19.202400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.399003,0.000000,19.354800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.551391,0.000000,19.354800>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.399003,0.000000,19.354800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.399003,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.551391,0.000000,19.507200>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.399003,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.399003,0.000000,19.659600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.551391,0.000000,19.659600>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.399003,0.000000,19.659600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.399003,0.000000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.551391,0.000000,19.812000>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.399003,0.000000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.399003,0.000000,19.964400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.551391,0.000000,19.964400>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.399003,0.000000,19.964400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.399003,0.000000,20.116800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.551391,0.000000,20.116800>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.399003,0.000000,20.116800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.399003,0.000000,20.269200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.551391,0.000000,20.269200>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.399003,0.000000,20.269200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.399003,0.000000,20.421600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.551391,0.000000,20.421600>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.399003,0.000000,20.421600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.399003,0.000000,20.497788>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.551391,0.000000,20.497788>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.399003,0.000000,20.497788> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.399003,0.000000,20.650209>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.399003,0.000000,22.895400>}
box{<0,0,-0.076200><2.245191,0.035000,0.076200> rotate<0,90.000000,0> translate<17.399003,0.000000,22.895400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.399003,0.000000,20.650209>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.551391,0.000000,20.650209>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.399003,0.000000,20.650209> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.399003,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.551391,0.000000,20.726400>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.399003,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.399003,0.000000,20.878800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.551391,0.000000,20.878800>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.399003,0.000000,20.878800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.399003,0.000000,21.031200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.551391,0.000000,21.031200>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.399003,0.000000,21.031200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.399003,0.000000,21.183600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.551391,0.000000,21.183600>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.399003,0.000000,21.183600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.399003,0.000000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.551391,0.000000,21.336000>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.399003,0.000000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.399003,0.000000,21.488400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.551391,0.000000,21.488400>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.399003,0.000000,21.488400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.399003,0.000000,21.640800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.551391,0.000000,21.640800>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.399003,0.000000,21.640800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.399003,0.000000,21.793200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.551391,0.000000,21.793200>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.399003,0.000000,21.793200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.399003,0.000000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.551391,0.000000,21.945600>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.399003,0.000000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.399003,0.000000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.551391,0.000000,22.098000>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.399003,0.000000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.399003,0.000000,22.250400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.551391,0.000000,22.250400>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.399003,0.000000,22.250400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.399003,0.000000,22.402800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.551391,0.000000,22.402800>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.399003,0.000000,22.402800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.399003,0.000000,22.555200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.551391,0.000000,22.555200>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.399003,0.000000,22.555200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.399003,0.000000,22.707600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.551391,0.000000,22.707600>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.399003,0.000000,22.707600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.399003,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.551391,0.000000,22.860000>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<17.399003,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.399003,0.000000,22.895400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.459888,0.000000,22.895400>}
box{<0,0,-0.076200><0.060884,0.035000,0.076200> rotate<0,0.000000,0> translate<17.399003,0.000000,22.895400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.459888,0.000000,18.252597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.475197,0.000000,18.237284>}
box{<0,0,-0.076200><0.021653,0.035000,0.076200> rotate<0,45.002877,0> translate<17.459888,0.000000,18.252597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.459888,0.000000,22.895400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.475200,0.000000,22.910713>}
box{<0,0,-0.076200><0.021655,0.035000,0.076200> rotate<0,-44.997030,0> translate<17.459888,0.000000,22.895400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.475197,0.000000,18.237284>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.490509,0.000000,18.252597>}
box{<0,0,-0.076200><0.021655,0.035000,0.076200> rotate<0,-44.997030,0> translate<17.475197,0.000000,18.237284> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.475200,0.000000,22.910713>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.490509,0.000000,22.895400>}
box{<0,0,-0.076200><0.021653,0.035000,0.076200> rotate<0,45.002877,0> translate<17.475200,0.000000,22.910713> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.490509,0.000000,18.252597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.551391,0.000000,18.252597>}
box{<0,0,-0.076200><0.060881,0.035000,0.076200> rotate<0,0.000000,0> translate<17.490509,0.000000,18.252597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.490509,0.000000,22.895400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.551391,0.000000,22.895400>}
box{<0,0,-0.076200><0.060881,0.035000,0.076200> rotate<0,0.000000,0> translate<17.490509,0.000000,22.895400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.495303,0.000000,12.206997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.156709,0.000000,12.868400>}
box{<0,0,-0.076200><0.935367,0.035000,0.076200> rotate<0,-44.996895,0> translate<17.495303,0.000000,12.206997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.503166,0.000000,24.365800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.536403,0.000000,24.365800>}
box{<0,0,-0.076200><0.033237,0.035000,0.076200> rotate<0,0.000000,0> translate<17.503166,0.000000,24.365800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.503166,0.000000,24.365800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.555397,0.000000,24.313572>}
box{<0,0,-0.076200><0.073864,0.035000,0.076200> rotate<0,44.995316,0> translate<17.503166,0.000000,24.365800> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.551391,0.000000,20.497788>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.551391,0.000000,18.252597>}
box{<0,0,-0.076200><2.245191,0.035000,0.076200> rotate<0,-90.000000,0> translate<17.551391,0.000000,18.252597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.551391,0.000000,22.895400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.551391,0.000000,20.650209>}
box{<0,0,-0.076200><2.245191,0.035000,0.076200> rotate<0,-90.000000,0> translate<17.551391,0.000000,20.650209> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.551409,0.000000,20.497803>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.551409,0.000000,20.650191>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,90.000000,0> translate<17.551409,0.000000,20.650191> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.551409,0.000000,20.497803>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.796600,0.000000,20.497803>}
box{<0,0,-0.076200><2.245191,0.035000,0.076200> rotate<0,0.000000,0> translate<17.551409,0.000000,20.497803> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.551409,0.000000,20.574000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.811909,0.000000,20.574000>}
box{<0,0,-0.076200><2.260500,0.035000,0.076200> rotate<0,0.000000,0> translate<17.551409,0.000000,20.574000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.551409,0.000000,20.650191>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.796600,0.000000,20.650191>}
box{<0,0,-0.076200><2.245191,0.035000,0.076200> rotate<0,0.000000,0> translate<17.551409,0.000000,20.650191> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.555397,0.000000,24.202597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.555397,0.000000,24.313572>}
box{<0,0,-0.076200><0.110975,0.035000,0.076200> rotate<0,90.000000,0> translate<17.555397,0.000000,24.313572> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.555397,0.000000,24.202597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780000,0.000000,24.202597>}
box{<0,0,-0.076200><0.224603,0.035000,0.076200> rotate<0,0.000000,0> translate<17.555397,0.000000,24.202597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.555397,0.000000,24.231600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780000,0.000000,24.231600>}
box{<0,0,-0.076200><0.224603,0.035000,0.076200> rotate<0,0.000000,0> translate<17.555397,0.000000,24.231600> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780000,0.000000,24.365800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780000,0.000000,24.202597>}
box{<0,0,-0.076200><0.163203,0.035000,0.076200> rotate<0,-90.000000,0> translate<17.780000,0.000000,24.202597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780000,0.000000,27.514363>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780000,0.000000,25.926194>}
box{<0,0,-0.076200><1.588169,0.035000,0.076200> rotate<0,-90.000000,0> translate<17.780000,0.000000,25.926194> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780000,0.000000,27.514363>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.824634,0.000000,27.558997>}
box{<0,0,-0.076200><0.063123,0.035000,0.076200> rotate<0,-44.997030,0> translate<17.780000,0.000000,27.514363> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.789894,0.000000,11.495800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.998197,0.000000,11.704103>}
box{<0,0,-0.076200><0.294585,0.035000,0.076200> rotate<0,-44.997030,0> translate<17.789894,0.000000,11.495800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.824634,0.000000,27.558997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.947109,0.000000,27.558997>}
box{<0,0,-0.076200><2.122475,0.035000,0.076200> rotate<0,0.000000,0> translate<17.824634,0.000000,27.558997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.876494,0.000000,11.582400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.084709,0.000000,11.582400>}
box{<0,0,-0.076200><1.208216,0.035000,0.076200> rotate<0,0.000000,0> translate<17.876494,0.000000,11.582400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.998197,0.000000,11.704103>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.049997,0.000000,12.755903>}
box{<0,0,-0.076200><1.487470,0.035000,0.076200> rotate<0,-44.997030,0> translate<17.998197,0.000000,11.704103> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.028894,0.000000,11.734800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.955600,0.000000,11.734800>}
box{<0,0,-0.076200><0.926706,0.035000,0.076200> rotate<0,0.000000,0> translate<18.028894,0.000000,11.734800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.080797,0.000000,16.712094>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.080797,0.000000,16.843800>}
box{<0,0,-0.076200><0.131706,0.035000,0.076200> rotate<0,90.000000,0> translate<18.080797,0.000000,16.843800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.080797,0.000000,16.712094>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.536891,0.000000,16.255997>}
box{<0,0,-0.076200><0.645016,0.035000,0.076200> rotate<0,44.997226,0> translate<18.080797,0.000000,16.712094> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.080797,0.000000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.304000,0.000000,16.764000>}
box{<0,0,-0.076200><1.223203,0.035000,0.076200> rotate<0,0.000000,0> translate<18.080797,0.000000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.080797,0.000000,16.843800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.225181,0.000000,16.843800>}
box{<0,0,-0.076200><0.144384,0.035000,0.076200> rotate<0,0.000000,0> translate<18.080797,0.000000,16.843800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.181291,0.000000,16.611600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.304000,0.000000,16.611600>}
box{<0,0,-0.076200><1.122709,0.035000,0.076200> rotate<0,0.000000,0> translate<18.181291,0.000000,16.611600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.181294,0.000000,11.887200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.955600,0.000000,11.887200>}
box{<0,0,-0.076200><0.774306,0.035000,0.076200> rotate<0,0.000000,0> translate<18.181294,0.000000,11.887200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.225181,0.000000,16.843800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.225181,0.000000,17.598966>}
box{<0,0,-0.076200><0.755166,0.035000,0.076200> rotate<0,90.000000,0> translate<18.225181,0.000000,17.598966> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.225181,0.000000,16.916400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.225213,0.000000,16.916400>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<18.225181,0.000000,16.916400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.225181,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.225213,0.000000,17.068800>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<18.225181,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.225181,0.000000,17.221200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.225213,0.000000,17.221200>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<18.225181,0.000000,17.221200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.225181,0.000000,17.373600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.225213,0.000000,17.373600>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<18.225181,0.000000,17.373600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.225181,0.000000,17.526000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.225213,0.000000,17.526000>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<18.225181,0.000000,17.526000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.225181,0.000000,17.598966>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.225213,0.000000,17.598966>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<18.225181,0.000000,17.598966> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.225181,0.000000,23.549031>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.225181,0.000000,24.003000>}
box{<0,0,-0.076200><0.453969,0.035000,0.076200> rotate<0,90.000000,0> translate<18.225181,0.000000,24.003000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.225181,0.000000,23.549031>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.225213,0.000000,23.549031>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<18.225181,0.000000,23.549031> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.225181,0.000000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.225213,0.000000,23.622000>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<18.225181,0.000000,23.622000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.225181,0.000000,23.774400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.225213,0.000000,23.774400>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<18.225181,0.000000,23.774400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.225181,0.000000,23.926800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.225213,0.000000,23.926800>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<18.225181,0.000000,23.926800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.225181,0.000000,24.003000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.225213,0.000000,24.003000>}
box{<0,0,-0.076200><0.000031,0.035000,0.076200> rotate<0,0.000000,0> translate<18.225181,0.000000,24.003000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.225213,0.000000,16.843800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.408672,0.000000,16.843800>}
box{<0,0,-0.076200><0.183459,0.035000,0.076200> rotate<0,0.000000,0> translate<18.225213,0.000000,16.843800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.225213,0.000000,17.598966>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.225213,0.000000,16.843800>}
box{<0,0,-0.076200><0.755166,0.035000,0.076200> rotate<0,-90.000000,0> translate<18.225213,0.000000,16.843800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.225213,0.000000,24.003000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.225213,0.000000,23.549031>}
box{<0,0,-0.076200><0.453969,0.035000,0.076200> rotate<0,-90.000000,0> translate<18.225213,0.000000,23.549031> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.333691,0.000000,16.459200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.317819,0.000000,16.459200>}
box{<0,0,-0.076200><0.984128,0.035000,0.076200> rotate<0,0.000000,0> translate<18.333691,0.000000,16.459200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.333694,0.000000,12.039600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.955600,0.000000,12.039600>}
box{<0,0,-0.076200><0.621906,0.035000,0.076200> rotate<0,0.000000,0> translate<18.333694,0.000000,12.039600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.408672,0.000000,16.843800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.492650,0.000000,16.866303>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-14.999808,0> translate<18.408672,0.000000,16.843800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.486091,0.000000,16.306800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.470219,0.000000,16.306800>}
box{<0,0,-0.076200><0.984128,0.035000,0.076200> rotate<0,0.000000,0> translate<18.486091,0.000000,16.306800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.486094,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.955600,0.000000,12.192000>}
box{<0,0,-0.076200><0.469506,0.035000,0.076200> rotate<0,0.000000,0> translate<18.486094,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.492650,0.000000,16.866303>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.567947,0.000000,16.909775>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-29.997566,0> translate<18.492650,0.000000,16.866303> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.536891,0.000000,16.255997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.943294,0.000000,16.255997>}
box{<0,0,-0.076200><0.406403,0.035000,0.076200> rotate<0,0.000000,0> translate<18.536891,0.000000,16.255997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.567947,0.000000,16.909775>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.603572,0.000000,16.945400>}
box{<0,0,-0.076200><0.050381,0.035000,0.076200> rotate<0,-44.997030,0> translate<18.567947,0.000000,16.909775> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.574572,0.000000,16.916400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.368622,0.000000,16.916400>}
box{<0,0,-0.076200><0.794050,0.035000,0.076200> rotate<0,0.000000,0> translate<18.574572,0.000000,16.916400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.603572,0.000000,16.945400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.959888,0.000000,16.945400>}
box{<0,0,-0.076200><0.356316,0.035000,0.076200> rotate<0,0.000000,0> translate<18.603572,0.000000,16.945400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.638494,0.000000,12.344400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.955600,0.000000,12.344400>}
box{<0,0,-0.076200><0.317106,0.035000,0.076200> rotate<0,0.000000,0> translate<18.638494,0.000000,12.344400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.790894,0.000000,12.496800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.955600,0.000000,12.496800>}
box{<0,0,-0.076200><0.164706,0.035000,0.076200> rotate<0,0.000000,0> translate<18.790894,0.000000,12.496800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.854000,0.000000,10.462725>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.876503,0.000000,10.378747>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,74.994252,0> translate<18.854000,0.000000,10.462725> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.854000,0.000000,10.780003>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.854000,0.000000,10.462725>}
box{<0,0,-0.076200><0.317278,0.035000,0.076200> rotate<0,-90.000000,0> translate<18.854000,0.000000,10.462725> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.854000,0.000000,10.780003>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.557987,0.000000,10.780003>}
box{<0,0,-0.076200><0.703988,0.035000,0.076200> rotate<0,0.000000,0> translate<18.854000,0.000000,10.780003> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.854000,0.000000,10.932391>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.557987,0.000000,10.932391>}
box{<0,0,-0.076200><0.703988,0.035000,0.076200> rotate<0,0.000000,0> translate<18.854000,0.000000,10.932391> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.854000,0.000000,11.249672>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.854000,0.000000,10.932391>}
box{<0,0,-0.076200><0.317281,0.035000,0.076200> rotate<0,-90.000000,0> translate<18.854000,0.000000,10.932391> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.854000,0.000000,11.249672>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.876503,0.000000,11.333650>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-74.994252,0> translate<18.854000,0.000000,11.249672> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.876503,0.000000,10.378747>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.919975,0.000000,10.303450>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,59.996495,0> translate<18.876503,0.000000,10.378747> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.876503,0.000000,11.333650>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.919975,0.000000,11.408947>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-59.996495,0> translate<18.876503,0.000000,11.333650> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.919975,0.000000,10.303450>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.981450,0.000000,10.241975>}
box{<0,0,-0.076200><0.086939,0.035000,0.076200> rotate<0,44.997030,0> translate<18.919975,0.000000,10.303450> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.919975,0.000000,11.408947>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.981450,0.000000,11.470422>}
box{<0,0,-0.076200><0.086939,0.035000,0.076200> rotate<0,-44.997030,0> translate<18.919975,0.000000,11.408947> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.943294,0.000000,12.649200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.003913,0.000000,12.649200>}
box{<0,0,-0.076200><0.060619,0.035000,0.076200> rotate<0,0.000000,0> translate<18.943294,0.000000,12.649200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.943294,0.000000,16.255997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.552894,0.000000,15.646397>}
box{<0,0,-0.076200><0.862105,0.035000,0.076200> rotate<0,44.997030,0> translate<18.943294,0.000000,16.255997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.955600,0.000000,11.711509>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.089509,0.000000,11.577600>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<18.955600,0.000000,11.711509> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.955600,0.000000,12.600888>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.955600,0.000000,11.711509>}
box{<0,0,-0.076200><0.889378,0.035000,0.076200> rotate<0,-90.000000,0> translate<18.955600,0.000000,11.711509> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.955600,0.000000,12.600888>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.089509,0.000000,12.734797>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<18.955600,0.000000,12.600888> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.959888,0.000000,16.945400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.975197,0.000000,16.960712>}
box{<0,0,-0.076200><0.021653,0.035000,0.076200> rotate<0,-45.002877,0> translate<18.959888,0.000000,16.945400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.975197,0.000000,16.960712>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.990509,0.000000,16.945400>}
box{<0,0,-0.076200><0.021655,0.035000,0.076200> rotate<0,44.997030,0> translate<18.975197,0.000000,16.960712> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.981450,0.000000,10.241975>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.056747,0.000000,10.198503>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,29.997566,0> translate<18.981450,0.000000,10.241975> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.981450,0.000000,11.470422>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.056747,0.000000,11.513894>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-29.997566,0> translate<18.981450,0.000000,11.470422> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.990509,0.000000,16.945400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.369600,0.000000,16.945400>}
box{<0,0,-0.076200><0.379091,0.035000,0.076200> rotate<0,0.000000,0> translate<18.990509,0.000000,16.945400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.044891,0.000000,16.154400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.523200,0.000000,16.154400>}
box{<0,0,-0.076200><1.478309,0.035000,0.076200> rotate<0,0.000000,0> translate<19.044891,0.000000,16.154400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.049997,0.000000,12.755903>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.049997,0.000000,12.784306>}
box{<0,0,-0.076200><0.028403,0.035000,0.076200> rotate<0,90.000000,0> translate<19.049997,0.000000,12.784306> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.049997,0.000000,12.784306>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.115325,0.000000,12.766800>}
box{<0,0,-0.076200><0.067633,0.035000,0.076200> rotate<0,15.000345,0> translate<19.049997,0.000000,12.784306> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.049997,0.000000,14.109691>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.049997,0.000000,14.182516>}
box{<0,0,-0.076200><0.072825,0.035000,0.076200> rotate<0,90.000000,0> translate<19.049997,0.000000,14.182516> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.049997,0.000000,14.109691>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.115325,0.000000,14.127197>}
box{<0,0,-0.076200><0.067633,0.035000,0.076200> rotate<0,-15.000345,0> translate<19.049997,0.000000,14.109691> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.049997,0.000000,14.173200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.059309,0.000000,14.173200>}
box{<0,0,-0.076200><0.009313,0.035000,0.076200> rotate<0,0.000000,0> translate<19.049997,0.000000,14.173200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.049997,0.000000,14.182516>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.064109,0.000000,14.168400>}
box{<0,0,-0.076200><0.019960,0.035000,0.076200> rotate<0,45.003373,0> translate<19.049997,0.000000,14.182516> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.056747,0.000000,10.198503>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.140725,0.000000,10.176000>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,14.999808,0> translate<19.056747,0.000000,10.198503> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.056747,0.000000,11.513894>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.140725,0.000000,11.536397>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-14.999808,0> translate<19.056747,0.000000,11.513894> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.064109,0.000000,14.168400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.153488,0.000000,14.168400>}
box{<0,0,-0.076200><1.089378,0.035000,0.076200> rotate<0,0.000000,0> translate<19.064109,0.000000,14.168400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.089509,0.000000,11.577600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.178888,0.000000,11.577600>}
box{<0,0,-0.076200><1.089378,0.035000,0.076200> rotate<0,0.000000,0> translate<19.089509,0.000000,11.577600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.089509,0.000000,12.734797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.178888,0.000000,12.734797>}
box{<0,0,-0.076200><1.089378,0.035000,0.076200> rotate<0,0.000000,0> translate<19.089509,0.000000,12.734797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.115325,0.000000,12.766800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.532603,0.000000,12.766797>}
box{<0,0,-0.076200><0.417278,0.035000,0.076200> rotate<0,0.000429,0> translate<19.115325,0.000000,12.766800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.115325,0.000000,14.127197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.532603,0.000000,14.127197>}
box{<0,0,-0.076200><0.417278,0.035000,0.076200> rotate<0,0.000000,0> translate<19.115325,0.000000,14.127197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.140725,0.000000,10.176000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.558003,0.000000,10.175997>}
box{<0,0,-0.076200><0.417278,0.035000,0.076200> rotate<0,0.000429,0> translate<19.140725,0.000000,10.176000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.140725,0.000000,11.536397>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.558003,0.000000,11.536397>}
box{<0,0,-0.076200><0.417278,0.035000,0.076200> rotate<0,0.000000,0> translate<19.140725,0.000000,11.536397> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.197291,0.000000,16.002000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.523200,0.000000,16.002000>}
box{<0,0,-0.076200><1.325909,0.035000,0.076200> rotate<0,0.000000,0> translate<19.197291,0.000000,16.002000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.304000,0.000000,16.473019>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.571819,0.000000,16.205200>}
box{<0,0,-0.076200><0.378753,0.035000,0.076200> rotate<0,44.997030,0> translate<19.304000,0.000000,16.473019> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.304000,0.000000,16.851778>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.304000,0.000000,16.473019>}
box{<0,0,-0.076200><0.378759,0.035000,0.076200> rotate<0,-90.000000,0> translate<19.304000,0.000000,16.473019> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.304000,0.000000,16.851778>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.369600,0.000000,16.917378>}
box{<0,0,-0.076200><0.092772,0.035000,0.076200> rotate<0,-44.997030,0> translate<19.304000,0.000000,16.851778> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.349691,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.523200,0.000000,15.849600>}
box{<0,0,-0.076200><1.173509,0.035000,0.076200> rotate<0,0.000000,0> translate<19.349691,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.369600,0.000000,16.945400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.369600,0.000000,16.917378>}
box{<0,0,-0.076200><0.028022,0.035000,0.076200> rotate<0,-90.000000,0> translate<19.369600,0.000000,16.917378> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.470219,-1.535000,16.306800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.571819,-1.535000,16.205200>}
box{<0,0,-0.076200><0.143684,0.035000,0.076200> rotate<0,44.997030,0> translate<19.470219,-1.535000,16.306800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.470219,-1.535000,17.017997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.571819,-1.535000,17.119597>}
box{<0,0,-0.076200><0.143684,0.035000,0.076200> rotate<0,-44.997030,0> translate<19.470219,-1.535000,17.017997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.502091,0.000000,15.697200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.523200,0.000000,15.697200>}
box{<0,0,-0.076200><1.021109,0.035000,0.076200> rotate<0,0.000000,0> translate<19.502091,0.000000,15.697200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.532603,0.000000,12.766797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.532603,0.000000,13.370788>}
box{<0,0,-0.076200><0.603991,0.035000,0.076200> rotate<0,90.000000,0> translate<19.532603,0.000000,13.370788> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.532603,0.000000,12.801600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.684991,0.000000,12.801600>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<19.532603,0.000000,12.801600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.532603,0.000000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.684991,0.000000,12.954000>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<19.532603,0.000000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.532603,0.000000,13.106400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.684991,0.000000,13.106400>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<19.532603,0.000000,13.106400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.532603,0.000000,13.258800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.684991,0.000000,13.258800>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<19.532603,0.000000,13.258800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.532603,0.000000,13.370788>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.684991,0.000000,13.370788>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<19.532603,0.000000,13.370788> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.532603,0.000000,13.523209>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.532603,0.000000,14.127197>}
box{<0,0,-0.076200><0.603988,0.035000,0.076200> rotate<0,90.000000,0> translate<19.532603,0.000000,14.127197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.532603,0.000000,13.523209>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.684991,0.000000,13.523209>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<19.532603,0.000000,13.523209> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.532603,0.000000,13.563600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.684991,0.000000,13.563600>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<19.532603,0.000000,13.563600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.532603,0.000000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.684991,0.000000,13.716000>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<19.532603,0.000000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.532603,0.000000,13.868400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.684991,0.000000,13.868400>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<19.532603,0.000000,13.868400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.532603,0.000000,14.020800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.684991,0.000000,14.020800>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<19.532603,0.000000,14.020800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.552894,0.000000,15.646397>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.761197,0.000000,15.438094>}
box{<0,0,-0.076200><0.294585,0.035000,0.076200> rotate<0,44.997030,0> translate<19.552894,0.000000,15.646397> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.557987,0.000000,10.932391>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.557987,0.000000,10.780003>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,-90.000000,0> translate<19.557987,0.000000,10.780003> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.558003,0.000000,10.175997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.558003,0.000000,10.779988>}
box{<0,0,-0.076200><0.603991,0.035000,0.076200> rotate<0,90.000000,0> translate<19.558003,0.000000,10.779988> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.558003,0.000000,10.210800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.710391,0.000000,10.210800>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<19.558003,0.000000,10.210800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.558003,0.000000,10.363200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.710391,0.000000,10.363200>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<19.558003,0.000000,10.363200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.558003,0.000000,10.515600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.710391,0.000000,10.515600>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<19.558003,0.000000,10.515600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.558003,0.000000,10.668000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.710391,0.000000,10.668000>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<19.558003,0.000000,10.668000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.558003,0.000000,10.779988>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.710391,0.000000,10.779988>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<19.558003,0.000000,10.779988> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.558003,0.000000,10.932409>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.558003,0.000000,11.536397>}
box{<0,0,-0.076200><0.603988,0.035000,0.076200> rotate<0,90.000000,0> translate<19.558003,0.000000,11.536397> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.558003,0.000000,10.932409>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.710391,0.000000,10.932409>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<19.558003,0.000000,10.932409> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.558003,0.000000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.710391,0.000000,10.972800>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<19.558003,0.000000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.558003,0.000000,11.125200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.710391,0.000000,11.125200>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<19.558003,0.000000,11.125200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.558003,0.000000,11.277600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.710391,0.000000,11.277600>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<19.558003,0.000000,11.277600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.558003,0.000000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.710391,0.000000,11.430000>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<19.558003,0.000000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.571819,0.000000,16.205200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.950578,0.000000,16.205200>}
box{<0,0,-0.076200><0.378759,0.035000,0.076200> rotate<0,0.000000,0> translate<19.571819,0.000000,16.205200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.571819,-1.535000,16.205200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.950578,-1.535000,16.205200>}
box{<0,0,-0.076200><0.378759,0.035000,0.076200> rotate<0,0.000000,0> translate<19.571819,-1.535000,16.205200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.571819,-1.535000,17.119597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.950578,-1.535000,17.119597>}
box{<0,0,-0.076200><0.378759,0.035000,0.076200> rotate<0,0.000000,0> translate<19.571819,-1.535000,17.119597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.654491,0.000000,15.544800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.523200,0.000000,15.544800>}
box{<0,0,-0.076200><0.868709,0.035000,0.076200> rotate<0,0.000000,0> translate<19.654491,0.000000,15.544800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.684991,0.000000,12.766797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.102272,0.000000,12.766800>}
box{<0,0,-0.076200><0.417281,0.035000,0.076200> rotate<0,-0.000429,0> translate<19.684991,0.000000,12.766797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.684991,0.000000,13.370788>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.684991,0.000000,12.766797>}
box{<0,0,-0.076200><0.603991,0.035000,0.076200> rotate<0,-90.000000,0> translate<19.684991,0.000000,12.766797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.684991,0.000000,14.127197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.684991,0.000000,13.523209>}
box{<0,0,-0.076200><0.603988,0.035000,0.076200> rotate<0,-90.000000,0> translate<19.684991,0.000000,13.523209> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.684991,0.000000,14.127197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.102272,0.000000,14.127197>}
box{<0,0,-0.076200><0.417281,0.035000,0.076200> rotate<0,0.000000,0> translate<19.684991,0.000000,14.127197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.685009,0.000000,13.370803>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.685009,0.000000,13.523191>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,90.000000,0> translate<19.685009,0.000000,13.523191> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.685009,0.000000,13.370803>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.388994,0.000000,13.370803>}
box{<0,0,-0.076200><0.703984,0.035000,0.076200> rotate<0,0.000000,0> translate<19.685009,0.000000,13.370803> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.685009,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.523200,0.000000,13.411200>}
box{<0,0,-0.076200><0.838191,0.035000,0.076200> rotate<0,0.000000,0> translate<19.685009,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.685009,0.000000,13.523191>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.388997,0.000000,13.523191>}
box{<0,0,-0.076200><0.703988,0.035000,0.076200> rotate<0,0.000000,0> translate<19.685009,0.000000,13.523191> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.710391,0.000000,10.175997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.127672,0.000000,10.176000>}
box{<0,0,-0.076200><0.417281,0.035000,0.076200> rotate<0,-0.000429,0> translate<19.710391,0.000000,10.175997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.710391,0.000000,10.779988>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.710391,0.000000,10.175997>}
box{<0,0,-0.076200><0.603991,0.035000,0.076200> rotate<0,-90.000000,0> translate<19.710391,0.000000,10.175997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.710391,0.000000,11.536397>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.710391,0.000000,10.932409>}
box{<0,0,-0.076200><0.603988,0.035000,0.076200> rotate<0,-90.000000,0> translate<19.710391,0.000000,10.932409> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.710391,0.000000,11.536397>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.127672,0.000000,11.536397>}
box{<0,0,-0.076200><0.417281,0.035000,0.076200> rotate<0,0.000000,0> translate<19.710391,0.000000,11.536397> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.710409,0.000000,10.780003>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.710409,0.000000,10.932391>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,90.000000,0> translate<19.710409,0.000000,10.932391> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.710409,0.000000,10.780003>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.414394,0.000000,10.780003>}
box{<0,0,-0.076200><0.703984,0.035000,0.076200> rotate<0,0.000000,0> translate<19.710409,0.000000,10.780003> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.710409,0.000000,10.820400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,10.820400>}
box{<0,0,-0.076200><7.264391,0.035000,0.076200> rotate<0,0.000000,0> translate<19.710409,0.000000,10.820400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.710409,0.000000,10.932391>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.414397,0.000000,10.932391>}
box{<0,0,-0.076200><0.703988,0.035000,0.076200> rotate<0,0.000000,0> translate<19.710409,0.000000,10.932391> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.761197,0.000000,15.325597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.761197,0.000000,15.438094>}
box{<0,0,-0.076200><0.112497,0.035000,0.076200> rotate<0,90.000000,0> translate<19.761197,0.000000,15.438094> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.761197,0.000000,15.325597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.153488,0.000000,15.325597>}
box{<0,0,-0.076200><0.392291,0.035000,0.076200> rotate<0,0.000000,0> translate<19.761197,0.000000,15.325597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.761197,0.000000,15.392400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.523200,0.000000,15.392400>}
box{<0,0,-0.076200><0.762003,0.035000,0.076200> rotate<0,0.000000,0> translate<19.761197,0.000000,15.392400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.796600,0.000000,20.558688>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.796600,0.000000,20.497803>}
box{<0,0,-0.076200><0.060884,0.035000,0.076200> rotate<0,-90.000000,0> translate<19.796600,0.000000,20.497803> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.796600,0.000000,20.558688>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.811913,0.000000,20.573997>}
box{<0,0,-0.076200><0.021653,0.035000,0.076200> rotate<0,-44.991183,0> translate<19.796600,0.000000,20.558688> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.796600,0.000000,20.589309>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.811913,0.000000,20.573997>}
box{<0,0,-0.076200><0.021655,0.035000,0.076200> rotate<0,44.997030,0> translate<19.796600,0.000000,20.589309> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.796600,0.000000,20.650191>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.796600,0.000000,20.589309>}
box{<0,0,-0.076200><0.060881,0.035000,0.076200> rotate<0,-90.000000,0> translate<19.796600,0.000000,20.589309> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.947109,0.000000,27.558997>}
box{<0,0,-0.076200><0.067634,0.035000,0.076200> rotate<0,74.991158,0> translate<19.929600,0.000000,27.624325> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.929600,0.000000,28.611272>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.952103,0.000000,28.695250>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-74.994252,0> translate<19.929600,0.000000,28.611272> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.950578,0.000000,16.205200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.052175,0.000000,16.306800>}
box{<0,0,-0.076200><0.143682,0.035000,0.076200> rotate<0,-44.997911,0> translate<19.950578,0.000000,16.205200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.950578,-1.535000,16.205200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.052178,-1.535000,16.306800>}
box{<0,0,-0.076200><0.143684,0.035000,0.076200> rotate<0,-44.997030,0> translate<19.950578,-1.535000,16.205200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.950578,-1.535000,17.119597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.052178,-1.535000,17.017997>}
box{<0,0,-0.076200><0.143684,0.035000,0.076200> rotate<0,44.997030,0> translate<19.950578,-1.535000,17.119597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.952103,0.000000,28.695250>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.995575,0.000000,28.770547>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-59.996495,0> translate<19.952103,0.000000,28.695250> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.995575,0.000000,28.770547>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.057050,0.000000,28.832022>}
box{<0,0,-0.076200><0.086939,0.035000,0.076200> rotate<0,-44.997030,0> translate<19.995575,0.000000,28.770547> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.001375,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.844000,-1.535000,17.068800>}
box{<0,0,-0.076200><1.842625,0.035000,0.076200> rotate<0,0.000000,0> translate<20.001375,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.052175,0.000000,16.306800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.477503,0.000000,16.306800>}
box{<0,0,-0.076200><0.425328,0.035000,0.076200> rotate<0,0.000000,0> translate<20.052175,0.000000,16.306800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.052178,-1.535000,16.306800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.092894,-1.535000,16.306800>}
box{<0,0,-0.076200><2.040716,0.035000,0.076200> rotate<0,0.000000,0> translate<20.052178,-1.535000,16.306800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.052178,-1.535000,17.017997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.798303,-1.535000,17.017997>}
box{<0,0,-0.076200><1.746125,0.035000,0.076200> rotate<0,0.000000,0> translate<20.052178,-1.535000,17.017997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.057050,0.000000,28.832022>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.132347,0.000000,28.875494>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-29.997566,0> translate<20.057050,0.000000,28.832022> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.102272,0.000000,12.766800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.186250,0.000000,12.789303>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-14.999808,0> translate<20.102272,0.000000,12.766800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.102272,0.000000,14.127197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.186250,0.000000,14.104694>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,14.999808,0> translate<20.102272,0.000000,14.127197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.127672,0.000000,10.176000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.211650,0.000000,10.198503>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-14.999808,0> translate<20.127672,0.000000,10.176000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.127672,0.000000,11.536397>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.211650,0.000000,11.513894>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,14.999808,0> translate<20.127672,0.000000,11.536397> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.132347,0.000000,28.875494>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.216325,0.000000,28.897997>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-14.999808,0> translate<20.132347,0.000000,28.875494> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.153488,0.000000,14.168400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.287397,0.000000,14.302309>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<20.153488,0.000000,14.168400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.153488,0.000000,15.325597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.287397,0.000000,15.191688>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<20.153488,0.000000,15.325597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.158288,0.000000,14.173200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.523200,0.000000,14.173200>}
box{<0,0,-0.076200><0.364912,0.035000,0.076200> rotate<0,0.000000,0> translate<20.158288,0.000000,14.173200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.178888,0.000000,11.577600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.312797,0.000000,11.711509>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<20.178888,0.000000,11.577600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.178888,0.000000,12.734797>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.269397,0.000000,12.644288>}
box{<0,0,-0.076200><0.128000,0.035000,0.076200> rotate<0,44.997030,0> translate<20.178888,0.000000,12.734797> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.183688,0.000000,11.582400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,11.582400>}
box{<0,0,-0.076200><6.791113,0.035000,0.076200> rotate<0,0.000000,0> translate<20.183688,0.000000,11.582400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.186250,0.000000,12.789303>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.261547,0.000000,12.832775>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-29.997566,0> translate<20.186250,0.000000,12.789303> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.186250,0.000000,14.104694>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.261547,0.000000,14.061222>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,29.997566,0> translate<20.186250,0.000000,14.104694> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.207547,0.000000,12.801600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.426709,0.000000,12.801600>}
box{<0,0,-0.076200><0.219162,0.035000,0.076200> rotate<0,0.000000,0> translate<20.207547,0.000000,12.801600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.211650,0.000000,10.198503>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.286947,0.000000,10.241975>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-29.997566,0> translate<20.211650,0.000000,10.198503> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.211650,0.000000,11.513894>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.286947,0.000000,11.470422>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,29.997566,0> translate<20.211650,0.000000,11.513894> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.216325,0.000000,28.897997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.533603,0.000000,28.897997>}
box{<0,0,-0.076200><0.317278,0.035000,0.076200> rotate<0,0.000000,0> translate<20.216325,0.000000,28.897997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.232947,0.000000,10.210800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,10.210800>}
box{<0,0,-0.076200><6.741853,0.035000,0.076200> rotate<0,0.000000,0> translate<20.232947,0.000000,10.210800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.239084,0.000000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.523200,0.000000,15.240000>}
box{<0,0,-0.076200><0.284116,0.035000,0.076200> rotate<0,0.000000,0> translate<20.239084,0.000000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.261547,0.000000,12.832775>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.323022,0.000000,12.894250>}
box{<0,0,-0.076200><0.086939,0.035000,0.076200> rotate<0,-44.997030,0> translate<20.261547,0.000000,12.832775> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.261547,0.000000,14.061222>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.323022,0.000000,13.999747>}
box{<0,0,-0.076200><0.086939,0.035000,0.076200> rotate<0,44.997030,0> translate<20.261547,0.000000,14.061222> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.264484,0.000000,12.649200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.274309,0.000000,12.649200>}
box{<0,0,-0.076200><0.009825,0.035000,0.076200> rotate<0,0.000000,0> translate<20.264484,0.000000,12.649200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.269397,0.000000,12.644288>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.523200,0.000000,12.898094>}
box{<0,0,-0.076200><0.358934,0.035000,0.076200> rotate<0,-44.997383,0> translate<20.269397,0.000000,12.644288> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.286947,0.000000,10.241975>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.348422,0.000000,10.303450>}
box{<0,0,-0.076200><0.086939,0.035000,0.076200> rotate<0,-44.997030,0> translate<20.286947,0.000000,10.241975> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.286947,0.000000,11.470422>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.348422,0.000000,11.408947>}
box{<0,0,-0.076200><0.086939,0.035000,0.076200> rotate<0,44.997030,0> translate<20.286947,0.000000,11.470422> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.287397,0.000000,14.302309>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.287397,0.000000,15.191688>}
box{<0,0,-0.076200><0.889378,0.035000,0.076200> rotate<0,90.000000,0> translate<20.287397,0.000000,15.191688> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.287397,0.000000,14.325600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.523200,0.000000,14.325600>}
box{<0,0,-0.076200><0.235803,0.035000,0.076200> rotate<0,0.000000,0> translate<20.287397,0.000000,14.325600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.287397,0.000000,14.478000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.523200,0.000000,14.478000>}
box{<0,0,-0.076200><0.235803,0.035000,0.076200> rotate<0,0.000000,0> translate<20.287397,0.000000,14.478000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.287397,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.523200,0.000000,14.630400>}
box{<0,0,-0.076200><0.235803,0.035000,0.076200> rotate<0,0.000000,0> translate<20.287397,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.287397,0.000000,14.782800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.523200,0.000000,14.782800>}
box{<0,0,-0.076200><0.235803,0.035000,0.076200> rotate<0,0.000000,0> translate<20.287397,0.000000,14.782800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.287397,0.000000,14.935200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.523200,0.000000,14.935200>}
box{<0,0,-0.076200><0.235803,0.035000,0.076200> rotate<0,0.000000,0> translate<20.287397,0.000000,14.935200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.287397,0.000000,15.087600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.523200,0.000000,15.087600>}
box{<0,0,-0.076200><0.235803,0.035000,0.076200> rotate<0,0.000000,0> translate<20.287397,0.000000,15.087600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.301969,0.000000,14.020800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.523200,0.000000,14.020800>}
box{<0,0,-0.076200><0.221231,0.035000,0.076200> rotate<0,0.000000,0> translate<20.301969,0.000000,14.020800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.312797,0.000000,11.711509>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.312797,0.000000,11.800600>}
box{<0,0,-0.076200><0.089091,0.035000,0.076200> rotate<0,90.000000,0> translate<20.312797,0.000000,11.800600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.312797,0.000000,11.734800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,11.734800>}
box{<0,0,-0.076200><6.662003,0.035000,0.076200> rotate<0,0.000000,0> translate<20.312797,0.000000,11.734800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.312797,0.000000,11.800600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.431494,0.000000,11.800600>}
box{<0,0,-0.076200><0.118697,0.035000,0.076200> rotate<0,0.000000,0> translate<20.312797,0.000000,11.800600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.323022,0.000000,12.894250>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.366494,0.000000,12.969547>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-59.996495,0> translate<20.323022,0.000000,12.894250> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.323022,0.000000,13.999747>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.366494,0.000000,13.924450>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,59.996495,0> translate<20.323022,0.000000,13.999747> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.327369,0.000000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,11.430000>}
box{<0,0,-0.076200><6.647431,0.035000,0.076200> rotate<0,0.000000,0> translate<20.327369,0.000000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.348422,0.000000,10.303450>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.391894,0.000000,10.378747>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-59.996495,0> translate<20.348422,0.000000,10.303450> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.348422,0.000000,11.408947>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.391894,0.000000,11.333650>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,59.996495,0> translate<20.348422,0.000000,11.408947> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.357516,0.000000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.523200,0.000000,12.954000>}
box{<0,0,-0.076200><0.165684,0.035000,0.076200> rotate<0,0.000000,0> translate<20.357516,0.000000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.366494,0.000000,12.969547>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.388997,0.000000,13.053525>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-74.994252,0> translate<20.366494,0.000000,12.969547> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.366494,0.000000,13.924450>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.388997,0.000000,13.840472>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,74.994252,0> translate<20.366494,0.000000,13.924450> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.381516,0.000000,13.868400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.523200,0.000000,13.868400>}
box{<0,0,-0.076200><0.141684,0.035000,0.076200> rotate<0,0.000000,0> translate<20.381516,0.000000,13.868400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.382916,0.000000,10.363200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,10.363200>}
box{<0,0,-0.076200><6.591884,0.035000,0.076200> rotate<0,0.000000,0> translate<20.382916,0.000000,10.363200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.388994,0.000000,13.370803>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.388997,0.000000,13.053525>}
box{<0,0,-0.076200><0.317278,0.035000,0.076200> rotate<0,89.993496,0> translate<20.388994,0.000000,13.370803> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.388997,0.000000,13.106400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.523200,0.000000,13.106400>}
box{<0,0,-0.076200><0.134203,0.035000,0.076200> rotate<0,0.000000,0> translate<20.388997,0.000000,13.106400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.388997,0.000000,13.258800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.523200,0.000000,13.258800>}
box{<0,0,-0.076200><0.134203,0.035000,0.076200> rotate<0,0.000000,0> translate<20.388997,0.000000,13.258800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.388997,0.000000,13.523191>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.388997,0.000000,13.840472>}
box{<0,0,-0.076200><0.317281,0.035000,0.076200> rotate<0,90.000000,0> translate<20.388997,0.000000,13.840472> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.388997,0.000000,13.563600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.523200,0.000000,13.563600>}
box{<0,0,-0.076200><0.134203,0.035000,0.076200> rotate<0,0.000000,0> translate<20.388997,0.000000,13.563600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.388997,0.000000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.523200,0.000000,13.716000>}
box{<0,0,-0.076200><0.134203,0.035000,0.076200> rotate<0,0.000000,0> translate<20.388997,0.000000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.391894,0.000000,10.378747>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.414397,0.000000,10.462725>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-74.994252,0> translate<20.391894,0.000000,10.378747> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.391894,0.000000,11.333650>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.414397,0.000000,11.249672>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,74.994252,0> translate<20.391894,0.000000,11.333650> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.406916,0.000000,11.277600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,11.277600>}
box{<0,0,-0.076200><6.567884,0.035000,0.076200> rotate<0,0.000000,0> translate<20.406916,0.000000,11.277600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.414394,0.000000,10.780003>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.414397,0.000000,10.462725>}
box{<0,0,-0.076200><0.317278,0.035000,0.076200> rotate<0,89.993496,0> translate<20.414394,0.000000,10.780003> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.414397,0.000000,10.515600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,10.515600>}
box{<0,0,-0.076200><6.560403,0.035000,0.076200> rotate<0,0.000000,0> translate<20.414397,0.000000,10.515600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.414397,0.000000,10.668000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,10.668000>}
box{<0,0,-0.076200><6.560403,0.035000,0.076200> rotate<0,0.000000,0> translate<20.414397,0.000000,10.668000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.414397,0.000000,10.932391>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.414397,0.000000,11.249672>}
box{<0,0,-0.076200><0.317281,0.035000,0.076200> rotate<0,90.000000,0> translate<20.414397,0.000000,11.249672> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.414397,0.000000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,10.972800>}
box{<0,0,-0.076200><6.560403,0.035000,0.076200> rotate<0,0.000000,0> translate<20.414397,0.000000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.414397,0.000000,11.125200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,11.125200>}
box{<0,0,-0.076200><6.560403,0.035000,0.076200> rotate<0,0.000000,0> translate<20.414397,0.000000,11.125200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.431494,0.000000,11.800600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.999800,0.000000,12.368909>}
box{<0,0,-0.076200><0.803709,0.035000,0.076200> rotate<0,-44.997188,0> translate<20.431494,0.000000,11.800600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.477503,0.000000,16.306800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.523200,0.000000,16.261103>}
box{<0,0,-0.076200><0.064625,0.035000,0.076200> rotate<0,44.997030,0> translate<20.477503,0.000000,16.306800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.518091,0.000000,11.887200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.084709,0.000000,11.887200>}
box{<0,0,-0.076200><0.566619,0.035000,0.076200> rotate<0,0.000000,0> translate<20.518091,0.000000,11.887200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.523200,0.000000,16.261103>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.523200,0.000000,12.898094>}
box{<0,0,-0.076200><3.363009,0.035000,0.076200> rotate<0,-90.000000,0> translate<20.523200,0.000000,12.898094> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.670491,0.000000,12.039600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.999800,0.000000,12.039600>}
box{<0,0,-0.076200><0.329309,0.035000,0.076200> rotate<0,0.000000,0> translate<20.670491,0.000000,12.039600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.685991,0.000000,28.897994>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.685991,0.000000,28.194009>}
box{<0,0,-0.076200><0.703984,0.035000,0.076200> rotate<0,-90.000000,0> translate<20.685991,0.000000,28.194009> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.685991,0.000000,28.897994>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.003272,0.000000,28.897997>}
box{<0,0,-0.076200><0.317281,0.035000,0.076200> rotate<0,-0.000564,0> translate<20.685991,0.000000,28.897994> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.822891,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.999800,0.000000,12.192000>}
box{<0,0,-0.076200><0.176909,0.035000,0.076200> rotate<0,0.000000,0> translate<20.822891,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.975291,0.000000,12.344400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.999800,0.000000,12.344400>}
box{<0,0,-0.076200><0.024509,0.035000,0.076200> rotate<0,0.000000,0> translate<20.975291,0.000000,12.344400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.999800,0.000000,11.972109>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.133709,0.000000,11.838200>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<20.999800,0.000000,11.972109> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.999800,0.000000,12.368909>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.999800,0.000000,11.972109>}
box{<0,0,-0.076200><0.396800,0.035000,0.076200> rotate<0,-90.000000,0> translate<20.999800,0.000000,11.972109> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.088484,0.000000,20.073997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.103797,0.000000,20.058688>}
box{<0,0,-0.076200><0.021653,0.035000,0.076200> rotate<0,44.991183,0> translate<21.088484,0.000000,20.073997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.088484,0.000000,20.073997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.103797,0.000000,20.089309>}
box{<0,0,-0.076200><0.021655,0.035000,0.076200> rotate<0,-44.997030,0> translate<21.088484,0.000000,20.073997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.103797,0.000000,19.654197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.103797,0.000000,20.058688>}
box{<0,0,-0.076200><0.404491,0.035000,0.076200> rotate<0,90.000000,0> translate<21.103797,0.000000,20.058688> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.103797,0.000000,19.654197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.280825,0.000000,19.654197>}
box{<0,0,-0.076200><0.177028,0.035000,0.076200> rotate<0,0.000000,0> translate<21.103797,0.000000,19.654197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.103797,0.000000,19.659600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.749600,0.000000,19.659600>}
box{<0,0,-0.076200><0.645803,0.035000,0.076200> rotate<0,0.000000,0> translate<21.103797,0.000000,19.659600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.103797,0.000000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.749600,0.000000,19.812000>}
box{<0,0,-0.076200><0.645803,0.035000,0.076200> rotate<0,0.000000,0> translate<21.103797,0.000000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.103797,0.000000,19.964400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.781081,0.000000,19.964400>}
box{<0,0,-0.076200><0.677284,0.035000,0.076200> rotate<0,0.000000,0> translate<21.103797,0.000000,19.964400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.103797,0.000000,20.089309>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.103797,0.000000,20.493800>}
box{<0,0,-0.076200><0.404491,0.035000,0.076200> rotate<0,90.000000,0> translate<21.103797,0.000000,20.493800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.103797,0.000000,20.116800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.931053,0.000000,20.116800>}
box{<0,0,-0.076200><0.827256,0.035000,0.076200> rotate<0,0.000000,0> translate<21.103797,0.000000,20.116800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.103797,0.000000,20.269200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.220706,0.000000,20.269200>}
box{<0,0,-0.076200><2.116909,0.035000,0.076200> rotate<0,0.000000,0> translate<21.103797,0.000000,20.269200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.103797,0.000000,20.421600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.068306,0.000000,20.421600>}
box{<0,0,-0.076200><1.964509,0.035000,0.076200> rotate<0,0.000000,0> translate<21.103797,0.000000,20.421600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.103797,0.000000,20.493800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.367172,0.000000,20.493800>}
box{<0,0,-0.076200><0.263375,0.035000,0.076200> rotate<0,0.000000,0> translate<21.103797,0.000000,20.493800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.133709,0.000000,11.838200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.223088,0.000000,11.838200>}
box{<0,0,-0.076200><2.089378,0.035000,0.076200> rotate<0,0.000000,0> translate<21.133709,0.000000,11.838200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.189009,0.000000,22.631397>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.269572,0.000000,22.631397>}
box{<0,0,-0.076200><0.080562,0.035000,0.076200> rotate<0,0.000000,0> translate<21.189009,0.000000,22.631397> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.189009,0.000000,22.631397>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.103416,0.000000,23.545800>}
box{<0,0,-0.076200><1.293164,0.035000,0.076200> rotate<0,-44.996932,0> translate<21.189009,0.000000,22.631397> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.265213,0.000000,22.707600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.749600,0.000000,22.707600>}
box{<0,0,-0.076200><0.484388,0.035000,0.076200> rotate<0,0.000000,0> translate<21.265213,0.000000,22.707600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.269572,0.000000,22.631397>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.726772,0.000000,22.174197>}
box{<0,0,-0.076200><0.646578,0.035000,0.076200> rotate<0,44.997030,0> translate<21.269572,0.000000,22.631397> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.280825,0.000000,19.654197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.554372,0.000000,19.654197>}
box{<0,0,-0.076200><0.273547,0.035000,0.076200> rotate<0,0.000000,0> translate<21.280825,0.000000,19.654197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.345769,0.000000,22.555200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.453588,0.000000,22.555200>}
box{<0,0,-0.076200><1.107819,0.035000,0.076200> rotate<0,0.000000,0> translate<21.345769,0.000000,22.555200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.367172,0.000000,20.493800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.726772,0.000000,20.853400>}
box{<0,0,-0.076200><0.508551,0.035000,0.076200> rotate<0,-44.997030,0> translate<21.367172,0.000000,20.493800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.417613,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.749600,0.000000,22.860000>}
box{<0,0,-0.076200><0.331988,0.035000,0.076200> rotate<0,0.000000,0> translate<21.417613,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.447372,0.000000,20.574000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.915906,0.000000,20.574000>}
box{<0,0,-0.076200><1.468534,0.035000,0.076200> rotate<0,0.000000,0> translate<21.447372,0.000000,20.574000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.498169,0.000000,22.402800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.749600,0.000000,22.402800>}
box{<0,0,-0.076200><0.251431,0.035000,0.076200> rotate<0,0.000000,0> translate<21.498169,0.000000,22.402800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.554372,0.000000,19.654197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.813366,0.000000,19.395203>}
box{<0,0,-0.076200><0.366272,0.035000,0.076200> rotate<0,44.997030,0> translate<21.554372,0.000000,19.654197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.570013,0.000000,23.012400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.795747,0.000000,23.012400>}
box{<0,0,-0.076200><0.225734,0.035000,0.076200> rotate<0,0.000000,0> translate<21.570013,0.000000,23.012400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.599772,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.874109,0.000000,20.726400>}
box{<0,0,-0.076200><0.274337,0.035000,0.076200> rotate<0,0.000000,0> translate<21.599772,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.650569,0.000000,22.250400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.749600,0.000000,22.250400>}
box{<0,0,-0.076200><0.099031,0.035000,0.076200> rotate<0,0.000000,0> translate<21.650569,0.000000,22.250400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.701369,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.453588,0.000000,19.507200>}
box{<0,0,-0.076200><0.752219,0.035000,0.076200> rotate<0,0.000000,0> translate<21.701369,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.722413,0.000000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.001259,0.000000,23.164800>}
box{<0,0,-0.076200><0.278847,0.035000,0.076200> rotate<0,0.000000,0> translate<21.722413,0.000000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.726772,0.000000,20.853400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.851200,0.000000,20.853400>}
box{<0,0,-0.076200><0.124428,0.035000,0.076200> rotate<0,0.000000,0> translate<21.726772,0.000000,20.853400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.726772,0.000000,22.174197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.749600,0.000000,22.151366>}
box{<0,0,-0.076200><0.032286,0.035000,0.076200> rotate<0,45.000951,0> translate<21.726772,0.000000,22.174197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.749600,0.000000,19.547591>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.453588,0.000000,19.547591>}
box{<0,0,-0.076200><0.703988,0.035000,0.076200> rotate<0,0.000000,0> translate<21.749600,0.000000,19.547591> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.749600,0.000000,19.864872>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.749600,0.000000,19.547591>}
box{<0,0,-0.076200><0.317281,0.035000,0.076200> rotate<0,-90.000000,0> translate<21.749600,0.000000,19.547591> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.749600,0.000000,19.864872>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.772103,0.000000,19.948850>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-74.994252,0> translate<21.749600,0.000000,19.864872> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.749600,0.000000,22.417803>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.749600,0.000000,22.151366>}
box{<0,0,-0.076200><0.266438,0.035000,0.076200> rotate<0,-90.000000,0> translate<21.749600,0.000000,22.151366> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.772103,0.000000,19.948850>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.815575,0.000000,20.024147>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-59.996495,0> translate<21.772103,0.000000,19.948850> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.772103,0.000000,22.971450>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.815575,0.000000,23.046747>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-59.996495,0> translate<21.772103,0.000000,22.971450> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.798303,-1.535000,17.017997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.844000,-1.535000,17.063694>}
box{<0,0,-0.076200><0.064625,0.035000,0.076200> rotate<0,-44.997030,0> translate<21.798303,-1.535000,17.017997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.813366,0.000000,19.395203>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.453588,0.000000,19.395203>}
box{<0,0,-0.076200><0.640222,0.035000,0.076200> rotate<0,0.000000,0> translate<21.813366,0.000000,19.395203> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.815575,0.000000,20.024147>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.877050,0.000000,20.085622>}
box{<0,0,-0.076200><0.086939,0.035000,0.076200> rotate<0,-44.997030,0> translate<21.815575,0.000000,20.024147> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.815575,0.000000,23.046747>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.877050,0.000000,23.108222>}
box{<0,0,-0.076200><0.086939,0.035000,0.076200> rotate<0,-44.997030,0> translate<21.815575,0.000000,23.046747> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.844000,-1.535000,17.315141>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.844000,-1.535000,17.063694>}
box{<0,0,-0.076200><0.251447,0.035000,0.076200> rotate<0,-90.000000,0> translate<21.844000,-1.535000,17.063694> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.844000,-1.535000,17.315141>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.156456,-1.535000,17.627597>}
box{<0,0,-0.076200><0.441880,0.035000,0.076200> rotate<0,-44.997030,0> translate<21.844000,-1.535000,17.315141> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.851200,0.000000,20.749309>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.985109,0.000000,20.615400>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<21.851200,0.000000,20.749309> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.851200,0.000000,20.853400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.851200,0.000000,20.749309>}
box{<0,0,-0.076200><0.104091,0.035000,0.076200> rotate<0,-90.000000,0> translate<21.851200,0.000000,20.749309> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.874813,0.000000,23.317200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,23.317200>}
box{<0,0,-0.076200><5.099988,0.035000,0.076200> rotate<0,0.000000,0> translate<21.874813,0.000000,23.317200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.877050,0.000000,20.085622>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.952347,0.000000,20.129094>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-29.997566,0> translate<21.877050,0.000000,20.085622> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.877050,0.000000,23.108222>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.952347,0.000000,23.151694>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-29.997566,0> translate<21.877050,0.000000,23.108222> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.920197,0.000000,21.707681>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.920197,0.000000,21.854869>}
box{<0,0,-0.076200><0.147188,0.035000,0.076200> rotate<0,90.000000,0> translate<21.920197,0.000000,21.854869> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.920197,0.000000,21.707681>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.985109,0.000000,21.772597>}
box{<0,0,-0.076200><0.091802,0.035000,0.076200> rotate<0,-44.998409,0> translate<21.920197,0.000000,21.707681> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.920197,0.000000,21.793200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,21.793200>}
box{<0,0,-0.076200><5.054603,0.035000,0.076200> rotate<0,0.000000,0> translate<21.920197,0.000000,21.793200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.920197,0.000000,21.854869>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.952347,0.000000,21.836303>}
box{<0,0,-0.076200><0.037126,0.035000,0.076200> rotate<0,30.003117,0> translate<21.920197,0.000000,21.854869> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.952347,0.000000,20.129094>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.036325,0.000000,20.151597>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-14.999808,0> translate<21.952347,0.000000,20.129094> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.952347,0.000000,21.836303>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.036325,0.000000,21.813800>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,14.999808,0> translate<21.952347,0.000000,21.836303> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.952347,0.000000,23.151694>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.036325,0.000000,23.174197>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-14.999808,0> translate<21.952347,0.000000,23.151694> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.985109,0.000000,20.615400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.874506,0.000000,20.615400>}
box{<0,0,-0.076200><0.889397,0.035000,0.076200> rotate<0,0.000000,0> translate<21.985109,0.000000,20.615400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.985109,0.000000,21.772597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.074488,0.000000,21.772597>}
box{<0,0,-0.076200><1.089378,0.035000,0.076200> rotate<0,0.000000,0> translate<21.985109,0.000000,21.772597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.027213,0.000000,23.469600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,23.469600>}
box{<0,0,-0.076200><4.947588,0.035000,0.076200> rotate<0,0.000000,0> translate<22.027213,0.000000,23.469600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.036325,0.000000,20.151597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.453603,0.000000,20.151597>}
box{<0,0,-0.076200><0.417278,0.035000,0.076200> rotate<0,0.000000,0> translate<22.036325,0.000000,20.151597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.036325,0.000000,21.813800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.453603,0.000000,21.813797>}
box{<0,0,-0.076200><0.417278,0.035000,0.076200> rotate<0,0.000429,0> translate<22.036325,0.000000,21.813800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.036325,0.000000,23.174197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.453603,0.000000,23.174197>}
box{<0,0,-0.076200><0.417278,0.035000,0.076200> rotate<0,0.000000,0> translate<22.036325,0.000000,23.174197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.072597,0.000000,18.749997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.072597,0.000000,18.791200>}
box{<0,0,-0.076200><0.041203,0.035000,0.076200> rotate<0,90.000000,0> translate<22.072597,0.000000,18.791200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.072597,0.000000,18.749997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.035228,0.000000,18.749997>}
box{<0,0,-0.076200><0.962631,0.035000,0.076200> rotate<0,0.000000,0> translate<22.072597,0.000000,18.749997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.072597,0.000000,18.791200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.453603,0.000000,18.791197>}
box{<0,0,-0.076200><0.381006,0.035000,0.076200> rotate<0,0.000470,0> translate<22.072597,0.000000,18.791200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.092894,-1.535000,16.306800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.346894,-1.535000,16.560800>}
box{<0,0,-0.076200><0.359210,0.035000,0.076200> rotate<0,-44.997030,0> translate<22.092894,-1.535000,16.306800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.092894,-1.535000,16.306800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,16.306800>}
box{<0,0,-0.076200><4.881906,0.035000,0.076200> rotate<0,0.000000,0> translate<22.092894,-1.535000,16.306800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.103416,0.000000,23.545800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.948216,0.000000,23.545800>}
box{<0,0,-0.076200><2.844800,0.035000,0.076200> rotate<0,0.000000,0> translate<22.103416,0.000000,23.545800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.156456,-1.535000,17.627597>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.598341,-1.535000,17.627597>}
box{<0,0,-0.076200><0.441884,0.035000,0.076200> rotate<0,0.000000,0> translate<22.156456,-1.535000,17.627597> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.245294,-1.535000,16.459200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,16.459200>}
box{<0,0,-0.076200><4.729506,0.035000,0.076200> rotate<0,0.000000,0> translate<22.245294,-1.535000,16.459200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.346894,-1.535000,16.560800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.598341,-1.535000,16.560800>}
box{<0,0,-0.076200><0.251447,0.035000,0.076200> rotate<0,0.000000,0> translate<22.346894,-1.535000,16.560800> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.453603,0.000000,22.570209>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.453603,0.000000,23.174197>}
box{<0,0,-0.076200><0.603987,0.035000,0.076200> rotate<0,90.000000,0> translate<22.453603,0.000000,23.174197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.453603,0.000000,22.570209>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.605991,0.000000,22.570209>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<22.453603,0.000000,22.570209> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.453603,0.000000,22.707600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.605991,0.000000,22.707600>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<22.453603,0.000000,22.707600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.453603,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.605991,0.000000,22.860000>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<22.453603,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.453603,0.000000,23.012400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.605991,0.000000,23.012400>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<22.453603,0.000000,23.012400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.453603,0.000000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.605991,0.000000,23.164800>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<22.453603,0.000000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.598341,-1.535000,16.560800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.910797,-1.535000,16.873256>}
box{<0,0,-0.076200><0.441880,0.035000,0.076200> rotate<0,-44.997030,0> translate<22.598341,-1.535000,16.560800> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.605991,0.000000,23.174197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.605991,0.000000,22.570209>}
box{<0,0,-0.076200><0.603987,0.035000,0.076200> rotate<0,-90.000000,0> translate<22.605991,0.000000,22.570209> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.605991,0.000000,23.174197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.023272,0.000000,23.174197>}
box{<0,0,-0.076200><0.417281,0.035000,0.076200> rotate<0,0.000000,0> translate<22.605991,0.000000,23.174197> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.649141,-1.535000,16.611600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,16.611600>}
box{<0,0,-0.076200><4.325659,0.035000,0.076200> rotate<0,0.000000,0> translate<22.649141,-1.535000,16.611600> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.801541,-1.535000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,16.764000>}
box{<0,0,-0.076200><4.173259,0.035000,0.076200> rotate<0,0.000000,0> translate<22.801541,-1.535000,16.764000> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.023272,0.000000,23.174197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.107250,0.000000,23.151694>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,14.999808,0> translate<23.023272,0.000000,23.174197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.035228,0.000000,17.592800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.070850,0.000000,17.557175>}
box{<0,0,-0.076200><0.050379,0.035000,0.076200> rotate<0,44.999543,0> translate<23.035228,0.000000,17.592800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.035228,0.000000,18.749997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.070850,0.000000,18.785622>}
box{<0,0,-0.076200><0.050379,0.035000,0.076200> rotate<0,-44.999543,0> translate<23.035228,0.000000,18.749997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.058341,0.000000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,23.164800>}
box{<0,0,-0.076200><3.916459,0.035000,0.076200> rotate<0,0.000000,0> translate<23.058341,0.000000,23.164800> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.107250,0.000000,23.151694>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.182547,0.000000,23.108222>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,29.997566,0> translate<23.107250,0.000000,23.151694> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.218169,0.000000,18.892800>}
box{<0,0,-0.076200><0.050379,0.035000,0.076200> rotate<0,-44.999543,0> translate<23.182547,0.000000,18.857175> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.182547,0.000000,20.085622>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.218169,0.000000,20.049997>}
box{<0,0,-0.076200><0.050379,0.035000,0.076200> rotate<0,44.999543,0> translate<23.182547,0.000000,20.085622> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.218169,0.000000,18.892800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.268287,0.000000,18.892800>}
box{<0,0,-0.076200><1.050119,0.035000,0.076200> rotate<0,0.000000,0> translate<23.218169,0.000000,18.892800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.218169,0.000000,20.049997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.342600,0.000000,20.049997>}
box{<0,0,-0.076200><0.124431,0.035000,0.076200> rotate<0,0.000000,0> translate<23.218169,0.000000,20.049997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.223088,0.000000,11.838200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.356997,0.000000,11.972109>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<23.223088,0.000000,11.838200> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.272088,0.000000,11.887200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.784709,0.000000,11.887200>}
box{<0,0,-0.076200><1.512622,0.035000,0.076200> rotate<0,0.000000,0> translate<23.272088,0.000000,11.887200> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.356997,0.000000,11.972109>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.356997,0.000000,12.293600>}
box{<0,0,-0.076200><0.321491,0.035000,0.076200> rotate<0,90.000000,0> translate<23.356997,0.000000,12.293600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.356997,0.000000,12.039600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.699800,0.000000,12.039600>}
box{<0,0,-0.076200><1.342803,0.035000,0.076200> rotate<0,0.000000,0> translate<23.356997,0.000000,12.039600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.356997,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.699800,0.000000,12.192000>}
box{<0,0,-0.076200><1.342803,0.035000,0.076200> rotate<0,0.000000,0> translate<23.356997,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.356997,0.000000,12.293600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.667694,0.000000,12.293600>}
box{<0,0,-0.076200><0.310697,0.035000,0.076200> rotate<0,0.000000,0> translate<23.356997,0.000000,12.293600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.464488,0.000000,21.031200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,21.031200>}
box{<0,0,-0.076200><3.510313,0.035000,0.076200> rotate<0,0.000000,0> translate<23.464488,0.000000,21.031200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.616888,0.000000,16.154400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.870894,0.000000,15.900397>}
box{<0,0,-0.076200><0.359217,0.035000,0.076200> rotate<0,44.996678,0> translate<23.616888,0.000000,16.154400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.616888,0.000000,16.154400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.135416,0.000000,16.154400>}
box{<0,0,-0.076200><0.518528,0.035000,0.076200> rotate<0,0.000000,0> translate<23.616888,0.000000,16.154400> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.667694,0.000000,12.293600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.875997,0.000000,12.501903>}
box{<0,0,-0.076200><0.294585,0.035000,0.076200> rotate<0,-44.997030,0> translate<23.667694,0.000000,12.293600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.718494,0.000000,12.344400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.699800,0.000000,12.344400>}
box{<0,0,-0.076200><0.981306,0.035000,0.076200> rotate<0,0.000000,0> translate<23.718494,0.000000,12.344400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.769288,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,20.726400>}
box{<0,0,-0.076200><3.205513,0.035000,0.076200> rotate<0,0.000000,0> translate<23.769288,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.769291,0.000000,16.002000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,16.002000>}
box{<0,0,-0.076200><3.205509,0.035000,0.076200> rotate<0,0.000000,0> translate<23.769291,0.000000,16.002000> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.870894,0.000000,12.496800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.699800,0.000000,12.496800>}
box{<0,0,-0.076200><0.828906,0.035000,0.076200> rotate<0,0.000000,0> translate<23.870894,0.000000,12.496800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.870894,0.000000,15.900397>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.079197,0.000000,15.692094>}
box{<0,0,-0.076200><0.294585,0.035000,0.076200> rotate<0,44.997030,0> translate<23.870894,0.000000,15.900397> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.875997,0.000000,12.501903>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.079197,0.000000,12.705103>}
box{<0,0,-0.076200><0.287368,0.035000,0.076200> rotate<0,-44.997030,0> translate<23.875997,0.000000,12.501903> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.881416,0.000000,20.650197>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.104597,0.000000,20.427016>}
box{<0,0,-0.076200><0.315626,0.035000,0.076200> rotate<0,44.997030,0> translate<23.881416,0.000000,20.650197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.907563,-1.535000,29.006800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.952197,-1.535000,29.051434>}
box{<0,0,-0.076200><0.063123,0.035000,0.076200> rotate<0,-44.997030,0> translate<23.907563,-1.535000,29.006800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.921691,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,15.849600>}
box{<0,0,-0.076200><3.053109,0.035000,0.076200> rotate<0,0.000000,0> translate<23.921691,0.000000,15.849600> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.023294,0.000000,12.649200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.699800,0.000000,12.649200>}
box{<0,0,-0.076200><0.676506,0.035000,0.076200> rotate<0,0.000000,0> translate<24.023294,0.000000,12.649200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.074091,0.000000,15.697200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.691828,0.000000,15.697200>}
box{<0,0,-0.076200><0.617738,0.035000,0.076200> rotate<0,0.000000,0> translate<24.074091,0.000000,15.697200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.079197,0.000000,12.705103>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.079197,0.000000,15.692094>}
box{<0,0,-0.076200><2.986991,0.035000,0.076200> rotate<0,90.000000,0> translate<24.079197,0.000000,15.692094> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.079197,0.000000,12.801600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.699800,0.000000,12.801600>}
box{<0,0,-0.076200><0.620603,0.035000,0.076200> rotate<0,0.000000,0> translate<24.079197,0.000000,12.801600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.079197,0.000000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.699800,0.000000,12.954000>}
box{<0,0,-0.076200><0.620603,0.035000,0.076200> rotate<0,0.000000,0> translate<24.079197,0.000000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.079197,0.000000,13.106400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.699800,0.000000,13.106400>}
box{<0,0,-0.076200><0.620603,0.035000,0.076200> rotate<0,0.000000,0> translate<24.079197,0.000000,13.106400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.079197,0.000000,13.258800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.699800,0.000000,13.258800>}
box{<0,0,-0.076200><0.620603,0.035000,0.076200> rotate<0,0.000000,0> translate<24.079197,0.000000,13.258800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.079197,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,13.411200>}
box{<0,0,-0.076200><2.895603,0.035000,0.076200> rotate<0,0.000000,0> translate<24.079197,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.079197,0.000000,13.563600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,13.563600>}
box{<0,0,-0.076200><2.895603,0.035000,0.076200> rotate<0,0.000000,0> translate<24.079197,0.000000,13.563600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.079197,0.000000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,13.716000>}
box{<0,0,-0.076200><2.895603,0.035000,0.076200> rotate<0,0.000000,0> translate<24.079197,0.000000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.079197,0.000000,13.868400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,13.868400>}
box{<0,0,-0.076200><2.895603,0.035000,0.076200> rotate<0,0.000000,0> translate<24.079197,0.000000,13.868400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.079197,0.000000,14.020800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,14.020800>}
box{<0,0,-0.076200><2.895603,0.035000,0.076200> rotate<0,0.000000,0> translate<24.079197,0.000000,14.020800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.079197,0.000000,14.173200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.658891,0.000000,14.173200>}
box{<0,0,-0.076200><0.579694,0.035000,0.076200> rotate<0,0.000000,0> translate<24.079197,0.000000,14.173200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.079197,0.000000,14.325600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.598200,0.000000,14.325600>}
box{<0,0,-0.076200><0.519003,0.035000,0.076200> rotate<0,0.000000,0> translate<24.079197,0.000000,14.325600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.079197,0.000000,14.478000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.598200,0.000000,14.478000>}
box{<0,0,-0.076200><0.519003,0.035000,0.076200> rotate<0,0.000000,0> translate<24.079197,0.000000,14.478000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.079197,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.598200,0.000000,14.630400>}
box{<0,0,-0.076200><0.519003,0.035000,0.076200> rotate<0,0.000000,0> translate<24.079197,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.079197,0.000000,14.782800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.598200,0.000000,14.782800>}
box{<0,0,-0.076200><0.519003,0.035000,0.076200> rotate<0,0.000000,0> translate<24.079197,0.000000,14.782800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.079197,0.000000,14.935200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.802188,0.000000,14.935200>}
box{<0,0,-0.076200><1.722991,0.035000,0.076200> rotate<0,0.000000,0> translate<24.079197,0.000000,14.935200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.079197,0.000000,15.087600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.598200,0.000000,15.087600>}
box{<0,0,-0.076200><0.519003,0.035000,0.076200> rotate<0,0.000000,0> translate<24.079197,0.000000,15.087600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.079197,0.000000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.598200,0.000000,15.240000>}
box{<0,0,-0.076200><0.519003,0.035000,0.076200> rotate<0,0.000000,0> translate<24.079197,0.000000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.079197,0.000000,15.392400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.598200,0.000000,15.392400>}
box{<0,0,-0.076200><0.519003,0.035000,0.076200> rotate<0,0.000000,0> translate<24.079197,0.000000,15.392400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.079197,0.000000,15.544800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.607453,0.000000,15.544800>}
box{<0,0,-0.076200><0.528256,0.035000,0.076200> rotate<0,0.000000,0> translate<24.079197,0.000000,15.544800> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.364287,0.000000,19.953997>}
box{<0,0,-0.076200><0.135765,0.035000,0.076200> rotate<0,44.997030,0> translate<24.268287,0.000000,20.049997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.273084,0.000000,18.897600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.333200,0.000000,18.897600>}
box{<0,0,-0.076200><0.060116,0.035000,0.076200> rotate<0,0.000000,0> translate<24.273084,0.000000,18.897600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.287816,0.000000,16.306800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,16.306800>}
box{<0,0,-0.076200><2.686984,0.035000,0.076200> rotate<0,0.000000,0> translate<24.287816,0.000000,16.306800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.301050,0.000000,17.513703>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.333200,0.000000,17.532269>}
box{<0,0,-0.076200><0.037126,0.035000,0.076200> rotate<0,-30.003117,0> translate<24.301050,0.000000,17.513703> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.301050,0.000000,18.829094>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.333200,0.000000,18.810528>}
box{<0,0,-0.076200><0.037126,0.035000,0.076200> rotate<0,30.003117,0> translate<24.301050,0.000000,18.829094> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.322344,0.000000,17.526000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.333200,0.000000,17.526000>}
box{<0,0,-0.076200><0.010856,0.035000,0.076200> rotate<0,0.000000,0> translate<24.322344,0.000000,17.526000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.325834,0.000000,18.950350>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.333200,0.000000,18.942981>}
box{<0,0,-0.076200><0.010419,0.035000,0.076200> rotate<0,45.009181,0> translate<24.325834,0.000000,18.950350> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.333200,0.000000,17.532269>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.333200,0.000000,17.429816>}
box{<0,0,-0.076200><0.102453,0.035000,0.076200> rotate<0,-90.000000,0> translate<24.333200,0.000000,17.429816> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.333200,0.000000,18.942981>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.333200,0.000000,18.810528>}
box{<0,0,-0.076200><0.132453,0.035000,0.076200> rotate<0,-90.000000,0> translate<24.333200,0.000000,18.810528> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.353884,0.000000,19.964400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,19.964400>}
box{<0,0,-0.076200><2.620916,0.035000,0.076200> rotate<0,0.000000,0> translate<24.353884,0.000000,19.964400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.364287,0.000000,19.953997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.399816,0.000000,19.953997>}
box{<0,0,-0.076200><0.035528,0.035000,0.076200> rotate<0,0.000000,0> translate<24.364287,0.000000,19.953997> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.598200,0.000000,14.323325>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.620703,0.000000,14.239347>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,74.994252,0> translate<24.598200,0.000000,14.323325> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.598200,0.000000,14.840603>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.598200,0.000000,14.323325>}
box{<0,0,-0.076200><0.517278,0.035000,0.076200> rotate<0,-90.000000,0> translate<24.598200,0.000000,14.323325> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.598200,0.000000,14.840603>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.802188,0.000000,14.840603>}
box{<0,0,-0.076200><1.203988,0.035000,0.076200> rotate<0,0.000000,0> translate<24.598200,0.000000,14.840603> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.598200,0.000000,14.992991>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.802188,0.000000,14.992991>}
box{<0,0,-0.076200><1.203988,0.035000,0.076200> rotate<0,0.000000,0> translate<24.598200,0.000000,14.992991> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.598200,0.000000,15.510272>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.598200,0.000000,14.992991>}
box{<0,0,-0.076200><0.517281,0.035000,0.076200> rotate<0,-90.000000,0> translate<24.598200,0.000000,14.992991> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.598200,0.000000,15.510272>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.620703,0.000000,15.594250>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-74.994252,0> translate<24.598200,0.000000,15.510272> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.620703,0.000000,14.239347>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.664175,0.000000,14.164050>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,59.996495,0> translate<24.620703,0.000000,14.239347> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.620703,0.000000,15.594250>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.664175,0.000000,15.669547>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-59.996495,0> translate<24.620703,0.000000,15.594250> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.664175,0.000000,14.164050>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.725650,0.000000,14.102575>}
box{<0,0,-0.076200><0.086939,0.035000,0.076200> rotate<0,44.997030,0> translate<24.664175,0.000000,14.164050> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.664175,0.000000,15.669547>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.725650,0.000000,15.731022>}
box{<0,0,-0.076200><0.086939,0.035000,0.076200> rotate<0,-44.997030,0> translate<24.664175,0.000000,15.669547> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.694213,0.000000,19.659600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,19.659600>}
box{<0,0,-0.076200><2.280587,0.035000,0.076200> rotate<0,0.000000,0> translate<24.694213,0.000000,19.659600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.699800,0.000000,11.972109>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.833709,0.000000,11.838200>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,44.997030,0> translate<24.699800,0.000000,11.972109> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.699800,0.000000,13.261488>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.699800,0.000000,11.972109>}
box{<0,0,-0.076200><1.289378,0.035000,0.076200> rotate<0,-90.000000,0> translate<24.699800,0.000000,11.972109> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.699800,0.000000,13.261488>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.833709,0.000000,13.395397>}
box{<0,0,-0.076200><0.189376,0.035000,0.076200> rotate<0,-44.997030,0> translate<24.699800,0.000000,13.261488> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.725650,0.000000,14.102575>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.800947,0.000000,14.059103>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,29.997566,0> translate<24.725650,0.000000,14.102575> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.725650,0.000000,15.731022>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.800947,0.000000,15.774494>}
box{<0,0,-0.076200><0.086945,0.035000,0.076200> rotate<0,-29.997566,0> translate<24.725650,0.000000,15.731022> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.745016,0.000000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,16.764000>}
box{<0,0,-0.076200><2.229784,0.035000,0.076200> rotate<0,0.000000,0> translate<24.745016,0.000000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.800947,0.000000,14.059103>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.884925,0.000000,14.036600>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,14.999808,0> translate<24.800947,0.000000,14.059103> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.800947,0.000000,15.774494>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.884925,0.000000,15.796997>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-14.999808,0> translate<24.800947,0.000000,15.774494> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.833709,0.000000,11.838200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.923088,0.000000,11.838200>}
box{<0,0,-0.076200><2.089378,0.035000,0.076200> rotate<0,0.000000,0> translate<24.833709,0.000000,11.838200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.833709,0.000000,13.395397>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.923088,0.000000,13.395397>}
box{<0,0,-0.076200><2.089378,0.035000,0.076200> rotate<0,0.000000,0> translate<24.833709,0.000000,13.395397> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.846613,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,19.507200>}
box{<0,0,-0.076200><2.128187,0.035000,0.076200> rotate<0,0.000000,0> translate<24.846613,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.872016,0.000000,16.891000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.095197,0.000000,17.114181>}
box{<0,0,-0.076200><0.315626,0.035000,0.076200> rotate<0,-44.997030,0> translate<24.872016,0.000000,16.891000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.884925,0.000000,14.036600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.802203,0.000000,14.036600>}
box{<0,0,-0.076200><0.917278,0.035000,0.076200> rotate<0,0.000000,0> translate<24.884925,0.000000,14.036600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.884925,0.000000,15.796997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.802203,0.000000,15.796997>}
box{<0,0,-0.076200><0.917278,0.035000,0.076200> rotate<0,0.000000,0> translate<24.884925,0.000000,15.796997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.897416,0.000000,16.916400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,16.916400>}
box{<0,0,-0.076200><2.077384,0.035000,0.076200> rotate<0,0.000000,0> translate<24.897416,0.000000,16.916400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.948216,0.000000,23.545800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.202216,0.000000,23.799800>}
box{<0,0,-0.076200><0.359210,0.035000,0.076200> rotate<0,-44.997030,0> translate<24.948216,0.000000,23.545800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.999013,0.000000,19.354800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,19.354800>}
box{<0,0,-0.076200><1.975787,0.035000,0.076200> rotate<0,0.000000,0> translate<24.999013,0.000000,19.354800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.024416,0.000000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,23.622000>}
box{<0,0,-0.076200><1.950384,0.035000,0.076200> rotate<0,0.000000,0> translate<25.024416,0.000000,23.622000> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.176816,0.000000,23.774400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,23.774400>}
box{<0,0,-0.076200><1.797984,0.035000,0.076200> rotate<0,0.000000,0> translate<25.176816,0.000000,23.774400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.202216,0.000000,23.799800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.405416,0.000000,24.003000>}
box{<0,0,-0.076200><0.287368,0.035000,0.076200> rotate<0,-44.997030,0> translate<25.202216,0.000000,23.799800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.329216,0.000000,23.926800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,23.926800>}
box{<0,0,-0.076200><1.645584,0.035000,0.076200> rotate<0,0.000000,0> translate<25.329216,0.000000,23.926800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.405416,0.000000,24.003000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.193563,0.000000,24.003000>}
box{<0,0,-0.076200><0.788147,0.035000,0.076200> rotate<0,0.000000,0> translate<25.405416,0.000000,24.003000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.802188,0.000000,14.992991>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.802188,0.000000,14.840603>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,-90.000000,0> translate<25.802188,0.000000,14.840603> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.802203,0.000000,14.036600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.802203,0.000000,14.840588>}
box{<0,0,-0.076200><0.803988,0.035000,0.076200> rotate<0,90.000000,0> translate<25.802203,0.000000,14.840588> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.802203,0.000000,14.173200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.954591,0.000000,14.173200>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<25.802203,0.000000,14.173200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.802203,0.000000,14.325600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.954591,0.000000,14.325600>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<25.802203,0.000000,14.325600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.802203,0.000000,14.478000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.954591,0.000000,14.478000>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<25.802203,0.000000,14.478000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.802203,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.954591,0.000000,14.630400>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<25.802203,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.802203,0.000000,14.782800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.954591,0.000000,14.782800>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<25.802203,0.000000,14.782800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.802203,0.000000,14.840588>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.954591,0.000000,14.840588>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<25.802203,0.000000,14.840588> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.802203,0.000000,14.993009>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.802203,0.000000,15.796997>}
box{<0,0,-0.076200><0.803987,0.035000,0.076200> rotate<0,90.000000,0> translate<25.802203,0.000000,15.796997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.802203,0.000000,14.993009>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.954591,0.000000,14.993009>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<25.802203,0.000000,14.993009> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.802203,0.000000,15.087600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.954591,0.000000,15.087600>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<25.802203,0.000000,15.087600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.802203,0.000000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.954591,0.000000,15.240000>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<25.802203,0.000000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.802203,0.000000,15.392400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.954591,0.000000,15.392400>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<25.802203,0.000000,15.392400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.802203,0.000000,15.544800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.954591,0.000000,15.544800>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<25.802203,0.000000,15.544800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.802203,0.000000,15.697200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.954591,0.000000,15.697200>}
box{<0,0,-0.076200><0.152387,0.035000,0.076200> rotate<0,0.000000,0> translate<25.802203,0.000000,15.697200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.954591,0.000000,14.036600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.871872,0.000000,14.036600>}
box{<0,0,-0.076200><0.917281,0.035000,0.076200> rotate<0,0.000000,0> translate<25.954591,0.000000,14.036600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.954591,0.000000,14.840588>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.954591,0.000000,14.036600>}
box{<0,0,-0.076200><0.803988,0.035000,0.076200> rotate<0,-90.000000,0> translate<25.954591,0.000000,14.036600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.954591,0.000000,15.796997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.954591,0.000000,14.993009>}
box{<0,0,-0.076200><0.803987,0.035000,0.076200> rotate<0,-90.000000,0> translate<25.954591,0.000000,14.993009> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.954591,0.000000,15.796997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.871872,0.000000,15.796997>}
box{<0,0,-0.076200><0.917281,0.035000,0.076200> rotate<0,0.000000,0> translate<25.954591,0.000000,15.796997> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.871872,0.000000,14.036600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.955850,0.000000,14.059103>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,-14.999808,0> translate<26.871872,0.000000,14.036600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.871872,0.000000,15.796997>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.955850,0.000000,15.774494>}
box{<0,0,-0.076200><0.086941,0.035000,0.076200> rotate<0,14.999808,0> translate<26.871872,0.000000,15.796997> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.923088,0.000000,11.838200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,11.889916>}
box{<0,0,-0.076200><0.073135,0.035000,0.076200> rotate<0,-44.998761,0> translate<26.923088,0.000000,11.838200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.923088,0.000000,13.395397>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,13.343681>}
box{<0,0,-0.076200><0.073135,0.035000,0.076200> rotate<0,44.998761,0> translate<26.923088,0.000000,13.395397> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.955850,0.000000,14.059103>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,14.070047>}
box{<0,0,-0.076200><0.021883,0.035000,0.076200> rotate<0,-30.004737,0> translate<26.955850,0.000000,14.059103> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.955850,0.000000,15.774494>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,15.763550>}
box{<0,0,-0.076200><0.021883,0.035000,0.076200> rotate<0,30.004737,0> translate<26.955850,0.000000,15.774494> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.972084,0.000000,11.887200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,11.887200>}
box{<0,0,-0.076200><0.002716,0.035000,0.076200> rotate<0,0.000000,0> translate<26.972084,0.000000,11.887200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,11.889916>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,7.696197>}
box{<0,0,-0.076200><4.193719,0.035000,0.076200> rotate<0,-90.000000,0> translate<26.974800,0.000000,7.696197> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,14.070047>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,13.343681>}
box{<0,0,-0.076200><0.726366,0.035000,0.076200> rotate<0,-90.000000,0> translate<26.974800,0.000000,13.343681> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,0.000000,15.763550>}
box{<0,0,-0.076200><13.192450,0.035000,0.076200> rotate<0,-90.000000,0> translate<26.974800,0.000000,15.763550> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,30.683200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.974800,-1.535000,7.696197>}
box{<0,0,-0.076200><22.987003,0.035000,0.076200> rotate<0,-90.000000,0> translate<26.974800,-1.535000,7.696197> }
texture{col_pol}
}
#end
union{
//Holes(fast)/Vias
cylinder{<14.300200,0.038000,15.849600><14.300200,-1.538000,15.849600>0.152400 }
cylinder{<13.411200,0.038000,17.627600><13.411200,-1.538000,17.627600>0.152400 }
cylinder{<23.647400,0.038000,17.195800><23.647400,-1.538000,17.195800>0.152400 }
cylinder{<19.253200,0.038000,20.574000><19.253200,-1.538000,20.574000>0.152400 }
cylinder{<18.389600,0.038000,20.574000><18.389600,-1.538000,20.574000>0.152400 }
cylinder{<17.475200,0.038000,20.574000><17.475200,-1.538000,20.574000>0.152400 }
cylinder{<16.560800,0.038000,20.574000><16.560800,-1.538000,20.574000>0.152400 }
cylinder{<15.697200,0.038000,20.574000><15.697200,-1.538000,20.574000>0.152400 }
cylinder{<19.253200,0.038000,19.659600><19.253200,-1.538000,19.659600>0.152400 }
cylinder{<18.389600,0.038000,19.659600><18.389600,-1.538000,19.659600>0.152400 }
cylinder{<17.475200,0.038000,19.659600><17.475200,-1.538000,19.659600>0.152400 }
cylinder{<16.560800,0.038000,19.659600><16.560800,-1.538000,19.659600>0.152400 }
cylinder{<15.697200,0.038000,19.659600><15.697200,-1.538000,19.659600>0.152400 }
cylinder{<19.253200,0.038000,18.770600><19.253200,-1.538000,18.770600>0.152400 }
cylinder{<18.389600,0.038000,18.770600><18.389600,-1.538000,18.770600>0.152400 }
cylinder{<17.475200,0.038000,18.770600><17.475200,-1.538000,18.770600>0.152400 }
cylinder{<16.560800,0.038000,18.770600><16.560800,-1.538000,18.770600>0.152400 }
cylinder{<15.697200,0.038000,18.770600><15.697200,-1.538000,18.770600>0.152400 }
cylinder{<16.560800,0.038000,21.513800><16.560800,-1.538000,21.513800>0.152400 }
cylinder{<15.697200,0.038000,21.513800><15.697200,-1.538000,21.513800>0.152400 }
cylinder{<15.697200,0.038000,22.377400><15.697200,-1.538000,22.377400>0.152400 }
cylinder{<12.776200,0.038000,25.298400><12.776200,-1.538000,25.298400>0.152400 }
cylinder{<18.567400,0.038000,10.871200><18.567400,-1.538000,10.871200>0.152400 }
cylinder{<17.195800,0.038000,12.547600><17.195800,-1.538000,12.547600>0.152400 }
cylinder{<10.414000,0.038000,10.769600><10.414000,-1.538000,10.769600>0.152400 }
cylinder{<10.414000,0.038000,13.208000><10.414000,-1.538000,13.208000>0.152400 }
cylinder{<10.414000,0.038000,15.798800><10.414000,-1.538000,15.798800>0.152400 }
cylinder{<10.414000,0.038000,18.288000><10.414000,-1.538000,18.288000>0.152400 }
cylinder{<10.414000,0.038000,20.828000><10.414000,-1.538000,20.828000>0.152400 }
cylinder{<10.414000,0.038000,23.418800><10.414000,-1.538000,23.418800>0.152400 }
cylinder{<10.414000,0.038000,28.702000><10.414000,-1.538000,28.702000>0.152400 }
cylinder{<10.414000,0.038000,8.331200><10.414000,-1.538000,8.331200>0.152400 }
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
cylinder{<25.273000,0.038000,28.702000><25.273000,-1.538000,28.702000>0.152400 }
cylinder{<12.446000,0.038000,8.331200><12.446000,-1.538000,8.331200>0.152400 }
cylinder{<16.357600,0.038000,8.382000><16.357600,-1.538000,8.382000>0.152400 }
cylinder{<18.897600,0.038000,8.382000><18.897600,-1.538000,8.382000>0.152400 }
cylinder{<16.357600,0.038000,10.871200><16.357600,-1.538000,10.871200>0.152400 }
cylinder{<21.234400,0.038000,8.382000><21.234400,-1.538000,8.382000>0.152400 }
cylinder{<14.325600,0.038000,23.926800><14.325600,-1.538000,23.926800>0.152400 }
cylinder{<12.395200,0.038000,26.873200><12.395200,-1.538000,26.873200>0.152400 }
cylinder{<12.395200,0.038000,27.889200><12.395200,-1.538000,27.889200>0.152400 }
cylinder{<24.384000,0.038000,15.925800><24.384000,-1.538000,15.925800>0.152400 }
cylinder{<21.234400,0.038000,10.922000><21.234400,-1.538000,10.922000>0.152400 }
cylinder{<23.622000,0.038000,10.922000><23.622000,-1.538000,10.922000>0.152400 }
cylinder{<16.713200,0.038000,27.787600><16.713200,-1.538000,27.787600>0.152400 }
cylinder{<10.464800,0.038000,25.908000><10.464800,-1.538000,25.908000>0.152400 }
cylinder{<23.622000,0.038000,21.590000><23.622000,-1.538000,21.590000>0.152400 }
cylinder{<26.670000,0.038000,10.922000><26.670000,-1.538000,10.922000>0.152400 }
cylinder{<26.670000,0.038000,13.716000><26.670000,-1.538000,13.716000>0.152400 }
cylinder{<26.670000,0.038000,16.205200><26.670000,-1.538000,16.205200>0.152400 }
cylinder{<26.670000,0.038000,18.542000><26.670000,-1.538000,18.542000>0.152400 }
cylinder{<26.670000,0.038000,21.082000><26.670000,-1.538000,21.082000>0.152400 }
cylinder{<26.670000,0.038000,23.622000><26.670000,-1.538000,23.622000>0.152400 }
cylinder{<26.670000,0.038000,8.382000><26.670000,-1.538000,8.382000>0.152400 }
cylinder{<26.670000,0.038000,25.654000><26.670000,-1.538000,25.654000>0.152400 }
cylinder{<26.670000,0.038000,27.178000><26.670000,-1.538000,27.178000>0.152400 }
cylinder{<14.655800,0.038000,29.972000><14.655800,-1.538000,29.972000>0.190500 }
cylinder{<24.434800,0.038000,13.665200><24.434800,-1.538000,13.665200>0.152400 }
cylinder{<15.570200,0.038000,12.649200><15.570200,-1.538000,12.649200>0.152400 }
cylinder{<20.015200,0.038000,15.849600><20.015200,-1.538000,15.849600>0.152400 }
cylinder{<17.475200,0.038000,21.513800><17.475200,-1.538000,21.513800>0.152400 }
cylinder{<18.389600,0.038000,21.513800><18.389600,-1.538000,21.513800>0.152400 }
cylinder{<19.253200,0.038000,21.513800><19.253200,-1.538000,21.513800>0.152400 }
cylinder{<16.560800,0.038000,22.377400><16.560800,-1.538000,22.377400>0.152400 }
cylinder{<17.475200,0.038000,22.377400><17.475200,-1.538000,22.377400>0.152400 }
cylinder{<18.389600,0.038000,22.377400><18.389600,-1.538000,22.377400>0.152400 }
cylinder{<19.253200,0.038000,22.377400><19.253200,-1.538000,22.377400>0.152400 }
cylinder{<21.488400,0.038000,20.116800><21.488400,-1.538000,20.116800>0.152400 }
cylinder{<13.614400,0.038000,22.402800><13.614400,-1.538000,22.402800>0.152400 }
cylinder{<16.078200,0.038000,16.027400><16.078200,-1.538000,16.027400>0.152400 }
cylinder{<15.011400,0.038000,26.035000><15.011400,-1.538000,26.035000>0.152400 }
cylinder{<22.377400,0.038000,17.094200><22.377400,-1.538000,17.094200>0.152400 }
cylinder{<11.557000,0.038000,26.035000><11.557000,-1.538000,26.035000>0.152400 }
cylinder{<13.868400,0.038000,16.560800><13.868400,-1.538000,16.560800>0.152400 }
cylinder{<16.103600,0.038000,16.002000><16.103600,-1.538000,16.002000>0.152400 }
cylinder{<19.761200,0.038000,16.662400><19.761200,-1.538000,16.662400>0.152400 }
cylinder{<12.750800,0.038000,21.539200><12.750800,-1.538000,21.539200>0.152400 }
cylinder{<9.550400,0.038000,25.806400><9.550400,-1.538000,25.806400>0.152400 }
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
//C2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.832800,0.000000,14.342000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.832800,0.000000,13.852000>}
box{<0,0,-0.076200><0.490000,0.036000,0.076200> rotate<0,-90.000000,0> translate<19.832800,0.000000,13.852000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.384800,0.000000,13.852000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.384800,0.000000,14.342000>}
box{<0,0,-0.076200><0.490000,0.036000,0.076200> rotate<0,90.000000,0> translate<19.384800,0.000000,14.342000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<19.639300,0.000000,14.097000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<19.578300,0.000000,14.097000>}
box{<0,0,-0.203200><0.061000,0.036000,0.203200> rotate<0,0.000000,0> translate<19.578300,0.000000,14.097000> }
box{<-0.150000,0,-0.299950><0.150000,0.036000,0.299950> rotate<0,-270.000000,0> translate<19.603950,0.000000,14.501000>}
box{<-0.150000,0,-0.299950><0.150000,0.036000,0.299950> rotate<0,-270.000000,0> translate<19.603950,0.000000,13.688200>}
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
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.399800,0.000000,22.818200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.399800,0.000000,23.308200>}
box{<0,0,-0.076200><0.490000,0.036000,0.076200> rotate<0,90.000000,0> translate<12.399800,0.000000,23.308200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.847800,0.000000,23.308200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.847800,0.000000,22.818200>}
box{<0,0,-0.076200><0.490000,0.036000,0.076200> rotate<0,-90.000000,0> translate<12.847800,0.000000,22.818200> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<12.593300,0.000000,23.063200>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<12.654300,0.000000,23.063200>}
box{<0,0,-0.203200><0.061000,0.036000,0.203200> rotate<0,0.000000,0> translate<12.593300,0.000000,23.063200> }
box{<-0.150000,0,-0.299950><0.150000,0.036000,0.299950> rotate<0,-90.000000,0> translate<12.628650,0.000000,22.659200>}
box{<-0.150000,0,-0.299950><0.150000,0.036000,0.299950> rotate<0,-90.000000,0> translate<12.628650,0.000000,23.472000>}
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
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.657800,0.000000,14.342000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.657800,0.000000,13.852000>}
box{<0,0,-0.076200><0.490000,0.036000,0.076200> rotate<0,-90.000000,0> translate<16.657800,0.000000,13.852000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.209800,0.000000,13.852000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.209800,0.000000,14.342000>}
box{<0,0,-0.076200><0.490000,0.036000,0.076200> rotate<0,90.000000,0> translate<16.209800,0.000000,14.342000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<16.464300,0.000000,14.097000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<16.403300,0.000000,14.097000>}
box{<0,0,-0.203200><0.061000,0.036000,0.203200> rotate<0,0.000000,0> translate<16.403300,0.000000,14.097000> }
box{<-0.150000,0,-0.299950><0.150000,0.036000,0.299950> rotate<0,-270.000000,0> translate<16.428950,0.000000,14.501000>}
box{<-0.150000,0,-0.299950><0.150000,0.036000,0.299950> rotate<0,-270.000000,0> translate<16.428950,0.000000,13.688200>}
//C9 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.858200,0.000000,11.751200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.858200,0.000000,11.261200>}
box{<0,0,-0.076200><0.490000,0.036000,0.076200> rotate<0,-90.000000,0> translate<19.858200,0.000000,11.261200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.410200,0.000000,11.261200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.410200,0.000000,11.751200>}
box{<0,0,-0.076200><0.490000,0.036000,0.076200> rotate<0,90.000000,0> translate<19.410200,0.000000,11.751200> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<19.664700,0.000000,11.506200>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<19.603700,0.000000,11.506200>}
box{<0,0,-0.203200><0.061000,0.036000,0.203200> rotate<0,0.000000,0> translate<19.603700,0.000000,11.506200> }
box{<-0.150000,0,-0.299950><0.150000,0.036000,0.299950> rotate<0,-270.000000,0> translate<19.629350,0.000000,11.910200>}
box{<-0.150000,0,-0.299950><0.150000,0.036000,0.299950> rotate<0,-270.000000,0> translate<19.629350,0.000000,11.097400>}
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
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.076400,0.000000,9.591600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.676400,0.000000,9.591600>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.076400,0.000000,9.591600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.076400,0.000000,8.391600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.676400,0.000000,8.391600>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.076400,0.000000,8.391600> }
//C15 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.632200,0.000000,13.852000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.632200,0.000000,14.342000>}
box{<0,0,-0.076200><0.490000,0.036000,0.076200> rotate<0,90.000000,0> translate<17.632200,0.000000,14.342000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.080200,0.000000,14.342000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.080200,0.000000,13.852000>}
box{<0,0,-0.076200><0.490000,0.036000,0.076200> rotate<0,-90.000000,0> translate<18.080200,0.000000,13.852000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<17.825700,0.000000,14.097000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<17.886700,0.000000,14.097000>}
box{<0,0,-0.203200><0.061000,0.036000,0.203200> rotate<0,0.000000,0> translate<17.825700,0.000000,14.097000> }
box{<-0.150000,0,-0.299950><0.150000,0.036000,0.299950> rotate<0,-90.000000,0> translate<17.861050,0.000000,13.693000>}
box{<-0.150000,0,-0.299950><0.150000,0.036000,0.299950> rotate<0,-90.000000,0> translate<17.861050,0.000000,14.505800>}
//D1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.049000,0.000000,14.267000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.589000,0.000000,14.267000>}
box{<0,0,-0.101600><0.460000,0.036000,0.101600> rotate<0,0.000000,0> translate<13.589000,0.000000,14.267000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.129000,0.000000,14.267000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.589000,0.000000,14.267000>}
box{<0,0,-0.101600><0.460000,0.036000,0.101600> rotate<0,0.000000,0> translate<13.129000,0.000000,14.267000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.589000,0.000000,14.267000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.822800,0.000000,13.957000>}
box{<0,0,-0.101600><0.388281,0.036000,0.101600> rotate<0,52.973141,0> translate<13.589000,0.000000,14.267000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.563600,0.000000,14.251600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.370600,0.000000,13.957000>}
box{<0,0,-0.101600><0.352191,0.036000,0.101600> rotate<0,-56.766419,0> translate<13.370600,0.000000,13.957000> }
//D2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.023600,0.000000,11.320600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.563600,0.000000,11.320600>}
box{<0,0,-0.101600><0.460000,0.036000,0.101600> rotate<0,0.000000,0> translate<13.563600,0.000000,11.320600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.103600,0.000000,11.320600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.563600,0.000000,11.320600>}
box{<0,0,-0.101600><0.460000,0.036000,0.101600> rotate<0,0.000000,0> translate<13.103600,0.000000,11.320600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.563600,0.000000,11.320600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.797400,0.000000,11.010600>}
box{<0,0,-0.101600><0.388281,0.036000,0.101600> rotate<0,52.973141,0> translate<13.563600,0.000000,11.320600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.538200,0.000000,11.305200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.345200,0.000000,11.010600>}
box{<0,0,-0.101600><0.352191,0.036000,0.101600> rotate<0,-56.766419,0> translate<13.345200,0.000000,11.010600> }
//GND silk screen
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<15.333450,0.000000,28.634663>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<15.240238,0.000000,28.727875>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<15.240238,0.000000,28.727875> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<15.240238,0.000000,28.727875>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<15.053813,0.000000,28.727875>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<15.053813,0.000000,28.727875> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<15.053813,0.000000,28.727875>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.960600,0.000000,28.634663>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<14.960600,0.000000,28.634663> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.960600,0.000000,28.634663>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.960600,0.000000,28.261813>}
box{<0,0,-0.025400><0.372850,0.036000,0.025400> rotate<0,-90.000000,0> translate<14.960600,0.000000,28.261813> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.960600,0.000000,28.261813>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<15.053813,0.000000,28.168600>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<14.960600,0.000000,28.261813> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<15.053813,0.000000,28.168600>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<15.240238,0.000000,28.168600>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<15.053813,0.000000,28.168600> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<15.240238,0.000000,28.168600>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<15.333450,0.000000,28.261813>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<15.240238,0.000000,28.168600> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<15.333450,0.000000,28.261813>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<15.333450,0.000000,28.448238>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,90.000000,0> translate<15.333450,0.000000,28.448238> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<15.333450,0.000000,28.448238>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<15.147025,0.000000,28.448238>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<15.147025,0.000000,28.448238> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<15.521909,0.000000,28.168600>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<15.521909,0.000000,28.727875>}
box{<0,0,-0.025400><0.559275,0.036000,0.025400> rotate<0,90.000000,0> translate<15.521909,0.000000,28.727875> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<15.521909,0.000000,28.727875>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<15.894759,0.000000,28.168600>}
box{<0,0,-0.025400><0.672165,0.036000,0.025400> rotate<0,56.306216,0> translate<15.521909,0.000000,28.727875> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<15.894759,0.000000,28.168600>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<15.894759,0.000000,28.727875>}
box{<0,0,-0.025400><0.559275,0.036000,0.025400> rotate<0,90.000000,0> translate<15.894759,0.000000,28.727875> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<16.083219,0.000000,28.727875>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<16.083219,0.000000,28.168600>}
box{<0,0,-0.025400><0.559275,0.036000,0.025400> rotate<0,-90.000000,0> translate<16.083219,0.000000,28.168600> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<16.083219,0.000000,28.168600>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<16.362856,0.000000,28.168600>}
box{<0,0,-0.025400><0.279637,0.036000,0.025400> rotate<0,0.000000,0> translate<16.083219,0.000000,28.168600> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<16.362856,0.000000,28.168600>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<16.456069,0.000000,28.261813>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<16.362856,0.000000,28.168600> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<16.456069,0.000000,28.261813>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<16.456069,0.000000,28.634663>}
box{<0,0,-0.025400><0.372850,0.036000,0.025400> rotate<0,90.000000,0> translate<16.456069,0.000000,28.634663> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<16.456069,0.000000,28.634663>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<16.362856,0.000000,28.727875>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<16.362856,0.000000,28.727875> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<16.362856,0.000000,28.727875>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<16.083219,0.000000,28.727875>}
box{<0,0,-0.025400><0.279637,0.036000,0.025400> rotate<0,0.000000,0> translate<16.083219,0.000000,28.727875> }
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
//L2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.313000,0.000000,26.665400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.803000,0.000000,26.665400>}
box{<0,0,-0.076200><0.490000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.313000,0.000000,26.665400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.803000,0.000000,26.217400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.313000,0.000000,26.217400>}
box{<0,0,-0.076200><0.490000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.313000,0.000000,26.217400> }
box{<-0.150000,0,-0.299950><0.150000,0.036000,0.299950> rotate<0,-0.000000,0> translate<19.154000,0.000000,26.436550>}
box{<-0.150000,0,-0.299950><0.150000,0.036000,0.299950> rotate<0,-0.000000,0> translate<19.966800,0.000000,26.436550>}
//L12 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.562200,0.000000,24.739400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.850200,0.000000,24.739400>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<23.850200,0.000000,24.739400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.562200,0.000000,25.590400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.850200,0.000000,25.590400>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<23.850200,0.000000,25.590400> }
box{<-0.250050,0,-0.475000><0.250050,0.036000,0.475000> rotate<0,-180.000000,0> translate<24.794350,0.000000,25.166300>}
box{<-0.250050,0,-0.475000><0.250050,0.036000,0.475000> rotate<0,-180.000000,0> translate<23.625950,0.000000,25.166300>}
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
//R1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.210000,0.000000,14.342000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.210000,0.000000,13.852000>}
box{<0,0,-0.076200><0.490000,0.036000,0.076200> rotate<0,-90.000000,0> translate<15.210000,0.000000,13.852000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.762000,0.000000,13.852000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.762000,0.000000,14.342000>}
box{<0,0,-0.076200><0.490000,0.036000,0.076200> rotate<0,90.000000,0> translate<14.762000,0.000000,14.342000> }
box{<-0.150000,0,-0.299950><0.150000,0.036000,0.299950> rotate<0,-270.000000,0> translate<14.981150,0.000000,14.501000>}
box{<-0.150000,0,-0.299950><0.150000,0.036000,0.299950> rotate<0,-270.000000,0> translate<14.981150,0.000000,13.688200>}
box{<-0.203200,0,-0.355600><0.203200,0.036000,0.355600> rotate<0,-270.000000,0> translate<14.986000,0.000000,14.097000>}
//R2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.159200,0.000000,11.446400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.159200,0.000000,10.956400>}
box{<0,0,-0.076200><0.490000,0.036000,0.076200> rotate<0,-90.000000,0> translate<15.159200,0.000000,10.956400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.711200,0.000000,10.956400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.711200,0.000000,11.446400>}
box{<0,0,-0.076200><0.490000,0.036000,0.076200> rotate<0,90.000000,0> translate<14.711200,0.000000,11.446400> }
box{<-0.150000,0,-0.299950><0.150000,0.036000,0.299950> rotate<0,-270.000000,0> translate<14.930350,0.000000,11.605400>}
box{<-0.150000,0,-0.299950><0.150000,0.036000,0.299950> rotate<0,-270.000000,0> translate<14.930350,0.000000,10.792600>}
box{<-0.203200,0,-0.355600><0.203200,0.036000,0.355600> rotate<0,-270.000000,0> translate<14.935200,0.000000,11.201400>}
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
//SCLK silk screen
//SDATA silk screen
//U$1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.475200,0.000000,17.576800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.475200,0.000000,18.008600>}
box{<0,0,-0.063500><0.431800,0.036000,0.063500> rotate<0,90.000000,0> translate<14.475200,0.000000,18.008600> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.475200,0.000000,23.114000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.475200,0.000000,23.571200>}
box{<0,0,-0.063500><0.457200,0.036000,0.063500> rotate<0,90.000000,0> translate<14.475200,0.000000,23.571200> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.475200,0.000000,23.571200>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.935200,0.000000,23.571200>}
box{<0,0,-0.063500><0.460000,0.036000,0.063500> rotate<0,0.000000,0> translate<14.475200,0.000000,23.571200> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.091400,0.000000,23.571200>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.472400,0.000000,23.571200>}
box{<0,0,-0.063500><0.381000,0.036000,0.063500> rotate<0,0.000000,0> translate<20.091400,0.000000,23.571200> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.424400,0.000000,18.015300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.033900,0.000000,17.624800>}
box{<0,0,-0.063500><0.552250,0.036000,0.063500> rotate<0,-44.997030,0> translate<20.033900,0.000000,17.624800> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.935200,0.000000,17.576800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.475200,0.000000,17.576800>}
box{<0,0,-0.063500><0.460000,0.036000,0.063500> rotate<0,0.000000,0> translate<14.475200,0.000000,17.576800> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.472400,0.000000,23.571200>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.472400,0.000000,23.190200>}
box{<0,0,-0.063500><0.381000,0.036000,0.063500> rotate<0,-90.000000,0> translate<20.472400,0.000000,23.190200> }
difference{
cylinder{<20.650200,0,17.399000><20.650200,0.036000,17.399000>0.350000 translate<0,0.000000,0>}
cylinder{<20.650200,-0.1,17.399000><20.650200,0.135000,17.399000>0.000000 translate<0,0.000000,0>}}
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
//VCC_JMP silk screen
//VDD silk screen
//Y1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.628400,0.000000,12.166800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.428400,0.000000,12.166800>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<23.428400,0.000000,12.166800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.528400,0.000000,13.466800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.528400,0.000000,14.066800>}
box{<0,0,-0.101600><0.600000,0.036000,0.101600> rotate<0,90.000000,0> translate<21.528400,0.000000,14.066800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.428400,0.000000,15.366800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.628400,0.000000,15.366800>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<23.428400,0.000000,15.366800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<26.528400,0.000000,13.466800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<26.528400,0.000000,14.066800>}
box{<0,0,-0.101600><0.600000,0.036000,0.101600> rotate<0,90.000000,0> translate<26.528400,0.000000,14.066800> }
//_SS silk screen
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<9.702800,0.000000,23.020788>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.075650,0.000000,23.020788>}
box{<0,0,-0.025400><0.372850,0.036000,0.025400> rotate<0,0.000000,0> translate<9.702800,0.000000,23.020788> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.636959,0.000000,23.580063>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.543747,0.000000,23.673275>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<10.543747,0.000000,23.673275> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.543747,0.000000,23.673275>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.357322,0.000000,23.673275>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<10.357322,0.000000,23.673275> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.357322,0.000000,23.673275>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.264109,0.000000,23.580063>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<10.264109,0.000000,23.580063> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.264109,0.000000,23.580063>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.264109,0.000000,23.486850>}
box{<0,0,-0.025400><0.093212,0.036000,0.025400> rotate<0,-90.000000,0> translate<10.264109,0.000000,23.486850> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.264109,0.000000,23.486850>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.357322,0.000000,23.393638>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<10.264109,0.000000,23.486850> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.357322,0.000000,23.393638>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.543747,0.000000,23.393638>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<10.357322,0.000000,23.393638> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.543747,0.000000,23.393638>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.636959,0.000000,23.300425>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<10.543747,0.000000,23.393638> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.636959,0.000000,23.300425>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.636959,0.000000,23.207213>}
box{<0,0,-0.025400><0.093212,0.036000,0.025400> rotate<0,-90.000000,0> translate<10.636959,0.000000,23.207213> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.636959,0.000000,23.207213>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.543747,0.000000,23.114000>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<10.543747,0.000000,23.114000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.543747,0.000000,23.114000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.357322,0.000000,23.114000>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<10.357322,0.000000,23.114000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.357322,0.000000,23.114000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.264109,0.000000,23.207213>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<10.264109,0.000000,23.207213> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.198269,0.000000,23.580063>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.105056,0.000000,23.673275>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<11.105056,0.000000,23.673275> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.105056,0.000000,23.673275>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.918631,0.000000,23.673275>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<10.918631,0.000000,23.673275> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.918631,0.000000,23.673275>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.825419,0.000000,23.580063>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<10.825419,0.000000,23.580063> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.825419,0.000000,23.580063>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.825419,0.000000,23.486850>}
box{<0,0,-0.025400><0.093212,0.036000,0.025400> rotate<0,-90.000000,0> translate<10.825419,0.000000,23.486850> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.825419,0.000000,23.486850>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.918631,0.000000,23.393638>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<10.825419,0.000000,23.486850> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.918631,0.000000,23.393638>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.105056,0.000000,23.393638>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<10.918631,0.000000,23.393638> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.105056,0.000000,23.393638>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.198269,0.000000,23.300425>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<11.105056,0.000000,23.393638> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.198269,0.000000,23.300425>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.198269,0.000000,23.207213>}
box{<0,0,-0.025400><0.093212,0.036000,0.025400> rotate<0,-90.000000,0> translate<11.198269,0.000000,23.207213> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.198269,0.000000,23.207213>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.105056,0.000000,23.114000>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<11.105056,0.000000,23.114000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.105056,0.000000,23.114000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.918631,0.000000,23.114000>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<10.918631,0.000000,23.114000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.918631,0.000000,23.114000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.825419,0.000000,23.207213>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<10.825419,0.000000,23.207213> }
texture{col_slk}
}
#end
translate<mac_x_ver,mac_y_ver,mac_z_ver>
rotate<mac_x_rot,mac_y_rot,mac_z_rot>
}//End union
#end

#if(use_file_as_inc=off)
object{  CYRF69103_BOB(-18.097500,0,-22.733000,pcb_rotate_x,pcb_rotate_y,pcb_rotate_z)
#if(pcb_upsidedown=on)
rotate pcb_rotdir*180
#end
}
#end


//Parts not found in 3dpack.dat or 3dusrpac.dat are:
//GND	SOLDER_PAD	SOLDER_PAD
//IRQ	SOLDER_PAD	SOLDER_PAD
//L12	22nH	0603
//MISO	SOLDER_PAD	SOLDER_PAD
//MOSI	SOLDER_PAD	SOLDER_PAD
//SCK	SOLDER_PAD	SOLDER_PAD
//SCLK	SOLDER_PAD	SOLDER_PAD
//SDATA	SOLDER_PAD	SOLDER_PAD
//VCC	SOLDER_PAD	SOLDER_PAD
//VCC_JMP	SOLDER_PAD	SOLDER_PAD
//VDD	SOLDER_PAD	SOLDER_PAD
//_SS	SOLDER_PAD	SOLDER_PAD
