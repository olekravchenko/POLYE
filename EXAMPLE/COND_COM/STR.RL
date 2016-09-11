$if.not. defined ( sharnir )
	FUNCTION  OM=W; W1=OM*OM; U1=W1*P;
$else
	FUNCTION  OM=W; U1=om*P;
$endif
$include:'sum.rl'