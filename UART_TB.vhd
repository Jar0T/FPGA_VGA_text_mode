--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:24:30 01/16/2021
-- Design Name:   
-- Module Name:   /home/jaroslaw/developement/FPGA/projects/VGA_text/UART_TB.vhd
-- Project Name:  VGA_text
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: UART
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
 
ENTITY UART_TB IS
END UART_TB;
 
ARCHITECTURE behavior OF UART_TB IS

	-- Component Declaration for the Unit Under Test (UUT)
	COMPONENT UART
	PORT(
		clk_40 : in  STD_LOGIC;
		fifo_clk : in STD_LOGIC;
		rx : in  STD_LOGIC;
		rx_data : out  STD_LOGIC_VECTOR (7 downto 0);
		rx_read : in STD_LOGIC;
		rx_empty : out STD_LOGIC;
		rx_almost_empty : out STD_LOGIC;
		rx_valid : out STD_LOGIC
	);
	END COMPONENT;
    

   --Inputs
   signal clk_40, fifo_clk : std_logic := '0';
   signal rx : std_logic := '1';
	signal rx_read : std_logic := '0';

 	--Outputs
   signal rx_data : std_logic_vector(7 downto 0);
	signal rx_empty, rx_almost_empty, rx_valid : std_logic;

   -- Clock period definitions
   constant clk_40_period : time := 25 ns;
	constant fifo_clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: UART PORT MAP (
          clk_40 => clk_40,
			 fifo_clk => fifo_clk,
			 rx => rx,
			 rx_data => rx_data,
			 rx_read => rx_read,
			 rx_empty => rx_empty,
			 rx_almost_empty => rx_almost_empty,
			 rx_valid => rx_valid
        );

   -- Clock process definitions
   clk_40_process :process
   begin
		clk_40 <= '0';
		wait for clk_40_period/2;
		clk_40 <= '1';
		wait for clk_40_period/2;
   end process;
	
	fifo_clk_process :process
   begin
		fifo_clk <= '0';
		wait for fifo_clk_period/2;
		fifo_clk <= '1';
		wait for fifo_clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- insert stimulus here 
		
		wait for 25 ns;
		rx <= '0';
		wait for 25 * 130 * 16 ns;
		rx <= '1';
		wait for 25 * 130 * 16 * 4 ns;
		rx <= '0';
		wait for 25 * 130 * 16 * 4 ns;
		rx <= '1';
		wait for 25 * 130 * 16 ns;
		wait for 20 ns;
		rx_read <= '1';
		wait for 10 ns;
		rx_read <= '0';

      wait;
   end process;

END;
