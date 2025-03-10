<?php
require "../../conn/conn.php";
$datexd=date("Y-m-d");
$sql="SELECT `id`, u.user, `idEstadoCuenta`, `nroCuota`, `total`, `estado`, `vencimiento`, `fechaPago`, `metodoPago`, `verificacion` FROM `estadocuotas` e 
JOIN usersadmin u on u.idUser=e.`idUser` 
WHERE `idEstadoCuenta`=$_GET[id] and estado=1 and verificacion='pendiente' and e.idUser=$_GET[idUser];";
$res=$conn->prepare($sql);
$res->execute();
$res=$res->fetchAll(PDO::FETCH_ASSOC);
echo json_encode($res);
?>