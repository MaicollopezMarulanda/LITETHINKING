-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-03-2023 a las 21:08:33
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `partedos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--
-- Creación: 27-02-2023 a las 20:40:26
-- Última actualización: 02-03-2023 a las 13:31:16
--

CREATE TABLE `usuarios` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `correo` varchar(200) NOT NULL,
  `password` varchar(260) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `apellido`, `telefono`, `correo`, `password`) VALUES
(1, 'Maicol', 'Lopez', '32256988', 'maicol@gmail.com', '$argon2id$v=19$m=1024,t=1,p=1$X2MsAwZULr7yRM8KN02qQg$8Zd8g9PCFwMCMydYGPKKyOlzSjl5sbCcGMiNcR5C1H4'),
(2, 'maicol2', 'lopez', '898985', 'maicol2@gmail.com', '$argon2id$v=19$m=1024,t=1,p=1$r8qqQCkSm9/m2RSvI/YHIw$hladYSZ17HInEwl+zaYMkIOgC/50/QJvEAju/cboszY'),
(3, 'maicol3', 'lopez', '98859', 'maicol3@gmail.com', '$argon2id$v=19$m=1024,t=1,p=1$KIt5M2Z3FXDdDX+D6510Rg$C9u93sWpHieisDonE8ZlrV65CWYM55ZFPbwQkqdvIJM'),
(4, 'maicol4', 'lopez', '9855', 'maicol4@gmail.com', '123'),
(5, 'maicol5', 'lopez', '98955', 'maicol5@gmail.com', '$argon2id$v=19$m=1024,t=1,p=1$BjvSl6WWP4FEa/ZhCc60Lg$zXEy7cxtLNnWmylvgE7Ix91BJMOfEkgLawQ+Tza7uro'),
(6, 'maicol10', 'lopez', '592', 'maicol10@gmail.com', '$argon2id$v=19$m=1024,t=1,p=1$Sxqo8qEhsxmv9eAmSjBERQ$nmInzY9vh5TJmGTrtXxHC+/BF+BGjU2OFhjrOJJKtoE'),
(9, 'natalia', 'lsjflskd', '852', 'nata123@gmail.com', '$argon2id$v=19$m=1024,t=1,p=1$EsPpqvUpkMX7e9AsYQLhcg$dowMiIwFb+Nj2OperKIi3vLsqL9iljFIYMIZVmJIvaM'),
(10, 'manuel', 'lopez', '695656', 'manuel@gmail.com', '$argon2id$v=19$m=1024,t=1,p=1$lDwkG8eikjUwdyhOlTU9yQ$R/ppJ1CBFjeZVJG8QO710Dxh39j3L7P5RSt36jgMevE');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
