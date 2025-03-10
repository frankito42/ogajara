<?php
require "../../conn/conn.php";
$datexd=date("Y-m-d");
<<<<<<< HEAD
$sql="SELECT `id`, `idEstadoCuenta`, `nroCuota`, `total`, `estado`, `vencimiento`, `fechaPago`, `metodoPago`, `verificacion` FROM `estadocuotas` WHERE `idEstadoCuenta`=$_GET[id] and estado=1 and verificacion='pendiente'";
=======
$sql="SELECT `id`, `idEstadoCuenta`, `nroCuota`, `total`, `estado`, `vencimiento`, `fechaPago`, `metodoPago`, `verificacion`,u.user FROM `estadocuotas` e JOIN usersadmin u on u.idUser=e.idUser WHERE `idEstadoCuenta`=$_GET[id] and estado=1 and verificacion='pendiente';";
>>>>>>> 5a6d436c6dd7c9817970864d911e4ac518803901
$res=$conn->prepare($sql);
$res->execute();
$res=$res->fetchAll(PDO::FETCH_ASSOC);
echo json_encode($res);
?>