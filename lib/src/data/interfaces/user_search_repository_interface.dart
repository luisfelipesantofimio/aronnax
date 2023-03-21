import 'package:aronnax/src/data/repositories/user_search_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class UserSearchRepositoryInterface {
  void searchLocalUserByName(WidgetRef ref, String query);
  void searchremoteUserByName(String query);
}

final userSearchRepositoryProvider = Provider<UserSearchRepositoryInterface>(
  (ref) => UserSearchRepository(),
);
