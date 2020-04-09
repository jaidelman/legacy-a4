-- Joshua Aidelman
-- 1000139
-- jaidelma@uoguelph.ca

with Ada.Text_IO; use Ada.Text_IO;
with ada.strings.unbounded; use ada.strings.unbounded;
with ada.strings.unbounded.Text_IO; use ada.strings.unbounded.Text_IO;

procedure multiplier is

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

  -- Main
  a,b,c : integer;
  aInput, bInput : unbounded_string;
begin
  Put("Please enter your first number: ");
  Get_Line(aInput);
  Put("Please enter your second number: ");
  Get_Line(bInput);

  a := Integer'Value(To_String(aInput));
  b := Integer'Value(To_String(bInput));

  c := multiplierRecursive(a,b);
  Put("Recursively: ");
  Put(Integer'Image(a)); Put(" * "); Put(Integer'Image(b)); Put(" = "); Put(Integer'Image(c)); New_Line;

  c := multiplierNonRecursive(a,b);
  Put("Non Recursively: ");
  Put(Integer'Image(a)); Put(" * "); Put(Integer'Image(b)); Put(" = "); Put(Integer'Image(c)); New_Line;
end multiplier;
