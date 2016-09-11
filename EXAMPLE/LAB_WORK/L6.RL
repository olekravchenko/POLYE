Declare
  Bandx p1; Bandy p2;
  Mcircl p3; Sf p;
Omega
  w1=p3; w2=p1&p2;
  w=w1&w2;
Function
  om=w; u0=w1/(w1+w2);
  u1=om*p;
Function
  u=sum(1,u0,u1);
Program
  Poip(s1,fa,fb);
  Sis(a,b);
  Taba(s1,fu);
  Result(r1,fu);
  a=ai(1); b=bi(1);
  fa(u1)=u1(i)*u1(j);
  fb(u1)=u1(i)*(fr(x,y)-u0);
  fu(u)=u;
Fortran
      block data
      common /valx/ xx(8)
      common /valy/ yy(8)
      common /valf/ ff(8)
      common /valn/ nn
      data nn /8/
      data xx/-2.0,-1.5, 2.0, 1.5,2.0,1.5,-2.0,-1.5/
      data yy/-2.0,-1.5,-2.0,-1.5,2.0,1.5, 2.0, 1.5/
      data ff/-1.0,-1.0, 0.0, 0.0,1.0,1.0, 0.0, 0.0/
      end
end
Value
  Const=1,1,1,1,10,1,1;
  Tabl=n,1,1,1,1, 0,1,1,0,0;
  p1=0,3; p2=0,3; p3=0,0,1;
  p=1,pr; pr=-3,-3,3,3;
  s1=pr;
  r1=20,pr;
  n=3;
End