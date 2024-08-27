import 'package:aronnax/src/domain/entities/icd_data.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SubcategoryItem extends StatefulWidget {
  const SubcategoryItem(
      {super.key,
      required this.categorySection,
      required this.onSelectedCategory});

  final IcdData categorySection;
  final Function(IcdData data) onSelectedCategory;

  @override
  State<SubcategoryItem> createState() => _SubcategoryItemState();
}

class _SubcategoryItemState extends State<SubcategoryItem> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isExpanded
          ? null
          : () {
              if (widget.categorySection.code != null) {
                widget.onSelectedCategory(widget.categorySection);
              }
            },
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
          color: Colors.white,
        ),
        child: LayoutBuilder(builder: (context, constraints) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: constraints.maxWidth * 0.7,
                        child: Text(
                          widget.categorySection.title,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      if (widget.categorySection.browserURL != null)
                        IconButton(
                          tooltip:
                              "${AppLocalizations.of(context)!.icdOpenBrowser} ${widget.categorySection.title}",
                          onPressed: () {
                            launchUrl(
                                Uri.parse(widget.categorySection.browserURL!));
                          },
                          icon: const Icon(FontAwesomeIcons.globe),
                        ),
                    ],
                  ),
                  Text(
                    widget.categorySection.code ?? "no code",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Text(widget.categorySection.definition ?? "No definition"),
              const Padding(padding: EdgeInsets.all(10)),
              if (widget.categorySection.children.isNotEmpty)
                isExpanded
                    ? Column(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: widget.categorySection.children.length,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index2) => InkWell(
                              onTap: () {
                                widget.onSelectedCategory(
                                    widget.categorySection.children[index2]);
                              },
                              child: Column(
                                children: [
                                  const Padding(padding: EdgeInsets.all(10)),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: constraints.maxWidth * 0.7,
                                            child: Text(
                                              "${index2 + 1}. ${widget.categorySection.children[index2].title}",
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          if (widget
                                                  .categorySection
                                                  .children[index2]
                                                  .browserURL !=
                                              null)
                                            IconButton(
                                              tooltip:
                                                  "${AppLocalizations.of(context)!.icdOpenBrowser} ${widget.categorySection.children[index2].title}",
                                              onPressed: () {
                                                launchUrl(Uri.parse(widget
                                                    .categorySection
                                                    .children[index2]
                                                    .browserURL!));
                                              },
                                              icon: const Icon(
                                                  FontAwesomeIcons.globe),
                                            ),
                                        ],
                                      ),
                                      Text(widget.categorySection
                                              .children[index2].code ??
                                          "no code"),
                                    ],
                                  ),
                                  Text(widget.categorySection.children[index2]
                                          .definition ??
                                      "No definition"),
                                  const Divider(
                                    thickness: 1,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                isExpanded = !isExpanded;
                              });
                            },
                            icon: const Icon(Icons.arrow_upward),
                          ),
                        ],
                      )
                    : Center(
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              isExpanded = !isExpanded;
                            });
                          },
                          icon: const Icon(Icons.arrow_downward),
                        ),
                      ),
            ],
          );
        }),
      ),
    );
  }
}
