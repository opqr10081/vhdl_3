library ieee;
use ieee.std_logic_1164.all;

entity jk_flipflop is
    port (j, k, clk : in std_logic; q, q_bar : out std_logic);
end entity;

architecture rtl of jk_flipflop is
    signal stored : std_logic;
begin
    process (clk)
    begin
        if rising_edge(clk) then
            -- The consensus term gives a known Set result even if Q is U.
            stored <= (j and (not stored))
                   or ((not k) and stored)
                   or (j and (not k));
        end if;
    end process;

    q     <= stored;
    q_bar <= not stored;
end architecture;
