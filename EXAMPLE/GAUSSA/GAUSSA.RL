DECLARE      > ��������� ��������;
  LINE F1,F2,F3;  BANDY F4;  SF P; mcircl f5;
OMEGA   W=(F1!F2) & F3 & F4 & f5;
FUNCTION  OM=W; W1=OM*OM; U1=W1*P;
FUNCTION  U=SUM(1,0,U1);
PROGRAM  GAUSSA(S1,FA);  TIME;  ATS;   ATS;
   NEW;  GAUSSA(S1,FB);  TIME;  VAL;
  PR1; RESULT(R1,FU);
  PR1; RESULT(R1,FU);
  FA(U1)=(U1(I,4)+U1(I,6))*(U1(J,4)+U1(J,6));
  FB(U1)=U1(I)*U1(J);  FU(U)=U;
VALUE  CONST=1,1,1,3,55,2,1;
  TABL=NP,1,1,2,1, 0,1,1,0,0; P=1,-A,-B,A,B;

  S1= 20,1,1, -A,-B,A,B, 0.1, 10;

> S1=k, nx,ny, xmin,ymin,xmax,ymax, eps, n;
> k - ������⢮ 㧫�� � ��㫥 ����� (�� ����� ����);
> nx,ny - ࠧ��୮��� ࠢ����୮� �⪨ ࠧ������ ������
          ��⥣�஢����;
> eps - �⭮�⥫쭠� ����稭� ��������� ��אַ㣮�쭨�� �� ���ன
        �४�頥��� �஡����� ������;
> n - ������⢮ ��砩�� ࠧ���뢠���� �祪 ��� ���஢����
      �ਭ��������� ��אַ㣮�쭨�� ������;

  F1=0,C,-A,B; F2=A,B,0,C; F3=-A,-B,A,-B; F4=0,A;
  f5 =0,0, 0.1;
  R1=41, -.51,-.51,.51,.51;
  A=.5;  B=.5;  C=0.;
  NP=6; K=2;
END