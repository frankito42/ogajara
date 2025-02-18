<?php
require "../../conn/conn.php";
$sql="SELECT `id`, `nroCuenta`, `cedula`, `nombre`, `apellido`, `domicilio`, `telefono` FROM `clientes`";
$res=$conn->prepare($sql);
$res->execute();
$res=$res->fetchAll(PDO::FETCH_ASSOC);
echo json_encode($res);
?>