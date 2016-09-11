Declare
  Bandy f1; Bandx f2;
  Mcircl f3; Circl f4;
  Sf p;
Omega
  w=((f1&f2)!f4)&f3;
Function
  u1=w*p;
Function
  u=sum(1,0,u1);
Program
  Gauss(s1,fa,fb); Gausp(s2,fa,fb);
  Sis(a,b); 
  Result(r1,fu);
  fa(u1)=u1(i,2)*u1(j,2)+u1(i,3)*u1(j,3);
  fb(u1)=2*u1(i);
  a=ai(1); b=bi(1);
  fu(u)=u;
Value
  Const=1,1,1,2,55,1,1;
  Tabl=n,1,1,2,1,0,1,1,0,0;
  p=1,pr; pr=-2,-2,2,2;
  f1=0,2; f2=1,1; f3=0,0,1; f4=0,0,2;
  s1=k1, 0,0,1,1, 1,0,2,1, 0,1,1,2, 1,1,2,2;
  s2=k1, f4,270,360;
  r1=20,pr;
  k1=3; n=7;
End