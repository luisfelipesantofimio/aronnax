import 'package:aronnax/src/data/interfaces/auth_repository_interface.dart';
import 'package:aronnax/src/domain/entities/professional.dart';
import 'package:aronnax/src/presentation/widgets/generic_minimal_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PasswordPinRecover extends ConsumerStatefulWidget {
  const PasswordPinRecover({
    Key? key,
    required this.professionalData,
  }) : super(key: key);
  final Professional professionalData;

  @override
  ConsumerState<PasswordPinRecover> createState() => _PasswordPinRecoverState();
}

class _PasswordPinRecoverState extends ConsumerState<PasswordPinRecover> {
  String userPin = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 3),
            blurRadius: 6,
            color: Color.fromARGB(255, 218, 218, 218),
          ),
        ],
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Form(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Insert your account recover pin',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Your pin'),
                onChanged: (value) {
                  setState(() {
                    userPin = value;
                  });
                },
              ),
              const Padding(
                padding: EdgeInsets.all(10),
              ),
              Visibility(
                visible: ref.read(authenticationProvider).validateRecoverPin(
                    userInput: userPin,
                    encodedPin: widget.professionalData.encodedRecoverPin),
                child: GenericMinimalButton(
                  title: 'Update password',
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
