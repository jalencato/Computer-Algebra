% in "D:\DeskTop\Computer Algebra\Exp\Test.red";

procedure testPrim(a,b,tt);
begin scalar i;
   i := 0;
   while (i < tt) do <<
       primgcd(a, b);
       i := i + 1;
   >>;
   return primgcd(a, b);
end;

procedure testbasic(a,b,tt);
begin scalar i;
   i := 0;
   while (i < tt) do <<
       HearnBasicGCD(a, b);
       i := i + 1;
   >>;
   return HearnBasicGCD(a, b);
end;

procedure testFull(a,b,tt);
begin scalar i;
   i := 0;
   while (i < tt) do <<
       HearnFullGCD(a, b);
       i := i + 1;
   >>;
   return HearnFullGCD(a, b);
end;


procedure testSubRes(a, b, tt);
begin scalar i;
   i := 0;
   while (i < tt) do <<
       SubResGCD(a, b);
       i := i + 1;
   >>;
   return SubResGCD(a, b);
end;

procedure testJHD(a, b, tt);
begin scalar i;
   i := 0;
   while (i < tt) do <<
       JHDGCD(a, b);
       i := i + 1;
   >>;
   return JHDGCD(a, b);
end;

F := (x+y-1)*(x+y+z+2);
G := (x+y+1)*(y^2-3*((x)^2)*y-1);

H := x^2+y^2+z^2+1;
J := H*(x^2+y^2+z^2-2);
K := H*(x^3+y^3+z^3+2);

L := x^2*y^2+x^2+y^2+z^2+1;
M := L*(x*y + x + y + z + 2)^2;