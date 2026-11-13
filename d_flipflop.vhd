library ieee;
use ieee.std_logic_1164.all;

entity d_flipflop is
    port (d, clk : in std_logic; q, q_bar : out std_logic);
end entity;

architecture rtl of d_flipflop is
    signal stored : std_logic;
begin
    process (clk)
    begin
        if rising_edge(clk) then
            stored <= d;
        end if;
    end process;

    q     <= stored;
    q_bar <= not stored;
end architecture;
