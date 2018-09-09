% HearnBasic.red
% by JalenCato
% in "D:\DeskTop\Computer Algebra\Exp\HearnBasic.red";

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
           result := HearnBasicGCD(result, first xlist);
           xlist := rest xlist;
       >>;
   >>;
   if not flag then
       return 1;
   return result;
end;

procedure myCont(poly, var); varGCD(cofList(poly, var));

procedure prem(a, b, var); second pseudo_divide(a, b, var);

procedure pp(poly, var);
   if poly = 0 then 0
   else poly / myCont(poly, var);

procedure dividePoly(poly, xlist, var);
begin scalar result;
   if xlist = {} then
       return poly;

   if poly = 0 then
       return poly;

   while not(xlist = {}) do <<
       if numberp first xlist then <<
           if first xlist = 0 then
               xlist := rest xlist
           else if abs first xlist = 1 then
               xlist := rest xlist
           else if mod (myCont(poly, var), abs first xlist) = 0 then <<
               poly := poly / (first xlist);
           >> else
               xlist := rest xlist;
       >> else <<
           if HearnBasicGCD(myCont(poly, var), first xlist) = (first xlist) then <<
               poly := poly / (first xlist);
               xlist := rest xlist;
           >> else
               xlist := rest xlist;
       >>;
   >>;
   return poly;
end;

procedure numericGCD(a, b);
   if b = 0 then a
   else if b < 0 then numericGCD(-b, a mod -b)
   else numericGCD(b, a mod b);

procedure HearnBasicGCD(a, b);
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
   cg := HearnBasicGCD(ca, cb);
   pg := heuclidVar(a, b, var);
   g := cg * pp(pg, var);
   return g;
end;

procedure heuclidVar(a, b, var);
begin scalar r, l;
   if b = 0 then <<
       return a;
   >>;
   r := prem(a, b, var);
   l := {lcof(a, var), lcof(b, var), lcof(r, var)};
   while not(r = 0) do <<
       a := b;
       b := r;
       r := prem(a, b, var);
       r := dividePoly(r, l, var);
       l := lcof(r, var) . l;
   >>;
   return b;
end;



A:=x^8+x^6-3x^4-3x^3+8x^2+2x-5;
B:=3x^6+5x^4-4x^2-9x-21;
C:=(y^2-y-1)*x^2-(y^2-2)*x + (2y^2+y+1);
D:=(y^2-y+1)*x^2-(y^2+2)*x + (y^2+y+2);
