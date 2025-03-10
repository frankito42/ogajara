<?php
require "../../conn/conn.php";

// Establecer el formato de fecha en español
$setLocaleQuery = "SET lc_time_names = 'es_ES';";
$conn->query($setLocaleQuery);

// Consulta principal
$sql = "SELECT SUM(`monto`) as total, DATE_FORMAT(`fecha`, '%M') as mes FROM `egresos` WHERE YEAR(`fecha`) = YEAR(NOW()) AND MONTH(`fecha`) = MONTH(NOW()) GROUP BY mes;";

// Preparar y ejecutar la consulta
$res = $conn->prepare($sql);
$res->execute();
$resultado = $res->fetch(PDO::FETCH_ASSOC);

// Convertir el resultado a JSON
echo json_encode($resultado);
?>
