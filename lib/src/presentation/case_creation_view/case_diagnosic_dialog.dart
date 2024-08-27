import 'package:aronnax/src/presentation/core/methods.dart';
import 'package:aronnax/src/presentation/widgets/icd_selection_widgets/category_header.dart';
import 'package:aronnax/src/presentation/widgets/icd_selection_widgets/icd_category_item.dart';
import 'package:aronnax/src/data/providers/icd_data_provider.dart';
import 'package:aronnax/src/domain/entities/icd_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CaseDiagnosticDialog extends ConsumerStatefulWidget {
  const CaseDiagnosticDialog({
    super.key,
    required this.onSelectedCategory,
  });
  final Function(IcdData data) onSelectedCategory;

  @override
  ConsumerState<CaseDiagnosticDialog> createState() =>
      _CaseDiagnosticDialogState();
}

class _CaseDiagnosticDialogState extends ConsumerState<CaseDiagnosticDialog> {
  int selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    final diagnosticData = ref.watch(
      icdDataProvider(
        AppMethods.sanitizeCurrentLocale(),
      ),
    );

    return Dialog(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.8,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: diagnosticData.when(
            data: (data) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: IcdDiagnosticHeader(
                      categories: data,
                      onSelectedCategory: (index) {
                        setState(() {
                          selectedCategory = index;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: IcdCategoryItem(
                      categoryName: data[selectedCategory].title,
                      categorySection: data[selectedCategory].children,
                      onSelectedCategory: (data) {
                        widget.onSelectedCategory(data);
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              );
            },
            error: (error, stackTrace) => Text(error.toString()),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      ),
    );
  }
}
