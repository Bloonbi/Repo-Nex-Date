<?php
session_start();
require 'conexion.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST['email'];
    $password = $_POST['password'];

    $sql = "SELECT * FROM cliente WHERE Email = :email";
    $stmt = $con->prepare($sql);
    $stmt->execute(['email' => $email]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);


    if ($password == $user['Password']) {
        $_SESSION['user_id'] = $user['id'];
        $_SESSION['is_admin'] = $user['is_admin'];
        $_SESSION['usuario'] = $user['email'];
        header('Location: user.php');
        exit();
    } else {
        echo 'Email o contraseña incorrectos.';
    }

}
?>