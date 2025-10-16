SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE DATABASE IF NOT EXISTS `gestion_flotilla` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `gestion_flotilla`;

DROP TABLE IF EXISTS `Propietario`;
CREATE TABLE `Propietario` (
  `idPropietario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `rfc` varchar(13) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`idPropietario`),
  UNIQUE KEY `rfc` (`rfc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `Propietario` (`idPropietario`, `nombre`, `rfc`) VALUES
(1, 'Logistica Express S.A. de C.V.', 'LEXA880101ABC'),
(2, 'Juan Pérez (Propietario Individual)', 'PEJU800510XYZ');

DROP TABLE IF EXISTS `Vehiculo`;
CREATE TABLE `Vehiculo` (
  `idVehiculo` int(11) NOT NULL AUTO_INCREMENT,
  `placa` varchar(10) NOT NULL,
  `marca` varchar(50) NOT NULL,
  `modelo` varchar(50) NOT NULL,
  `anio` int(11) NOT NULL,
  `numeroSerie` varchar(20) NOT NULL,
  `tipoVehiculo` enum('Coche','Camioneta','Camion','Moto') NOT NULL,
  `idPropietario` int(11) DEFAULT NULL,
  PRIMARY KEY (`idVehiculo`),
  UNIQUE KEY `placa` (`placa`),
  UNIQUE KEY `numeroSerie` (`numeroSerie`),
  KEY `idPropietario` (`idPropietario`),
  CONSTRAINT `vehiculo_ibfk_1` FOREIGN KEY (`idPropietario`) REFERENCES `Propietario` (`idPropietario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `Vehiculo` (`idVehiculo`, `placa`, `marca`, `modelo`, `anio`, `numeroSerie`, `tipoVehiculo`, `idPropietario`) VALUES
(1, 'A1B-2C3', 'Nissan', 'NP300', 2022, '12345ABCDE', 'Camioneta', 1),
(2, 'X4Y-5Z6', 'Kenworth', 'T680', 2021, '67890FGHIJ', 'Camion', 1),
(3, 'M7N-8P9', 'Chevrolet', 'Aveo', 2023, 'KLMNO12345', 'Coche', 2);

COMMIT;
