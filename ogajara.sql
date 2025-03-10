-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-03-2025 a las 05:01:21
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ogajara`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nroCuenta` varchar(50) NOT NULL,
  `cedula` varchar(50) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `domicilio` varchar(100) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `email` varchar(150) NOT NULL,
  `nroDom` int(11) NOT NULL,
  `ciudad` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nroCuenta`, `cedula`, `nombre`, `apellido`, `domicilio`, `telefono`, `email`, `nroDom`, `ciudad`) VALUES
(1, '001002', '2036798', 'Franco Matias', 'Mereles', 'Molaz Lopez', '37185058133', '', 0, ''),
(2, '001-001', '6935312', 'Mica', 'Miranda', 'Mariscal Lopez', '37189128734', '', 0, ''),
(3, '002-001', '576583', 'Sani', 'Gonzalez', 'Molaz', '2309488', '', 0, ''),
(4, '001-002', '6935238', 'Maximiliano', 'Cardozo', 'Molaz', '828374', '', 0, ''),
(5, '001-003', '30193876', 'Cristian', 'Figueredo', 'Molaz', '2394823', '', 0, ''),
(6, '001-004', '3030', 'Sergio', 'Masn', 'asdsad', '12321', '', 0, ''),
(8, '001-005', '42634753', 'francisco', 'gonzalez', 'italia', '3718563124', 'francisco.goonzalez99@gmail.com', 3350, 'clorinda');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `egresos`
--

CREATE TABLE `egresos` (
  `id` int(11) NOT NULL,
  `monto` int(11) NOT NULL,
  `detalle` text NOT NULL,
  `fecha` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `egresos`
--

INSERT INTO `egresos` (`id`, `monto`, `detalle`, `fecha`) VALUES
(1, 300000, 'Cemento', '2025-03-05'),
(2, 200000, 'Chapas', '2025-03-05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadocuenta`
--

CREATE TABLE `estadocuenta` (
  `id` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL,
  `mt2` int(11) NOT NULL,
  `cuotas` int(11) NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estadocuenta`
--

INSERT INTO `estadocuenta` (`id`, `idCliente`, `mt2`, `cuotas`, `estado`) VALUES
(1, 1, 50, 36, 0),
(2, 3, 50, 36, 0),
(3, 3, 50, 36, 0),
(4, 2, 50, 36, 0),
(5, 3, 50, 36, 0),
(6, 4, 50, 36, 0),
(7, 5, 50, 36, 0),
(8, 8, 100, 36, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadocuotas`
--

CREATE TABLE `estadocuotas` (
  `id` int(11) NOT NULL,
  `idEstadoCuenta` int(11) NOT NULL,
  `nroCuota` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  `vencimiento` date DEFAULT NULL,
  `fechaPago` date DEFAULT NULL,
  `metodoPago` varchar(30) NOT NULL,
  `idUser` int(11) NOT NULL,
  `verificacion` varchar(10) NOT NULL DEFAULT 'pendiente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estadocuotas`
--

INSERT INTO `estadocuotas` (`id`, `idEstadoCuenta`, `nroCuota`, `total`, `estado`, `vencimiento`, `fechaPago`, `metodoPago`, `idUser`, `verificacion`) VALUES
(1, 1, 1, 760000, 1, '2025-04-05', '2025-03-05', 'efectivo', 3, 'aprobado'),
(2, 1, 2, 760000, 0, '2025-05-05', NULL, '', 0, 'pendiente'),
(3, 1, 3, 760000, 0, '2025-06-05', NULL, '', 0, 'pendiente'),
(4, 1, 4, 760000, 0, '2025-07-05', NULL, '', 0, 'pendiente'),
(5, 1, 5, 760000, 0, '2025-08-05', NULL, '', 0, 'pendiente'),
(6, 1, 6, 760000, 0, '2025-09-05', NULL, '', 0, 'pendiente'),
(7, 1, 7, 760000, 0, '2025-10-05', NULL, '', 0, 'pendiente'),
(8, 1, 8, 760000, 0, '2025-11-05', NULL, '', 0, 'pendiente'),
(9, 1, 9, 760000, 0, '2025-12-05', NULL, '', 0, 'pendiente'),
(10, 1, 10, 760000, 0, '2026-01-05', NULL, '', 0, 'pendiente'),
(11, 1, 11, 760000, 0, '2026-02-05', NULL, '', 0, 'pendiente'),
(12, 1, 12, 760000, 0, '2026-03-05', NULL, '', 0, 'pendiente'),
(13, 1, 13, 760000, 0, '2026-04-05', NULL, '', 0, 'pendiente'),
(14, 1, 14, 760000, 0, '2026-05-05', NULL, '', 0, 'pendiente'),
(15, 1, 15, 760000, 0, '2026-06-05', NULL, '', 0, 'pendiente'),
(16, 1, 16, 760000, 0, '2026-07-05', NULL, '', 0, 'pendiente'),
(17, 1, 17, 760000, 0, '2026-08-05', NULL, '', 0, 'pendiente'),
(18, 1, 18, 760000, 0, '2026-09-05', NULL, '', 0, 'pendiente'),
(19, 1, 19, 760000, 0, '2026-10-05', NULL, '', 0, 'pendiente'),
(20, 1, 20, 760000, 0, '2026-11-05', NULL, '', 0, 'pendiente'),
(21, 1, 21, 760000, 0, '2026-12-05', NULL, '', 0, 'pendiente'),
(22, 1, 22, 760000, 0, '2027-01-05', NULL, '', 0, 'pendiente'),
(23, 1, 23, 760000, 0, '2027-02-05', NULL, '', 0, 'pendiente'),
(24, 1, 24, 760000, 0, '2027-03-05', NULL, '', 0, 'pendiente'),
(25, 1, 25, 760000, 0, '2027-04-05', NULL, '', 0, 'pendiente'),
(26, 1, 26, 760000, 0, '2027-05-05', NULL, '', 0, 'pendiente'),
(27, 1, 27, 760000, 0, '2027-06-05', NULL, '', 0, 'pendiente'),
(28, 1, 28, 760000, 0, '2027-07-05', NULL, '', 0, 'pendiente'),
(29, 1, 29, 760000, 0, '2027-08-05', NULL, '', 0, 'pendiente'),
(30, 1, 30, 760000, 0, '2027-09-05', NULL, '', 0, 'pendiente'),
(31, 1, 31, 760000, 0, '2027-10-05', NULL, '', 0, 'pendiente'),
(32, 1, 32, 760000, 0, '2027-11-05', NULL, '', 0, 'pendiente'),
(33, 1, 33, 760000, 0, '2027-12-05', NULL, '', 0, 'pendiente'),
(34, 1, 34, 760000, 0, '2028-01-05', NULL, '', 0, 'pendiente'),
(35, 1, 35, 760000, 0, '2028-02-05', NULL, '', 0, 'pendiente'),
(36, 1, 36, 760000, 0, '2028-03-05', NULL, '', 0, 'pendiente'),
(37, 2, 1, 760000, 0, '2025-04-05', NULL, '', 0, 'pendiente'),
(38, 2, 2, 760000, 0, '2025-05-05', NULL, '', 0, 'pendiente'),
(39, 2, 3, 760000, 0, '2025-06-05', NULL, '', 0, 'pendiente'),
(40, 2, 4, 760000, 0, '2025-07-05', NULL, '', 0, 'pendiente'),
(41, 2, 5, 760000, 0, '2025-08-05', NULL, '', 0, 'pendiente'),
(42, 2, 6, 760000, 0, '2025-09-05', NULL, '', 0, 'pendiente'),
(43, 2, 7, 760000, 0, '2025-10-05', NULL, '', 0, 'pendiente'),
(44, 2, 8, 760000, 0, '2025-11-05', NULL, '', 0, 'pendiente'),
(45, 2, 9, 760000, 0, '2025-12-05', NULL, '', 0, 'pendiente'),
(46, 2, 10, 760000, 0, '2026-01-05', NULL, '', 0, 'pendiente'),
(47, 2, 11, 760000, 0, '2026-02-05', NULL, '', 0, 'pendiente'),
(48, 2, 12, 760000, 0, '2026-03-05', NULL, '', 0, 'pendiente'),
(49, 2, 13, 760000, 0, '2026-04-05', NULL, '', 0, 'pendiente'),
(50, 2, 14, 760000, 0, '2026-05-05', NULL, '', 0, 'pendiente'),
(51, 2, 15, 760000, 0, '2026-06-05', NULL, '', 0, 'pendiente'),
(52, 2, 16, 760000, 0, '2026-07-05', NULL, '', 0, 'pendiente'),
(53, 2, 17, 760000, 0, '2026-08-05', NULL, '', 0, 'pendiente'),
(54, 2, 18, 760000, 0, '2026-09-05', NULL, '', 0, 'pendiente'),
(55, 2, 19, 760000, 0, '2026-10-05', NULL, '', 0, 'pendiente'),
(56, 2, 20, 760000, 0, '2026-11-05', NULL, '', 0, 'pendiente'),
(57, 2, 21, 760000, 0, '2026-12-05', NULL, '', 0, 'pendiente'),
(58, 2, 22, 760000, 0, '2027-01-05', NULL, '', 0, 'pendiente'),
(59, 2, 23, 760000, 0, '2027-02-05', NULL, '', 0, 'pendiente'),
(60, 2, 24, 760000, 0, '2027-03-05', NULL, '', 0, 'pendiente'),
(61, 2, 25, 760000, 0, '2027-04-05', NULL, '', 0, 'pendiente'),
(62, 2, 26, 760000, 0, '2027-05-05', NULL, '', 0, 'pendiente'),
(63, 2, 27, 760000, 0, '2027-06-05', NULL, '', 0, 'pendiente'),
(64, 2, 28, 760000, 0, '2027-07-05', NULL, '', 0, 'pendiente'),
(65, 2, 29, 760000, 0, '2027-08-05', NULL, '', 0, 'pendiente'),
(66, 2, 30, 760000, 0, '2027-09-05', NULL, '', 0, 'pendiente'),
(67, 2, 31, 760000, 0, '2027-10-05', NULL, '', 0, 'pendiente'),
(68, 2, 32, 760000, 0, '2027-11-05', NULL, '', 0, 'pendiente'),
(69, 2, 33, 760000, 0, '2027-12-05', NULL, '', 0, 'pendiente'),
(70, 2, 34, 760000, 0, '2028-01-05', NULL, '', 0, 'pendiente'),
(71, 2, 35, 760000, 0, '2028-02-05', NULL, '', 0, 'pendiente'),
(72, 2, 36, 760000, 0, '2028-03-05', NULL, '', 0, 'pendiente'),
(73, 3, 1, 760000, 0, '2025-04-05', NULL, '', 0, 'pendiente'),
(74, 3, 2, 760000, 0, '2025-05-05', NULL, '', 0, 'pendiente'),
(75, 3, 3, 760000, 0, '2025-06-05', NULL, '', 0, 'pendiente'),
(76, 3, 4, 760000, 0, '2025-07-05', NULL, '', 0, 'pendiente'),
(77, 3, 5, 760000, 0, '2025-08-05', NULL, '', 0, 'pendiente'),
(78, 3, 6, 760000, 0, '2025-09-05', NULL, '', 0, 'pendiente'),
(79, 3, 7, 760000, 0, '2025-10-05', NULL, '', 0, 'pendiente'),
(80, 3, 8, 760000, 0, '2025-11-05', NULL, '', 0, 'pendiente'),
(81, 3, 9, 760000, 0, '2025-12-05', NULL, '', 0, 'pendiente'),
(82, 3, 10, 760000, 0, '2026-01-05', NULL, '', 0, 'pendiente'),
(83, 3, 11, 760000, 0, '2026-02-05', NULL, '', 0, 'pendiente'),
(84, 3, 12, 760000, 0, '2026-03-05', NULL, '', 0, 'pendiente'),
(85, 3, 13, 760000, 0, '2026-04-05', NULL, '', 0, 'pendiente'),
(86, 3, 14, 760000, 0, '2026-05-05', NULL, '', 0, 'pendiente'),
(87, 3, 15, 760000, 0, '2026-06-05', NULL, '', 0, 'pendiente'),
(88, 3, 16, 760000, 0, '2026-07-05', NULL, '', 0, 'pendiente'),
(89, 3, 17, 760000, 0, '2026-08-05', NULL, '', 0, 'pendiente'),
(90, 3, 18, 760000, 0, '2026-09-05', NULL, '', 0, 'pendiente'),
(91, 3, 19, 760000, 0, '2026-10-05', NULL, '', 0, 'pendiente'),
(92, 3, 20, 760000, 0, '2026-11-05', NULL, '', 0, 'pendiente'),
(93, 3, 21, 760000, 0, '2026-12-05', NULL, '', 0, 'pendiente'),
(94, 3, 22, 760000, 0, '2027-01-05', NULL, '', 0, 'pendiente'),
(95, 3, 23, 760000, 0, '2027-02-05', NULL, '', 0, 'pendiente'),
(96, 3, 24, 760000, 0, '2027-03-05', NULL, '', 0, 'pendiente'),
(97, 3, 25, 760000, 0, '2027-04-05', NULL, '', 0, 'pendiente'),
(98, 3, 26, 760000, 0, '2027-05-05', NULL, '', 0, 'pendiente'),
(99, 3, 27, 760000, 0, '2027-06-05', NULL, '', 0, 'pendiente'),
(100, 3, 28, 760000, 0, '2027-07-05', NULL, '', 0, 'pendiente'),
(101, 3, 29, 760000, 0, '2027-08-05', NULL, '', 0, 'pendiente'),
(102, 3, 30, 760000, 0, '2027-09-05', NULL, '', 0, 'pendiente'),
(103, 3, 31, 760000, 0, '2027-10-05', NULL, '', 0, 'pendiente'),
(104, 3, 32, 760000, 0, '2027-11-05', NULL, '', 0, 'pendiente'),
(105, 3, 33, 760000, 0, '2027-12-05', NULL, '', 0, 'pendiente'),
(106, 3, 34, 760000, 0, '2028-01-05', NULL, '', 0, 'pendiente'),
(107, 3, 35, 760000, 0, '2028-02-05', NULL, '', 0, 'pendiente'),
(108, 3, 36, 760000, 0, '2028-03-05', NULL, '', 0, 'pendiente'),
(109, 4, 1, 760000, 0, '2025-04-05', NULL, '', 0, 'pendiente'),
(110, 4, 2, 760000, 0, '2025-05-05', NULL, '', 0, 'pendiente'),
(111, 4, 3, 760000, 0, '2025-06-05', NULL, '', 0, 'pendiente'),
(112, 4, 4, 760000, 0, '2025-07-05', NULL, '', 0, 'pendiente'),
(113, 4, 5, 760000, 0, '2025-08-05', NULL, '', 0, 'pendiente'),
(114, 4, 6, 760000, 0, '2025-09-05', NULL, '', 0, 'pendiente'),
(115, 4, 7, 760000, 0, '2025-10-05', NULL, '', 0, 'pendiente'),
(116, 4, 8, 760000, 0, '2025-11-05', NULL, '', 0, 'pendiente'),
(117, 4, 9, 760000, 0, '2025-12-05', NULL, '', 0, 'pendiente'),
(118, 4, 10, 760000, 0, '2026-01-05', NULL, '', 0, 'pendiente'),
(119, 4, 11, 760000, 0, '2026-02-05', NULL, '', 0, 'pendiente'),
(120, 4, 12, 760000, 0, '2026-03-05', NULL, '', 0, 'pendiente'),
(121, 4, 13, 760000, 0, '2026-04-05', NULL, '', 0, 'pendiente'),
(122, 4, 14, 760000, 0, '2026-05-05', NULL, '', 0, 'pendiente'),
(123, 4, 15, 760000, 0, '2026-06-05', NULL, '', 0, 'pendiente'),
(124, 4, 16, 760000, 0, '2026-07-05', NULL, '', 0, 'pendiente'),
(125, 4, 17, 760000, 0, '2026-08-05', NULL, '', 0, 'pendiente'),
(126, 4, 18, 760000, 0, '2026-09-05', NULL, '', 0, 'pendiente'),
(127, 4, 19, 760000, 0, '2026-10-05', NULL, '', 0, 'pendiente'),
(128, 4, 20, 760000, 0, '2026-11-05', NULL, '', 0, 'pendiente'),
(129, 4, 21, 760000, 0, '2026-12-05', NULL, '', 0, 'pendiente'),
(130, 4, 22, 760000, 0, '2027-01-05', NULL, '', 0, 'pendiente'),
(131, 4, 23, 760000, 0, '2027-02-05', NULL, '', 0, 'pendiente'),
(132, 4, 24, 760000, 0, '2027-03-05', NULL, '', 0, 'pendiente'),
(133, 4, 25, 760000, 0, '2027-04-05', NULL, '', 0, 'pendiente'),
(134, 4, 26, 760000, 0, '2027-05-05', NULL, '', 0, 'pendiente'),
(135, 4, 27, 760000, 0, '2027-06-05', NULL, '', 0, 'pendiente'),
(136, 4, 28, 760000, 0, '2027-07-05', NULL, '', 0, 'pendiente'),
(137, 4, 29, 760000, 0, '2027-08-05', NULL, '', 0, 'pendiente'),
(138, 4, 30, 760000, 0, '2027-09-05', NULL, '', 0, 'pendiente'),
(139, 4, 31, 760000, 0, '2027-10-05', NULL, '', 0, 'pendiente'),
(140, 4, 32, 760000, 0, '2027-11-05', NULL, '', 0, 'pendiente'),
(141, 4, 33, 760000, 0, '2027-12-05', NULL, '', 0, 'pendiente'),
(142, 4, 34, 760000, 0, '2028-01-05', NULL, '', 0, 'pendiente'),
(143, 4, 35, 760000, 0, '2028-02-05', NULL, '', 0, 'pendiente'),
(144, 4, 36, 760000, 0, '2028-03-05', NULL, '', 0, 'pendiente'),
(145, 5, 1, 760000, 0, '2025-04-05', NULL, '', 0, 'pendiente'),
(146, 5, 2, 760000, 0, '2025-05-05', NULL, '', 0, 'pendiente'),
(147, 5, 3, 760000, 0, '2025-06-05', NULL, '', 0, 'pendiente'),
(148, 5, 4, 760000, 0, '2025-07-05', NULL, '', 0, 'pendiente'),
(149, 5, 5, 760000, 0, '2025-08-05', NULL, '', 0, 'pendiente'),
(150, 5, 6, 760000, 0, '2025-09-05', NULL, '', 0, 'pendiente'),
(151, 5, 7, 760000, 0, '2025-10-05', NULL, '', 0, 'pendiente'),
(152, 5, 8, 760000, 0, '2025-11-05', NULL, '', 0, 'pendiente'),
(153, 5, 9, 760000, 0, '2025-12-05', NULL, '', 0, 'pendiente'),
(154, 5, 10, 760000, 0, '2026-01-05', NULL, '', 0, 'pendiente'),
(155, 5, 11, 760000, 0, '2026-02-05', NULL, '', 0, 'pendiente'),
(156, 5, 12, 760000, 0, '2026-03-05', NULL, '', 0, 'pendiente'),
(157, 5, 13, 760000, 0, '2026-04-05', NULL, '', 0, 'pendiente'),
(158, 5, 14, 760000, 0, '2026-05-05', NULL, '', 0, 'pendiente'),
(159, 5, 15, 760000, 0, '2026-06-05', NULL, '', 0, 'pendiente'),
(160, 5, 16, 760000, 0, '2026-07-05', NULL, '', 0, 'pendiente'),
(161, 5, 17, 760000, 0, '2026-08-05', NULL, '', 0, 'pendiente'),
(162, 5, 18, 760000, 0, '2026-09-05', NULL, '', 0, 'pendiente'),
(163, 5, 19, 760000, 0, '2026-10-05', NULL, '', 0, 'pendiente'),
(164, 5, 20, 760000, 0, '2026-11-05', NULL, '', 0, 'pendiente'),
(165, 5, 21, 760000, 0, '2026-12-05', NULL, '', 0, 'pendiente'),
(166, 5, 22, 760000, 0, '2027-01-05', NULL, '', 0, 'pendiente'),
(167, 5, 23, 760000, 0, '2027-02-05', NULL, '', 0, 'pendiente'),
(168, 5, 24, 760000, 0, '2027-03-05', NULL, '', 0, 'pendiente'),
(169, 5, 25, 760000, 0, '2027-04-05', NULL, '', 0, 'pendiente'),
(170, 5, 26, 760000, 0, '2027-05-05', NULL, '', 0, 'pendiente'),
(171, 5, 27, 760000, 0, '2027-06-05', NULL, '', 0, 'pendiente'),
(172, 5, 28, 760000, 0, '2027-07-05', NULL, '', 0, 'pendiente'),
(173, 5, 29, 760000, 0, '2027-08-05', NULL, '', 0, 'pendiente'),
(174, 5, 30, 760000, 0, '2027-09-05', NULL, '', 0, 'pendiente'),
(175, 5, 31, 760000, 0, '2027-10-05', NULL, '', 0, 'pendiente'),
(176, 5, 32, 760000, 0, '2027-11-05', NULL, '', 0, 'pendiente'),
(177, 5, 33, 760000, 0, '2027-12-05', NULL, '', 0, 'pendiente'),
(178, 5, 34, 760000, 0, '2028-01-05', NULL, '', 0, 'pendiente'),
(179, 5, 35, 760000, 0, '2028-02-05', NULL, '', 0, 'pendiente'),
(180, 5, 36, 760000, 0, '2028-03-05', NULL, '', 0, 'pendiente'),
(181, 6, 1, 760000, 0, '2025-04-05', NULL, '', 0, 'pendiente'),
(182, 6, 2, 760000, 0, '2025-05-05', NULL, '', 0, 'pendiente'),
(183, 6, 3, 760000, 0, '2025-06-05', NULL, '', 0, 'pendiente'),
(184, 6, 4, 760000, 0, '2025-07-05', NULL, '', 0, 'pendiente'),
(185, 6, 5, 760000, 0, '2025-08-05', NULL, '', 0, 'pendiente'),
(186, 6, 6, 760000, 0, '2025-09-05', NULL, '', 0, 'pendiente'),
(187, 6, 7, 760000, 0, '2025-10-05', NULL, '', 0, 'pendiente'),
(188, 6, 8, 760000, 0, '2025-11-05', NULL, '', 0, 'pendiente'),
(189, 6, 9, 760000, 0, '2025-12-05', NULL, '', 0, 'pendiente'),
(190, 6, 10, 760000, 0, '2026-01-05', NULL, '', 0, 'pendiente'),
(191, 6, 11, 760000, 0, '2026-02-05', NULL, '', 0, 'pendiente'),
(192, 6, 12, 760000, 0, '2026-03-05', NULL, '', 0, 'pendiente'),
(193, 6, 13, 760000, 0, '2026-04-05', NULL, '', 0, 'pendiente'),
(194, 6, 14, 760000, 0, '2026-05-05', NULL, '', 0, 'pendiente'),
(195, 6, 15, 760000, 0, '2026-06-05', NULL, '', 0, 'pendiente'),
(196, 6, 16, 760000, 0, '2026-07-05', NULL, '', 0, 'pendiente'),
(197, 6, 17, 760000, 0, '2026-08-05', NULL, '', 0, 'pendiente'),
(198, 6, 18, 760000, 0, '2026-09-05', NULL, '', 0, 'pendiente'),
(199, 6, 19, 760000, 0, '2026-10-05', NULL, '', 0, 'pendiente'),
(200, 6, 20, 760000, 0, '2026-11-05', NULL, '', 0, 'pendiente'),
(201, 6, 21, 760000, 0, '2026-12-05', NULL, '', 0, 'pendiente'),
(202, 6, 22, 760000, 0, '2027-01-05', NULL, '', 0, 'pendiente'),
(203, 6, 23, 760000, 0, '2027-02-05', NULL, '', 0, 'pendiente'),
(204, 6, 24, 760000, 0, '2027-03-05', NULL, '', 0, 'pendiente'),
(205, 6, 25, 760000, 0, '2027-04-05', NULL, '', 0, 'pendiente'),
(206, 6, 26, 760000, 0, '2027-05-05', NULL, '', 0, 'pendiente'),
(207, 6, 27, 760000, 0, '2027-06-05', NULL, '', 0, 'pendiente'),
(208, 6, 28, 760000, 0, '2027-07-05', NULL, '', 0, 'pendiente'),
(209, 6, 29, 760000, 0, '2027-08-05', NULL, '', 0, 'pendiente'),
(210, 6, 30, 760000, 0, '2027-09-05', NULL, '', 0, 'pendiente'),
(211, 6, 31, 760000, 0, '2027-10-05', NULL, '', 0, 'pendiente'),
(212, 6, 32, 760000, 0, '2027-11-05', NULL, '', 0, 'pendiente'),
(213, 6, 33, 760000, 0, '2027-12-05', NULL, '', 0, 'pendiente'),
(214, 6, 34, 760000, 0, '2028-01-05', NULL, '', 0, 'pendiente'),
(215, 6, 35, 760000, 0, '2028-02-05', NULL, '', 0, 'pendiente'),
(216, 6, 36, 760000, 0, '2028-03-05', NULL, '', 0, 'pendiente'),
(217, 7, 1, 760000, 1, '2025-04-05', '2025-03-05', 'efectivo', 3, 'aprobado'),
(218, 7, 2, 760000, 0, '2025-05-05', NULL, '', 0, 'pendiente'),
(219, 7, 3, 760000, 0, '2025-06-05', NULL, '', 0, 'pendiente'),
(220, 7, 4, 760000, 0, '2025-07-05', NULL, '', 0, 'pendiente'),
(221, 7, 5, 760000, 0, '2025-08-05', NULL, '', 0, 'pendiente'),
(222, 7, 6, 760000, 0, '2025-09-05', NULL, '', 0, 'pendiente'),
(223, 7, 7, 760000, 0, '2025-10-05', NULL, '', 0, 'pendiente'),
(224, 7, 8, 760000, 0, '2025-11-05', NULL, '', 0, 'pendiente'),
(225, 7, 9, 760000, 0, '2025-12-05', NULL, '', 0, 'pendiente'),
(226, 7, 10, 760000, 0, '2026-01-05', NULL, '', 0, 'pendiente'),
(227, 7, 11, 760000, 0, '2026-02-05', NULL, '', 0, 'pendiente'),
(228, 7, 12, 760000, 0, '2026-03-05', NULL, '', 0, 'pendiente'),
(229, 7, 13, 760000, 0, '2026-04-05', NULL, '', 0, 'pendiente'),
(230, 7, 14, 760000, 0, '2026-05-05', NULL, '', 0, 'pendiente'),
(231, 7, 15, 760000, 0, '2026-06-05', NULL, '', 0, 'pendiente'),
(232, 7, 16, 760000, 0, '2026-07-05', NULL, '', 0, 'pendiente'),
(233, 7, 17, 760000, 0, '2026-08-05', NULL, '', 0, 'pendiente'),
(234, 7, 18, 760000, 0, '2026-09-05', NULL, '', 0, 'pendiente'),
(235, 7, 19, 760000, 0, '2026-10-05', NULL, '', 0, 'pendiente'),
(236, 7, 20, 760000, 0, '2026-11-05', NULL, '', 0, 'pendiente'),
(237, 7, 21, 760000, 0, '2026-12-05', NULL, '', 0, 'pendiente'),
(238, 7, 22, 760000, 0, '2027-01-05', NULL, '', 0, 'pendiente'),
(239, 7, 23, 760000, 0, '2027-02-05', NULL, '', 0, 'pendiente'),
(240, 7, 24, 760000, 0, '2027-03-05', NULL, '', 0, 'pendiente'),
(241, 7, 25, 760000, 0, '2027-04-05', NULL, '', 0, 'pendiente'),
(242, 7, 26, 760000, 0, '2027-05-05', NULL, '', 0, 'pendiente'),
(243, 7, 27, 760000, 0, '2027-06-05', NULL, '', 0, 'pendiente'),
(244, 7, 28, 760000, 0, '2027-07-05', NULL, '', 0, 'pendiente'),
(245, 7, 29, 760000, 0, '2027-08-05', NULL, '', 0, 'pendiente'),
(246, 7, 30, 760000, 0, '2027-09-05', NULL, '', 0, 'pendiente'),
(247, 7, 31, 760000, 0, '2027-10-05', NULL, '', 0, 'pendiente'),
(248, 7, 32, 760000, 0, '2027-11-05', NULL, '', 0, 'pendiente'),
(249, 7, 33, 760000, 0, '2027-12-05', NULL, '', 0, 'pendiente'),
(250, 7, 34, 760000, 0, '2028-01-05', NULL, '', 0, 'pendiente'),
(251, 7, 35, 760000, 0, '2028-02-05', NULL, '', 0, 'pendiente'),
(252, 7, 36, 760000, 0, '2028-03-05', NULL, '', 0, 'pendiente'),
(253, 8, 1, 1750000, 0, '2025-04-10', NULL, '', 0, 'pendiente'),
(254, 8, 2, 1750000, 0, '2025-05-10', NULL, '', 0, 'pendiente'),
(255, 8, 3, 1750000, 0, '2025-06-10', NULL, '', 0, 'pendiente'),
(256, 8, 4, 1750000, 0, '2025-07-10', NULL, '', 0, 'pendiente'),
(257, 8, 5, 1750000, 0, '2025-08-10', NULL, '', 0, 'pendiente'),
(258, 8, 6, 1750000, 0, '2025-09-10', NULL, '', 0, 'pendiente'),
(259, 8, 7, 1750000, 0, '2025-10-10', NULL, '', 0, 'pendiente'),
(260, 8, 8, 1750000, 0, '2025-11-10', NULL, '', 0, 'pendiente'),
(261, 8, 9, 1750000, 0, '2025-12-10', NULL, '', 0, 'pendiente'),
(262, 8, 10, 1750000, 0, '2026-01-10', NULL, '', 0, 'pendiente'),
(263, 8, 11, 1750000, 0, '2026-02-10', NULL, '', 0, 'pendiente'),
(264, 8, 12, 1750000, 0, '2026-03-10', NULL, '', 0, 'pendiente'),
(265, 8, 13, 1750000, 0, '2026-04-10', NULL, '', 0, 'pendiente'),
(266, 8, 14, 1750000, 0, '2026-05-10', NULL, '', 0, 'pendiente'),
(267, 8, 15, 1750000, 0, '2026-06-10', NULL, '', 0, 'pendiente'),
(268, 8, 16, 1750000, 0, '2026-07-10', NULL, '', 0, 'pendiente'),
(269, 8, 17, 1750000, 0, '2026-08-10', NULL, '', 0, 'pendiente'),
(270, 8, 18, 1750000, 0, '2026-09-10', NULL, '', 0, 'pendiente'),
(271, 8, 19, 1750000, 0, '2026-10-10', NULL, '', 0, 'pendiente'),
(272, 8, 20, 1750000, 0, '2026-11-10', NULL, '', 0, 'pendiente'),
(273, 8, 21, 1750000, 0, '2026-12-10', NULL, '', 0, 'pendiente'),
(274, 8, 22, 1750000, 0, '2027-01-10', NULL, '', 0, 'pendiente'),
(275, 8, 23, 1750000, 0, '2027-02-10', NULL, '', 0, 'pendiente'),
(276, 8, 24, 1750000, 0, '2027-03-10', NULL, '', 0, 'pendiente'),
(277, 8, 25, 1750000, 0, '2027-04-10', NULL, '', 0, 'pendiente'),
(278, 8, 26, 1750000, 0, '2027-05-10', NULL, '', 0, 'pendiente'),
(279, 8, 27, 1750000, 0, '2027-06-10', NULL, '', 0, 'pendiente'),
(280, 8, 28, 1750000, 0, '2027-07-10', NULL, '', 0, 'pendiente'),
(281, 8, 29, 1750000, 0, '2027-08-10', NULL, '', 0, 'pendiente'),
(282, 8, 30, 1750000, 0, '2027-09-10', NULL, '', 0, 'pendiente'),
(283, 8, 31, 1750000, 0, '2027-10-10', NULL, '', 0, 'pendiente'),
(284, 8, 32, 1750000, 0, '2027-11-10', NULL, '', 0, 'pendiente'),
(285, 8, 33, 1750000, 0, '2027-12-10', NULL, '', 0, 'pendiente'),
(286, 8, 34, 1750000, 0, '2028-01-10', NULL, '', 0, 'pendiente'),
(287, 8, 35, 1750000, 0, '2028-02-10', NULL, '', 0, 'pendiente'),
(288, 8, 36, 1750000, 0, '2028-03-10', NULL, '', 0, 'pendiente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usersadmin`
--

CREATE TABLE `usersadmin` (
  `idUser` int(11) NOT NULL,
  `user` varchar(20) NOT NULL,
  `pass` varchar(20) NOT NULL,
  `grupo` varchar(10) NOT NULL,
  `privilegios` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usersadmin`
--

INSERT INTO `usersadmin` (`idUser`, `user`, `pass`, `grupo`, `privilegios`) VALUES
(2, 'admin', '123', '', 3),
(3, 'angela.velazquez', 'cheroga2025', '001', 1),
(4, 'patricia.ramirez', 'santi2013', '002', 1),
(5, 'sara.gimenez', 'sara2019', '003', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `egresos`
--
ALTER TABLE `egresos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estadocuenta`
--
ALTER TABLE `estadocuenta`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estadocuotas`
--
ALTER TABLE `estadocuotas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usersadmin`
--
ALTER TABLE `usersadmin`
  ADD PRIMARY KEY (`idUser`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `egresos`
--
ALTER TABLE `egresos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `estadocuenta`
--
ALTER TABLE `estadocuenta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `estadocuotas`
--
ALTER TABLE `estadocuotas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=289;

--
-- AUTO_INCREMENT de la tabla `usersadmin`
--
ALTER TABLE `usersadmin`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
