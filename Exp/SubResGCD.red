% Subresgcd.red
% by JalenCato
% in "D:\DeskTop\Computer Algebra\Exp\SubResGCD.red";

procedure cofList(poly, var);
begin scalar res, flag, highCof;
   res := {};
   flag := true;
   while not(deg(poly, var) = 0) do <<
       highCof := lcof(poly, var);
       res := highCof . res;
       poly := poly - highCof * (var ^ (deg(poly, var)));
   >>;
   if not(poly = 0) then
       res := poly . res;
   return reverse res;
end;

procedure varGCD(xlist);
begin scalar result, flag;
   if xlist = {} then
       return 1;

   flag := false;

   while not(xlist = {}) do <<
       if first xlist = 0 then <<
           xlist := rest xlist;
       >> else if not flag then <<
           flag := true;
           result := first xlist;
           xlist := rest xlist;
       >> else <<
           result := Subresgcd(result, first xlist);
           xlist := rest xlist;
       >>;
   >>;
   if not flag then
       return 1;
   return result;
end;

procedure myCont(poly, var);
   varGCD(cofList(poly, var));

procedure pp(poly, var);
   if poly = 0 then 0
   else poly / myCont(poly, var);

procedure prem(a, b, var); second pseudo_divide(a, b, var);

procedure SREuclidVar(f, g, var);
begin scalar a1, a2, beta, phi, delta1, delta2, tmp;
  
   if deg(f, var) < deg(g, var) then <<
       a1 := pp(g, var);
       a2 := pp(f, var);
   >> else <<
       a1 := pp(f, var);
       a2 := pp(g, var);
   >>;

   delta1 := deg(a1, var) - deg(a2, var);
   beta := (-1)^(delta1 + 1);
   phi := -1;

   while not(a2 = 0) do <<
       a1 := prem(a1, a2, var) / beta;
       delta2 := deg(a2, var) - deg(a1, var);
      
       tmp := a1;
       a1 := a2;
       a2 := tmp;

       tmp := delta1 ;
       delta1 := delta2;
       delta2 := tmp;

       phi := (-lcof(a1, var)) ^ delta2 * phi ^ (1 - delta2);
       beta := - lcof(a1, var) * phi ^ delta1;
   >>;

   return pp(a1, var);
end;

procedure numericGCD(a, b);
   if b = 0 then a
   else if b < 0 then numericGCD(-b, a mod -b)
   else numericGCD(b, a mod b);

procedure Subresgcd(a, b);
begin scalar ca, cb, cg, pg, g, var;
   if b = 0 then
       return a;
   if a = 0 then
       return b;
   if numberp(a) and numberp(b) then
       return numericGCD(a, b);
   if mainvar(a) = 0 then
       var := mainvar b
   else
       var := mainvar a;
   ca := myCont(a, var);
   cb := myCont(b, var);
   cg := Subresgcd(ca, cb);
   pg := SREuclidVar(a, b, var);
   g := cg * pp(pg, var);
   return g;
end;


A:=x^8+x^6-3x^4-3x^3+8x^2+2x-5;
B:=3x^6+5x^4-4x^2-9x-21;
C:=(y^2-y-1)*x^2-(y^2-2)*x + (2y^2+y+1);
D:=(y^2-y+1)*x^2-(y^2+2)*x + (y^2+y+2);
