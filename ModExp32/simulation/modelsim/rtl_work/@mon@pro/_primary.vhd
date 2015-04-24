library verilog;
use verilog.vl_types.all;
entity MonPro is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        start           : in     vl_logic_vector(0 downto 0);
        inp             : in     vl_logic_vector(31 downto 0);
        state           : out    vl_logic_vector(4 downto 0);
        outp            : out    vl_logic_vector(31 downto 0)
    );
end MonPro;
