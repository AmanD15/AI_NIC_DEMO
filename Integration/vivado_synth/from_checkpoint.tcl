
open_checkpoint PostPlaceRouteCheckpoint.dcp
phys_opt_design -directive Explore
phys_opt_design
write_checkpoint -force PostPlaceRouteCheckpoint.dcp
report_timing_summary -file timing.rpt -nworst 10 -verbose
report_utilization -file utilization_post_place_and_route.rpt
report_utilization -hierarchical -file utilization_post_place_and_route.hierarchical.rpt
write_bitstream -force system.bit
write_debug_probes -force ./system.ltx
