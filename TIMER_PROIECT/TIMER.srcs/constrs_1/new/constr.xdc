## This file is a general .xdc for the Basys3 rev B board
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

# Clock signal
set_property PACKAGE_PIN W5 [get_ports CLK]							
	set_property IOSTANDARD LVCMOS33 [get_ports CLK]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports CLK]

# LEDs
set_property PACKAGE_PIN U16 [get_ports {SUNET}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {SUNET}]

	
#7 segment display
set_property PACKAGE_PIN W7 [get_ports {cat[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {cat[0]}]
set_property PACKAGE_PIN W6 [get_ports {cat[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {cat[1]}]
set_property PACKAGE_PIN U8 [get_ports {cat[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {cat[2]}]
set_property PACKAGE_PIN V8 [get_ports {cat[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {cat[3]}]
set_property PACKAGE_PIN U5 [get_ports {cat[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {cat[4]}]
set_property PACKAGE_PIN V5 [get_ports {cat[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {cat[5]}]
set_property PACKAGE_PIN U7 [get_ports {cat[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {cat[6]}]

#set_property PACKAGE_PIN V7 [get_ports dp]							
#	set_property IOSTANDARD LVCMOS33 [get_ports dp]

set_property PACKAGE_PIN U2 [get_ports {an[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {an[0]}]
set_property PACKAGE_PIN U4 [get_ports {an[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {an[1]}]
set_property PACKAGE_PIN V4 [get_ports {an[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {an[2]}]
set_property PACKAGE_PIN W4 [get_ports {an[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {an[3]}]


##Buttons
set_property PACKAGE_PIN U18 [get_ports SS_BUTON]						
	set_property IOSTANDARD LVCMOS33 [get_ports SS_BUTON]
#set_property PACKAGE_PIN T18 [get_ports btnU]						
	#set_property IOSTANDARD LVCMOS33 [get_ports btnU]
set_property PACKAGE_PIN W19 [get_ports BUTON_MIN]						
	set_property IOSTANDARD LVCMOS33 [get_ports BUTON_MIN]
set_property PACKAGE_PIN T17 [get_ports BUTON_SEC]						
	set_property IOSTANDARD LVCMOS33 [get_ports BUTON_SEC]
#set_property PACKAGE_PIN U17 [get_ports btnD]						
	#set_property IOSTANDARD LVCMOS33 [get_ports btnD]
 
