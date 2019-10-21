-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-10-2019 a las 00:21:41
-- Versión del servidor: 10.1.32-MariaDB
-- Versión de PHP: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd santo tomas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargos`
--

CREATE TABLE `cargos` (
  `Id Cargo` int(11) NOT NULL,
  `Nombre Cargo` varchar(30) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `cargos`
--

INSERT INTO `cargos` (`Id Cargo`, `Nombre Cargo`) VALUES
(1, 'Coordinador '),
(2, 'Auxiliar Tic');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dependencias`
--

CREATE TABLE `dependencias` (
  `Id Dependencia` int(11) NOT NULL,
  `Nombre Dependencia` varchar(100) COLLATE utf8_bin NOT NULL,
  `Extensión` varchar(4) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `dependencias`
--

INSERT INTO `dependencias` (`Id Dependencia`, `Nombre Dependencia`, `Extensión`) VALUES
(1, 'Sistemas y TIC', '4120');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles corporativos`
--

CREATE TABLE `detalles corporativos` (
  `Id Detalles Corporativos` int(11) NOT NULL,
  `Id Dependencia` int(11) NOT NULL,
  `Id Cargo` int(11) NOT NULL,
  `E-mail Corporativo` varchar(100) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `detalles corporativos`
--

INSERT INTO `detalles corporativos` (`Id Detalles Corporativos`, `Id Dependencia`, `Id Cargo`, `E-mail Corporativo`) VALUES
(1, 1, 1, 'coord.ticvillavo@usantotomas.e');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `información personal`
--

CREATE TABLE `información personal` (
  `Id Información Personal` int(11) NOT NULL,
  `Id Detalles Corporativos` int(11) NOT NULL,
  `N° Documento` varchar(20) COLLATE utf8_bin NOT NULL,
  `Nombres` varchar(30) COLLATE utf8_bin NOT NULL,
  `Apellidos` varchar(30) COLLATE utf8_bin NOT NULL,
  `Teléfono` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `E-mail` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `R-H` varchar(3) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `información personal`
--

INSERT INTO `información personal` (`Id Información Personal`, `Id Detalles Corporativos`, `N° Documento`, `Nombres`, `Apellidos`, `Teléfono`, `E-mail`, `R-H`) VALUES
(1, 1, '123456789', 'Jorge Alberto ', 'Ojeda Cortes', '3107792688', NULL, 'AB+');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cargos`
--
ALTER TABLE `cargos`
  ADD PRIMARY KEY (`Id Cargo`);

--
-- Indices de la tabla `dependencias`
--
ALTER TABLE `dependencias`
  ADD PRIMARY KEY (`Id Dependencia`);

--
-- Indices de la tabla `detalles corporativos`
--
ALTER TABLE `detalles corporativos`
  ADD PRIMARY KEY (`Id Detalles Corporativos`),
  ADD KEY `Id Dependencia` (`Id Dependencia`),
  ADD KEY `Id Cargo` (`Id Cargo`);

--
-- Indices de la tabla `información personal`
--
ALTER TABLE `información personal`
  ADD PRIMARY KEY (`Id Información Personal`),
  ADD KEY `Id Detalles Corporativos` (`Id Detalles Corporativos`),
  ADD KEY `Id Detalles Corporativos_2` (`Id Detalles Corporativos`),
  ADD KEY `N° Documento` (`N° Documento`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cargos`
--
ALTER TABLE `cargos`
  MODIFY `Id Cargo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `dependencias`
--
ALTER TABLE `dependencias`
  MODIFY `Id Dependencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `detalles corporativos`
--
ALTER TABLE `detalles corporativos`
  MODIFY `Id Detalles Corporativos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `información personal`
--
ALTER TABLE `información personal`
  MODIFY `Id Información Personal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalles corporativos`
--
ALTER TABLE `detalles corporativos`
  ADD CONSTRAINT `detalles corporativos_ibfk_1` FOREIGN KEY (`Id Cargo`) REFERENCES `cargos` (`Id Cargo`),
  ADD CONSTRAINT `detalles corporativos_ibfk_2` FOREIGN KEY (`Id Dependencia`) REFERENCES `dependencias` (`Id Dependencia`);

--
-- Filtros para la tabla `información personal`
--
ALTER TABLE `información personal`
  ADD CONSTRAINT `información personal_ibfk_1` FOREIGN KEY (`Id Detalles Corporativos`) REFERENCES `detalles corporativos` (`Id Detalles Corporativos`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
