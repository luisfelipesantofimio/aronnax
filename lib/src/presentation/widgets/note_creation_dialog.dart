import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:aronnax/src/data/providers/forms_providers/session_form_provider.dart';
import 'package:aronnax/src/presentation/session_creation_view/note_creation/note_creation_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NoteCreationDialog extends ConsumerStatefulWidget {
  const NoteCreationDialog({super.key});

  @override
  ConsumerState<NoteCreationDialog> createState() => _NoteCreationDialogState();
}

class _NoteCreationDialogState extends ConsumerState<NoteCreationDialog> {
  String? noteContent;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      alignment: Alignment.bottomLeft,
      backgroundColor: const Color.fromRGBO(235, 204, 145, 1),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.35,
        width: MediaQuery.of(context).size.width * 0.4,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    AppLocalizations.of(context)!.sessionNewNoteDialogTitle,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(10),
              ),
              TextFormField(
                initialValue: ref.read(sessionNotesProvider) ?? '',
                maxLines: 5,
                decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 111, 94, 63),
                      ),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 193, 165, 114),
                      ),
                    ),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 111, 94, 63),
                      ),
                    ),
                    hintText: AppLocalizations.of(context)!
                        .sessionNewNoteDialogHintText),
                onChanged: (value) => setState(() {
                  noteContent = value;
                }),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
              ),
              Row(
                children: [
                  NoteCreationActionButton(
                    title: AppLocalizations.of(context)!
                        .sessionNewNoteDialogSaveTitle,
                    icon: FontAwesomeIcons.pen,
                    onTap: () {
                      ref
                          .read(sessionNotesProvider.notifier)
                          .update((state) => noteContent);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(AppLocalizations.of(context)!
                              .sessionNewNoteDialogSaveConfirmation),
                        ),
                      );
                      Navigator.pop(context);
                    },
                  ),
                  Visibility(
                    visible: ref.read(sessionNotesProvider) != null,
                    child: NoteCreationActionButton(
                      icon: FontAwesomeIcons.eraser,
                      title: AppLocalizations.of(context)!
                          .sessionNewNoteDialogDeleteNote,
                      onTap: () {
                        ref
                            .read(sessionNotesProvider.notifier)
                            .update((state) => null);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(AppLocalizations.of(context)!
                                .sessionNewNoteDialogDeleteNoteConfirmation),
                          ),
                        );
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
