import 'package:aronnax/src/domain/entities/tratment_plan_entities/section.dart';
import 'package:aronnax/src/presentation/widgets/generic_minimal_button.dart';
import 'package:flutter/material.dart';

class SectionMetadataDialog extends StatefulWidget {
  const SectionMetadataDialog({
    Key? key,
    required this.onSelectedMetadata,
    this.sectionData,
  }) : super(key: key);
  final Function(String title, String description) onSelectedMetadata;
  final Section? sectionData;

  @override
  State<SectionMetadataDialog> createState() => _SectionMetadataDialogState();
}

class _SectionMetadataDialogState extends State<SectionMetadataDialog> {
  String? title;
  String? description;

  @override
  void initState() {
    if (widget.sectionData != null) {
      setState(() {
        title = widget.sectionData!.name;
        description == widget.sectionData!.description;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.4,
        width: MediaQuery.of(context).size.width * 0.4,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Section title'),
              TextFormField(
                initialValue: widget.sectionData != null
                    ? widget.sectionData!.name
                    : null,
                decoration: const InputDecoration(
                    hintText: 'Title or heading for this section'),
                onChanged: (value) {
                  setState(() {
                    title = value;
                  });
                },
              ),
              const Padding(
                padding: EdgeInsets.all(10),
              ),
              const Text('Section description'),
              TextFormField(
                initialValue: widget.sectionData != null
                    ? widget.sectionData!.description
                    : null,
                decoration: const InputDecoration(
                    hintText: 'Short description for this section'),
                onChanged: (value) {
                  setState(() {
                    description = value;
                  });
                },
              ),
              const Padding(
                padding: EdgeInsets.all(10),
              ),
              GenericMinimalButton(
                title: 'Done',
                onTap: () {
                  widget.onSelectedMetadata(title ?? '', description ?? '');
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
