<?php
session_start();

require "conexion.php";

if (isset($_POST['id']) && isset($_POST['nombre']) && isset($_POST['precio'])) {
    $id = $_POST['id'];
    $nombre = $_POST['nombre'];
    $precio = $_POST['precio'];

    // Iniciar el carrito si no existe en la sesión
    if (!isset($_SESSION['carrito'])) {
        $_SESSION['carrito'] = array();
    }

    // Verificar si el producto ya está en el carrito
    $producto_existente = false;
    foreach ($_SESSION['carrito'] as &$producto) {
        if ($producto['id'] == $id) {
            $producto['cantidad']++;
            $producto_existente = true;
            break;
        }
    }

    // Si el producto no está en el carrito, agregarlo
    if (!$producto_existente) {
        $_SESSION['carrito'][] = array(
            'id' => $id,
            'nombre' => $nombre,
            'precio' => $precio,
            'cantidad' => 1
        );
    }

    echo json_encode(array('message' => 'Producto agregado al carrito'));
} else {
    echo json_encode(array('message' => 'Error al agregar producto al carrito'));
}
?>
