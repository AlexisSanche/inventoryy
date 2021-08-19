-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-05-2021 a las 05:34:17
-- Versión del servidor: 10.1.40-MariaDB
-- Versión de PHP: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tiendita`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id` int(11) NOT NULL,
  `nombreCat` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id`, `nombreCat`) VALUES
(14, 'Enlatados'),
(21, 'Aceites');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_producto_proveedor`
--

CREATE TABLE `detalle_producto_proveedor` (
  `id` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `idProveedor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `detalle_producto_proveedor`
--

INSERT INTO `detalle_producto_proveedor` (`id`, `idProducto`, `idProveedor`) VALUES
(31, 51, 18);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login`
--

CREATE TABLE `login` (
  `IDlogin` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `pwd` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `login`
--

INSERT INTO `login` (`IDlogin`, `email`, `pwd`) VALUES
(4, 'alexis ', '12345');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `idProducto` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `fecha_alta` date NOT NULL,
  `idCategoria` int(11) NOT NULL,
  `existencia` int(11) NOT NULL,
  `foto` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idProducto`, `nombre`, `precio`, `fecha_alta`, `idCategoria`, `existencia`, `foto`) VALUES
(51, 'Aceitunas', '8.00', '2020-07-15', 14, 20, 'productos/Aceitunas11148.jpeg'),
(52, 'Chícharo con zanahoria', '9.50', '2020-07-15', 14, 40, 'productos/Chícharo con zanahoria7501017005826.jpg'),
(53, 'Frijoles enlatados', '10.00', '2020-07-15', 14, 20, 'productos/Frijoles enlatadosíndice.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id` int(11) NOT NULL,
  `nombrePro` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id`, `nombrePro`) VALUES
(18, 'GRUPO CORVI'),
(25, 'bimbo');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle_producto_proveedor`
--
ALTER TABLE `detalle_producto_proveedor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_prov_idx` (`idProveedor`),
  ADD KEY `fk_prod_idx` (`idProducto`);

--
-- Indices de la tabla `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`IDlogin`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`idProducto`),
  ADD KEY `fk_CatPro_idx` (`idCategoria`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `detalle_producto_proveedor`
--
ALTER TABLE `detalle_producto_proveedor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `login`
--
ALTER TABLE `login`
  MODIFY `IDlogin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `idProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_producto_proveedor`
--
ALTER TABLE `detalle_producto_proveedor`
  ADD CONSTRAINT `fk_prod` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_prov` FOREIGN KEY (`idProveedor`) REFERENCES `proveedores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `fk_CatPro` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
