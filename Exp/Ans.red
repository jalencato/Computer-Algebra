% primgcd_var.red 
% by weiyaodong
% 2018.9.5
% in "D:\Desktop\Computer Algebra\homework1\Primgcd.red";

procedure cof_list(poly, var);
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

procedure number_gcd(xs);
    if xs = {} then 1
    else if length xs = 1 then first xs
    else gcd(first xs, number_gcd(rest xs));

procedure vararg_gcd(xs, var);
    if xs = {} then 1
    else if length xs = 1 then first xs
    else primgcd_var(first xs, vararg_gcd(rest xs, var), var);

procedure my_cont(poly, var); 
    number_gcd(cof_list(poly, var));
    % if var = x then
    %     vararg_gcd(cof_list(poly, var), y)
    % else if var = y then
    %     vararg_gcd(cof_list(poly, var), z)
    % else
    %     number_gcd(cof_list(poly, var));

procedure pp(poly, var);
    if poly = 0 then 0
    else poly / my_cont(poly, var);

procedure prem(a, b, var); second pseudo_divide(a, b, var);

procedure primgcd_var(a, b, var);
    if b = 0 then a
    else primgcd_var(b, pp(prem(a, b, var), var), var);

procedure Primgcd(a, b); primgcd_var(a, b, x);


% HearnBasic.red
% by weiyaodong
% 2018.9.5
% in "D:\Desktop\Computer Algebra\homework1\HearnBasic.red";

procedure cof_list(poly, var);
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

procedure number_gcd(xs); 
begin scalar result, flag;
    if xs = {} then 
        return 1;

    flag := false;

    while not(xs = {}) do <<
        if first xs = 0 then <<
            xs := rest xs;
        >> else if not flag then <<
            flag := true;
            result := first xs; 
            xs := rest xs;
        >> else <<
            result := gcd(result, first xs);
            xs := rest xs;
        >>;
    >>;
    if not flag then 
        return 1;
    return result;
end;

procedure my_cont(poly, var); number_gcd(cof_list(poly, var));

procedure prem(a, b, var); 
begin;
    return second pseudo_divide(a, b, var);
end;

procedure div_list(poly, xs, var);
begin scalar result;
    if xs = {} then 
        return poly;

    if poly = 0 then
        return poly;

    while not(xs = {}) do <<
        if numberp first xs then <<
            if first xs = 0 then
                xs := rest xs
            else if abs first xs = 1 then
                xs := rest xs
            else if mod (my_cont(poly, var), abs first xs) = 0 then <<
                write "divide by: ", (first xs);
                poly := poly / (first xs);
            >> else 
                xs := rest xs;
        >> else <<
            if prem(my_cont(poly, var), first xs, var) = 0 then <<
                write "divide: ", (first xs);
                % poly := poly / (first xs);
                xs := rest xs;
            >> else 
                xs := rest xs;
        >>;
    >>;
    return poly;
end;

procedure heuclid(a, b, var);
begin scalar r, l;
    if b = 0 then <<
        return a;
    >>;
    r := prem(a, b, var);
    l := {lcof(a, var), lcof(b, var), lcof(r, var)};
    while not(r = 0) do <<
        a := b;
        b := r;
        write b;
        r := prem(a, b, var);
        r := div_list(r, l, var);
        l := lcof(r, var) . l;
    >>;
    write l;
    return b;
end;


A:=x^8+x^6-3x^4-3x^3+8x^2+2x-5;
B:=3x^6+5x^4-4x^2-9x-21;
C:=(y^2-y-1)*x^2-(y^2-2)*x + (2y^2+y+1);
D:=(y^2-y+1)*x^2-(y^2+2)*x + (y^2+y+2);

