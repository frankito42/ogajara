<?php
require "../../conn/conn.php";
$datexd=date("Y-m-d");
$sql="SELECT u.user,ec.id,cuotasxd.idUser,c.nroCuenta,c.nombre,c.apellido,SUM(cuotasxd.total) pagado, COUNT(cuotasxd.id) as cuotas FROM `estadocuotas` cuotasxd 
JOIN estadocuenta ec on ec.id=cuotasxd.idEstadoCuenta 
JOIN clientes as c on c.id=ec.idCliente 
JOIN usersadmin u on u.idUser=cuotasxd.idUser
WHERE cuotasxd.estado=1 and cuotasxd.verificacion='pendiente' GROUP by ec.id,u.user;";
$res=$conn->prepare($sql);
$res->execute();
$res=$res->fetchAll(PDO::FETCH_ASSOC);
echo json_encode($res);
?>