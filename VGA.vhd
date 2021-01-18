----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:13:54 01/14/2021 
-- Design Name: 
-- Module Name:    VGA - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity VGA is
	Port (
		clk_40 : in  STD_LOGIC;
		VGA_data : out  STD_LOGIC_VECTOR (7 downto 0) := x"00";
		VGA_hSync : out  STD_LOGIC := '0';
		VGA_vSync : out  STD_LOGIC := '0';
		color : in  STD_LOGIC_VECTOR (7 downto 0);
		data : in  STD_LOGIC_VECTOR (7 downto 0);
		column : out  STD_LOGIC_VECTOR (10 downto 0);
		row : out  STD_LOGIC_VECTOR (9 downto 0);
		linear : out  STD_LOGIC_VECTOR (12 downto 0)
	);
end VGA;

architecture Behavioral of VGA is

signal s_column_counter : unsigned (10 downto 0) := (others => '0');
signal s_row_counter : unsigned (9 downto 0) := (others => '0');
signal s_linear_address : unsigned (13 downto 0) := (others => '0');

begin

	--calculate row and column on screen
	counter: process(clk_40)
	begin
		if falling_edge(clk_40) then
			s_column_counter <= s_column_counter + 1;
			
			if s_column_counter = 1055 then
				s_column_counter <= (others => '0');
				s_row_counter <= s_row_counter + 1;
				
				if s_row_counter = 627 then
					s_row_counter <= (others => '0');
				end if;
			end if;
		end if;
	end process;
	
	--drive hSync
	hSync: process(clk_40)
	begin
		if rising_edge(clk_40) then
			if s_column_counter = 840 then
				VGA_hSync <= '1';
			elsif s_column_counter = 968 then
				VGA_hSync <= '0';
			else
				null;
			end if;
		end if;
	end process;
	
	--drive vSync
	vSync: process(clk_40)
	begin
		if rising_edge(clk_40) then
			if s_row_counter = 601 then
				VGA_vSync <= '1';
			elsif s_row_counter = 605 then
				VGA_vSync <= '0';
			else
				null;
			end if;
		end if;
	end process;
	
	--display data
	display: process(clk_40)
	begin
		if rising_edge(clk_40) then
			if s_column_counter < 800 and s_row_counter < 600 then
				case s_column_counter(2 downto 0) is
					when "000" => if data(7) = '0' then VGA_data <= color; else VGA_data <= not color; end if;
					when "001" => if data(6) = '0' then VGA_data <= color; else VGA_data <= not color; end if;
					when "010" => if data(5) = '0' then VGA_data <= color; else VGA_data <= not color; end if;
					when "011" => if data(4) = '0' then VGA_data <= color; else VGA_data <= not color; end if;
					when "100" => if data(3) = '0' then VGA_data <= color; else VGA_data <= not color; end if;
					when "101" => if data(2) = '0' then VGA_data <= color; else VGA_data <= not color; end if;
					when "110" => if data(1) = '0' then VGA_data <= color; else VGA_data <= not color; end if;
					when "111" => if data(0) = '0' then VGA_data <= color; else VGA_data <= not color; end if;
					when others => null;
				end case;
			else
				VGA_data <= x"00";
			end if;
		end if;
	end process;
	
	--calculate linear address of character RAM
	s_linear_address <= 	
		s_column_counter(9 downto 3) + (s_row_counter(9 downto 3) * 100) when  
			s_column_counter < 800 and s_row_counter < 600 else
		"01110101001100";

	column <= STD_LOGIC_VECTOR(s_column_counter);
	row <= STD_LOGIC_VECTOR(s_row_counter);
	linear <= STD_LOGIC_VECTOR(s_linear_address(12 downto 0));

end Behavioral;

