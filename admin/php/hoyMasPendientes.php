<?php
require "../../conn/conn.php";
$datexd=date("Y-m-d");
$sql="SELECT sum(`total`) as total, COUNT(`id`) as contador FROM `estadocuotas` WHERE (verificacion='pendiente' or fechaPago='$datexd') and estado=1";
$res=$conn->prepare($sql);
$res->execute();
$res=$res->fetch(PDO::FETCH_ASSOC);
echo json_encode($res);
?>