![Cover](/docs/img/Cover_EN.png)

<p><a href="https://flutter.dev" target="_blank"><img alt="Made with Flutter" src="https://img.shields.io/badge/Made%20with-Flutter-blue"></a></p>

# Aronnax
A minimalist patients and clinic history management software for psychologists powered by Flutter.

Made for psychologists by psychologists.

[Documentación en español](/docs/README-es.md)

## Index
1. [Requirements](#requirements)
2. [The easiest way](#the-easiest-way-for-most-people)
3. [Upcoming feautures](#upcoming-features)

## First steps

To initialize the project, ``git clone`` this repository, ``cd`` to the created directory and run the following commands ``flutter run``

## Requirements

Aronnax depends on a SQL database for the correct management and safety of the information.

If you use a remote hosting, you can skip the installation process, and just work on the configuration of the target database. 

- If you want to use Aronnax on your local machine, follow the steps in the documentation of your choosen database between  <a href="https://dev.mysql.com/doc/mysql-getting-started/en/" target="_blank">MySQL</a> or <a href="https://mariadb.com/kb/en/installing-mariadb-msi-packages-on-windows/" target="_blank">MariaDB</a>.

- [Flutter SDK](https://docs.flutter.dev/get-started/install) for building the app for your system.


- Optional: [PhpMyAdmin](https://docs.phpmyadmin.net/en/latest/setup.html) for graphic management of your database.

## The easiest way for most people

A better way of configuring your own database on your local machine is to download  <a href="https://www.apachefriends.org/download.html" target="_blank">XAMPP</a>. It will setup a local server with MySQL and PhpMyAdmin included. You can access it throw ``localhost`` while you configure Aronnax.

Also, you can download a prebuilt version of Aronnax for Windows and Linux (comming soon for MacOS) if you want to avoid the build process.

## Upcoming features

Aronnax is in current development and growing in features to improve the consultation experience. These are some of the features in plans for development.

- Print clinic history to PDF
- Implement some screening tests for doing during consultation
- Complete translation to english
- Local preconfigured database for professionals who are groing to work by their own and don't requiere an external database.


<p align="center">Made with &hearts; in <a href="https://crearteconsciencia.co">Crearte Consciencia</a></p>