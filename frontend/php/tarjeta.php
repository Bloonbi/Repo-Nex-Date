<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../vistas/css/style.css">
    <title>Cafeteria Imperial</title>
</head>
<body>
    <div id="navegacion">
        <div id="logo">
            <img src="../vistas/img/Logos/logo.png" alt="CafeteriaImperial" id="imagen-logo">
        </div>
        <div id="menu">
            <a href="../pages/productos.html">Productos</a>
            <a href="../pages/locales.html">Locales</a>
            <a href="../pages/aboutus.html">Sobre Nosotros</a>
        </div>
        <div id="buscar">
            <input type="text" id="producto" placeholder="Buscar producto">
            <button type="submit" id="boton1">Buscar</button>
        </div>
        <div id="loginprincipal">
            <a href="../pages/login.html">Ingresar</a>
        </div>
        <div id="registerprincipal">
            <a href="../pages/register.html">Registrarse</a>
        </div>
    </div>

    <div id="contenido">
        <div class="contenedor">
            <?php
            require "conexion.php";

            $query = "SELECT * FROM producto";
            $stmt = $con->query($query);

            if ($stmt) {
                while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                    ?>
                    <div class="tarjeta">
                        <img class="img" src="../vistas/img/Producto/<?= $row['Foto'] ?>" alt="<?= $row['Nombre'] ?>">
                        <h3><?= $row['Nombre'] ?></h3>
                        <p><?= $row['Descripcion'] ?></p>
                        <p>Precio: $<?= $row['Precio'] ?></p>
                        <button onclick="agregarAlCarrito(<?= $row['Id_Producto'] ?>, '<?= $row['Nombre'] ?>', <?= $row['Precio'] ?>)">Agregar al Carrito</button>
                    </div><br>
                    <?php
                }
            } else {
                echo "No hay productos disponibles.";
            }

            $con = null;
            ?>
        </div>
    </div>

    <div id="carrito">
        <h2>Carrito de Compras</h2>
        <ul id="lista-carrito"></ul>
        <p>Total: $<span id="total-carrito">0.00</span></p>
        <button onclick="vaciarCarrito()">Vaciar Carrito</button>
        <a href="cart.php">Ir al Carrito</a>
    </div>

    <script src="../vistas/js/search.js"></script>
    <script>
        function agregarAlCarrito(idProducto, nombreProducto, precioProducto) {
            let xhr = new XMLHttpRequest();
            xhr.open('POST', 'agregaralcarrito.php', true);
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            xhr.onload = function () {
                if (xhr.status === 200) {
                    actualizarCarrito();
                } else {
                    alert('Error al agregar producto al carrito');
                }
            };
            xhr.send(`id=${idProducto}&nombre=${nombreProducto}&precio=${precioProducto}`);
        }

        function actualizarCarrito() {
            let xhr = new XMLHttpRequest();
            xhr.open('GET', 'obtenercarrito.php', true);
            xhr.onload = function () {
                if (xhr.status === 200) {
                    let carrito = JSON.parse(xhr.responseText);
                    mostrarCarrito(carrito);
                } else {
                    console.error('Error al obtener el carrito');
                }
            };
            xhr.send();
        }

        function mostrarCarrito(carrito) {
            let listaCarrito = document.getElementById('lista-carrito');
            let totalCarrito = document.getElementById('total-carrito');
            listaCarrito.innerHTML = '';
            totalCarrito.textContent = carrito.total;

            carrito.items.forEach(item => {
                let li = document.createElement('li');
                li.textContent = `${item.nombre} - $${item.precio}`;
                listaCarrito.appendChild(li);
            });
        }

        function vaciarCarrito() {
            let xhr = new XMLHttpRequest();
            xhr.open('GET', 'vaciarcarrito.php', true);
            xhr.onload = function () {
                if (xhr.status === 200) {
                    mostrarCarrito({ items: [], total: '0.00' });
                } else {
                    console.error('Error al vaciar el carrito');
                }
            };
            xhr.send();
        }

        actualizarCarrito();
    </script>

</body>
</html>
