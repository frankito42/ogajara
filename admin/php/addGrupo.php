<?php
require "../../conn/conn.php";
$sql="SELECT * FROM `clientes` WHERE `nroCuenta` like '$_GET[g]-%' and id=(SELECT max(id) from clientes where nroCuenta like '$_GET[g]-%')";
$res=$conn->prepare($sql);
$res->execute();
$res=$res->fetch(PDO::FETCH_ASSOC);
echo json_encode($res);
?>