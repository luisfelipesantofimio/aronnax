![Cover](/docs/img/Cover_ES.png)

<p><a href="https://flutter.dev" target="_blank"><img alt="Hecho con Flutter" src="https://img.shields.io/badge/Made%20with-Flutter-blue"></a></p>

# Aronnax

Un software de gestion de historias clínicas para psicólogos, minimalista y eficiente. Hecho para psicólogos por psicólogos.

[English documentation](README.md)

Aronnax es un EMR (electronic medical record) de código abierto para psicólogos enfocado en la simplicidad y tratamientos basados en evidencia. Funciona 100% offline y te ayuda a mantener tus datos bajo tu control.

## Compilación

Asegúrate de usar Flutter `3.24.1` con la API de Dart `^3.5.1`

Aronnax usa Supabase para gestionar telemetría básica para entender el uso de la herramienta, pero puedes omitir las variables de entorno definidas para su inicialización en el archivo [constants.dart](./lib/src/presentation/core/constants.dart).

> [!NOTE]
> La telemetría estará presente hasta que el proyecto alcance la versión completa 1.0.0.

### 1. Obtén la información base del CIE-11

He creado un programa para copiar los datos ICD-11 del API WHO. Ve al repositorio [ICD data fetch](https://github.com/luisfelipesantofimio/icd_data_fetch) y sigue las instrucciones
para generar los archivos requeridos.

Una vez que tengas los archivos `icd_data_en.json` y `icd_data_es.json` puedes copiarlos a la carpeta `assets/icd_data/`.

### 2. Genera las traducciones

```bash
flutter gen-l10n
```

### 3. Compila el proyecto

```bash
flutter build {PLATFORM} --dart-define=version={version}
```
