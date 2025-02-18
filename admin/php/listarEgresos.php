<?php
require "../../conn/conn.php";
$sql="SELECT * FROM `egresos`";
$res=$conn->prepare($sql);
$res->execute();
$res=$res->fetchAll(PDO::FETCH_ASSOC);
echo json_encode($res);
?>