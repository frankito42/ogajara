<?php
require "../../conn/conn.php";

// Establecer el formato de fecha en español
$setLocaleQuery = "SET lc_time_names = 'es_ES';";
$conn->query($setLocaleQuery);

$datexd = date("Y-m-d");

// Consulta principal
$sql = "
SELECT 
    SUM(`total`) as total, 
    COUNT(`id`) as contador, 
    DATE_FORMAT(`fechaPago`, '%M') as mes
FROM 
    `estadocuotas` 
WHERE 
    YEAR(`fechaPago`) = YEAR(NOW()) AND 
    MONTH(`fechaPago`) = MONTH(NOW())
GROUP BY 
    mes;";

// Preparar y ejecutar la consulta
$res = $conn->prepare($sql);
$res->execute();
$resultado = $res->fetch(PDO::FETCH_ASSOC);

// Convertir el resultado a JSON
echo json_encode($resultado);
?>
