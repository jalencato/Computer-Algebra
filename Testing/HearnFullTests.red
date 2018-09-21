off echo$
Write "Testing HearnFullGCD";
HearnFullMarks:=0$
%  Tests in 1 variable
A:=x^8+x^6-3x^4-3x^3+8x^2+2x-5$
B:=3x^6+5x^4-4x^2-9x-21$
Mine:=1$
Student:=HearnFullgcd(A,B)$
If Student=Mine or Student=-Mine
   Then <<Write "Student Passed Test 1";HearnFullMarks:=HearnFullMarks+1$>>
   else Write "Student Failed Test 1: ",Student$
Mine:=x-1$
Student:= HearnFullgcd(A*(x-1),B*(x-1))$
If Student=Mine or Student=-Mine
   Then <<Write "Student Passed Test 2"; HearnFullMarks:=HearnFullMarks+1$>>
   else Write "Student Failed Test 2: ",Student;
Mine:=x-1$
Student:= HearnFullgcd(x^8*sub(x=1/x,A)*(x-1),x^6*sub(x=1/x,B)*(x-1))$
If Student=Mine or Student=-Mine
   Then <<Write "Student Passed Test 3"; HearnFullMarks:=HearnFullMarks+1$>>
   else Write "Student Failed Test 3: ",Student;
%  Tests in 2 variables
C:=(y^2-y-1)*x^2-(y^2-2)*x + (2y^2+y+1)$
D:=(y^2-y+1)*x^2-(y^2+2)*x + (y^2+y+2)$
Mine:=1$
Student:=HearnFullgcd(C,D)$
If Student=Mine or Student=-Mine
   Then <<Write "Student Passed Test 4";HearnFullMarks:=HearnFullMarks+1$>>
   else Write "Student Failed Test 4: ",Student$
Mine:=x+y+1$
Student:= HearnFullgcd(C*Mine,D*Mine)$
If Student=Mine or Student=-Mine
   Then <<Write "Student Passed Test 5"; HearnFullMarks:=HearnFullMarks+1$>>
   else Write "Student Failed Test 5: ",Student;
Mine:=C$
Student:= HearnFullgcd(C*C,C*D)$
If Student=Mine or Student=-Mine
   Then <<Write "Student Passed Test 6"; HearnFullMarks:=HearnFullMarks+1$>>
   else Write "Student Failed Test 6: ",Student;
%  Tests in more variables
F:=(y^2*z-y-1)*x^2-(y^2-2)*x + (2y^2+y+1)$
G:=(y^2*z-y+1)*x^2-(y^2+2)*x + (y^2+y+2)$
Mine:=1$
Student:=HearnFullgcd(F,G)$
If Student=Mine or Student=-Mine
   Then <<Write "Student Passed Test 7";HearnFullMarks:=HearnFullMarks+1$>>
   else Write "Student Failed Test 7: ",Student$
Mine:=F$
Student:= HearnFullgcd(F*F,F*G)$
If Student=Mine or Student=-Mine
   Then <<Write "Student Passed Test 8"; HearnFullMarks:=HearnFullMarks+1$>>
   else Write "Student Failed Test 8: ",Student;
Mine:=F+w*x^3$
Student:= HearnFullgcd(Mine*F,Mine*G)$
If Student=Mine or Student=-Mine
   Then <<Write "Student Passed Test 9"; HearnFullMarks:=HearnFullMarks+1$>>
   else Write "Student Failed Test 9: ",Student;
% And a trick with no 'x'
FF:=sub(x=z,F)$
GG:=sub(x=z,G)$
Mine:=FF$
Student:= HearnFullgcd(FF*FF,FF*GG)$
If Student=Mine or Student=-Mine
   Then <<Write "Student Passed Test 10"; HearnFullMarks:=HearnFullMarks+1$>>
   else Write "Student Failed Test 10: ",Student;
Write "HearnFullMarks=",HearnFullMarks;
;end;
