import 'package:aronnax/src/data/repositories/telemetry.dart';
import 'package:aronnax/src/domain/entities/user_feedback.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Optional Telemetry interface
abstract class Telemetry {
  /// Create installation profile on the Supabase instance
  Future<void> createInstallationProfile(WidgetRef ref,
      {required bool acceptedTerms});

  /// Overrides current registry on database if telemetry is enabled
  Future<void> updateUserStats();

  /// Creates a register with installation id and current time in Supabase "session" table
  Future<void> registerUserSession();

  /// Sends user feedback
  Future<Map<String, dynamic>> sendUserFeedback(
      double rating, String? feedback);

  /// Gets user feedback and return custom class
  Future<UserFeedback> getExistingFeedback();

  /// Sends error report
  Future<void> sendErrorReport(String error);
}

final telemetryRepositoryProvider = Provider(
  (ref) => TelemetryRepository(),
);
