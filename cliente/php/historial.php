<?php
require "../../conn/conn.php";
$sql="SELECT `id`, `idEstadoCuenta`, `nroCuota`, `total`, `estado`, `vencimiento`, `fechaPago`, `metodoPago`, `idUser`, `verificacion` FROM `estadocuotas` WHERE `idEstadoCuenta`=$_GET[id] and idUser!=0";
$res=$conn->prepare($sql);
$res->execute();
$res=$res->fetchAll(PDO::FETCH_ASSOC);
echo json_encode($res);
?>