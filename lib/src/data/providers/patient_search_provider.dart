import 'package:aronnax/src/data/database/local_model/local_model.dart';
import 'package:aronnax/src/data/repositories/user_search_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// It's value gets updated when the input parameter of
/// the [UserSearchRepository] local query method
/// is used
final localQueriedPatientSearchListProvider = StateProvider<List<LocalPatient>>(
  (ref) => [],
);

// final remoteQueriedPatientSearchListProvider =
//     StateProvider<List<RemotePatient>>(
//   (ref) => [],
// );
