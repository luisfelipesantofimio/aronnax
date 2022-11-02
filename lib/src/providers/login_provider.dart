import 'package:aronnax/src/database/local_model/local_model.dart';
import 'package:aronnax/src/database/local_model/local_queries.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localLoginStateProvider =
    StreamProvider.family<List<ProfessionalData>, int>(
  (ref, userID) => localDB.loginProfessional(userID),
);
