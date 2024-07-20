import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:aronnax/src/domain/entities/tratment_plan_entities/treatment_plan.dart';
import 'package:flutter/material.dart';

class TreatmentPlanMetadataForm extends StatefulWidget {
  const TreatmentPlanMetadataForm(
      {super.key,
      required this.onTitleChanged,
      required this.onDescriptionChanged,
      this.treatmentPlanData});
  final TreatmentPlan? treatmentPlanData;
  final Function(String data) onTitleChanged;
  final Function(String data) onDescriptionChanged;

  @override
  State<TreatmentPlanMetadataForm> createState() =>
      _TreatmentPlanMetadataFormState();
}

class _TreatmentPlanMetadataFormState extends State<TreatmentPlanMetadataForm> {
  final treatmentPlanMetadataFormKey = GlobalKey<FormState>();

  String titleValue = '';
  String description =
      "Lorem ipsum dolor sit amet, qui minim labore adipisicing minim sint cillum sint consectetur cupidatat.";

  @override
  void didChangeDependencies() {
    if (widget.treatmentPlanData != null) {
      setState(() {
        titleValue = AppLocalizations.of(context)!.treatmentPlansTemplateTile;
        titleValue = widget.treatmentPlanData!.title;
        description = widget.treatmentPlanData!.description;
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            initialValue: titleValue,
            decoration: InputDecoration(
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              hintText: AppLocalizations.of(context)!.genericTitleYourTitle,
            ),
            style: const TextStyle(fontSize: 30),
            validator: (value) {
              if (value!.isEmpty) {
                return AppLocalizations.of(context)!.errorEmptyField;
              }
              return null;
            },
            onChanged: (value) {
              widget.onTitleChanged(value);
              treatmentPlanMetadataFormKey.currentState?.validate();
            },
          ),
          TextFormField(
            maxLines: 5,
            initialValue: description,
            decoration: InputDecoration(
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              hintText: AppLocalizations.of(context)!
                  .treatmentPlanMetadataDescriptionHint,
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return AppLocalizations.of(context)!.errorEmptyField;
              }
              return null;
            },
            onChanged: (value) {
              widget.onDescriptionChanged(value);
              treatmentPlanMetadataFormKey.currentState?.validate();
            },
          ),
        ],
      ),
    );
  }
}
