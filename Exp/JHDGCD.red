% JHD.red
% by JalenCato
% in "D:\DeskTop\Computer Algebra\Exp\JHDGCD.red";

procedure divPoly(poly, xlist, var);
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
           if JHDGCD(myCont(poly, var), first xlist) = (first xlist) then <<
               poly := poly / (first xlist);
               xlist := rest xlist;
           >> else
               xlist := rest xlist;
       >>;
   >>;
   return poly;
end;

procedure degAppend(xlist, poly, var);
begin scalar flag, res, res, ff;
   flag := true;
   res := xlist;
   tmp := xlist;
   res := {};
   ff := false;
   while (not(xlist = {})) do <<
       if poly = first xlist then
           flag := false;
       xlist := rest xlist;
   >>;

   if flag = false then
       return res;

   if(flag = true) then 
      while (not(tmp = {}) and (not ff)) do <<
        if deg(poly, var) > first tmp then <<
            res := res . poly . tmp;
            ff := true;
        >>
        else <<
            res := res . poly;
            tmp := rest tmp;
        >>;
      >>;
   return poly . res;
end;

procedure addPoly(xlist, poly, var);
begin;
   poly := divPoly(poly, xlist, var);
   degAppend(xlist, poly, var);
   return poly . xlist;
end;

procedure cofList(poly, var);
begin scalar res, flag, high_cof;
   res := {};
   flag := true;
   while not(deg(poly, var) = 0) do <<
       high_cof := lcof(poly, var);
       res := high_cof . res;
       poly := poly - high_cof * (var ^ (deg(poly, var)));
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
           result := JHDGCD(result, first xlist);
           xlist := rest xlist;
       >>;
   >>;
   if not flag then
       return 1;
   return result;
end;

procedure myCont(poly, var); varGCD(cofList(poly, var));

procedure prem(a, b, var); second pseudo_divide(a, b, var);

procedure numberGCD(xlist);
   if xlist = {} then 1
   else if length xlist = 1 then first xlist
   else gcd(first xlist, numberGCD(rest xlist));

procedure myCont(poly, var);
   numberGCD(cofList(poly, var));

procedure pp(poly, var);
   if poly = 0 then 0
   else poly / myCont(poly, var);

procedure heuclidVar(a, b, var);
begin scalar r, l;
   if b = 0 then <<
       return a;
   >>;
   r := prem(a, b, var);
   l := addPoly({}, lcof(a, var), var);
   l := addPoly(l, lcof(b, var), var);
   l := addPoly(l, lcof(r, var), var);

   while not(r = 0) do <<
       a := b;
       b := r;
       r := prem(a, b, var);
       r := divPoly(r, l, var);
       r := pp(r, var);
       l := addPoly(l, lcof(r, var), var);
   >>;
   return b;
end;

procedure numericGCD(a, b);
   if b = 0 then a
   else if b < 0 then numericGCD(-b, a mod -b)
   else numericGCD(b, a mod b);

procedure JHDGCD(a, b);
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
   cg := JHDGCD(ca, cb);
   pg := heuclidVar(a, b, var);
   g := cg * pp(pg, var);
   return g;
end;

A:=x^8+x^6-3x^4-3x^3+8x^2+2x-5;
B:=3x^6+5x^4-4x^2-9x-21;
C:=(y^2-y-1)*x^2-(y^2-2)*x + (2y^2+y+1);
D:=(y^2-y+1)*x^2-(y^2+2)*x + (y^2+y+2);
