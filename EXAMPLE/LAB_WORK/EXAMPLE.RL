 DECLARE
  >Indefinite components ”1=à1  and  ”2=à2   are  described,  as 
   well as parameters  á  and  k;
   sf p1,p2;
   pol0 c,k;
 OMEGA
  >Reference  functions   f1--f5   are  described  and   logical 
   formulae are specified both for the sections of the  boundary 
   corresponding w2 and Neumann's  w3  conditions  and  for  the 
   boundary of the whole domain  w0;
   f1=y*(1-y);f2=(1-x*x)/2;
   f3=y-c;f4=(k*k-x*x)/2/k;
   f5=((x+k)**2+(y-c)**2)*((x-k)**2+(y-c)**2);
   w2=f2;
   w3=f1&((-(f3&f4))&f5);
   w1=(f1&f2)&(-(f3&f4));
 FUNCTION
   >The homogeneous  u1  and inhomogeneous   u0   parts  of  the 
   solution structure, as well as the auxiliary function  f6 -f8 
   partticipating in its construction are specified in the  form 
   of formulae;
   om=w1;
   f6=x*sqrt((1-c)*(1-k)+c*c)/sqrt(x*x*(1-k)*(1-c)+c*c);
   f7=c*(1-k)*(1-c)/sqrt(w3*w3+c*c*((1-k)*(1-c))**2);
   u0=f6-w3*w2*f7/(w3+w2)*d1(w3,f6);
   f8=x/sqrt(x*x)*(y-c+sqrt(x*x+(c-y)**2));
   u11=w2*(p1#(p2*f8));
   u1=c*(1-k)*(1-c)*(u11-w3*w2/(w3+w2)*d1(w3,u11));
 FUNCTION
   >The solution is assembled  u = u1 + u0 ;
   u = sum(1,u0,u1);
 PROGRAM
   >Information is specified about the used methods of  integra- 
   tion  and  solution  of  the  system  of   linear   algebraic 
   equations, the form presentation of solution results, as well 
   as the integrand expressions corresponding in  this  case  to 
   the Ritz method used;
   gauss(s1,fa1,fb1);
   sis(aa,bb);
   result(r30,fu);
   fa1(u1) = ( u1(i,2)*u1(j,2)+u1(i,3)*u1(j,3))*y;
   fb1(u1) =(-u1(i,2)*u0(2)-u1(i,3)*u0(3))*y;
   aa=ai(1);
   bb=bi(1);
   fu(u)=u;

 VALUE
   >Specified is the dimensionality of the  approximating  space 
    kkf ,  maximal powers of polynomials  à1,  à2  -  m1,  m2  , 
    exhaustion of the powers of polynomials  sx1, sy1   allowing 
    to take into account the  type  of  solution  symmetry,  the 
    rectangle framing the domain for scaling the polinomials and 
    organizing  the  integration   pr1  ,  numerical  values  of 
    parameters  c, k ,  maximal  order  of  derivatives  -  der, 
    participating in the computational process, increased by 1 , 
    number of integration points, using the Gauss method  k1;
   const=2,1,1,der,kkf,1,1;
   tabl=m1,2,1,sx1,sy1,m2,1,1,sx1,sy1,
         0,1,2,0,0;
   pr1=-1,0,1,1;
   p1 = 1,pr1;
   p2 =2,pr1;
   c=0.5;
   k=0.1;
   s1= k1, 0,0,1,1;
   r30=60,-1,0,1,1;
   der=3;
   kkf=100;
   sx1=2;
   sy1=1;
   m1=5;
   m2=3;
   k1=4;

   >Your program is ready !! Good luck !! ;

   END