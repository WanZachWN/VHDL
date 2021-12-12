library ieee;
use ieee.std_logic_1164.all;

entity FSM is
	port(CLK, X, Y: in bit;
		Z: out bit);
end FSM;

architecture behave of FSM is
signal state: integer range 0 to 3 := 0;
begin
	process(CLK)
	begin
		if CLK'event and CLK = '1' then
		case state is
		when 0 =>
			if X = '0' and Y = '0' then state <= 0;
			elsif X = '0' and Y = '1' then state <= 1;
			elsif X = '1' and Y = '0' then state <= 2;
			elsif X = '1' and Y = '1' then state <= 1;
		when 1 =>
			if X = '0' and Y = '0' then state <= 1;
			elsif X = '0' and Y = '1' then state <= 0;
			elsif X = '1' and Y = '0' then state <= 2;
			elsif X = '1' and Y = '1' then state <= 1;
		when 2 =>
			if X = '0' and Y = '0' then state <= 2;
			elsif X = '0' and Y = '1' then state <= 3;
			elsif X = '1' and Y = '0' then state <= 3;
			elsif X = '1' and Y = '1' then state <= 1;
		when 3 =>
			if X = '0' and Y = '0' then state <= 3;
			elsif X = '0' and Y = '1' then state <= 0;
			elsif X = '1' and Y = '0' then state <= 1;
			elsif X = '1' and Y = '1' then state <= 0;
		end case;
	end if;
end process;
Z <= '1' when (state = 2) or (state = 3)
	else '0';
end behave;
