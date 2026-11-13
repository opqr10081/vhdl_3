library ieee;
use ieee.std_logic_1164.all;

entity d_ff_async_set_clear is
    port (d, clk, set, clr : in std_logic; q, q_bar : out std_logic);
end entity;

architecture rtl of d_ff_async_set_clear is
    signal master_set_n, master_reset_n : std_logic;
    signal slave_set_n, slave_reset_n : std_logic;
    signal master_q, master_q_bar : std_logic;
    signal slave_q, slave_q_bar : std_logic;
begin
    -- Both stages accept the same asynchronous override. Clear forces
    -- the set input inactive and the reset input active on both latches.
    master_set_n   <= ((d nand (not clk)) and (not set)) or clr;
    master_reset_n <= (((not d) nand (not clk)) or set) and (not clr);
    master_q       <= master_set_n nand master_q_bar;
    master_q_bar   <= master_reset_n nand master_q;

    slave_set_n   <= ((master_q nand clk) and (not set)) or clr;
    slave_reset_n <= (((not master_q) nand clk) or set) and (not clr);
    slave_q       <= slave_set_n nand slave_q_bar;
    slave_q_bar   <= slave_reset_n nand slave_q;

    q     <= slave_q;
    q_bar <= slave_q_bar;
end architecture;
