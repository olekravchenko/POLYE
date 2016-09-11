Declare
  Pol1 f4;
  Mcircl f3; Circl f1,f2;
Omega
  w=((f1 & f4) ! f2) & f3;
Program
  Rezult(r1,fw); 
  Fw(w)=w;
Value
  Const=1,1,1,2,10,1,1;
  Tabl=1,1,1,1,1, 1,1,1,0,0;
  f1=0,2,2; f2=0,3,1;
  f3=0,1,1; f4=0,1,0;
  r1=20,-1,0,2,4;
End