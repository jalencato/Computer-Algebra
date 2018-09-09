% primGCDVar.red
% by JalenCato
% in "D:\DeskTop\Computer Algebra\Exp\PrimGCD.red";

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
   flag := false;

   if xlist = {} then
       return 1;

   while not(xlist = {}) do <<
       if first xlist = 0 then <<
           xlist := rest xlist;
       >> else if not flag then <<
           flag := true;
           result := first xlist;
           xlist := rest xlist;
       >> else <<
           result := PrimGCD(result, first xlist);
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

procedure primGCDVar(a, b, var);
begin scalar r;
   if b = 0 then
       return a;
   r := pp(prem(a, b, var), var);
   while not(r = 0) do <<
       a := b;
       b := r;
       r := pp(prem(a, b, var), var);
   >>;
   return b;
end;

procedure numericGCD(a, b);
   if b = 0 then a
   else if b < 0 then numericGCD(-b, a mod -b)
   else numericGCD(b, a mod b);

procedure PrimGCD(a, b);
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
   cg := PrimGCD(ca, cb);
   pg := primGCDVar(a, b, var);
   g := cg * pp(pg, var);

   return g;
end;
