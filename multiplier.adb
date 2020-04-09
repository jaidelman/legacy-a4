-- Joshua Aidelman
-- 1000139
-- jaidelma@uoguelph.ca

-- This program applies the Russian Peasant Multiplication algorithm
-- in C, both recursively and non recursively.
with Ada.Text_IO; use Ada.Text_IO;
with ada.strings.unbounded; use ada.strings.unbounded;
with ada.strings.unbounded.Text_IO; use ada.strings.unbounded.Text_IO;
with Ada.Calendar; use Ada.Calendar;

procedure multiplier is

  -- This function applies the algorithm resursively
  function multiplierRecursive(a : integer; b : integer) return integer is
  begin

    if a = 0 then
      return 0;
    elsif a = 1 then
      return b;
    elsif a > 1 and a mod 2 = 0 then
      return multiplierRecursive(a/2, b*2);
    elsif a > 1 and a mod 2 = 1 then
      return multiplierRecursive(a/2, b*2) + b;
    end if;

    return 0;
  end multiplierRecursive;

  -- This function applies the algorithm non resursively
  function multiplierNonRecursive(a : integer; b : integer) return integer is
    outA, outB, c : integer;
  begin
    outA := a;
    outB := b;
    c := 0;

    while(outA > 1) loop
      if outA mod 2 = 1 then
        c := c + outB;
      end if;
      outA := outA/2;
      outB := outB*2;
    end loop;

    return c+outB;
  end multiplierNonRecursive;

  -- Main Function
  a,b,c : integer; -- To store outputs
  aInput, bInput : unbounded_string; -- To store inputs
  start_time, finish_time : Time; -- To store timing
  total_time : Duration;
begin

  -- Get input
  Put("Please enter your first number: ");
  Get_Line(aInput);
  Put("Please enter your second number: ");
  Get_Line(bInput);

  -- Assign input to integer variables
  a := Integer'Value(To_String(aInput));
  b := Integer'Value(To_String(bInput));

  -- Call recursive function, time and print result
  start_time := Clock;
  c := multiplierRecursive(a,b);
  finish_time := Clock;
  total_time := finish_time - start_time;

  Put("Recursively: ");
  Put(Integer'Image(a)); Put(" * "); Put(Integer'Image(b)); Put(" = "); Put(Integer'Image(c)); New_Line;
  Put("Time Elapsed: "); Put(Duration'Image(total_time)); Put(" seconds "); New_Line;

  -- Call non recursive function, time and print result
  start_time := Clock;
  c := multiplierNonRecursive(a,b);
  finish_time := Clock;
  total_time := finish_time - start_time;
  
  Put("Non Recursively: ");
  Put(Integer'Image(a)); Put(" * "); Put(Integer'Image(b)); Put(" = "); Put(Integer'Image(c)); New_Line;
  Put("Time Elapsed: "); Put(Duration'Image(total_time)); Put(" seconds "); New_Line;

end multiplier;
