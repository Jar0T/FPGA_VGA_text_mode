
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name VGA_text -dir "/home/jaroslaw/developement/FPGA/projects/VGA_text/planAhead_run_2" -part xc6slx9csg324-2
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "/home/jaroslaw/developement/FPGA/projects/VGA_text/VGA_top.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {/home/jaroslaw/developement/FPGA/projects/VGA_text} {ipcore_dir} }
add_files [list {ipcore_dir/FIFO_16x8.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/RAM_8192x8.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/RAM_2048x8.ncf}] -fileset [get_property constrset [current_run]]
set_property target_constrs_file "VGA_top.ucf" [current_fileset -constrset]
add_files [list {VGA_top.ucf}] -fileset [get_property constrset [current_run]]
link_design
