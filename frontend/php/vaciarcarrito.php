<?php
session_start();

// Vaciar el carrito (eliminar la variable de sesión)
unset($_SESSION['carrito']);

if (!isset($_SESSION['carrito'])) {
    echo json_encode(array('message' => 'Carrito vaciado'));
} else {
    echo json_encode(array('message' => 'Error al vaciar el carrito'));
}
?>
