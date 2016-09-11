> ‚…˜ŸŸ ‡€„€—€ í‹…Š’Ž„ˆ€ŒˆŠˆ (‹Ž‘Š€Ÿ);
>         ‡€„€—€ …‰Œ€€;
DECLARE
     BANDY F1,F7; MBANDY F2; BANDX F8;
     POL1 F3,F4; MODUL RO;
     POL0 A,B,BETA;
     SF RP1,RP2,RP3,RP4,RP5,RP6;
     SF0 P01,P02,P03,P04,P05,P06;
>ŽŒ…ƒˆ;
FUNCTION
     RW=SQRT(Y*Y+1)+Y; W30=RW*RW!(-F1);
     W3=W30/(W30+1);
     W50=(F3!F4)!((A-X)&(A+X))!Y;
     W5=W50/(W50+1);
     R=RO; SRA=SQRT(R*R+A*A); F=1/(W3*SRA+1);
>Ž¡‹€‘’œ ˆ’…ƒˆŽ‚€ˆŸ;
OMEGA
     WB=(F2!F1)!Y;  W=WB&(F7&F8);
FUNCTION  PP2=RP3;
>‘’“Š’“› …˜…ˆŸ;
FUNCTION
     W6=F; RW=A+3*SRA*W5;
     XB=X/RW; YB=Y/RW;
     P1=RP1; P2=SUP(XB,YB,PP2);
     KW6=SQRT(W6); W55=W5*W5;
     RW=W3+W55*W6*KW6; AK=W3/RW; BK=W55*W6*KW6/RW;
     RW=5./8.; TAU=SQRT(RW); LAM=0.4;
     RW=1-TAU*TAU; RW1=SQRT(RW*RW+LAM*LAM);
     Q0=SQRT((RW1+RW)/2); Q1=SQRT((RW1-RW)/2);
     W36=W3+W6; RW=W3*SRA; RW1=Q0*Y*W6;
     T03=Q1*RW/W36; T02=(RW1-RW)/W36; T01=(RW1+RW)/W36;
     TAUK=TAU*W6*(BETA*W3*W3+W6);
     CTW=COS(T01*W55); STW=SIN(T01*W55);
     CT1=COS(T01); CT2=COS(T02);
     ST1=SIN(T01); ST2=SIN(T02);
     SX=SIN(TAUK*X);
     ETW=EXP(-T03*W55); ET=EXP(-T03);
     RW=BK*ET*SX; U10=RW*CT1; U20=-RW*ST1;
     PW=P2*KW6; PWD=PW-W5*D1(PW,W5);
  U1=RW*(P1*CT2#P1*ST2)#AK*ETW*(PWD*CTW#PWD*STW)#
         AK*ET*W55*KW6*(P2*CT1#P2*ST1);
  U2=RW*(P1*ST2#P1*CT2)#AK*ETW*(-PWD*STW#PWD*CTW)#
         AK*ET*W55*KW6*(-P2*ST1#P2*CT1);
> ‘’“Š’“› „‹Ÿ ‚›„€—ˆ …‡“‹œ’€’Ž‚;
FUNCTION
     XB=SIN(X)/3; YB=COS(X)/3;
     P2=SUP(XB,YB,PP2);
     P5B=P01#P02#P2 #P04#P2 #P06;
     P6B=P01#P02#P03#P2 #P05#P2 ;
FUNCTION
     R6B=SUM(1,0,P6B);
     R5B=SUM(1,0,P5B);
PROGRAM     TIME ;
     GAUSS(S1,FA,FB); GAUSS(S11,FA,FB); TIME; MATR;
     SIS(AA,BB); KOEF;
     TITLE('   „ ˆ € ƒ  € Œ Œ €   €   € ‚ ‹ …   Ž ‘ ’ ˆ ');
     TABF(SV,FY,FIN);
     TITLE('   ” € ‡ Ž ‚ € Ÿ   „ ˆ € ƒ  € Œ Œ €  ');
     TABF(SV,FY,FIF);
     TABP(SSV,FG1); TABP(SSV,FG2);
     TIME;
     AA=AI(1); BB=BI(1); FY=1;
  FA(U2)=
     (U1(I,4)+U1(I,6)+U1(I)+LAM*U2(I))*
     (U1(J,4)+U1(J,6)+U1(J)+LAM*U2(J))+
     (U2(I,4)+U2(I,6)+U2(I)-LAM*U1(I))*
     (U2(J,4)+U2(J,6)+U2(J)-LAM*U1(J));
  FB(U2)=-(
     (U1(I,4)+U1(I,6)+U1(I)+LAM*U2(I))*
     (U10(4)+U10(6)+U10+LAM*U20)+
     (U2(I,4)+U2(I,6)+U2(I)-LAM*U1(I))*
     (U20(4)+U20(6)+U20-LAM*U10));
> „‹Ÿ ”ŽŒ“‹ ‚›„€—ˆ;
     G1=R5B;  G2=R6B;
     FIN(R5B)=SQRT(G1*G1+G2*G2);
     FG1(R5B)=G1*COS(Q0*COS(X))+G2*SIN(Q0*COS(X));
     FG2(R5B)=G2*COS(Q0*COS(X))-G1*SIN(Q0*COS(X));
     FIF=FR(X,Y);
END
FORTRAN
      FUNCTION FR(X,Y)
      IMPLICIT REAL*8 (A-H,O-Z)
      A=QFG1(X,Y)
      B=QFG2(X,Y)
      FR=DATAN2(B,A)
      RETURN
      END
END
VALUE
    CONST=6,1,1,4,100,1,1;
    TABL=N1,SB, N1,SB, N2,CB, N2,CB, N2,CB, N2,CB,
         0,1,6,0,0;
    CB=2,1,2,1;    SB=1,1,1,1;
    N1=1;       N2=3;
    RP1=1,PR; RP2=2,PR; RP3=3,PR;
    RP4=4,PR; RP5=5,PR; RP6=6,PR;
    P01=1; P02=2; P03=3; P04=4; P05=5; P06=6;
    A=1.6493361;      > PI/2*1.05;
    B=4;  C=6;  D=2;
    PR=-1,-1,1,1;  BETA=1;
    F1=0,A;  F2=0,B; F3=-B,1,0; F4=-B,-1,0;
    F7=0,C;  F8=7,13;
    S1=K, 0,-D,A,0, 0,0,A,2, A,0,B,2;
    S11=K, B,0,C,2, B,-D,C,0;
    SV=11,0, 3.141592;     SSV=0,0;
    K=1;
END