import 'package:aronnax/src/presentation/welcome_screens/Forms/server_create.dart';
import 'package:aronnax/src/presentation/login/login_main_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ServerCreate extends StatelessWidget {
  const ServerCreate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
                  //     visible: localdb.isNotEmpty,
                  child: Row(
                    children: [
                      const Text(
                          "Parece que ya tienes una configuración previa. ¿Deseas continuar?"),
                      TextButton(
                        onPressed: () {
                          // offlineModeDB.put(
                          //   "offlineModeDB",
                          //   LocalDatabaseMode(false),
                          // );
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
