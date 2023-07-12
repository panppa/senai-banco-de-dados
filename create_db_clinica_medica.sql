CREATE DATABASE `clinica_medica` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
CREATE TABLE `consulta` (
  `numero_consulta` int NOT NULL AUTO_INCREMENT,
  `data_consulta` date DEFAULT NULL,
  `horario_consulta` time DEFAULT NULL,
  `fk_paciente_cpf` varchar(14) DEFAULT NULL,
  `fk_medico_crm` int DEFAULT NULL,
  PRIMARY KEY (`numero_consulta`),
  KEY `fk_paciente_cpf` (`fk_paciente_cpf`),
  KEY `fk_medico_crm` (`fk_medico_crm`),
  CONSTRAINT `consulta_ibfk_1` FOREIGN KEY (`fk_paciente_cpf`) REFERENCES `paciente` (`cpf`),
  CONSTRAINT `consulta_ibfk_2` FOREIGN KEY (`fk_medico_crm`) REFERENCES `medico` (`crm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `exame` (
  `codigo` int NOT NULL,
  `especificacao` varchar(20) DEFAULT NULL,
  `preco` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `medico` (
  `crm` int NOT NULL,
  `nome_medico` varchar(30) DEFAULT NULL,
  `especialidade` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`crm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `paciente` (
  `cpf` varchar(14) NOT NULL,
  `nome_paciente` varchar(40) DEFAULT NULL,
  `telefone` varchar(14) DEFAULT NULL,
  `numero_plano` int DEFAULT NULL,
  `nome_plano` varchar(20) DEFAULT NULL,
  `tipo_plano` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `pedido_exame` (
  `numero_pedido` int NOT NULL AUTO_INCREMENT,
  `resultado` varchar(40) DEFAULT NULL,
  `data_exame` date DEFAULT NULL,
  `valor_pagar` decimal(10,2) DEFAULT NULL,
  `fk_consulta_numero_consulta` int DEFAULT NULL,
  `fk_exame_codigo` int DEFAULT NULL,
  PRIMARY KEY (`numero_pedido`),
  KEY `fk_consulta_numero_consulta` (`fk_consulta_numero_consulta`),
  KEY `fk_exame_codigo` (`fk_exame_codigo`),
  CONSTRAINT `pedido_exame_ibfk_1` FOREIGN KEY (`fk_consulta_numero_consulta`) REFERENCES `consulta` (`numero_consulta`),
  CONSTRAINT `pedido_exame_ibfk_2` FOREIGN KEY (`fk_exame_codigo`) REFERENCES `exame` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
