![Cover](/docs/img/Cover_ES.png)

<p><a href="https://flutter.dev" target="_blank"><img alt="Hecho con Flutter" src="https://img.shields.io/badge/Hecho%20con-Flutter-blue"></a></p>

# Aronnax

Un software de gestión de pacientes e historias clínicas, minimalista y eficiente, desarrollado con Flutter.

Hecho por psicólogos, para psicólogos.

[English documentation](/README.md)

## Índice
1. [Requerimientos](#requerimientos)
2. [La forma sencilla](#la-forma-más-sencilla-para-muchos)
3. [Futuras características](#futuras-características)

## Primeros pasos

Para inicializar el proyecto, ``git clone`` este repositorio, ``cd`` al directorio creado y ejecuta el siguiente comando: ``flutter run``

## Requerimientos
Aronnax depende de una base de datos SQL para el correcto almacenamiento y seguridad de la información.

Si utilizas un hosting remoto, puedes saltarte el proceso de instalación e ir directo a la configuración de la base de datos.

- Si quieres usar la base de datos en tu equipo, puedes seguir los pasos en la documentación de la base de datos que elijas entre <a href="https://dev.mysql.com/doc/mysql-getting-started/en/" target="_blank">MySQL</a> o <a href="https://mariadb.com/kb/en/installing-mariadb-msi-packages-on-windows/" target="_blank">MariaDB</a>.

- [Flutter SDK](https://docs.flutter.dev/get-started/install) para compilar la app en tu sistema.


- Opcional: [PhpMyAdmin](https://docs.phpmyadmin.net/en/latest/setup.html) para manipular la base de datos de forma gráfica.

## La forma más sencilla para muchos

Una mejor forma de configurar la base de datos en tu equipo es descargar <a href="https://www.apachefriends.org/download.html" target="_blank">XAMPP</a>. Este configurará un servidor local con MySQL y PhpMyAdmin incluidos. Puedes acceder a la base de datos a través de ``localhost`` al configurar Aronnax.

También puedes descargar una versión precompilada de Aronnax para Windows y Linux (pronto para MacOS), si quieres evitar el proceso de compilar el software por tu cuenta.

## Futuras características

Aronnax se encuentra en constante desarrollo y aumentando sus características para mejorar la experiencia del profesional en consulta. Estas son algunas de las características que se planean incorporar.

- Imprimir historias clínicas en PDF
- Implementar test de tamizaje para aplicar durante las consultas
- Traducir completamente al inglés
- Base de datos local preconfigurada para profesionales que trabajen por su cuenta y no requieran una base de datos externa.