library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.std_logic_unsigned.all;
entity zeyang_xu_wrapper is
	Port(	A,B  : in std_logic_vector (3 downto 0);
			decoded_A : out std_logic_vector (6 downto 0);
			decoded_B : out std_logic_vector (6 downto 0);
			decoded_AplusB: out std_logic_vector (13 downto 0));
end zeyang_xu_wrapper;
architecture BehaviorModel of zeyang_xu_wrapper is
component seven_segment_decoder_zeyang
port(	code			 : in std_logic_vector(3 downto 0);
			segments_out : out std_logic_vector(6 downto 0));
end component;
component zeyang_xu_bcd_adder
	Port(A: in std_logic_vector(3 downto 0);
	B:		  in std_logic_vector(3 downto 0);
	S:		  out std_logic_vector(3 downto 0);
	C_out : out std_logic);
end component;


signal carry: std_logic_vector(3 downto 0);

signal carry_temp: std_logic;
signal result: std_logic_vector(3 downto 0);
signal decode_carry: std_logic_vector(6 downto 0);
signal decode_result: std_logic_vector(6 downto 0);
begin
adder: zeyang_xu_bcd_adder port map (A => A, B=>B, S=>result, C_out=> carry_temp);
carry <= "000"&carry_temp;
decoderA: seven_segment_decoder_zeyang port map(code => A, segments_out => decoded_A);
decoderB: seven_segment_decoder_zeyang port map(code => B, segments_out => decoded_B);
decoder_carry:  seven_segment_decoder_zeyang port map(code => carry, segments_out =>decode_carry);
decoder_result: seven_segment_decoder_zeyang port map(code => result, segments_out =>decode_result);
decoded_AplusB <= std_logic_vector(unsigned(decode_carry & decode_result));
end BehaviorModel;