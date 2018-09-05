% in "D:\Desktop\Computer Algebra\homework1\test.red";

procedure get_cof(poly);
    if numberp poly then {poly}
    else (lcof(poly, mainvar poly)) . (get_cof(poly - lcof(poly, mainvar poly) * ((mainvar poly) ^ deg(poly, mainvar poly))));

procedure vararg_gcd(xs);
    if xs = {} then 1
    else if length xs = 1 then first xs
    else gcd(first xs, vararg_gcd(rest xs));

procedure my_cont(poly); vararg_gcd get_cof poly;

procedure lco(poly); 
    if numberp poly then poly
    else lcof(poly, mainvar poly);

procedure pp(poly);
    if poly = 0 then 0
    else poly / my_cont(poly);

procedure prem(a, b); 
    second pseudo_divide(a, b);

procedure premgcd(a, b);
    if b = 0 then a
    else premgcd(b, pp(prem(a, b)));

procedure div_list(poly, xs);
    if xs = {} then poly
    else if (my_cont(poly) mod (first xs)) = 0 then div_list(poly / (first xs), rest xs)
    else div_list(poly, rest xs);

procedure heuclid_helper2(b, rem, xs);
    heuclid_helper(b, div_list(rem, xs), lco(rem) . xs);

procedure heuclid_helper(a, b, xs);
    if b = 0 then a
    else heuclid_helper2(b, prem(a, b), xs);

procedure heuclid(a, b);    
    heuclid_helper(a, b, {lco a, lco b});

procedure kth_prime(k);
    if k = 0 then 2
    else nextprime(kth_prime(k - 1));

remember kth_prime;

array prime_list(15);
prime_list(0) := 2;
prime_list(1) := 3;
prime_list(2) := 5;
prime_list(3) := 7;
prime_list(4) := 11;
prime_list(5) := 13;
prime_list(6) := 17;
prime_list(7) := 19;
prime_list(8) := 23;
prime_list(9) := 29;
prime_list(10) := 31;

% xs  := {0, 1, 0, 0, 0, , ,                              0, 1000000007}

procedure new_div_list_helper_1(poly, xs, index_);
    if first xs = 0 then new_div_list(poly, rest xs, index_ + 1)
    else if my_cont(poly) mod prime_list(index_) = 0 then 
        new_div_list(poly / prime_list(index_), (first(xs) - 1) . (rest xs), index_)
    else new_div_list(poly, rest xs, index_ + 1);

procedure new_div_list(poly, xs, index_);
    if index_ < 10 then 
        new_div_list_helper_1(poly, xs, index_)
    else if xs = {} then 
        poly
    else if my_cont(poly) mod (first xs) = 0 then 
        new_div_list(poly / first xs, rest xs, index_ + 1)
    else  
        poly;

        
procedure visit_list(xs, index_);
    if xs = {} then {}
    else if index_ = 0 then first xs
    else visit_list(rest xs, index_ - 1);

procedure set_apply_list(xs, index_, kernel);
    if xs = {} then {}
    else if index_ = 0 then (kernel(first xs) . rest xs)
    else (kernel (first xs)) . set_apply_list(rest xs, index_, kernel);

% new_num > 1
procedure new_list_cons_helper_2(xs, new_num, index_);
    % assert new_num >= prime_list(index_)
    if new_num mod prime_list(index_) = 0 then
        set_apply_list(new_list_cons_helper_2(), 0, add_one_kernel)
   
% new_num > 1
procedure new_list_cons_helper(xs, new_num, index_);
    if index_ < 10 then 
        new_list_cons_helper_2(xs, new_num, index_)
    else 
        new_num . xs;

procedure new_list_cons(xs, new_num);
