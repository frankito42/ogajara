<?php
require "../../conn/conn.php";
$sql="SELECT `id`, `idCliente`, `mt2`, `cuotas`, `estado`,(SELECT COUNT(id) FROM estadocuotas WHERE idEstadoCuenta=e.id and estado=1) as pagado FROM `estadocuenta` as e WHERE e.idCliente=$_GET[id]";
$res=$conn->prepare($sql);
$res->execute();
$res=$res->fetchAll(PDO::FETCH_ASSOC);
echo json_encode($res);
?>