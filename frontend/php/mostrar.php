<?php
include "conexion.php";

$res = $con->query("SELECT * FROM producto");
$reg = $res->fetchAll(PDO::FETCH_ASSOC);

header("Content-Type: application/json");
echo json_encode($reg, JSON_PRETTY_PRINT);

?>