<?php
require "../../conn/conn.php";
$datexd=date("Y-m-d");
$sql="SELECT `id`, `idEstadoCuenta`, `nroCuota`, `total`, `estado`, `vencimiento`, `fechaPago`, `metodoPago`, `verificacion` FROM `estadocuotas` WHERE `idEstadoCuenta`=$_GET[id] and estado=1 and verificacion='pendiente'";
$res=$conn->prepare($sql);
$res->execute();
$res=$res->fetchAll(PDO::FETCH_ASSOC);
echo json_encode($res);
?>