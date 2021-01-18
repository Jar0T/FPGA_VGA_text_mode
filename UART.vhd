----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:56:57 01/16/2021 
-- Design Name: 
-- Module Name:    UART - Behavioral 
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

entity UART is
	Port (
		clk_40 : in  STD_LOGIC;
		fifo_clk : in STD_LOGIC;
		rx : in  STD_LOGIC;
		rx_data : out  STD_LOGIC_VECTOR (7 downto 0);
		rx_read : in STD_LOGIC;
		rx_empty : out STD_LOGIC;
		rx_almost_empty : out STD_LOGIC;
		rx_valid : out STD_LOGIC
	);
end UART;

architecture Behavioral of UART is

	component FIFO_16x8
	port (
		wr_clk : in STD_LOGIC;
		rd_clk : in STD_LOGIC;
		din : in STD_LOGIC_VECTOR(7 downto 0);
		wr_en : in STD_LOGIC;
		rd_en : in STD_LOGIC;
		dout : out STD_LOGIC_VECTOR(7 downto 0);
		full : out STD_LOGIC;
		empty : out STD_LOGIC;
		almost_empty : out STD_LOGIC;
		valid : out STD_LOGIC
	);
	end component;

	signal s_divide_counter : unsigned (6 downto 0):= "0000000";
	signal s_divided_clk : STD_LOGIC := '0';
	signal s_state : unsigned (1 downto 0) := "00";
	signal s_data : STD_LOGIC_VECTOR (7 downto 0) := x"00";
	signal s_rx_counter : unsigned (3 downto 0) := x"0";
	signal s_bits_received : unsigned (2 downto 0) := "000";
	signal s_wr_fifo : STD_LOGIC := '0';

begin

	in_fifo: FIFO_16x8
	port map(
		wr_clk			=> s_divided_clk,
		rd_clk			=> fifo_clk,
		din(0)			=> s_data(7),
		din(1)			=> s_data(6),
		din(2)			=> s_data(5),
		din(3)			=> s_data(4),
		din(4)			=> s_data(3),
		din(5)			=> s_data(2),
		din(6)			=> s_data(1),
		din(7)			=> s_data(0),
		wr_en				=> s_wr_fifo,
		rd_en				=> rx_read,
		dout				=> rx_data,
		full				=> open,
		empty				=> rx_empty,
		almost_empty	=> rx_almost_empty,
		valid				=> rx_valid
	);

	divide_clk: process(clk_40)
	begin
		if falling_edge(clk_40) then
			if s_divide_counter = 64 then
				s_divide_counter <= "0000000";
				s_divided_clk <= not s_divided_clk;
			else
				s_divide_counter <= s_divide_counter + 1;
			end if;
		end if;
	end process;
	
	receive: process(s_divided_clk)
	begin
		if falling_edge(s_divided_clk) then
			case s_state is
				when "00" =>
					s_wr_fifo <= '0';
					if rx = '0' then
						if s_rx_counter = 7 then
							s_rx_counter <= x"0";
							s_state <= "01";
						else
							s_rx_counter <= s_rx_counter + 1;
						end if;
					else
						s_rx_counter <= x"0";
					end if;
					
				when "01" =>
					if s_rx_counter = 15 then
						s_rx_counter <= x"0";
						s_data <= s_data(6 downto 0) & rx;
						
						if s_bits_received = 7 then
							s_state <= "10";
							s_bits_received <= "000";
						else
							s_bits_received <= s_bits_received + 1;
						end if;
					else
						s_rx_counter <= s_rx_counter + 1;
					end if;
					
				when "10" =>
					if s_rx_counter = 15 then
						s_rx_counter <= x"0";
						s_state <= "00";
						s_wr_fifo <= '1';
					else
						s_rx_counter <= s_rx_counter + 1;
					end if;
					
				when others => s_state <= "00";
			end case;
		end if;
	end process;

end Behavioral;

