<?php
require "../../conn/conn.php";
$sql="SELECT `id`, `nroCuenta`, `cedula`, `nombre`, `apellido`, `domicilio`, `telefono` FROM `clientes` WHERE `cedula`=:c";
$res=$conn->prepare($sql);
$res->bindParam(":c",$_POST['search']);
$res->execute();
$res=$res->fetch(PDO::FETCH_ASSOC);
echo json_encode($res);
?>