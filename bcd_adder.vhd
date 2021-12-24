library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.std_logic_unsigned.all;
entity zeyang_xu_bcd_adder is
	Port(A: in std_logic_vector(3 downto 0);
	B:		  in std_logic_vector(3 downto 0);
	S:		  out std_logic_vector(3 downto 0);
	C_out : out std_logic);
end zeyang_xu_bcd_adder;
architecture BehaviorModel of zeyang_xu_bcd_adder is
signal first_sum: std_logic_vector(4 downto 0);
signal carry: std_logic;
signal temp: std_logic_vector(4 downto 0);
Begin
first_sum <= std_logic_vector(unsigned('0' & A) + unsigned(B));
carry <= '1' WHEN first_sum >9 ELSE '0';
temp <= first_sum WHEN (carry = '0') ELSE first_sum + 6;
S <= temp(3 downto 0);
C_out <= temp(4);
End BehaviorModel;

