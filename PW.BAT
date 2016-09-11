 @echo off
 path=C:\POLYE\FORTRAN\BINB;C:\POLYE;
 set polepath=C:\POLYE
 if not exist %1 goto nof
rem C:\POLYE\zas.exe                                                
 :start
 Menu.exe R
 if errorlevel 4 goto end
 if errorlevel 3 goto results
 if errorlevel 2 goto calc
 if errorlevel 1 goto edit
 :calc
 C:\POLYE\mac.exe %TMP%\rl.for %TMP%\rl.dat %1                   
 if errorlevel 1 goto err1
 fl /FPi87 /c /Zl /Ox /4I2 /W0 /AH /Gb /Fo%TMP%\rl %TMP%\rl.for
 if errorlevel 1 goto err2
 link %TMP%\rl/se:512 /exe /noe,%TMP%\rl,nul,@C:\POLYE\polye.lib 
 if errorlevel 1 goto err3
 %TMP%\rl %TMP% %TMP%\rl.dat %TMP%\result.res
 del %TMP%\rl.*
 goto start
 :nof
 echo  Файл %1 не найден.
 goto end
 :err1
 echo    Были ошибки в исходной программе
 goto start
 :err2
 echo    Были ошибки при трансляции программы
 goto start
 :err3
 echo    Были ошибки при загрузке программы
 goto start
 :end
 exit
 :results
 ne %TMP%\result.res
 goto start
 :edit
 ne %1
 goto start
