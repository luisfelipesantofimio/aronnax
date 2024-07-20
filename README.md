![Cover](/docs/img/Cover_EN.png)

<p><a href="https://flutter.dev" target="_blank"><img alt="Made with Flutter" src="https://img.shields.io/badge/Made%20with-Flutter-blue"></a></p>

# Aronnax

EMR for psychologists, minimalistic and eficient. Made for psychologists by psychologists.

[Documentación en español](/docs/README-es.md)

Aronnax is an open-source EMR for psychologists focused on simplicity and evidence based treatments. It works 100% offline and helps you keeping your data under your control.

## Build

Make sure to use Flutter `3.22.3` with the Dart api `'>=3.4.4 <4.0.0'`

Aronnax uses Supabase for managing basic telemetry for understandig the use of the tool, but you can omit the environment variables defined for its initialization
in the [constants.dart](./lib/src/presentation/core/constants.dart) file.

> [!NOTE]
> Telemetry will be present until the project reaches a comprete 1.0.0 version.

If you want to get a local copy of the ICD-11 for supporting your diagnostic impressions, you will need to create an account on [WHO ICD api platform](https://icd.who.int/icdapi/Account/Register) to get your **clientId** and **clientSecret**.

Finally, run:

```bash
flutter build {PLATFORM} --dart-define=clientId={clientId} --dart-define=clientSecret={clientSecret} --dart-define=version={version}
```
