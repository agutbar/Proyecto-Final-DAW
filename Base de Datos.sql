-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-06-2025 a las 17:11:58
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
-- Base de datos: `ortoliberi`
--

CREATE DATABASE ortoliberi;

CREATE USER 'ortoliberi' IDENTIFIED BY 'ortoliberi';
GRANT ALL PRIVILEGES ON ortoliberi.* TO 'ortoliberi';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ausencia_trabajador`
--

CREATE TABLE `ausencia_trabajador` (
  `alta` date NOT NULL,
  `baja` date NOT NULL,
  `dias` int(11) NOT NULL,
  `id` bigint(20) NOT NULL,
  `trabajador_id` bigint(20) NOT NULL,
  `motivo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ausencia_trabajador`
--

INSERT INTO `ausencia_trabajador` (`alta`, `baja`, `dias`, `id`, `trabajador_id`, `motivo`) VALUES
('2025-06-11', '2025-06-10', 2, 1, 8, 'cita-medica'),
('2026-02-20', '2026-02-12', 7, 2, 7, 'baja-medica'),
('2026-03-21', '2026-03-20', 1, 3, 9, 'cita-medica');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `fecha` date NOT NULL,
  `hora` time(6) NOT NULL,
  `id` bigint(20) NOT NULL,
  `trabajador_id` bigint(20) NOT NULL,
  `estado` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `citas`
--

INSERT INTO `citas` (`fecha`, `hora`, `id`, `trabajador_id`, `estado`) VALUES
('2025-09-07', '12:30:00.000000', 7, 9, 'ocupada'),
('2025-11-24', '12:50:00.000000', 8, 7, 'ocupada'),
('2025-11-20', '12:50:00.000000', 9, 7, 'ocupada'),
('2026-03-12', '10:15:00.000000', 10, 9, 'ocupada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` bigint(20) NOT NULL,
  `usuario` varchar(10) NOT NULL,
  `password` varchar(255) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `estado` varchar(255) NOT NULL,
  `telefono` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `usuario`, `password`, `apellidos`, `nombre`, `correo`, `direccion`, `estado`, `telefono`) VALUES
(1, 'mal-cetro', '$2a$10$9VOTbP7B25reSEJdyIQ78eRlr3nBgBON.yYQCush3RACFdOPeRU7y', 'La Emperatriz del Mal', 'Malefica', 'malefica@villana.com', 'La Isla de Los Perdidos', 'activo', '123456789'),
(2, 'Rei-345', '$2a$10$PRWvpSqAyJy6rRR6Fv45ueZhnIS.oy41Z/zc0v00boCi74woC//42', 'La Reina Malvada', 'Grimhilde', 'manzanita@envenenada.com', 'Castillo Real', 'activo', '987654321'),
(3, 'besti3', '$2a$10$UxOKbEwErbFWfpnYXBlYNeQ7AZso2iCUT89rfawwvMCUdl5qT.ojW', 'La Bestia', 'Principe Adam', 'bestia@auradon.com', 'Castillo de Auradon', 'activo', '192837465'),
(6, 'alfombra-2', '$2a$10$oZUbFCj7Z9xpz3XMGOKCyuJjkbnV3FVdBRPp22mGz2Ve7F82CBAyy', 'El Ladron', 'Aladdin', 'aladdinyjazmine@agrabah.es', 'Palacio del Sultan', 'activo', '453627180'),
(7, 'Bdurmi', '$2a$10$omPd2oUIvznFYF51X2qOWO9ewAdSO6ClvXqjZlbIW6cL173wMd3rq', 'La Bella Durmiente', 'Aurora', 'lacasitadelbosque@rueca.com', 'Dentro del Bosque', 'activo', '827319456');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `codigos`
--

CREATE TABLE `codigos` (
  `cobertura` double NOT NULL,
  `producto` varchar(100) NOT NULL,
  `codigo` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `estado` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `codigos`
--

INSERT INTO `codigos` (`cobertura`, `producto`, `codigo`, `descripcion`, `estado`) VALUES
(302.56, 'Corsé Toracolumbar', 'CRY-651', 'Corsé para escoliosis en zona torácica y lumbar', 'activo'),
(10.92, 'Tobillera Elastica', 'LTY-205-I', 'Sujeccion de tobillo para lesiones leves, para el tobillo izquierdo', 'activo'),
(23.69, 'Collarín Blando', 'PWR-026', 'Collarín de espuma blanda requerido en problemas leves en la zona cervical de la columna', 'activo'),
(50.46, 'Protesis de Pie', 'QOP-234-I', 'Pieza de las prótesis que consiste en un pie rígido, lado izquierdo', 'activo'),
(24.67, 'Muñequera Rigida', 'WE234-D', 'Muñequera Rigida para un post-operatorio del tunel carpiano, mano Derecha', 'activo'),
(35.1, 'Rancho de los amigos', 'WYU-962-D', 'Rancho de los amigos realizado a medida por necesidades del paciente - Pie Derecho', 'activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `fecha` date NOT NULL,
  `cliente_id` bigint(20) NOT NULL,
  `id` bigint(20) NOT NULL,
  `trabajador_id` bigint(20) NOT NULL,
  `pago` varchar(255) NOT NULL,
  `tipo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra_productos`
--

CREATE TABLE `compra_productos` (
  `productos` int(11) DEFAULT NULL,
  `compra_id` bigint(20) NOT NULL,
  `productos_key` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documento`
--

CREATE TABLE `documento` (
  `id` bigint(20) NOT NULL,
  `contenido` longblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fabricacion`
--

CREATE TABLE `fabricacion` (
  `hijo_id` bigint(20) NOT NULL,
  `id` bigint(20) NOT NULL,
  `trabajador_id` bigint(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `codigo_id` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `estado` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `fabricacion`
--

INSERT INTO `fabricacion` (`hijo_id`, `id`, `trabajador_id`, `nombre`, `codigo_id`, `descripcion`, `estado`) VALUES
(6, 1, 9, 'Corsé', 'CRY-651', 'Corsé para escoliosis', 'asignado'),
(3, 2, 7, 'Rancho de los amigos', 'WYU-962-D', 'Rancho de los amigos a medida, pierna derecha', 'no-asignado'),
(1, 3, 8, 'Corsé', 'CRY-651', 'Corsé de escoliosis', 'no-asignado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fabricacion_materiales`
--

CREATE TABLE `fabricacion_materiales` (
  `materiales` int(11) DEFAULT NULL,
  `fabricacion_id` bigint(20) NOT NULL,
  `materiales_key` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materiales`
--

CREATE TABLE `materiales` (
  `caducidad` date NOT NULL,
  `coste` double NOT NULL,
  `stock` int(11) NOT NULL,
  `id` bigint(20) NOT NULL,
  `proveedor_id` bigint(20) NOT NULL,
  `lote` varchar(100) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `estado` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `materiales`
--

INSERT INTO `materiales` (`caducidad`, `coste`, `stock`, `id`, `proveedor_id`, `lote`, `nombre`, `descripcion`, `estado`) VALUES
('2029-03-20', 4.5, 3, 1, 1, '7r6hb39adq3d', 'Fijador de Transfer', 'Spray de fijacion', 'activo'),
('2030-05-10', 6.72, 5, 2, 2, '847yd7hd7a93ns', 'Espuma para moldes', 'Espuma para moldes que se consiguen a través de escaneo y fresado', 'activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menores`
--

CREATE TABLE `menores` (
  `nacimiento` date NOT NULL,
  `cliente_id` bigint(20) NOT NULL,
  `id` bigint(20) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `estado` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `menores`
--

INSERT INTO `menores` (`nacimiento`, `cliente_id`, `id`, `apellidos`, `nombre`, `estado`) VALUES
('2019-10-10', 1, 1, 'Bertha', 'Mal', 'activo'),
('2018-06-07', 2, 2, 'Manzana', 'Evie', 'activo'),
('2020-07-04', 2, 3, 'Manzana', 'Jack', 'activo'),
('2018-02-12', 2, 4, 'Manzana', 'Dil', 'activo'),
('2016-04-12', 2, 5, 'Manzana', 'Micky', 'activo'),
('2021-10-12', 7, 6, 'Durmiente', 'Audrey', 'activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos_cliente`
--

CREATE TABLE `pedidos_cliente` (
  `gastos_envio` double NOT NULL,
  `importe` double NOT NULL,
  `peticion` date NOT NULL,
  `precio` double NOT NULL,
  `prevision` date NOT NULL,
  `cliente_id` bigint(20) NOT NULL,
  `id` bigint(20) NOT NULL,
  `estado` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos_cliente_producto`
--

CREATE TABLE `pedidos_cliente_producto` (
  `productos` int(11) DEFAULT NULL,
  `pedidos_cliente_id` bigint(20) NOT NULL,
  `productos_key` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos_proveedor`
--

CREATE TABLE `pedidos_proveedor` (
  `importe` double NOT NULL,
  `peticion` date NOT NULL,
  `id` bigint(20) NOT NULL,
  `proveedor_id` bigint(20) NOT NULL,
  `estado` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos_proveedor_material`
--

CREATE TABLE `pedidos_proveedor_material` (
  `materiales` int(11) DEFAULT NULL,
  `materiales_key` bigint(20) NOT NULL,
  `pedidos_proveedor_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos_proveedor_producto`
--

CREATE TABLE `pedidos_proveedor_producto` (
  `productos` int(11) DEFAULT NULL,
  `pedidos_proveedor_id` bigint(20) NOT NULL,
  `productos_key` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido_fabricacion`
--

CREATE TABLE `pedido_fabricacion` (
  `peticion` date NOT NULL,
  `prevision` date NOT NULL,
  `cliente_id` bigint(20) NOT NULL,
  `fabricacion_id` bigint(20) NOT NULL,
  `id` bigint(20) NOT NULL,
  `estado` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `coste` double NOT NULL,
  `precio` double NOT NULL,
  `stock` int(11) NOT NULL,
  `id` bigint(20) NOT NULL,
  `proveedor_id` bigint(20) NOT NULL,
  `lote` varchar(100) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `codigos_codigo` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `devolución` varchar(255) NOT NULL,
  `estado` varchar(255) NOT NULL,
  `devolucion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id` bigint(20) NOT NULL,
  `cif` varchar(9) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `estado` varchar(255) NOT NULL,
  `telefono` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id`, `cif`, `nombre`, `correo`, `estado`, `telefono`) VALUES
(1, 'QW3T46E1', 'Pais Maravillas', 'conejoblanco@paisdelasmaravillas.com', 'normal', '389401730'),
(2, '1P5TY67X', 'Comerciantes del Desierto', 'mercaderes@agrabah.net', 'normal', '916301803');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reciclaje`
--

CREATE TABLE `reciclaje` (
  `venta` date NOT NULL,
  `cliente_id` bigint(20) NOT NULL,
  `id` bigint(20) NOT NULL,
  `segunda_mano_id` bigint(20) NOT NULL,
  `pago` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `revisiones`
--

CREATE TABLE `revisiones` (
  `cita_id` bigint(20) NOT NULL,
  `cliente_id` bigint(20) NOT NULL,
  `hijo_id` bigint(20) NOT NULL,
  `id` bigint(20) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `revisiones`
--

INSERT INTO `revisiones` (`cita_id`, `cliente_id`, `hijo_id`, `id`, `descripcion`) VALUES
(7, 2, 2, 2, 'Prueba Rancho'),
(8, 7, 6, 3, 'Corrección del Corsé'),
(9, 7, 6, 4, 'Prueba del corsé nuevo'),
(10, 1, 1, 6, 'Prueba del nuevo rancho de los amigos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `segunda_mano`
--

CREATE TABLE `segunda_mano` (
  `empresa` int(11) NOT NULL,
  `entrega` date NOT NULL,
  `original` double NOT NULL,
  `paciente` int(11) NOT NULL,
  `reciclado` double NOT NULL,
  `cliente_id` bigint(20) NOT NULL,
  `fabricacion_id` bigint(20) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `producto_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitantes_empleo`
--

CREATE TABLE `solicitantes_empleo` (
  `registro` date NOT NULL,
  `id` bigint(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `curriculum` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `solicitantes_empleo`
--

INSERT INTO `solicitantes_empleo` (`registro`, `id`, `nombre`, `correo`, `curriculum`) VALUES
('2025-06-06', 1, 'Ana', 'gutierrez.baron.ana@iescamas.es', 0x255044462d312e370a25c3a4c3bcc3b6c39f0a322030206f626a0a3c3c2f4c656e6774682033203020522f46696c7465722f466c6174654465636f64653e3e0a73747265616d0a789cb5565dab23370c7d9f5fe1e7c2fa4ab2e40f0881c9c72d5d58e86d037d287ddb6d61690bbb2ffbf77bec6472275c4f26b494102751ac3347b27464f2ecbe0d5f1c39f224d959312fc95c56f639b2fbfa69f8e53bf7f7f0f4e366f3f461ffc3c1d176bb3bec8717f7c559f4c9a5c49e72719ae1618ed5532957bf868cd7d73f86dd69389e8697e1f8613f83e333dced3ec9e415c8ea6328eef4d13d3db36372a7df7fdd106f794352975017ddbec36af56bdcbe936afdedf4bef728e93deabaefc5bdee0cd3ce16615dfe7d80da0d30255f5c241fdec6976a28b92ee535a816ef5897dd6b78b79881c1af87b9a1fdf6f4b9c7cd56327236fff43d76b037224aee1b0cef1dbbcf83992fa89844c14736f7d760817cb174b5fce97e6e243baed1c768d8a83e9854d7b341c13e69b8e319847d4c71e63a59d67d2b3f91f953cf86ffd5f39ca498832fd8f89aa4c9b2ee1acd2b698b54bc72b85ad65d35a2896dee7ab1acbb4af641d29cf0c5b2ee4a05fd92e7ae17cbb2ab106cc84664f22695f16431c84b49f78215229f2942bad8cbbc0e2f8655c296c427e6b9e7c5b2ee6aea39c92cc39365dd3518d44de74fbd58d65d3941836e42bd58d6335c77e620b30c6b2a5ef2bd60a70c6bc9de6c5e14936595b242d189e7453159d65d237bbdf13c1bfeb3e38d201bfe2a2e414c3884b37c8a03bd2a9f4c4281948c22a6cb24a5b700acea133a2be6ec19273121804a4e0d2551c6bbe02d346260f571421dc0851b4ea0dcc1d98149a23db82c61b018ce183a51bc5abece02f5a51203c401a1081de99909df149001bf76b08ff855306816c8194a2502d990502e6f9199598073e4962e06321b1bd6786b5f221ed0b1689e65fc84d00fc0cb952b171e2b6f4ef59377bc5fc205ef08bc18c4875e42b8118b4848001492b00404e9a550752af8acd22158691148291f97d3184047534329661d946712a0680bee4d4ad18e3b96c7128ace0db8ce598ee0addd52c878543df611578b3e8a802f7aa05d0e955337eacc2d7fcb3117dca28adec1e08722120d184350fb8449963a6729e7cc8d8b08c807a229771042f5060a3222fa589e63f46d1c645c0b622fcd621594e21d5ac9435e9c696e62f59656443914a9f2b1c305d96acff2b2907014dccb71f4b5d872070f9d34b6321b79ac457fa727a124ceaa346aa727ab3cb692afb2b6e303d02ab3aa2c86bf9685ee5210c095d86ba528e581d4a3b515f7712da80be5357a57a1332ead4ba9c12f052fd0dd947028840b81f4fae736f8c4c747fb6009f141a914c29599eb18c57d237734a41b776aeab6ce6e11f5d17e4801d31038d04b9be6e90d4ee3214b8a330d9aea8f3beb7a96ae83664917ff01ad751e260a656e6473747265616d0a656e646f626a0a0a332030206f626a0a3938350a656e646f626a0a0a31312030206f626a0a3c3c2f4c656e677468203132203020522f46696c7465722f466c6174654465636f64653e3e0a73747265616d0a789cb558c98a234710bdeb2bf26ce8ec583272012190d492f1c080db16f830f8e60506db307399dff7cb5ad4a556964a3d6323ba541daa78f162c988cc22cfeecbea9323479e243b2be62599cb817d8eec3effbefae53bf7cfeaf1c7f5faf1fdfe8727479bcdee69bf7a769f9c459f5c4aec2917173234cc71f054ca59af43c6e7f39fabdd697538ad9e5787f7fb091cf77097cf490e152ba5e0a31677facd3d1ed931b9d31f1fd6c41b5ecb7ebcf076f3206b3a6c7e3dbd6b19909681f373cfeee5491d9fecfcaa97af772b34dd4ac91717c9ebb55309ae50ae97522fb1734aeaedb65e762fee5d622a835f0b732d4f9bd3c716375b88482ffee97b3cc1de8828b92f10bc73ec3eaecc7c419d24521fd9dcdf2be3e28bf259f297fbb923d9508d3e466495825793aada0bb4900f496e684a4c9e4b98a88e9265ddcaef527794fccfba7da0624658109e97408d9265d568283a99aa0e9265d510bd5998aa0e926555c99e2e323b4ae65559930f884f7d3275711a2566ea596e9965c542037aa48288c6a9dd41b248d9908ca279a23a4a96cd5a12af58d913dd41b26c16bed51e39511d24cbaa6a5e652ce44e75902cab726d4c3ab53a48165543c95ec234b5a3645935159f689a9d51b25c152163ad049d54454066e95698c6ec84107c9234353b489619c3460a17aa836451550b7ba1694d8c92ff40f5622018928fd591843dabf6fd5b1ce7dabf8969874fc66818fbf8a53673f206ed98b13eed451b4c72ea1052d5a6823fa12dd90c8e46416ba88d096c4a6ce0ec2800634f7116037564989631a23d86781e440180d6413c9181c4818e4cb80b8054fcb7837c8bff0aa6dc1c394c5ef4ad59641616e01c5881631c6683a560081c231f91b90643318ab27f3b332062125c01cae13e628a7693d077f14db13488718710113ae56d25b54408489c1b8cee0c15fa1f4a06ed37784133bb86416490c503053ecc468793f9585054887b0cda084f844b95ceb18ffb92537338f7e61f5e25e8d70d2e93cd56e8bd7c6671e478179f98bdd6f153f731b9e116e864e1ae04b7d8fddd0eb2250cf7d8581c6f0cf23c4e90f296205bee4e13df1ce4391ca5fbf828e60cf6c5866f4dcdb6041e5bc6ea9ac5500c9c1ce1931212de8ef1019bb2da637792e11fda07cf775b56e005f826e4b3b61a5142c6917af0dad6f53e8783e519ea7e80c44b69c59a3b9443d7fb77fc04b4caacb65fc34ff3d360883d7003b7fa5ab8abc00bda1a8653c06eb719f90b76e7968ba9d93516ead0975a6f05cfa9d55cee5b8448978f86bd02e63051a3d5bdae7bc4d1d890e75731803ce37aae033a42baad838ee76afc6c5bd0f7a565fb7865a3b3fdbaf6bfc236d7c38028f62638edc7568eeb9c39ca5cdf51893e74a7206baf2b8e6deeb3cdfae5741a5ba7d35cdf4e60df18b043a16bbe1fd6ca1bad47659c9ad155a4deca8d5373c29e0c6b3a2877e7a939bc5a810f610d9e5cdf30482f9979d1905ac41927029c635cc0c90d27e49625d9480fce9d3190b6b56abd8527b85827b54df73ee06178164fe15683da4d3f39465f62dd35679f91b06bf39368853e7e401b43c9a5ffb19a8a350636e77c6e3aafd9a3b122cc7587d4b2fe2dce53c77c7fa62cfdedd9959b7141e310a423605751b8c56cc4c168003602d1635fb8ff2f59260ca30a656e6473747265616d0a656e646f626a0a0a31322030206f626a0a313230300a656e646f626a0a0a32332030206f626a0a3c3c2f4c656e677468203234203020522f46696c7465722f466c6174654465636f64653e3e0a73747265616d0a789cb556c98a243710bde757e86ce8e88890420b1405b5b5f1c080db2ef0c1f8e60506db307399dff7536e9d3dadac2c8f314d655746e9bd78a1582426719fbb8f8e1d136b76568c3499cb412847719f7eeb7efac6fddd3d7ebfdb3dbe3f7d7776bcdf1fcfa7eed97d741629b994843817173210e624109732e37a66fc7dfaa33b5ebbcbb57bee2eef4f0b3a19e85eafd354880dd481a22feefaab7b7c1227ecaebfffbc63d9cb8ec3fea17ffa1d5fea7bd93ff89d1cf6ba63c3bb84fd2fd7772d87da7238af7b762f2bfdb4b28fb33ebe3eccd00e33517191c9bf0d32d5a0f210191e71ff80c8b47e3dd4c7f125bcd79c5ea0afc5b913d95f3fb4b4d9c68e0ce61fbec50a2163e6e43ec3f0ce89fbd0995141dd24f614c5dc5f9d71a2247eb6fce97eec4536a091624496399037add0c110a03e057f03e9bd502a4be864d9c61a472a292edd8e96ff193b6c54cc9e0a16be6cd464d98646a3c061091d2deb502942014a638c2441809d2d9ac8ca4d2842420263881805cbd44e966dc59ac96b5a4247cb36940bfa2d2fa1a3e58e6085c9d416c11a865449b7376a88d680d065b0a36153b025c57a592247cb36d402491aca58c9bcce966da8378cc8654d4c966da824ccb057a18e964d682899cc96799d2cdbc909a59096b048ceddbd13320e2959d6c464d98646f87a851c0cff19b89c9952947070baa442e2fd307ed5411fc62f9fd858f9cc912ffcc4810596d8db92f03c9abf600c85320679cc9904999918a12da79e3571c6a7e0a37cc0d1d7e6f1c0d72dae3c9e7383e708456950b4a6453df952474941daf27cb8042a551938ce351a9fc051c483ef8038a3cf507694336709f8e509e7d78a4674a0867883ffa4053a2f3db7e1846ff32009dc0f29a1686f5924416550e1833032b1162db2425c77cc70bd4147ae440b3db18f79e49c22de8a718d55a2e81d312a666129e222e6454033bde1d158757dadba355691bbd409f02561efc4a31f1a517aab3d806527fcaf7512c07a06eb852173bd426a17a0f72a6fb1466ef9f45a1fae496da688bb498cce72441adadb57376b10f66fb6502bc7708d0e926e544daab17a8503dc7071855d8938a25f21709def8b9ee0a33f4cecab1213e524389e708aa7469fcdb573a7c6312bab7c776745ea7d1fb76ab34caab1a10c89e8e7cbd3b69a905123cd1dbb578da08a71e3375f28e60693f7a8d650eb550e63a918de4656d436be6132a3befb69b3da2daa508c9b473d354269f8e94bb0f64bef673153e5507b063ead7ad6d5e93ff675f5a0b135cbee9bacb352565ced37376416cab5b18f2f85c461d5c59c3eb848dae8cc1be9fb07db8916de0a656e6473747265616d0a656e646f626a0a0a32342030206f626a0a3936320a656e646f626a0a0a33322030206f626a0a3c3c2f4c656e677468203333203020522f46696c7465722f466c6174654465636f64653e3e0a73747265616d0a789cb5564d6b1b3110bdefaf98732193198d461fb02c78d76e6920d0b4861e4a6ffd80d016924bfe7e476b7bbba6abac492906591ef49ede1bcd482664786a1e8080905c02cd8a2e2a24cf9802c3e3d7e6e32bf8d55cbf6bdbebdbe1ed16a8ebfaedd0dcc10368c008313252cae0932114d823e53ce14666fb3c7e6ffa7db3db3777cdee7698d1f181ee7c9d0bbe70c5e8314886fd17b87ecdc004fb6f9f5a8a1db7b4b1813d6999f7dd956b49ca7437fd16d7b9b2ec4a5aa632d511d17ddedf2ce9704b3aa67577f067a59c568ef6cbf072f77ed17d8c9821104ac57b2a432e43189dbb5342ccf964ef9c53d8f42d71b61cbafdfd92365dc9c821fcfe8dad6054228af064811b60b86f54315b3945120cacf0b35172189d9f223fe0c32872011a30043b7cf228ea0af410d04ca82ccf203905f41466d053641d2b3e63ce7e863d45d6b14a8c39c5b9e463e43f630f490e49307b9925f914792e556a49b52a0b6a09f273ec31b2bead0f7645cccff6145987ba84e2e21c7a8cac423533baf9a6c7c00556295baba6f9a6c7c83f6f7ad6bd76904918a263649143b339e0549a8d7a6226521b84e238326dec374d4d78ce66fbc414ec401372d6894cc70a2984d9083c0dc41502571a9f7464104a0b0c03992b13e14769915d954bec71109f9ee1ea8d251a63b0dbb662c80e231b855d459cd27415796b351d29d8c488d1a89148cd947af4c1d212326ae405966d3155b511ca5d5dc05e97240c96839e763ccab027a32622a267ab22b50750dcdf3c2e9885351155f0f62211962d144b7e90f2bd944e37b88137f630d6eb83721809bcdd76955452cfc939cec6645d439b52c4262cd86c58715823765b972f72680f86188ff595c6a54c250adc17416bd5c2762baabeb05a6ae00b0fea542de50f96e7f8b26aa982992b227e0313dc12270a656e6473747265616d0a656e646f626a0a0a33332030206f626a0a3636390a656e646f626a0a0a34312030206f626a0a3c3c2f4c656e677468203432203020522f46696c7465722f466c6174654465636f64652f4c656e677468312031393238383e3e0a73747265616d0a789ced7b797c5455d2e8a9bbf47ed37bba4907fa369d04b04312d2091040d202894140c21248839034d91592906e406494b029061154c4411861144761503a1001172432eab880e23e7e8e1215e79b7183717085dcbcbae77667418637bfefbdbfdeef75e7de3ea7ea9c3a75aaead4a93af726d2b4a48a1848336149a06251a8f1ef2f7dff3921e4042160a9581a11d949efa561b98310667d7563cda2070fdf709e10ae9610755bcdc2e5d56fd47f711b2186644232d6d656852a17cda94e2764d42ea431bc1601774babd558ff0bd6536a17456efeaedfabe7b07e11eb17173654843e0fcd282264f44f586f5e14bab9f121760e43c8989bb12ed6871655d51857f4c3fa6f09d1cf6d6c0847b692f62e42ae3d2fe31b9baa1aef9a78f00821453642d8f10803fcca1f031655729d61395ea5d6e80d4282d164b6586df64487b35f922bb9ff00b738d09b929a3668f090ab7ce9433332b38665fb7372878f1899376af498abc792ff273efc09fe04b9955f45ec6439bdf7f970a3888d2c23a4eb6bb9d6739766ffdfe542a3fcb491a3643fd9d507b59ea0fd907d7d60c7c89fc81f69693bd97805b24f93bdb1d216b28ddcf16fdbdd48d6209ddd387ecfa71ca1cbc96f71e423e431349481e0c7516f8a613f22af5e9e147c0aaf927bc9e3d8f25e7218efdb7165ac60be23f732d3493df301bb8aac2677e21c77421dd984edcbc96e984be62354f9cc2755a4e112a22d64337994dc82abb0fbc3afeafa17112e1e44ceef443a5b491d598c9a345e1cd0f51dc9e1fe4604e95d728c7523ef4f92a7689755f1beea22f646e610c374de87957b480d5e21f810f9dcc85e730569fe1f7f54abd02fd8b8d7651bea7a475a89bc7f841a7a06a5f166e0dab97382a52533674c9f563cf5fa2993275d37b1e8dac28209e3c75d13c81f7bf598d1a3f2468e189e3b2c2b336368fae04169a929de811eb7d36636191304bd4eab51ab788e6580a48b51282f88b2a9a2b930e42df0868a86a68b05ceda0943d30bbc85e551312446f1874bf316155190371415cbc5681afe847a81cba3016c597d49cb80d232d0dd124ce21832461ec22b464f4ef08a4760ceb4522c6f9ce00d8ad16f68790a2d7369b42260c5e3c11e942b995bb1205ab8b4b6a5a01c798456bd6ebc777c956e683a69d5e9b1a8c75274b0b7b115068f055a6006178c6a6588469087c59916842aa3c5d34a0b26b83c9ee0d0f489d104ef048a22e329c9a86a7c544d498a7532eb6483d89adede72d711135950ee33547a2b43379446d910f66d610b5a5aee889a7dd121de09d121b79c71e2ccaba2e9de0905519f4c75d2f4ee7126f50c09513ed5e4155bbe27381def375ff78584621055aae97b2217a3ccf8284c2ff5c81f5721cabaa5a5d02b16b694b7848e74352ff08a266f4babc1d0d25880e226c5a548e248d7331b5cd1c2bb825153792d8c0ac6a65e387d52d43a6d6e6994492d146b4308c1bf7caf67a4cb63ee6e53fcefd004c582c241097b3cb218361c0990055889364f2b55ea2259e03a400299be6094299731ed718cbd44c634c731ddddcbbda8db49334a5ba25ceac44a6f014a7c4328dabc00adeb4659315e5334e10797c7db62318b799941da5644ae2656d689513e0d8584bd7a7740bb91bbb4986825e107e5e71b170e9066b688795e2423d329f01694c7fe96d63a918088822ef2298630b3341a9880854028a6b182d6ac4cec112a4785d54da0ca8c667a1ba336efb86eedca6c15d4cd28a55d62dda2b6f151525e11eb15cd2ca0eb4a2c68299fa0b020d3f24e2b7d9af8bb3a5a7344d7413fc921c10972e3c4f1686569052da595d55177b9ab12d75db558eaf2440341d470d05b5a1594cd0e2534a4c3458d23486d6566e9a419de49d3e6948e8c31a22064725c6ac12564bca52e850c1a605493aa114b19171bc4862604888558f08e1b83f7a83a55839709054ea1b2e18e1b2396828bc45b231bd1216241d584583bb9de87282f9bd3f8a23835955c453ae38b5c9ea047f90c4d67102dc606c61e1a59a8457114ba294468d03ec71751902c4ba76cf462a9b7ca1bf4d68ad14071a93c37593c54ca31615099c77435b34fad97b0504cc483e878451666b4d0e7ea2ddce8b5b4de5d2dba043d318e165b34de49335a64e2de1841829c4f8c12d9840323cd2eea0be405ed45df2b9a7049d305ddd21a08c88bb976944cc43bb1b2c53ba3740c6d8dfee456d72df25816320926cd1c37341d5ddbb8562fac9fd61a80f533e6943e6dc2586efdccd2030c30e3cbc7055b531057fab44848804219192a03e58a2857644ad3b1a2a1ed5d4f073078a4588e0268bde208100ad3c461402a8e300acca40c9446070a1006319c8209c45b7308d328b0660aa39f56228b2ca0e3039a8036606004c6d50a32e800429ec1d8530be4a0010470b562afe9147c049a5bb50197d2a2195b04140ed797f40c5d32a7f4a08160377ac781c6c91f3417672d2a1bb79502b1523694df046b5bca83f2622389a81afc832878c7a29abc6391119521aaf3568d8beabde36478be0ccf57e02a19ae46138544c0eecda8fbe228c81630b7d4834b524c7ad5d562fa46d654109d4a8be98ba1c8dc498c44b2316e64899ab80302a3e25915abd5f02c87a0fc939927cd16c8cb33fbcdfe6159568fd963357bcc27b9aa0bdb27b327f955bface4732f38b87fc8c101831225fc74a4a526263237305c0062605815af212cc769d4acc56c60ca820603256e895aa0d802e72cd06e81cd1628b7409605322d308f7e162f26f9d9f9febc4c1f8eefc0f1b3cd7ebf252f0fff866579580feb05bf16d42a3516d306719b7edf79dbc32f33f91f32c33be76afb0d6b638c4f2527c30ea952e691fb67f28cd5d23078ab408e7ad16a3097f896bb9e249150608c45abd591241d260c964492c81707134d825147eca792a13d19a2c9708edebb92a12319ba81bb92a13139c62b32dbd4d424f39b8fdc92bc6e89c932f3987332c03b5065377bcd3983fc0318877f2cf8b313ed6636efaa1b82abb7b6a9f6620ec3b0631f597ee051e6c99b96e61c78a873233be3e8557c7aded4c679ad273a3351b6b3babe66cf627c98480692598161fd494282d1a132aa52bc167b02e64eac46231607352636a938c8266e4e81c61470a740570a74a4407b0a503651a83ee254b8cc73e6e7f7e214594d4d404619b3c9939de8f00f42a0cde1cd805cb025fab387e7e6a4e12cd8dcec476f39f902dcbd627736c3b4a9f6b1eaceffbaf98e6d2d2d0fac5ffe64ed1cb08193193e67c17278e18275cf7053e42a68fcfcc5774f7ff0caab8adc99f528772bf1064c2aab15b3389bdda8d2993823e62df9f9f97e7f2f6bf3cbf24ab4537139ec69548677abf66a385f63754a6aca98c6a5ecd8a69623a91baa758fea5e68eb3c416d10e5c4f5c7317428a9a240ba59a5272ae2706a12a8706cb270763961b3139a9dd0e8847227143b21cb09a79d200b68716f2175b302262626190b4be560a732e1fafff2ed37dfc1173f7d7974ddef1edab8e1fe87373003a433d297e0013393259d953eed78fdcdbfbeffc129657ddc89c67735ea505e6bf5812256ad26b830b4bc91b303991104d2a5850e2d9cd642bb16a25ad8a985662d346ac18d4e470be77aa1766961b316a652549cefa6ee8f3203aa5ed42c5dbab97e3b8b93b9b3adad8d17f7edfba5831b75e165e4e971cc11bfc435ab23663226201a799e4acc6235726541a39157ab13ca826a96b78856c0bf79281dc57e9c99be3e860e36ceeb4123f764736ad310307b44ee4be94287b4e01833ed1be0daa523d23a580301f6c357beeefc885ff5c9093077be8b994417998d3a0bf3672c69444b88594d743013e56543ef3bcc9cc60cd30fcb6193527de65ce2cba572a4ed51c75e9245ee0ecc12870c51abed09c60c9635da93b8ec61fd9dd382fd13452435645a50ad3693fc0430263424307a3621c16cd61707cd2692521c2489edd9b02b1b366743733634664379361467431605c6a5da6d0ec4efcc2c9b3f6fb1d942bd124a203fee9ce2df6159fcc0b4dc9ce1f9a02c17f5208b475eeab2b58cb0abbc03d30679136050f658b81ad4090c5a113cf4c8ee8f7ff857e3cdcbebf5cf65c0da136f5c353ac933e1dacab92a55c1e139150f065f5ab9a6b0ccb66febe36d2a6ef4daa6e973cc90f26cab94513c4ddd68aa6bfc4dcd1d737e3723c8315995d34acb09f56f455c2b9ce3cf109e78023634361561ee9f6b2499249fac2467114c32e729ca930dc3eab743d1876f4a87b8561bb8fb4b5f2aeb489acd9ee526119164909d814a8f43ab7573ec60b39975b35999c94687ce96604b2d0eda4c09bee2604222511707ed1ca838d073c415c802310bdecc8268166ca6659205c5a7b3a03d0ba666c1ae2c68ce82cc2c3066c1b92c38450b9af98a8f92ed787ecf2680452aff5e7eab8fd465d343b98e18007ed19ceb8df9308b5f766239c347f8d16b98d8980f96f530169894d6b7073c6559510902e33fb0eccfcfbe7a32bc2783d1707f541d2c5a33a3e5b6a59b4ad61649b33734274d9a06a39facad030db8c00de6bad0802deae17b2fbe248d645f5e7bacea958e4f8e573efbff6df23fb0c91de8678cd4cff802364ec3307a03cf71ac4aa5010291207112653ab80764fa638e0bf7805c8f99cf4df59b3df61d50231d87297f80d9dbb8319feffde282739b4cb7b6eb6b7e39bf95f423f30379acc991a8d16a13711774191d20b00e07ee3265412b4734264d4053acd9acd9a539a5e9d0680cb8611a0c2a8c47aca20be6911e61f6947a49523632821af28b56878af30e4c61724d045d9d439d01acf34be92218ff1b06dfbf63b6f4d2a9f7a4571f818530ee53c8b8f6a9611f72bf48ef48bf489dd24b907afda1e75b61e2a7300d6e8b3e3166c56ad26d3b4eb41d0bce6259a0d06a56a9fbe1de68509b5957924a45d87ea43828f4430fdbaf9fd6684c2c0e1a4d5ab638a84d3ce5827617ec72c1661734bba0d105e52e287641960b165f6a2bd467e3ac62a53e6622bb6f79471be1603ccaf211cdf64174d1a8c1f6e096251bfb3d14921e3f77e1c23fe0e3678c9bef58b34d053f3ef3dafca2a15d04064012186040e70bce963ffe6eff36aa6f9c13fb1acea91fa90e1410c16655a9d55601f562721407ddb695b64db6d336ce6633994455a3aa59754ad5a1e289caa42aa7d57604a8b5681e3a1d4e5497e8eeaba3c5f97ec585f5d24f6c02bd1d809ace00acebef2c5f653c64efd8f7f9d9731d7ff828f9e984a6ba4dcdccc0bf9caa5d68d8f10c2e6d2b98c1bdef818439373eafd8abbbeb1c831118b19182408a60b3e98d462dc725da13780dc6887aa3160cac36a0313296e22093d89c48d94339279d44f6fc32a3ddbb6fb6cc5e2aaeb45cb337d73fc26ff7dbbdcaf263ae0acefbcbad6b736f7ee5157f7eca048df37be6ed35df7db7a6b3e4fafc04858febd136faa17d0f2615813cb5ca956c1f68206460aa2959a51a7255aad96436458266a775f514bcc114a3194c3c3a6997dbed0c07dd6a561bc6ddbb1fc9f7c71d86256605be78acdad70aa8431891e8a1119f0f72bb433ff520256eb5a9d4f601c0f5fbe96fef77399f4901e3faedad8f552fd8f2c8ba35cbee333c65fbf1f8bb5f3db0f9a128acfbd3fb2f1c35ff72fbdaf0aa1dab9a16afb9a521e189e32f45efd83380331fa0739b2ec76ae8139271ede65aac4e87cd46ac6a95d38a334cb4aab8fe03928ce16052126bb33922419b4a9e4c8d1a12d51056af5133cabce6c5f6879e98a47b42963c7a93a7459469f5ccc66bf5d83dec709c11d75ffaf1ab97be130fe57d7dcfee47ef9a785b7e3493f574ae712d79f2d48ff0fae92eb2ef11fb5bfbb7addb9d3182f9619b74cd9cf3c8fb3ab4efafb85198439405465b341a3df4d3f74b7659789a42240a762d31fe0f5308e2ef1b58996db8b721e3b1889c194437b9b45c338cfa7506c18dea9c4e7308267cf1899e1c82790b79ce439e0fe19e7e15a90c8c51ab06da935d02212ebb8af3a50b0359a7d35d1c4c769a585d31da4ca2291d483a9c4b878e74684f87f274684e87fc744078f7461db32bbfb233ff1b6352b8cf49cb840c0637a29e8569c7893906b0eca1ff3ef5da479e9d8ecdcd77ae2c5db06afb9aebde79ede03bc90f1bd7d4df12c99affc0a6db260e06dfb63facdbe89e3d6de6cc4071d2c0c153ea8bb76cbf6d83ad68ca759332c65c959a72f57521d9a648d7d74c1e8db1ad87199e7008b162c86a06ca921dfc00db1f92ea6c7cc72fa2ec7b33715f1a41f7250b191e4832f31686d1000f561be1cc5c38a8319b41af5201ee4ff9b87632fdbdf4d3ad208c7a73e501ec90006a3082875dbcb7b3965977f46569339323480f0c37c177902fbd00f977b1872e4ebe9b5da69a6fedfcfa3a1b5d07720c7e0ff2a0450efa0346e01a46c5eaf48011380046e0241681eb6527f36b4b9739406396b9b0430d6bb9f8ed31f61fdc179de71fea7c895fb543f1232ba552e621944b02191830a9895ec7723a4cf18d269d8b25243fbf8f2fb59a2c1838c95ed4e14d63cc2b9f7aeec967f73f71f4c9a36d8c0d739b13af9f92d2a52fa5afa48c774ec04970a31cd7d2b57c823830029a171831804f48109c442029a9bc99b1db5d181d9a04a2b3331ed95f4653213f1536a742632ab853a12b153a52a13d356658dd094c7eb75df54a53c1e4916316f4435e654da8698a7849662635ad78c4cf689827556d1c4793d6a337dff1db0debb7ad5fce0cec7c2d58e15ea91bbe87fb460a5e535a3b47fa5afaecf3174f7df6deeb729eda82021b4b6d6869601a4a8797adc87e8e870e1e4ef3d0ce4394879d3c34f3d0c8839b07238ff1760f6a170f9b7998ca4317ed728ac2bb1b77aff85f256db1844d4e7dfde69636fec42f3954770e42d82fd1d7e861666017d16bb43a0ed42a9e61595eadd5f38261ad004b059820cc142a0576b8002902240ac009f083006704785f8017053824c06eb9ddedc25681ad144025240a6942a1304be06b54f457c6bc2cbc2ffc4dd06c133e14186c344b260bbd49cae81f04f64599409a301c3b7223aa853f0887289c178e74b507865f3dae284f80810200114c02735e8076e194d021b06d02340b9b855d021b11a05c8099020404c811401480761d687116ed128091fb150b8d82dc5aa5c609736a96d1a88c84b1a3d3c1a5285b2bcc9f5736cfd71de92c6e2a6b6af235cdef91eee25826d14be0664bdccee3ebd7a305af563e4ec23fd6237d2c7d741c5649f7fc1917b3e155e91eb81d9e932630e94c8234171eed3cdff9b6ac1303ae275fcf7a6239bd8e703a793d11d675e97a021383c66a319b9841fe448b99f1e1827aeec9fdcfca0bca249d96725e7f1bde02077edf7eeb84e4973e95d72cdb9d9b0b24910c20b581517aabc6ea7271091ab4080dc7ba45bd35c99a84f16d8a959962b4023bd60a1cfe9a78ab95e3794b59906739575990b35c1a0496cd2b5b7c990820b65bca99bc4734e3121b0080cb0a6bd9c3ad3972568f6beb4be9dbf39d2f3204ceddd5fcf821e9db1d5ba46370cdb607a6490f4b3b20bc7f176c7cee2d7e95b4f7d6bdfd6d4fc32f4d0ba471e1ceae9f254e8e7731dfbf031d6f26cdf73d98efab882e9f66fbc099d380cbe7d4848967fb408ea3b097a2edb3a00b3c8f6b91c3d546ec293c9ce1e15d1e5ee4a18d87b53c4478c8e101e1361eb04d7d6f74a0176e73bc75655f1237f5ed3ff2231e5ee7614bafd63e1e5cbdfaaca07d903493c583c8a3cce14d1e8ed11194b55e4ed162dc43a87b4c51b6c5b2beebbfaf9dfe1a4a0f5e7afb87e36df40427be7f4868277a323390cd6bb544c7aa096710784d5970130fcff0b09cbf936790070dcbf304e8c6c2126d59905870ddcdbbd43870b0debb8b9fee2ecaf53837f4e2bd6cf6c537d807706b91c63c28d977501e7869367b11f5940867025d568dd16cd169b5acd1c2391d1aabd1ea306b8d042323e2bad709ab9d107142a513a63b619c13729c90e2048b1318279c77c21927bced84e34e6873c26e27f46e3fab57fb44dabe46e9f07eaf0e5bafd8a1777b883a619713b638616dfc3070a61326d0f340d1093627704e38e7840e27bceb84179dff51fb111dcec09c58fbeec6dd2dbb9b75d3ecdd86298ed3224e688f1f532230d309260aec36a2c53d26d46b0fe963317ddcdee2ee0e4d977caed043310cbf12e9f4f80939421838281737da7c00bf7500e31861f5430273ecbaecb48cc71798a519ed67f884c96ce137cf4be5e3231ba5d9fa3b543ffab8dccebd09833e115e625a2fbcfcc49e19f1b3789517f3c421705ba0cb3984108fd6235a345a51ebbb2a3915e35193d34cec764e8e1f0c468f96d82b7d30c907f93ef0f9c0ed03a30fbef2c1691f3ceb833ffa60830f56f8a0c107a32956ef831b11fd3a45efa7e8953e98eb83a93e70f9e0820fced2cedd0db6f84019c0471b703e38ef838fe2a4b1ef4d3ec8a1281c38ef02c561cf5db46784929e14674d4f075086df4df952b02e4af4940f9876da73b30fca658e027ac8f241a60f884f390da39fb25ebbd9e5b4d65bc197536a5c95d9f1e713793d87dbf12c497950917699e714dd8f2bbc713c4b6635866f3f184b3a466d5db86253323b72e7e2ddf71f98d5b8740df3e4ef6e8eeeea7982119eb3e0a645e5075eefcc9431fb7fdfb9919e7984babee63fc0bc360133a8ac40925d63241ae24ad6e39ea5e73827ee59d6e66410e504e932e7f136a6d7198c456dc2f48e9ece6413fe833dd28b1f7c28bdf4076882eb3e80318ffd49faf9dc77d24fa0ffe63cf0cc9f3f96da0e4461ca27301d6efda3f4cc2718b0a74b7f91be977e945e85a1717fca8bd49f36051c6a96e53484e839bd41503365c1623574a8417da4ebd3408675e272f59d6ac6a8068d5aada58fb54439d481a800bbe448071a6994534ce39b5e9e9c3eda924f36154f9bd72b6b422f8bb2469f8b1717ea541d3bc6fc728cd9d819e65775ee6366feb2523933aa8d9d0bc8cf838a03befe6695418f51815ec57a53cc49b6a425419b8dd56a13c241a3619381d1f106ad9a15c3413967a68bbae7242896d1f45add285f7a88221f77a9d3e422350275ef08bbdf77ef7d7b115498d6ccd8977bf0c13dc30e84fff4c5e1adb7dfb6fdf7b7adde02274f4b122c4021d7c37ae953f73ee953e9dcdcb2f3ef6ffbc37dab1e39b59fcaf96ef9391cc6504e521e186d379b2d1ab545dd2fc98a608bdace0ac541d6742a09da93209a04e7e8bd2b093a92a01bb82b091a932ec9a1e9ec2c79f97d93e81e2bee7e1ce797031cb87ad423b7461f7beaaaf29295dbdadad4c0aebab162ff1bb2b53635e444efef5ccd9f906ebb7ab50ef99d8732ff09653e94dc1d701b48ff646fa28ae71393099799613059138b261a82863a036b3480f748d7b9401e820abdb3bcd55e56f082813378d97efdc4b260437f08f68749fd710fee0f5abe7f3f8ec5bdb85c05d3553041052ad6da73aee1a7c1da3c45577965d466e6f97e9569731e918d27da19cca00c363727c57349a2cd733f496f4a5f75764e7f5a3c75f0e957f39b1e2a7fec89ca5cb003734ef23fe77ef2c13d070a561fbf66d5d29ac93ef9fc06aa53572e5bb9a260d6c8b4c4d4ebe6de32f5a917ef6bf5345635365c5332da6774fb46cd6cc2786e43d7d7ec3f693c675729cf6f662bcf6fc085119d2bd735a09fd0f3fc86ae2f1583eb2b09a607ce3a49924948484a4876b13aa7cec812b58d4db06c4e86b5f47ca432192624430e7505b664384f0f505e4c86ddb4412419ca9361266d604a062e196ace50745b326ca1e862da3f85e2b0f3bb14b5b6175d85a8427103eda290c3f62390d6ebbd682984f47142cfc6094d8a13ba900c67e2b4d07b318d74fc4032e453fe4972f7fe5dd6c775ffca6b5fc99ff77a08e0f0e7c7b6e6983357fcf808346b2f64ca4f2cd0ca01753f164680dfcccfd20e1b246db95dda34d2c3727b2fc0325baa4a83594fe3f7ecbe1d9b0f565d0cb0ed7beb1b8e5e9cc9afba9839fa8e01831fb1b36fa1cb614831dabe176d5f8fd9e8e080cda232101571f6d31ac341742cf61ec772b9e7a616f9c169bc8ca93ae7fdf95fff3aff0d909fbf39bcf1e13fdc73dfae9d5b9817a49dd25de8b42be026b851ba57da06c3c0227d27bd2ebd2b7d09c9683722da592dda8d891406ae62196d42829e61cd1683be2c686089aa2c186081658955a4af13145b2060015179a340f6b999f183c2eec896ef5e34664fae07dd01bc2a3d38fe59cb6d65b5374bff84939fd8a0c91d59bda9852dd871d17bf22be56c8063d167e9c9c6408d460b3a4cc6895eaf66394e30b8857c81916f654297c01905a5b852e0f384c08c5945e598cdee12e44c983f2d6066acd43939d5cd1202316487704ed0aa19c09c5763e40967571e8de73bf230db458bf0e1bd49d9b4b3cdf22b11b16d03d4d4a5d124364bba776d5b1b7cf48e3411de806f17492bf91317438c2065763e209fd548b3b9fedc14d4648a7c56e3246eb346a325dab45433676794b31a8351e36206d2b39a34c84f83cd69d09806ee34e84a838e34684ffbdf9dd5c40cc033709037b13ba8b0f73aaa49809eb39a5f66f15c9bea49ccbcb8ac8756bdf2f2d15bd6ddb43c7ffdb6db57c88735cf691e9682bceab1e1dcb06a6be53ce9bcf4f167c7e71cdbf6de6b2f517f52833a31a06d0e206303623249306aecfded46c2b9454d7282c5a20f072d6a5c7c2439fe9c29f6a04c3e0cef93a7fb73c7f2979c7627801aff3cf61aff7d0fef6c9eba7e79f87ee188edc7e3ef7d3169cb5be1f50398d32b971cbce737bf593f2bd27ceb62f39e575e7d7afac30fef9dff40a1f21ca48ef226c71257056c1a4cca09e66706816875da4850a7e29ca4f791afacd66c149b8eb17b4d1640a3e40c7f39107cee0b3074ead947b8b3d221a945daf2270cb64b60dd36c29220aecb24fafc2b8564929240864fe51692aca9845813b5824a95352c513b70f0c0c14b82c68160550d1cc89a4cc94b8226353b7449ef35dbfbe1d0e50f727373868fc8cd00e50437f61880cdf1c40302ab121c98e41382a49ffefe59d7432bc2ebfef9faa97fde1eb963eb27d22f2bd7dd79ebca75de1d1bef7c1086dcb719eefcd37fbdff52cb7336ced5b6fcf7afbcf8d8f2360797f834239cbd79d9f2954b3a2fae59b7e956e9e38d72ac538e73b4e01c657b9d19c8186051ab9c06dc432c6c6a9ac163f4608c63741b9904d66864ed76573868a7cf3d1c18a6298f082e9d6377bcd37d3ed3fd7cc062a50f90e82c2dbd029eb1c059a41fbf7ff4cfbe7dc38f6cdfcb0d3e1e79fecc4f1f7ff5dd8b3bd6acdebab5f9fadba7301f4bf74bb76cd8ee8a8208fa398b80fbe0e34e69f7febd6fb63ef0e0c16b57537bc8407b6893df9182acc087c0700cb2aa2168f7f2590d585668619216466b21450b17b4f0ba169ed5c2762d6cd0c24a2d3065f49d8f2c2d18b550735a0b6fd297413669414118e32f89207c3f7d7fa491a202f43d91b31485c0060acc8fbf57320211a7e8fb24cd1457ac854c8a3845a96ca6432b7024246ac1a405e54d9563f11751ca292a9f629109f5afd28f2b6d728b7b23ca7a703d2bc391d773ceeeb133a79e9792b9dbb92f2eb8b82f76ec50e2613966afa267e856921e7018791de189cdae4a280baa58de88d2b58876f877b9847cdc455813514eb82c7cd55ee995139dff84b7a11ad6b5cbb12b6e07a3b67f751bf3e67f494f3fc9af92b6494f810aac175ad703d5eb51bcfd86be47775720a49c53b1c412e0a1fb7488f090772e7e3eac1c0f15d31322424f8fbb8f8e15a0290edf4f4f947ab71779b854847d657bc949d1d163f24b708aedf13ed9178126f092462b9f20133dcb733aad5e25185cc22481d9203c2b7c25b09c60137284090277a37ca4bc56d822b4092f0a6784f38266343d0bd60b705e808fe8c1f21f05d822c00a012a05c8a25842b1a7287617c53652ac72d46ba2e7c8791d02bc4b33a5dd3453b2e17011814d1166e2786d38162f0fbd0587e402f43c384b6096a9e16600e0746a4ec3e34e6fa19994236fde3ca069f2bf8f95141121a6d7f9efa567bf5ca914948adf619c92f91d580fb7be230d60f44c6de76f99bf328f767ec00ce95cd0d93f6e6bb5b173d9d9814c3018ac5a2ba689095a22085a8e75380d8c155345ab95c40f61894579df4c7402555076fee593af583e2eefe7b197a9644f0b6cfc1096bb0b23a389c79807be05f6f0ef61f34f8ffd4e1a0d271f789499d879985ff5def3bf7b3fb9f3f7ecd72b5675fe24fbceae37a4d9b177ce4ce4c7c03e1dc6292421c16c311ad5fae2a0daa5bc78f6a6058e5960930588051ace5ae014ade45ba0cb02fb2db093561be23155160dab4e5b206a815df4edcda9b47126ed7f35f6394bd16fd216886eb640a305dc1630528a0aea1825ad744660071db5bd57e3be2abcccd1c7a5baed3e2a20ce9e77dfb29597dfccf21e3628d7419fa3ded976f3cd53b2c7168c54de859bb3ad45bb415554cb3daa3c2b93953c867f0d03af4d815ac18aeb9c61ec9c9d7324ea8cc5411da6a72ab638685519c1ee76643aa63aca1c2b1d9b1c3b1d6aa3231f8bfb1dc71ca71d671dead1655862141c6bc4a6fb299c7704665516390283d28b444796a3dcc1061c306fb1cf374f7e5e21fb3dbff22e0cf553d94ab0a704066813de5c3fdd9d947722fb83df0e756dbffdedeadb27e50cf5168c7d873d7c71227b78cd2d5b561beed414de105a43cfdce97b913447e363efd8d5c4deb17398d318c74447928af4ced1d438cb9fb951d8ee86c04f40545a1dcb302a1dab376819a30aecdb0db0d600e5069869800906100d60330067800e03bc6b80170db0cb005bfab6511ad4286805d71bf111852b74e752b8ab2f7c03854fa270bd014620e2f5be88fcff8c91ee36bf6ec0141b20d300260310436c1b2bbbd4935cd116af9cb061bed6f7a4c5e305bf35d1910f563f53f59eb4acfd5b61a477d00fc7b8519d81c12f2d59ca1c475d549236ee5aee218c21c707d2b418f8b0ac60d8c3006b64ca18c6a062e4f8e189a0f67d358c50dfa166d4fc417a8040ad483940e8f52a686c1b958f98eccccefba45278fc3e789c299766c2be7b619f34f35e59ff380c3f057d9c0663ea34b5063723d43faf61755a5157ac63b274e5bacdba76dd391d9fa90335c3f260a1d3835e2e56f1b038437060fac926bcdcf9c2ab70fbcc99b0f655cc2fc59f7f663ba8ade172ebb76d8dab747a9971ccf7c4adfc2fe12b819f1f8cffdf99ecc5545efe0c91ffd1908901b19f7aac743d19dffdef6970c9bfabe5ab0839c9cf221c1726ebf19ac5ec557ee1cfe44e843f8ee5d9f285f022194ecb79b87987c90efecfa496e20985b9b17c3d5ed3f15a87b0bc58bb4cee73f238f65f89e5b548b705710eac1b64fad8e60ebc8ed3b150a02a1c5f954742485b1e5ba67f37e2e6e1ef06c4c9b0626c27e2d522d3c3ab06af3abc827895e35819725fa47914fbd132fcb9eb0dacf7a7fca348b87da41271a83f92466e21efc270a885430c61c63173982f5903bb9bcbc16f39779c4fe7efe24fa9c6aa76a87e50d7aa9bd5c7d5e735299a16cddbda1dda3774a350cf9fe9530c01618cd022fc35616cc256e340e32893cd34cbf45bd32fe605e6a8b9c332dd72c45a69dd6dfdc1f6a0ed9cbdc57e3ed190f8b6c3e01847b5914f86e1ce33022f06f79f4c7203aa7a37c3118e6207407db7ce6677eb0f88116b4a99413f541d2bb324892c8a95396c7347accce33ebc3556569104f248acacc6d9b7c6ca1a62035facac2509901f2beba00ea6c4ca7a92cc1ceafeefe20ce6ed585920b96c9cb70492c4e62227c0c9f27d929d1a2b0319c076c6ca0c49e05cb1324b72b821b132470670f362659e24712b62651549e6ee8f95d5e43cd71a2b6bc860fed158594b92f993b1b28e799bff47acac272335cfc6ca067283e65fb1b2406ed4c6794b2039daa727d4d5d445ea6ea9aa142b43919058d1d0b8bca9aea636220eae182266670dcb12af6d68a85958258e6f686a6c680a45ea1aea3344ddf84bdb658bd391465128922e4eacafc8985cb7a04a692cce08d587a757d52c59186aba265c51555f59d5240e152f69704975565553582e67670ccbc8e9c15dd2b22e2c86c44853a8b26a51a8e926b1a1ba2f0f6253554d5d3852d584c0ba7ab124634686581c8a54d547c4507da538b3bbe3d4eaeaba8a2a0aaca86a8a84b07143a416d9bc7149535db8b2ae421e2d9cd1cd7d2f51cc88542dad12a7842291aa7043fdb85018c742ceae69aa5bd4902e2eabadaba8159785c2626555b8aea61e910b968b7dfb88880de15ceaeb1b9622c9a555e9c877755355b8b6aebe460ce38cc57055535d758c8418a90d45e4992faa8a34d55584162e5c8e4a5bd4885d17a09696d5456ae5d1430bf766285ca058aa519a62dda2c6a686a594bda1e18aa6aaaa7a1c2754195a50b7b02e82346a434da10a14164aacae224c858132101b43f5430b96343534562193b3af9ddcd310d95204196e58b8b42a4c5bd757555586654554e2141762271c786143c34df254aa1b9a90bdca48edd05efc5637d447b06b8318aaacc439a3a01a2a962c925584128ec4990b55343520ae71612882541685336a2391c6519999cb962dcb08c5b452814ac940ca9957c245963756c554d1245359b470326abe5ed6da12aa5a791233264e16a736a27c0a913931d6205d8cdbe4b08c61b121508c758d917046b86e614643534de6d4c2c96402a923357845f0ba8554e1162de215c27a084b15a4813492e5a489b6aa45a828bfc04986e06f36c942a79885a56bb15503e217627f11b7b1066cdf48ef214ab781d463ca26121dc55d995e3696a6c7f828a2fdd3b134112954208dc9d86f01627b5316c90cacd59330ed574396201f216c710d422a10528fb4e41e22198ad795295c193b8b62c2ddf06ce468185e3997ed77659a758811a98c231423f3b888f27d13c21a70b3b8921c446c5745f516464c15ad5552aa32ed126c3183b62aa63d651944e868f5b4d5cccb8c381547acc6fe155487f1961594b66c0b0ae5062cd7c6a479234aba89725049fbc5e716c6917f2dfbcb5bc50ccadd523ae6140a97eb618a1b87f5706c5e8accaea1e32dc29a2c8b65c8893c6e2d2d87a83c2b696fd9b6ea633d17a0b589571c478cf50dc5f4528fdf066cab7029f7498fc9bb9adec374dc7a1c43c4b2a26391722a73577d091722955888ca5fd1f922c44668db0a842fc4eff2d84a5b84f251465d105b4bcbe8caaced9e3bb6f70ca49aed9185622dd531db1429b411cb0d94f7b8f486528dc8fc5751aee45288aef405d863211d47e1a396da44886ab42aa6e108e5362ea5cad8ac640e1b29642829a0d620afeeaa982467a35f987c598a8ab47a5ba4ac898594df702fdaf594db4a0a6be896acdc6a616c2465c60ba9ffb9a95b2bd5d4ca14e955526a43ff8d7caba96c22b1511b284795f855f4ac585403f65d42b5a6ac22c58623bf925c88cab721d6af917aa1488c97457455d452bb6b24a33080cc44eee46f06b5bede6ba522b65232623c67fe8ffbc97c355209f65e154dddbc2c421e27c7d67c7df75a5bd26bd5c63531033dcf64ea251a63f65318939c78090579ad5cea2787513fd977168a35d6613d42f909535966d039d4207e2a8e30598e9595bce92846c697f95ce3215a3906863c52026363bfe320406cc40dd7e0af1b7f47133f8c42f848fc453c09805afebf087adf095c602fb477c2fe4e209da09b7a01c40bf07df160f7778583ddff2cbcca7daed0e72e3bbbf22c633c3bf56cd9d94d67f79fe5f55f9c19e0fefcb342b7f133087c5698e8feb4a3d0fd66c7e98eb31d6ca0c33fbcb0a3d0e9fef69b2ef737f0f792af8bbe2af9329b94fce3ef7f2ff9ef2252f237d2e5fef8ead325a7812df9e46ab6e4af6c97dbf89efb3d86de02af395d856f1e87a3ed63dc2f14a7b99f7b7eb0bbeb69283ed278a4f9082bbf58da75c4925de83e9c7f78eae186c32b0fef3cbcffb0da79081a0fec3a103dc01a0fc0e6a720fa14189f028df160fec1b307d9e6e8e628138db6474f45d9ccfdf9fb995d4f449f60da9f38f50493b92f7f1fb3f38fd0bef7d45e66ea9e4d7b98cc3d0d7b8eede9dac3edd89ee22ede0e0d5be1d856d85ad8df7dff1687dbb8c5bd65e5964d5bbab6f059f704ee619aef81c64dcd9b98cd9ba07dd3a94dccd4bbcaee6ab88bbdbdb0cbbd731dac5d33cc1d09e7bbc3389186fa31eefac25c7712384bfaf99d256a3f5ba2c2a99723ae0caf1b0a87b9e7ce2972cfc15f6bb6a58447f170d96cc942160cec187632bb90fd0dcb9f9dd615a89cc604a6e58e2c0c4c4b1d5cf866314c2c14dd4548f95abcf617c2e9c2b3854c73212466db4bcc602c31651b4b1840fd1370bb8df9c632e34a236734661aa71a1b8c9b8ca78d5d46753ec2ce1ad9060253093427020f476073ebcc193edfa423eaaee993a2eae2b951581f4d9d21df03d3e64455eba3a464cedcd25680bb83eb366e24e3fa4f8a66cf288d96f70f4e8a56622120179ab160eadf9a48c605c3917064894ffe805220119f2f1c964b20d77c0a8e96c017463436c34e58892c21615f3802e1302e9608c2c3301fcb617435080f6346888db0498c7e37251c603e12c25b4419221cc67e61a4138e0de79c4ffe17e643b1800a656e6473747265616d0a656e646f626a0a0a34322030206f626a0a31313932340a656e646f626a0a0a34332030206f626a0a3c3c2f547970652f466f6e7444657363726970746f722f466f6e744e616d652f4241414141412b4c696265726174696f6e53616e730a2f466c61677320340a2f466f6e7442426f785b2d353433202d3330332031333031203938305d2f4974616c6963416e676c6520300a2f417363656e74203930350a2f44657363656e74202d3231310a2f436170486569676874203937390a2f5374656d562038300a2f466f6e7446696c6532203431203020520a3e3e0a656e646f626a0a0a34342030206f626a0a3c3c2f4c656e677468203437382f46696c7465722f466c6174654465636f64653e3e0a73747265616d0a789c5d93cd8eda301485f7790a2fa78b5112dffc0c12426280482cfaa3327d8090181aa92491090bdebe3ef7b8add405e8f3f5b1f96c7cd3dd717f1c8725fde6a7eee4167319c6debbfbf4f09d3367771dc624b7a61fba258ef4bbbbb5739286b5a7e77d71b7e37899d6eb24fd1ee6ee8b7f9a976d3f9ddda724fdea7be787f16a5e7eec4e617c7accf32f7773e362b264b331bdbb847d3eb7f397f6e6525df57aecc3f4b03c5fc3927f818fe7ec8cd5714e956eeadd7d6e3be7dbf1ea9275966dccba6936891bfbffe6ca15979c2fddcfd687681ea25956e49bc056b93a80855c800be5da824bd61b70455e816be53203bf291f74cf153335784bd6fabbb2d5fc4e59b4bea78f800fcc97e0868c7a9ed1076e39fd45ebf417e473fad7cad15f33f4b7f0cfe92fba0ffd8b0a4c7ffb068efe387b1efd7760fad79aa1bfc53de4d15ff3f43fecc1f42fe063a33ff296fe153296fe05dc2cfd0bec6fe92f70b3f1feb54eff12e7b2f46fb660fa17ba27fd05f76ce95f6886fed53b98feb566e82ff0b7f417fc7796fe82df15fa0bfc85fe25ee50a2bf72f4d70cfd4b5d4bff12fb4b7c3ff011fa5738a3d0bfc1b984feb5d6e96fe12cf42f2b7de4f135e3b9a31fffb491e91ede8716d2a6d5de41d70ca3fbdbd7f33463957e7e03d28bf56d0a656e6473747265616d0a656e646f626a0a0a34352030206f626a0a3c3c2f547970652f466f6e742f537562747970652f54727565547970652f42617365466f6e742f4241414141412b4c696265726174696f6e53616e730a2f46697273744368617220300a2f4c617374436861722035390a2f5769647468735b302036363620353536203535362033333320353536203232322036363620353536203535362035353620323737203535362037323220353536203530300a3237372035353620353536203535362035303020323737203535362036313020333333203535362032323220353030203333332036363620323737203636360a3530302038333320373737203732322035353620353536203636362035353620383333203535362035303020353030203535362035353620353536203535360a3535362036313020373232203237372036363620373232203232322032373720353536203530302035383320363636205d0a2f466f6e7444657363726970746f72203433203020520a2f546f556e69636f6465203434203020520a3e3e0a656e646f626a0a0a34362030206f626a0a3c3c2f4c656e677468203437203020522f46696c7465722f466c6174654465636f64652f4c656e677468312031313131323e3e0a73747265616d0a789ce539697853d795f7bc458b37e949de64037a42d8c6f5226f2c66891f5e841d93da603bb5d86c61c948896d094b40494231699b80098134e99a26e1ebe4cba42429cf64c159dad049937486f0252469429aa6a109dda649a10d74fa017e9e73af9e8c21cb7cdf7cf36f9efcde3df7ecf79c73cfbb92e3c39b83248d8c109e287d83fea8525c504508798510b0f56d89cb3fb9c15787f02942b85dfdd18d833f38b2f61c21428810e3131b07b6f56f87b2e709499b4148464d28e80ffcf29548292179eda8637e08117ddaad469cefc2f99cd060fcab9fa474aec5f9a3386f1f88f4f95f2f3c3917e79770fea541ff57a327f9b77842f21147e421ff60f0c09d777f8cf366425207a39158fc6d8049420ac7293d3a1c8c9289476b717e127dda8f38c00fbdd21034d039c70ba2c16832a7a4a6a56758ac928dfcffbac457c457c8767127c922dbd8f38a4b584432c95642263fa2b3cb4fed2b93fff57fe985893dc10105e43cf9cb34c2cfc91be419a29257a773431114d3ec818d9c26e7c84b9fa715f539610503df2727c88be4c9cfe1e3c88f61829c0407d6f9118428ae8ebc0bebd09f8388db4cf6c225d8062e7200ac8c5a89ba3340f80c5d4bb1fe4ea177f79053e41e6824a7c418ef40c249ee45f2437e27779c1c439fbfcced45dc24799bbc0215d04462e409f2105310437b7ba76bc472ff11f91ef9fa65acf813ed3971e744059126ff419e22cfb108ec20a3a4774ae82cfc15f6e39e7480099239fd5992686ce66fe09ee2b889bb717217d988b71fde41eebdfcb2ab9673508b682110c9dde8c107b092ec432d3fd19ed61e24ebc921ee57a48bfc9d3c2464197057f1bf2356ee02b1686fc27f4e7e42c699ef7d2475c232793ea1ccb053d84ab28477680d4dbea8edc0b81e277fc7e8ff0a1ccaf235ab7ddd5d9d1dab56b6b77df9ba15add7b6342ff7363536d42f53eaae59ba64f1a2da850be6cfabacf0949795ce2d2a2c98e39eed72e6664a564b467a6a8ad964348802cf01299555e86d52f90259f2fadd4d6e7f7359a9dc941b6a2c2b6d727b7b55d92fab380885eee6668672fb55b957560b71f04f43f7aa0a72f65fc5a9243895294eb0ca4bc8126ac22dabc71bddf238ac5ed98df0de46b74f563f66f0750c160ad9241d272e174a30afa8b77293eadd121a6dea451f612c35a5c1dd104c292b256329a908a622a4ce7547c760ee35c0006e6ed3a2318e98d2a9595c69933fa0b6afec6e6acc77b97c65a52d6a86bb9191480353a91a1a5423532987a9eb648f3c567a74f48e712bd9d05b92167007fc6bbb55de8fb2a37cd3e8e8edaa54a216bb1bd5e29b4ee7e2ca836aa9bbb1492da15a5b574dd969bd6c1254b1c0ea9647cf135c8efbe38faec4f8758ca1c07a9e5050e51a5458d5eda257be17633d3aea75cbded1de51fff8e4c806b76c758f8ea5a58d469b30dca4bd1b558c4f3eb3275ff5dee153adbd2158e4d397ee5dd5aada57aee956b902af1cf22306ffeadcae85f92e698aa7fdf3c804c382c1c108bb5c340c7bc615b20127eac8caeec45c261bf20f13c553e253b95e4a399aa4647551ca48923225deebc6dcb676748faa42414bc0dd8411dfe35747366075dd4013e3b6aa19ffc877b9476d925cebf1315e19bd6a098465552cc420a1d47401ac1b2a326a65938c7f24868ff3d140a164936bdda886ea697237f5ea7f5b42b9a840c6403797240aa1b35b551a1150fc7ac69ac62a3c28e1efc584851b5932558f3baa66baeba7b24bdd6a0a777433115d4ccd6c50496f9f2ea57a9ad8be929b467b1b132e505dee95dd4f93eac953633572fee3d5a486f81a29737603565961d36877a05f75f6e60770dff5cbddf92e55f161867deeeea08f961d46a8f8543e2b0e1fab95ceeed60e77ebcad5dd0b75471204aa4e2868ba4a8dbb3b3fa1060b50351598e46e2e9ff721a31511b2170177fd127caac60213de560c38c3d2c2ad5f2277433e4972a31b6ab1dc146cd4f9e8fc0aa5222da786e6a436039da29e86e67c97cf95b8ca4a3924cbba619430d1a0362749d8a69060c2fa6c6866281acb5c5af472b73be8f6b943b2aab477d3b5d1f0b028ebc16031d773d579c56c5ab0304cc485e4e4840653f596e44f0faeba9ccda7a6cd57915b926479d4e46eed18a5caddba42829eb7a88496b0b250ca67bd806e6837f65ed98a5b9a6de8d13145a19b39b4882a71b70446dd1ddd4b1837f693edf937515b36d20aad9df565a5d8daeac7dcb06be59802bb3a56773f8daf5c795767f7610eb886de7adfd81ca4753f2d13a2302c47b1144927329d504dab706262fcf94f2b848c30aac0106cde370e84e14c491c90be712e81b3260c1532430ae1902224284a925b409c29811b6138768d111a322545544c8a5949e3d2b9fc31a0a8c3887906df9266208fa7413ae48fa1d42a861e879131b3929fe018410e25e1e1aeaecba6bb56773f9e46508c3dd1503dbdb05c7243986c7cad34c9015a28b7f842a3bd3ebad94836a606ff4005f7359826f735e888214d4d7107ebd554773dc5d7517c5d026fa07823962864038a8f60eedb55a015b0a6db855b52cefbf7fc51ebc734533e6c2aa3d6df97a173c7f1345285e7469e18895349377022cff16693c80b88aa3bee392ed9a0b656aa96aa2b2bec2ec965975cd2712178f1de15fc7171e7851de2bc8b39c29fe9e18023d5a8eb2ed4652416cea84ca60349e34ca898170ca249301979ab644ce37a7ce926312dcd404dd86e93202e4140820e091a24a891a040826c0938093e91e0b4046f4af0a2044f49f02f12dc2dc13724d82c41bf049d123431fe391264492048103a2fc1ef93028f4b400e48f02d2681163648d02e41bd04554c2261e1ac041f30815f487058820725d82fc1ad49fe5512344a309ff15b19ff39e6d15b49fe1f49708f04b8822d6c05097ef4a850824c090c4a4482857f4f8afc9b044f48f010f327c18f2bf032669b04409876d4ab4a7080e94d84a53da9349329fa05d3720fd312650c8d09e750deb47e5dcfbae4b5e9f235dc333cfd5abfeeaa6bd355d734de9eff4182d455d555d77a6cb5d52524d78395928395524d8b45b261d1d4d65656b878fc80cb0cc60c40b04818dc3ef1c7edda3b1c076b3932b1ca9032e37ef8f69e120869dfa3f5243c9c3d67ad5603dfdec50ee36437d6d452aca974d2ae78484a4aba5110c474d19201a654032f125baf05da2da05860c402510b1cb5c0010b545840b640c2575c41c2cfdaa9524e94b30bb2b3b09a5d50380f07fec3891fd8b40bb0928bd8c0202cbdbff7d2cfc59d179ff9ee2d7cf5851dacbea92f9bd01733b1911a65a6454c2122c9b41b327a7ce88aa5c727da4632a12213e44cb48dd1c1a8d4954cdb4090c9096eb42813a8292c01a9baca266e7a447bf93f265e020d02709bf6f647ef9eb8f0b353dcb15f6bcf3e2aeed4beaf8d7d78e6d272fa652961ff3e168b2cb24ea986b4349bd9c6f3428699a4a79b053e273bcdc671b61e1fc7115194d01fbac5a2397020072a7240cea111614943a7486dae870d7adaa464de12a171d1c85409599906a3196a8a0127f38595f8c5e121ccddd14b607b781f6cd7eed22e69b7c1adb78c7039137f1677be73ec9eb7674fa8fc89635a6f34d1133a273f123f14bf83dfd77349b3526a37a6637b70e4a5587b7c298290dde313ec07f260240fa279d09b074a1e54e4c1d93c90f32059689f1347994856c242c9b967735999361acd0ff19bd549ed09ed76f82ab4e1679bf6c6c9175e3af9def32fbdcdbdfc1bedf018dc0e9dd001b76823dad869e0b5c93ffc493bcfbe07b25ac3532fed85fd4a137e6b1344e089ed9488483820c27e114644681741118188705684a3495254845e119c2220f36b493c324fdf2ec94d45eaeae852e83aaa31c8bba188d67db2d60d683f95c4956b45b319014835a4f04622a4a58ba61e9f45dc213e20f216719f3889032f6667b55844c814c5ecb416512400428f0f7d36f7f8884d49878a7490d3a91353216459ef59bf8ede9b4a58ea114a4415bdc972e9f76ea1f3d21bdcd9092b7fbdb8f3b476ff696defe9648c8407d14791b81589c6c86044833c35d86e04dd909eaac40251191471e7702ff59d9edad30617eac8814165328be458d33372321cb9428ad19e632fb2f3a694dc94b929bc39c59e65e1334cc4b6c701373aa0d5018b1d90ef808b0e38e3805f38e011073ce000a4c61db0c6016d0ea87140aa03364e3ae0b4038e39e059071c72c03d0eb8d9011107343aa0c4014ec674ce01ef3ae055c6f36903c798f63d4c700dc37b1c203860c15f18ed0907dccbcca2cc1ca60e65de4cdafb0653d7e3004e71401d3378d601a798b5030ed8c15c45bcec80c789038ceba7b7d69eabea65fda7fbeee7f5f3645366dd0e09743fb34c607ee9ae966ae62fe08cbc3b55ef7c76272cc09d2ee68379f96ced75edc6346c807b2e6557d4010fbbf9eb672efa8df6c90d97fecadb60eb9f5a2f1d14775efa68c54f3fe01727ea3507d37f9cbeefa151f913e0d9cc882707dc3502ed3c606bc78310f60e33cc318360867366386d86a36678c20c0f9a618f19a2660898a1d30c8b933ca18b8ce998190e9861bf19bec1c88d4c4b42c5bb8cfa04938f9b614d5238d50c28fb1733bc66865f98e15e2695cff00bce3199671916c56e3643c40cad4cb284e945a58f30d21a864799493370ef9be15533ec637e569841c6939ff972ae7ad67d2a17eb3f95a84d9f9da764a27047926abdff6257a32999e7cae245ed1dad56784ab8ef629f70dfe9d353ef1e2beb0d76eca3c51683c198869d342b53c44e2a8a069309df3f26de601bc9826816f46641451638b3e0b2a564c79f7a07d23e9a016ebdd38b7a9317adb7fcf101ed47d8e5b74d80a4bdad5dd05e85da9bbec1bfb0ebadcd1abaf0e75fff565bb08de69ff6f67dd8db73c92aa52adb6cb5e0c9d1c2f3798e347b8fcf6a4d13089ec3398247ee11ee28f71a27a6f21c6730107c5ddab1cbd36681ebcff5d05e5457ed2999f626aaac2890eda221d9e5ab841cb11cdcb30dd8e6f97c480d017468cf9fd21ed5f6423f74fe1316d669975c3ffffa2f5ffdd59b90e67fe565d809ab610dc45ffef9f21bb6fff3cc2793c9def53df6fe6e56be0434689c814f49a54dd30290ca83925ed90c201a8de8a291176d15a920a7026d9f57f4ce293f59ceb25800b3f0a47d62c2a3bd235884fbb415a7272e62dfd463f40cc66806b95629cecbc8b40bc60cbb681466cd3488180743aa24e5f4f832332521158da6da2b66813c0b921dbbda332d6fd36253357fc13c2c15692a4018aca9f814c64e2ed61ee6faa3daf75fd41ed6ee8438ac83b3b76b674b9fdbf1dac9f7df68a879e1d7131762b7c276580f6b21a6ddb5eac6a14b7f39a35d447f6f467fafc51849a445294dcf10850cc16e4b1712ef147baf1ddaeda0d861c40e513b1cb5c3013b54d841b64f3f6c31cfa7bdae45199b9c4bcaccaeae9a4f8f5a56c2bda1bda71d83a2077e70ff4128d29ecc841960e2375d7ae85f1f7bf2c77cfba5fbb573da3bec5db118fd3160fcbe8435e649233367ccce361a0cd93388505a92369b7738e41edfcc990e814fc19233cac60a235f61548c9cd1c8db09c60fdf7297e378e55987d6bfe092e71415cc826a795e4d3914950bf36ae6b8e444b5c95999b32067162f1ab4e3b80ffea6bd520a33673efc6d98b77ce791fb6f09788bc00978560463a1f641f6ed5fd3ced5461f3976a87f3e7ce7d5778fbee089069f5bf2e59a8282b2a5d7c75b9f3ff6e04f8bd6ac7d7881b7b2a0a4c57f3b999c4c9c6d8d4e5b21ee6f2219891deec43567e38b3b23432c841c9233474c2b2891e6117ac3e4abe205ee5da313f7db42453699b3b2b3f3cc8eacf47471bf8fa4ef5b436cfb7da61e8c99624e6b26c453b2aeaaa4847518b8bce2d9e5785a3218ddd770d555b3f09ebfa03a03e052a9afb375567149c66e53e5da1565ab3b5b66ce2dcbb8ddb849bc50e8292cbf6ed3a6061c2bafbd6f1761ff7fe11cdf5ff0b190de6359729e3813bffdffb2255498fcd179f2d5c98f0c2ef4148889ae2df1c33a21c66bb42f9386cb3fb55ff55b75269e728f8b2f936abc77276f432de9e46a11be9eec163ec4f94136e6d039d23b190e7910be19718b91975039eee024fd9f4321b4c377e02dae82bb8d7b89cfe51709b38437c559e2165135980ced869fe1e72d639eee4d2629417f8bf0e6889578c85a42f8ebf84e2230ea2c189af2f9fa29ff815870968039e40cea304ff248588705d4fc751d16f1fcfe5d1d3660377f50878de4267244874d24132a75d84c32a0498753200c1d3a9c4a6670cf4dfd37ac9c3ba9c3e9641e6fd0e10c92c72f464ff02587b347f92e1d06324b001de6884970ea304f6a84221d16c85c618d0e8b244ff8ba0e1b48a1709f0e1bc939e1051d3691b9e2111d369319e2fb3a9cc2bd2e5ed4e154b2d0745c87d3c85ab3a8c3e9e406b35f8733488df958637863381ebe29189003feb85fee8b44b70d873786e2f2dcbe62b9aaa2b2425e1e896c1c08ca0d91e16864d81f0f4786ca531aae66ab9257a18a667fbc546e19ea2b5f11de104cf0ca1dfea1587d6420b02cd6171c0a0487e532f92aea555399725f1f1c8e514455796579cd65064a2fa3f46932e198ec97e3c3fe4070d03f7ca31ce9bfd2157938b8311c8b078711191e92bbca3bcae5767f3c381497fd4301b9734ab0adbf3fdc1764c8bee070dc8fcc9178081dbe61f370381608f7516bb1f2a9754c0b48473cb825285fe78fc783b1c850bd3f86b6d0b365c3e1c148a9bc3514ee0bc95bfd3139108c85370e2171c336f94a1919a97e5ccbd050640baadc122c45bffb8783b1507868a31ca361890587c3fdba0a391ef2c7e9ca0783f1e1709f7f60601ba66e308aa21b30575bc3f110b5ee1f38589ef002c3d28f2195c383d1e1c816e65e59ac6f38181c423bfe807f4378201c471d21ffb0bf0f8385110bf7c55830300672d43f54d6b47938120da2935f59bee23223ba9508642c32b0251863dc43c16020461311c0250ea0101a1e88446ea44be98f0ca37b8178a86c9abffd91a1388a46647f20806bc64045fa360fd2146184e349e7fc7dc311a44507fc71d432182b0fc5e3d1451ecfd6ad5bcbfd7a56fa3029e5a8d9f345b4f8b668504fc530d53238b002333f44b3b699a5962ea2a36585dc16c5f878d13959672895938559595ea99bc03086a3f158792c3c501e19dee869f3ae208dd89036e21dc7fb266c540122e3edc7b91fa13e122151b28d0c33ae1062653217b1c53856910a5289b74c96235704e903282f63338f207f943dfd4c6f840c917292c2285facad0aa155ba17cd4cba14a11694ef430d2b506e0352a7eb954907ce86488cd4e37c00259721dc875c4308535e9994e1fdc5b25f4c95a7745fcf7862531c55e85525de359fa921295f3625ffd976c2cc068d779c51a8df83380e931b111721fd5f181519f9822c8731a404d92cc0b452dd5dc8d1c1b8da99248d4b9c591b625c9d9f61b10d2df6a37c1fcb6792b38fe9a67591d01c4138a447f806b2996535869c542eb9b6185afe743e3ebb423a98775b98cdeb189ece638c568ff398beae44cc96317b8338a3b1d88a9e50bb2106fb593c034c9a56da902eb9016b4ffe423bb22eebd7f332849f08f226bca432a57abcfbd933c6ec0ea10d19e164b5c4d83ac32c6fd3bd9059c4fc2cfe899c0f2235ce78fb103f809f6dfaae1bc4f824ac6ed0f7d556b64b43536b477ed76c96d9cbb148544bbf5ea532c346118e30df93d12b6319a1fe07995714f2b35dbf012506989d841f2156137e96d1a09ee138f33619a580be2aea619461ca4813ab06bad7837a24bf823d62c5676a4c446b7a45c6d85ed9c2e27659f710f336c07091a9c852ae01dd5262c503ac17dd3895957e566589e80598b6b2cf896f3f8b4d5cb71a611e05f093c873a2a22228bb99652db18b12351cff54e4fc2cbe115d2e8a146a2be1cb20db1521567751b2088f941ef48e7eca59f54ddf2b7dfa4e29d77df6fcafe5a85f5116c1e9bb6278ca9741f47185bee787a6f6dae669bb3699890eec3c2b589788eaf5e3d523275fa581ee95ab3b6625eb9857ae22518d619cc7993f3116cb72b6868d486f430b2b12e7e7c477098dbc4d3ee35ad6057504a09674c135fa580f0a9eb39db00c47278e8b49352c42fc421c914e1ec4e739bc39a8224bf17cdd45cfd8e0c1b102e7742c8562328992c588ff12cee722be08c7227d5e88f3021c0bf4b91b6633fed9fabc04e938927630e219dbc39e874050dae1b509787e02ac1310b908ca451839bffffc81f3fcdfcece737ace3e7096eb39039e333d6722671e38f3fe19f10fa765e7ef4f2f757e70aac8f9bb534b9def2f7dafebb74bf1f4fe5ec57bdc7bc0777996a5c22cd46dc5a78cb782373f79146629731d33bcbfe1279de45df8b5b0c4f9e6eb339c6fbc5ee8ec3db1ffc4d1133c1d54044e9d10c7278f3e7ec231d38be3132752d2bd9671c8562cf0fccf0a9dcab3c5cbbccab3b38bbce3e0520a9f5aea24e3101987f123294e7204c811f98872a4f748f4884887fd475e3b72f688380eb292de8cac4ff63ec91d78f2b52739d4ac643c999ae1b51cee39cc8df14b9cd46d07a9c3bb0d6f9eecc3277e5d058732b7b0d8eb3ce4395477e8814382e510288732b2bde4b1e863238ff1a71e3bfb18f7c8c179ce83ed85cea7211ff20e2fa11ee53d05961f83e561780e72c04e96601eb294afb52f71de7f6f91f33ebc7f88f7c8bdf03def5ce703df3df45dee3bde794ecb3dce7bb8bbf7173abf7557a1d3b2cfb92fb26fc7be7dfbc43bef2874b6ed05cb1da0dc916af15a763b7773b77dd3e2ecf926ccbfd57b2bb7056d6fc63b8e770cefe228e447818fc2b928bc15fd43940b45c11785f1c9b3caf628863332d4ec1cf25639f320b7cb519ddb65ace6bb0c98173fcaf6f654397b705cbfbad9b9d65be45cb3faabced5de4aa7bdcad6256276852abe2bc28385afe3dbf808bf83177b3a40e9985bea553a66cdc6873dd77be3aa9b57ed59c5af6c9be16cc7dbd156dcc6f9dac26ddc38d894326f81b3c5eb70367b5dcee5b8e87f7a310830a339bf2bbb2aab4b024b97b5cad2c501562c99748e837438df8c835529c3d169a9b3f4587658048bc56369b3442cfb2cef5b262dc63ac49db1f011026d0446b2418471d83fd6d95152d23a6e9c5cd5aa1adbd7a8b04b2de8a04f65e56ad5b04b255dabd7748f01dce9fbe6debda47e66ab5ad5d1adf6cef4b5aa0104140a8c20609d39964dea7db1782cbeb944bf2016a703a1430c81588c9280a2a658183a168bc7e32421122b899112fa4402e093c41823f25066aa4bff03fa24d41c33038c3316a74c4c78337db219c55245ec420bb129f34c7362c8fd6feb760cbb0a656e6473747265616d0a656e646f626a0a0a34372030206f626a0a363732340a656e646f626a0a0a34382030206f626a0a3c3c2f547970652f466f6e7444657363726970746f722f466f6e744e616d652f4341414141412b4c696265726174696f6e53616e732d426f6c640a2f466c61677320340a2f466f6e7442426f785b2d343831202d333736203133303420313033345d2f4974616c6963416e676c6520300a2f417363656e74203930350a2f44657363656e74202d3231310a2f43617048656967687420313033330a2f5374656d562038300a2f466f6e7446696c6532203436203020520a3e3e0a656e646f626a0a0a34392030206f626a0a3c3c2f4c656e677468203330312f46696c7465722f466c6174654465636f64653e3e0a73747265616d0a789c5dd1cd6e84201000e03b4fc1717bd808ee7f624cb6ba261efa93da3e80c2b835a948903df8f665986d9bf4a0f90666263024455dd666f0c9ab9b54039ef783d10ee6e9e614f00eae836132e57a50fe1ec5bf1a5bcb9250db2cb387b136fd94652c790b7bb3770b5f9df5d4c1034b5e9c0637982b5f7d144d889b9bb55f3082f15cb03ce71afad0e7a9b5cfed0849ac5ad73a6c0f7e598792bf84f7c5024f632ce9286ad230db56816bcd15582644ceb3aaca1918fd6f4f1ea9a4ebd567eb42aa0ca9426c651e9c922fe80d798bde46ef52f48ed62bf49e7c421fc83bf4915ca04fe4127da63eb1e72359a00bcad9a04bf21e7d211fd015e5637f29c8982fe9fc29f69174fe52c68bdf6f8823c037fa192d5737e7c258e343c679e2240703bf6f6d278b55f1fb06cd83954f0a656e6473747265616d0a656e646f626a0a0a35302030206f626a0a3c3c2f547970652f466f6e742f537562747970652f54727565547970652f42617365466f6e742f4341414141412b4c696265726174696f6e53616e732d426f6c640a2f46697273744368617220300a2f4c617374436861722031380a2f5769647468735b302037323220373232203732322037323220373737203237372036363620363130203833332036313020363636203732322036313020373737203732320a3636362032373720373232205d0a2f466f6e7444657363726970746f72203438203020520a2f546f556e69636f6465203439203020520a3e3e0a656e646f626a0a0a35312030206f626a0a3c3c2f4631203435203020522f4632203530203020520a3e3e0a656e646f626a0a0a35322030206f626a0a3c3c0a2f466f6e74203531203020520a2f50726f635365745b2f5044462f546578745d0a3e3e0a656e646f626a0a0a312030206f626a0a3c3c2f547970652f506167652f506172656e74203430203020522f5265736f7572636573203532203020522f4d65646961426f785b302030203539352e333033393337303037383734203834312e3838393736333737393532385d2f546162732f530a2f537472756374506172656e747320300a2f436f6e74656e74732032203020523e3e0a656e646f626a0a0a31302030206f626a0a3c3c2f547970652f506167652f506172656e74203430203020522f5265736f7572636573203532203020522f4d65646961426f785b302030203539352e333033393337303037383734203834312e3838393736333737393532385d2f546162732f530a2f537472756374506172656e747320310a2f436f6e74656e7473203131203020523e3e0a656e646f626a0a0a32322030206f626a0a3c3c2f547970652f506167652f506172656e74203430203020522f5265736f7572636573203532203020522f4d65646961426f785b302030203539352e333033393337303037383734203834312e3838393736333737393532385d2f546162732f530a2f537472756374506172656e747320320a2f436f6e74656e7473203233203020523e3e0a656e646f626a0a0a33312030206f626a0a3c3c2f547970652f506167652f506172656e74203430203020522f5265736f7572636573203532203020522f4d65646961426f785b302030203539352e333033393337303037383734203834312e3838393736333737393532385d2f546162732f530a2f537472756374506172656e747320330a2f436f6e74656e7473203332203020523e3e0a656e646f626a0a0a35332030206f626a0a3c3c2f436f756e7420342f4669727374203534203020522f4c617374203537203020520a3e3e0a656e646f626a0a0a35342030206f626a0a3c3c2f436f756e7420302f5469746c653c46454646303034313030364530303634303037323030364630303639303036343e0a2f446573745b31203020522f58595a2030203834312e38383920305d2f506172656e74203533203020522f4e657874203535203020523e3e0a656e646f626a0a0a35352030206f626a0a3c3c2f436f756e7420302f5469746c653c4645464630303431303037303030373030303643303036353e0a2f446573745b3130203020522f58595a2030203834312e38383920305d2f506172656e74203533203020522f50726576203534203020522f4e657874203536203020523e3e0a656e646f626a0a0a35362030206f626a0a3c3c2f436f756e7420302f5469746c653c4645464630303431303037323030373230303635303036373030364330303646303037333e0a2f446573745b3232203020522f58595a2030203834312e38383920305d2f506172656e74203533203020522f50726576203535203020522f4e657874203537203020523e3e0a656e646f626a0a0a35372030206f626a0a3c3c2f436f756e7420302f5469746c653c46454646303035303030363130303733303036463030323030303634303036353030323030303434303036313030373430303646303037333e0a2f446573745b3331203020522f58595a2030203834312e38383920305d2f506172656e74203533203020522f50726576203536203020523e3e0a656e646f626a0a0a342030206f626a0a3c3c2f547970652f537472756374456c656d0a2f532f500a2f50203538203020520a2f50672031203020520a2f4b5b30205d0a3e3e0a656e646f626a0a0a352030206f626a0a3c3c2f547970652f537472756374456c656d0a2f532f500a2f50203538203020520a2f50672031203020520a2f4b5b31205d0a3e3e0a656e646f626a0a0a362030206f626a0a3c3c2f547970652f537472756374456c656d0a2f532f500a2f50203538203020520a2f50672031203020520a2f4b5b32205d0a3e3e0a656e646f626a0a0a372030206f626a0a3c3c2f547970652f537472756374456c656d0a2f532f500a2f50203538203020520a2f50672031203020520a2f4b5b33205d0a3e3e0a656e646f626a0a0a382030206f626a0a3c3c2f547970652f537472756374456c656d0a2f532f500a2f50203538203020520a2f50672031203020520a2f4b5b34205d0a3e3e0a656e646f626a0a0a392030206f626a0a3c3c2f547970652f537472756374456c656d0a2f532f500a2f50203538203020520a2f50672031203020520a2f4b5b35205d0a3e3e0a656e646f626a0a0a31332030206f626a0a3c3c2f547970652f537472756374456c656d0a2f532f500a2f50203538203020520a2f5067203130203020520a2f4b5b30205d0a3e3e0a656e646f626a0a0a31342030206f626a0a3c3c2f547970652f537472756374456c656d0a2f532f500a2f50203538203020520a2f5067203130203020520a2f4b5b31205d0a3e3e0a656e646f626a0a0a31352030206f626a0a3c3c2f547970652f537472756374456c656d0a2f532f500a2f50203538203020520a2f5067203130203020520a2f4b5b32205d0a3e3e0a656e646f626a0a0a31362030206f626a0a3c3c2f547970652f537472756374456c656d0a2f532f500a2f50203538203020520a2f5067203130203020520a2f4b5b33205d0a3e3e0a656e646f626a0a0a31372030206f626a0a3c3c2f547970652f537472756374456c656d0a2f532f500a2f50203538203020520a2f5067203130203020520a2f4b5b34205d0a3e3e0a656e646f626a0a0a31382030206f626a0a3c3c2f547970652f537472756374456c656d0a2f532f500a2f50203538203020520a2f5067203130203020520a2f4b5b35205d0a3e3e0a656e646f626a0a0a31392030206f626a0a3c3c2f547970652f537472756374456c656d0a2f532f500a2f50203538203020520a2f5067203130203020520a2f4b5b36205d0a3e3e0a656e646f626a0a0a32302030206f626a0a3c3c2f547970652f537472756374456c656d0a2f532f500a2f50203538203020520a2f5067203130203020520a2f4b5b37205d0a3e3e0a656e646f626a0a0a32312030206f626a0a3c3c2f547970652f537472756374456c656d0a2f532f500a2f50203538203020520a2f5067203130203020520a2f4b5b38205d0a3e3e0a656e646f626a0a0a32352030206f626a0a3c3c2f547970652f537472756374456c656d0a2f532f500a2f50203538203020520a2f5067203232203020520a2f4b5b30205d0a3e3e0a656e646f626a0a0a32362030206f626a0a3c3c2f547970652f537472756374456c656d0a2f532f500a2f50203538203020520a2f5067203232203020520a2f4b5b31205d0a3e3e0a656e646f626a0a0a32372030206f626a0a3c3c2f547970652f537472756374456c656d0a2f532f500a2f50203538203020520a2f5067203232203020520a2f4b5b32205d0a3e3e0a656e646f626a0a0a32382030206f626a0a3c3c2f547970652f537472756374456c656d0a2f532f500a2f50203538203020520a2f5067203232203020520a2f4b5b33205d0a3e3e0a656e646f626a0a0a32392030206f626a0a3c3c2f547970652f537472756374456c656d0a2f532f500a2f50203538203020520a2f5067203232203020520a2f4b5b34205d0a3e3e0a656e646f626a0a0a33302030206f626a0a3c3c2f547970652f537472756374456c656d0a2f532f500a2f50203538203020520a2f5067203232203020520a2f4b5b35205d0a3e3e0a656e646f626a0a0a33342030206f626a0a3c3c2f547970652f537472756374456c656d0a2f532f500a2f50203538203020520a2f5067203331203020520a2f4b5b30205d0a3e3e0a656e646f626a0a0a33352030206f626a0a3c3c2f547970652f537472756374456c656d0a2f532f500a2f50203538203020520a2f5067203331203020520a2f4b5b31205d0a3e3e0a656e646f626a0a0a33362030206f626a0a3c3c2f547970652f537472756374456c656d0a2f532f500a2f50203538203020520a2f5067203331203020520a2f4b5b32205d0a3e3e0a656e646f626a0a0a33372030206f626a0a3c3c2f547970652f537472756374456c656d0a2f532f500a2f50203538203020520a2f5067203331203020520a2f4b5b33205d0a3e3e0a656e646f626a0a0a33382030206f626a0a3c3c2f547970652f537472756374456c656d0a2f532f500a2f50203538203020520a2f5067203331203020520a2f4b5b34205d0a3e3e0a656e646f626a0a0a33392030206f626a0a3c3c2f547970652f537472756374456c656d0a2f532f500a2f50203538203020520a2f5067203331203020520a2f4b5b35205d0a3e3e0a656e646f626a0a0a35382030206f626a0a3c3c2f547970652f53747275637454726565526f6f740a2f506172656e7454726565203539203020520a2f4b5b342030205220203520302052202036203020522020372030205220203820302052202039203020522020313320302052202031342030205220203135203020522020313620302052202031372030205220203138203020522020313920302052202032302030205220203231203020522020323520302052200a323620302052202032372030205220203238203020522020323920302052202033302030205220203334203020522020333520302052202033362030205220203337203020522020333820302052202033392030205220205d0a3e3e0a656e646f626a0a0a35392030206f626a0a3c3c2f4e756d735b0a30205b203420302052203520302052203620302052203720302052203820302052203920302052205d0a31205b203133203020522031342030205220313520302052203136203020522031372030205220313820302052203139203020522032302030205220323120302052205d0a32205b203235203020522032362030205220323720302052203238203020522032392030205220333020302052205d0a33205b203334203020522033352030205220333620302052203337203020522033382030205220333920302052205d0a5d3e3e0a656e646f626a0a0a34302030206f626a0a3c3c2f547970652f50616765730a2f5265736f7572636573203532203020520a2f4b6964735b203120302052203130203020522032322030205220333120302052205d0a2f436f756e7420343e3e0a656e646f626a0a0a36302030206f626a0a3c3c2f547970652f436174616c6f672f5061676573203430203020520a2f506167654d6f64652f5573654f75746c696e65730a2f4f70656e416374696f6e5b3120302052202f58595a206e756c6c206e756c6c20305d0a2f4f75746c696e6573203533203020520a2f53747275637454726565526f6f74203538203020520a2f4c616e672865732d4553290a2f4d61726b496e666f3c3c2f4d61726b656420747275653e3e0a3e3e0a656e646f626a0a0a36312030206f626a0a3c3c2f43726561746f723c46454646303034333030363130303643303036333e0a2f50726f64756365723c46454646303034433030363930303632303037323030363530303446303036363030363630303639303036333030363530303230303033323030333430303245303033323e0a2f4372656174696f6e4461746528443a32303235303532373132303332392b303227303027293e3e0a656e646f626a0a0a787265660a302036320a303030303030303030302036353533352066200a30303030303235313236203030303030206e200a30303030303030303139203030303030206e200a30303030303031303735203030303030206e200a30303030303236333335203030303030206e200a30303030303236343035203030303030206e200a30303030303236343735203030303030206e200a30303030303236353435203030303030206e200a30303030303236363135203030303030206e200a30303030303236363835203030303030206e200a30303030303235323736203030303030206e200a30303030303031303935203030303030206e200a30303030303032333638203030303030206e200a30303030303236373535203030303030206e200a30303030303236383237203030303030206e200a30303030303236383939203030303030206e200a30303030303236393731203030303030206e200a30303030303237303433203030303030206e200a30303030303237313135203030303030206e200a30303030303237313837203030303030206e200a30303030303237323539203030303030206e200a30303030303237333331203030303030206e200a30303030303235343238203030303030206e200a30303030303032333930203030303030206e200a30303030303033343235203030303030206e200a30303030303237343033203030303030206e200a30303030303237343735203030303030206e200a30303030303237353437203030303030206e200a30303030303237363139203030303030206e200a30303030303237363931203030303030206e200a30303030303237373633203030303030206e200a30303030303235353830203030303030206e200a30303030303033343436203030303030206e200a30303030303034313838203030303030206e200a30303030303237383335203030303030206e200a30303030303237393037203030303030206e200a30303030303237393739203030303030206e200a30303030303238303531203030303030206e200a30303030303238313233203030303030206e200a30303030303238313935203030303030206e200a30303030303238373831203030303030206e200a30303030303034323039203030303030206e200a30303030303136323230203030303030206e200a30303030303136323433203030303030206e200a30303030303136343339203030303030206e200a30303030303136393837203030303030206e200a30303030303137333833203030303030206e200a30303030303234313934203030303030206e200a30303030303234323136203030303030206e200a30303030303234343139203030303030206e200a30303030303234373930203030303030206e200a30303030303235303237203030303030206e200a30303030303235303730203030303030206e200a30303030303235373332203030303030206e200a30303030303235373838203030303030206e200a30303030303235393133203030303030206e200a30303030303236303433203030303030206e200a30303030303236313835203030303030206e200a30303030303238323637203030303030206e200a30303030303238353434203030303030206e200a30303030303238383737203030303030206e200a30303030303239303633203030303030206e200a747261696c65720a3c3c2f53697a652036322f526f6f74203630203020520a2f496e666f203631203020520a2f4944205b203c34393336453134373037333436344242423234373444373544303141344342453e0a3c34393336453134373037333436344242423234373444373544303141344342453e205d0a2f446f63436865636b73756d202f37344238453936323542444231313242393044363630324330414336323438350a3e3e0a7374617274787265660a32393233340a2525454f460a);
INSERT INTO `solicitantes_empleo` (`registro`, `id`, `nombre`, `correo`, `curriculum`) VALUES
('2025-06-07', 2, 'Rattatoille', 'remii@cocineroraton.com', 0x255044462d312e370a25c3a4c3bcc3b6c39f0a322030206f626a0a3c3c2f4c656e6774682033203020522f46696c7465722f466c6174654465636f64653e3e0a73747265616d0a789cb5565dab23370c7d9f5fe1e7c2fa4ab2e40f0881c9c72d5d58e86d037d287ddb6d61690bbb2ffbf77bec6472275c4f26b494102751ac3347b27464f2ecbe0d5f1c39f224d959312fc95c56f639b2fbfa69f8e53bf7f7f0f4e366f3f461ffc3c1d176bb3bec8717f7c559f4c9a5c49e72719ae1618ed5532957bf868cd7d73f86dd69389e8697e1f8613f83e333dced3ec9e415c8ea6328eef4d13d3db36372a7df7fdd106f794352975017ddbec36af56bdcbe936afdedf4bef728e93deabaefc5bdee0cd3ce16615dfe7d80da0d30255f5c241fdec6976a28b92ee535a816ef5897dd6b78b79881c1af87b9a1fdf6f4b9c7cd56327236fff43d76b037224aee1b0cef1dbbcf83992fa89844c14736f7d760817cb174b5fce97e6e243baed1c768d8a83e9854d7b341c13e69b8e319847d4c71e63a59d67d2b3f91f953cf86ffd5f39ca498832fd8f89aa4c9b2ee1acd2b698b54bc72b85ad65d35a2896dee7ab1acbb4af641d29cf0c5b2ee4a05fd92e7ae17cbb2ab106cc84664f22695f16431c84b49f78215229f2942bad8cbbc0e2f8655c296c427e6b9e7c5b2ee6aea39c92cc39365dd3518d44de74fbd58d65d3941836e42bd58d6335c77e620b30c6b2a5ef2bd60a70c6bc9de6c5e14936595b242d189e7453159d65d237bbdf13c1bfeb3e38d201bfe2a2e414c3884b37c8a03bd2a9f4c4281948c22a6cb24a5b700acea133a2be6ec19273121804a4e0d2551c6bbe02d346260f571421dc0851b4ea0dcc1d98149a23db82c61b018ce183a51bc5abece02f5a51203c401a1081de99909df149001bf76b08ff855306816c8194a2502d990502e6f9199598073e4962e06321b1bd6786b5f221ed0b1689e65fc84d00fc0cb952b171e2b6f4ef59377bc5fc205ef08bc18c4875e42b8118b4848001492b00404e9a550752af8acd22158691148291f97d3184047534329661d946712a0680bee4d4ad18e3b96c7128ace0db8ce598ee0addd52c878543df611578b3e8a802f7aa05d0e955337eacc2d7fcb3117dca28adec1e08722120d184350fb8449963a6729e7cc8d8b08c807a229771042f5060a3222fa589e63f46d1c645c0b622fcd621594e21d5ac9435e9c696e62f59656443914a9f2b1c305d96acff2b2907014dccb71f4b5d872070f9d34b6321b79ac457fa727a124ceaa346aa727ab3cb692afb2b6e303d02ab3aa2c86bf9685ee5210c095d86ba528e581d4a3b515f7712da80be5357a57a1332ead4ba9c12f052fd0dd947028840b81f4fae736f8c4c747fb6009f141a914c29599eb18c57d237734a41b776aeab6ce6e11f5d17e4801d31038d04b9be6e90d4ee3214b8a330d9aea8f3beb7a96ae83664917ff01ad751e260a656e6473747265616d0a656e646f626a0a0a332030206f626a0a3938350a656e646f626a0a0a31312030206f626a0a3c3c2f4c656e677468203132203020522f46696c7465722f466c6174654465636f64653e3e0a73747265616d0a789cb558c98a234710bdeb2bf26ce8ec583272012190d492f1c080db16f830f8e60506db307399dff7cb5ad4a556964a3d6323ba541daa78f162c988cc22cfeecbea9323479e243b2be62599cb817d8eec3effbefae53bf7cfeaf1c7f5faf1fdfe8727479bcdee69bf7a769f9c459f5c4aec2917173234cc71f054ca59af43c6e7f39fabdd697538ad9e5787f7fb091cf77097cf490e152ba5e0a31677facd3d1ed931b9d31f1fd6c41b5ecb7ebcf076f3206b3a6c7e3dbd6b19909681f373cfeee5491d9fecfcaa97af772b34dd4ac91717c9ebb55309ae50ae97522fb1734aeaedb65e762fee5d622a835f0b732d4f9bd3c716375b88482ffee97b3cc1de8828b92f10bc73ec3eaecc7c419d24521fd9dcdf2be3e28bf259f297fbb923d9508d3e466495825793aada0bb4900f496e684a4c9e4b98a88e9265ddcaef527794fccfba7da0624658109e97408d9265d568283a99aa0e9265d510bd5998aa0e926555c99e2e323b4ae65559930f884f7d3275711a2566ea596e9965c542037aa48288c6a9dd41b248d9908ca279a23a4a96cd5a12af58d913dd41b26c16bed51e39511d24cbaa6a5e652ce44e75902cab726d4c3ab53a48165543c95ec234b5a3645935159f689a9d51b25c152163ad049d54454066e95698c6ec84107c9234353b489619c3460a17aa836451550b7ba1694d8c92ff40f5622018928fd591843dabf6fd5b1ce7dabf8969874fc66818fbf8a53673f206ed98b13eed451b4c72ea1052d5a6823fa12dd90c8e46416ba88d096c4a6ce0ec2800634f7116037564989631a23d86781e440180d6413c9181c4818e4cb80b8054fcb7837c8bff0aa6dc1c394c5ef4ad59641616e01c5881631c6683a560081c231f91b90643318ab27f3b332062125c01cae13e628a7693d077f14db13488718710113ae56d25b54408489c1b8cee0c15fa1f4a06ed37784133bb86416490c503053ecc468793f9585054887b0cda084f844b95ceb18ffb92537338f7e61f5e25e8d70d2e93cd56e8bd7c6671e478179f98bdd6f153f731b9e116e864e1ae04b7d8fddd0eb2250cf7d8581c6f0cf23c4e90f296205bee4e13df1ce4391ca5fbf828e60cf6c5866f4dcdb6041e5bc6ea9ac5500c9c1ce1931212de8ef1019bb2da637792e11fda07cf775b56e005f826e4b3b61a5142c6917af0dad6f53e8783e519ea7e80c44b69c59a3b9443d7fb77fc04b4caacb65fc34ff3d360883d7003b7fa5ab8abc00bda1a8653c06eb719f90b76e7968ba9d93516ead0975a6f05cfa9d55cee5b8448978f86bd02e63051a3d5bdae7bc4d1d890e75731803ce37aae033a42baad838ee76afc6c5bd0f7a565fb7865a3b3fdbaf6bfc236d7c38028f62638edc7568eeb9c39ca5cdf51893e74a7206baf2b8e6deeb3cdfae5741a5ba7d35cdf4e60df18b043a16bbe1fd6ca1bad47659c9ad155a4deca8d5373c29e0c6b3a2877e7a939bc5a810f610d9e5cdf30482f9979d1905ac41927029c635cc0c90d27e49625d9480fce9d3190b6b56abd8527b85827b54df73ee06178164fe15683da4d3f39465f62dd35679f91b06bf39368853e7e401b43c9a5ffb19a8a350636e77c6e3aafd9a3b122cc7587d4b2fe2dce53c77c7fa62cfdedd9959b7141e310a423605751b8c56cc4c168003602d1635fb8ff2f59260ca30a656e6473747265616d0a656e646f626a0a0a31322030206f626a0a313230300a656e646f626a0a0a32332030206f626a0a3c3c2f4c656e677468203234203020522f46696c7465722f466c6174654465636f64653e3e0a73747265616d0a789cb556c98a243710bde757e86ce8e88890420b1405b5b5f1c080db2ef0c1f8e60506db307399dff7536e9d3dadac2c8f314d655746e9bd78a1582426719fbb8f8e1d136b76568c3499cb412847719f7eeb7efac6fddd3d7ebfdb3dbe3f7d7776bcdf1fcfa7eed97d741629b994843817173210e624109732e37a66fc7dfaa33b5ebbcbb57bee2eef4f0b3a19e85eafd354880dd481a22feefaab7b7c1227ecaebfffbc63d9cb8ec3fea17ffa1d5fea7bd93ff89d1cf6ba63c3bb84fd2fd7772d87da7238af7b762f2bfdb4b28fb33ebe3eccd00e33517191c9bf0d32d5a0f210191e71ff80c8b47e3dd4c7f125bcd79c5ea0afc5b913d95f3fb4b4d9c68e0ce61fbec50a2163e6e43ec3f0ce89fbd0995141dd24f614c5dc5f9d71a2247eb6fce97eec4536a091624496399037add0c110a03e057f03e9bd502a4be864d9c61a472a292edd8e96ff193b6c54cc9e0a16be6cd464d98646a3c061091d2deb502942014a638c2441809d2d9ac8ca4d2842420263881805cbd44e966dc59ac96b5a4247cb36940bfa2d2fa1a3e58e6085c9d416c11a865449b7376a88d680d065b0a36153b025c57a592247cb36d402491aca58c9bcce966da8378cc8654d4c966da824ccb057a18e964d682899cc96799d2cdbc909a59096b048ceddbd13320e2959d6c464d98646f87a851c0cff19b89c9952947070baa442e2fd307ed5411fc62f9fd858f9cc912ffcc4810596d8db92f03c9abf600c85320679cc9904999918a12da79e3571c6a7e0a37cc0d1d7e6f1c0d72dae3c9e7383e708456950b4a6453df952474941daf27cb8042a551938ce351a9fc051c483ef8038a3cf507694336709f8e509e7d78a4674a0867883ffa4053a2f3db7e1846ff32009dc0f29a1686f5924416550e1833032b1162db2425c77cc70bd4147ae440b3db18f79e49c22de8a718d55a2e81d312a666129e222e6454033bde1d158757dadba355691bbd409f02561efc4a31f1a517aab3d806527fcaf7512c07a06eb852173bd426a17a0f72a6fb1466ef9f45a1fae496da688bb498cce72441adadb57376b10f66fb6502bc7708d0e926e544daab17a8503dc7071855d8938a25f21709def8b9ee0a33f4cecab1213e524389e708aa7469fcdb573a7c6312bab7c776745ea7d1fb76ab34caab1a10c89e8e7cbd3b69a905123cd1dbb578da08a71e3375f28e60693f7a8d650eb550e63a918de4656d436be6132a3befb69b3da2daa508c9b473d354269f8e94bb0f64bef673153e5507b063ead7ad6d5e93ff675f5a0b135cbee9bacb352565ced37376416cab5b18f2f85c461d5c59c3eb848dae8cc1be9fb07db8916de0a656e6473747265616d0a656e646f626a0a0a32342030206f626a0a3936320a656e646f626a0a0a33322030206f626a0a3c3c2f4c656e677468203333203020522f46696c7465722f466c6174654465636f64653e3e0a73747265616d0a789cb5564d6b1b3110bdefaf98732193198d461fb02c78d76e6920d0b4861e4a6ffd80d016924bfe7e476b7bbba6abac492906591ef49ede1bcd482664786a1e8080905c02cd8a2e2a24cf9802c3e3d7e6e32bf8d55cbf6bdbebdbe1ed16a8ebfaedd0dcc10368c008313252cae0932114d823e53ce14666fb3c7e6ffa7db3db3777cdee7698d1f181ee7c9d0bbe70c5e8314886fd17b87ecdc004fb6f9f5a8a1db7b4b1813d6999f7dd956b49ca7437fd16d7b9b2ec4a5aa632d511d17ddedf2ce9704b3aa67577f067a59c568ef6cbf072f77ed17d8c9821104ac57b2a432e43189dbb5342ccf964ef9c53d8f42d71b61cbafdfd92365dc9c821fcfe8dad6054228af064811b60b86f54315b3945120cacf0b35172189d9f223fe0c32872011a30043b7cf228ea0af410d04ca82ccf203905f41466d053641d2b3e63ce7e863d45d6b14a8c39c5b9e463e43f630f490e49307b9925f914792e556a49b52a0b6a09f273ec31b2bead0f7645cccff6145987ba84e2e21c7a8cac423533baf9a6c7c00556295baba6f9a6c7c83f6f7ad6bd76904918a263649143b339e0549a8d7a6226521b84e238326dec374d4d78ce66fbc414ec401372d6894cc70a2984d9083c0dc41502571a9f7464104a0b0c03992b13e14769915d954bec71109f9ee1ea8d251a63b0dbb662c80e231b855d459cd27415796b351d29d8c488d1a89148cd947af4c1d212326ae405966d3155b511ca5d5dc05e97240c96839e763ccab027a32622a267ab22b50750dcdf3c2e9885351155f0f62211962d144b7e90f2bd944e37b88137f630d6eb83721809bcdd76955452cfc939cec6645d439b52c4262cd86c58715823765b972f72680f86188ff595c6a54c250adc17416bd5c2762baabeb05a6ae00b0fea542de50f96e7f8b26aa982992b227e0313dc12270a656e6473747265616d0a656e646f626a0a0a33332030206f626a0a3636390a656e646f626a0a0a34312030206f626a0a3c3c2f4c656e677468203432203020522f46696c7465722f466c6174654465636f64652f4c656e677468312031393238383e3e0a73747265616d0a789ced7b797c5455d2e8a9bbf47ed37bba4907fa369d04b04312d2091040d202894140c21248839034d91592906e406494b029061154c4411861144761503a1001172432eab880e23e7e8e1215e79b7183717085dcbcbae77667418637bfefbdbfdeef75e7de3ea7ea9c3a75aaead4a93af726d2b4a48a1848336149a06251a8f1ef2f7dff3921e4042160a9581a11d949efa561b98310667d7563cda2070fdf709e10ae9610755bcdc2e5d56fd47f711b2186644232d6d656852a17cda94e2764d42ea431bc1601774babd558ff0bd6536a17456efeaedfabe7b07e11eb17173654843e0fcd282264f44f586f5e14bab9f121760e43c8989bb12ed6871655d51857f4c3fa6f09d1cf6d6c0847b692f62e42ae3d2fe31b9baa1aef9a78f00821453642d8f10803fcca1f031655729d61395ea5d6e80d4282d164b6586df64487b35f922bb9ff00b738d09b929a3668f090ab7ce9433332b38665fb7372878f1899376af498abc792ff273efc09fe04b9955f45ec6439bdf7f970a3888d2c23a4eb6bb9d6739766ffdfe542a3fcb491a3643fd9d507b59ea0fd907d7d60c7c89fc81f69693bd97805b24f93bdb1d216b28ddcf16fdbdd48d6209ddd387ecfa71ca1cbc96f71e423e431349481e0c7516f8a613f22af5e9e147c0aaf927bc9e3d8f25e7218efdb7165ac60be23f732d3493df301bb8aac2677e21c77421dd984edcbc96e984be62354f9cc2755a4e112a22d64337994dc82abb0fbc3afeafa17112e1e44ceef443a5b491d598c9a345e1cd0f51dc9e1fe4604e95d728c7523ef4f92a7689755f1beea22f646e610c374de87957b480d5e21f810f9dcc85e730569fe1f7f54abd02fd8b8d7651bea7a475a89bc7f841a7a06a5f166e0dab97382a52533674c9f563cf5fa2993275d37b1e8dac28209e3c75d13c81f7bf598d1a3f2468e189e3b2c2b336368fae04169a929de811eb7d36636191304bd4eab51ab788e6580a48b51282f88b2a9a2b930e42df0868a86a68b05ceda0943d30bbc85e551312446f1874bf316155190371415cbc5681afe847a81cba3016c597d49cb80d232d0dd124ce21832461ec22b464f4ef08a4760ceb4522c6f9ce00d8ad16f68790a2d7369b42260c5e3c11e942b995bb1205ab8b4b6a5a01c798456bd6ebc777c956e683a69d5e9b1a8c75274b0b7b115068f055a6006178c6a6588469087c59916842aa3c5d34a0b26b83c9ee0d0f489d104ef048a22e329c9a86a7c544d498a7532eb6483d89adede72d711135950ee33547a2b43379446d910f66d610b5a5aee889a7dd121de09d121b79c71e2ccaba2e9de0905519f4c75d2f4ee7126f50c09513ed5e4155bbe27381def375ff78584621055aae97b2217a3ccf8284c2ff5c81f5721cabaa5a5d02b16b694b7848e74352ff08a266f4babc1d0d25880e226c5a548e248d7331b5cd1c2bb825153792d8c0ac6a65e387d52d43a6d6e6994492d146b4308c1bf7caf67a4cb63ee6e53fcefd004c582c241097b3cb218361c0990055889364f2b55ea2259e03a400299be6094299731ed718cbd44c634c731ddddcbbda8db49334a5ba25ceac44a6f014a7c4328dabc00adeb4659315e5334e10797c7db62318b799941da5644ae2656d689513e0d8584bd7a7740bb91bbb4986825e107e5e71b170e9066b688795e2423d329f01694c7fe96d63a918088822ef2298630b3341a9880854028a6b182d6ac4cec112a4785d54da0ca8c667a1ba336efb86eedca6c15d4cd28a55d62dda2b6f151525e11eb15cd2ca0eb4a2c68299fa0b020d3f24e2b7d9af8bb3a5a7344d7413fc921c10972e3c4f1686569052da595d55177b9ab12d75db558eaf2440341d470d05b5a1594cd0e2534a4c3458d23486d6566e9a419de49d3e6948e8c31a22064725c6ac12564bca52e850c1a605493aa114b19171bc4862604888558f08e1b83f7a83a55839709054ea1b2e18e1b2396828bc45b231bd1216241d584583bb9de87282f9bd3f8a23835955c453ae38b5c9ea047f90c4d67102dc606c61e1a59a8457114ba294468d03ec71751902c4ba76cf462a9b7ca1bf4d68ad14071a93c37593c54ca31615099c77435b34fad97b0504cc483e878451666b4d0e7ea2ddce8b5b4de5d2dba043d318e165b34de49335a64e2de1841829c4f8c12d9840323cd2eea0be405ed45df2b9a7049d305ddd21a08c88bb976944cc43bb1b2c53ba3740c6d8dfee456d72df25816320926cd1c37341d5ddbb8562fac9fd61a80f533e6943e6dc2586efdccd2030c30e3cbc7055b531057fab44848804219192a03e58a2857644ad3b1a2a1ed5d4f073078a4588e0268bde208100ad3c461402a8e300acca40c9446070a1006319c8209c45b7308d328b0660aa39f56228b2ca0e3039a8036606004c6d50a32e800429ec1d8530be4a0010470b562afe9147c049a5bb50197d2a2195b04140ed797f40c5d32a7f4a08160377ac781c6c91f3417672d2a1bb79502b1523694df046b5bca83f2622389a81afc832878c7a29abc6391119521aaf3568d8beabde36478be0ccf57e02a19ae46138544c0eecda8fbe228c81630b7d4834b524c7ad5d562fa46d654109d4a8be98ba1c8dc498c44b2316e64899ab80302a3e25915abd5f02c87a0fc939927cd16c8cb33fbcdfe6159568fd963357bcc27b9aa0bdb27b327f955bface4732f38b87fc8c101831225fc74a4a526263237305c0062605815af212cc769d4acc56c60ca820603256e895aa0d802e72cd06e81cd1628b7409605322d308f7e162f26f9d9f9febc4c1f8eefc0f1b3cd7ebf252f0fff866579580feb05bf16d42a3516d306719b7edf79dbc32f33f91f32c33be76afb0d6b638c4f2527c30ea952e691fb67f28cd5d23078ab408e7ad16a3097f896bb9e249150608c45abd591241d260c964492c81707134d825147eca792a13d19a2c9708edebb92a12319ba81bb92a13139c62b32dbd4d424f39b8fdc92bc6e89c932f3987332c03b5065377bcd3983fc0318877f2cf8b313ed6636efaa1b82abb7b6a9f6620ec3b0631f597ee051e6c99b96e61c78a873233be3e8557c7aded4c679ad273a3351b6b3babe66cf627c98480692598161fd494282d1a132aa52bc167b02e64eac46231607352636a938c8266e4e81c61470a740570a74a4407b0a503651a83ee254b8cc73e6e7f7e214594d4d404619b3c9939de8f00f42a0cde1cd805cb025fab387e7e6a4e12cd8dcec476f39f902dcbd627736c3b4a9f6b1eaceffbaf98e6d2d2d0fac5ffe64ed1cb08193193e67c17278e18275cf7053e42a68fcfcc5774f7ff0caab8adc99f528772bf1064c2aab15b3389bdda8d2993823e62df9f9f97e7f2f6bf3cbf24ab4537139ec69548677abf66a385f63754a6aca98c6a5ecd8a69623a91baa758fea5e68eb3c416d10e5c4f5c7317428a9a240ba59a5272ae2706a12a8706cb270763961b3139a9dd0e8847227143b21cb09a79d200b68716f2175b302262626190b4be560a732e1fafff2ed37dfc1173f7d7974ddef1edab8e1fe87373003a433d297e0013393259d953eed78fdcdbfbeffc129657ddc89c67735ea505e6bf5812256ad26b830b4bc91b303991104d2a5850e2d9cd642bb16a25ad8a985662d346ac18d4e470be77aa1766961b316a652549cefa6ee8f3203aa5ed42c5dbab97e3b8b93b9b3adad8d17f7edfba5831b75e165e4e971cc11bfc435ab23663226201a799e4acc6235726541a39157ab13ca826a96b78856c0bf79281dc57e9c99be3e860e36ceeb4123f764736ad310307b44ee4be94287b4e01833ed1be0daa523d23a580301f6c357beeefc885ff5c9093077be8b994417998d3a0bf3672c69444b88594d743013e56543ef3bcc9cc60cd30fcb6193527de65ce2cba572a4ed51c75e9245ee0ecc12870c51abed09c60c9635da93b8ec61fd9dd382fd13452435645a50ad3693fc0430263424307a3621c16cd61707cd2692521c2489edd9b02b1b366743733634664379361467431605c6a5da6d0ec4efcc2c9b3f6fb1d942bd124a203fee9ce2df6159fcc0b4dc9ce1f9a02c17f5208b475eeab2b58cb0abbc03d30679136050f658b81ad4090c5a113cf4c8ee8f7ff857e3cdcbebf5cf65c0da136f5c353ac933e1dacab92a55c1e139150f065f5ab9a6b0ccb66febe36d2a6ef4daa6e973cc90f26cab94513c4ddd68aa6bfc4dcd1d737e3723c8315995d34acb09f56f455c2b9ce3cf109e78023634361561ee9f6b2499249fac2467114c32e729ca930dc3eab743d1876f4a87b8561bb8fb4b5f2aeb489acd9ee526119164909d814a8f43ab7573ec60b39975b35999c94687ce96604b2d0eda4c09bee2604222511707ed1ca838d073c415c802310bdecc8268166ca6659205c5a7b3a03d0ba666c1ae2c68ce82cc2c3066c1b92c38450b9af98a8f92ed787ecf2680452aff5e7eab8fd465d343b98e18007ed19ceb8df9308b5f766239c347f8d16b98d8980f96f530169894d6b7073c6559510902e33fb0eccfcfbe7a32bc2783d1707f541d2c5a33a3e5b6a59b4ad61649b33734274d9a06a39facad030db8c00de6bad0802deae17b2fbe248d645f5e7bacea958e4f8e573efbff6df23fb0c91de8678cd4cff802364ec3307a03cf71ac4aa5010291207112653ab80764fa638e0bf7805c8f99cf4df59b3df61d50231d87297f80d9dbb8319feffde282739b4cb7b6eb6b7e39bf95f423f30379acc991a8d16a13711774191d20b00e07ee3265412b4734264d4053acd9acd9a539a5e9d0680cb8611a0c2a8c47aca20be6911e61f6947a49523632821af28b56878af30e4c61724d045d9d439d01acf34be92218ff1b06dfbf63b6f4d2a9f7a4571f818530ee53c8b8f6a9611f72bf48ef48bf489dd24b907afda1e75b61e2a7300d6e8b3e3166c56ad26d3b4eb41d0bce6259a0d06a56a9fbe1de68509b5957924a45d87ea43828f4430fdbaf9fd6684c2c0e1a4d5ab638a84d3ce5827617ec72c1661734bba0d105e52e287641960b165f6a2bd467e3ac62a53e6622bb6f79471be1603ccaf211cdf64174d1a8c1f6e096251bfb3d14921e3f77e1c23fe0e3678c9bef58b34d053f3ef3dafca2a15d04064012186040e70bce963ffe6eff36aa6f9c13fb1acea91fa90e1410c16655a9d55601f562721407ddb695b64db6d336ce6633994455a3aa59754ad5a1e289caa42aa7d57604a8b5681e3a1d4e5497e8eeaba3c5f97ec585f5d24f6c02bd1d809ace00acebef2c5f653c64efd8f7f9d9731d7ff828f9e984a6ba4dcdccc0bf9caa5d68d8f10c2e6d2b98c1bdef818439373eafd8abbbeb1c831118b19182408a60b3e98d462dc725da13780dc6887aa3160cac36a0313296e22093d89c48d94339279d44f6fc32a3ddbb6fb6cc5e2aaeb45cb337d73fc26ff7dbbdcaf263ae0acefbcbad6b736f7ee5157f7eca048df37be6ed35df7db7a6b3e4fafc04858febd136faa17d0f2615813cb5ca956c1f68206460aa2959a51a7255aad96436458266a775f514bcc114a3194c3c3a6997dbed0c07dd6a561bc6ddbb1fc9f7c71d86256605be78acdad70aa8431891e8a1119f0f72bb433ff520256eb5a9d4f601c0f5fbe96fef77399f4901e3faedad8f552fd8f2c8ba35cbee333c65fbf1f8bb5f3db0f9a128acfbd3fb2f1c35ff72fbdaf0aa1dab9a16afb9a521e189e32f45efd83380331fa0739b2ec76ae8139271ede65aac4e87cd46ac6a95d38a334cb4aab8fe03928ce16052126bb33922419b4a9e4c8d1a12d51056af5133cabce6c5f6879e98a47b42963c7a93a7459469f5ccc66bf5d83dec709c11d75ffaf1ab97be130fe57d7dcfee47ef9a785b7e3493f574ae712d79f2d48ff0fae92eb2ef11fb5bfbb7addb9d3182f9619b74cd9cf3c8fb3ab4efafb85198439405465b341a3df4d3f74b7659789a42240a762d31fe0f5308e2ef1b58996db8b721e3b1889c194437b9b45c338cfa7506c18dea9c4e7308267cf1899e1c82790b79ce439e0fe19e7e15a90c8c51ab06da935d02212ebb8af3a50b0359a7d35d1c4c769a585d31da4ca2291d483a9c4b878e74684f87f274684e87fc744078f7461db32bbfb233ff1b6352b8cf49cb840c0637a29e8569c7893906b0eca1ff3ef5da479e9d8ecdcd77ae2c5db06afb9aebde79ede03bc90f1bd7d4df12c99affc0a6db260e06dfb63facdbe89e3d6de6cc4071d2c0c153ea8bb76cbf6d83ad68ca759332c65c959a72f57521d9a648d7d74c1e8db1ad87199e7008b162c86a06ca921dfc00db1f92ea6c7cc72fa2ec7b33715f1a41f7250b191e4832f31686d1000f561be1cc5c38a8319b41af5201ee4ff9b87632fdbdf4d3ad208c7a73e501ec90006a3082875dbcb7b3965977f46569339323480f0c37c177902fbd00f977b1872e4ebe9b5da69a6fedfcfa3a1b5d07720c7e0ff2a0450efa0346e01a46c5eaf48011380046e0241681eb6527f36b4b9739406396b9b0430d6bb9f8ed31f61fdc179de71fea7c895fb543f1232ba552e621944b02191830a9895ec7723a4cf18d269d8b25243fbf8f2fb59a2c1838c95ed4e14d63cc2b9f7aeec967f73f71f4c9a36d8c0d739b13af9f92d2a52fa5afa48c774ec04970a31cd7d2b57c823830029a171831804f48109c442029a9bc99b1db5d181d9a04a2b3331ed95f4653213f1536a742632ab853a12b153a52a13d356658dd094c7eb75df54a53c1e4916316f4435e654da8698a7849662635ad78c4cf689827556d1c4793d6a337dff1db0debb7ad5fce0cec7c2d58e15ea91bbe87fb460a5e535a3b47fa5afaecf3174f7df6deeb729eda82021b4b6d6869601a4a8797adc87e8e870e1e4ef3d0ce4394879d3c34f3d0c8839b07238ff1760f6a170f9b7998ca4317ed728ac2bb1b77aff85f256db1844d4e7dfde69636fec42f3954770e42d82fd1d7e861666017d16bb43a0ed42a9e61595eadd5f38261ad004b059820cc142a0576b8002902240ac009f083006704785f8017053824c06eb9ddedc25681ad144025240a6942a1304be06b54f457c6bc2cbc2ffc4dd06c133e14186c344b260bbd49cae81f04f64599409a301c3b7223aa853f0887289c178e74b507865f3dae284f80810200114c02735e8076e194d021b06d02340b9b855d021b11a05c8099020404c811401480761d687116ed128091fb150b8d82dc5aa5c609736a96d1a88c84b1a3d3c1a5285b2bcc9f5736cfd71de92c6e2a6b6af235cdef91eee25826d14be0664bdccee3ebd7a305af563e4ec23fd6237d2c7d741c5649f7fc1917b3e155e91eb81d9e932630e94c8234171eed3cdff9b6ac1303ae275fcf7a6239bd8e703a793d11d675e97a021383c66a319b9841fe448b99f1e1827aeec9fdcfca0bca249d96725e7f1bde02077edf7eeb84e4973e95d72cdb9d9b0b24910c20b581517aabc6ea7271091ab4080dc7ba45bd35c99a84f16d8a959962b4023bd60a1cfe9a78ab95e3794b59906739575990b35c1a0496cd2b5b7c990820b65bca99bc4734e3121b0080cb0a6bd9c3ad3972568f6beb4be9dbf39d2f3204ceddd5fcf821e9db1d5ba46370cdb607a6490f4b3b20bc7f176c7cee2d7e95b4f7d6bdfd6d4fc32f4d0ba471e1ceae9f254e8e7731dfbf031d6f26cdf73d98efab882e9f66fbc099d380cbe7d4848967fb408ea3b097a2edb3a00b3c8f6b91c3d546ec293c9ce1e15d1e5ee4a18d87b53c4478c8e101e1361eb04d7d6f74a0176e73bc75655f1237f5ed3ff2231e5ee7614bafd63e1e5cbdfaaca07d903493c583c8a3cce14d1e8ed11194b55e4ed162dc43a87b4c51b6c5b2beebbfaf9dfe1a4a0f5e7afb87e36df40427be7f4868277a323390cd6bb544c7aa096710784d5970130fcff0b09cbf936790070dcbf304e8c6c2126d59905870ddcdbbd43870b0debb8b9fee2ecaf53837f4e2bd6cf6c537d807706b91c63c28d977501e7869367b11f5940867025d568dd16cd169b5acd1c2391d1aabd1ea306b8d042323e2bad709ab9d107142a513a63b619c13729c90e2048b1318279c77c21927bced84e34e6873c26e27f46e3fab57fb44dabe46e9f07eaf0e5bafd8a1777b883a619713b638616dfc3070a61326d0f340d1093627704e38e7840e27bceb84179dff51fb111dcec09c58fbeec6dd2dbb9b75d3ecdd86298ed3224e688f1f532230d309260aec36a2c53d26d46b0fe963317ddcdee2ee0e4d977caed043310cbf12e9f4f80939421838281737da7c00bf7500e31861f5430273ecbaecb48cc71798a519ed67f884c96ce137cf4be5e3231ba5d9fa3b543ffab8dccebd09833e115e625a2fbcfcc49e19f1b3789517f3c421705ba0cb3984108fd6235a345a51ebbb2a3915e35193d34cec764e8e1f0c468f96d82b7d30c907f93ef0f9c0ed03a30fbef2c1691f3ceb833ffa60830f56f8a0c107a32956ef831b11fd3a45efa7e8953e98eb83a93e70f9e0820fced2cedd0db6f84019c0471b703e38ef838fe2a4b1ef4d3ec8a1281c38ef02c561cf5db46784929e14674d4f075086df4df952b02e4af4940f9876da73b30fca658e027ac8f241a60f884f390da39fb25ebbd9e5b4d65bc197536a5c95d9f1e713793d87dbf12c497950917699e714dd8f2bbc713c4b6635866f3f184b3a466d5db86253323b72e7e2ddf71f98d5b8740df3e4ef6e8eeeea7982119eb3e0a645e5075eefcc9431fb7fdfb9919e7984babee63fc0bc360133a8ac40925d63241ae24ad6e39ea5e73827ee59d6e66410e504e932e7f136a6d7198c456dc2f48e9ece6413fe833dd28b1f7c28bdf4076882eb3e80318ffd49faf9dc77d24fa0ffe63cf0cc9f3f96da0e4461ca27301d6efda3f4cc2718b0a74b7f91be977e945e85a1717fca8bd49f36051c6a96e53484e839bd41503365c1623574a8417da4ebd3408675e272f59d6ac6a8068d5aada58fb54439d481a800bbe448071a6994534ce39b5e9e9c3eda924f36154f9bd72b6b422f8bb2469f8b1717ea541d3bc6fc728cd9d819e65775ee6366feb2523933aa8d9d0bc8cf838a03befe6695418f51815ec57a53cc49b6a425419b8dd56a13c241a3619381d1f106ad9a15c3413967a68bbae7242896d1f45add285f7a88221f77a9d3e422350275ef08bbdf77ef7d7b115498d6ccd8977bf0c13dc30e84fff4c5e1adb7dfb6fdf7b7adde02274f4b122c4021d7c37ae953f73ee953e9dcdcb2f3ef6ffbc37dab1e39b59fcaf96ef9391cc6504e521e186d379b2d1ab545dd2fc98a608bdace0ac541d6742a09da93209a04e7e8bd2b093a92a01bb82b091a932ec9a1e9ec2c79f97d93e81e2bee7e1ce797031cb87ad423b7461f7beaaaf29295dbdadad4c0aebab162ff1bb2b53635e444efef5ccd9f906ebb7ab50ef99d8732ff09653e94dc1d701b48ff646fa28ae71393099799613059138b261a82863a036b3480f748d7b9401e820abdb3bcd55e56f082813378d97efdc4b260437f08f68749fd710fee0f5abe7f3f8ec5bdb85c05d3553041052ad6da73aee1a7c1da3c45577965d466e6f97e9569731e918d27da19cca00c363727c57349a2cd733f496f4a5f75764e7f5a3c75f0e957f39b1e2a7fec89ca5cb003734ef23fe77ef2c13d070a561fbf66d5d29ac93ef9fc06aa53572e5bb9a260d6c8b4c4d4ebe6de32f5a917ef6bf5345635365c5332da6774fb46cd6cc2786e43d7d7ec3f693c675729cf6f662bcf6fc085119d2bd735a09fd0f3fc86ae2f1583eb2b09a607ce3a49924948484a4876b13aa7cec812b58d4db06c4e86b5f47ca432192624430e7505b664384f0f505e4c86ddb4412419ca9361266d604a062e196ace50745b326ca1e862da3f85e2b0f3bb14b5b6175d85a8427103eda290c3f62390d6ebbd682984f47142cfc6094d8a13ba900c67e2b4d07b318d74fc4032e453fe4972f7fe5dd6c775ffca6b5fc99ff77a08e0f0e7c7b6e6983357fcf808346b2f64ca4f2cd0ca01753f164680dfcccfd20e1b246db95dda34d2c3727b2fc0325baa4a83594fe3f7ecbe1d9b0f565d0cb0ed7beb1b8e5e9cc9afba9839fa8e01831fb1b36fa1cb614831dabe176d5f8fd9e8e080cda232101571f6d31ac341742cf61ec772b9e7a616f9c169bc8ca93ae7fdf95fff3aff0d909fbf39bcf1e13fdc73dfae9d5b9817a49dd25de8b42be026b851ba57da06c3c0227d27bd2ebd2b7d09c9683722da592dda8d891406ae62196d42829e61cd1683be2c686089aa2c186081658955a4af13145b2060015179a340f6b999f183c2eec896ef5e34664fae07dd01bc2a3d38fe59cb6d65b5374bff84939fd8a0c91d59bda9852dd871d17bf22be56c8063d167e9c9c6408d460b3a4cc6895eaf66394e30b8857c81916f654297c01905a5b852e0f384c08c5945e598cdee12e44c983f2d6066acd43939d5cd1202316487704ed0aa19c09c5763e40967571e8de73bf230db458bf0e1bd49d9b4b3cdf22b11b16d03d4d4a5d124364bba776d5b1b7cf48e3411de806f17492bf91317438c2065763e209fd548b3b9fedc14d4648a7c56e3246eb346a325dab45433676794b31a8351e36206d2b39a34c84f83cd69d09806ee34e84a838e34684ffbdf9dd5c40cc033709037b13ba8b0f73aaa49809eb39a5f66f15c9bea49ccbcb8ac8756bdf2f2d15bd6ddb43c7ffdb6db57c88735cf691e9682bceab1e1dcb06a6be53ce9bcf4f167c7e71cdbf6de6b2f517f52833a31a06d0e206303623249306aecfded46c2b9454d7282c5a20f072d6a5c7c2439fe9c29f6a04c3e0cef93a7fb73c7f2979c7627801aff3cf61aff7d0fef6c9eba7e79f87ee188edc7e3ef7d3169cb5be1f50398d32b971cbce737bf593f2bd27ceb62f39e575e7d7afac30fef9dff40a1f21ca48ef226c71257056c1a4cca09e66706816875da4850a7e29ca4f791afacd66c149b8eb17b4d1640a3e40c7f39107cee0b3074ead947b8b3d221a945daf2270cb64b60dd36c29220aecb24fafc2b8564929240864fe51692aca9845813b5824a95352c513b70f0c0c14b82c68160550d1cc89a4cc94b8226353b7449ef35dbfbe1d0e50f727373868fc8cd00e50437f61880cdf1c40302ab121c98e41382a49ffefe59d7432bc2ebfef9faa97fde1eb963eb27d22f2bd7dd79ebca75de1d1bef7c1086dcb719eefcd37fbdff52cb7336ced5b6fcf7afbcf8d8f2360797f834239cbd79d9f2954b3a2fae59b7e956e9e38d72ac538e73b4e01c657b9d19c8186051ab9c06dc432c6c6a9ac163f4608c63741b9904d66864ed76573868a7cf3d1c18a6298f082e9d6377bcd37d3ed3fd7cc062a50f90e82c2dbd029eb1c059a41fbf7ff4cfbe7dc38f6cdfcb0d3e1e79fecc4f1f7ff5dd8b3bd6acdebab5f9fadba7301f4bf74bb76cd8ee8a8208fa398b80fbe0e34e69f7febd6fb63ef0e0c16b57537bc8407b6893df9182acc087c0700cb2aa2168f7f2590d585668619216466b21450b17b4f0ba169ed5c2762d6cd0c24a2d3065f49d8f2c2d18b550735a0b6fd297413669414118e32f89207c3f7d7fa491a202f43d91b31485c0060acc8fbf57320211a7e8fb24cd1457ac854c8a3845a96ca6432b7024246ac1a405e54d9563f11751ca292a9f629109f5afd28f2b6d728b7b23ca7a703d2bc391d773ceeeb133a79e9792b9dbb92f2eb8b82f76ec50e2613966afa267e856921e7018791de189cdae4a280baa58de88d2b58876f877b9847cdc455813514eb82c7cd55ee995139dff84b7a11ad6b5cbb12b6e07a3b67f751bf3e67f494f3fc9af92b6494f810aac175ad703d5eb51bcfd86be47775720a49c53b1c412e0a1fb7488f090772e7e3eac1c0f15d31322424f8fbb8f8e15a0290edf4f4f947ab71779b854847d657bc949d1d163f24b708aedf13ed9178126f092462b9f20133dcb733aad5e25185cc22481d9203c2b7c25b09c60137284090277a37ca4bc56d822b4092f0a6784f38266343d0bd60b705e808fe8c1f21f05d822c00a012a05c8a25842b1a7287617c53652ac72d46ba2e7c8791d02bc4b33a5dd3453b2e17011814d1166e2786d38162f0fbd0587e402f43c384b6096a9e16600e0746a4ec3e34e6fa19994236fde3ca069f2bf8f95141121a6d7f9efa567bf5ca914948adf619c92f91d580fb7be230d60f44c6de76f99bf328f767ec00ce95cd0d93f6e6bb5b173d9d9814c3018ac5a2ba689095a22085a8e75380d8c155345ab95c40f61894579df4c7402555076fee593af583e2eefe7b197a9644f0b6cfc1096bb0b23a389c79807be05f6f0ef61f34f8ffd4e1a0d271f789499d879985ff5def3bf7b3fb9f3f7ecd72b5675fe24fbceae37a4d9b177ce4ce4c7c03e1dc6292421c16c311ad5fae2a0daa5bc78f6a6058e5960930588051ace5ae014ade45ba0cb02fb2db093561be23155160dab4e5b206a815df4edcda9b47126ed7f35f6394bd16fd216886eb640a305dc1630528a0aea1825ad744660071db5bd57e3be2abcccd1c7a5baed3e2a20ce9e77dfb29597dfccf21e3628d7419fa3ded976f3cd53b2c7168c54de859bb3ad45bb415554cb3daa3c2b93953c867f0d03af4d815ac18aeb9c61ec9c9d7324ea8cc5411da6a72ab638685519c1ee76643aa63aca1c2b1d9b1c3b1d6aa3231f8bfb1dc71ca71d671dead1655862141c6bc4a6fb299c7704665516390283d28b444796a3dcc1061c306fb1cf374f7e5e21fb3dbff22e0cf553d94ab0a704066813de5c3fdd9d947722fb83df0e756dbffdedeadb27e50cf5168c7d873d7c71227b78cd2d5b561beed414de105a43cfdce97b913447e363efd8d5c4deb17398d318c74447928af4ced1d438cb9fb951d8ee86c04f40545a1dcb302a1dab376819a30aecdb0db0d600e5069869800906100d60330067800e03bc6b80170db0cb005bfab6511ad4286805d71bf111852b74e752b8ab2f7c03854fa270bd014620e2f5be88fcff8c91ee36bf6ec0141b20d300260310436c1b2bbbd4935cd116af9cb061bed6f7a4c5e305bf35d1910f563f53f59eb4acfd5b61a477d00fc7b8519d81c12f2d59ca1c475d549236ee5aee218c21c707d2b418f8b0ac60d8c3006b64ca18c6a062e4f8e189a0f67d358c50dfa166d4fc417a8040ad483940e8f52a686c1b958f98eccccefba45278fc3e789c299766c2be7b619f34f35e59ff380c3f057d9c0663ea34b5063723d43faf61755a5157ac63b274e5bacdba76dd391d9fa90335c3f260a1d3835e2e56f1b038437060fac926bcdcf9c2ab70fbcc99b0f655cc2fc59f7f663ba8ade172ebb76d8dab747a9971ccf7c4adfc2fe12b819f1f8cffdf99ecc5545efe0c91ffd1908901b19f7aac743d19dffdef6970c9bfabe5ab0839c9cf221c1726ebf19ac5ec557ee1cfe44e843f8ee5d9f285f022194ecb79b87987c90efecfa496e20985b9b17c3d5ed3f15a87b0bc58bb4cee73f238f65f89e5b548b705710eac1b64fad8e60ebc8ed3b150a02a1c5f954742485b1e5ba67f37e2e6e1ef06c4c9b0626c27e2d522d3c3ab06af3abc827895e35819725fa47914fbd132fcb9eb0dacf7a7fca348b87da41271a83f92466e21efc270a885430c61c63173982f5903bb9bcbc16f39779c4fe7efe24fa9c6aa76a87e50d7aa9bd5c7d5e735299a16cddbda1dda3774a350cf9fe9530c01618cd022fc35616cc256e340e32893cd34cbf45bd32fe605e6a8b9c332dd72c45a69dd6dfdc1f6a0ed9cbdc57e3ed190f8b6c3e01847b5914f86e1ce33022f06f79f4c7203aa7a37c3118e6207407db7ce6677eb0f88116b4a99413f541d2bb324892c8a95396c7347accce33ebc3556569104f248acacc6d9b7c6ca1a62035facac2509901f2beba00ea6c4ca7a92cc1ceafeefe20ce6ed585920b96c9cb70492c4e62227c0c9f27d929d1a2b0319c076c6ca0c49e05cb1324b72b821b132470670f362659e24712b62651549e6ee8f95d5e43cd71a2b6bc860fed158594b92f993b1b28e799bff47acac272335cfc6ca067283e65fb1b2406ed4c6794b2039daa727d4d5d445ea6ea9aa142b43919058d1d0b8bca9aea636220eae182266670dcb12af6d68a85958258e6f686a6c680a45ea1aea3344ddf84bdb658bd391465128922e4eacafc8985cb7a04a692cce08d587a757d52c59186aba265c51555f59d5240e152f69704975565553582e67670ccbc8e9c15dd2b22e2c86c44853a8b26a51a8e926b1a1ba2f0f6253554d5d3852d584c0ba7ab124634686581c8a54d547c4507da538b3bbe3d4eaeaba8a2a0aaca86a8a84b07143a416d9bc7149535db8b2ae421e2d9cd1cd7d2f51cc88542dad12a7842291aa7043fdb85018c742ceae69aa5bd4902e2eabadaba8159785c2626555b8aea61e910b968b7dfb88880de15ceaeb1b9622c9a555e9c877755355b8b6aebe460ce38cc57055535d758c8418a90d45e4992faa8a34d55584162e5c8e4a5bd4885d17a09696d5456ae5d1430bf766285ca058aa519a62dda2c6a686a594bda1e18aa6aaaa7a1c2754195a50b7b02e82346a434da10a14164aacae224c858132101b43f5430b96343534562193b3af9ddcd310d95204196e58b8b42a4c5bd757555586654554e2141762271c786143c34df254aa1b9a90bdca48edd05efc5637d447b06b8318aaacc439a3a01a2a962c925584128ec4990b55343520ae71612882541685336a2391c6519999cb962dcb08c5b452814ac940ca9957c245963756c554d1245359b470326abe5ed6da12aa5a791233264e16a736a27c0a913931d6205d8cdbe4b08c61b121508c758d917046b86e614643534de6d4c2c96402a923357845f0ba8554e1162de215c27a084b15a4813492e5a489b6aa45a828bfc04986e06f36c942a79885a56bb15503e217627f11b7b1066cdf48ef214ab781d463ca26121dc55d995e3696a6c7f828a2fdd3b134112954208dc9d86f01627b5316c90cacd59330ed574396201f216c710d422a10528fb4e41e22198ad795295c193b8b62c2ddf06ce468185e3997ed77659a758811a98c231423f3b888f27d13c21a70b3b8921c446c5745f516464c15ad5552aa32ed126c3183b62aa63d651944e868f5b4d5cccb8c381547acc6fe155487f1961594b66c0b0ae5062cd7c6a479234aba89725049fbc5e716c6917f2dfbcb5bc50ccadd523ae6140a97eb618a1b87f5706c5e8accaea1e32dc29a2c8b65c8893c6e2d2d87a83c2b696fd9b6ea633d17a0b589571c478cf50dc5f4528fdf066cab7029f7498fc9bb9adec374dc7a1c43c4b2a26391722a73577d091722955888ca5fd1f922c44668db0a842fc4eff2d84a5b84f251465d105b4bcbe8caaced9e3bb6f70ca49aed9185622dd531db1429b411cb0d94f7b8f486528dc8fc5751aee45288aef405d863211d47e1a396da44886ab42aa6e108e5362ea5cad8ac640e1b29642829a0d620afeeaa982467a35f987c598a8ab47a5ba4ac898594df702fdaf594db4a0a6be896acdc6a616c2465c60ba9ffb9a95b2bd5d4ca14e955526a43ff8d7caba96c22b1511b284795f855f4ac585403f65d42b5a6ac22c58623bf925c88cab721d6af917aa1488c97457455d452bb6b24a33080cc44eee46f06b5bede6ba522b65232623c67fe8ffbc97c355209f65e154dddbc2c421e27c7d67c7df75a5bd26bd5c63531033dcf64ea251a63f65318939c78090579ad5cea2787513fd977168a35d6613d42f909535966d039d4207e2a8e30598e9595bce92846c697f95ce3215a3906863c52026363bfe320406cc40dd7e0af1b7f47133f8c42f848fc453c09805afebf087adf095c602fb477c2fe4e209da09b7a01c40bf07df160f7778583ddff2cbcca7daed0e72e3bbbf22c633c3bf56cd9d94d67f79fe5f55f9c19e0fefcb342b7f133087c5698e8feb4a3d0fd66c7e98eb31d6ca0c33fbcb0a3d0e9fef69b2ef737f0f792af8bbe2af9329b94fce3ef7f2ff9ef2252f237d2e5fef8ead325a7812df9e46ab6e4af6c97dbf89efb3d86de02af395d856f1e87a3ed63dc2f14a7b99f7b7eb0bbeb69283ed278a4f9082bbf58da75c4925de83e9c7f78eae186c32b0fef3cbcffb0da79081a0fec3a103dc01a0fc0e6a720fa14189f028df160fec1b307d9e6e8e628138db6474f45d9ccfdf9fb995d4f449f60da9f38f50493b92f7f1fb3f38fd0bef7d45e66ea9e4d7b98cc3d0d7b8eede9dac3edd89ee22ede0e0d5be1d856d85ad8df7dff1687dbb8c5bd65e5964d5bbab6f059f704ee619aef81c64dcd9b98cd9ba07dd3a94dccd4bbcaee6ab88bbdbdb0cbbd731dac5d33cc1d09e7bbc3389186fa31eefac25c7712384bfaf99d256a3f5ba2c2a99723ae0caf1b0a87b9e7ce2972cfc15f6bb6a58447f170d96cc942160cec187632bb90fd0dcb9f9dd615a89cc604a6e58e2c0c4c4b1d5cf866314c2c14dd4548f95abcf617c2e9c2b3854c73212466db4bcc602c31651b4b1840fd1370bb8df9c632e34a236734661aa71a1b8c9b8ca78d5d46753ec2ce1ad9060253093427020f476073ebcc193edfa423eaaee993a2eae2b951581f4d9d21df03d3e64455eba3a464cedcd25680bb83eb366e24e3fa4f8a66cf288d96f70f4e8a56622120179ab160eadf9a48c605c3917064894ffe805220119f2f1c964b20d77c0a8e96c017463436c34e58892c21615f3802e1302e9608c2c3301fcb617435080f6346888db0498c7e37251c603e12c25b4419221cc67e61a4138e0de79c4ffe17e643b1800a656e6473747265616d0a656e646f626a0a0a34322030206f626a0a31313932340a656e646f626a0a0a34332030206f626a0a3c3c2f547970652f466f6e7444657363726970746f722f466f6e744e616d652f4241414141412b4c696265726174696f6e53616e730a2f466c61677320340a2f466f6e7442426f785b2d353433202d3330332031333031203938305d2f4974616c6963416e676c6520300a2f417363656e74203930350a2f44657363656e74202d3231310a2f436170486569676874203937390a2f5374656d562038300a2f466f6e7446696c6532203431203020520a3e3e0a656e646f626a0a0a34342030206f626a0a3c3c2f4c656e677468203437382f46696c7465722f466c6174654465636f64653e3e0a73747265616d0a789c5d93cd8eda301485f7790a2fa78b5112dffc0c12426280482cfaa3327d8090181aa92491090bdebe3ef7b8add405e8f3f5b1f96c7cd3dd717f1c8725fde6a7eee4167319c6debbfbf4f09d3367771dc624b7a61fba258ef4bbbbb5739286b5a7e77d71b7e37899d6eb24fd1ee6ee8b7f9a976d3f9ddda724fdea7be787f16a5e7eec4e617c7accf32f7773e362b264b331bdbb847d3eb7f397f6e6525df57aecc3f4b03c5fc3927f818fe7ec8cd5714e956eeadd7d6e3be7dbf1ea9275966dccba6936891bfbffe6ca15979c2fddcfd687681ea25956e49bc056b93a80855c800be5da824bd61b70455e816be53203bf291f74cf153335784bd6fabbb2d5fc4e59b4bea78f800fcc97e0868c7a9ed1076e39fd45ebf417e473fad7cad15f33f4b7f0cfe92fba0ffd8b0a4c7ffb068efe387b1efd7760fad79aa1bfc53de4d15ff3f43fecc1f42fe063a33ff296fe153296fe05dc2cfd0bec6fe92f70b3f1feb54eff12e7b2f46fb660fa17ba27fd05f76ce95f6886fed53b98feb566e82ff0b7f417fc7796fe82df15fa0bfc85fe25ee50a2bf72f4d70cfd4b5d4bff12fb4b7c3ff011fa5738a3d0bfc1b984feb5d6e96fe12cf42f2b7de4f135e3b9a31fffb491e91ede8716d2a6d5de41d70ca3fbdbd7f33463957e7e03d28bf56d0a656e6473747265616d0a656e646f626a0a0a34352030206f626a0a3c3c2f547970652f466f6e742f537562747970652f54727565547970652f42617365466f6e742f4241414141412b4c696265726174696f6e53616e730a2f46697273744368617220300a2f4c617374436861722035390a2f5769647468735b302036363620353536203535362033333320353536203232322036363620353536203535362035353620323737203535362037323220353536203530300a3237372035353620353536203535362035303020323737203535362036313020333333203535362032323220353030203333332036363620323737203636360a3530302038333320373737203732322035353620353536203636362035353620383333203535362035303020353030203535362035353620353536203535360a3535362036313020373232203237372036363620373232203232322032373720353536203530302035383320363636205d0a2f466f6e7444657363726970746f72203433203020520a2f546f556e69636f6465203434203020520a3e3e0a656e646f626a0a0a34362030206f626a0a3c3c2f4c656e677468203437203020522f46696c7465722f466c6174654465636f64652f4c656e677468312031313131323e3e0a73747265616d0a789ce539697853d795f7bc458b37e949de64037a42d8c6f5226f2c66891f5e841d93da603bb5d86c61c948896d094b40494231699b80098134e99a26e1ebe4cba42429cf64c159dad049937486f0252469429aa6a109dda649a10d74fa017e9e73af9e8c21cb7cdf7cf36f9efcde3df7ecf79c73cfbb92e3c39b83248d8c109e287d83fea8525c504508798510b0f56d89cb3fb9c15787f02942b85dfdd18d833f38b2f61c21428810e3131b07b6f56f87b2e709499b4148464d28e80ffcf29548292179eda8637e08117ddaad469cefc2f99cd060fcab9fa474aec5f9a3386f1f88f4f95f2f3c3917e79770fea541ff57a327f9b77842f21147e421ff60f0c09d777f8cf366425207a39158fc6d8049420ac7293d3a1c8c9289476b717e127dda8f38c00fbdd21034d039c70ba2c16832a7a4a6a56758ac928dfcffbac457c457c8767127c922dbd8f38a4b584432c95642263fa2b3cb4fed2b93fff57fe985893dc10105e43cf9cb34c2cfc91be419a29257a773431114d3ec818d9c26e7c84b9fa715f539610503df2727c88be4c9cfe1e3c88f61829c0407d6f9118428ae8ebc0bebd09f8388db4cf6c225d8062e7200ac8c5a89ba3340f80c5d4bb1fe4ea177f79053e41e6824a7c418ef40c249ee45f2437e27779c1c439fbfcced45dc24799bbc0215d04462e409f2105310437b7ba76bc472ff11f91ef9fa65acf813ed3971e744059126ff419e22cfb108ec20a3a4774ae82cfc15f6e39e7480099239fd5992686ce66fe09ee2b889bb717217d988b71fde41eebdfcb2ab9673508b682110c9dde8c107b092ec432d3fd19ed61e24ebc921ee57a48bfc9d3c2464197057f1bf2356ee02b1686fc27f4e7e42c699ef7d2475c232793ea1ccb053d84ab28477680d4dbea8edc0b81e277fc7e8ff0a1ccaf235ab7ddd5d9d1dab56b6b77df9ba15add7b6342ff7363536d42f53eaae59ba64f1a2da850be6cfabacf0949795ce2d2a2c98e39eed72e6664a564b467a6a8ad964348802cf01299555e86d52f90259f2fadd4d6e7f7359a9dc941b6a2c2b6d727b7b55d92fab380885eee6668672fb55b957560b71f04f43f7aa0a72f65fc5a9243895294eb0ca4bc8126ac22dabc71bddf238ac5ed98df0de46b74f563f66f0750c160ad9241d272e174a30afa8b77293eadd121a6dea451f612c35a5c1dd104c292b256329a908a622a4ce7547c760ee35c0006e6ed3a2318e98d2a9595c69933fa0b6afec6e6acc77b97c65a52d6a86bb9191480353a91a1a5423532987a9eb648f3c567a74f48e712bd9d05b92167007fc6bbb55de8fb2a37cd3e8e8edaa54a216bb1bd5e29b4ee7e2ca836aa9bbb1492da15a5b574dd969bd6c1254b1c0ea9647cf135c8efbe38faec4f8758ca1c07a9e5050e51a5458d5eda257be17633d3aea75cbded1de51fff8e4c806b76c758f8ea5a58d469b30dca4bd1b558c4f3eb3275ff5dee153adbd2158e4d397ee5dd5aada57aee956b902af1cf22306ffeadcae85f92e698aa7fdf3c804c382c1c108bb5c340c7bc615b20127eac8caeec45c261bf20f13c553e253b95e4a399aa4647551ca48923225deebc6dcb676748faa42414bc0dd8411dfe35747366075dd4013e3b6aa19ffc877b9476d925cebf1315e19bd6a098465552cc420a1d47401ac1b2a326a65938c7f24868ff3d140a164936bdda886ea697237f5ea7f5b42b9a840c6403797240aa1b35b551a1150fc7ac69ac62a3c28e1efc584851b5932558f3baa66baeba7b24bdd6a0a777433115d4ccd6c50496f9f2ea57a9ad8be929b467b1b132e505dee95dd4f93eac953633572fee3d5a486f81a29737603565961d36877a05f75f6e60770dff5cbddf92e55f161867deeeea08f961d46a8f8543e2b0e1fab95ceeed60e77ebcad5dd0b75471204aa4e2868ba4a8dbb3b3fa1060b50351598e46e2e9ff721a31511b2170177fd127caac60213de560c38c3d2c2ad5f2277433e4972a31b6ab1dc146cd4f9e8fc0aa5222da786e6a436039da29e86e67c97cf95b8ca4a3924cbba619430d1a0362749d8a69060c2fa6c6866281acb5c5af472b73be8f6b943b2aab477d3b5d1f0b028ebc16031d773d579c56c5ab0304cc485e4e4840653f596e44f0faeba9ccda7a6cd57915b926479d4e46eed18a5caddba42829eb7a88496b0b250ca67bd806e6837f65ed98a5b9a6de8d13145a19b39b4882a71b70446dd1ddd4b1837f693edf937515b36d20aad9df565a5d8daeac7dcb06be59802bb3a56773f8daf5c795767f7610eb886de7adfd81ca4753f2d13a2302c47b1144927329d504dab706262fcf94f2b848c30aac0106cde370e84e14c491c90be712e81b3260c1532430ae1902224284a925b409c29811b6138768d111a322545544c8a5949e3d2b9fc31a0a8c3887906df9266208fa7413ae48fa1d42a861e879131b3929fe018410e25e1e1aeaecba6bb56773f9e46508c3dd1503dbdb05c7243986c7cad34c9015a28b7f842a3bd3ebad94836a606ff4005f7359826f735e888214d4d7107ebd554773dc5d7517c5d026fa07823962864038a8f60eedb55a015b0a6db855b52cefbf7fc51ebc734533e6c2aa3d6df97a173c7f1345285e7469e18895349377022cff16693c80b88aa3bee392ed9a0b656aa96aa2b2bec2ec965975cd2712178f1de15fc7171e7851de2bc8b39c29fe9e18023d5a8eb2ed4652416cea84ca60349e34ca898170ca249301979ab644ce37a7ce926312dcd404dd86e93202e4140820e091a24a891a040826c0938093e91e0b4046f4af0a2044f49f02f12dc2dc13724d82c41bf049d123431fe391264492048103a2fc1ef93028f4b400e48f02d2681163648d02e41bd04554c2261e1ac041f30815f487058820725d82fc1ad49fe5512344a309ff15b19ff39e6d15b49fe1f49708f04b8822d6c05097ef4a850824c090c4a4482857f4f8afc9b044f48f010f327c18f2bf032669b04409876d4ab4a7080e94d84a53da9349329fa05d3720fd312650c8d09e750deb47e5dcfbae4b5e9f235dc333cfd5abfeeaa6bd355d734de9eff4182d455d555d77a6cb5d52524d78395928395524d8b45b261d1d4d65656b878fc80cb0cc60c40b04818dc3ef1c7edda3b1c076b3932b1ca9032e37ef8f69e120869dfa3f5243c9c3d67ad5603dfdec50ee36437d6d452aca974d2ae78484a4aba5110c474d19201a654032f125baf05da2da05860c402510b1cb5c0010b545840b640c2575c41c2cfdaa9524e94b30bb2b3b09a5d50380f07fec3891fd8b40bb0928bd8c0202cbdbff7d2cfc59d179ff9ee2d7cf5851dacbea92f9bd01733b1911a65a6454c2122c9b41b327a7ce88aa5c727da4632a12213e44cb48dd1c1a8d4954cdb4090c9096eb42813a8292c01a9baca266e7a447bf93f265e020d02709bf6f647ef9eb8f0b353dcb15f6bcf3e2aeed4beaf8d7d78e6d272fa652961ff3e168b2cb24ea986b4349bd9c6f3428699a4a79b053e273bcdc671b61e1fc7115194d01fbac5a2397020072a7240cea111614943a7486dae870d7adaa464de12a171d1c85409599906a3196a8a0127f38595f8c5e121ccddd14b607b781f6cd7eed22e69b7c1adb78c7039137f1677be73ec9eb7674fa8fc89635a6f34d1133a273f123f14bf83dfd77349b3526a37a6637b70e4a5587b7c298290dde313ec07f260240fa279d09b074a1e54e4c1d93c90f32059689f1347994856c242c9b967735999361acd0ff19bd549ed09ed76f82ab4e1679bf6c6c9175e3af9def32fbdcdbdfc1bedf018dc0e9dd001b76823dad869e0b5c93ffc493bcfbe07b25ac3532fed85fd4a137e6b1344e089ed9488483820c27e114644681741118188705684a3495254845e119c2220f36b493c324fdf2ec94d45eaeae852e83aaa31c8bba188d67db2d60d683f95c4956b45b319014835a4f04622a4a58ba61e9f45dc213e20f216719f3889032f6667b55844c814c5ecb416512400428f0f7d36f7f8884d49878a7490d3a91353216459ef59bf8ede9b4a58ea114a4415bdc972e9f76ea1f3d21bdcd9092b7fbdb8f3b476ff696defe9648c8407d14791b81589c6c86044833c35d86e04dd909eaac40251191471e7702ff59d9edad30617eac8814165328be458d33372321cb9428ad19e632fb2f3a694dc94b929bc39c59e65e1334cc4b6c701373aa0d5018b1d90ef808b0e38e3805f38e011073ce000a4c61db0c6016d0ea87140aa03364e3ae0b4038e39e059071c72c03d0eb8d9011107343aa0c4014ec674ce01ef3ae055c6f36903c798f63d4c700dc37b1c203860c15f18ed0907dccbcca2cc1ca60e65de4cdafb0653d7e3004e71401d3378d601a798b5030ed8c15c45bcec80c789038ceba7b7d69eabea65fda7fbeee7f5f3645366dd0e09743fb34c607ee9ae966ae62fe08cbc3b55ef7c76272cc09d2ee68379f96ced75edc6346c807b2e6557d4010fbbf9eb672efa8df6c90d97fecadb60eb9f5a2f1d14775efa68c54f3fe01727ea3507d37f9cbeefa151f913e0d9cc882707dc3502ed3c606bc78310f60e33cc318360867366386d86a36678c20c0f9a618f19a2660898a1d30c8b933ca18b8ce998190e9861bf19bec1c88d4c4b42c5bb8cfa04938f9b614d5238d50c28fb1733bc66865f98e15e2695cff00bce3199671916c56e3643c40cad4cb284e945a58f30d21a864799493370ef9be15533ec637e569841c6939ff972ae7ad67d2a17eb3f95a84d9f9da764a27047926abdff6257a32999e7cae245ed1dad56784ab8ef629f70dfe9d353ef1e2beb0d76eca3c51683c198869d342b53c44e2a8a069309df3f26de601bc9826816f46641451638b3e0b2a564c79f7a07d23e9a016ebdd38b7a9317adb7fcf101ed47d8e5b74d80a4bdad5dd05e85da9bbec1bfb0ebadcd1abaf0e75fff565bb08de69ff6f67dd8db73c92aa52adb6cb5e0c9d1c2f3798e347b8fcf6a4d13089ec3398247ee11ee28f71a27a6f21c6730107c5ddab1cbd36681ebcff5d05e5457ed2999f626aaac2890eda221d9e5ab841cb11cdcb30dd8e6f97c480d017468cf9fd21ed5f6423f74fe1316d669975c3ffffa2f5ffdd59b90e67fe565d809ab610dc45ffef9f21bb6fff3cc2793c9def53df6fe6e56be0434689c814f49a54dd30290ca83925ed90c201a8de8a291176d15a920a7026d9f57f4ce293f59ceb25800b3f0a47d62c2a3bd235884fbb415a7272e62dfd463f40cc66806b95629cecbc8b40bc60cbb681466cd3488180743aa24e5f4f832332521158da6da2b66813c0b921dbbda332d6fd36253357fc13c2c15692a4018aca9f814c64e2ed61ee6faa3daf75fd41ed6ee8438ac83b3b76b674b9fdbf1dac9f7df68a879e1d7131762b7c276580f6b21a6ddb5eac6a14b7f39a35d447f6f467fafc51849a445294dcf10850cc16e4b1712ef147baf1ddaeda0d861c40e513b1cb5c3013b54d841b64f3f6c31cfa7bdae45199b9c4bcaccaeae9a4f8f5a56c2bda1bda71d83a2077e70ff4128d29ecc841960e2375d7ae85f1f7bf2c77cfba5fbb573da3bec5db118fd3160fcbe8435e649233367ccce361a0cd93388505a92369b7738e41edfcc990e814fc19233cac60a235f61548c9cd1c8db09c60fdf7297e378e55987d6bfe092e71415cc826a795e4d3914950bf36ae6b8e444b5c95999b32067162f1ab4e3b80ffea6bd520a33673efc6d98b77ce791fb6f09788bc00978560463a1f641f6ed5fd3ced5461f3976a87f3e7ce7d5778fbee089069f5bf2e59a8282b2a5d7c75b9f3ff6e04f8bd6ac7d7881b7b2a0a4c57f3b999c4c9c6d8d4e5b21ee6f2219891deec43567e38b3b23432c841c9233474c2b2891e6117ac3e4abe205ee5da313f7db42453699b3b2b3f3cc8eacf47471bf8fa4ef5b436cfb7da61e8c99624e6b26c453b2aeaaa4847518b8bce2d9e5785a3218ddd770d555b3f09ebfa03a03e052a9afb375567149c66e53e5da1565ab3b5b66ce2dcbb8ddb849bc50e8292cbf6ed3a6061c2bafbd6f1761ff7fe11cdf5ff0b190de6359729e3813bffdffb2255498fcd179f2d5c98f0c2ef4148889ae2df1c33a21c66bb42f9386cb3fb55ff55b75269e728f8b2f936abc77276f432de9e46a11be9eec163ec4f94136e6d039d23b190e7910be19718b91975039eee024fd9f4321b4c377e02dae82bb8d7b89cfe51709b38437c559e2165135980ced869fe1e72d639eee4d2629417f8bf0e6889578c85a42f8ebf84e2230ea2c189af2f9fa29ff815870968039e40cea304ff248588705d4fc751d16f1fcfe5d1d3660377f50878de4267244874d24132a75d84c32a0498753200c1d3a9c4a6670cf4dfd37ac9c3ba9c3e9641e6fd0e10c92c72f464ff02587b347f92e1d06324b001de6884970ea304f6a84221d16c85c618d0e8b244ff8ba0e1b48a1709f0e1bc939e1051d3691b9e2111d369319e2fb3a9cc2bd2e5ed4e154b2d0745c87d3c85ab3a8c3e9e406b35f8733488df958637863381ebe29189003feb85fee8b44b70d873786e2f2dcbe62b9aaa2b2425e1e896c1c08ca0d91e16864d81f0f4786ca531aae66ab9257a18a667fbc546e19ea2b5f11de104cf0ca1dfea1587d6420b02cd6171c0a0487e532f92aea555399725f1f1c8e514455796579cd65064a2fa3f46932e198ec97e3c3fe4070d03f7ca31ce9bfd2157938b8311c8b078711191e92bbca3bcae5767f3c381497fd4301b9734ab0adbf3fdc1764c8bee070dc8fcc9178081dbe61f370381608f7516bb1f2a9754c0b48473cb825285fe78fc783b1c850bd3f86b6d0b365c3e1c148a9bc3514ee0bc95bfd3139108c85370e2171c336f94a1919a97e5ccbd050640baadc122c45bffb8783b1507868a31ca361890587c3fdba0a391ef2c7e9ca0783f1e1709f7f60601ba66e308aa21b30575bc3f110b5ee1f38589ef002c3d28f2195c383d1e1c816e65e59ac6f38181c423bfe807f4378201c471d21ffb0bf0f8385110bf7c55830300672d43f54d6b47938120da2935f59bee23223ba9508642c32b0251863dc43c16020461311c0250ea0101a1e88446ea44be98f0ca37b8178a86c9abffd91a1388a46647f20806bc64045fa360fd2146184e349e7fc7dc311a44507fc71d432182b0fc5e3d1451ecfd6ad5bcbfd7a56fa3029e5a8d9f345b4f8b668504fc530d53238b002333f44b3b699a5962ea2a36585dc16c5f878d13959672895938559595ea99bc03086a3f158792c3c501e19dee869f3ae208dd89036e21dc7fb266c540122e3edc7b91fa13e122151b28d0c33ae1062653217b1c53856910a5289b74c96235704e903282f63338f207f943dfd4c6f840c917292c2285facad0aa155ba17cd4cba14a11694ef430d2b506e0352a7eb954907ce86488cd4e37c00259721dc875c4308535e9994e1fdc5b25f4c95a7745fcf7862531c55e85525de359fa921295f3625ffd976c2cc068d779c51a8df83380e931b111721fd5f181519f9822c8731a404d92cc0b452dd5dc8d1c1b8da99248d4b9c591b625c9d9f61b10d2df6a37c1fcb6792b38fe9a67591d01c4138a447f806b2996535869c542eb9b6185afe743e3ebb423a98775b98cdeb189ece638c568ff398beae44cc96317b8338a3b1d88a9e50bb2106fb593c034c9a56da902eb9016b4ffe423bb22eebd7f332849f08f226bca432a57abcfbd933c6ec0ea10d19e164b5c4d83ac32c6fd3bd9059c4fc2cfe899c0f2235ce78fb103f809f6dfaae1bc4f824ac6ed0f7d556b64b43536b477ed76c96d9cbb148544bbf5ea532c346118e30df93d12b6319a1fe07995714f2b35dbf012506989d841f2156137e96d1a09ee138f33619a580be2aea619461ca4813ab06bad7837a24bf823d62c5676a4c446b7a45c6d85ed9c2e27659f710f336c07091a9c852ae01dd5262c503ac17dd3895957e566589e80598b6b2cf896f3f8b4d5cb71a611e05f093c873a2a22228bb99652db18b12351cff54e4fc2cbe115d2e8a146a2be1cb20db1521567751b2088f941ef48e7eca59f54ddf2b7dfa4e29d77df6fcafe5a85f5116c1e9bb6278ca9741f47185bee787a6f6dae669bb3699890eec3c2b589788eaf5e3d523275fa581ee95ab3b6625eb9857ae22518d619cc7993f3116cb72b6868d486f430b2b12e7e7c477098dbc4d3ee35ad6057504a09674c135fa580f0a9eb39db00c47278e8b49352c42fc421c914e1ec4e739bc39a8224bf17cdd45cfd8e0c1b102e7742c8562328992c588ff12cee722be08c7227d5e88f3021c0bf4b91b6633fed9fabc04e938927630e219dbc39e874050dae1b509787e02ac1310b908ca451839bffffc81f3fcdfcece737ace3e7096eb39039e333d6722671e38f3fe19f10fa765e7ef4f2f757e70aac8f9bb534b9def2f7dafebb74bf1f4fe5ec57bdc7bc0777996a5c22cd46dc5a78cb782373f79146629731d33bcbfe1279de45df8b5b0c4f9e6eb339c6fbc5ee8ec3db1ffc4d1133c1d54044e9d10c7278f3e7ec231d38be3132752d2bd9671c8562cf0fccf0a9dcab3c5cbbccab3b38bbce3e0520a9f5aea24e3101987f123294e7204c811f98872a4f748f4884887fd475e3b72f688380eb292de8cac4ff63ec91d78f2b52739d4ac643c999ae1b51cee39cc8df14b9cd46d07a9c3bb0d6f9eecc3277e5d058732b7b0d8eb3ce4395477e8814382e510288732b2bde4b1e863238ff1a71e3bfb18f7c8c179ce83ed85cea7211ff20e2fa11ee53d05961f83e561780e72c04e96601eb294afb52f71de7f6f91f33ebc7f88f7c8bdf03def5ce703df3df45dee3bde794ecb3dce7bb8bbf7173abf7557a1d3b2cfb92fb26fc7be7dfbc43bef2874b6ed05cb1da0dc916af15a763b7773b77dd3e2ecf926ccbfd57b2bb7056d6fc63b8e770cefe228e447818fc2b928bc15fd43940b45c11785f1c9b3caf628863332d4ec1cf25639f320b7cb519ddb65ace6bb0c98173fcaf6f654397b705cbfbad9b9d65be45cb3faabced5de4aa7bdcad6256276852abe2bc28385afe3dbf808bf83177b3a40e9985bea553a66cdc6873dd77be3aa9b57ed59c5af6c9be16cc7dbd156dcc6f9dac26ddc38d894326f81b3c5eb70367b5dcee5b8e87f7a310830a339bf2bbb2aab4b024b97b5cad2c501562c99748e837438df8c835529c3d169a9b3f4587658048bc56369b3442cfb2cef5b262dc63ac49db1f011026d0446b2418471d83fd6d95152d23a6e9c5cd5aa1adbd7a8b04b2de8a04f65e56ad5b04b255dabd7748f01dce9fbe6debda47e66ab5ad5d1adf6cef4b5aa0104140a8c20609d39964dea7db1782cbeb944bf2016a703a1430c81588c9280a2a658183a168bc7e32421122b899112fa4402e093c41823f25066aa4bff03fa24d41c33038c3316a74c4c78337db219c55245ec420bb129f34c7362c8fd6feb760cbb0a656e6473747265616d0a656e646f626a0a0a34372030206f626a0a363732340a656e646f626a0a0a34382030206f626a0a3c3c2f547970652f466f6e7444657363726970746f722f466f6e744e616d652f4341414141412b4c696265726174696f6e53616e732d426f6c640a2f466c61677320340a2f466f6e7442426f785b2d343831202d333736203133303420313033345d2f4974616c6963416e676c6520300a2f417363656e74203930350a2f44657363656e74202d3231310a2f43617048656967687420313033330a2f5374656d562038300a2f466f6e7446696c6532203436203020520a3e3e0a656e646f626a0a0a34392030206f626a0a3c3c2f4c656e677468203330312f46696c7465722f466c6174654465636f64653e3e0a73747265616d0a789c5dd1cd6e84201000e03b4fc1717bd808ee7f624cb6ba261efa93da3e80c2b835a948903df8f665986d9bf4a0f90666263024455dd666f0c9ab9b54039ef783d10ee6e9e614f00eae836132e57a50fe1ec5bf1a5bcb9250db2cb387b136fd94652c790b7bb3770b5f9df5d4c1034b5e9c0637982b5f7d144d889b9bb55f3082f15cb03ce71afad0e7a9b5cfed0849ac5ad73a6c0f7e598792bf84f7c5024f632ce9286ad230db56816bcd15582644ceb3aaca1918fd6f4f1ea9a4ebd567eb42aa0ca9426c651e9c922fe80d798bde46ef52f48ed62bf49e7c421fc83bf4915ca04fe4127da63eb1e72359a00bcad9a04bf21e7d211fd015e5637f29c8982fe9fc29f69174fe52c68bdf6f8823c037fa192d5737e7c258e343c679e2240703bf6f6d278b55f1fb06cd83954f0a656e6473747265616d0a656e646f626a0a0a35302030206f626a0a3c3c2f547970652f466f6e742f537562747970652f54727565547970652f42617365466f6e742f4341414141412b4c696265726174696f6e53616e732d426f6c640a2f46697273744368617220300a2f4c617374436861722031380a2f5769647468735b302037323220373232203732322037323220373737203237372036363620363130203833332036313020363636203732322036313020373737203732320a3636362032373720373232205d0a2f466f6e7444657363726970746f72203438203020520a2f546f556e69636f6465203439203020520a3e3e0a656e646f626a0a0a35312030206f626a0a3c3c2f4631203435203020522f4632203530203020520a3e3e0a656e646f626a0a0a35322030206f626a0a3c3c0a2f466f6e74203531203020520a2f50726f635365745b2f5044462f546578745d0a3e3e0a656e646f626a0a0a312030206f626a0a3c3c2f547970652f506167652f506172656e74203430203020522f5265736f7572636573203532203020522f4d65646961426f785b302030203539352e333033393337303037383734203834312e3838393736333737393532385d2f546162732f530a2f537472756374506172656e747320300a2f436f6e74656e74732032203020523e3e0a656e646f626a0a0a31302030206f626a0a3c3c2f547970652f506167652f506172656e74203430203020522f5265736f7572636573203532203020522f4d65646961426f785b302030203539352e333033393337303037383734203834312e3838393736333737393532385d2f546162732f530a2f537472756374506172656e747320310a2f436f6e74656e7473203131203020523e3e0a656e646f626a0a0a32322030206f626a0a3c3c2f547970652f506167652f506172656e74203430203020522f5265736f7572636573203532203020522f4d65646961426f785b302030203539352e333033393337303037383734203834312e3838393736333737393532385d2f546162732f530a2f537472756374506172656e747320320a2f436f6e74656e7473203233203020523e3e0a656e646f626a0a0a33312030206f626a0a3c3c2f547970652f506167652f506172656e74203430203020522f5265736f7572636573203532203020522f4d65646961426f785b302030203539352e333033393337303037383734203834312e3838393736333737393532385d2f546162732f530a2f537472756374506172656e747320330a2f436f6e74656e7473203332203020523e3e0a656e646f626a0a0a35332030206f626a0a3c3c2f436f756e7420342f4669727374203534203020522f4c617374203537203020520a3e3e0a656e646f626a0a0a35342030206f626a0a3c3c2f436f756e7420302f5469746c653c46454646303034313030364530303634303037323030364630303639303036343e0a2f446573745b31203020522f58595a2030203834312e38383920305d2f506172656e74203533203020522f4e657874203535203020523e3e0a656e646f626a0a0a35352030206f626a0a3c3c2f436f756e7420302f5469746c653c4645464630303431303037303030373030303643303036353e0a2f446573745b3130203020522f58595a2030203834312e38383920305d2f506172656e74203533203020522f50726576203534203020522f4e657874203536203020523e3e0a656e646f626a0a0a35362030206f626a0a3c3c2f436f756e7420302f5469746c653c4645464630303431303037323030373230303635303036373030364330303646303037333e0a2f446573745b3232203020522f58595a2030203834312e38383920305d2f506172656e74203533203020522f50726576203535203020522f4e657874203537203020523e3e0a656e646f626a0a0a35372030206f626a0a3c3c2f436f756e7420302f5469746c653c46454646303035303030363130303733303036463030323030303634303036353030323030303434303036313030373430303646303037333e0a2f446573745b3331203020522f58595a2030203834312e38383920305d2f506172656e74203533203020522f50726576203536203020523e3e0a656e646f626a0a0a342030206f626a0a3c3c2f547970652f537472756374456c656d0a2f532f500a2f50203538203020520a2f50672031203020520a2f4b5b30205d0a3e3e0a656e646f626a0a0a352030206f626a0a3c3c2f547970652f537472756374456c656d0a2f532f500a2f50203538203020520a2f50672031203020520a2f4b5b31205d0a3e3e0a656e646f626a0a0a362030206f626a0a3c3c2f547970652f537472756374456c656d0a2f532f500a2f50203538203020520a2f50672031203020520a2f4b5b32205d0a3e3e0a656e646f626a0a0a372030206f626a0a3c3c2f547970652f537472756374456c656d0a2f532f500a2f50203538203020520a2f50672031203020520a2f4b5b33205d0a3e3e0a656e646f626a0a0a382030206f626a0a3c3c2f547970652f537472756374456c656d0a2f532f500a2f50203538203020520a2f50672031203020520a2f4b5b34205d0a3e3e0a656e646f626a0a0a392030206f626a0a3c3c2f547970652f537472756374456c656d0a2f532f500a2f50203538203020520a2f50672031203020520a2f4b5b35205d0a3e3e0a656e646f626a0a0a31332030206f626a0a3c3c2f547970652f537472756374456c656d0a2f532f500a2f50203538203020520a2f5067203130203020520a2f4b5b30205d0a3e3e0a656e646f626a0a0a31342030206f626a0a3c3c2f547970652f537472756374456c656d0a2f532f500a2f50203538203020520a2f5067203130203020520a2f4b5b31205d0a3e3e0a656e646f626a0a0a31352030206f626a0a3c3c2f547970652f537472756374456c656d0a2f532f500a2f50203538203020520a2f5067203130203020520a2f4b5b32205d0a3e3e0a656e646f626a0a0a31362030206f626a0a3c3c2f547970652f537472756374456c656d0a2f532f500a2f50203538203020520a2f5067203130203020520a2f4b5b33205d0a3e3e0a656e646f626a0a0a31372030206f626a0a3c3c2f547970652f537472756374456c656d0a2f532f500a2f50203538203020520a2f5067203130203020520a2f4b5b34205d0a3e3e0a656e646f626a0a0a31382030206f626a0a3c3c2f547970652f537472756374456c656d0a2f532f500a2f50203538203020520a2f5067203130203020520a2f4b5b35205d0a3e3e0a656e646f626a0a0a31392030206f626a0a3c3c2f547970652f537472756374456c656d0a2f532f500a2f50203538203020520a2f5067203130203020520a2f4b5b36205d0a3e3e0a656e646f626a0a0a32302030206f626a0a3c3c2f547970652f537472756374456c656d0a2f532f500a2f50203538203020520a2f5067203130203020520a2f4b5b37205d0a3e3e0a656e646f626a0a0a32312030206f626a0a3c3c2f547970652f537472756374456c656d0a2f532f500a2f50203538203020520a2f5067203130203020520a2f4b5b38205d0a3e3e0a656e646f626a0a0a32352030206f626a0a3c3c2f547970652f537472756374456c656d0a2f532f500a2f50203538203020520a2f5067203232203020520a2f4b5b30205d0a3e3e0a656e646f626a0a0a32362030206f626a0a3c3c2f547970652f537472756374456c656d0a2f532f500a2f50203538203020520a2f5067203232203020520a2f4b5b31205d0a3e3e0a656e646f626a0a0a32372030206f626a0a3c3c2f547970652f537472756374456c656d0a2f532f500a2f50203538203020520a2f5067203232203020520a2f4b5b32205d0a3e3e0a656e646f626a0a0a32382030206f626a0a3c3c2f547970652f537472756374456c656d0a2f532f500a2f50203538203020520a2f5067203232203020520a2f4b5b33205d0a3e3e0a656e646f626a0a0a32392030206f626a0a3c3c2f547970652f537472756374456c656d0a2f532f500a2f50203538203020520a2f5067203232203020520a2f4b5b34205d0a3e3e0a656e646f626a0a0a33302030206f626a0a3c3c2f547970652f537472756374456c656d0a2f532f500a2f50203538203020520a2f5067203232203020520a2f4b5b35205d0a3e3e0a656e646f626a0a0a33342030206f626a0a3c3c2f547970652f537472756374456c656d0a2f532f500a2f50203538203020520a2f5067203331203020520a2f4b5b30205d0a3e3e0a656e646f626a0a0a33352030206f626a0a3c3c2f547970652f537472756374456c656d0a2f532f500a2f50203538203020520a2f5067203331203020520a2f4b5b31205d0a3e3e0a656e646f626a0a0a33362030206f626a0a3c3c2f547970652f537472756374456c656d0a2f532f500a2f50203538203020520a2f5067203331203020520a2f4b5b32205d0a3e3e0a656e646f626a0a0a33372030206f626a0a3c3c2f547970652f537472756374456c656d0a2f532f500a2f50203538203020520a2f5067203331203020520a2f4b5b33205d0a3e3e0a656e646f626a0a0a33382030206f626a0a3c3c2f547970652f537472756374456c656d0a2f532f500a2f50203538203020520a2f5067203331203020520a2f4b5b34205d0a3e3e0a656e646f626a0a0a33392030206f626a0a3c3c2f547970652f537472756374456c656d0a2f532f500a2f50203538203020520a2f5067203331203020520a2f4b5b35205d0a3e3e0a656e646f626a0a0a35382030206f626a0a3c3c2f547970652f53747275637454726565526f6f740a2f506172656e7454726565203539203020520a2f4b5b342030205220203520302052202036203020522020372030205220203820302052202039203020522020313320302052202031342030205220203135203020522020313620302052202031372030205220203138203020522020313920302052202032302030205220203231203020522020323520302052200a323620302052202032372030205220203238203020522020323920302052202033302030205220203334203020522020333520302052202033362030205220203337203020522020333820302052202033392030205220205d0a3e3e0a656e646f626a0a0a35392030206f626a0a3c3c2f4e756d735b0a30205b203420302052203520302052203620302052203720302052203820302052203920302052205d0a31205b203133203020522031342030205220313520302052203136203020522031372030205220313820302052203139203020522032302030205220323120302052205d0a32205b203235203020522032362030205220323720302052203238203020522032392030205220333020302052205d0a33205b203334203020522033352030205220333620302052203337203020522033382030205220333920302052205d0a5d3e3e0a656e646f626a0a0a34302030206f626a0a3c3c2f547970652f50616765730a2f5265736f7572636573203532203020520a2f4b6964735b203120302052203130203020522032322030205220333120302052205d0a2f436f756e7420343e3e0a656e646f626a0a0a36302030206f626a0a3c3c2f547970652f436174616c6f672f5061676573203430203020520a2f506167654d6f64652f5573654f75746c696e65730a2f4f70656e416374696f6e5b3120302052202f58595a206e756c6c206e756c6c20305d0a2f4f75746c696e6573203533203020520a2f53747275637454726565526f6f74203538203020520a2f4c616e672865732d4553290a2f4d61726b496e666f3c3c2f4d61726b656420747275653e3e0a3e3e0a656e646f626a0a0a36312030206f626a0a3c3c2f43726561746f723c46454646303034333030363130303643303036333e0a2f50726f64756365723c46454646303034433030363930303632303037323030363530303446303036363030363630303639303036333030363530303230303033323030333430303245303033323e0a2f4372656174696f6e4461746528443a32303235303532373132303332392b303227303027293e3e0a656e646f626a0a0a787265660a302036320a303030303030303030302036353533352066200a30303030303235313236203030303030206e200a30303030303030303139203030303030206e200a30303030303031303735203030303030206e200a30303030303236333335203030303030206e200a30303030303236343035203030303030206e200a30303030303236343735203030303030206e200a30303030303236353435203030303030206e200a30303030303236363135203030303030206e200a30303030303236363835203030303030206e200a30303030303235323736203030303030206e200a30303030303031303935203030303030206e200a30303030303032333638203030303030206e200a30303030303236373535203030303030206e200a30303030303236383237203030303030206e200a30303030303236383939203030303030206e200a30303030303236393731203030303030206e200a30303030303237303433203030303030206e200a30303030303237313135203030303030206e200a30303030303237313837203030303030206e200a30303030303237323539203030303030206e200a30303030303237333331203030303030206e200a30303030303235343238203030303030206e200a30303030303032333930203030303030206e200a30303030303033343235203030303030206e200a30303030303237343033203030303030206e200a30303030303237343735203030303030206e200a30303030303237353437203030303030206e200a30303030303237363139203030303030206e200a30303030303237363931203030303030206e200a30303030303237373633203030303030206e200a30303030303235353830203030303030206e200a30303030303033343436203030303030206e200a30303030303034313838203030303030206e200a30303030303237383335203030303030206e200a30303030303237393037203030303030206e200a30303030303237393739203030303030206e200a30303030303238303531203030303030206e200a30303030303238313233203030303030206e200a30303030303238313935203030303030206e200a30303030303238373831203030303030206e200a30303030303034323039203030303030206e200a30303030303136323230203030303030206e200a30303030303136323433203030303030206e200a30303030303136343339203030303030206e200a30303030303136393837203030303030206e200a30303030303137333833203030303030206e200a30303030303234313934203030303030206e200a30303030303234323136203030303030206e200a30303030303234343139203030303030206e200a30303030303234373930203030303030206e200a30303030303235303237203030303030206e200a30303030303235303730203030303030206e200a30303030303235373332203030303030206e200a30303030303235373838203030303030206e200a30303030303235393133203030303030206e200a30303030303236303433203030303030206e200a30303030303236313835203030303030206e200a30303030303238323637203030303030206e200a30303030303238353434203030303030206e200a30303030303238383737203030303030206e200a30303030303239303633203030303030206e200a747261696c65720a3c3c2f53697a652036322f526f6f74203630203020520a2f496e666f203631203020520a2f4944205b203c34393336453134373037333436344242423234373444373544303141344342453e0a3c34393336453134373037333436344242423234373444373544303141344342453e205d0a2f446f63436865636b73756d202f37344238453936323542444231313242393044363630324330414336323438350a3e3e0a7374617274787265660a32393233340a2525454f460a);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajadores`
--

CREATE TABLE `trabajadores` (
  `nacimiento` date NOT NULL,
  `id` bigint(20) NOT NULL,
  `codigo` varchar(10) NOT NULL,
  `password` varchar(255) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `estado` varchar(255) NOT NULL,
  `telefono` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `trabajadores`
--

INSERT INTO `trabajadores` (`nacimiento`, `id`, `codigo`, `password`, `apellidos`, `nombre`, `correo`, `direccion`, `estado`, `telefono`) VALUES
('1999-12-12', 5, 'admin123', '$2a$10$yCCK219RITHTujAOHA.8IO6ZAo4kwcas5IYWaNYPY7CVyQWzT7JqS', 'De Prueba', 'Administador', 'administrador@deprueba.com', 'Plaza del pueblo', 'activo', '000000000'),
('2000-10-12', 7, 'ahg331', '$2a$10$r0gBJTvRGJrPtm/VpYUFRud9arZH4DroppCzIcc5101CzZC2qdh46', 'Herrera', 'Alejandro', 'alejandro.herrera@ortoliberi.es', 'Avenida', 'activo', '391620361'),
('2003-10-10', 8, 'agb667', '$2a$10$uWfWlbx4sz2P8WtdbvaX3uAUsEBMXBR/oST91j4klt7X9m0Fpjq5W', 'Gutierrez', 'Ana', 'ana.gutierrez@ortoliberi.es', 'Calles', 'activo', '000000000'),
('1999-05-09', 9, 'frm527', '$2a$10$E/VijtKB5yEYdqHGTig/NOe4FSST71HAiEvL6gkbSxoUODuyCKxCO', 'Romero', 'Felix', 'felix.romero@ortoliberi.es', 'Plaza Central', 'activo', '179302649');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ausencia_trabajador`
--
ALTER TABLE `ausencia_trabajador`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKdy5139dlcfsmrg7fnjpve1i2g` (`trabajador_id`);

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKmpyrctoll1n0n688uevrh2fe5` (`trabajador_id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `codigos`
--
ALTER TABLE `codigos`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK89ge5wb6wxi952n1buo3o0etg` (`cliente_id`),
  ADD KEY `FKidldaqn2p3uv70ogvf43hp0mu` (`trabajador_id`);

--
-- Indices de la tabla `compra_productos`
--
ALTER TABLE `compra_productos`
  ADD PRIMARY KEY (`compra_id`,`productos_key`);

--
-- Indices de la tabla `documento`
--
ALTER TABLE `documento`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `fabricacion`
--
ALTER TABLE `fabricacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK4hd9jg3nobri6xly1us1xb64m` (`codigo_id`),
  ADD KEY `FK68jd7gc5bfdd0a79ofcrfwxx4` (`hijo_id`),
  ADD KEY `FKhdcurjg5irhjdi9tv4hixrqgc` (`trabajador_id`);

--
-- Indices de la tabla `fabricacion_materiales`
--
ALTER TABLE `fabricacion_materiales`
  ADD PRIMARY KEY (`fabricacion_id`,`materiales_key`);

--
-- Indices de la tabla `materiales`
--
ALTER TABLE `materiales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK9bqxsl6nx27te6x0j49fik4vj` (`proveedor_id`);

--
-- Indices de la tabla `menores`
--
ALTER TABLE `menores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKf98bv0c11dynm6kf3h5qh2aai` (`cliente_id`);

--
-- Indices de la tabla `pedidos_cliente`
--
ALTER TABLE `pedidos_cliente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKn13tjbnpkjeduaqohgddjkwv` (`cliente_id`);

--
-- Indices de la tabla `pedidos_cliente_producto`
--
ALTER TABLE `pedidos_cliente_producto`
  ADD PRIMARY KEY (`pedidos_cliente_id`,`productos_key`);

--
-- Indices de la tabla `pedidos_proveedor`
--
ALTER TABLE `pedidos_proveedor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKg02ulyy1yxmak7th9cppchws3` (`proveedor_id`);

--
-- Indices de la tabla `pedidos_proveedor_material`
--
ALTER TABLE `pedidos_proveedor_material`
  ADD PRIMARY KEY (`materiales_key`,`pedidos_proveedor_id`),
  ADD KEY `FKoiwf8ara119a0xakufcm8n3ut` (`pedidos_proveedor_id`);

--
-- Indices de la tabla `pedidos_proveedor_producto`
--
ALTER TABLE `pedidos_proveedor_producto`
  ADD PRIMARY KEY (`pedidos_proveedor_id`,`productos_key`);

--
-- Indices de la tabla `pedido_fabricacion`
--
ALTER TABLE `pedido_fabricacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKnp6qul23vnofreqqs792qvimg` (`cliente_id`),
  ADD KEY `FKnkjrqidcc72b2ibwu11bc1wl9` (`fabricacion_id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK43ij6bea3xiagmwhlt3wub8n2` (`codigos_codigo`),
  ADD KEY `FK4s80lxlx2fkci25fcx4r0nbex` (`proveedor_id`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `reciclaje`
--
ALTER TABLE `reciclaje`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK1wmtvc5plc8756683xc13fbeu` (`cliente_id`),
  ADD KEY `FKdknbe6xg1grk8qwsn2jf8yayk` (`segunda_mano_id`);

--
-- Indices de la tabla `revisiones`
--
ALTER TABLE `revisiones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UKd26udy7wxd79yb5kbhbfxkbo5` (`cita_id`),
  ADD KEY `FK246psdsl0hyfqvtlcu9awi8f8` (`hijo_id`),
  ADD KEY `FKgpvb762vyefwi4fsupu9jbu1c` (`cliente_id`);

--
-- Indices de la tabla `segunda_mano`
--
ALTER TABLE `segunda_mano`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK6577a8jc21i96j9kqtci0yebe` (`fabricacion_id`),
  ADD KEY `FKf64jhl1a8oauqo6lxurvinpiv` (`producto_id`),
  ADD KEY `FK3jnb5lx3wb37ehp52nwv59f9a` (`cliente_id`);

--
-- Indices de la tabla `solicitantes_empleo`
--
ALTER TABLE `solicitantes_empleo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `trabajadores`
--
ALTER TABLE `trabajadores`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ausencia_trabajador`
--
ALTER TABLE `ausencia_trabajador`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `documento`
--
ALTER TABLE `documento`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fabricacion`
--
ALTER TABLE `fabricacion`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `materiales`
--
ALTER TABLE `materiales`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `menores`
--
ALTER TABLE `menores`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `pedidos_cliente`
--
ALTER TABLE `pedidos_cliente`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedidos_proveedor`
--
ALTER TABLE `pedidos_proveedor`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedido_fabricacion`
--
ALTER TABLE `pedido_fabricacion`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `reciclaje`
--
ALTER TABLE `reciclaje`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `revisiones`
--
ALTER TABLE `revisiones`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `segunda_mano`
--
ALTER TABLE `segunda_mano`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `solicitantes_empleo`
--
ALTER TABLE `solicitantes_empleo`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `trabajadores`
--
ALTER TABLE `trabajadores`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ausencia_trabajador`
--
ALTER TABLE `ausencia_trabajador`
  ADD CONSTRAINT `FKdy5139dlcfsmrg7fnjpve1i2g` FOREIGN KEY (`trabajador_id`) REFERENCES `trabajadores` (`id`);

--
-- Filtros para la tabla `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `FKmpyrctoll1n0n688uevrh2fe5` FOREIGN KEY (`trabajador_id`) REFERENCES `trabajadores` (`id`);

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `FK89ge5wb6wxi952n1buo3o0etg` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `FKidldaqn2p3uv70ogvf43hp0mu` FOREIGN KEY (`trabajador_id`) REFERENCES `trabajadores` (`id`);

--
-- Filtros para la tabla `compra_productos`
--
ALTER TABLE `compra_productos`
  ADD CONSTRAINT `FKntqxxmd74hy2p765dkmhbgf5g` FOREIGN KEY (`compra_id`) REFERENCES `compras` (`id`);

--
-- Filtros para la tabla `fabricacion`
--
ALTER TABLE `fabricacion`
  ADD CONSTRAINT `FK4hd9jg3nobri6xly1us1xb64m` FOREIGN KEY (`codigo_id`) REFERENCES `codigos` (`codigo`),
  ADD CONSTRAINT `FK68jd7gc5bfdd0a79ofcrfwxx4` FOREIGN KEY (`hijo_id`) REFERENCES `menores` (`id`),
  ADD CONSTRAINT `FKhdcurjg5irhjdi9tv4hixrqgc` FOREIGN KEY (`trabajador_id`) REFERENCES `trabajadores` (`id`);

--
-- Filtros para la tabla `fabricacion_materiales`
--
ALTER TABLE `fabricacion_materiales`
  ADD CONSTRAINT `FKofq6wg5cq3mm94wxktfujn3iv` FOREIGN KEY (`fabricacion_id`) REFERENCES `fabricacion` (`id`);

--
-- Filtros para la tabla `materiales`
--
ALTER TABLE `materiales`
  ADD CONSTRAINT `FK9bqxsl6nx27te6x0j49fik4vj` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedores` (`id`);

--
-- Filtros para la tabla `menores`
--
ALTER TABLE `menores`
  ADD CONSTRAINT `FKf98bv0c11dynm6kf3h5qh2aai` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`);

--
-- Filtros para la tabla `pedidos_cliente`
--
ALTER TABLE `pedidos_cliente`
  ADD CONSTRAINT `FKn13tjbnpkjeduaqohgddjkwv` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`);

--
-- Filtros para la tabla `pedidos_cliente_producto`
--
ALTER TABLE `pedidos_cliente_producto`
  ADD CONSTRAINT `FKsrxao00ypb8l4te5jq9iw4pw1` FOREIGN KEY (`pedidos_cliente_id`) REFERENCES `pedidos_cliente` (`id`);

--
-- Filtros para la tabla `pedidos_proveedor`
--
ALTER TABLE `pedidos_proveedor`
  ADD CONSTRAINT `FKg02ulyy1yxmak7th9cppchws3` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedores` (`id`);

--
-- Filtros para la tabla `pedidos_proveedor_material`
--
ALTER TABLE `pedidos_proveedor_material`
  ADD CONSTRAINT `FKoiwf8ara119a0xakufcm8n3ut` FOREIGN KEY (`pedidos_proveedor_id`) REFERENCES `pedidos_proveedor` (`id`);

--
-- Filtros para la tabla `pedidos_proveedor_producto`
--
ALTER TABLE `pedidos_proveedor_producto`
  ADD CONSTRAINT `FK2stgyrpbqkqcj6mvhyjyfbnub` FOREIGN KEY (`pedidos_proveedor_id`) REFERENCES `pedidos_proveedor` (`id`);

--
-- Filtros para la tabla `pedido_fabricacion`
--
ALTER TABLE `pedido_fabricacion`
  ADD CONSTRAINT `FKnkjrqidcc72b2ibwu11bc1wl9` FOREIGN KEY (`fabricacion_id`) REFERENCES `fabricacion` (`id`),
  ADD CONSTRAINT `FKnp6qul23vnofreqqs792qvimg` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `FK43ij6bea3xiagmwhlt3wub8n2` FOREIGN KEY (`codigos_codigo`) REFERENCES `codigos` (`codigo`),
  ADD CONSTRAINT `FK4s80lxlx2fkci25fcx4r0nbex` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedores` (`id`);

--
-- Filtros para la tabla `reciclaje`
--
ALTER TABLE `reciclaje`
  ADD CONSTRAINT `FK1wmtvc5plc8756683xc13fbeu` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `FKdknbe6xg1grk8qwsn2jf8yayk` FOREIGN KEY (`segunda_mano_id`) REFERENCES `segunda_mano` (`id`);

--
-- Filtros para la tabla `revisiones`
--
ALTER TABLE `revisiones`
  ADD CONSTRAINT `FK246psdsl0hyfqvtlcu9awi8f8` FOREIGN KEY (`hijo_id`) REFERENCES `menores` (`id`),
  ADD CONSTRAINT `FK3t1hj8sgvbx2smrflpnfaawhp` FOREIGN KEY (`cita_id`) REFERENCES `citas` (`id`),
  ADD CONSTRAINT `FKgpvb762vyefwi4fsupu9jbu1c` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`);

--
-- Filtros para la tabla `segunda_mano`
--
ALTER TABLE `segunda_mano`
  ADD CONSTRAINT `FK3jnb5lx3wb37ehp52nwv59f9a` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `FK6577a8jc21i96j9kqtci0yebe` FOREIGN KEY (`fabricacion_id`) REFERENCES `fabricacion` (`id`),
  ADD CONSTRAINT `FKf64jhl1a8oauqo6lxurvinpiv` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
