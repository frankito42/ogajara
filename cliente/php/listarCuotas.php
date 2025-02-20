<?php
require "../../conn/conn.php";
$sql="SELECT * FROM `estadocuotas` WHERE `idEstadoCuenta`=$_GET[id]";
$res=$conn->prepare($sql);
$res->execute();
$res=$res->fetchAll(PDO::FETCH_ASSOC);
echo json_encode($res);
?>