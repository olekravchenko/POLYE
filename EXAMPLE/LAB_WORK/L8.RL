declare
  bandx f1; bandy f2;  sf p;
  pol1 fi; mcircl f3;
omega
  w= f1&f2&f3;
function
  u0=fi; u1=f2*p;
function u=sum(1,u0,u1);
program 
  gauspt(s1,fa,fb);
  sis(aa,bb);
  result(r1,fu);
  sigma=0.1;
  aa=ai(1);  bb=bi(1);
  fa(u1)=sigma*(u1(i,2)*u1(j,2)+u1(i,3)*u1(j,3));
  fb(u1)=-sigma*(u0(2)*u1(i,2)+u0(3)*u1(i,3));
  fu(u)=u;
value
  const=1,1,1,2,55,1,1;
  tabl=np,1,1,1,2, 1,1,1,0,0; p=1, -1,-1,1,1;
  s1=k, c1, 1,0,1,1, c1, 1,1,-1,1, c1, -1,1,-1,0;
  f1=0,1; f2=0,1;  fi=0,100,0; f3=xx,0,rr;
  r1=40, -1.001,-1.001,1.001,1.001; c1=xx,0,3;
  np=9; k=3; xx=(0,0.4,0.4); rr=(0.5,0.5,0.3);
end