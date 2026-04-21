import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es')
  ];

  /// No description provided for @calendarEventCreationConfirmationText.
  ///
  /// In en, this message translates to:
  /// **'Event created'**
  String get calendarEventCreationConfirmationText;

  /// No description provided for @calendarEventDeleted.
  ///
  /// In en, this message translates to:
  /// **'Event removed'**
  String get calendarEventDeleted;

  /// No description provided for @calendarEventEmpty.
  ///
  /// In en, this message translates to:
  /// **'There are not events for this day.'**
  String get calendarEventEmpty;

  /// No description provided for @calendarEventFormDate.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get calendarEventFormDate;

  /// No description provided for @calendarEventFormDescription.
  ///
  /// In en, this message translates to:
  /// **'Event description'**
  String get calendarEventFormDescription;

  /// No description provided for @calendarEventFormErrorInvalidNumberOfWeeks.
  ///
  /// In en, this message translates to:
  /// **'Invalid value'**
  String get calendarEventFormErrorInvalidNumberOfWeeks;

  /// No description provided for @calendarEventFormErrorNoOptionsSelected.
  ///
  /// In en, this message translates to:
  /// **'You must select a status and a type of event'**
  String get calendarEventFormErrorNoOptionsSelected;

  /// No description provided for @calendarEventFormErrorNoPatientSelected.
  ///
  /// In en, this message translates to:
  /// **'You must select a patient'**
  String get calendarEventFormErrorNoPatientSelected;

  /// No description provided for @calendarEventFormNumberOfWeeks.
  ///
  /// In en, this message translates to:
  /// **'Number of weeks'**
  String get calendarEventFormNumberOfWeeks;

  /// No description provided for @calendarEventFormTime.
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get calendarEventFormTime;

  /// No description provided for @calendarEventGlobalTitleCreate.
  ///
  /// In en, this message translates to:
  /// **'Schedule event'**
  String get calendarEventGlobalTitleCreate;

  /// No description provided for @calendarEventGlobalTitleUpdate.
  ///
  /// In en, this message translates to:
  /// **'Update event'**
  String get calendarEventGlobalTitleUpdate;

  /// No description provided for @calendarEventIndividualEvent.
  ///
  /// In en, this message translates to:
  /// **'Individual event'**
  String get calendarEventIndividualEvent;

  /// No description provided for @calendarEventMultideleteDialogDeleteConfirmation.
  ///
  /// In en, this message translates to:
  /// **'events deleted'**
  String get calendarEventMultideleteDialogDeleteConfirmation;

  /// No description provided for @calendarEventMultideleteDialogDescription.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete all events?'**
  String get calendarEventMultideleteDialogDescription;

  /// No description provided for @calendarEventMultideleteTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete all related events'**
  String get calendarEventMultideleteTitle;

  /// No description provided for @calendarEventScheduleButtonTitle.
  ///
  /// In en, this message translates to:
  /// **'Schedule'**
  String get calendarEventScheduleButtonTitle;

  /// No description provided for @calendarEventStatusCanceled.
  ///
  /// In en, this message translates to:
  /// **'Canceled'**
  String get calendarEventStatusCanceled;

  /// No description provided for @calendarEventStatusDone.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get calendarEventStatusDone;

  /// No description provided for @calendarEventStatusScheduled.
  ///
  /// In en, this message translates to:
  /// **'Scheduled'**
  String get calendarEventStatusScheduled;

  /// No description provided for @calendarEventStatusTitle.
  ///
  /// In en, this message translates to:
  /// **'Event status'**
  String get calendarEventStatusTitle;

  /// No description provided for @calendarEventTypeConsultation.
  ///
  /// In en, this message translates to:
  /// **'Consultation'**
  String get calendarEventTypeConsultation;

  /// No description provided for @calendarEventTypeFollowUp.
  ///
  /// In en, this message translates to:
  /// **'Follow-up'**
  String get calendarEventTypeFollowUp;

  /// No description provided for @calendarEventTypeMeeting.
  ///
  /// In en, this message translates to:
  /// **'Meeting'**
  String get calendarEventTypeMeeting;

  /// No description provided for @calendarEventTypeTitle.
  ///
  /// In en, this message translates to:
  /// **'Event type'**
  String get calendarEventTypeTitle;

  /// No description provided for @calendarEventUpdateConfirmationText.
  ///
  /// In en, this message translates to:
  /// **'Event updated'**
  String get calendarEventUpdateConfirmationText;

  /// No description provided for @calendarEventWeeklyEvent.
  ///
  /// In en, this message translates to:
  /// **'Weekly event'**
  String get calendarEventWeeklyEvent;

  /// No description provided for @caseCreationFormHintConsultationReason.
  ///
  /// In en, this message translates to:
  /// **'Consultation reason'**
  String get caseCreationFormHintConsultationReason;

  /// No description provided for @caseCreationFormSaveConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Case saved'**
  String get caseCreationFormSaveConfirmation;

  /// No description provided for @caseCreationFormSearchIcdCode.
  ///
  /// In en, this message translates to:
  /// **'Search ICD code'**
  String get caseCreationFormSearchIcdCode;

  /// No description provided for @caseCreationFormSelectTreatment.
  ///
  /// In en, this message translates to:
  /// **'Select a treatment plan'**
  String get caseCreationFormSelectTreatment;

  /// No description provided for @caseCreationFormTitleAdd.
  ///
  /// In en, this message translates to:
  /// **'Add new treatment plan'**
  String get caseCreationFormTitleAdd;

  /// No description provided for @caseCreationFormTitleDiagnostic.
  ///
  /// In en, this message translates to:
  /// **'Diagnostic impression'**
  String get caseCreationFormTitleDiagnostic;

  /// No description provided for @caseCreationFormTitleSelectedDiagnostic.
  ///
  /// In en, this message translates to:
  /// **'Selected diagnostic'**
  String get caseCreationFormTitleSelectedDiagnostic;

  /// No description provided for @caseCreationFormTitleTreatmentProposotion.
  ///
  /// In en, this message translates to:
  /// **'Treatment proposition'**
  String get caseCreationFormTitleTreatmentProposotion;

  /// No description provided for @caseCreationTitle.
  ///
  /// In en, this message translates to:
  /// **'New case'**
  String get caseCreationTitle;

  /// No description provided for @caseCreationWithoutTreatment.
  ///
  /// In en, this message translates to:
  /// **'Case without treatment plan'**
  String get caseCreationWithoutTreatment;

  /// No description provided for @caseCreationWithTreatment.
  ///
  /// In en, this message translates to:
  /// **'Case with treatment plan'**
  String get caseCreationWithTreatment;

  /// No description provided for @caseDiagnosticIcdDataEmpty.
  ///
  /// In en, this message translates to:
  /// **'The ICD diagnostic data is empty'**
  String get caseDiagnosticIcdDataEmpty;

  /// No description provided for @caseDiagnosticIcdDescription.
  ///
  /// In en, this message translates to:
  /// **'If you want to assing the ICD code for your diagnostic impression, you must download the required data from the ICD provider. This process can take a few minutes. Be patient.'**
  String get caseDiagnosticIcdDescription;

  /// No description provided for @caseDiagnosticSearchTerm.
  ///
  /// In en, this message translates to:
  /// **'Search any term'**
  String get caseDiagnosticSearchTerm;

  /// No description provided for @caseDiagnosticTermNotFound.
  ///
  /// In en, this message translates to:
  /// **'Term not found'**
  String get caseDiagnosticTermNotFound;

  /// No description provided for @clinicHistoryFormFamilyHistory.
  ///
  /// In en, this message translates to:
  /// **'Family history'**
  String get clinicHistoryFormFamilyHistory;

  /// No description provided for @clinicHistoryFormMedAntecedents.
  ///
  /// In en, this message translates to:
  /// **'Medical antecedents'**
  String get clinicHistoryFormMedAntecedents;

  /// No description provided for @clinicHistoryFormMentalExamination.
  ///
  /// In en, this message translates to:
  /// **'Mental examination'**
  String get clinicHistoryFormMentalExamination;

  /// No description provided for @clinicHistoryFormPersonalHistory.
  ///
  /// In en, this message translates to:
  /// **'Personal history'**
  String get clinicHistoryFormPersonalHistory;

  /// No description provided for @clinicHistoryFormPsyAntecedents.
  ///
  /// In en, this message translates to:
  /// **'Psychological antecedents'**
  String get clinicHistoryFormPsyAntecedents;

  /// No description provided for @clinicHistoryInfoCreationDate.
  ///
  /// In en, this message translates to:
  /// **'Creation date'**
  String get clinicHistoryInfoCreationDate;

  /// No description provided for @clinicHistoryInfoPatientName.
  ///
  /// In en, this message translates to:
  /// **'Patient name'**
  String get clinicHistoryInfoPatientName;

  /// No description provided for @clinicHistoryInfoProfessionalName.
  ///
  /// In en, this message translates to:
  /// **'Professional'**
  String get clinicHistoryInfoProfessionalName;

  /// No description provided for @clinicHistoryInfoRecordCode.
  ///
  /// In en, this message translates to:
  /// **'Record unique code'**
  String get clinicHistoryInfoRecordCode;

  /// No description provided for @clinicHistorySaveConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Saved record'**
  String get clinicHistorySaveConfirmation;

  /// No description provided for @clinicHistorySaveRegister.
  ///
  /// In en, this message translates to:
  /// **'Save record'**
  String get clinicHistorySaveRegister;

  /// No description provided for @clinicHistoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Record'**
  String get clinicHistoryTitle;

  /// No description provided for @continueButton.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueButton;

  /// No description provided for @disabled.
  ///
  /// In en, this message translates to:
  /// **'Disabled'**
  String get disabled;

  /// No description provided for @errorEmptyField.
  ///
  /// In en, this message translates to:
  /// **'The field is empty'**
  String get errorEmptyField;

  /// No description provided for @friend.
  ///
  /// In en, this message translates to:
  /// **'Friend'**
  String get friend;

  /// No description provided for @genericAccept.
  ///
  /// In en, this message translates to:
  /// **'Accept'**
  String get genericAccept;

  /// No description provided for @genericCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get genericCancel;

  /// No description provided for @genericCase.
  ///
  /// In en, this message translates to:
  /// **'Case'**
  String get genericCase;

  /// No description provided for @genericCopyMessage.
  ///
  /// In en, this message translates to:
  /// **'Copy {item}'**
  String genericCopyMessage(String item);

  /// No description provided for @genericDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get genericDelete;

  /// No description provided for @genericDescription.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get genericDescription;

  /// No description provided for @genericDiagnostic.
  ///
  /// In en, this message translates to:
  /// **'Diagnostic'**
  String get genericDiagnostic;

  /// No description provided for @genericEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get genericEdit;

  /// No description provided for @genericEmptyData.
  ///
  /// In en, this message translates to:
  /// **'No data to show'**
  String get genericEmptyData;

  /// No description provided for @genericErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get genericErrorMessage;

  /// No description provided for @genericErrorPasswordsDontMatch.
  ///
  /// In en, this message translates to:
  /// **'The passwords don´t match'**
  String get genericErrorPasswordsDontMatch;

  /// No description provided for @genericMinimumCharacters.
  ///
  /// In en, this message translates to:
  /// **'Minimum {amount} characters'**
  String genericMinimumCharacters(String amount);

  /// No description provided for @genericNoDescription.
  ///
  /// In en, this message translates to:
  /// **'No description'**
  String get genericNoDescription;

  /// No description provided for @genericNotes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get genericNotes;

  /// No description provided for @genericPatientNameTitle.
  ///
  /// In en, this message translates to:
  /// **'Patient name'**
  String get genericPatientNameTitle;

  /// No description provided for @genericPatientSelectionTitlte.
  ///
  /// In en, this message translates to:
  /// **'Select a patient'**
  String get genericPatientSelectionTitlte;

  /// No description provided for @genericPatientTitle.
  ///
  /// In en, this message translates to:
  /// **'Patient'**
  String get genericPatientTitle;

  /// No description provided for @genericSaveTitle.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get genericSaveTitle;

  /// No description provided for @genericSelectionText.
  ///
  /// In en, this message translates to:
  /// **'Select an option'**
  String get genericSelectionText;

  /// No description provided for @genericSelectTitle.
  ///
  /// In en, this message translates to:
  /// **'Select'**
  String get genericSelectTitle;

  /// No description provided for @genericSend.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get genericSend;

  /// No description provided for @genericSession.
  ///
  /// In en, this message translates to:
  /// **'Session'**
  String get genericSession;

  /// No description provided for @genericSupport.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get genericSupport;

  /// No description provided for @genericThanks.
  ///
  /// In en, this message translates to:
  /// **'Thanks'**
  String get genericThanks;

  /// No description provided for @genericThisWasPrefix.
  ///
  /// In en, this message translates to:
  /// **'This was a'**
  String get genericThisWasPrefix;

  /// No description provided for @genericTitle.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get genericTitle;

  /// No description provided for @genericTitleYourTitle.
  ///
  /// In en, this message translates to:
  /// **'Your title'**
  String get genericTitleYourTitle;

  /// No description provided for @genericTreatmentPlan.
  ///
  /// In en, this message translates to:
  /// **'Treatment plan'**
  String get genericTreatmentPlan;

  /// No description provided for @helpScreenAronnaxPoweredBy.
  ///
  /// In en, this message translates to:
  /// **'Aronnax is powered by Flutter'**
  String get helpScreenAronnaxPoweredBy;

  /// No description provided for @helpScreenDescriptionText.
  ///
  /// In en, this message translates to:
  /// **'A patient and medical records management software, minimalist and efficient.\nMade by psychologists, for psychologists.'**
  String get helpScreenDescriptionText;

  /// No description provided for @helpScreenDevelopedBy.
  ///
  /// In en, this message translates to:
  /// **'Developed by'**
  String get helpScreenDevelopedBy;

  /// No description provided for @helpScreenLegalInformationTitle.
  ///
  /// In en, this message translates to:
  /// **'Legal information'**
  String get helpScreenLegalInformationTitle;

  /// No description provided for @helpScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Development information'**
  String get helpScreenTitle;

  /// No description provided for @icdDataRepairConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Repair completed'**
  String get icdDataRepairConfirmation;

  /// No description provided for @icdDataRepairDescription.
  ///
  /// In en, this message translates to:
  /// **'If there was an error during the ICD data download process, you can fix it here.'**
  String get icdDataRepairDescription;

  /// No description provided for @icdDataRepairTitle.
  ///
  /// In en, this message translates to:
  /// **'Repair ICD database'**
  String get icdDataRepairTitle;

  /// No description provided for @icdLoadingDescription.
  ///
  /// In en, this message translates to:
  /// **'Aronnax is creating a local copy of the International Classification of Diseases 11th Revision, using the WHO API for helping you in your diagnostic impressions. This can take a few minutes.'**
  String get icdLoadingDescription;

  /// No description provided for @icdLoadingTitle.
  ///
  /// In en, this message translates to:
  /// **'Be patient'**
  String get icdLoadingTitle;

  /// No description provided for @icdSuccess.
  ///
  /// In en, this message translates to:
  /// **'Done!'**
  String get icdSuccess;

  /// No description provided for @icdSuccessDescription.
  ///
  /// In en, this message translates to:
  /// **'You have a copy of the ICD-11 for your use'**
  String get icdSuccessDescription;

  /// No description provided for @loginErrorEmptyPassword.
  ///
  /// In en, this message translates to:
  /// **'Insert your password'**
  String get loginErrorEmptyPassword;

  /// No description provided for @loginErrorEmptyUsername.
  ///
  /// In en, this message translates to:
  /// **'Insert your username'**
  String get loginErrorEmptyUsername;

  /// No description provided for @loginErrorIncorrectPassword.
  ///
  /// In en, this message translates to:
  /// **'Invalid password'**
  String get loginErrorIncorrectPassword;

  /// No description provided for @loginErrorUserDontExist.
  ///
  /// In en, this message translates to:
  /// **'This user does not exist'**
  String get loginErrorUserDontExist;

  /// No description provided for @loginHintUsername.
  ///
  /// In en, this message translates to:
  /// **'Write your registered user name'**
  String get loginHintUsername;

  /// No description provided for @loginLabelPassword.
  ///
  /// In en, this message translates to:
  /// **'User name'**
  String get loginLabelPassword;

  /// No description provided for @loginTitle.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get loginTitle;

  /// No description provided for @loginUsername.
  ///
  /// In en, this message translates to:
  /// **'User name'**
  String get loginUsername;

  /// No description provided for @loginUserPassword.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get loginUserPassword;

  /// No description provided for @loginUserPasswordDefined.
  ///
  /// In en, this message translates to:
  /// **'Password for'**
  String get loginUserPasswordDefined;

  /// No description provided for @loginUserPasswordRecover.
  ///
  /// In en, this message translates to:
  /// **'Forgot your password?'**
  String get loginUserPasswordRecover;

  /// No description provided for @mainMenuAddEventTooltip.
  ///
  /// In en, this message translates to:
  /// **'Add event'**
  String get mainMenuAddEventTooltip;

  /// No description provided for @mainMenuEventsForDefinedDate.
  ///
  /// In en, this message translates to:
  /// **'Events for'**
  String get mainMenuEventsForDefinedDate;

  /// No description provided for @mainMenuEventsForToday.
  ///
  /// In en, this message translates to:
  /// **'Events for today'**
  String get mainMenuEventsForToday;

  /// No description provided for @mainMenuOptionsBarAlertCaseNotFound.
  ///
  /// In en, this message translates to:
  /// **'This user does not have any open case. Go to {patientNames}s profile and create or enable a case.'**
  String mainMenuOptionsBarAlertCaseNotFound(String patientNames);

  /// No description provided for @mainMenuOptionsBarPatientSelectionDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Select the patient'**
  String get mainMenuOptionsBarPatientSelectionDialogTitle;

  /// No description provided for @mainMenuOptionsBarTitleHelp.
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get mainMenuOptionsBarTitleHelp;

  /// No description provided for @mainMenuOptionsBarTitleMoreOptions.
  ///
  /// In en, this message translates to:
  /// **'More options'**
  String get mainMenuOptionsBarTitleMoreOptions;

  /// No description provided for @mainMenuOptionsBarTitleRegisterConsultant.
  ///
  /// In en, this message translates to:
  /// **'Register consultant'**
  String get mainMenuOptionsBarTitleRegisterConsultant;

  /// No description provided for @mainMenuOptionsBarTitleRegisterSignOut.
  ///
  /// In en, this message translates to:
  /// **'Sign out'**
  String get mainMenuOptionsBarTitleRegisterSignOut;

  /// No description provided for @mainMenuOptionsBarTitleSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get mainMenuOptionsBarTitleSettings;

  /// No description provided for @mainMenuOptionsBarTitleStartConsultation.
  ///
  /// In en, this message translates to:
  /// **'Start consultation'**
  String get mainMenuOptionsBarTitleStartConsultation;

  /// No description provided for @other.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get other;

  /// No description provided for @parent.
  ///
  /// In en, this message translates to:
  /// **'Parent'**
  String get parent;

  /// No description provided for @partner.
  ///
  /// In en, this message translates to:
  /// **'Partner'**
  String get partner;

  /// No description provided for @passwordRecoverCopyPin.
  ///
  /// In en, this message translates to:
  /// **'Copy pin'**
  String get passwordRecoverCopyPin;

  /// No description provided for @passwordRecoverDialogErrorDontExist.
  ///
  /// In en, this message translates to:
  /// **'The user does not exist'**
  String get passwordRecoverDialogErrorDontExist;

  /// No description provided for @passwordRecoverDialogErrorEmpty.
  ///
  /// In en, this message translates to:
  /// **'Insert your user name'**
  String get passwordRecoverDialogErrorEmpty;

  /// No description provided for @passwordRecoverDialogHint.
  ///
  /// In en, this message translates to:
  /// **'Your login user name'**
  String get passwordRecoverDialogHint;

  /// No description provided for @passwordRecoverDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Please, insert your user name'**
  String get passwordRecoverDialogTitle;

  /// No description provided for @passwordRecoverPinAnswerHint.
  ///
  /// In en, this message translates to:
  /// **'Your pin'**
  String get passwordRecoverPinAnswerHint;

  /// No description provided for @passwordRecoverPinInstructions.
  ///
  /// In en, this message translates to:
  /// **'Insert your account\'s recover pin'**
  String get passwordRecoverPinInstructions;

  /// No description provided for @passwordRecoverPinTitle.
  ///
  /// In en, this message translates to:
  /// **'Your pin (Single use generated number for recovering your account)'**
  String get passwordRecoverPinTitle;

  /// No description provided for @passwordRecoverQuestionaryAdress.
  ///
  /// In en, this message translates to:
  /// **'Select your home adress'**
  String get passwordRecoverQuestionaryAdress;

  /// No description provided for @passwordRecoverQuestionaryAnswerHint.
  ///
  /// In en, this message translates to:
  /// **'Your answer'**
  String get passwordRecoverQuestionaryAnswerHint;

  /// No description provided for @passwordRecoverQuestionaryEmail.
  ///
  /// In en, this message translates to:
  /// **'Select your email adress'**
  String get passwordRecoverQuestionaryEmail;

  /// No description provided for @passwordRecoverQuestionaryInstructions.
  ///
  /// In en, this message translates to:
  /// **'Answer the questions below to confirm your identity'**
  String get passwordRecoverQuestionaryInstructions;

  /// No description provided for @passwordRecoverQuestionaryPasswordConfirmationAlert.
  ///
  /// In en, this message translates to:
  /// **'Password updated'**
  String get passwordRecoverQuestionaryPasswordConfirmationAlert;

  /// No description provided for @passwordRecoverQuestionaryPersonalId.
  ///
  /// In en, this message translates to:
  /// **'Select your personal Id'**
  String get passwordRecoverQuestionaryPersonalId;

  /// No description provided for @passwordRecoverQuestionaryTitle.
  ///
  /// In en, this message translates to:
  /// **'Personal data questionary'**
  String get passwordRecoverQuestionaryTitle;

  /// No description provided for @passwordRecoverQuestionaryUpdatePasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Update your password'**
  String get passwordRecoverQuestionaryUpdatePasswordTitle;

  /// No description provided for @patientCaseActiveCase.
  ///
  /// In en, this message translates to:
  /// **'Active case'**
  String get patientCaseActiveCase;

  /// No description provided for @patientCaseCloseDialogCloseButton.
  ///
  /// In en, this message translates to:
  /// **'Close this case'**
  String get patientCaseCloseDialogCloseButton;

  /// No description provided for @patientCaseCloseDialogCloseConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Case closed'**
  String get patientCaseCloseDialogCloseConfirmation;

  /// No description provided for @patientCaseCloseDialogCloseNoOptionError.
  ///
  /// In en, this message translates to:
  /// **'You must select an option'**
  String get patientCaseCloseDialogCloseNoOptionError;

  /// No description provided for @patientCaseCloseDialogDescription.
  ///
  /// In en, this message translates to:
  /// **'Please, choose an option that indicates the patient\'s condition upon completion of this process'**
  String get patientCaseCloseDialogDescription;

  /// No description provided for @patientCaseCloseDialogOptionalOutcome.
  ///
  /// In en, this message translates to:
  /// **'Optional explanation of this case'**
  String get patientCaseCloseDialogOptionalOutcome;

  /// No description provided for @patientCaseCloseDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Close this case?'**
  String get patientCaseCloseDialogTitle;

  /// No description provided for @patientCaseDataOutcomeDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Why this outcome?'**
  String get patientCaseDataOutcomeDialogTitle;

  /// No description provided for @patientCaseDeleteCase.
  ///
  /// In en, this message translates to:
  /// **'Delete case'**
  String get patientCaseDeleteCase;

  /// No description provided for @patientCaseDeleteDialogDeleteConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Case deleted'**
  String get patientCaseDeleteDialogDeleteConfirmation;

  /// No description provided for @patientCaseDeleteDialogDescription.
  ///
  /// In en, this message translates to:
  /// **'If you delete this case, you are going to lose all the related data to it, as sessions and treatment plan results'**
  String get patientCaseDeleteDialogDescription;

  /// No description provided for @patientCaseDeleteDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete this case?'**
  String get patientCaseDeleteDialogTitle;

  /// No description provided for @patientCaseInactiveCase.
  ///
  /// In en, this message translates to:
  /// **'Inactive case'**
  String get patientCaseInactiveCase;

  /// No description provided for @patientCaseSeeCaseOutcome.
  ///
  /// In en, this message translates to:
  /// **'See case outcome'**
  String get patientCaseSeeCaseOutcome;

  /// No description provided for @patientCaseSeeCaseOutcomeTitle.
  ///
  /// In en, this message translates to:
  /// **'Case outcome'**
  String get patientCaseSeeCaseOutcomeTitle;

  /// No description provided for @patientCaseSessionEmptyList.
  ///
  /// In en, this message translates to:
  /// **'There are no sessions related to this case'**
  String get patientCaseSessionEmptyList;

  /// No description provided for @patientCaseSessionPerformanceExplanation.
  ///
  /// In en, this message translates to:
  /// **'Explanation for this performance'**
  String get patientCaseSessionPerformanceExplanation;

  /// No description provided for @patientCompanionReason.
  ///
  /// In en, this message translates to:
  /// **'Reason for companion'**
  String get patientCompanionReason;

  /// No description provided for @patientCompanionRelation.
  ///
  /// In en, this message translates to:
  /// **'Companion relation with patient'**
  String get patientCompanionRelation;

  /// No description provided for @patientDataCaseCreateNew.
  ///
  /// In en, this message translates to:
  /// **'Create new case'**
  String get patientDataCaseCreateNew;

  /// No description provided for @patientDataCaseDiagnosticCode.
  ///
  /// In en, this message translates to:
  /// **'Diagnostic code'**
  String get patientDataCaseDiagnosticCode;

  /// No description provided for @patientDataCaseEmpty.
  ///
  /// In en, this message translates to:
  /// **'This patient has no open cases'**
  String get patientDataCaseEmpty;

  /// No description provided for @patientDataCreateCase.
  ///
  /// In en, this message translates to:
  /// **'Create case'**
  String get patientDataCreateCase;

  /// No description provided for @patientDataCreateClinicalHistory.
  ///
  /// In en, this message translates to:
  /// **'Create clinical history'**
  String get patientDataCreateClinicalHistory;

  /// No description provided for @patientDataDeletePatient.
  ///
  /// In en, this message translates to:
  /// **'Delete patient'**
  String get patientDataDeletePatient;

  /// No description provided for @patientDataExportConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Patient data exported to: {path}'**
  String patientDataExportConfirmation(String path);

  /// No description provided for @patientDataExportData.
  ///
  /// In en, this message translates to:
  /// **'Export patient data'**
  String get patientDataExportData;

  /// No description provided for @patientDataGoToPatientProfile.
  ///
  /// In en, this message translates to:
  /// **'Go to patient profile'**
  String get patientDataGoToPatientProfile;

  /// No description provided for @patientDataSeeResultsList.
  ///
  /// In en, this message translates to:
  /// **'See results list'**
  String get patientDataSeeResultsList;

  /// No description provided for @patientDataSeeSessions.
  ///
  /// In en, this message translates to:
  /// **'See sessions'**
  String get patientDataSeeSessions;

  /// No description provided for @patientDataTitleActiveUser.
  ///
  /// In en, this message translates to:
  /// **'Active user'**
  String get patientDataTitleActiveUser;

  /// No description provided for @patientDataTitleAdress.
  ///
  /// In en, this message translates to:
  /// **'Adress'**
  String get patientDataTitleAdress;

  /// No description provided for @patientDataTitleClinicHistory.
  ///
  /// In en, this message translates to:
  /// **'Clinical history'**
  String get patientDataTitleClinicHistory;

  /// No description provided for @patientDataTitleContactNumber.
  ///
  /// In en, this message translates to:
  /// **'Contact number'**
  String get patientDataTitleContactNumber;

  /// No description provided for @patientDataTitleEducationalAttainment.
  ///
  /// In en, this message translates to:
  /// **'Educational attainment'**
  String get patientDataTitleEducationalAttainment;

  /// No description provided for @patientDataTitleEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get patientDataTitleEmail;

  /// No description provided for @patientDataTitleEmergencyContactName.
  ///
  /// In en, this message translates to:
  /// **'Emergency contact name'**
  String get patientDataTitleEmergencyContactName;

  /// No description provided for @patientDataTitleEmergencyContactNumber.
  ///
  /// In en, this message translates to:
  /// **'Emergency contact number'**
  String get patientDataTitleEmergencyContactNumber;

  /// No description provided for @patientDataTitleID.
  ///
  /// In en, this message translates to:
  /// **'ID'**
  String get patientDataTitleID;

  /// No description provided for @patientDataTitleInactiveUser.
  ///
  /// In en, this message translates to:
  /// **'Inactive user'**
  String get patientDataTitleInactiveUser;

  /// No description provided for @patientDataTitleInsurance.
  ///
  /// In en, this message translates to:
  /// **'Insurance'**
  String get patientDataTitleInsurance;

  /// No description provided for @patientDataTitleOcupation.
  ///
  /// In en, this message translates to:
  /// **'Ocupation'**
  String get patientDataTitleOcupation;

  /// No description provided for @patientRegisterRequireCompanion.
  ///
  /// In en, this message translates to:
  /// **'Patient requires companion?'**
  String get patientRegisterRequireCompanion;

  /// No description provided for @patientsListMenuTitle.
  ///
  /// In en, this message translates to:
  /// **'Patients list'**
  String get patientsListMenuTitle;

  /// No description provided for @profileNewPasswordConfirmationSuccess.
  ///
  /// In en, this message translates to:
  /// **'Your password has been updated'**
  String get profileNewPasswordConfirmationSuccess;

  /// No description provided for @profileNewPasswordCurrentPassword.
  ///
  /// In en, this message translates to:
  /// **'Current password'**
  String get profileNewPasswordCurrentPassword;

  /// No description provided for @profileNewPasswordNewPassword.
  ///
  /// In en, this message translates to:
  /// **'New password'**
  String get profileNewPasswordNewPassword;

  /// No description provided for @profileNewPasswordUpdateButton.
  ///
  /// In en, this message translates to:
  /// **'Update password'**
  String get profileNewPasswordUpdateButton;

  /// No description provided for @profileUpdatePasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Update {user}\'s password'**
  String profileUpdatePasswordTitle(String user);

  /// No description provided for @registerBackButtonTitle.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get registerBackButtonTitle;

  /// No description provided for @registerErrorAlertTitle.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get registerErrorAlertTitle;

  /// No description provided for @registerFormAdressField.
  ///
  /// In en, this message translates to:
  /// **'Adress'**
  String get registerFormAdressField;

  /// No description provided for @registerFormContactNumberField.
  ///
  /// In en, this message translates to:
  /// **'Contact number'**
  String get registerFormContactNumberField;

  /// No description provided for @registerFormEducationalAttainmentField.
  ///
  /// In en, this message translates to:
  /// **'Educational attainment'**
  String get registerFormEducationalAttainmentField;

  /// No description provided for @registerFormEmailField.
  ///
  /// In en, this message translates to:
  /// **'E-mail'**
  String get registerFormEmailField;

  /// No description provided for @registerFormEmergencyContanctNameField.
  ///
  /// In en, this message translates to:
  /// **'Emergency contact name'**
  String get registerFormEmergencyContanctNameField;

  /// No description provided for @registerFormEmergencyContanctNumberField.
  ///
  /// In en, this message translates to:
  /// **'Emergency contact number'**
  String get registerFormEmergencyContanctNumberField;

  /// No description provided for @registerFormErrorEmail.
  ///
  /// In en, this message translates to:
  /// **'Invalid email format'**
  String get registerFormErrorEmail;

  /// No description provided for @registerFormErrorUserExists.
  ///
  /// In en, this message translates to:
  /// **'This user is already registered'**
  String get registerFormErrorUserExists;

  /// No description provided for @registerFormFemaleOption.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get registerFormFemaleOption;

  /// No description provided for @registerFormIdentificationNumberField.
  ///
  /// In en, this message translates to:
  /// **'Identification number'**
  String get registerFormIdentificationNumberField;

  /// No description provided for @registerFormInsuranceField.
  ///
  /// In en, this message translates to:
  /// **'Insurance'**
  String get registerFormInsuranceField;

  /// No description provided for @registerFormLastNamesField.
  ///
  /// In en, this message translates to:
  /// **'Last name'**
  String get registerFormLastNamesField;

  /// No description provided for @registerFormMaleOption.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get registerFormMaleOption;

  /// No description provided for @registerFormNamesField.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get registerFormNamesField;

  /// No description provided for @registerFormOcupationField.
  ///
  /// In en, this message translates to:
  /// **'Ocupation'**
  String get registerFormOcupationField;

  /// No description provided for @registerFormOtherOption.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get registerFormOtherOption;

  /// No description provided for @registerFormSexField.
  ///
  /// In en, this message translates to:
  /// **'Sex'**
  String get registerFormSexField;

  /// No description provided for @registerFormTitle.
  ///
  /// In en, this message translates to:
  /// **'Personal information'**
  String get registerFormTitle;

  /// No description provided for @registerSaveButtonTitle.
  ///
  /// In en, this message translates to:
  /// **'Save consultant'**
  String get registerSaveButtonTitle;

  /// No description provided for @registerSuccessAlertTitle.
  ///
  /// In en, this message translates to:
  /// **'Successfully registered consultant'**
  String get registerSuccessAlertTitle;

  /// No description provided for @registerTitle.
  ///
  /// In en, this message translates to:
  /// **'Register consultant'**
  String get registerTitle;

  /// No description provided for @relative.
  ///
  /// In en, this message translates to:
  /// **'Relative'**
  String get relative;

  /// No description provided for @sessionFormAddNote.
  ///
  /// In en, this message translates to:
  /// **'Add note'**
  String get sessionFormAddNote;

  /// No description provided for @sessionFormBeginTreatmentPlan.
  ///
  /// In en, this message translates to:
  /// **'Begin treatment plan'**
  String get sessionFormBeginTreatmentPlan;

  /// No description provided for @sessionFormBeginTreatmentPlanTaken.
  ///
  /// In en, this message translates to:
  /// **'Treatment plan results already saved'**
  String get sessionFormBeginTreatmentPlanTaken;

  /// No description provided for @sessionFormFieldSessionGoal.
  ///
  /// In en, this message translates to:
  /// **'Session goal'**
  String get sessionFormFieldSessionGoal;

  /// No description provided for @sessionFormFieldSessionSummary.
  ///
  /// In en, this message translates to:
  /// **'Session summary'**
  String get sessionFormFieldSessionSummary;

  /// No description provided for @sessionFormFieldTherapeuticArchievements.
  ///
  /// In en, this message translates to:
  /// **'Therapeutic archievements'**
  String get sessionFormFieldTherapeuticArchievements;

  /// No description provided for @sessionFormNewSession.
  ///
  /// In en, this message translates to:
  /// **'New session'**
  String get sessionFormNewSession;

  /// No description provided for @sessionFormSaveSession.
  ///
  /// In en, this message translates to:
  /// **'Save session'**
  String get sessionFormSaveSession;

  /// No description provided for @sessionFormStartTest.
  ///
  /// In en, this message translates to:
  /// **'Start test'**
  String get sessionFormStartTest;

  /// No description provided for @sessionFormStartTestSoon.
  ///
  /// In en, this message translates to:
  /// **'Soon'**
  String get sessionFormStartTestSoon;

  /// No description provided for @sessionFormTask.
  ///
  /// In en, this message translates to:
  /// **'Add task'**
  String get sessionFormTask;

  /// No description provided for @sessionInformationDateTitle.
  ///
  /// In en, this message translates to:
  /// **'Session date'**
  String get sessionInformationDateTitle;

  /// No description provided for @sessionInformationPatientTitle.
  ///
  /// In en, this message translates to:
  /// **'Patient'**
  String get sessionInformationPatientTitle;

  /// No description provided for @sessionNewNoteDialogDeleteNote.
  ///
  /// In en, this message translates to:
  /// **'Delete note'**
  String get sessionNewNoteDialogDeleteNote;

  /// No description provided for @sessionNewNoteDialogDeleteNoteConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Note deleted'**
  String get sessionNewNoteDialogDeleteNoteConfirmation;

  /// No description provided for @sessionNewNoteDialogHintText.
  ///
  /// In en, this message translates to:
  /// **'Aditional notes for this session'**
  String get sessionNewNoteDialogHintText;

  /// No description provided for @sessionNewNoteDialogSaveConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Note saved'**
  String get sessionNewNoteDialogSaveConfirmation;

  /// No description provided for @sessionNewNoteDialogSaveTitle.
  ///
  /// In en, this message translates to:
  /// **'Save note'**
  String get sessionNewNoteDialogSaveTitle;

  /// No description provided for @sessionNewNoteDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'New note'**
  String get sessionNewNoteDialogTitle;

  /// No description provided for @sessionReportDialogBadOption.
  ///
  /// In en, this message translates to:
  /// **'Bad'**
  String get sessionReportDialogBadOption;

  /// No description provided for @sessionReportDialogDescription.
  ///
  /// In en, this message translates to:
  /// **'Select the option that better describes the session performance'**
  String get sessionReportDialogDescription;

  /// No description provided for @sessionReportDialogGoodOption.
  ///
  /// In en, this message translates to:
  /// **'Good'**
  String get sessionReportDialogGoodOption;

  /// No description provided for @sessionReportDialogNormalOption.
  ///
  /// In en, this message translates to:
  /// **'Normal'**
  String get sessionReportDialogNormalOption;

  /// No description provided for @sessionReportDialogPerformanceExplanationHintText.
  ///
  /// In en, this message translates to:
  /// **'Your explanation'**
  String get sessionReportDialogPerformanceExplanationHintText;

  /// No description provided for @sessionReportDialogPerformanceExplanationTitle.
  ///
  /// In en, this message translates to:
  /// **'Performance explanation (optional)'**
  String get sessionReportDialogPerformanceExplanationTitle;

  /// No description provided for @sessionReportDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'How was the session'**
  String get sessionReportDialogTitle;

  /// No description provided for @settingsScreenBarTitleDbRepair.
  ///
  /// In en, this message translates to:
  /// **'Repair ICD database'**
  String get settingsScreenBarTitleDbRepair;

  /// No description provided for @settingsScreenBarTitleInformation.
  ///
  /// In en, this message translates to:
  /// **'My information'**
  String get settingsScreenBarTitleInformation;

  /// No description provided for @settingsScreenPersonalInfoUpdatePassword.
  ///
  /// In en, this message translates to:
  /// **'Update password'**
  String get settingsScreenPersonalInfoUpdatePassword;

  /// No description provided for @supportFeedbackDescription.
  ///
  /// In en, this message translates to:
  /// **'Please, tell us what you think'**
  String get supportFeedbackDescription;

  /// No description provided for @supportFeedbackSendButton.
  ///
  /// In en, this message translates to:
  /// **'Send feedback'**
  String get supportFeedbackSendButton;

  /// No description provided for @supportFeedbackSuccess.
  ///
  /// In en, this message translates to:
  /// **'Tell us your opinion!'**
  String get supportFeedbackSuccess;

  /// No description provided for @supportFeedbackTitle.
  ///
  /// In en, this message translates to:
  /// **'Feedback'**
  String get supportFeedbackTitle;

  /// No description provided for @supportReportDescription.
  ///
  /// In en, this message translates to:
  /// **'Please, describe your error'**
  String get supportReportDescription;

  /// No description provided for @supportReportErrorAknowledgement.
  ///
  /// In en, this message translates to:
  /// **'Thanks for your constribution! We hope to solve your issue as soon as the next version arrives'**
  String get supportReportErrorAknowledgement;

  /// No description provided for @supportReportErrorDescription.
  ///
  /// In en, this message translates to:
  /// **'This report is not going to receive any followup and will bw used to identify common/critical issues to be solved in future versions'**
  String get supportReportErrorDescription;

  /// No description provided for @supportReportErrorHint.
  ///
  /// In en, this message translates to:
  /// **'Please, describe your issue as detailed as possible'**
  String get supportReportErrorHint;

  /// No description provided for @supportReportErrorSent.
  ///
  /// In en, this message translates to:
  /// **'Report sent'**
  String get supportReportErrorSent;

  /// No description provided for @supportReportSendButton.
  ///
  /// In en, this message translates to:
  /// **'Send report'**
  String get supportReportSendButton;

  /// No description provided for @supportReportSuccess.
  ///
  /// In en, this message translates to:
  /// **'Tell us your opinion!'**
  String get supportReportSuccess;

  /// No description provided for @supportReportTitle.
  ///
  /// In en, this message translates to:
  /// **'Error report'**
  String get supportReportTitle;

  /// No description provided for @taskMenuAddButton.
  ///
  /// In en, this message translates to:
  /// **'Add to-do'**
  String get taskMenuAddButton;

  /// No description provided for @tasksMenuTitle.
  ///
  /// In en, this message translates to:
  /// **'To-do'**
  String get tasksMenuTitle;

  /// No description provided for @telemetryDialogAcceptMessage.
  ///
  /// In en, this message translates to:
  /// **'Thanks, The telemetry will be enabled'**
  String get telemetryDialogAcceptMessage;

  /// No description provided for @telemetryDialogDescription.
  ///
  /// In en, this message translates to:
  /// **'If you accept, you will help us understand the use of Aronnax, set priorities for implementing features, and track bugs through anonymous and respectful data regarding your activity.'**
  String get telemetryDialogDescription;

  /// No description provided for @telemetryDialogRejectMessage.
  ///
  /// In en, this message translates to:
  /// **'Understood, The telemetry will not be enabled'**
  String get telemetryDialogRejectMessage;

  /// No description provided for @telemetryDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Would you like to enable telemetry?'**
  String get telemetryDialogTitle;

  /// No description provided for @testsMenuAlert.
  ///
  /// In en, this message translates to:
  /// **'Soon'**
  String get testsMenuAlert;

  /// No description provided for @testsMenuTitle.
  ///
  /// In en, this message translates to:
  /// **'Tests'**
  String get testsMenuTitle;

  /// No description provided for @todoCreateTodoAdd.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get todoCreateTodoAdd;

  /// No description provided for @todoCreateTodoCategory.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get todoCreateTodoCategory;

  /// No description provided for @todoCreateTodoCategoryListEmpty.
  ///
  /// In en, this message translates to:
  /// **'Here you will see your categories'**
  String get todoCreateTodoCategoryListEmpty;

  /// No description provided for @todoCreateTodoDescriptionPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get todoCreateTodoDescriptionPlaceholder;

  /// No description provided for @todoCreateTodoPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'New To-do'**
  String get todoCreateTodoPlaceholder;

  /// No description provided for @todoCreateTodoSave.
  ///
  /// In en, this message translates to:
  /// **'Save To-do'**
  String get todoCreateTodoSave;

  /// No description provided for @todoCreateTodoTitle.
  ///
  /// In en, this message translates to:
  /// **'Create To-do'**
  String get todoCreateTodoTitle;

  /// No description provided for @treatmentPlanCompoentRequiredFalse.
  ///
  /// In en, this message translates to:
  /// **'Optional'**
  String get treatmentPlanCompoentRequiredFalse;

  /// No description provided for @treatmentPlanCompoentRequiredTrue.
  ///
  /// In en, this message translates to:
  /// **'Required'**
  String get treatmentPlanCompoentRequiredTrue;

  /// No description provided for @treatmentPlanComponentAddButtonTitle.
  ///
  /// In en, this message translates to:
  /// **'Add component'**
  String get treatmentPlanComponentAddButtonTitle;

  /// No description provided for @treatmentPlanComponentDescriptionFieldDescription.
  ///
  /// In en, this message translates to:
  /// **'Optional description'**
  String get treatmentPlanComponentDescriptionFieldDescription;

  /// No description provided for @treatmentPlanComponentListOfValues.
  ///
  /// In en, this message translates to:
  /// **'List of values'**
  String get treatmentPlanComponentListOfValues;

  /// No description provided for @treatmentPlanComponentListOfValuesLabel.
  ///
  /// In en, this message translates to:
  /// **'Label'**
  String get treatmentPlanComponentListOfValuesLabel;

  /// No description provided for @treatmentPlanComponentListOfValuesValue.
  ///
  /// In en, this message translates to:
  /// **'Value'**
  String get treatmentPlanComponentListOfValuesValue;

  /// No description provided for @treatmentPlanComponentListOptionsNonNumericScale.
  ///
  /// In en, this message translates to:
  /// **'Non-numeric scale'**
  String get treatmentPlanComponentListOptionsNonNumericScale;

  /// No description provided for @treatmentPlanComponentListOptionsNumericMaxOptions.
  ///
  /// In en, this message translates to:
  /// **'Maximum value'**
  String get treatmentPlanComponentListOptionsNumericMaxOptions;

  /// No description provided for @treatmentPlanComponentListOptionsNumericScale.
  ///
  /// In en, this message translates to:
  /// **'Numeric scale'**
  String get treatmentPlanComponentListOptionsNumericScale;

  /// No description provided for @treatmentPlanComponentListOptionsSaveTitle.
  ///
  /// In en, this message translates to:
  /// **'Add options list'**
  String get treatmentPlanComponentListOptionsSaveTitle;

  /// No description provided for @treatmentPlanComponentListOptionsTextOptionHint.
  ///
  /// In en, this message translates to:
  /// **'Write something'**
  String get treatmentPlanComponentListOptionsTextOptionHint;

  /// No description provided for @treatmentPlanComponentQuantifiableFalse.
  ///
  /// In en, this message translates to:
  /// **'Not quantifiable'**
  String get treatmentPlanComponentQuantifiableFalse;

  /// No description provided for @treatmentPlanComponentQuantifiableTrue.
  ///
  /// In en, this message translates to:
  /// **'Quantifiable'**
  String get treatmentPlanComponentQuantifiableTrue;

  /// No description provided for @treatmentPlanComponentRequiredField.
  ///
  /// In en, this message translates to:
  /// **'Required field'**
  String get treatmentPlanComponentRequiredField;

  /// No description provided for @treatmentPlanComponentSelectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Field type'**
  String get treatmentPlanComponentSelectionTitle;

  /// No description provided for @treatmentPlanComponentTitleFieldDescription.
  ///
  /// In en, this message translates to:
  /// **'Field title'**
  String get treatmentPlanComponentTitleFieldDescription;

  /// No description provided for @treatmentPlanComponentTypeScale.
  ///
  /// In en, this message translates to:
  /// **'Scale'**
  String get treatmentPlanComponentTypeScale;

  /// No description provided for @treatmentPlanComponentTypeSelection.
  ///
  /// In en, this message translates to:
  /// **'Selection'**
  String get treatmentPlanComponentTypeSelection;

  /// No description provided for @treatmentPlanComponentTypeTask.
  ///
  /// In en, this message translates to:
  /// **'Task'**
  String get treatmentPlanComponentTypeTask;

  /// No description provided for @treatmentPlanComponentTypeTextField.
  ///
  /// In en, this message translates to:
  /// **'Text field'**
  String get treatmentPlanComponentTypeTextField;

  /// No description provided for @treatmentPlanCreationButtonTitleSave.
  ///
  /// In en, this message translates to:
  /// **'Save treatment plan'**
  String get treatmentPlanCreationButtonTitleSave;

  /// No description provided for @treatmentPlanCreationButtonTitleUpdate.
  ///
  /// In en, this message translates to:
  /// **'Update treatment plan'**
  String get treatmentPlanCreationButtonTitleUpdate;

  /// No description provided for @treatmentPlanCreationError.
  ///
  /// In en, this message translates to:
  /// **'There must be at least one section!'**
  String get treatmentPlanCreationError;

  /// No description provided for @treatmentPlanCreationErrorNoSelectedComponent.
  ///
  /// In en, this message translates to:
  /// **'You have no selected any component'**
  String get treatmentPlanCreationErrorNoSelectedComponent;

  /// No description provided for @treatmentPlanCreationErrorNoTitleDescription.
  ///
  /// In en, this message translates to:
  /// **'You must set a title and description'**
  String get treatmentPlanCreationErrorNoTitleDescription;

  /// No description provided for @treatmentPlanCreationMessageTreamentPlanCreated.
  ///
  /// In en, this message translates to:
  /// **'Treatment plan created'**
  String get treatmentPlanCreationMessageTreamentPlanCreated;

  /// No description provided for @treatmentPlanCreationMessageTreamentPlanUpdated.
  ///
  /// In en, this message translates to:
  /// **'Treatment plan updated'**
  String get treatmentPlanCreationMessageTreamentPlanUpdated;

  /// No description provided for @treatmentPlanCreationTitleAddSection.
  ///
  /// In en, this message translates to:
  /// **'Add section'**
  String get treatmentPlanCreationTitleAddSection;

  /// No description provided for @treatmentPlanCreationTitleNewComponent.
  ///
  /// In en, this message translates to:
  /// **'New component'**
  String get treatmentPlanCreationTitleNewComponent;

  /// No description provided for @treatmentPlanListDeleteConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Treatment plan deleted'**
  String get treatmentPlanListDeleteConfirmation;

  /// No description provided for @treatmentPlanListFileExportedPath.
  ///
  /// In en, this message translates to:
  /// **'File exported path'**
  String get treatmentPlanListFileExportedPath;

  /// No description provided for @treatmentPlanListNumberOfPhases.
  ///
  /// In en, this message translates to:
  /// **'Number of phases'**
  String get treatmentPlanListNumberOfPhases;

  /// No description provided for @treatmentPlanMetadataDescriptionHint.
  ///
  /// In en, this message translates to:
  /// **'Treatment plan description'**
  String get treatmentPlanMetadataDescriptionHint;

  /// No description provided for @treatmentPlanScreenImportConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Imported treatment plan'**
  String get treatmentPlanScreenImportConfirmation;

  /// No description provided for @treatmentPlanScreenOptionImport.
  ///
  /// In en, this message translates to:
  /// **'Import treatment plan'**
  String get treatmentPlanScreenOptionImport;

  /// No description provided for @treatmentPlanScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Add treatment plan'**
  String get treatmentPlanScreenTitle;

  /// No description provided for @treatmentPlansInformationBody.
  ///
  /// In en, this message translates to:
  /// **'Create personalized treatment plans in phased forms to monitor and track your patient\'s progress towards specific treatment objectives'**
  String get treatmentPlansInformationBody;

  /// No description provided for @treatmentPlansInformationTitle.
  ///
  /// In en, this message translates to:
  /// **'Information'**
  String get treatmentPlansInformationTitle;

  /// No description provided for @treatmentPlansMenuTitle.
  ///
  /// In en, this message translates to:
  /// **'Treatment plans'**
  String get treatmentPlansMenuTitle;

  /// No description provided for @treatmentPlansSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Section'**
  String get treatmentPlansSectionTitle;

  /// No description provided for @treatmentPlansTemplateTile.
  ///
  /// In en, this message translates to:
  /// **'New treatment plan'**
  String get treatmentPlansTemplateTile;

  /// No description provided for @treatmentPlanUpdateDialogFieldDescription.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get treatmentPlanUpdateDialogFieldDescription;

  /// No description provided for @treatmentPlanUpdateDialogFieldDescriptionHint.
  ///
  /// In en, this message translates to:
  /// **'Optional description'**
  String get treatmentPlanUpdateDialogFieldDescriptionHint;

  /// No description provided for @treatmentPlanUpdateDialogFieldListOfValues.
  ///
  /// In en, this message translates to:
  /// **'List of values'**
  String get treatmentPlanUpdateDialogFieldListOfValues;

  /// No description provided for @treatmentPlanUpdateDialogFieldListOfValuesLabelOption.
  ///
  /// In en, this message translates to:
  /// **'Label'**
  String get treatmentPlanUpdateDialogFieldListOfValuesLabelOption;

  /// No description provided for @treatmentPlanUpdateDialogFieldListOfValuesValueOption.
  ///
  /// In en, this message translates to:
  /// **'Value'**
  String get treatmentPlanUpdateDialogFieldListOfValuesValueOption;

  /// No description provided for @treatmentPlanUpdateDialogFieldMessurableTitle.
  ///
  /// In en, this message translates to:
  /// **'Messurable'**
  String get treatmentPlanUpdateDialogFieldMessurableTitle;

  /// No description provided for @treatmentPlanUpdateDialogFieldNotMessurableTitle.
  ///
  /// In en, this message translates to:
  /// **'Not messurable'**
  String get treatmentPlanUpdateDialogFieldNotMessurableTitle;

  /// No description provided for @treatmentPlanUpdateDialogFieldRequiredFieldOptionOptional.
  ///
  /// In en, this message translates to:
  /// **'Optional'**
  String get treatmentPlanUpdateDialogFieldRequiredFieldOptionOptional;

  /// No description provided for @treatmentPlanUpdateDialogFieldRequiredFieldOptionRequired.
  ///
  /// In en, this message translates to:
  /// **'Required'**
  String get treatmentPlanUpdateDialogFieldRequiredFieldOptionRequired;

  /// No description provided for @treatmentPlanUpdateDialogFieldRequiredFieldTitle.
  ///
  /// In en, this message translates to:
  /// **'Required field'**
  String get treatmentPlanUpdateDialogFieldRequiredFieldTitle;

  /// No description provided for @treatmentPlanUpdateDialogFieldTitle.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get treatmentPlanUpdateDialogFieldTitle;

  /// No description provided for @treatmentPlanUpdateDialogFieldTitleHint.
  ///
  /// In en, this message translates to:
  /// **'Statement for this field'**
  String get treatmentPlanUpdateDialogFieldTitleHint;

  /// No description provided for @treatmentPlanUpdateDialogFieldTypeTitle.
  ///
  /// In en, this message translates to:
  /// **'Field type'**
  String get treatmentPlanUpdateDialogFieldTypeTitle;

  /// No description provided for @treatmentPlanUpdateDialogOptionMultipleSelection.
  ///
  /// In en, this message translates to:
  /// **'Multiple selection'**
  String get treatmentPlanUpdateDialogOptionMultipleSelection;

  /// No description provided for @treatmentPlanUpdateDialogOptionScale.
  ///
  /// In en, this message translates to:
  /// **'Scale'**
  String get treatmentPlanUpdateDialogOptionScale;

  /// No description provided for @treatmentPlanUpdateDialogOptionTask.
  ///
  /// In en, this message translates to:
  /// **'Task'**
  String get treatmentPlanUpdateDialogOptionTask;

  /// No description provided for @treatmentPlanUpdateDialogOptionTextField.
  ///
  /// In en, this message translates to:
  /// **'Text field'**
  String get treatmentPlanUpdateDialogOptionTextField;

  /// No description provided for @treatmentPlanUpdateDialogUpdateButtonTitle.
  ///
  /// In en, this message translates to:
  /// **'Update component'**
  String get treatmentPlanUpdateDialogUpdateButtonTitle;

  /// No description provided for @tryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get tryAgain;

  /// No description provided for @underage.
  ///
  /// In en, this message translates to:
  /// **'Underage'**
  String get underage;

  /// No description provided for @welcomeScreenAlmostDone.
  ///
  /// In en, this message translates to:
  /// **'You\'re almost there!'**
  String get welcomeScreenAlmostDone;

  /// No description provided for @welcomeScreenConfigureNewServer.
  ///
  /// In en, this message translates to:
  /// **'Configure a new server'**
  String get welcomeScreenConfigureNewServer;

  /// No description provided for @welcomeScreenConfigureNewServerDescription.
  ///
  /// In en, this message translates to:
  /// **'If you\'re using Aronnax for the first time, choose this option, and we\'ll set everything up for you.'**
  String get welcomeScreenConfigureNewServerDescription;

  /// No description provided for @welcomeScreenConfirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Your Password'**
  String get welcomeScreenConfirmPassword;

  /// No description provided for @welcomeScreenConnectToExistingServer.
  ///
  /// In en, this message translates to:
  /// **'Connect to an existing server'**
  String get welcomeScreenConnectToExistingServer;

  /// No description provided for @welcomeScreenConnectToExistingServerDescription.
  ///
  /// In en, this message translates to:
  /// **'If you\'ve already used and configured Aronnax for your team or yourself, choose this option to connect.'**
  String get welcomeScreenConnectToExistingServerDescription;

  /// No description provided for @welcomeScreenCreateAccountLocal.
  ///
  /// In en, this message translates to:
  /// **'Create Local Account'**
  String get welcomeScreenCreateAccountLocal;

  /// No description provided for @welcomeScreenCreateDatabaseAndContinue.
  ///
  /// In en, this message translates to:
  /// **'Create database and continue'**
  String get welcomeScreenCreateDatabaseAndContinue;

  /// No description provided for @welcomeScreenDatabaseConfigured.
  ///
  /// In en, this message translates to:
  /// **'Your database has been configured! It\'s time to create it on the server.'**
  String get welcomeScreenDatabaseConfigured;

  /// No description provided for @welcomeScreenDatabaseDescription.
  ///
  /// In en, this message translates to:
  /// **'Aronnax requires a database to store all the information you record in your consultations. You can either connect to an external server with a pre-configured SQL database or simply store the database directly on your computer.'**
  String get welcomeScreenDatabaseDescription;

  /// No description provided for @welcomeScreenErrorPasswordLenght.
  ///
  /// In en, this message translates to:
  /// **'The password must have at least eight characters.'**
  String get welcomeScreenErrorPasswordLenght;

  /// No description provided for @welcomeScreenFinishConfigFinish.
  ///
  /// In en, this message translates to:
  /// **'That\'s it'**
  String get welcomeScreenFinishConfigFinish;

  /// No description provided for @welcomeScreenFinishConfigImageDescription.
  ///
  /// In en, this message translates to:
  /// **'Now you can log in and start improving the quality of life for your clients.'**
  String get welcomeScreenFinishConfigImageDescription;

  /// No description provided for @welcomeScreenFinishConfigStartUsingAronnax.
  ///
  /// In en, this message translates to:
  /// **'Start using Aronnax'**
  String get welcomeScreenFinishConfigStartUsingAronnax;

  /// No description provided for @welcomeScreenImageDescription.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Aronnax, a patient and clinical history management software for psychologists. Before we get started, you need to configure the database where Aronnax will store all the information about your clients.'**
  String get welcomeScreenImageDescription;

  /// No description provided for @welcomeScreenLastNames.
  ///
  /// In en, this message translates to:
  /// **'Last Names'**
  String get welcomeScreenLastNames;

  /// No description provided for @welcomeScreenMessage.
  ///
  /// In en, this message translates to:
  /// **'Let\'s configure some things'**
  String get welcomeScreenMessage;

  /// No description provided for @welcomeScreenNames.
  ///
  /// In en, this message translates to:
  /// **'Names'**
  String get welcomeScreenNames;

  /// No description provided for @welcomeScreenPersonalID.
  ///
  /// In en, this message translates to:
  /// **'Personal Identification Number'**
  String get welcomeScreenPersonalID;

  /// No description provided for @welcomeScreenPinDescription.
  ///
  /// In en, this message translates to:
  /// **'Your PIN (Single-use generated number for recovering your account)'**
  String get welcomeScreenPinDescription;

  /// No description provided for @welcomeScreenProfessionalID.
  ///
  /// In en, this message translates to:
  /// **'Professional ID'**
  String get welcomeScreenProfessionalID;

  /// No description provided for @welcomeScreenRegeneratePin.
  ///
  /// In en, this message translates to:
  /// **'Regenerate PIN'**
  String get welcomeScreenRegeneratePin;

  /// No description provided for @welcomeScreenRememberData.
  ///
  /// In en, this message translates to:
  /// **'Remember, your data will be saved in your computer\'s documents folder. Make regular backups of the \'aronnax_localDB.sqlite\' file. Any damage or loss will result in irrecoverable data.'**
  String get welcomeScreenRememberData;

  /// No description provided for @welcomeScreenSecurityQuestion.
  ///
  /// In en, this message translates to:
  /// **'Security Question'**
  String get welcomeScreenSecurityQuestion;

  /// No description provided for @welcomeScreenSecurityQuestionDescription.
  ///
  /// In en, this message translates to:
  /// **'You must remember this question if you lose your password'**
  String get welcomeScreenSecurityQuestionDescription;

  /// No description provided for @welcomeScreenSelectCountry.
  ///
  /// In en, this message translates to:
  /// **'Select your country'**
  String get welcomeScreenSelectCountry;

  /// No description provided for @welcomeScreenStartButton.
  ///
  /// In en, this message translates to:
  /// **'Let\'s go!'**
  String get welcomeScreenStartButton;

  /// No description provided for @welcomeScreenStoreInfoOnMyComputer.
  ///
  /// In en, this message translates to:
  /// **'I will store the information on my computer.'**
  String get welcomeScreenStoreInfoOnMyComputer;

  /// No description provided for @welcomeScreenUsername.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get welcomeScreenUsername;

  /// No description provided for @welcomeScreenWelcomeGreeting.
  ///
  /// In en, this message translates to:
  /// **'Hello, {name}!'**
  String welcomeScreenWelcomeGreeting(String name);

  /// No description provided for @welcomeScreenWhatToDo.
  ///
  /// In en, this message translates to:
  /// **'What do you want to do?'**
  String get welcomeScreenWhatToDo;

  /// No description provided for @welcomeScreenYourAddress.
  ///
  /// In en, this message translates to:
  /// **'Your Address'**
  String get welcomeScreenYourAddress;

  /// No description provided for @welcomeScreenYourAnswer.
  ///
  /// In en, this message translates to:
  /// **'Your Answer'**
  String get welcomeScreenYourAnswer;

  /// No description provided for @welcomeScreenYourEmail.
  ///
  /// In en, this message translates to:
  /// **'Your Email'**
  String get welcomeScreenYourEmail;

  /// No description provided for @welcomeScreenYourPassword.
  ///
  /// In en, this message translates to:
  /// **'Your Password'**
  String get welcomeScreenYourPassword;

  /// No description provided for @menuGreetMorning.
  ///
  /// In en, this message translates to:
  /// **'Good morning {name}!'**
  String menuGreetMorning(Object name);

  /// No description provided for @menuGreetAfternoon.
  ///
  /// In en, this message translates to:
  /// **'Good afternoon {name}!'**
  String menuGreetAfternoon(Object name);

  /// No description provided for @menuGreetEvening.
  ///
  /// In en, this message translates to:
  /// **'Good evening {name}!'**
  String menuGreetEvening(Object name);

  /// No description provided for @icdSelectorTitle.
  ///
  /// In en, this message translates to:
  /// **'ICD-11 diagnostic code selector'**
  String get icdSelectorTitle;

  /// No description provided for @icdSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Filter elements in'**
  String get icdSearchHint;

  /// No description provided for @icdOpenBrowser.
  ///
  /// In en, this message translates to:
  /// **'See more about'**
  String get icdOpenBrowser;

  /// No description provided for @updateItemTitle.
  ///
  /// In en, this message translates to:
  /// **'There is an update available'**
  String get updateItemTitle;

  /// No description provided for @updateItemGetButton.
  ///
  /// In en, this message translates to:
  /// **'Get the update'**
  String get updateItemGetButton;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
