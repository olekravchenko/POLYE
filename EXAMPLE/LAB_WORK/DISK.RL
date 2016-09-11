Declare
  mcircl f1;
  bandx f2;
  line f3,f4;
  pol1 a1;
  sf p1;
omega
  g1=f3;
  g2=f4;
  g3=f1&f2;
  o1=g1&g2;
  om=g3;
function
  fi=a1;
  o2=om;
  w1=o1*p1;
  o=o1*o2/(o1+o2);
  u0=fi-o*d1(fi,o2);
  u1=w1-o*d1(w1,o2);
function
  u=sum(1,u0,u1);
program
  gil(s10,fb1);
  gic(s11,fb1);
  gausp(s1,fa,fb);
  sis(a,b);
  ats;
  rezult(r1,fu);
  a=ai(1);
  b=bi(1);
  fa(u1)=u1(i,2)*u1(j,2)+u1(i,3)*u1(j,3);
  fb(u1)=-u0(2)*u1(i,2)-u0(3)*u1(i,3);
  fb1(u1)=-u1(i,1)*(u0(2)*o2(2)+u0(3)*o2(3));
  fu(u)=u;
value
  const=1,1,1,3,70,1,1;
  tabl=m,2,1,2,2,0,1,1,0,0;
  m=4;
  p1=1,pr;
  pr=-1,-1,1,1;
  f1=0,0,0.5;
  f2=0,1;
  f3=1,0,1,1;
  f4=-1,0,-1,1;
  a1=0,1,0;
  s1=k, 0,0,1.5,0,45, 0,0,1.5,45,135, 0,0,1.5,135,180;
  s10=k, -1,0, -1,1, 1,1, 1,0;
  s11=k,f1,0,180;
  r1=10,pr;
  k=1;
end
