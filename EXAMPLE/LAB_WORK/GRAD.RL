Declare
  Pol1 s5; Line s1,s2;
  Mcircl s3; Circl s4;
Omega
  w=(s4 & (s3 ! s5)) & (s1 ! s2);
Program
  Rezult(r2,fg);
  Resv(r2,fx,fy);
  fg(w)=sqrt(w(2)**2+w(3)**2);
  fx(w)=w(2); fy(w)=w(3);
Value
  Const=1,1,1,2,10,1,1;
  Tabl=1,1,1,1,1, 1,1,1,0,0;
  s1=0,0,1,1; s2=2,-1,0,0;
  s3=0,0,rm; s4=0,0,r; s5=-a,-1,0;
  a=.1;  r=1;  rm=.5;
  r2=20,20,-1,-1,1,1;
End