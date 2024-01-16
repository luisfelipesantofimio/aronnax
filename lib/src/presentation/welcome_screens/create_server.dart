import 'package:aronnax/src/data/database/local_model/local_model.dart';
import 'package:aronnax/src/data/interfaces/local_database_interface.dart';
import 'package:aronnax/src/presentation/welcome_screens/Forms/server_create.dart';
import 'package:aronnax/src/presentation/login/login_main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class ServerCreate extends ConsumerWidget {
  const ServerCreate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: FutureBuilder(
        future: ref
            .read(localDatabaseRepositoryProvider)
            .getServerConfigurationList(),
        builder: (context,
                AsyncSnapshot<List<ServerDatabaseData>> serverDataSnapshot) =>
            Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Expanded(
                child: Header(),
              ),
              Column(
                children: [
                  const Expanded(
                    child: SizedBox(
                      width: 900,
                      height: 350,
                      child: NewServerForm(),
                    ),
                  ),
                  Visibility(
                    visible: serverDataSnapshot.data!.isNotEmpty,
                    child: Row(
                      children: [
                        const Text(
                            "Parece que ya tienes una configuración previa. ¿Deseas continuar?"),
                        TextButton(
                          onPressed: () {
                            ref
                                .read(localDatabaseRepositoryProvider)
                                .updateConnectionMode(false);

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ));
                          },
                          child: const Text("No, saltemos este paso."),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: IconButton(
                      tooltip: "Volver",
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        height: double.maxFinite,
        color: Colors.blue,
        child: Center(
          child: Text(
            "Ingresa la información del nuevo servidor",
            style: GoogleFonts.montserrat(
              fontSize: 50,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
