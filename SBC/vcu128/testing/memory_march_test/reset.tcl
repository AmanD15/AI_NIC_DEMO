## open hardware manager
open_hw
## connect to serever
connect_hw_server
## Open a connection to a hardware target on the hardware server
open_hw_target

## set vio probes file
set_property PROBES.FILE {../../vivado_synth/*.ltx} [get_hw_devices xcvu37p_0]              
set_property FULL_PROBES.FILE {../../vivado_synth/*.ltx} [get_hw_devices xcvu37p_0]         

# refresh device
refresh_hw_device [lindex [get_hw_devices xcvu37p_0] 0]


# reset_sync = '1'
set_property OUTPUT_VALUE 1 [get_hw_probes reset_proc -of_objects [get_hw_vios -of_objects [get_hw_devices xcvu37p_0] -filter {CELL_NAME=~"virtual_reset"}]]
commit_hw_vio [get_hw_probes {reset_proc} -of_objects [get_hw_vios -of_objects [get_hw_devices xcvu37p_0] -filter {CELL_NAME=~"virtual_reset"}]]            

# reset_sync = '0'
set_property OUTPUT_VALUE 0 [get_hw_probes reset_proc -of_objects [get_hw_vios -of_objects [get_hw_devices xcvu37p_0] -filter {CELL_NAME=~"virtual_reset"}]]
commit_hw_vio [get_hw_probes {reset_proc} -of_objects [get_hw_vios -of_objects [get_hw_devices xcvu37p_0] -filter {CELL_NAME=~"virtual_reset"}]]            
