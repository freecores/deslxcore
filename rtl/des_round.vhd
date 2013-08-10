----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:52:29 02/20/2013 
-- Design Name: 
-- Module Name:    des_round - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity des_round is
	port(clk : in std_logic;
		  l_0 : in std_logic_vector(31 downto 0);
		  r_0 : in std_logic_vector(31 downto 0);
		  k_i : in std_logic_vector(47 downto 0);
		  l_1 : out std_logic_vector(31 downto 0);
		  r_1 : out std_logic_vector(31 downto 0));
end des_round;

architecture Behavioral of des_round is

	component f_fun is
		port(clk : in std_logic;
			  r_in : in std_logic_vector(31 downto 0);
			  k_in : in std_logic_vector(47 downto 0);
			  r_out : out std_logic_vector(31 downto 0));
	end component;

	component dsp_xor is
		port (clk     : in std_logic;
				op_1	  : in std_logic_vector(31 downto 0);
				op_2	  : in std_logic_vector(31 downto 0);
				op_3	  : out std_logic_vector(31 downto 0));
	end component;

	signal f_out_s : std_logic_vector(31 downto 0);

begin

	F_FUN_0 : f_fun port map (clk, r_0, k_i, f_out_s);

	l_1 <= r_0;
	r_1 <= l_0 xor f_out_s;

--	DSP_XOR_0 : dsp_xor port map (clk, l_0, f_out_s, r_1);

end Behavioral;

