<?php
require "../../conn/conn.php";
$sql="INSERT INTO `clientes`(`nroCuenta`, `cedula`, `nombre`, `apellido`, `domicilio`, `telefono`) VALUES (:n,:c,:nom,:a,:d,:t)";
$res=$conn->prepare($sql);
$res->bindParam(":n",$_POST['nroCuenta']);
$res->bindParam(":c",$_POST['cedula']);
$res->bindParam(":nom",$_POST['nombre']);
$res->bindParam(":a",$_POST['apellido']);
$res->bindParam(":d",$_POST['domicilio']);
$res->bindParam(":t",$_POST['telefono']);
$res->execute();
echo json_encode($res);
?>