 DECLARE
    MCIRCL FI1,FI2;
     CIRCL F3;
    OMEGA
     OM = 1;
   FUNCTION                   > ìPABHEHàü ìóACTKOB;
    F1=X;
    F2=Y;
    W1 = F1 * F1 ! FI1 ;
    W2 = F2 * F2 ! FI2 ;
    W3 = F3 * F3 ;
    W = SQRT ( W1 & W2 & W3 + 1E-8) ;
  PROGRAM
  RESULT(R1,FW);   > èEóATú KAPTàHõ;
     FW(W)=W;
  VALUE
   CONST=1,1,1,1,10,1,1;
   TABL =N,1,1,1,1, 0,1,1,0,0;
   FI1  =0,0,1;   N=1;
   FI2  =0.5,0,0.5;
   F3   =2,0,1;
   R1   =  20, 0,-1,3,1;
END