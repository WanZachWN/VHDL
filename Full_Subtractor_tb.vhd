library ieee;
use ieee.std_logic_1164.all;

entity FullSubtractor_tb is
end FullSubtractor_tb;

architecture test of FullSubtractor_tb is
	component Subtractor6 is
	port(A,B : in std_logic_vector(5 downto 0);
  		Bi : in std_logic;
		D : out std_logic_vector(5 downto 0);
 		Bo : out std_logic);
	end component;

	constant N: integer := 5;
	type slv_arr is array(1 to N) of std_logic_vector(5 downto 0);
	type stdl_arr is array(1 to N) of std_logic;
	constant a_array: slv_arr := ("000101", "111111", "101101", "010110", "111111"); --(5, 63/3F, 45/2D, 22/16, 63/3F)
	constant b_array: slv_arr := ( "000011", "100011", "101000", "111011", "100011");--(3, 35/17, 40/28, 59/3B, 35/17)
	constant bin_array: stdl_arr := ('0', '0', '1', '0', '1');
	constant diff_arr: slv_arr := ("000010", "011100", "000100", "011011", "011011");--(2, 28/1C, 4, 27/1B, 27/1B)
	constant bout_arr: stdl_arr := ('1', '0', '0', '1', '1');

	signal a, b, diff : std_logic_vector(5 downto 0);
	signal bin, bout : std_logic;

	begin
		process
		begin
			for i in 1 to N loop
				a <= a_array(i);
				b <= b_array(i);
				bin <= bin_array(i);
				--wait for 40 ns;
				report integer'image(i); assert(diff = diff_arr(i) and bout = bout_arr(i))
				report "Wrong answer when subtracting iteration " & integer'image(i)
				severity error;		
			end loop;
			report "Reach end test";
		end process;
		sub1: Subtractor6 port map(a, b, bin, diff, bout);
end test;