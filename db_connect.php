<?php 

$username = 'hr';
$password = 'hr';
$connection_string = 'localhost/xe';

$connection = oci_connect(
 $username,
 $password,
 $connection_string,
 "UTF8"
);

If (!$connection)
{
   echo 'Bląd łączności';
   oci_close($connection);
}
?>

