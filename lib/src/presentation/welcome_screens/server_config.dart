import 'package:aronnax/src/data/database/local_model/local_model.dart';
import 'package:aronnax/src/data/interfaces/local_database_interface.dart';
import 'package:aronnax/src/presentation/welcome_screens/Forms/current_server_conf.dart';
import 'package:aronnax/src/presentation/login/login_main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class ServerConfig extends ConsumerWidget {
  const ServerConfig({Key? key}) : super(key: key);

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
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(
                child: Header(),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      width: 900,
                      height: 500,
                      child: const ExistingServerForm(),
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
                            child: const Text("No, saltemos este paso.")),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back),
                      tooltip: "Volver",
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
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        height: double.maxFinite,
        color: Colors.blue,
        child: Center(
          child: Text(
            "Ingresa la información del servidor",
            style: GoogleFonts.montserrat(
              fontSize: 40,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
