<?php
session_start();
header('Content-Type: application/json');
include "conexion.php";

error_reporting(E_ALL);
ini_set('display_errors', 1);

//$action = isset($_POST['action']) ? $_POST['action'] : null;
$name = $_POST['name'];
$email = $_POST['email'];
$password = $_POST['password'];
$address = $_POST['address'];
$phone = $_POST['phone'];
$date = date('Y-m-d');

    if (!$name || !$email || !$password || !$address || !$phone) {
        echo json_encode(['error' => 'Todos los campos son requeridos']);
        exit();
    }


    $password_hashed = password_hash($password, PASSWORD_BCRYPT);

    try {

        $stmt = $con->prepare("INSERT INTO cliente (Nombre, Email, Password, Direccion, Telefono, Fecha_registro) VALUES (:nombre, :email, :password, :address, :phone, :date)");
        $stmt->bindParam(':nombre', $name);
        $stmt->bindParam(':email', $email);
        $stmt->bindParam(':password', $password_hashed);
        $stmt->bindParam(':address', $address);
        $stmt->bindParam(':phone', $phone);
        $stmt->bindParam(':date', $date);
        $stmt->execute();

        $stmt = $con->prepare("SELECT * FROM cliente WHERE Email = :email");
        $stmt->bindParam(':email', $email);
        $stmt->execute();
        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        $_SESSION['cliente'] = $user['Nombre'];
        $_SESSION['idc'] = $user['Id_Cliente'];
        echo json_encode(['success' => 'Usuario creado correctamente', 'user' => $user]);
    } catch (PDOException $e) {
        echo json_encode(['error' => 'Error en la consulta: ' . $e->getMessage()]);
    }
//} else {
//    echo json_encode(['error' => 'Acción no válida']);
//}
?>

