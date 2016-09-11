Declare
  Pol1 s5; Line s1,s2;
  Mcircl s3; Circl s4;
Omega
  w=(s4 & (s3 ! s5)) & (s1 ! s2);
Program
  Result(r1,fw);
  Result(r1,fg); 
  Fw(w)=w;
  Fg(w)=sqrt(w(2)**2+w(3)**2);
Value
  Const=1,1,1,2,10,1,1;
  Tabl=1,1,1,1,1, 0,1,1,0,0;
  s1=0,0,1,1; s2=1,-1,0,0;
  s3=0,0,rm; s4=0,0,r; s5=-a,-1,0;
  a=.1;  r=1;  rm=.5;
  r1=20,-1,-1,1,1;
End