declare
  line f1,f2;
  mbandy b1;  bandy b2; mcircl o1,o2;
  pol0 l,tv,th,alv,alh; pol1 f;  sf pl;
omega
  g1=o1&f1;
  g2=o2&f2!b1;
  g3=f&b2;
  w=g1&g2&g3;
function
  u1=pl;
function
  u=sum(1,0,u1);
program
  time;
  int(s1,fa); >matr; time;
  gic(s10,fa1,fb1);
  gil(s11,fa1,fb1);
  gic(s12,fa2,fb2);
  gil(s13,fa2,fb2);
  sis(aa,bb); koef; time;
  rezult(r1,fu);
  fa(u1)=(u1(i,2)*u1(j,2)+u1(i,3)*u1(j,3))*x;
  fa1(u1)=alh/l*u1(i)*u1(j)*x;
  fb1(u1)=alh*th/l*u1(i)*x;
  fa2(u1)=alv/l*u1(i)*u1(j)*x;
  fb2(u1)=alv*tv/l*u1(i)*x;
  aa=ai(1); bb=bi(1); fu(u)=u;
 value
  const=1,1,1,2,55,1,1;
  tabl=m,1,1,2,1, 0,1,1,0,0;
  f1=115,180,85,180;
  f2=65,50,115,50;
  b1=0,65; b2=0,115;
  o1=0,250,110; o2=0,50,65;
  f= 0,0,1;
  pl=1,pr; pr=-xm,0,xm,ym;
  xm=115; ym=180;
  r1=24,pr;
  s1=kx,ky,0,0,xm,ym;
  s10=k1,o2,0,90;    s11=k1,65,50,65,0,115,0;
  s12=k2,o1,270,315; s13=k2,115,0,f1;
  k1=3; k2=3;
  kx=30; ky=30;
  l=40; alh=1.5; alv=1; th=150; tv=1200;
  m=7;
end
