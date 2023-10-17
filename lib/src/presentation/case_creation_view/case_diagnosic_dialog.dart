import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:aronnax/src/data/providers/icd_data_provider.dart';
import 'package:aronnax/src/domain/entities/icd_data.dart';
import 'package:aronnax/src/presentation/icd_view/icd_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CaseDiagnosticDialog extends ConsumerStatefulWidget {
  const CaseDiagnosticDialog({
    Key? key,
    required this.onSelectedCategory,
  }) : super(key: key);
  final Function(IcdDataCategory data) onSelectedCategory;

  @override
  ConsumerState<CaseDiagnosticDialog> createState() =>
      _CaseDiagnosticDialogState();
}

class _CaseDiagnosticDialogState extends ConsumerState<CaseDiagnosticDialog> {
  String query = '';

  @override
  void initState() {
    Future(
      () => ref.invalidate(icdDiagnosticCategoriesListProvider),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final diagnosticData = ref.watch(icdDiagnosticCategoriesListProvider);
    return Dialog(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.8,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: diagnosticData.when(
            data: (data) {
              List<IcdDataCategory> filteredList = data
                  .where(
                    (element) =>
                        element.title
                            .toLowerCase()
                            .contains(query.toLowerCase()) ||
                        element.code.toLowerCase().contains(query),
                  )
                  .toList();
              return data.isEmpty
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppLocalizations.of(context)!
                              .caseDiagnosticIcdDataEmpty,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(10),
                        ),
                        const Icon(
                          FontAwesomeIcons.fileCircleQuestion,
                          size: 40,
                        ),
                        const Padding(
                          padding: EdgeInsets.all(10),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Text(AppLocalizations.of(context)!
                              .caseDiagnosticIcdDescription),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const IcdView(
                                  isConfigured: true,
                                ),
                              ),
                            );
                          },
                          child: Text(
                            AppLocalizations.of(context)!.continueButton,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    )
                  : LayoutBuilder(
                      builder: (context, constrains) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextField(
                              onChanged: (value) {
                                setState(() {
                                  query = value;
                                });
                              },
                              decoration: InputDecoration(
                                  hintText: AppLocalizations.of(context)!
                                      .caseDiagnosticSearchTerm),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(10),
                            ),
                            SizedBox(
                              height: constrains.maxHeight * 0.8,
                              width: constrains.maxWidth * 0.8,
                              child: ListView.builder(
                                padding: const EdgeInsets.all(0),
                                itemCount: filteredList.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) => InkWell(
                                  onTap: () {
                                    widget.onSelectedCategory(
                                      filteredList[index],
                                    );

                                    Navigator.pop(context);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      margin: const EdgeInsets.only(bottom: 10),
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Color.fromARGB(
                                                  255, 184, 184, 184),
                                              offset: Offset(2, 3),
                                              blurRadius: 6),
                                        ],
                                        color: Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width:
                                                      constrains.maxWidth * 0.3,
                                                  child: Text(
                                                    filteredList[index].title,
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width:
                                                      constrains.maxWidth * 0.3,
                                                  child: Text(
                                                    filteredList[index]
                                                        .groupName,
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                Text(filteredList[index].code),
                                              ],
                                            ),
                                            SizedBox(
                                              width: constrains.maxWidth * 0.4,
                                              child: Text(filteredList[index]
                                                      .definition ??
                                                  AppLocalizations.of(context)!
                                                      .caseDiagnosticTermNotFound),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        );
                      },
                    );
            },
            error: (error, stackTrace) =>
                Text(AppLocalizations.of(context)!.genericErrorMessage),
            loading: () => const CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
