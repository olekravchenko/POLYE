 DECLARE    CIRCL F1;  > O��CAH�E OKP��HOCT�;
 OMEGA      W = F1;    > �PABHEH�E O��ACT�;
 FUNCTION   G1= W;     > �PABHEH�E ��ACTKOB;
    W1 = -(-G1 & Y);
    W2 =    G1 ! Y;
    U  = (W1 + W2 * SQRT(X*X)) / (W1 + W2);
 PROGRAM
    RESULT(S1,FU);     > �E�AT� KAPT�H�;
    FU(U)=U;
 VALUE
    CONST =  1,1,1,1,10,1,1;
    TABL  =  1,1,1,1,1, 0,1,1,0,0;
    F1    =  0,0,1;               > O��CAH�E OKP��HOCT�;
    S1    = 30, -1,-1,1,1;
END