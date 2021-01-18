--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:44:36 01/14/2021
-- Design Name:   
-- Module Name:   /home/jaroslaw/developement/FPGA/projects/VGA_text/VGA_TB.vhd
-- Project Name:  VGA_text
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: VGA
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY VGA_TB IS
END VGA_TB;
 
ARCHITECTURE behavior OF VGA_TB IS

	-- Component Declaration for the Unit Under Test (UUT)
	COMPONENT VGA
	PORT(
		clk_40 : IN  std_logic;
		VGA_data : OUT  std_logic_vector(7 downto 0);
		VGA_hSync : OUT  std_logic;
		VGA_vSync : OUT  std_logic;
		color : IN  std_logic_vector(7 downto 0);
		data : IN  std_logic_vector(7 downto 0);
		column : OUT  std_logic_vector(10 downto 0);
		row : OUT  std_logic_vector(9 downto 0);
		linear : OUT  std_logic_vector(12 downto 0)
		);
	END COMPONENT;
    

   --Inputs
   signal clk_40 : std_logic := '0';
   signal color : std_logic_vector(7 downto 0) := (others => '0');
   signal data : std_logic_vector(7 downto 0) := x"F0";

 	--Outputs
   signal VGA_data : std_logic_vector(7 downto 0);
   signal VGA_hSync : std_logic;
   signal VGA_vSync : std_logic;
   signal column : std_logic_vector(10 downto 0);
   signal row : std_logic_vector(9 downto 0);
   signal linear : std_logic_vector(12 downto 0);

   -- Clock period definitions
   constant clk_40_period : time := 25 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: VGA PORT MAP (
          clk_40 => clk_40,
          VGA_data => VGA_data,
          VGA_hSync => VGA_hSync,
          VGA_vSync => VGA_vSync,
          color => color,
          data => data,
          column => column,
          row => row,
          linear => linear
        );

   -- Clock process definitions
   clk_40_process :process
   begin
		clk_40 <= '0';
		wait for clk_40_period/2;
		clk_40 <= '1';
		wait for clk_40_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- insert stimulus here 

      wait;
   end process;

END;
