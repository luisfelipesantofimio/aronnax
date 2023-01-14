//implementar el código de algún modo

import 'dart:math';
import 'dart:io';

randomGenerator(length) {
  var randon = Random();
  final result = String.fromCharCodes(
    List.generate(length, (index) => randon.nextInt(33) + 89),
  );
  return result;
}

void main() {
  print("Inserta el largo de la contraseña");
  int passwordLen = int.parse(stdin.readLineSync()!);
  print(
    randomGenerator(passwordLen.toInt()),
  );
  print(registerGen(8));
}

registerGen(len) {
  final random = Random();
  const charList =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  var result = List.generate(
    len,
    (index) => charList[random.nextInt(charList.length)],
  ).join();
  return result;
}
