DECLARE
  MODUL RO,TETA;
  POL0 KZ,RS; MCIRCL F2;
  CIRCL F1;
OMEGA
  F=COS(KZ*TETA)-RO+RS;
  FF=COS((KZ+4)*TETA)-RO+RS;
  W=F1&F2&F; W1=F1&F2&FF;
PROGRAM
  RESULT(S1,FW1); PREDI(W);
  RESULT(S1,FW);
  FW1(W1)=W1;
  FW(W1)=W;
VALUE  CONST=1,1,1,1,10,1,1;
  TABL=4,1,1,1,1, 0,1,1,0,0;
  F1=0,0,6.8;  F2=0,0,3; RS=6; KZ=9;
  S1=80,-7,-7,7,7;
END