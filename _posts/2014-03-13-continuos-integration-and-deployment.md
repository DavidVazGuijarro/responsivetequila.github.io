---
layout: post
title:  "Continuos Integration y Continuous deployment para HTML, CSS y Javascript"
date:   2014-03-13 16:39:39
categories: Continuos-Integration Continuous-Deployment
---

Uno de los problemas cuando se trabaja en un proyecto de desarrollo de front end es primero, asegurar que el código que es intercambiado en el repositorio cumple con un estándar de codificación, luego, que estos pasen pruebas de unidad que ayuden a llegar a cierto nivel de calidad.

"Continuos Integration es una práctica de desarrollo de software en la que un equipo integra su trabajo frecuentemente, usualmente una vez por día por persona, llevando a multiples integraciones por día. Cada integración es verificada y automatizada (incluyendo el test) para detectar errores rápidamente."


Por esto, como proyecto integrador para la materia de Validación y Verificación de Sotware creamos un script que se encarga de la automatización de estas tareas. Los puntos a tratar fueron los siguientes:

- Verificar que el CSS es válido
- Verificar que el JS es válido
- Minificar el CSS
- Minificar el JS
- Verificar que el HTML es válido
- Ver que selectores de CSS no son utilizados
- Verificar que la calificación del sitio sea mayor que 80 por ciento en PageSpeed
- Hacer el deploy en algún servidor
- Hacer pruebas de integración en varios browsers

El primer paso fue buscar que herramienta nos permite hacer la integración continua y build de un proyecto, para esto viene Travis CI, Travis es una herramienta de código abierto para la integración continua de proyectos que soporta varios lenguajes, en nuestro caso utilizamos Ruby, Travis se encarga de instalar las dependencias que necesitaremos, sólo hay que especificarlas en un archivo Gemfile o instalarlas via apt-get.

El flujo de trabajo es el siguiente: Primero clonamos el repositorio en la rama master en la carpeta _site, en la cual va a ser generado con Jekyll, luego ejecutamos las pruebas unitarias, las cuales son automáticas, buscamos todos los archivos CSS en una carpeta, cada uno de estos genera al vuelo un método para Unit Testing, lo mismo para los archivos de JavaScript, estos dos están en una sola tarea de rake, luego minificamos (eliminamos espacios no necesarios y comentarios) estos mismos archivos, suponiendo que pasó la prueba anterior.

Luego, generamos el sitio y empezamos a validar el HTML, en este caso, luego de pasar estas pruebas le hacemos el deploy a github-pages, esto para poder hacer las pruebas de PageSpeed y Selenium con Sauce Labs, el cual es un proovedor de estos servicios con integración a Travis CI.

Los problemas que encontramos son principalmente de la documentación de las API's, sobre todo de Sauce Labs, por que al parecer la cambiaron hace poco y la documentación para Ruby no está muy clara, y por esto no pudimos hacer completa la integración con Travis.

Lo que sigue a continuación es:
- Completar la integración con Travis
- Optimizar Imágenes
- Habiliar gzip
- Exportar los reportes a HTML y subirlos al repositorio
- Automatizar las pruebas para Selenium
- Diseñar pruebas para diseño responsivo
- Crear un area de staging con un servidor privado y correr las pruebas de PageSpeed y Sauce Labs desde ahí