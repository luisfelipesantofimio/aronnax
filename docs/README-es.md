![Cover](/docs/img/Cover_ES.png)

<p><a href="https://flutter.dev" target="_blank"><img alt="Hecho con Flutter" src="https://img.shields.io/badge/Made%20with-Flutter-blue"></a></p>

# Aronnax

Un software de gestion de historias clínicas para psicólogos, minimalista y eficiente. Hecho para psicólogos por psicólogos.

[English documentation](README.md)

Aronnax es un EMR (electronic medical record) de código abierto para psicólogos enfocado en la simplicidad y tratamientos basados en evidencia. Funciona 100% offline y te ayuda a mantener tus datos bajo tu control.

## Compilación

Asegúrate de usar Flutter `3.22.3` con la API de Dart `'>=3.4.4 <4.0.0'`

Aronnax usa Supabase para gestionar telemetría básica para entender el uso de la herramienta, pero puedes omitir las variables de entorno definidas para su inicialización en el archivo [constants.dart](./lib/src/presentation/core/constants.dart).

> [!NOTE]
> La telemetría estará presente hasta que el proyecto alcance la versión completa 1.0.0.

Si deseas obtener una copia local del CIE-11 para apoyar tus impresiones diagnósticas, necesitarás crear una cuenta en [plataforma de API de la OMS](https://icd.who.int/icdapi/Account/Register) para obtener tu **clientId** y **clientSecret**.

Finalmente, ejecuta:

```bash
flutter build {PLATFORM} --dart-define=clientId={clientId} --dart-define=clientSecret={clientSecret} --dart-define=version={version}
```
