library ieee;
use ieee.std_logic_1164.all;

entity GenClock is
	Generic(time_period : integer range 1 to 4);
	port(clk: in std_logic;
		clock: out std_logic);
end GenClock;

architecture behavior of GenClock is
signal C: std_logic := '0';

	begin
	clock <= C;

	process(clk)
	variable cnt: integer range 0 to 2000000000 := 0;
	begin
	if cnt = 25000000 and  time_period = 1 then
		C <= not clk after 500 ms;
		cnt := 0;
	elsif cnt = 50000000 and  time_period = 2 then
		C <= not clk after 1000 ms;
		cnt := 0;
	elsif cnt = 100000000 and  time_period = 3 then
		C <= not clk after 2000 ms;
		cnt := 0;
	elsif cnt = 200000000 and  time_period = 4 then
		C <= not clk after 4000 ms;
		cnt := 0;
	end if;
	end process;
end behavior;