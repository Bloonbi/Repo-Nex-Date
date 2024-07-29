<?php
session_start();

if (!isset($_SESSION['carrito'])) {
    $_SESSION['carrito'] = array();
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['update'])) {
        if (!empty($_SESSION['carrito'])) {
            foreach ($_POST['cantidad'] as $id => $cantidad) {
                $cantidad = (int)$cantidad;

                if ($cantidad > 0) {
                    foreach ($_SESSION['carrito'] as &$producto) {
                        if ($producto['id'] == $id) {
                            $producto['cantidad'] = $cantidad;
                            break;
                        }
                    }
                    unset($producto);
                }
            }
        }
    } elseif (isset($_POST['vaciar'])) {
        $_SESSION['carrito'] = array();
    }
}

if (isset($_SESSION['carrito']) && !empty($_SESSION['carrito'])) {
    $totalCompra = 0;
    ?>
    <!DOCTYPE html>
    <html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Carrito de Compras</title>
        <link rel="stylesheet" href="../vistas/css/style-carrito.css">
    </head>
    <body>
        <h2>Carrito de Compras</h2>
        <form action="" method="post">
            <table>
                <thead>
                    <tr>
                        <th>Producto</th>
                        <th>Precio Unitario</th>
                        <th>Cantidad</th>
                        <th>Total por Producto</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    foreach ($_SESSION['carrito'] as $producto) {
                        $subtotal = $producto['precio'] * $producto['cantidad'];
                        $totalCompra += $subtotal;
                        ?>
                        <tr>
                            <td><?= htmlspecialchars($producto['nombre']) ?></td>
                            <td>$<?= htmlspecialchars($producto['precio']) ?></td>
                            <td>
                                <input type="number" name="cantidad[<?= htmlspecialchars($producto['id']) ?>]" value="<?= htmlspecialchars($producto['cantidad']) ?>" min="1">
                            </td>
                            <td>$<?= number_format($subtotal, 2) ?></td>
                        </tr>
                        <?php
                    }
                    ?>
                    <tr class="total">
                        <td colspan="3">Total:</td>
                        <td>$<?= number_format($totalCompra, 2) ?></td>
                    </tr>
                </tbody>
            </table>
            <button type="submit" name="update" class="update-button">Actualizar Carrito</button>
            <button type="submit" name="vaciar" class="empty-button">Vaciar Carrito</button>
        </form>
        <a href="tarjeta.php">Seguir Comprando</a>
    </body>
    </html>
    <?php
} else {
    ?>
    <!DOCTYPE html>
    <html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Carrito de Compras</title>
        <link rel="stylesheet" href="../vistas/css/style-carrito.css">
    </head>
    <body>
        <h2>Carrito de Compras</h2>
        <p class="empty-cart">No hay productos en el carrito.</p>
        <a href="tarjeta.php">Seguir Comprando</a>
    </body>
    </html>
    <?php
}
?>
