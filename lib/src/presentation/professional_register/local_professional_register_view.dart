import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:aronnax/src/presentation/professional_register/local_professional_register_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocalProfessionalRegisterView extends ConsumerWidget {
  const LocalProfessionalRegisterView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 30 / 100,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 196, 244, 248),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(
                    4,
                    0,
                  ),
                  blurRadius: 6,
                ),
              ],
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!
                          .welcomeScreenCreateAccountLocal,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(
                        10,
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.welcomeScreenRememberData,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back),
                      tooltip:
                          AppLocalizations.of(context)!.registerBackButtonTitle,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.9,
            width: MediaQuery.of(context).size.width * 70 / 100,
            child: const LocalProfessionalRegister(),
          )
        ],
      ),
    );
  }
}
