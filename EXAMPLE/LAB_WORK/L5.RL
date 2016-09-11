Declare
  Bandy f1; Bandx f2;
  Mcircl f3; Circl f4;
Omega
  w=((f1&f2)!f4)&f3+0.15;
Function
  f=w;
Program
  Gauss(s1,fi1); Gausp(s2,fi1); Pint;
  Gil(s3,fi2); Gic(s4,fi2); Pint;
  fi1(f)=-x*x*(f(4)+f(6))-2*x*f(2);
  fi2(f)=x*x;
Value
  Const=1,1,1,3,10,1,1;
  Tabl=1,1,1,1,1, 0,1,1,0,0;
  f1=0,2; f2=1,1; f3=0,0,1; f4=0,0,2;
  s1=k1, 0,0,1,1, 1,0,2,1, 0,1,1,2, 1,1,2,2;
  s2=k1, f4,270,360;
  s3=k2, 2,0, 2,2, 0,2;
  s4=k2, f4,270,360, f3,0,90, f3,270,360;
  k1=4; k2=3;
End