import 'package:flutter_riverpod/flutter_riverpod.dart';

final sessionSummaryProvider = StateProvider<String>((ref) => '');

final sessionObjectivesProvider = StateProvider<String>((ref) => '');

final sessionTherapeuticArchievementsProvider =
    StateProvider<String>((ref) => '');

final sessionNotesProvider = StateProvider<String>((ref) => '');
