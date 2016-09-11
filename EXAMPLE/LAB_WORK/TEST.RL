declare
           pol0 a1,rm,rad,bes1,nej1;
           mcircl f1;        circl f2;
           sf p1,p2;         sf0 p01,p02;
omega
           w1=f1; w2=f2; w3=-w1; wi=w1&w2;
           win=w3; wex=w2;
          ww=wi;
function
           w=ww;
           u1= p1  # p02 ;
           u2= p01 # p2  ;
          u=u2;
function
           ui=sum(1,0,u);
          ur=sum(1,0,u1);
program
                        gausp(s1,fa);         time;
          predi(w2);    kontur(s1,fa1);       time;
          predi(w3);    kontur(s1,fb1);       time;
          predi(wi);    sis(aa,bb);           koef;
          graf(r1,fux); graf(r1,fuy);
              a2=a1*a1;   l1=.5/rad;   l2=-a1;
     fa(u)=u1(i,2)*u2(j,2)+u1(i,3)*u2(j,3)-a2*u1(i)*u2(j)+
           u2(i,2)*u1(j,2)+u2(i,3)*u1(j,3)-a2*u2(i)*u1(j);
     fa1(u)=(l1*u1(i)-l2*u2(i))*u2(j)+
            (l2*u1(i)+l1*u2(i))*u1(j);
     fb1(u)=(bes1*u2(i)+nej1*u1(i))*a1;
              aa=ai(1);     bb=bi(1);
     fur(ur)=ur; fui(ur)=ui;  fuu(ur)=sqrt(ur*ur+ui*ui);
     fux(ur)=-ur(2); fuy(ur)=-ui(2);
     fuh(ur)=sqrt(ur(2)*ur(2)+ui(2)*ui(2));
end
value
         const=2,1,1,2,180,1,1;
         tabl=nu1,1,1,2,2, nu2,1,1,2,2, 0,1,2,0,0;
         p1=1,pr;   p2=2,pr;   p01=1;   p02=2;
         pr=-rad,-rad,rad,rad;
         f1=0,0,rm;    f2=0,0,rad;
         s1=k, f2,    0, 90;
         r1=kk,  0,0,rad,rad;
         a1=1;   rm=2.0;  rad=7;
         kk=29;
         bes1=.5767248078;       nej1=-.1070324315;
         nu1= 5;   nu2= 5;
         k=1;
end
