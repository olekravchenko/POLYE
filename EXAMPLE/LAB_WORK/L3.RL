Declare
   Mcircl fi1,fi2;
   Circl f3;
Omega
   Om = 1;
Function   
   f1=x;
   f2=y;
   w1 = f1 * f1 ! fi1 ;
   w2 = f2 * f2 ! fi2 ;
   w3 = f3 * f3 ;
   w = sqrt ( w1 & w2 & w3 + 1e-8) ;
Program
   Result(r1,fw);
        fw(w)=w;
Value
   Const=1,1,1,1,10,1,1;
   Tabl =1,1,1,1,1, 0,1,1,0,0;
   fi1  =0,0,1;
   fi2  =0.5,0,0.5;
   f3   =2,0,1;
   r1   =  20,20, -0.5,-2,3.5,2;
end