declare >тесты;
bandx f1; bandy f2;
pol2 p1,p2;
spli pl,ql;
sf0 p01,p02;
omega
w3=f1& f2;
function
w=f1*f2/(f1+f2);
function
u1=p1*p1*pl;
function 
v1=p2*p2*ql;
function
u11=u1#p02; v11=p01#v1;
function
vr=sum(2,0.0,v1);
function
ur=sum(1,0.0,u1);
program
      point(s1,fa,fb); matr;
      pro; koef; time;
>rezult(sv,fw3);
 title('значения u '); tab(rrt,fpx);
 title('значения v '); tab(rrt,fpy);
 time;  aa=ai(1); bb=bi(1);
fa(v11)=(u11(i,4)+u11(i,6)+v11(i,1))*(u11(j,4)+u11(j,6)+v11(j,1))+
        (v11(i,4)+v11(i,6)-u11(i,1))*(v11(j,4)+v11(j,6)-u11(j,1));
fb(v11)=(u11(i,4)+u11(i,6)+v11(i,1))*(12*x*x+12-8*y*y+y**4)+
          (v11(i,4)+v11(i,6)-u11(i,1))*(12*y*y-17+2*x*x-x**4);
fpx(ur) =ur;
fpy(vr) =vr;
fw3(w3)=w3;
value
const=2,1,1,3,80,1,1;
tabl=m,5,5,0,0, m,5,5,0,0, 2,1,2,0,0;
m=4;   rrt=ky,kx,0,0,a,b;
p1=1,0,0,-1,0,0;
p2=4,0,0,0,0,-1;
pl=1,пр;  p01=1;     
ql=2,пр;  p02=2;    
пр=am,bm,a,b;
am=-1; a=1;
bm=-2; b=2;
sv=30,пр;
k=1;    kx=3; ky=3;            s1=k,пр;
f1=0,b;  f2=0,a;
end