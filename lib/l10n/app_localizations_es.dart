// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get calendarEventCreationConfirmationText => 'Evento creado';

  @override
  String get calendarEventDeleted => 'Evento eliminado';

  @override
  String get calendarEventEmpty => 'No hay eventos para este día.';

  @override
  String get calendarEventFormDate => 'Fecha';

  @override
  String get calendarEventFormDescription => 'Descripción del evento';

  @override
  String get calendarEventFormErrorInvalidNumberOfWeeks => 'Valor inválido';

  @override
  String get calendarEventFormErrorNoOptionsSelected =>
      'Debes seleccionar un estado y un tipo de evento';

  @override
  String get calendarEventFormErrorNoPatientSelected =>
      'Debes seleccionar un paciente';

  @override
  String get calendarEventFormNumberOfWeeks => 'Número de semanas';

  @override
  String get calendarEventFormTime => 'Hora';

  @override
  String get calendarEventGlobalTitleCreate => 'Programar evento';

  @override
  String get calendarEventGlobalTitleUpdate => 'Actualizar evento';

  @override
  String get calendarEventIndividualEvent => 'Evento individual';

  @override
  String get calendarEventMultideleteDialogDeleteConfirmation =>
      'eventos eliminados';

  @override
  String get calendarEventMultideleteDialogDescription =>
      '¿Estas seguro de querer eliminar todos los eventos?';

  @override
  String get calendarEventMultideleteTitle =>
      'Eliminar todos los eventos relacionados';

  @override
  String get calendarEventScheduleButtonTitle => 'Programar';

  @override
  String get calendarEventStatusCanceled => 'Cancelado';

  @override
  String get calendarEventStatusDone => 'Realizado';

  @override
  String get calendarEventStatusScheduled => 'Programado';

  @override
  String get calendarEventStatusTitle => 'Estado del evento';

  @override
  String get calendarEventTypeConsultation => 'Consulta';

  @override
  String get calendarEventTypeFollowUp => 'Seguimiento';

  @override
  String get calendarEventTypeMeeting => 'Reunión';

  @override
  String get calendarEventTypeTitle => 'Tipo de evento';

  @override
  String get calendarEventUpdateConfirmationText => 'Evento actualizado';

  @override
  String get calendarEventWeeklyEvent => 'Evento semanal';

  @override
  String get caseCreationFormHintConsultationReason => 'Motivo de consulta';

  @override
  String get caseCreationFormSaveConfirmation => 'Caso guardado';

  @override
  String get caseCreationFormSearchIcdCode => 'Buscar código CIE';

  @override
  String get caseCreationFormSelectTreatment =>
      'Seleccionar un plan de tratamiento';

  @override
  String get caseCreationFormTitleAdd => 'Agregar nuevo plan de tratamiento';

  @override
  String get caseCreationFormTitleDiagnostic => 'Impresión diagnóstica';

  @override
  String get caseCreationFormTitleSelectedDiagnostic =>
      'Diagnóstico seleccionado';

  @override
  String get caseCreationFormTitleTreatmentProposotion =>
      'Propuesta de tratamiento';

  @override
  String get caseCreationTitle => 'Nuevo caso';

  @override
  String get caseCreationWithoutTreatment => 'Caso sin plan de tratamiento';

  @override
  String get caseCreationWithTreatment => 'Caso con plan de tratamiento';

  @override
  String get caseDiagnosticIcdDataEmpty =>
      'Los datos diagnósticos de la CIE están vacíos';

  @override
  String get caseDiagnosticIcdDescription =>
      'Si quieres asignar el código CIE para tu impresión diagnóstica, debes descargar los datos requeridos del proveedor de la CIE. Este proceso puede tardar unos minutos. Sé paciente.';

  @override
  String get caseDiagnosticSearchTerm => 'Buscar cualquier término';

  @override
  String get caseDiagnosticTermNotFound => 'Término no encontrado';

  @override
  String get clinicHistoryFormFamilyHistory => 'Historia familiar';

  @override
  String get clinicHistoryFormMedAntecedents => 'Antecedentes médicos';

  @override
  String get clinicHistoryFormMentalExamination => 'Examen mental';

  @override
  String get clinicHistoryFormPersonalHistory => 'Historia personal';

  @override
  String get clinicHistoryFormPsyAntecedents => 'Antecedentes psicológicos';

  @override
  String get clinicHistoryInfoCreationDate => 'Fecha de creación';

  @override
  String get clinicHistoryInfoPatientName => 'Nombre del paciente';

  @override
  String get clinicHistoryInfoProfessionalName => 'Profesional';

  @override
  String get clinicHistoryInfoRecordCode => 'Código único del registro';

  @override
  String get clinicHistorySaveConfirmation => 'Registro guardado';

  @override
  String get clinicHistorySaveRegister => 'Guardar registro';

  @override
  String get clinicHistoryTitle => 'Historia clínica';

  @override
  String get continueButton => 'Continuar';

  @override
  String get disabled => 'Discapacidad';

  @override
  String get errorEmptyField => 'El campo está vacío';

  @override
  String get friend => 'Amigo';

  @override
  String get genericAccept => 'Aceptar';

  @override
  String get genericCancel => 'Cancelar';

  @override
  String get genericCase => 'Caso';

  @override
  String genericCopyMessage(String item) {
    return 'Copiar $item';
  }

  @override
  String get genericDelete => 'Eliminar';

  @override
  String get genericDescription => 'Descripción';

  @override
  String get genericDiagnostic => 'Diagnóstico';

  @override
  String get genericEdit => 'Editar';

  @override
  String get genericEmptyData => 'No hay datos para mostrar';

  @override
  String get genericErrorMessage => 'Algo salió mal';

  @override
  String get genericErrorPasswordsDontMatch => 'Las contraseñas no coinciden';

  @override
  String genericMinimumCharacters(String amount) {
    return 'Mínimo $amount caracteres';
  }

  @override
  String get genericNoDescription => 'Sin descripción';

  @override
  String get genericNotes => 'Notas';

  @override
  String get genericPatientNameTitle => 'Nombre del paciente';

  @override
  String get genericPatientSelectionTitlte => 'Selecciona un paciente';

  @override
  String get genericPatientTitle => 'Paciente';

  @override
  String get genericSaveTitle => 'Guardar';

  @override
  String get genericSelectionText => 'Selecciona una opción';

  @override
  String get genericSelectTitle => 'Seleccionar';

  @override
  String get genericSend => 'Enviar';

  @override
  String get genericSession => 'Sesión';

  @override
  String get genericSupport => 'Soporte';

  @override
  String get genericThanks => 'Gracias';

  @override
  String get genericThisWasPrefix => 'Esto fue un';

  @override
  String get genericTitle => 'Título';

  @override
  String get genericTitleYourTitle => 'Tu título';

  @override
  String get genericTreatmentPlan => 'Plan de tratamiento';

  @override
  String get helpScreenAronnaxPoweredBy => 'Desarrollado con Flutter';

  @override
  String get helpScreenDescriptionText =>
      'Un software de gestión de pacientes y registros médicos, minimalista y eficiente.\nHecho por psicólogos, para psicólogos.';

  @override
  String get helpScreenDevelopedBy => 'Desarrollado por';

  @override
  String get helpScreenLegalInformationTitle => 'Información legal';

  @override
  String get helpScreenTitle => 'Información de desarrollo';

  @override
  String get icdDataRepairConfirmation => 'Reparación completada';

  @override
  String get icdDataRepairDescription =>
      'Si hubo un error durante el proceso de descarga de datos del CIE-11, puedes solucionarlo aquí.';

  @override
  String get icdDataRepairTitle => 'Reparar base de datos del CIE-11';

  @override
  String get icdLoadingDescription =>
      'Aronnax está creando una copia local de la 11ª revisión de la Clasificación Internacional de Enfermedades, utilizando la API de la OMS para ayudarte en tus impresiones diagnósticas. Esto puede tardar unos minutos.';

  @override
  String get icdLoadingTitle => 'Ten paciencia';

  @override
  String get icdSuccess => '¡Listo!';

  @override
  String get icdSuccessDescription => 'Tienes una copia del CIE-11 para tu uso';

  @override
  String get loginErrorEmptyPassword => 'Ingresa tu contraseña';

  @override
  String get loginErrorEmptyUsername => 'Ingresa tu nombre de usuario';

  @override
  String get loginErrorIncorrectPassword => 'Contraseña incorrecta';

  @override
  String get loginErrorUserDontExist => 'Este usuario no existe';

  @override
  String get loginHintUsername => 'Escribe tu nombre de usuario registrado';

  @override
  String get loginLabelPassword => 'Nombre de usuario';

  @override
  String get loginTitle => 'Iniciar sesión';

  @override
  String get loginUsername => 'Nombre de usuario';

  @override
  String get loginUserPassword => 'Contraseña';

  @override
  String get loginUserPasswordDefined => 'Contraseña para';

  @override
  String get loginUserPasswordRecover => '¿Olvidaste tu contraseña?';

  @override
  String get mainMenuAddEventTooltip => 'Agregar evento';

  @override
  String get mainMenuEventsForDefinedDate => 'Eventos para';

  @override
  String get mainMenuEventsForToday => 'Eventos para hoy';

  @override
  String mainMenuOptionsBarAlertCaseNotFound(String patientNames) {
    return 'Este usuario no tiene ningún caso abierto. Ve al perfil de $patientNames y crea o habilita un caso.';
  }

  @override
  String get mainMenuOptionsBarPatientSelectionDialogTitle =>
      'Seleccionar paciente';

  @override
  String get mainMenuOptionsBarTitleHelp => 'Ayuda';

  @override
  String get mainMenuOptionsBarTitleMoreOptions => 'Más opciones';

  @override
  String get mainMenuOptionsBarTitleRegisterConsultant =>
      'Registrar consultante';

  @override
  String get mainMenuOptionsBarTitleRegisterSignOut => 'Cerrar sesión';

  @override
  String get mainMenuOptionsBarTitleSettings => 'Configuración';

  @override
  String get mainMenuOptionsBarTitleStartConsultation => 'Iniciar consulta';

  @override
  String get other => 'Otro';

  @override
  String get parent => 'Padre';

  @override
  String get partner => 'Pareja';

  @override
  String get passwordRecoverCopyPin => 'Copiar pin';

  @override
  String get passwordRecoverDialogErrorDontExist => 'El usuario no existe';

  @override
  String get passwordRecoverDialogErrorEmpty => 'Ingresa tu nombre de usuario';

  @override
  String get passwordRecoverDialogHint =>
      'Tu nombre de usuario para iniciar sesión';

  @override
  String get passwordRecoverDialogTitle =>
      'Por favor, ingresa tu nombre de usuario';

  @override
  String get passwordRecoverPinAnswerHint => 'Tu pin';

  @override
  String get passwordRecoverPinInstructions =>
      'Inserta el pin de recuperación de tu cuenta';

  @override
  String get passwordRecoverPinTitle =>
      'Tu pin (número generado de un solo uso para recuperar tu cuenta)';

  @override
  String get passwordRecoverQuestionaryAdress =>
      'Selecciona tu dirección de casa';

  @override
  String get passwordRecoverQuestionaryAnswerHint => 'Tu respuesta';

  @override
  String get passwordRecoverQuestionaryEmail =>
      'Selecciona tu dirección de correo electrónico';

  @override
  String get passwordRecoverQuestionaryInstructions =>
      'Responde las preguntas a continuación para confirmar tu identidad';

  @override
  String get passwordRecoverQuestionaryPasswordConfirmationAlert =>
      'Contraseña actualizada';

  @override
  String get passwordRecoverQuestionaryPersonalId =>
      'Selecciona tu ID personal';

  @override
  String get passwordRecoverQuestionaryTitle =>
      'Cuestionario de datos personales';

  @override
  String get passwordRecoverQuestionaryUpdatePasswordTitle =>
      'Actualiza tu contraseña';

  @override
  String get patientCaseActiveCase => 'Caso activo';

  @override
  String get patientCaseCloseDialogCloseButton => 'Cerrar este caso';

  @override
  String get patientCaseCloseDialogCloseConfirmation => 'Caso cerrado';

  @override
  String get patientCaseCloseDialogCloseNoOptionError =>
      'Debes seleccionar una opción';

  @override
  String get patientCaseCloseDialogDescription =>
      'Por favor, elige una opción que indique la condición del paciente al finalizar este proceso';

  @override
  String get patientCaseCloseDialogOptionalOutcome =>
      'Explicación opcional de este caso';

  @override
  String get patientCaseCloseDialogTitle => '¿Cerrar este caso?';

  @override
  String get patientCaseDataOutcomeDialogTitle => '¿Por qué este resultado?';

  @override
  String get patientCaseDeleteCase => 'Eliminar caso';

  @override
  String get patientCaseDeleteDialogDeleteConfirmation => 'Caso eliminado';

  @override
  String get patientCaseDeleteDialogDescription =>
      'Si eliminas este caso, perderás todos los datos relacionados con él, como sesiones y resultados de planes de tratamiento';

  @override
  String get patientCaseDeleteDialogTitle => '¿Eliminar este caso?';

  @override
  String get patientCaseInactiveCase => 'Caso inactivo';

  @override
  String get patientCaseSeeCaseOutcome => 'Ver resultado del caso';

  @override
  String get patientCaseSeeCaseOutcomeTitle => 'Resultado del caso';

  @override
  String get patientCaseSessionEmptyList =>
      'No hay sesiones relacionadas con este caso';

  @override
  String get patientCaseSessionPerformanceExplanation =>
      'Explicación de este desempeño';

  @override
  String get patientCompanionReason => 'Razón del acompañamiento';

  @override
  String get patientCompanionRelation => 'Relación con el paciente';

  @override
  String get patientDataCaseCreateNew => 'Crear nuevo caso';

  @override
  String get patientDataCaseDiagnosticCode => 'Código diagnóstico';

  @override
  String get patientDataCaseEmpty => 'Este paciente no tiene casos abiertos';

  @override
  String get patientDataCreateCase => 'Crear caso';

  @override
  String get patientDataCreateClinicalHistory => 'Crear historial clínico';

  @override
  String get patientDataDeletePatient => 'Eliminar paciente';

  @override
  String patientDataExportConfirmation(String path) {
    return 'Datos del paciente exportados a: $path';
  }

  @override
  String get patientDataExportData => 'Exportar datos del paciente';

  @override
  String get patientDataGoToPatientProfile => 'Ir al perfil del paciente';

  @override
  String get patientDataSeeResultsList => 'Ver lista de resultados';

  @override
  String get patientDataSeeSessions => 'Ver sesiones';

  @override
  String get patientDataTitleActiveUser => 'Usuario activo';

  @override
  String get patientDataTitleAdress => 'Dirección';

  @override
  String get patientDataTitleClinicHistory => 'Historia clínica';

  @override
  String get patientDataTitleContactNumber => 'Número de contacto';

  @override
  String get patientDataTitleEducationalAttainment => 'Nivel educativo';

  @override
  String get patientDataTitleEmail => 'Correo electrónico';

  @override
  String get patientDataTitleEmergencyContactName =>
      'Nombre del contacto de emergencia';

  @override
  String get patientDataTitleEmergencyContactNumber =>
      'Número del contacto de emergencia';

  @override
  String get patientDataTitleID => 'ID';

  @override
  String get patientDataTitleInactiveUser => 'Usuario inactivo';

  @override
  String get patientDataTitleInsurance => 'Seguro';

  @override
  String get patientDataTitleOcupation => 'Ocupación';

  @override
  String get patientRegisterRequireCompanion => '¿Requiere acompañante?';

  @override
  String get patientsListMenuTitle => 'Lista de pacientes';

  @override
  String get profileNewPasswordConfirmationSuccess =>
      'Tu contraseña ha sido actualizada';

  @override
  String get profileNewPasswordCurrentPassword => 'Contraseña actual';

  @override
  String get profileNewPasswordNewPassword => 'Nueva contraseña';

  @override
  String get profileNewPasswordUpdateButton => 'Actualizar contraseña';

  @override
  String profileUpdatePasswordTitle(String user) {
    return 'Actualizar contraseña de $user';
  }

  @override
  String get registerBackButtonTitle => 'Atrás';

  @override
  String get registerErrorAlertTitle => 'Algo salió mal';

  @override
  String get registerFormAdressField => 'Dirección';

  @override
  String get registerFormContactNumberField => 'Número de contacto';

  @override
  String get registerFormEducationalAttainmentField => 'Nivel educativo';

  @override
  String get registerFormEmailField => 'Correo electrónico';

  @override
  String get registerFormEmergencyContanctNameField =>
      'Nombre de contacto de emergencia';

  @override
  String get registerFormEmergencyContanctNumberField =>
      'Número de contacto de emergencia';

  @override
  String get registerFormErrorEmail => 'Formato de correo electrónico inválido';

  @override
  String get registerFormErrorUserExists => 'Este usuario ya está registrado';

  @override
  String get registerFormFemaleOption => 'Femenino';

  @override
  String get registerFormIdentificationNumberField =>
      'Número de identificación';

  @override
  String get registerFormInsuranceField => 'Seguro';

  @override
  String get registerFormLastNamesField => 'Apellidos';

  @override
  String get registerFormMaleOption => 'Masculino';

  @override
  String get registerFormNamesField => 'Nombres';

  @override
  String get registerFormOcupationField => 'Ocupación';

  @override
  String get registerFormOtherOption => 'Otro';

  @override
  String get registerFormSexField => 'Sexo';

  @override
  String get registerFormTitle => 'Información personal';

  @override
  String get registerSaveButtonTitle => 'Guardar consultante';

  @override
  String get registerSuccessAlertTitle => 'consultante registrado exitosamente';

  @override
  String get registerTitle => 'Registrar consultante';

  @override
  String get relative => 'Pariente';

  @override
  String get sessionFormAddNote => 'Agregar nota';

  @override
  String get sessionFormBeginTreatmentPlan => 'Comenzar plan de tratamiento';

  @override
  String get sessionFormBeginTreatmentPlanTaken =>
      'Resultados del plan de tratamiento ya guardados';

  @override
  String get sessionFormFieldSessionGoal => 'Objetivo de la sesión';

  @override
  String get sessionFormFieldSessionSummary => 'Resumen de la sesión';

  @override
  String get sessionFormFieldTherapeuticArchievements => 'Logros terapéuticos';

  @override
  String get sessionFormNewSession => 'Nueva sesión';

  @override
  String get sessionFormSaveSession => 'Guardar sesión';

  @override
  String get sessionFormStartTest => 'Iniciar prueba';

  @override
  String get sessionFormStartTestSoon => 'Pronto';

  @override
  String get sessionFormTask => 'Agregar tarea';

  @override
  String get sessionInformationDateTitle => 'Fecha de la sesión';

  @override
  String get sessionInformationPatientTitle => 'Paciente';

  @override
  String get sessionNewNoteDialogDeleteNote => 'Eliminar nota';

  @override
  String get sessionNewNoteDialogDeleteNoteConfirmation => 'Nota eliminada';

  @override
  String get sessionNewNoteDialogHintText =>
      'Notas adicionales para esta sesión';

  @override
  String get sessionNewNoteDialogSaveConfirmation => 'Nota guardada';

  @override
  String get sessionNewNoteDialogSaveTitle => 'Guardar nota';

  @override
  String get sessionNewNoteDialogTitle => 'Nueva nota';

  @override
  String get sessionReportDialogBadOption => 'Malo';

  @override
  String get sessionReportDialogDescription =>
      'Selecciona la opción que mejor describa el rendimiento de la sesión';

  @override
  String get sessionReportDialogGoodOption => 'Bueno';

  @override
  String get sessionReportDialogNormalOption => 'Normal';

  @override
  String get sessionReportDialogPerformanceExplanationHintText =>
      'Tu explicación';

  @override
  String get sessionReportDialogPerformanceExplanationTitle =>
      'Explicación del rendimiento (opcional)';

  @override
  String get sessionReportDialogTitle => '¿Cómo fue la sesión?';

  @override
  String get settingsScreenBarTitleDbRepair =>
      'Reparar base de datos del CIE-11';

  @override
  String get settingsScreenBarTitleInformation => 'Mi información';

  @override
  String get settingsScreenPersonalInfoUpdatePassword =>
      'Actualizar contraseña';

  @override
  String get supportFeedbackDescription => 'Por favor, dinos lo que piensas';

  @override
  String get supportFeedbackSendButton => 'Enviar comentarios';

  @override
  String get supportFeedbackSuccess => '¡Dinos tu opinión!';

  @override
  String get supportFeedbackTitle => 'Feedback';

  @override
  String get supportReportDescription => 'Por favor, describe tu error';

  @override
  String get supportReportErrorAknowledgement =>
      '¡Gracias por tu contribución! Esperamos resolver tu problema en la próxima versión';

  @override
  String get supportReportErrorDescription =>
      'Este reporte no recibirá seguimiento y se utilizará para identificar problemas comunes/críticos a resolver en futuras versiones';

  @override
  String get supportReportErrorHint =>
      'Por favor, describe tu problema con el mayor detalle posible';

  @override
  String get supportReportErrorSent => 'Informe enviado';

  @override
  String get supportReportSendButton => 'Enviar informe';

  @override
  String get supportReportSuccess => '¡Dinos tu opinión!';

  @override
  String get supportReportTitle => 'Informe de error';

  @override
  String get taskMenuAddButton => 'Agregar tarea';

  @override
  String get tasksMenuTitle => 'Tareas pendientes';

  @override
  String get telemetryDialogAcceptMessage =>
      'Gracias, la telemetría será habilitada';

  @override
  String get telemetryDialogDescription =>
      'Si aceptas, nos ayudarás a entender el uso de Aronnax, establecer prioridades para implementar funcionalidades y a rastrear errores a través de datos anónimos y respetuosos de tu actividad.';

  @override
  String get telemetryDialogRejectMessage =>
      'Entendido, la telemetría no será habilitada';

  @override
  String get telemetryDialogTitle => '¿Te gustaría habilitar la telemetría?';

  @override
  String get testsMenuAlert => 'Pronto';

  @override
  String get testsMenuTitle => 'Pruebas';

  @override
  String get todoCreateTodoAdd => 'Agregar';

  @override
  String get todoCreateTodoCategory => 'Categoría';

  @override
  String get todoCreateTodoCategoryListEmpty => 'Aquí verás tus categorías';

  @override
  String get todoCreateTodoDescriptionPlaceholder => 'Descripción';

  @override
  String get todoCreateTodoPlaceholder => 'Nueva tarea pendiente';

  @override
  String get todoCreateTodoSave => 'Guardar tarea';

  @override
  String get todoCreateTodoTitle => 'Crear tarea';

  @override
  String get treatmentPlanCompoentRequiredFalse => 'Opcional';

  @override
  String get treatmentPlanCompoentRequiredTrue => 'Obligatorio';

  @override
  String get treatmentPlanComponentAddButtonTitle => 'Agregar componente';

  @override
  String get treatmentPlanComponentDescriptionFieldDescription =>
      'Descripción opcional';

  @override
  String get treatmentPlanComponentListOfValues => 'Lista de valores';

  @override
  String get treatmentPlanComponentListOfValuesLabel => 'Etiqueta';

  @override
  String get treatmentPlanComponentListOfValuesValue => 'Valor';

  @override
  String get treatmentPlanComponentListOptionsNonNumericScale =>
      'Escala no numérica';

  @override
  String get treatmentPlanComponentListOptionsNumericMaxOptions =>
      'Valor máximo';

  @override
  String get treatmentPlanComponentListOptionsNumericScale => 'Escala numérica';

  @override
  String get treatmentPlanComponentListOptionsSaveTitle =>
      'Agregar lista de opciones';

  @override
  String get treatmentPlanComponentListOptionsTextOptionHint => 'Escribe algo';

  @override
  String get treatmentPlanComponentQuantifiableFalse => 'No cuantificable';

  @override
  String get treatmentPlanComponentQuantifiableTrue => 'Cuantificable';

  @override
  String get treatmentPlanComponentRequiredField => 'Campo obligatorio';

  @override
  String get treatmentPlanComponentSelectionTitle => 'Tipo de campo';

  @override
  String get treatmentPlanComponentTitleFieldDescription => 'Título del campo';

  @override
  String get treatmentPlanComponentTypeScale => 'Escala';

  @override
  String get treatmentPlanComponentTypeSelection => 'Selección';

  @override
  String get treatmentPlanComponentTypeTask => 'Tarea';

  @override
  String get treatmentPlanComponentTypeTextField => 'Campo de texto';

  @override
  String get treatmentPlanCreationButtonTitleSave =>
      'Guardar plan de tratamiento';

  @override
  String get treatmentPlanCreationButtonTitleUpdate =>
      'Actualizar plan de tratamiento';

  @override
  String get treatmentPlanCreationError => '¡Debe haber al menos una sección!';

  @override
  String get treatmentPlanCreationErrorNoSelectedComponent =>
      'No has seleccionado ningún componente';

  @override
  String get treatmentPlanCreationErrorNoTitleDescription =>
      'Debes establecer un título y una descripción';

  @override
  String get treatmentPlanCreationMessageTreamentPlanCreated =>
      'Plan de tratamiento creado';

  @override
  String get treatmentPlanCreationMessageTreamentPlanUpdated =>
      'Plan de tratamiento actualizado';

  @override
  String get treatmentPlanCreationTitleAddSection => 'Agregar sección';

  @override
  String get treatmentPlanCreationTitleNewComponent => 'Nuevo componente';

  @override
  String get treatmentPlanListDeleteConfirmation =>
      'Plan de tratamiento eliminado';

  @override
  String get treatmentPlanListFileExportedPath => 'Ruta de archivo exportado';

  @override
  String get treatmentPlanListNumberOfPhases => 'Número de fases';

  @override
  String get treatmentPlanMetadataDescriptionHint =>
      'Descripción del plan de tratamiento';

  @override
  String get treatmentPlanScreenImportConfirmation =>
      'Plan de tratamiento importado';

  @override
  String get treatmentPlanScreenOptionImport => 'Importar plan de tratamiento';

  @override
  String get treatmentPlanScreenTitle => 'Agregar plan de tratamiento';

  @override
  String get treatmentPlansInformationBody =>
      'Crea planes de tratamiento personalizados en formularios basados en fases para monitorear y seguir el progreso de tu paciente hacia objetivos de tratamiento específicos';

  @override
  String get treatmentPlansInformationTitle => 'Información';

  @override
  String get treatmentPlansMenuTitle => 'Planes de tratamiento';

  @override
  String get treatmentPlansSectionTitle => 'Sección';

  @override
  String get treatmentPlansTemplateTile => 'Nuevo plan de tratamiento';

  @override
  String get treatmentPlanUpdateDialogFieldDescription => 'Descripción';

  @override
  String get treatmentPlanUpdateDialogFieldDescriptionHint =>
      'Descripción opcional';

  @override
  String get treatmentPlanUpdateDialogFieldListOfValues => 'Lista de valores';

  @override
  String get treatmentPlanUpdateDialogFieldListOfValuesLabelOption =>
      'Etiqueta';

  @override
  String get treatmentPlanUpdateDialogFieldListOfValuesValueOption => 'Valor';

  @override
  String get treatmentPlanUpdateDialogFieldMessurableTitle => 'Medible';

  @override
  String get treatmentPlanUpdateDialogFieldNotMessurableTitle => 'No medible';

  @override
  String get treatmentPlanUpdateDialogFieldRequiredFieldOptionOptional =>
      'Opcional';

  @override
  String get treatmentPlanUpdateDialogFieldRequiredFieldOptionRequired =>
      'Requerido';

  @override
  String get treatmentPlanUpdateDialogFieldRequiredFieldTitle =>
      'Campo requerido';

  @override
  String get treatmentPlanUpdateDialogFieldTitle => 'Título';

  @override
  String get treatmentPlanUpdateDialogFieldTitleHint =>
      'Declaración para este campo';

  @override
  String get treatmentPlanUpdateDialogFieldTypeTitle => 'Tipo de campo';

  @override
  String get treatmentPlanUpdateDialogOptionMultipleSelection =>
      'Selección múltiple';

  @override
  String get treatmentPlanUpdateDialogOptionScale => 'Escala';

  @override
  String get treatmentPlanUpdateDialogOptionTask => 'Tarea';

  @override
  String get treatmentPlanUpdateDialogOptionTextField => 'Campo de texto';

  @override
  String get treatmentPlanUpdateDialogUpdateButtonTitle =>
      'Actualizar componente';

  @override
  String get tryAgain => 'Intentar de nuevo';

  @override
  String get underage => 'Menor de edad';

  @override
  String get welcomeScreenAlmostDone => '¡Casi listo!';

  @override
  String get welcomeScreenConfigureNewServer => 'Configurar un nuevo servidor';

  @override
  String get welcomeScreenConfigureNewServerDescription =>
      'Si estás usando Aronnax por primera vez, elige esta opción, y lo configuraremos todo para ti.';

  @override
  String get welcomeScreenConfirmPassword => 'Confirmar tu contraseña';

  @override
  String get welcomeScreenConnectToExistingServer =>
      'Conectar a un servidor existente';

  @override
  String get welcomeScreenConnectToExistingServerDescription =>
      'Si ya has usado y configurado Aronnax para tu equipo o para ti mismo, elige esta opción para conectarte.';

  @override
  String get welcomeScreenCreateAccountLocal => 'Crear cuenta local';

  @override
  String get welcomeScreenCreateDatabaseAndContinue =>
      'Crear base de datos y continuar';

  @override
  String get welcomeScreenDatabaseConfigured =>
      '¡Tu base de datos ha sido configurada! Es hora de crearla en el servidor.';

  @override
  String get welcomeScreenDatabaseDescription =>
      'Aronnax requiere una base de datos para almacenar toda la información que registres en tus consultas. Puedes conectar con un servidor externo con una base de datos SQL preconfigurada o simplemente almacenar la base de datos directamente en tu computadora.';

  @override
  String get welcomeScreenErrorPasswordLenght =>
      'La contraseña debe tener al menos ocho caracteres.';

  @override
  String get welcomeScreenFinishConfigFinish => 'Eso es todo';

  @override
  String get welcomeScreenFinishConfigImageDescription =>
      'Ahora puedes iniciar sesión y comenzar a mejorar la calidad de vida de tus consultantes.';

  @override
  String get welcomeScreenFinishConfigStartUsingAronnax =>
      'Empezar a usar Aronnax';

  @override
  String get welcomeScreenImageDescription =>
      'Te damos la bienvenida a Aronnax, un software de gestión de historias clínicas para psicólogos. Antes de empezar, necesitas configurar la base de datos donde Aronnax almacenará toda la información sobre tus consultantes.';

  @override
  String get welcomeScreenLastNames => 'Apellidos';

  @override
  String get welcomeScreenMessage => 'Configuremos algunas cosas';

  @override
  String get welcomeScreenNames => 'Nombres';

  @override
  String get welcomeScreenPersonalID => 'Número de Identificación Personal';

  @override
  String get welcomeScreenPinDescription =>
      'Tu PIN (número generado de un solo uso para recuperar tu cuenta)';

  @override
  String get welcomeScreenProfessionalID => 'Identificación Profesional';

  @override
  String get welcomeScreenRegeneratePin => 'Regenerar PIN';

  @override
  String get welcomeScreenRememberData =>
      'Recuerda, tus datos se guardarán en la carpeta de documentos de tu computadora. Haz copias de seguridad periódicas del archivo \'aronnax_localDB.sqlite\'. Cualquier daño o pérdida resultará en datos irrecuperables.';

  @override
  String get welcomeScreenSecurityQuestion => 'Pregunta de seguridad';

  @override
  String get welcomeScreenSecurityQuestionDescription =>
      'Debes recordar esta pregunta si pierdes tu contraseña';

  @override
  String get welcomeScreenSelectCountry => 'Selecciona tu país';

  @override
  String get welcomeScreenStartButton => '¡Vamos!';

  @override
  String get welcomeScreenStoreInfoOnMyComputer =>
      'Guardaré la información en mi computadora.';

  @override
  String get welcomeScreenUsername => 'Nombre de usuario';

  @override
  String welcomeScreenWelcomeGreeting(String name) {
    return '¡Hola, $name!';
  }

  @override
  String get welcomeScreenWhatToDo => '¿Qué quieres hacer?';

  @override
  String get welcomeScreenYourAddress => 'Tu dirección';

  @override
  String get welcomeScreenYourAnswer => 'Tu respuesta';

  @override
  String get welcomeScreenYourEmail => 'Tu correo electrónico';

  @override
  String get welcomeScreenYourPassword => 'Tu contraseña';

  @override
  String menuGreetMorning(Object name) {
    return '¡Buenos días, $name!';
  }

  @override
  String menuGreetAfternoon(Object name) {
    return '¡Buenas tardes, $name!';
  }

  @override
  String menuGreetEvening(Object name) {
    return '¡Buenas noches, $name!';
  }

  @override
  String get icdSelectorTitle => 'Buscador de códigos CIE-11';

  @override
  String get icdSearchHint => 'Filtrar elementos de';

  @override
  String get icdOpenBrowser => 'See more about';

  @override
  String get updateItemTitle => 'Hay una nueva actualización';

  @override
  String get updateItemGetButton => 'Descargar la actualización';
}
