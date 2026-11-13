library ieee;
use ieee.std_logic_1164.all;

entity d_latch is
    port (d, en : in std_logic; q, q_bar : out std_logic);
end entity;

architecture rtl of d_latch is
    signal set_n, reset_n : std_logic;
    signal stored, stored_bar : std_logic;
begin
    set_n      <= d nand en;
    reset_n    <= (not d) nand en;
    stored     <= set_n nand stored_bar;
    stored_bar <= reset_n nand stored;

    q     <= stored;
    q_bar <= stored_bar;
end architecture;
