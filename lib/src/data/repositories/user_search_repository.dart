import 'package:aronnax/src/data/database/local_model/local_model.dart';
import 'package:aronnax/src/data/interfaces/local_database_interface.dart';
import 'package:aronnax/src/data/interfaces/user_search_repository_interface.dart';
import 'package:aronnax/src/data/providers/patient_search_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserSearchRepository implements UserSearchRepositoryInterface {
  @override
  void searchLocalUserByName(WidgetRef ref, String query) async {
    List<Patient> queriedData =
        await ref.read(localDatabaseRepositoryProvider).searchPatient(query);

    ref
        .read(localQueriedPatientSearchListProvider.notifier)
        .update((state) => queriedData);
  }

  @override
  Future<List<Patient>> searchremoteUserByName(String query) {
    // TODO: implement searchremoteUserByName
    throw UnimplementedError();
  }
}
