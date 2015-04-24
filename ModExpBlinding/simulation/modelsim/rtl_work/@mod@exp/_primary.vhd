library verilog;
use verilog.vl_types.all;
entity ModExp is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        startInput      : in     vl_logic;
        startCompute    : in     vl_logic;
        getResult       : in     vl_logic;
        inp             : in     vl_logic_vector(127 downto 0);
        stateModExp     : out    vl_logic_vector(4 downto 0);
        stateModExpSub  : out    vl_logic_vector(2 downto 0);
        outp            : out    vl_logic_vector(127 downto 0)
    );
end ModExp;
