 @echo off
 path=C:\POLYE\FORTRAN\BINB;C:\POLYE;
 set polepath=C:\POLYE
 if not exist %1.rl goto nof
rem C:\POLYE\zas.exe                                                
 C:\POLYE\mac.exe %TMP%\rl.for %TMP%\rl.dat %1.rl                
 if errorlevel 1 goto err1
 fl /FPi87 /c /Zl /Ox /4I2 /W0 /AH /Gb /Fo%TMP%\rl %TMP%\rl.for
 if errorlevel 1 goto err2
 link %TMP%\rl/se:512 /exe /noe,%TMP%\rl,nul,@C:\POLYE\polye.lib 
 if errorlevel 1 goto err3
 %TMP%\rl %TMP% %TMP%\rl.dat %TMP%\%1.res
 del %TMP%\rl.*
 goto end
 :nof
 echo  ���� %1.rl �� ������.
 goto end
 :err1
 echo    �뫨 �訡�� � ��室��� �ணࠬ��
 goto end
 :err2
 echo    �뫨 �訡�� �� �࠭��樨 �ணࠬ��
 goto end
 :err3
 echo    �뫨 �訡�� �� ����㧪� �ணࠬ��
 :end
 exit
