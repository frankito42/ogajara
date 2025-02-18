<?php
require "../../conn/conn.php";
$sql="INSERT INTO `egresos`(`monto`, `detalle`) VALUES (:m,:d)";
$res=$conn->prepare($sql);
$res->bindParam(":m",$_POST['monto']);
$res->bindParam(":d",$_POST['descripcion']);


$res->execute();
echo json_encode("ok");
?>