<?php
session_start();

require "conexion.php";

if (isset($_SESSION['carrito'])) {
    $carrito = array(
        'items' => $_SESSION['carrito'],
        'total' => calcularTotalCarrito($_SESSION['carrito'])
    );

    echo json_encode($carrito);
} else {
    echo json_encode(array('items' => array(), 'total' => '0.00'));
}

function calcularTotalCarrito($carrito) {
    $total = 0;
    foreach ($carrito as $producto) {
        $total += $producto['precio'] * $producto['cantidad'];
    }
    return number_format($total, 2);
}
?>
