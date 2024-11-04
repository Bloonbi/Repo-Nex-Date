-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-10-2024 a las 22:58:35
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cafee`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `cargo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `admins`
--

INSERT INTO `admins` (`id`, `nombre`, `email`, `password`, `cargo`) VALUES
(3, 'mag', 'mag@gmail.com', '$2y$10$LOX12SZ5d68n6FWOp65bgu/u9ugglUfBriBZJ3XqlxNNGMxNEV08e', 'nose');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito_compra`
--

CREATE TABLE `carrito_compra` (
  `id` int(11) NOT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `fchReg` date DEFAULT NULL,
  `idCliente` int(50) DEFAULT NULL,
  `idProducto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `telefono` int(20) NOT NULL,
  `fchReg` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `nombre`, `email`, `password`, `direccion`, `telefono`, `fchReg`) VALUES
(1, 'Maga', 'mag@gmail.com', '$2y$10$Iksy5t70conZwHXv.CZK3uZ3cIvrZlkRFwUhx5aPMXF0ZnqNDkwra', 'San luis', 21313, '2024-10-14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE `compra` (
  `id` int(11) NOT NULL,
  `direcEnvio` varchar(255) DEFAULT NULL,
  `fchCompra` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consulta`
--

CREATE TABLE `consulta` (
  `id` int(11) NOT NULL,
  `tipo` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `fchConsulta` date DEFAULT NULL,
  `idCliente` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idProd` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `cantidad` int(50) DEFAULT NULL,
  `imagen` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idProd`, `nombre`, `descripcion`, `precio`, `cantidad`, `imagen`) VALUES
(20, 'Café Negro', 'Granos de café.', 330.00, 3000, 'uploads/cafe negro.jpg'),
(21, 'Café Cortado', 'Café cortado con leche.', 200.00, 2445, 'uploads/cafe cortado o con leche.jpg'),
(22, 'Latte', 'Es uno o dos shots de expresso con leche al vapor y una fina capa de leche espumosa encima.', 123.00, 5455, 'uploads/latte.jpeg'),
(23, 'Cappuchino', 'Un shot de expresso y mucha leche al vapor y espuma.', 134.00, 3453, 'uploads/cafe capuchino.jpg'),
(24, 'Macchiato', '', 343.00, 2324, 'uploads/macchiato.jpg'),
(25, 'Frappuchino', 'Frappe y Cappuchino, es un café expreso con espuma de leche. ', 343.00, 3443, 'uploads/frapuchino.jpg'),
(26, 'Café Turco', 'Café molido finamente, agua fría y (si se desea) azúcar.', 465.00, 56, 'uploads/cafe turco.jpg'),
(27, 'Café Romano', 'Es un expresso con jugo de limón, servido con una rodaja de limón.', 234.00, 3234, 'uploads/cafe romano.webp'),
(37, 'Café Irlandés', 'Contiene café suave, whisky irlandés, azúcar y por arriba crema.', 242.00, 3244, 'uploads/Cafe irlandes.webp'),
(38, 'Moka', 'Contiene expresso, chocolate en polvo con leche o crema.', 234.00, 2342, 'uploads/moca.jfif'),
(39, 'Moka Con Menta', 'Contiene expresso, chocolate en polvo con leche o crema y menta.', 343.00, 3443, 'uploads/moca con menta.jpg'),
(40, 'Chocolate Caliente', 'Chocolate o cacao en polvo con leche.', 656.00, 5656, 'uploads/chocolate caliente.webp'),
(41, 'Chocolate Caliente Con Merengue', 'Chocolate o cacao en polvo con leche y por arriba. tiene merengue', 676.00, 6755, 'uploads/chocolate caliente con merengue 1.jpg'),
(42, 'Café Lágrima', 'Lleva muy poco café y mucha leche en espuma.', 454.00, 6765, 'uploads/cafe lagrima.webp'),
(43, 'Café Submarino', 'Tiene una barra de chocolate dentro de una taza de leche caliente.', 454.00, 5656, 'uploads/cafe submarino.jpg'),
(44, 'Café Helado', 'Es café con leche frío con una bocha de helado por arriba y salsa a tu gusto.', 343.00, 4656, 'uploads/cafe helado.jpg'),
(45, 'Té Negro', 'Tiene hojas fermentadas de la planta Camellia sinensis y se le agrega agua caliente y azúcar.', 231.00, 2313, 'uploads/te negro.webp'),
(46, 'Té De Manzanilla', 'Contiene una planta con flores de blancos pétalos, agua caliente y azúcar.', 545.00, 6767, 'uploads/te manzanilla.jfif'),
(47, 'Té Maracuyá', 'Tiene maracuyá, agua caliente y azúcar.', 123.00, 2313, 'uploads/te maracuya.jpg'),
(48, 'Macha Verde', 'Es un té verde que se ha sombreado intencionalmente y luego se muele con piedra hasta obtener un polvo fino.', 234.00, 3435, 'uploads/macha.webp'),
(49, 'Licuado De Kiwi', 'Tiene kiwi y azúcar.', 123.00, 2323, 'uploads/licuado kiwi.webp'),
(52, 'Licuado De Frutilla', 'Tiene frutilla y azúcar.', 122.00, 4342, 'uploads/licuado frutilla.webp'),
(53, 'Licuado Multifruta', 'Contiene  mango, ananá pera, banana y azúcar.', 231.00, 3211, 'uploads/licuado multifruta.png'),
(54, 'Limonada', 'Tiene limón , agua y azúcar.', 447.00, 3443, 'uploads/limonada.jpg'),
(55, 'Jugo De Ananá', 'Tiene ananá y azúcar.', 324.00, 3433, 'uploads/jugo anana.jpg'),
(56, 'Jugo De Mango', 'Tiene mango y azúcar.', 456.00, 5443, 'uploads/jugo mango.jpg'),
(57, 'Jugo De Naranja', 'Tiene naranja y azúcar.', 546.00, 6566, 'uploads/jugo de naranja.jpg'),
(58, 'Jugo De Naranja Y Zanahoria', 'Contiene naranja, zanahoria y azúcar.', 566.00, 5544, 'uploads/jugo de naranja y zanahoria.jpg'),
(59, 'Jugo De Durzano', 'Tiene durazno y azúcar.', 353.00, 4355, 'uploads/jugo durazno.avif'),
(60, 'Jugo De Frutilla', 'Tiene frutilla y azúcar.', 453.00, 3455, 'uploads/frutilla 1.png'),
(61, 'Jugo De Uva', 'Tiene uva y azúcar.', 342.00, 3424, 'uploads/licuado uva.webp'),
(62, 'Jugo De Mora', 'Tiene mora y azúcar.', 345.00, 4535, 'uploads/jugo mora.webp'),
(63, 'Chocolate Caliente Con Frutilla', 'Chocolate caliente o cacao en polvo con leche y frutilla.', 234.00, 3442, 'uploads/chocolate con frutilla.jpg'),
(64, 'Frappé De Oreo', 'Contiene crema mezclada con leche, salsa de chocolate y hielo, cubierto con crema batida, salsa de chocolate y una oreo arriba.', 355.00, 453, 'uploads/frappe de oreo.jpg'),
(65, 'Frappé De Frutilla', ' Contiene crema mezclada con leche, salsa de fresa y hielo, cubierto con crema batida, salsa de frutilla, un barquillo y una frutilla arriba.', 454.00, 3534, 'uploads/frappe frutilla.png');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Email` (`email`);

--
-- Indices de la tabla `carrito_compra`
--
ALTER TABLE `carrito_compra`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Id_Cliente` (`idCliente`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Email` (`email`);

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `consulta`
--
ALTER TABLE `consulta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Id_Cliente` (`idCliente`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idProd`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `carrito_compra`
--
ALTER TABLE `carrito_compra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `compra`
--
ALTER TABLE `compra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `consulta`
--
ALTER TABLE `consulta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idProd` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carrito_compra`
--
ALTER TABLE `carrito_compra`
  ADD CONSTRAINT `carrito_compra_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`id`);

--
-- Filtros para la tabla `consulta`
--
ALTER TABLE `consulta`
  ADD CONSTRAINT `consulta_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
