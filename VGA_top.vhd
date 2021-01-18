----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:40:24 01/15/2021 
-- Design Name: 
-- Module Name:    VGA_top - Behavioral 
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

entity VGA_top is
	Port (
		clk : in  STD_LOGIC;
		switch : in  STD_LOGIC_VECTOR (7 downto 0);
		button : in  STD_LOGIC;
		data : out  STD_LOGIC_VECTOR (7 downto 0);
		hSync : out  STD_LOGIC;
		vSync : out  STD_LOGIC;
		rx : in STD_LOGIC;
		tx : out STD_LOGIC := '1'
	);
end VGA_top;

architecture Behavioral of VGA_top is

	component VGA
	port (
		clk_40 : in  STD_LOGIC;
		VGA_data : out  STD_LOGIC_VECTOR (7 downto 0);
		VGA_hSync : out  STD_LOGIC;
		VGA_vSync : out  STD_LOGIC;
		color : in  STD_LOGIC_VECTOR (7 downto 0);
		data : in  STD_LOGIC_VECTOR (7 downto 0);
		column : out  STD_LOGIC_VECTOR (10 downto 0);
		row : out  STD_LOGIC_VECTOR (9 downto 0);
		linear : out  STD_LOGIC_VECTOR (12 downto 0)
	);
	end component;
	
	component DCM
	port (
		CLK_IN1 : in std_logic;
		CLK_OUT1 : out std_logic;
		CLK_OUT2 : out std_logic;
		CLK_OUT3 : out std_logic
	);
	end component;
	
	component RAM_2048x8
	port (
		clka : IN STD_LOGIC;
		addra : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
		douta : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
	end component;
	
	component RAM_8192x8
	port (
		clka : IN STD_LOGIC;
		wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
		addra : IN STD_LOGIC_VECTOR(12 DOWNTO 0);
		dina : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		clkb : IN STD_LOGIC;
		addrb : IN STD_LOGIC_VECTOR(12 DOWNTO 0);
		doutb : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
	end component;
	
	component UART
	port (
		clk_40 : in  STD_LOGIC;
		fifo_clk : in STD_LOGIC;
		rx : in  STD_LOGIC;
		rx_data : out  STD_LOGIC_VECTOR (7 downto 0);
		rx_read : in STD_LOGIC;
		rx_empty : out STD_LOGIC;
		rx_almost_empty : out STD_LOGIC;
		rx_valid : out STD_LOGIC
	);
	end component;
	
	signal s_clk_200, s_clk_100, s_clk_40 : STD_LOGIC := '0';
	signal s_data : STD_LOGIC_VECTOR (7 downto 0) := x"00";
	signal s_character : STD_LOGIC_VECTOR (7 downto 0) := x"00";
	signal s_column : STD_LOGIC_VECTOR (10 downto 0) := (others => '0');
	signal s_row : STD_LOGIC_VECTOR (9 downto 0) := (others => '0');
	signal s_linear : STD_LOGIC_VECTOR (12 downto 0) := (others => '0');
	signal s_color : STD_LOGIC_VECTOR (7 downto 0) := x"00";
	signal s_font_address : STD_LOGIC_VECTOR (10 downto 0) := (others => '0');
	signal s_rx_data : STD_LOGIC_VECTOR (7 downto 0) := x"00";
	signal s_rx_read, s_rx_empty, s_rx_almost_empty, s_rx_valid : STD_LOGIC := '0';
	signal s_char_data : STD_LOGIC_VECTOR (7 downto 0) := x"00";
	signal s_char_address : STD_LOGIC_VECTOR (12 downto 0) := (others => '0');
	signal s_char_we : STD_LOGIC := '0';
	signal s_char_address_unsigned : unsigned (12 downto 0) := (others => '0');

begin

	My_UART: UART
	port map (
		clk_40				=> s_clk_40,
		fifo_clk				=> s_clk_200,
		rx						=> rx,
		rx_data				=> s_rx_data,
		rx_read				=> s_rx_read,
		rx_empty				=> s_rx_empty,
		rx_almost_empty	=> s_rx_almost_empty,
		rx_valid				=> s_rx_valid
	);

	MyDCM: DCM
	port map (
		CLK_IN1	=> clk,
		CLK_OUT1 => s_clk_100,
		CLK_OUT2	=> s_clk_200,
		CLK_OUT3	=> s_clk_40
	);
	
	FontRAM: RAM_2048x8
	port map (
		clka	=> s_clk_200,
		addra	=> s_font_address,
		douta	=> s_data
	);
	
	CharRAM: RAM_8192x8
	port map (
		clka		=>	s_clk_200,
		wea(0)	=> s_char_we,
		addra		=> s_char_address,
		dina		=> s_char_data,
		clkb		=> s_clk_200,
		addrb		=> s_linear,
		doutb		=> s_character
	);
	
	MyVGA: VGA
	port map (
		clk_40		=> s_clk_40,
		VGA_data		=> data,
		VGA_hSync	=> hSync,
		VGA_vSync	=> vSync,
		color			=> s_color,
		data			=> s_data,
		column		=> s_column,
		row			=> s_row,
		linear		=> s_linear
	);
	
	register_background: process(s_clk_100)
	begin
		if rising_edge(s_clk_100) then
			if button = '0' then
				s_color <= not switch;
			else
				null;
			end if;
		end if;
	end process;
	
	process(s_clk_200)
	begin
		if falling_edge(s_clk_200) then
			if s_rx_valid = '1' then
				s_char_data <= s_rx_data;
				s_char_we <= '1';
			else
				s_char_we <= '0';
			end if;
		end if;
	end process;
	
	process(s_clk_200)
	begin
		if rising_edge(s_clk_200) then
			if s_rx_empty = '0' then
				s_rx_read <= '1';
			else
				s_rx_read <= '0';
			end if;
			
			if s_rx_almost_empty = '1' and s_rx_read = '1' then
				s_rx_read <= '0';
			else
				null;
			end if;
		end if;
	end process;
	
	process(s_clk_200)
	begin
		if falling_edge(s_clk_200) then
			if s_char_we = '1' then
				if s_char_address_unsigned = 7499 then
					s_char_address_unsigned <= (others => '0');
				else
					s_char_address_unsigned <= s_char_address_unsigned + 1;
				end if;
			else
				null;
			end if;
		end if;
	end process;
	
	s_font_address <= (s_character & s_row(2 downto 0));
	s_char_address <= STD_LOGIC_VECTOR(s_char_address_unsigned);

end Behavioral;

