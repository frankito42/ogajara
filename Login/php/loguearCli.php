<?php
session_start();
require "../../conn/conn.php";
$user=$_POST['nroCuenta'];
$pass=$_POST['cedula'];
$sql="SELECT * FROM `clientes` WHERE `nroCuenta`=:nro and `cedula`=:c";
$res=$conn->prepare($sql);
$res->bindParam(":nro",$user);
$res->bindParam(":c",$pass);
$res->execute();
$res=$res->fetch();

if($res==null){
    echo json_encode("mal");
}else{
    $_SESSION["user"]=$res;
    echo json_encode($res);
}
?>