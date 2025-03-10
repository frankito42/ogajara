<?php
require "../../conn/conn.php";
$datexd=date("Y-m-d");
$sql="UPDATE `estadocuotas` SET `verificacion`='aprobado' WHERE `id`=$_GET[id]";
$res=$conn->prepare($sql);
$res->execute();
echo json_encode("ok");
?>