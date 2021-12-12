library ieee;
use ieee.std_logic_1164.all;

entity FullSubtractor is
    port(     X, Y , Bin: in std_logic;
        Bout, Diff : out std_logic);
end FullSubtractor;

architecture behave of FullSubtractor is
    begin
        Diff <= X xor Y xor Bin after 10 ns;
        Bout <= ((not X) and Y) or ((not X) and Bin) or (Y and Bin) after 10 ns;
end behave;
