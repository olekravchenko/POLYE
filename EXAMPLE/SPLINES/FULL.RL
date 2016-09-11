declare
      bandx f1; bandy f2; mcircl f3; line f4, f5, f6;
      spli p, p1;
      pol0 lam, alpha, tsr1, tsr2;
omega
      w1 = f1 && f2; >w1 = f4 && f5 && f6;
      w2 = f3;
      w = w1 && w2;
function
      om = w;
      h = alpha/lam;
      fi = (tsr1*w2 + w1*tsr2)/(w1+w2)*h;
      u0 = -om*fi;
      uu1 = p + h*om*p - om*d1(om,p);
      uu2 = om*om*p1;
      u1 = (uu1)#(uu2*0);
      u2 = (uu1*0)#uu2;
function
      uu = u2;
      uk1 = sum(1,u0,uu1);
      uk2 = sum(2,0,uu2);
      u = uk1 + uk2;
program
      inspli(s,fa1,fb1); ats;
      konspl(s,fa2,fb2);
      pro;
>      filex(r2,fu); time;
      result(r1,fu);
>      result(r1,fu1);

      fa1(u2) = u1(i,2)*u1(j,2) + u1(i,3)*u1(j,3) +
                u2(i,2)*u2(j,2) + u2(i,3)*u2(j,3) +
                u1(i,2)*u2(j,2) + u1(i,3)*u2(j,3) +
                u2(i,2)*u1(j,2) + u2(i,3)*u1(j,3);
      fa2(u2) = h*u1(i)*u1(j) + h*u2(i)*u2(j) + h*u1(i)*u2(j)+
                h*u2(i)*u1(j);
      fb1(u2) =-(u0(2)*u1(i,2) + u0(3)*u1(i,3))-
                (u0(2)*u2(i,2) + u0(3)*u2(i,3));
      fb2(u2) = fi*u1(i) + fi*u2(i);
      fu(u) = u;
      fu1(u) = uk2;
value
      const = 2,1,1,3, 55 ,1,1;
      tabl = np,nx,ny,0,0, np,nx,ny,0,0, 2,1,2,0,0;
      np = 4; nx = 20;  ny = 20;
      p = 1, pr;
      p1=2, pr;
      pr = -1.1,-1.1,1.1,1.1;
      f1 = 0, 1;
      f2 = f1; f3 = 0,0,.25;
      f4 = 1,1,-1,1;
      f5 = -1,1,-1,-1;
      f6 = -1,-1,1,1;

      s = 4, pr;
      r1 = 31, pr;
      r2 = 31, 31, pr, 0;
      lam = 1;
      alpha = 1;
      tsr1 = 100;
      tsr2 = 200;
end