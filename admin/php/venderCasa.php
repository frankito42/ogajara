<?php
require "../../conn/conn.php";
$sql="INSERT INTO `estadocuenta`(`idCliente`, `mt2`, `cuotas`, `estado`) VALUES 
(:idCliente,:mt2,36,'pendiente')";
$res=$conn->prepare($sql);
$res->bindParam(":idCliente",$_POST['cliente']);
$res->bindParam(":mt2",$_POST['mt2']);
$res->execute();


$idCuenta=$conn->lastInsertId();

for ($i=1; $i <=36 ; $i++) { 
    if ($_POST['mt2']=='50') {
        $dueDate = date('Y-m-d', strtotime("+$i month"));
        $sql="INSERT INTO `estadocuotas`(`idEstadoCuenta`, `nroCuota`, `total`, `estado`,vencimiento) VALUES 
        ($idCuenta,$i,760000,'pendiente','$dueDate')";
        $res=$conn->prepare($sql);
        $res->execute();
    }
    if ($_POST['mt2']=='60') {
        $dueDate = date('Y-m-d', strtotime("+$i month"));
        $sql="INSERT INTO `estadocuotas`(`idEstadoCuenta`, `nroCuota`, `total`, `estado`,vencimiento) VALUES 
        ($idCuenta,$i,950000,'pendiente','$dueDate')";
        $res=$conn->prepare($sql);
        $res->execute();
    }
    if ($_POST['mt2']=='70') {
        $dueDate = date('Y-m-d', strtotime("+$i month"));
        $sql="INSERT INTO `estadocuotas`(`idEstadoCuenta`, `nroCuota`, `total`, `estado`,vencimiento) VALUES 
        ($idCuenta,$i,1150000,'pendiente','$dueDate')";
        $res=$conn->prepare($sql);
        $res->execute();
    }
    if ($_POST['mt2']=='80') {
        $dueDate = date('Y-m-d', strtotime("+$i month"));
        $sql="INSERT INTO `estadocuotas`(`idEstadoCuenta`, `nroCuota`, `total`, `estado`,vencimiento) VALUES 
        ($idCuenta,$i,1350000,'pendiente','$dueDate')";
        $res=$conn->prepare($sql);
        $res->execute();
    }
    if ($_POST['mt2']=='90') {
        $dueDate = date('Y-m-d', strtotime("+$i month"));
        $sql="INSERT INTO `estadocuotas`(`idEstadoCuenta`, `nroCuota`, `total`, `estado`,vencimiento) VALUES 
        ($idCuenta,$i,1550000,'pendiente','$dueDate')";
        $res=$conn->prepare($sql);
        $res->execute();
    }
    if ($_POST['mt2']=='100') {
        $dueDate = date('Y-m-d', strtotime("+$i month"));
        $sql="INSERT INTO `estadocuotas`(`idEstadoCuenta`, `nroCuota`, `total`, `estado`,vencimiento) VALUES 
        ($idCuenta,$i,1750000,'pendiente','$dueDate')";
        $res=$conn->prepare($sql);
        $res->execute();
    }
}



echo json_encode("ok");
?>