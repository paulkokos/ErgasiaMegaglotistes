<?php
    include "test.php";
    include_once "test1.php";
    include "Tests/Tests.php";
	$txt = "Hello world!";
	$x = 5;
    $y = 10.5;
     function FunctionName(Type $var = null)
    {
        return 0;
    }
?>
<?php
	$txt = "Have a nice day!";
	echo "I love $txt!";
?>

output me 2 metavlhtes (x,y):

<?php
	$x = 5;
	$y = 4;
	echo $x + $y;
?>

dhlwsh (print):

<?php
	print "<h2>PHP is Fun!</h2>";
	print "Hello world!<br>";
	print "I'm about to learn PHP!";
?>

(string):

<?php 
	$x = "Hello world!";
	$y = 'Hello world!';

	echo $x;
	echo "<br>"; 
	echo $y;
?>

(integer):

<?php 
	$x = 5985;
	var_dump($x);
?>

(float):

<?php 
	$x = 10.365;
	var_dump($x);
?>

vasikes arithmitikes prakseis (+,-,*,/,%):

<?php
	$x = 10;  
	$y = 6;

	echo $x + $y;
?>
  
<?php
	$x = 10;  
	$y = 6;

	echo $x - $y;
?> 

<?php
	$x = 10;  
	$y = 6;

	echo $x * $y;
?>  

<?php
	$x = 10;  
	$y = 6;

	echo $x / $y;
?>  

<?php
	$x = 10;  
	$y = 6;

	echo $x % $y;
?>  

synarthsh (function):

<?php
	function writeMsg() 
	{
    	echo "Hello world!";
	}

	writeMsg(); // call the function
?>
<?php
	if (true) {
		echo "Hello world";
	} else if (!true) {
		echo "Hello not World";
	} else {
		echo "Not hello at all";
	}
?>