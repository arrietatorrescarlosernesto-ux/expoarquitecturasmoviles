-- Create Database (Optional, depending on server setup)
CREATE DATABASE IF NOT EXISTS mobile_architectures;
USE mobile_architectures;

-- Clean up existing tables to avoid duplication errors on re-import
DROP TABLE IF EXISTS `subtemas`;
DROP TABLE IF EXISTS `temas`;

-- Table structure for table `temas`
CREATE TABLE `temas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) NOT NULL,
  `descripcion` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table structure for table `subtemas`
CREATE TABLE `subtemas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tema_id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `contenido` text NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`tema_id`) REFERENCES `temas`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table `temas`
INSERT INTO `temas` (`id`, `titulo`, `descripcion`) VALUES
(1, 'Introducción a las arquitecturas móviles', 'Conceptos básicos y objetivos de la arquitectura en el desarrollo móvil.'),
(2, 'Arquitectura MVC (Model–View–Controller)', 'El patrón clásico que separa la aplicación en tres componentes principales.'),
(3, 'Arquitectura MVP (Model–View–Presenter)', 'Una evolución de MVC que busca desacoplar la vista del modelo a través de un presentador.'),
(4, 'Arquitectura MVVM (Model–View–ViewModel)', 'Facilita la separación del desarrollo de la interfaz gráfica del desarrollo de la lógica de negocio.'),
(5, 'Arquitectura MVI (Model–View–Intent)', 'Un patrón reactivo y unidireccional inspirado en Cycle.js y Redux.'),
(6, 'Clean Architecture en aplicaciones móviles', 'Arquitectura propuesta por Uncle Bob para crear sistemas independientes de frameworks y UI.'),
(7, 'Arquitectura en capas (Layered Architecture)', 'Organización del código en capas lógicas como presentación, dominio y datos.'),
(8, 'Comparación de arquitecturas móviles', 'Análisis comparativo de los diferentes patrones arquitectónicos.');

-- Dumping data for table `subtemas`
-- Tema 1: Introducción
INSERT INTO `subtemas` (`tema_id`, `titulo`, `contenido`) VALUES
(1, '1.1 Arquitectura de software en aplicaciones móviles', '<p>Define qué es una arquitectura móvil y cuál es su función dentro del desarrollo de aplicaciones, estableciendo la base conceptual sobre la que se construyen los distintos tipos de arquitecturas analizadas posteriormente.</p><p>Se describe la arquitectura móvil como la estructura organizativa del software de una aplicación móvil, donde se definen los componentes principales y la forma en que interactúan entre sí.</p>'),
(1, '1.2 Objetivos de una arquitectura móvil', '<p>Explica los objetivos fundamentales de una arquitectura móvil, tales como mejorar la organización del código, facilitar el mantenimiento, permitir la escalabilidad de la aplicación y asegurar una correcta separación de responsabilidades entre componentes.</p>');

-- Tema 2: MVC
INSERT INTO `subtemas` (`tema_id`, `titulo`, `contenido`) VALUES
(2, '2.1 Arquitectura MVC: Concepto y Componentes Principales', '<p>Se define MVC como una arquitectura que divide la aplicación en tres componentes principales: modelo, vista y controlador, con el objetivo de separar la lógica de negocio de la interfaz de usuario.</p><p>Se explica el rol específico de cada componente: el modelo gestiona los datos y la lógica, la vista se encarga de la interfaz de usuario y el controlador actúa como intermediario entre ambos.</p>'),
(2, '2.2 Dinámica de Funcionamiento e Implementación de MVC en Entornos Móviles', '<p>Este subtema describe cómo fluye la información entre el modelo, la vista y el controlador, destacando la manera en que las acciones del usuario desencadenan cambios en el sistema.</p><p>Se analiza cómo se implementa MVC en aplicaciones móviles y las particularidades que presenta en plataformas como Android e iOS, donde algunos componentes pueden combinar responsabilidades.</p>'),
(2, '2.3 Ventajas y desventajas', '<p>Se exponen los beneficios de utilizar MVC, como su simplicidad conceptual, facilidad de aprendizaje y rápida implementación en proyectos pequeños o medianos.</p><p>Se describen las limitaciones de MVC, especialmente en aplicaciones móviles complejas, donde puede surgir un acoplamiento excesivo entre la vista y el controlador.</p>');
