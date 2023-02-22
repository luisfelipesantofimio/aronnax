import 'package:aronnax/src/presentation/widgets/note_creation_dialog.dart';
import 'package:aronnax/src/presentation/session_creation_view/session_form.dart';
import 'package:aronnax/src/Pages/Formulary/widgets/consultant_selection_dialog.dart';
import 'package:aronnax/src/presentation/core/controllers.dart';
import 'package:aronnax/src/presentation/session_creation_view/session_information_view.dart';
import 'package:aronnax/src/presentation/widgets/generic_global_button.dart';
import 'package:aronnax/src/presentation/widgets/generic_icon_button.dart';
import 'package:aronnax/src/presentation/widgets/session_performance_dialog/session_performance_dialog.dart';
import 'package:aronnax/src/presentation/widgets/todo_creation_dialog/todos_creation_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SessionFormView extends ConsumerWidget {
  const SessionFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 166, 211, 227),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: const SessionInformationView(),
                ),
                SizedBox(
                  height: 120,
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: Row(
                    children: [
                      GenericIconButon(
                        icon: FontAwesomeIcons.noteSticky,
                        title: 'Añadir nota',
                        onTap: () => showDialog(
                          context: context,
                          builder: (context) => const NoteCreationDialog(),
                        ),
                      ),
                      GenericIconButon(
                        icon: FontAwesomeIcons.squareCheck,
                        title: 'Añadir tarea',
                        onTap: () => showDialog(
                          context: context,
                          builder: (context) => const TodosCreationDialog(),
                        ),
                      ),
                      GenericIconButon(
                        icon: FontAwesomeIcons.microscope,
                        title: 'Iniciar prueba',
                        onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Colors.green,
                            content: Text('Muy pronto!'),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Nueva sesión",
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width * 0.75,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          15,
                        ),
                      ),
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.7,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 20,
                                top: 20,
                              ),
                              child: SessionsForm(
                                patientID: ref
                                    .watch(globalSelectedConsultantIDProvider)
                                    .toString(),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.arrow_back),
                                tooltip: "Volver",
                              ),
                              const Padding(padding: EdgeInsets.all(10)),
                              GenericGlobalButton(
                                height: 40,
                                width: 200,
                                title: 'Guardar sesión',
                                onPressed: () {
                                  if (sessionFormKey.currentState!.validate()) {
                                    showDialog(
                                      context: context,
                                      builder: (context) =>
                                          const SessionPerformanceDialog(),
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
