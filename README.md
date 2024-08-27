![Cover](/docs/img/Cover_EN.png)

<p><a href="https://flutter.dev" target="_blank"><img alt="Made with Flutter" src="https://img.shields.io/badge/Made%20with-Flutter-blue"></a></p>

# Aronnax

EMR for psychologists, minimalistic and eficient. Made for psychologists by psychologists.

[Documentación en español](/docs/README-es.md)

Aronnax is an open-source EMR for psychologists focused on simplicity and evidence based treatments. It works 100% offline and helps you keeping your data under your control.

## Build

Make sure to use Flutter `3.24.1` with the Dart api `^3.5.1`

Aronnax uses Supabase for managing basic telemetry for understandig the use of the tool, but you can omit the environment variables defined for its initialization
in the [constants.dart](./lib/src/presentation/core/constants.dart) file.

> [!NOTE]
> Telemetry will be present until the project reaches a comprete 1.0.0 version.

### 1. Get the ICD-11 required data

I have created a little program for copying the ICD-11 data from WHO API. Go to the [ICD data fetch](https://github.com/luisfelipesantofimio/icd_data_fetch) repository and follow
the instructions to generate the required files.

Once you have the files `icd_data_en.json` and `icd_data_es.json` you can copy them to `assets/icd_data/` folder.

### 2. Generate the localization files

```bash
flutter gen-l10n
```

### 3. Compile the project

```bash
flutter build {PLATFORM} --dart-define=version={version}
```
