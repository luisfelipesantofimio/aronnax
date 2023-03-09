import 'dart:developer';

import 'package:aronnax/src/domain/entities/tratment_plan_entities/treatment_plan_component.dart';
import 'package:aronnax/src/presentation/treatment_plans/treatment_plan_creation/treatment_plan_metadata_form.dart';
import 'package:aronnax/src/presentation/widgets/component_selection/component_selection_item.dart';
import 'package:aronnax/src/presentation/widgets/generic_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TreatmentPlanCreationView extends ConsumerStatefulWidget {
  const TreatmentPlanCreationView({Key? key}) : super(key: key);

  @override
  ConsumerState<TreatmentPlanCreationView> createState() =>
      _TreatmentPlanCreationViewState();
}

class _TreatmentPlanCreationViewState
    extends ConsumerState<TreatmentPlanCreationView> {
  bool componentSelectionItemSelected = false;
  List<TreatmentPlanComponent> dataToEncode = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            child: Stack(
              children: [
                Column(),
                Align(
                  alignment: Alignment.bottomRight,
                  child: GenericIconButon(
                    icon: Icons.add,
                    title: 'New component',
                    onTap: () {
                      setState(() {
                        componentSelectionItemSelected = true;
                      });
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Visibility(
                    visible: componentSelectionItemSelected,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Stack(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.8,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  componentSelectionItemSelected = false;
                                });
                              },
                            ),
                          ),
                          ComponentSelectionItem(
                            onComponentSelected: (component) {},
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(255, 104, 104, 104),
                    offset: Offset(3, 0),
                    blurRadius: 6)
              ],
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TreatmentPlanMetadataForm(),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
