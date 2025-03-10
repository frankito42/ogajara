<?php
require '../vendor/autoload.php';
require "../../conn/conn.php";
use PhpOffice\PhpWord\TemplateProcessor;
if (!class_exists('PhpOffice\PhpWord\TemplateProcessor')) {
    die('TemplateProcessor no está disponible');
}
function separarFecha($fecha) {
    $timestamp = strtotime($fecha);  // Convierte la fecha en un timestamp

    if (!$timestamp) {
        return null;  // Retorna null si la fecha no es válida
    }

    $meses = [
        '01' => 'Enero', '02' => 'Febrero', '03' => 'Marzo', 
        '04' => 'Abril', '05' => 'Mayo', '06' => 'Junio', 
        '07' => 'Julio', '08' => 'Agosto', '09' => 'Septiembre', 
        '10' => 'Octubre', '11' => 'Noviembre', '12' => 'Diciembre'
    ];

    $año = date('Y', $timestamp);
    $mesNumero = date('m', $timestamp);
    $dia = date('d', $timestamp);

    $mesNombre = $meses[$mesNumero];

    return [
        'año' => $año,
        'mes' => $mesNombre,
        'dia' => $dia
    ];
}
function formatearDNI($dni) {
    // Elimina cualquier carácter que no sea un dígito
    $dni = preg_replace('/\D/', '', $dni);  

    // Verifica que el DNI tenga entre 7 y 10 dígitos
    if (strlen($dni) < 7 || strlen($dni) > 10) {
        return "DNI inválido";
    }

    // Aplica el formato con puntos
    return number_format($dni, 0, '', '.');
}
function capitalizarCadaPalabra($texto) {
    // Elimina espacios adicionales y convierte todo a minúsculas
    $texto = trim($texto); // Elimina espacios al principio y al final
    if (empty($texto)) {
        return ''; // Si el texto está vacío, retorna vacío
    }
    
    // Convierte la primera letra de cada palabra a mayúscula, sin cambiar otros caracteres
    return mb_convert_case($texto, MB_CASE_TITLE, "UTF-8");
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Asegurarse de que el parámetro id esté presente
    if (!isset($_POST['id'])) {
        echo json_encode(['error' => 'El ID es obligatorio']);
        exit();
    }

    // Cargar el archivo Word (debe ser .docx)
    $filePath = 'uploads/contrato.docx';

    // Consulta SQL con parámetros vinculados
    $sql = "SELECT c.id, e.`mt2`,c.nombre,c.apellido,c.cedula,c.nroCuenta,c.domicilio,c.nroDom,c.ciudad FROM `estadocuenta` as e JOIN clientes as c on c.id=e.idCliente WHERE e.idCliente=:id and e.id=:idE;";
    $res = $conn->prepare($sql);
    $res->bindParam(':id', $_POST['id'], PDO::PARAM_INT); // Evita la inyección SQL
    $res->bindParam(':idE', $_POST['idE'], PDO::PARAM_INT); // Evita la inyección SQL
    $res->execute();
    $res = $res->fetch(PDO::FETCH_ASSOC);

    // Verificar si se encontraron datos
    if (!$res) {
        echo json_encode(['error' => 'No se encontraron datos para el ID proporcionado']);
        exit();
    }

    $fecha = separarFecha("2025-03-09");
    if (!$fecha) {
        echo json_encode(['error' => 'Fecha inválida']);
        exit();
    }

    // Crear un TemplateProcessor de PHPWord
    $templateProcessor = new TemplateProcessor($filePath);

    // Aplicamos las transformaciones a cada valor individualmente antes de concatenarlos
    $nombreCompleto = capitalizarCadaPalabra($res['apellido']) . " " . capitalizarCadaPalabra($res['nombre']);
    $nombreCompletoUpper = strtoupper(trim($res['apellido'])) . " " . strtoupper(trim($res['nombre']));
    $ciudadCapitalizada = capitalizarCadaPalabra($res['ciudad']);

    // Reemplazar las palabras clave con sus valores
    $templateProcessor->setValue('NOMBRE', $nombreCompleto);
    $templateProcessor->setValue('NOMBRECOMPLETO', $nombreCompletoUpper);
    $templateProcessor->setValue('DNI', formatearDNI($res['cedula']));
    $templateProcessor->setValue('YEAR', $fecha['año']);
    $templateProcessor->setValue('MES', $fecha['mes']);
    $templateProcessor->setValue('DIA', $fecha['dia']);
    $templateProcessor->setValue('DOMICILIO', $res['domicilio']);
    $templateProcessor->setValue('NRODOM', $res['nroDom']);
    $templateProcessor->setValue('CIUDAD', $ciudadCapitalizada);
    $templateProcessor->setValue('MT', $res['mt2']);
    $templateProcessor->setValue('NROGRUPO', $res['nroCuenta']);

    // Verificar si el archivo ya existe y eliminarlo si es necesario
    $modifiedFilePath = 'uploads/cm.docx';
    if (file_exists($modifiedFilePath)) {
        unlink($modifiedFilePath);  // Elimina el archivo si ya existe
    }

    // Guardar el archivo modificado
    $templateProcessor->saveAs($modifiedFilePath);

    // Responder con la ruta del archivo modificado para que pueda ser descargado
    echo json_encode(['filePath' => $nombreCompletoUpper.$res['mt2']."mt2"]);
}
?>
