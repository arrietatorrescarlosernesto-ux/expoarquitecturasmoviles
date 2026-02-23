
SET NAMES utf8mb4;
CREATE DATABASE IF NOT EXISTS mobile_architectures CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE mobile_architectures;

-- Clean up existing tables
DROP TABLE IF EXISTS `quiz_questions`;
DROP TABLE IF EXISTS `subtemas`;
DROP TABLE IF EXISTS `temas`;

-- Table structure for table `temas`
CREATE TABLE `temas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) NOT NULL,
  `descripcion` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table structure for table `subtemas`
CREATE TABLE `subtemas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tema_id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `contenido` text NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`tema_id`) REFERENCES `temas`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table for Quiz Questions
CREATE TABLE `quiz_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_text` text NOT NULL,
  `option_a` varchar(255) NOT NULL,
  `option_b` varchar(255) NOT NULL,
  `option_c` varchar(255) NOT NULL,
  `option_d` varchar(255) NOT NULL,
  `correct_option` char(1) NOT NULL,
  `explanation` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table `temas`
INSERT INTO `temas` (`id`, `titulo`, `descripcion`) VALUES
(1, 'Introducción a las arquitecturas móviles', 'Conceptos básicos y objetivos de la arquitectura en el desarrollo móvil.'),
(2, 'Arquitectura MVC (Model–View–Controller)', 'El patrón clásico que separa la aplicación en tres componentes principales.'),
(3, 'Arquitectura MVP (Model–View–Presenter)', 'Una evolución de MVC que busca desacoplar la vista del modelo a través de un presentador.'),
(4, 'Arquitectura MVVM (Model–View–ViewModel)', 'Facilita la separación del desarrollo de la interfaz gráfica del desarrollo de la lógica de negocio.'),
(5, 'Arquitectura MVI (Model–View–Intent)', 'Un patrón reactivo y unidireccional inspirado en Cycle.js y Redux.'),
(6, 'Clean Architecture en aplicaciones móviles', 'Arquitectura propuesta por Uncle Bob para crear sistemas independientes de frameworks y UI.'),
(7, 'Arquitectura en capas (Layered Architecture)', 'Organización del código en capas lógicas como presentación, dominio y datos.'),
(8, 'Comparación de arquitecturas móviles', 'Análisis comparativo de los diferentes patrones arquitectónicos.'),
(9, 'Evaluación de Conocimientos', 'Cuestionario interactivo para poner a prueba lo aprendido sobre arquitecturas móviles.');
