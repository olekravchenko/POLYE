declare
      bandx f1; bandy f2; mcircl f3; line f4, f5, f6;
      sf p;
      pol0 lam, alpha, tsr1, tsr2;
omega
      w1 = f1 & f2; >w1 = f4 & f5 & f6;
      w2 = f3;
      w = w1 & w2;
function
      om = w;
      h = alpha/lam;
      fi = (tsr1*w2 + w1*tsr2)/(w1+w2)*h;
      u0 = -om*fi;
      u1 = p + h*om*p - om*d1(om,p);
function
      u = sum(1,u0,u1);
program
      gaussa(s,fa1,fb1); ats;
      gil(s1,fa2,fb2);
      gic(s2,fa2,fb2);
      sis(a,b);
      result(r1,fu);

      fa1(u1) = u1(i,2)*u1(j,2) + u1(i,3)*u1(j,3);
      fa2(u1) =h*u1(i)*u1(j);
      fb1(u1) =-(u0(2)*u1(i,2) + u0(3)*u1(i,3));
      fb2(u1) =fi*u1(i);
      fu(u) = u;
      a = ai(1); b = bi(1);
value
      const = 1,1,1,3, 550 ,1,1;
      tabl = 11,1,1,2,2, 1,1,1,0,0;
      p = 1, pr;
      pr = -1,-1,1,1;
      f1 = 0, 1;
      f2 = f1; f3 = 0,0,.25;
      f4 = 1,1,-1,1;
      f5 = -1,1,-1,-1;
      f6 = -1,-1,1,1;

      s = 10, 2,2, 0,0,1,1, 1,1;
      s1 =6, 1,0, 1,1, 0,1;
      s2 =6, 0,0,.25, 0,90;
      r1 = 31, pr;
      lam = 1;
      alpha = 1;
      tsr1 = 100;
      tsr2 = 200;
end