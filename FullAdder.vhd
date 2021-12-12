library ieee;
use ieee.std_logic_1164.all;

entity FullAdder is
	port( 	X, Y , Cin: in bit;
		Cout, Sum : out bit);
end FullAdder;

architecture behave of FullAdder is
	begin
		Sum <= X xor Y xor Cin after 10 ns;
		Cout <= (X and Y) or (X and Cin) or (Y and Cin) after 10 ns;
end behave;

