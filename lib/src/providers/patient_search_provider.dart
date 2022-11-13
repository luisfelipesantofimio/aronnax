import 'package:aronnax/src/database/local_model/local_model.dart';
import 'package:aronnax/src/database/local_model/local_queries.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localPatientSearchProvider = StreamProvider.family<List<Patient>, String>(
  (ref, userName) => localDB.userConsultation(userName),
);
