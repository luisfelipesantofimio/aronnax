import 'package:aronnax/src/domain/entities/icd_data.dart';
import 'package:aronnax/src/presentation/widgets/icd_selection_widgets/subcategory_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class IcdCategoryItem extends StatefulWidget {
  const IcdCategoryItem({
    super.key,
    required this.categorySection,
    required this.onSelectedCategory,
    required this.categoryName,
  });

  final List<IcdData> categorySection;

  final String categoryName;

  final Function(IcdData data) onSelectedCategory;

  @override
  State<IcdCategoryItem> createState() => _IcdCategoryItemState();
}

class _IcdCategoryItemState extends State<IcdCategoryItem> {
  IcdData? selectedCategory;
  List<IcdData> foundItems = [];
  String query = "";

  @override
  void initState() {
    foundItems = widget.categorySection;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          decoration: InputDecoration(
              hintText:
                  "${AppLocalizations.of(context)!.icdSearchHint} ${widget.categoryName}"),
          onChanged: (value) {
            setState(() {
              query = value;
              foundItems = widget.categorySection
                  .where(
                    (element) =>
                        element.title
                            .toLowerCase()
                            .contains(query.toLowerCase()) ||
                        (element.code != null &&
                            element.code!.toLowerCase().contains(query)) ||
                        element.children.any(
                          (element1) =>
                              element1.title
                                  .toLowerCase()
                                  .contains(query.toLowerCase()) ||
                              (element1.code != null &&
                                  element1.code!.toLowerCase().contains(query)),
                        ),
                  )
                  .toList();
            });
          },
        ),
        const Padding(padding: EdgeInsets.all(10)),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: foundItems.isEmpty || query.isEmpty
                ? widget.categorySection.length
                : foundItems.length,
            itemBuilder: (context, index) {
              return SubcategoryItem(
                onSelectedCategory: (data) {
                  widget.onSelectedCategory(data);
                },
                categorySection: foundItems.isEmpty || query.isEmpty
                    ? widget.categorySection[index]
                    : foundItems[index],
              );
            },
          ),
        ),
      ],
    );
  }
}
