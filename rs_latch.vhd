library ieee;
use ieee.std_logic_1164.all;

entity rs_latch is
    port (s, r : in std_logic; q, q_bar : out std_logic);
end entity;

architecture rtl of rs_latch is
    signal stored, stored_bar : std_logic;
begin
    -- Cross-coupled NOR gates preserve both outputs in the forbidden case.
    stored     <= r nor stored_bar;
    stored_bar <= s nor stored;
    q          <= stored;
    q_bar      <= stored_bar;
end architecture;
