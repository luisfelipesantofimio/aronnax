import 'package:flutter_riverpod/flutter_riverpod.dart';

final globalUserNameProvider = StateProvider(
  (ref) => "",
);
final globalUserLastNameProvider = StateProvider(
  (ref) => "",
);
final globalProfessionalIDProvider = StateProvider(
  (ref) => "",
);
final globalProfessionalPersonalIDProvider = StateProvider<int>(
  (ref) => 0,
);
