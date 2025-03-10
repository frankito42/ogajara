<?php
require "../../conn/conn.php";
$datexd=date("Y-m-d");
$sql="SELECT SUM(`monto`) as total FROM `egresos` WHERE fecha='$datexd'";
$res=$conn->prepare($sql);
$res->execute();
$res=$res->fetch(PDO::FETCH_ASSOC);
echo json_encode($res);
?>