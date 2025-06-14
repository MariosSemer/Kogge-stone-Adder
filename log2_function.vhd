library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package log2_pkg is
  function LOG2(n: natural) return natural;
end package;

package body log2_pkg is
  function LOG2(n: natural) return natural is
    variable i: natural := 0;
    variable v: natural := n - 1;
  begin
    while v > 0 loop
      v := v / 2;
      i := i + 1;
    end loop;
    return i;
  end;
end package body;
