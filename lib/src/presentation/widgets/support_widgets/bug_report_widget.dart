import 'package:aronnax/src/data/interfaces/telemetry.dart';
import 'package:aronnax/src/presentation/widgets/generic_minimal_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BugReportWidget extends ConsumerStatefulWidget {
  const BugReportWidget({super.key});

  @override
  ConsumerState<BugReportWidget> createState() => _BugReportWidgetState();
}

class _BugReportWidgetState extends ConsumerState<BugReportWidget> {
  final _formKey = GlobalKey<FormState>();
  String? errorReport;
  bool reportSent = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: reportSent
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(AppLocalizations.of(context)!.supportReportErrorSent,
                      style: Theme.of(context).textTheme.titleLarge),
                  const Padding(padding: EdgeInsets.all(10)),
                  Text(
                    AppLocalizations.of(context)!
                        .supportReportErrorAknowledgement,
                  ),
                  const Padding(padding: EdgeInsets.all(10)),
                  const Icon(
                    FontAwesomeIcons.bugSlash,
                  )
                ],
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppLocalizations.of(context)!.supportReportTitle,
                    style: Theme.of(context).textTheme.titleLarge),
                const Padding(padding: EdgeInsets.all(10)),
                Text(
                  AppLocalizations.of(context)!.supportReportErrorDescription,
                ),
                const Padding(padding: EdgeInsets.all(10)),
                TextFormField(
                  decoration: InputDecoration(
                      hintText:
                          AppLocalizations.of(context)!.supportReportErrorHint),
                  maxLines: 5,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppLocalizations.of(context)!.errorEmptyField;
                    }
                    return null;
                  },
                  onChanged: (value) => setState(() {
                    errorReport = value;
                  }),
                ),
                const Padding(padding: EdgeInsets.all(10)),
                GenericMinimalButton(
                    title: AppLocalizations.of(context)!.genericSend,
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        ref
                            .read(telemetryRepositoryProvider)
                            .sendErrorReport(errorReport ?? "")
                            .then(
                              (value) => setState(() {
                                reportSent = true;
                              }),
                            )
                            .onError((error, stackTrace) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.red,
                              content: Text(
                                AppLocalizations.of(context)!
                                    .genericErrorMessage,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          );
                        });
                      }
                    })
              ],
            ),
    );
  }
}
