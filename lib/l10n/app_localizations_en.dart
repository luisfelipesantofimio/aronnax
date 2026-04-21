// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get calendarEventCreationConfirmationText => 'Event created';

  @override
  String get calendarEventDeleted => 'Event removed';

  @override
  String get calendarEventEmpty => 'There are not events for this day.';

  @override
  String get calendarEventFormDate => 'Date';

  @override
  String get calendarEventFormDescription => 'Event description';

  @override
  String get calendarEventFormErrorInvalidNumberOfWeeks => 'Invalid value';

  @override
  String get calendarEventFormErrorNoOptionsSelected =>
      'You must select a status and a type of event';

  @override
  String get calendarEventFormErrorNoPatientSelected =>
      'You must select a patient';

  @override
  String get calendarEventFormNumberOfWeeks => 'Number of weeks';

  @override
  String get calendarEventFormTime => 'Time';

  @override
  String get calendarEventGlobalTitleCreate => 'Schedule event';

  @override
  String get calendarEventGlobalTitleUpdate => 'Update event';

  @override
  String get calendarEventIndividualEvent => 'Individual event';

  @override
  String get calendarEventMultideleteDialogDeleteConfirmation =>
      'events deleted';

  @override
  String get calendarEventMultideleteDialogDescription =>
      'Are you sure you want to delete all events?';

  @override
  String get calendarEventMultideleteTitle => 'Delete all related events';

  @override
  String get calendarEventScheduleButtonTitle => 'Schedule';

  @override
  String get calendarEventStatusCanceled => 'Canceled';

  @override
  String get calendarEventStatusDone => 'Done';

  @override
  String get calendarEventStatusScheduled => 'Scheduled';

  @override
  String get calendarEventStatusTitle => 'Event status';

  @override
  String get calendarEventTypeConsultation => 'Consultation';

  @override
  String get calendarEventTypeFollowUp => 'Follow-up';

  @override
  String get calendarEventTypeMeeting => 'Meeting';

  @override
  String get calendarEventTypeTitle => 'Event type';

  @override
  String get calendarEventUpdateConfirmationText => 'Event updated';

  @override
  String get calendarEventWeeklyEvent => 'Weekly event';

  @override
  String get caseCreationFormHintConsultationReason => 'Consultation reason';

  @override
  String get caseCreationFormSaveConfirmation => 'Case saved';

  @override
  String get caseCreationFormSearchIcdCode => 'Search ICD code';

  @override
  String get caseCreationFormSelectTreatment => 'Select a treatment plan';

  @override
  String get caseCreationFormTitleAdd => 'Add new treatment plan';

  @override
  String get caseCreationFormTitleDiagnostic => 'Diagnostic impression';

  @override
  String get caseCreationFormTitleSelectedDiagnostic => 'Selected diagnostic';

  @override
  String get caseCreationFormTitleTreatmentProposotion =>
      'Treatment proposition';

  @override
  String get caseCreationTitle => 'New case';

  @override
  String get caseCreationWithoutTreatment => 'Case without treatment plan';

  @override
  String get caseCreationWithTreatment => 'Case with treatment plan';

  @override
  String get caseDiagnosticIcdDataEmpty => 'The ICD diagnostic data is empty';

  @override
  String get caseDiagnosticIcdDescription =>
      'If you want to assing the ICD code for your diagnostic impression, you must download the required data from the ICD provider. This process can take a few minutes. Be patient.';

  @override
  String get caseDiagnosticSearchTerm => 'Search any term';

  @override
  String get caseDiagnosticTermNotFound => 'Term not found';

  @override
  String get clinicHistoryFormFamilyHistory => 'Family history';

  @override
  String get clinicHistoryFormMedAntecedents => 'Medical antecedents';

  @override
  String get clinicHistoryFormMentalExamination => 'Mental examination';

  @override
  String get clinicHistoryFormPersonalHistory => 'Personal history';

  @override
  String get clinicHistoryFormPsyAntecedents => 'Psychological antecedents';

  @override
  String get clinicHistoryInfoCreationDate => 'Creation date';

  @override
  String get clinicHistoryInfoPatientName => 'Patient name';

  @override
  String get clinicHistoryInfoProfessionalName => 'Professional';

  @override
  String get clinicHistoryInfoRecordCode => 'Record unique code';

  @override
  String get clinicHistorySaveConfirmation => 'Saved record';

  @override
  String get clinicHistorySaveRegister => 'Save record';

  @override
  String get clinicHistoryTitle => 'Record';

  @override
  String get continueButton => 'Continue';

  @override
  String get disabled => 'Disabled';

  @override
  String get errorEmptyField => 'The field is empty';

  @override
  String get friend => 'Friend';

  @override
  String get genericAccept => 'Accept';

  @override
  String get genericCancel => 'Cancel';

  @override
  String get genericCase => 'Case';

  @override
  String genericCopyMessage(String item) {
    return 'Copy $item';
  }

  @override
  String get genericDelete => 'Delete';

  @override
  String get genericDescription => 'Description';

  @override
  String get genericDiagnostic => 'Diagnostic';

  @override
  String get genericEdit => 'Edit';

  @override
  String get genericEmptyData => 'No data to show';

  @override
  String get genericErrorMessage => 'Something went wrong';

  @override
  String get genericErrorPasswordsDontMatch => 'The passwords don´t match';

  @override
  String genericMinimumCharacters(String amount) {
    return 'Minimum $amount characters';
  }

  @override
  String get genericNoDescription => 'No description';

  @override
  String get genericNotes => 'Notes';

  @override
  String get genericPatientNameTitle => 'Patient name';

  @override
  String get genericPatientSelectionTitlte => 'Select a patient';

  @override
  String get genericPatientTitle => 'Patient';

  @override
  String get genericSaveTitle => 'Save';

  @override
  String get genericSelectionText => 'Select an option';

  @override
  String get genericSelectTitle => 'Select';

  @override
  String get genericSend => 'Send';

  @override
  String get genericSession => 'Session';

  @override
  String get genericSupport => 'Support';

  @override
  String get genericThanks => 'Thanks';

  @override
  String get genericThisWasPrefix => 'This was a';

  @override
  String get genericTitle => 'Title';

  @override
  String get genericTitleYourTitle => 'Your title';

  @override
  String get genericTreatmentPlan => 'Treatment plan';

  @override
  String get helpScreenAronnaxPoweredBy => 'Aronnax is powered by Flutter';

  @override
  String get helpScreenDescriptionText =>
      'A patient and medical records management software, minimalist and efficient.\nMade by psychologists, for psychologists.';

  @override
  String get helpScreenDevelopedBy => 'Developed by';

  @override
  String get helpScreenLegalInformationTitle => 'Legal information';

  @override
  String get helpScreenTitle => 'Development information';

  @override
  String get icdDataRepairConfirmation => 'Repair completed';

  @override
  String get icdDataRepairDescription =>
      'If there was an error during the ICD data download process, you can fix it here.';

  @override
  String get icdDataRepairTitle => 'Repair ICD database';

  @override
  String get icdLoadingDescription =>
      'Aronnax is creating a local copy of the International Classification of Diseases 11th Revision, using the WHO API for helping you in your diagnostic impressions. This can take a few minutes.';

  @override
  String get icdLoadingTitle => 'Be patient';

  @override
  String get icdSuccess => 'Done!';

  @override
  String get icdSuccessDescription =>
      'You have a copy of the ICD-11 for your use';

  @override
  String get loginErrorEmptyPassword => 'Insert your password';

  @override
  String get loginErrorEmptyUsername => 'Insert your username';

  @override
  String get loginErrorIncorrectPassword => 'Invalid password';

  @override
  String get loginErrorUserDontExist => 'This user does not exist';

  @override
  String get loginHintUsername => 'Write your registered user name';

  @override
  String get loginLabelPassword => 'User name';

  @override
  String get loginTitle => 'Login';

  @override
  String get loginUsername => 'User name';

  @override
  String get loginUserPassword => 'Password';

  @override
  String get loginUserPasswordDefined => 'Password for';

  @override
  String get loginUserPasswordRecover => 'Forgot your password?';

  @override
  String get mainMenuAddEventTooltip => 'Add event';

  @override
  String get mainMenuEventsForDefinedDate => 'Events for';

  @override
  String get mainMenuEventsForToday => 'Events for today';

  @override
  String mainMenuOptionsBarAlertCaseNotFound(String patientNames) {
    return 'This user does not have any open case. Go to ${patientNames}s profile and create or enable a case.';
  }

  @override
  String get mainMenuOptionsBarPatientSelectionDialogTitle =>
      'Select the patient';

  @override
  String get mainMenuOptionsBarTitleHelp => 'Help';

  @override
  String get mainMenuOptionsBarTitleMoreOptions => 'More options';

  @override
  String get mainMenuOptionsBarTitleRegisterConsultant => 'Register consultant';

  @override
  String get mainMenuOptionsBarTitleRegisterSignOut => 'Sign out';

  @override
  String get mainMenuOptionsBarTitleSettings => 'Settings';

  @override
  String get mainMenuOptionsBarTitleStartConsultation => 'Start consultation';

  @override
  String get other => 'Other';

  @override
  String get parent => 'Parent';

  @override
  String get partner => 'Partner';

  @override
  String get passwordRecoverCopyPin => 'Copy pin';

  @override
  String get passwordRecoverDialogErrorDontExist => 'The user does not exist';

  @override
  String get passwordRecoverDialogErrorEmpty => 'Insert your user name';

  @override
  String get passwordRecoverDialogHint => 'Your login user name';

  @override
  String get passwordRecoverDialogTitle => 'Please, insert your user name';

  @override
  String get passwordRecoverPinAnswerHint => 'Your pin';

  @override
  String get passwordRecoverPinInstructions =>
      'Insert your account\'s recover pin';

  @override
  String get passwordRecoverPinTitle =>
      'Your pin (Single use generated number for recovering your account)';

  @override
  String get passwordRecoverQuestionaryAdress => 'Select your home adress';

  @override
  String get passwordRecoverQuestionaryAnswerHint => 'Your answer';

  @override
  String get passwordRecoverQuestionaryEmail => 'Select your email adress';

  @override
  String get passwordRecoverQuestionaryInstructions =>
      'Answer the questions below to confirm your identity';

  @override
  String get passwordRecoverQuestionaryPasswordConfirmationAlert =>
      'Password updated';

  @override
  String get passwordRecoverQuestionaryPersonalId => 'Select your personal Id';

  @override
  String get passwordRecoverQuestionaryTitle => 'Personal data questionary';

  @override
  String get passwordRecoverQuestionaryUpdatePasswordTitle =>
      'Update your password';

  @override
  String get patientCaseActiveCase => 'Active case';

  @override
  String get patientCaseCloseDialogCloseButton => 'Close this case';

  @override
  String get patientCaseCloseDialogCloseConfirmation => 'Case closed';

  @override
  String get patientCaseCloseDialogCloseNoOptionError =>
      'You must select an option';

  @override
  String get patientCaseCloseDialogDescription =>
      'Please, choose an option that indicates the patient\'s condition upon completion of this process';

  @override
  String get patientCaseCloseDialogOptionalOutcome =>
      'Optional explanation of this case';

  @override
  String get patientCaseCloseDialogTitle => 'Close this case?';

  @override
  String get patientCaseDataOutcomeDialogTitle => 'Why this outcome?';

  @override
  String get patientCaseDeleteCase => 'Delete case';

  @override
  String get patientCaseDeleteDialogDeleteConfirmation => 'Case deleted';

  @override
  String get patientCaseDeleteDialogDescription =>
      'If you delete this case, you are going to lose all the related data to it, as sessions and treatment plan results';

  @override
  String get patientCaseDeleteDialogTitle => 'Delete this case?';

  @override
  String get patientCaseInactiveCase => 'Inactive case';

  @override
  String get patientCaseSeeCaseOutcome => 'See case outcome';

  @override
  String get patientCaseSeeCaseOutcomeTitle => 'Case outcome';

  @override
  String get patientCaseSessionEmptyList =>
      'There are no sessions related to this case';

  @override
  String get patientCaseSessionPerformanceExplanation =>
      'Explanation for this performance';

  @override
  String get patientCompanionReason => 'Reason for companion';

  @override
  String get patientCompanionRelation => 'Companion relation with patient';

  @override
  String get patientDataCaseCreateNew => 'Create new case';

  @override
  String get patientDataCaseDiagnosticCode => 'Diagnostic code';

  @override
  String get patientDataCaseEmpty => 'This patient has no open cases';

  @override
  String get patientDataCreateCase => 'Create case';

  @override
  String get patientDataCreateClinicalHistory => 'Create clinical history';

  @override
  String get patientDataDeletePatient => 'Delete patient';

  @override
  String patientDataExportConfirmation(String path) {
    return 'Patient data exported to: $path';
  }

  @override
  String get patientDataExportData => 'Export patient data';

  @override
  String get patientDataGoToPatientProfile => 'Go to patient profile';

  @override
  String get patientDataSeeResultsList => 'See results list';

  @override
  String get patientDataSeeSessions => 'See sessions';

  @override
  String get patientDataTitleActiveUser => 'Active user';

  @override
  String get patientDataTitleAdress => 'Adress';

  @override
  String get patientDataTitleClinicHistory => 'Clinical history';

  @override
  String get patientDataTitleContactNumber => 'Contact number';

  @override
  String get patientDataTitleEducationalAttainment => 'Educational attainment';

  @override
  String get patientDataTitleEmail => 'Email';

  @override
  String get patientDataTitleEmergencyContactName => 'Emergency contact name';

  @override
  String get patientDataTitleEmergencyContactNumber =>
      'Emergency contact number';

  @override
  String get patientDataTitleID => 'ID';

  @override
  String get patientDataTitleInactiveUser => 'Inactive user';

  @override
  String get patientDataTitleInsurance => 'Insurance';

  @override
  String get patientDataTitleOcupation => 'Ocupation';

  @override
  String get patientRegisterRequireCompanion => 'Patient requires companion?';

  @override
  String get patientsListMenuTitle => 'Patients list';

  @override
  String get profileNewPasswordConfirmationSuccess =>
      'Your password has been updated';

  @override
  String get profileNewPasswordCurrentPassword => 'Current password';

  @override
  String get profileNewPasswordNewPassword => 'New password';

  @override
  String get profileNewPasswordUpdateButton => 'Update password';

  @override
  String profileUpdatePasswordTitle(String user) {
    return 'Update $user\'s password';
  }

  @override
  String get registerBackButtonTitle => 'Back';

  @override
  String get registerErrorAlertTitle => 'Something went wrong';

  @override
  String get registerFormAdressField => 'Adress';

  @override
  String get registerFormContactNumberField => 'Contact number';

  @override
  String get registerFormEducationalAttainmentField => 'Educational attainment';

  @override
  String get registerFormEmailField => 'E-mail';

  @override
  String get registerFormEmergencyContanctNameField => 'Emergency contact name';

  @override
  String get registerFormEmergencyContanctNumberField =>
      'Emergency contact number';

  @override
  String get registerFormErrorEmail => 'Invalid email format';

  @override
  String get registerFormErrorUserExists => 'This user is already registered';

  @override
  String get registerFormFemaleOption => 'Female';

  @override
  String get registerFormIdentificationNumberField => 'Identification number';

  @override
  String get registerFormInsuranceField => 'Insurance';

  @override
  String get registerFormLastNamesField => 'Last name';

  @override
  String get registerFormMaleOption => 'Male';

  @override
  String get registerFormNamesField => 'Name';

  @override
  String get registerFormOcupationField => 'Ocupation';

  @override
  String get registerFormOtherOption => 'Other';

  @override
  String get registerFormSexField => 'Sex';

  @override
  String get registerFormTitle => 'Personal information';

  @override
  String get registerSaveButtonTitle => 'Save consultant';

  @override
  String get registerSuccessAlertTitle => 'Successfully registered consultant';

  @override
  String get registerTitle => 'Register consultant';

  @override
  String get relative => 'Relative';

  @override
  String get sessionFormAddNote => 'Add note';

  @override
  String get sessionFormBeginTreatmentPlan => 'Begin treatment plan';

  @override
  String get sessionFormBeginTreatmentPlanTaken =>
      'Treatment plan results already saved';

  @override
  String get sessionFormFieldSessionGoal => 'Session goal';

  @override
  String get sessionFormFieldSessionSummary => 'Session summary';

  @override
  String get sessionFormFieldTherapeuticArchievements =>
      'Therapeutic archievements';

  @override
  String get sessionFormNewSession => 'New session';

  @override
  String get sessionFormSaveSession => 'Save session';

  @override
  String get sessionFormStartTest => 'Start test';

  @override
  String get sessionFormStartTestSoon => 'Soon';

  @override
  String get sessionFormTask => 'Add task';

  @override
  String get sessionInformationDateTitle => 'Session date';

  @override
  String get sessionInformationPatientTitle => 'Patient';

  @override
  String get sessionNewNoteDialogDeleteNote => 'Delete note';

  @override
  String get sessionNewNoteDialogDeleteNoteConfirmation => 'Note deleted';

  @override
  String get sessionNewNoteDialogHintText => 'Aditional notes for this session';

  @override
  String get sessionNewNoteDialogSaveConfirmation => 'Note saved';

  @override
  String get sessionNewNoteDialogSaveTitle => 'Save note';

  @override
  String get sessionNewNoteDialogTitle => 'New note';

  @override
  String get sessionReportDialogBadOption => 'Bad';

  @override
  String get sessionReportDialogDescription =>
      'Select the option that better describes the session performance';

  @override
  String get sessionReportDialogGoodOption => 'Good';

  @override
  String get sessionReportDialogNormalOption => 'Normal';

  @override
  String get sessionReportDialogPerformanceExplanationHintText =>
      'Your explanation';

  @override
  String get sessionReportDialogPerformanceExplanationTitle =>
      'Performance explanation (optional)';

  @override
  String get sessionReportDialogTitle => 'How was the session';

  @override
  String get settingsScreenBarTitleDbRepair => 'Repair ICD database';

  @override
  String get settingsScreenBarTitleInformation => 'My information';

  @override
  String get settingsScreenPersonalInfoUpdatePassword => 'Update password';

  @override
  String get supportFeedbackDescription => 'Please, tell us what you think';

  @override
  String get supportFeedbackSendButton => 'Send feedback';

  @override
  String get supportFeedbackSuccess => 'Tell us your opinion!';

  @override
  String get supportFeedbackTitle => 'Feedback';

  @override
  String get supportReportDescription => 'Please, describe your error';

  @override
  String get supportReportErrorAknowledgement =>
      'Thanks for your constribution! We hope to solve your issue as soon as the next version arrives';

  @override
  String get supportReportErrorDescription =>
      'This report is not going to receive any followup and will bw used to identify common/critical issues to be solved in future versions';

  @override
  String get supportReportErrorHint =>
      'Please, describe your issue as detailed as possible';

  @override
  String get supportReportErrorSent => 'Report sent';

  @override
  String get supportReportSendButton => 'Send report';

  @override
  String get supportReportSuccess => 'Tell us your opinion!';

  @override
  String get supportReportTitle => 'Error report';

  @override
  String get taskMenuAddButton => 'Add to-do';

  @override
  String get tasksMenuTitle => 'To-do';

  @override
  String get telemetryDialogAcceptMessage =>
      'Thanks, The telemetry will be enabled';

  @override
  String get telemetryDialogDescription =>
      'If you accept, you will help us understand the use of Aronnax, set priorities for implementing features, and track bugs through anonymous and respectful data regarding your activity.';

  @override
  String get telemetryDialogRejectMessage =>
      'Understood, The telemetry will not be enabled';

  @override
  String get telemetryDialogTitle => 'Would you like to enable telemetry?';

  @override
  String get testsMenuAlert => 'Soon';

  @override
  String get testsMenuTitle => 'Tests';

  @override
  String get todoCreateTodoAdd => 'Add';

  @override
  String get todoCreateTodoCategory => 'Category';

  @override
  String get todoCreateTodoCategoryListEmpty =>
      'Here you will see your categories';

  @override
  String get todoCreateTodoDescriptionPlaceholder => 'Description';

  @override
  String get todoCreateTodoPlaceholder => 'New To-do';

  @override
  String get todoCreateTodoSave => 'Save To-do';

  @override
  String get todoCreateTodoTitle => 'Create To-do';

  @override
  String get treatmentPlanCompoentRequiredFalse => 'Optional';

  @override
  String get treatmentPlanCompoentRequiredTrue => 'Required';

  @override
  String get treatmentPlanComponentAddButtonTitle => 'Add component';

  @override
  String get treatmentPlanComponentDescriptionFieldDescription =>
      'Optional description';

  @override
  String get treatmentPlanComponentListOfValues => 'List of values';

  @override
  String get treatmentPlanComponentListOfValuesLabel => 'Label';

  @override
  String get treatmentPlanComponentListOfValuesValue => 'Value';

  @override
  String get treatmentPlanComponentListOptionsNonNumericScale =>
      'Non-numeric scale';

  @override
  String get treatmentPlanComponentListOptionsNumericMaxOptions =>
      'Maximum value';

  @override
  String get treatmentPlanComponentListOptionsNumericScale => 'Numeric scale';

  @override
  String get treatmentPlanComponentListOptionsSaveTitle => 'Add options list';

  @override
  String get treatmentPlanComponentListOptionsTextOptionHint =>
      'Write something';

  @override
  String get treatmentPlanComponentQuantifiableFalse => 'Not quantifiable';

  @override
  String get treatmentPlanComponentQuantifiableTrue => 'Quantifiable';

  @override
  String get treatmentPlanComponentRequiredField => 'Required field';

  @override
  String get treatmentPlanComponentSelectionTitle => 'Field type';

  @override
  String get treatmentPlanComponentTitleFieldDescription => 'Field title';

  @override
  String get treatmentPlanComponentTypeScale => 'Scale';

  @override
  String get treatmentPlanComponentTypeSelection => 'Selection';

  @override
  String get treatmentPlanComponentTypeTask => 'Task';

  @override
  String get treatmentPlanComponentTypeTextField => 'Text field';

  @override
  String get treatmentPlanCreationButtonTitleSave => 'Save treatment plan';

  @override
  String get treatmentPlanCreationButtonTitleUpdate => 'Update treatment plan';

  @override
  String get treatmentPlanCreationError =>
      'There must be at least one section!';

  @override
  String get treatmentPlanCreationErrorNoSelectedComponent =>
      'You have no selected any component';

  @override
  String get treatmentPlanCreationErrorNoTitleDescription =>
      'You must set a title and description';

  @override
  String get treatmentPlanCreationMessageTreamentPlanCreated =>
      'Treatment plan created';

  @override
  String get treatmentPlanCreationMessageTreamentPlanUpdated =>
      'Treatment plan updated';

  @override
  String get treatmentPlanCreationTitleAddSection => 'Add section';

  @override
  String get treatmentPlanCreationTitleNewComponent => 'New component';

  @override
  String get treatmentPlanListDeleteConfirmation => 'Treatment plan deleted';

  @override
  String get treatmentPlanListFileExportedPath => 'File exported path';

  @override
  String get treatmentPlanListNumberOfPhases => 'Number of phases';

  @override
  String get treatmentPlanMetadataDescriptionHint =>
      'Treatment plan description';

  @override
  String get treatmentPlanScreenImportConfirmation => 'Imported treatment plan';

  @override
  String get treatmentPlanScreenOptionImport => 'Import treatment plan';

  @override
  String get treatmentPlanScreenTitle => 'Add treatment plan';

  @override
  String get treatmentPlansInformationBody =>
      'Create personalized treatment plans in phased forms to monitor and track your patient\'s progress towards specific treatment objectives';

  @override
  String get treatmentPlansInformationTitle => 'Information';

  @override
  String get treatmentPlansMenuTitle => 'Treatment plans';

  @override
  String get treatmentPlansSectionTitle => 'Section';

  @override
  String get treatmentPlansTemplateTile => 'New treatment plan';

  @override
  String get treatmentPlanUpdateDialogFieldDescription => 'Description';

  @override
  String get treatmentPlanUpdateDialogFieldDescriptionHint =>
      'Optional description';

  @override
  String get treatmentPlanUpdateDialogFieldListOfValues => 'List of values';

  @override
  String get treatmentPlanUpdateDialogFieldListOfValuesLabelOption => 'Label';

  @override
  String get treatmentPlanUpdateDialogFieldListOfValuesValueOption => 'Value';

  @override
  String get treatmentPlanUpdateDialogFieldMessurableTitle => 'Messurable';

  @override
  String get treatmentPlanUpdateDialogFieldNotMessurableTitle =>
      'Not messurable';

  @override
  String get treatmentPlanUpdateDialogFieldRequiredFieldOptionOptional =>
      'Optional';

  @override
  String get treatmentPlanUpdateDialogFieldRequiredFieldOptionRequired =>
      'Required';

  @override
  String get treatmentPlanUpdateDialogFieldRequiredFieldTitle =>
      'Required field';

  @override
  String get treatmentPlanUpdateDialogFieldTitle => 'Title';

  @override
  String get treatmentPlanUpdateDialogFieldTitleHint =>
      'Statement for this field';

  @override
  String get treatmentPlanUpdateDialogFieldTypeTitle => 'Field type';

  @override
  String get treatmentPlanUpdateDialogOptionMultipleSelection =>
      'Multiple selection';

  @override
  String get treatmentPlanUpdateDialogOptionScale => 'Scale';

  @override
  String get treatmentPlanUpdateDialogOptionTask => 'Task';

  @override
  String get treatmentPlanUpdateDialogOptionTextField => 'Text field';

  @override
  String get treatmentPlanUpdateDialogUpdateButtonTitle => 'Update component';

  @override
  String get tryAgain => 'Try again';

  @override
  String get underage => 'Underage';

  @override
  String get welcomeScreenAlmostDone => 'You\'re almost there!';

  @override
  String get welcomeScreenConfigureNewServer => 'Configure a new server';

  @override
  String get welcomeScreenConfigureNewServerDescription =>
      'If you\'re using Aronnax for the first time, choose this option, and we\'ll set everything up for you.';

  @override
  String get welcomeScreenConfirmPassword => 'Confirm Your Password';

  @override
  String get welcomeScreenConnectToExistingServer =>
      'Connect to an existing server';

  @override
  String get welcomeScreenConnectToExistingServerDescription =>
      'If you\'ve already used and configured Aronnax for your team or yourself, choose this option to connect.';

  @override
  String get welcomeScreenCreateAccountLocal => 'Create Local Account';

  @override
  String get welcomeScreenCreateDatabaseAndContinue =>
      'Create database and continue';

  @override
  String get welcomeScreenDatabaseConfigured =>
      'Your database has been configured! It\'s time to create it on the server.';

  @override
  String get welcomeScreenDatabaseDescription =>
      'Aronnax requires a database to store all the information you record in your consultations. You can either connect to an external server with a pre-configured SQL database or simply store the database directly on your computer.';

  @override
  String get welcomeScreenErrorPasswordLenght =>
      'The password must have at least eight characters.';

  @override
  String get welcomeScreenFinishConfigFinish => 'That\'s it';

  @override
  String get welcomeScreenFinishConfigImageDescription =>
      'Now you can log in and start improving the quality of life for your clients.';

  @override
  String get welcomeScreenFinishConfigStartUsingAronnax =>
      'Start using Aronnax';

  @override
  String get welcomeScreenImageDescription =>
      'Welcome to Aronnax, a patient and clinical history management software for psychologists. Before we get started, you need to configure the database where Aronnax will store all the information about your clients.';

  @override
  String get welcomeScreenLastNames => 'Last Names';

  @override
  String get welcomeScreenMessage => 'Let\'s configure some things';

  @override
  String get welcomeScreenNames => 'Names';

  @override
  String get welcomeScreenPersonalID => 'Personal Identification Number';

  @override
  String get welcomeScreenPinDescription =>
      'Your PIN (Single-use generated number for recovering your account)';

  @override
  String get welcomeScreenProfessionalID => 'Professional ID';

  @override
  String get welcomeScreenRegeneratePin => 'Regenerate PIN';

  @override
  String get welcomeScreenRememberData =>
      'Remember, your data will be saved in your computer\'s documents folder. Make regular backups of the \'aronnax_localDB.sqlite\' file. Any damage or loss will result in irrecoverable data.';

  @override
  String get welcomeScreenSecurityQuestion => 'Security Question';

  @override
  String get welcomeScreenSecurityQuestionDescription =>
      'You must remember this question if you lose your password';

  @override
  String get welcomeScreenSelectCountry => 'Select your country';

  @override
  String get welcomeScreenStartButton => 'Let\'s go!';

  @override
  String get welcomeScreenStoreInfoOnMyComputer =>
      'I will store the information on my computer.';

  @override
  String get welcomeScreenUsername => 'Username';

  @override
  String welcomeScreenWelcomeGreeting(String name) {
    return 'Hello, $name!';
  }

  @override
  String get welcomeScreenWhatToDo => 'What do you want to do?';

  @override
  String get welcomeScreenYourAddress => 'Your Address';

  @override
  String get welcomeScreenYourAnswer => 'Your Answer';

  @override
  String get welcomeScreenYourEmail => 'Your Email';

  @override
  String get welcomeScreenYourPassword => 'Your Password';

  @override
  String menuGreetMorning(Object name) {
    return 'Good morning $name!';
  }

  @override
  String menuGreetAfternoon(Object name) {
    return 'Good afternoon $name!';
  }

  @override
  String menuGreetEvening(Object name) {
    return 'Good evening $name!';
  }

  @override
  String get icdSelectorTitle => 'ICD-11 diagnostic code selector';

  @override
  String get icdSearchHint => 'Filter elements in';

  @override
  String get icdOpenBrowser => 'See more about';

  @override
  String get updateItemTitle => 'There is an update available';

  @override
  String get updateItemGetButton => 'Get the update';
}
