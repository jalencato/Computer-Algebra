off echo$
Write "Testing PrimGCD";
PrimMarks:=0$
%  Tests in 1 variable
A:=x^8+x^6-3x^4-3x^3+8x^2+2x-5$
B:=3x^6+5x^4-4x^2-9x-21$
Mine:=1$
Student:=Primgcd(A,B)$
If Student=Mine or Student=-Mine
   Then <<Write "Student Passed Test 1";PrimMarks:=PrimMarks+1$>>
   else Write "Student Failed Test 1: ",Student$
Mine:=x-1$
Student:= Primgcd(A*(x-1),B*(x-1))$
If Student=Mine or Student=-Mine
   Then <<Write "Student Passed Test 2"; PrimMarks:=PrimMarks+1$>>
   else Write "Student Failed Test 2: ",Student;
Mine:=x-1$
Student:= Primgcd(x^8*sub(x=1/x,A)*(x-1),x^6*sub(x=1/x,B)*(x-1))$
If Student=Mine or Student=-Mine
   Then <<Write "Student Passed Test 3"; PrimMarks:=PrimMarks+1$>>
   else Write "Student Failed Test 3: ",Student;
%  Tests in 2 variables
C:=(y^2-y-1)*x^2-(y^2-2)*x + (2y^2+y+1)$
D:=(y^2-y+1)*x^2-(y^2+2)*x + (y^2+y+2)$
Mine:=1$
Student:=Primgcd(C,D)$
If Student=Mine or Student=-Mine
   Then <<Write "Student Passed Test 4";PrimMarks:=PrimMarks+1$>>
   else Write "Student Failed Test 4: ",Student$
Mine:=x+y+1$
Student:= Primgcd(C*Mine,D*Mine)$
If Student=Mine or Student=-Mine
   Then <<Write "Student Passed Test 5"; PrimMarks:=PrimMarks+1$>>
   else Write "Student Failed Test 5: ",Student;
Mine:=C$
Student:= Primgcd(C*C,C*D)$
If Student=Mine or Student=-Mine
   Then <<Write "Student Passed Test 6"; PrimMarks:=PrimMarks+1$>>
   else Write "Student Failed Test 6: ",Student;
%  Tests in more variables
F:=(y^2*z-y-1)*x^2-(y^2-2)*x + (2y^2+y+1)$
G:=(y^2*z-y+1)*x^2-(y^2+2)*x + (y^2+y+2)$
Mine:=1$
Student:=Primgcd(F,G)$
If Student=Mine or Student=-Mine
   Then <<Write "Student Passed Test 7";PrimMarks:=PrimMarks+1$>>
   else Write "Student Failed Test 7: ",Student$
Mine:=F$
Student:= Primgcd(F*F,F*G)$
If Student=Mine or Student=-Mine
   Then <<Write "Student Passed Test 8"; PrimMarks:=PrimMarks+1$>>
   else Write "Student Failed Test 8: ",Student;
Mine:=F+w*x^3$
Student:= Primgcd(Mine*F,Mine*G)$
If Student=Mine or Student=-Mine
   Then <<Write "Student Passed Test 9"; PrimMarks:=PrimMarks+1$>>
   else Write "Student Failed Test 9: ",Student;
% And a trick with no 'x'
FF:=sub(x=z,F)$
GG:=sub(x=z,G)$
Mine:=FF$
Student:= Primgcd(FF*FF,FF*GG)$
If Student=Mine or Student=-Mine
   Then <<Write "Student Passed Test 10"; PrimMarks:=PrimMarks+1$>>
   else Write "Student Failed Test 10: ",Student;
Write "PrimMarks=",PrimMarks;
;end;
