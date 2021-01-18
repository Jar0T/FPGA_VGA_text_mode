--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:04:44 01/15/2021
-- Design Name:   
-- Module Name:   /home/jaroslaw/developement/FPGA/projects/VGA_text/VGA_top_TB.vhd
-- Project Name:  VGA_text
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: VGA_top
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
 
ENTITY VGA_top_TB IS
END VGA_top_TB;
 
ARCHITECTURE behavior OF VGA_top_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT VGA_top
    PORT(
         clk : IN  std_logic;
         switch : IN  std_logic_vector(7 downto 0);
         button : IN  std_logic;
         data : OUT  std_logic_vector(7 downto 0);
         hSync : OUT  std_logic;
         vSync : OUT  std_logic;
			rx : in STD_LOGIC;
			tx : out STD_LOGIC
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal switch : std_logic_vector(7 downto 0) := (others => '0');
   signal button : std_logic := '1';
	signal rx : std_logic := '1';

 	--Outputs
   signal data : std_logic_vector(7 downto 0);
   signal hSync : std_logic;
   signal vSync : std_logic;
	signal tx : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: VGA_top PORT MAP (
          clk => clk,
          switch => switch,
          button => button,
          data => data,
          hSync => hSync,
          vSync => vSync,
			 rx => rx,
			 tx => tx
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- insert stimulus here 
		wait for 10 ns;
		rx <= '0';
		wait for 25 * 130 * 16 ns;
		rx <= '1';
		wait for 25 * 130 * 16 * 4 ns;
		rx <= '0';
		wait for 25 * 130 * 16 * 4 ns;
		rx <= '1';
		wait for 25 * 130 * 16 ns;

      wait;
   end process;

END;
