# Solución de Problemas de Imágenes y Contenido

## 1. Diagnóstico de Imágenes (Sin Servidor)

Si no puedes ver las imágenes y no tienes un servidor PHP configurado para ejecutar el script de prueba, hemos creado una solución más sencilla.

1.  Ve a la carpeta de tu proyecto: `d:\Exposicion\`
2.  Busca el archivo **`check_images.html`**.
3.  Haz **doble clic** para abrirlo en tu navegador.

Este archivo te mostrará directamente las imágenes que están en tu carpeta `images/`.
- Si las ves aquí, las imágenes están bien y el problema es la base de datos o el caché.
- Si ves iconos rotos, significa que los archivos no están en la carpeta `images/` o tienen nombres diferentes.

## 2. Restauración de Estilos

Hemos detectado que la carpeta `css/` podría haber desaparecido o estar corrupta. La hemos restaurado automáticamente.

Si la página se ve "fea" o sin formato:
1.  Recarga la página con `Ctrl + F5`.
2.  Verifica que exista la carpeta `d:\Exposicion\css` y el archivo `styles.css` dentro.

## 3. Actualización de Base de Datos

Recuerda aplicar los scripts SQL en orden si aún no lo has hecho:
1.  `sql/update_topic2_mvc.sql` (Reestructura Tema 2)
2.  `sql/update_topic2_add_2_5.sql` (Añade tabla de costos)
