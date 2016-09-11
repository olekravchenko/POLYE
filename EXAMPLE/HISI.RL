 DECLARE
   SF     P;
   POL1   PSI;
   LINE   F1,F2;
   BANDY  F3;
   MCIRCL F4;
 OMEGA
   W12 = F1&F2;
   W4  = F4;
   W124= W12&W4;
   W3  = F3;
   W   = W124&W3;
 FUNCTION
   OM  = W;
   W33 = W3*W3;
   FI  = (15.*W12+W4*PSI)/(W12+W4);
   U0  = FI*W33/(W124+W33);
   U1  = W124*P;
 FUNCTION
   U   = SUM(1,U0,U1);
 PROGRAM                TIME;
   GAUSS(S1,FA,FB);     TIME;
   SIS(AA,BB);          TIME;
   KOEF;  
   TAB(R10,FU);  PAUS;
   RESULT(R20,FU);
   FA(U1) =  U1(I,2)*U1(J,2)+U1(I,3)*U1(J,3);
   FB(U1) =-(U1(I,2)*U0(  2)+U1(I,3)*U0( 3));
   AA=AI(1);
   BB=BI(1);
   FU(U)=U;
 VALUE
   CONST=1,1,1,DER,KK”,1,1;
   TABL=M,1,1,SX,SY, 0,1,1,0,0;
   PR  =-7.5,-8.8, 7.5,1.2;
   P   = 1,PR;
   F1  = 7.5,1.2, -7.5,1.2;
   F2  =-7.5,-8.8, 7.5,-8.8;
   F3  = 0,7.5;
   F4  = 0,0,0.2;
   PSI =-18.08,0,-1.6;
   >PSI= 17.12,0,2.4;
   S1  =  K, 0,0.2,7.5,1.2, 0,-0.2,7.5,0.2, 0,-8.8,7.5,-0.2;
   R10 = 11,5,PR;
   R20 = 30,  -8,-9,8,2;
   DER =  2;
   KK” = 30;
   SX  =  2;
   SY  =  1;
   M   =  5;
   K   =  1;
END