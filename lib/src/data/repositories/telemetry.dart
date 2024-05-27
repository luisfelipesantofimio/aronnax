import 'dart:developer';
import 'dart:io';
import 'package:aronnax/src/data/interfaces/local_database_interface.dart';
import 'package:aronnax/src/data/interfaces/telemetry.dart';
import 'package:aronnax/src/data/repositories/database_repository.dart';
import 'package:aronnax/src/domain/entities/user_feedback.dart';
import 'package:aronnax/src/presentation/core/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TelemetryRepository implements Telemetry {
  final _instance = Supabase.instance.client;

  final DatabaseRepository _localDb = DatabaseRepository();

  @override
  Future<void> createInstallationProfile(WidgetRef ref,
      {required bool acceptedTerms}) async {
    try {
      String? foundInstallation = await ref
          .read(localDatabaseRepositoryProvider)
          .getLocalSettings()
          .then((value) => value.installationId);
      String? installationId;
      if (foundInstallation == null) {
        final data = await _instance
            .from('anon_user')
            .insert({
              'os': Platform.operatingSystem,
              'version': AppConstants.globalVersion,
            })
            .select()
            .single();
        installationId = data["installation_id"].toString();
      } else {
        installationId = foundInstallation;
      }
      await _localDb.updateTelemetrySettings(acceptedTerms, installationId);
    } catch (e) {
      log("Error initializing Supabase profile: $e");
    }
  }

  @override
  Future<void> updateUserStats() async {
    try {
      final settings = await _localDb.getLocalSettings();
      final patientsAmount =
          await _localDb.getLocalPatientsList().then((value) => value.length);
      await _instance
          .from('anon_user')
          .update({
            'patients_number': patientsAmount,
            'version': AppConstants.globalVersion,
          })
          .match({
            'installation_id': settings.installationId ?? "",
          })
          .select()
          .single();
      await registerUserSession();
    } catch (e) {
      log("Error updating Supabase profile: $e");
    }
  }

  @override
  Future<void> registerUserSession() async {
    try {
      final installationId = await _localDb
          .getLocalSettings()
          .then((value) => value.installationId);
      await _instance
          .from("session")
          .insert({
            "installation_id": installationId,
          })
          .select()
          .single();
    } catch (e) {
      log("Error creating session registry: $e");
    }
  }

  @override
  Future<UserFeedback> getExistingFeedback() async {
    try {
      final installationId = await _localDb.getLocalSettings().then(
            (value) => value.installationId,
          );

      final feedback = await _instance
          .from("feedback")
          .select()
          .eq("installation_id", installationId ?? "")
          .order("created_at", ascending: false);
      if (feedback.isEmpty) {
        return UserFeedback(rating: 0, feedback: null);
      } else {
        return UserFeedback(
          rating: double.parse(feedback.first["punctuation"].toString()),
          feedback: feedback.first["feedback"],
        );
      }
    } catch (e) {
      log("Error fetching feedback: $e");
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> sendUserFeedback(
      double rating, String? feedback) async {
    try {
      final installationId = await _localDb
          .getLocalSettings()
          .then((value) => value.installationId);
      Map<String, dynamic> feedbackData = {
        "punctuation": rating,
        "installation_id": installationId
      };
      if (feedback != null && feedbackData.isNotEmpty) {
        feedbackData["feedback"] = feedback;
      }
      final data = await _instance
          .from('feedback')
          .insert(feedbackData)
          .select()
          .single();
      return data;
    } catch (e) {
      log("Error: $e");
      rethrow;
    }
  }

  @override
  Future<void> sendErrorReport(String error) async {
    try {
      final installationId = await _localDb
          .getLocalSettings()
          .then((value) => value.installationId);
      await _instance
          .from("report")
          .insert({"report": error, "installation_id": installationId})
          .select()
          .single();
    } catch (e) {
      log("Error sending error report: $e");
    }
  }
}
