# VGA text mode for Mimas V2 FPGA developement board

## Table of contents
* [General info](#general-info)
* [Technologies](#technologies)
* [Current state of project](#current-state-of-project)
* [Future work](#future-work)
* [Sources](#sources)

## General info
Goal of the project is to develop system, that can display 8x8 px characters on 800x600 px VGA display @60Hz. By this you can get 75 lines of 100 characters each. Characters can be sent to FPGA by UART interface.
Project is developed using Xilinx ISE 14.7 for Mimas V2 board, but can be easly adapted to another FPGA.

## Technologies
Project is using several technologies:
* Xilinx Ise core generator
* FPGA Block RAM
* FIFO Generator
* VGA
* UART

## Current state of project
System consists of two modules:
* VGA
* UART
And is using FPGA's block memory for storage.

### VGA
Module is using two counters to calculate current screen position. Counters are used to generate VGA sync signals according to VGA timings. From counters linear character memory address is being calculated. If column counter is less than 800 and row counter is less than 600 then
linear_address = column_counter + (row_counter * 100)
else linear address is assigned with value 7500.
```
s_linear_address <= 	
	s_column_counter(9 downto 3) + (s_row_counter(9 downto 3) * 100)
	when s_column_counter < 800 and s_row_counter < 600
	else "01110101001100";
```
Because 7500 characters can be displayed on screen, and there are 256 different characters, character RAM size is 8192x8. Address for font ROM is calculated by joining currently displayed character number and 3 LSB of row_counter. This is because monitor is displaying image line by line, so in first place first row of all 100 characters in line will be displayed, than second row, than third row and so on, upon eighth row. After displaying all characters in first line, characters in second line will be displayed in exactly the same way. One row of a font consists of 8 pixels and is stored in font ROM as one 8-bit value, where each bit corresponds to single pixel. Having 256 characters, 8 rows each, gives us memory size of 2048x8 bits. Because you access all 8 pixels of characters at a time, there is simple case statement in the code, which choses single bit depending on 3 LSB of column counter.
```
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
```
Color signal here is inpit of VGA module. It is used for setting background color. If currently displayed font pixel is off, color is displayed, if pixel is on, bitwise negation of color is displayed. This sets font color to opposite of background color if you look at color wheel.

### UART
UART module is very simple. It consists of shift register for received data and 16 bytes input FIFO.
Communication is divided into three phases:
* Idle/waiting for start
* Reading data
* Waiting for stop
No parity bits are used. Baud rate is set to 19200, but rx line is sampled 16 times faster.
While in idle state, controller is waiting for rx line to go low. When this happens, counter starts counting. If counter gets to 7, it resets to 0 and state is changed to reading data. Else counter is stopped and set back to 0.
In read data phase, counter is always counting from 0 to 15. When it gets to 15, state of rx line is shifted into input shift register and another 3-bit counter is incremented. This counter resembles number of bits received. After reading 8 bits, phase is changed to waiting for stop bit.
While waiting for stop bit, counter counting from 0 to 15. After reaching 15, it is being reset and phase is changed back to idle. At the same time data is being written into FIFO. fifo_we signal goes high and it goes low next clock cycle.

Data read from FIFO can be written into character RAM. Since generated RAM is Simple dual-ported, data can be written to it at the same time, as it is being read by VGA module. After writing every character, special character_address_counter is incremented, so next character will be written in vext memory cell. After reaching 7499, which is maximum number of characters - 1 (count starts from 0), counter is being reset back to 0, and characters are overwritten.

## Future work
At this point special characters are displayed as space, and characters can only be displayed next to each other. To go to next line, remaining space in current line needs to be filled with spaces. To change it, special characters need to be interpreted, and desirable action needs to be performed.
Memory is currently in top module. It should be put in its own module.

## Sources
During project following sources were used:
* [Graphic LCD panel](https://www.fpga4fun.com/GraphicLCDpanel.html)
* [Spartan-6 FPGA Block RAM Resources User Guide](https://www.xilinx.com/support/documentation/user_guides/ug383.pdf), pages 11-18
* [LogiCORE IP FIFO Generator v9.3 Product Guide](https://www.xilinx.com/support/documentation/ip_documentation/fifo_generator/v9_3/pg057-fifo-generator.pdf)
