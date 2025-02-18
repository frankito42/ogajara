<?php
require "../../conn/conn.php";
$fecha=date("Y-m-d");
$sql="UPDATE `estadocuotas` SET `estado`=1,`fechaPago`='$fecha',`metodoPago`='$_POST[metodo]', idUser=$_POST[idUser] WHERE `id`=$_POST[id]";
$res=$conn->prepare($sql);
$res->execute();
echo json_encode("ok");
?>