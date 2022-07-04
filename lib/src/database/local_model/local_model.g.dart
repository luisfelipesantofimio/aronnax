// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_model.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Patient extends DataClass implements Insertable<Patient> {
  final int id;
  final String names;
  final String lastNames;
  final int idNumber;
  final DateTime birthDate;
  final int contactNumber;
  final String mail;
  final String city;
  final String state;
  final String adress;
  final String education;
  final String ocupation;
  final String insurance;
  final String emergencyContactName;
  final int emergencyContactNumber;
  Patient(
      {required this.id,
      required this.names,
      required this.lastNames,
      required this.idNumber,
      required this.birthDate,
      required this.contactNumber,
      required this.mail,
      required this.city,
      required this.state,
      required this.adress,
      required this.education,
      required this.ocupation,
      required this.insurance,
      required this.emergencyContactName,
      required this.emergencyContactNumber});
  factory Patient.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Patient(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      names: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}names'])!,
      lastNames: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}last_names'])!,
      idNumber: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_number'])!,
      birthDate: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}birth_date'])!,
      contactNumber: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}contact_number'])!,
      mail: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}mail'])!,
      city: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}city'])!,
      state: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}state'])!,
      adress: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}adress'])!,
      education: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}education'])!,
      ocupation: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}ocupation'])!,
      insurance: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}insurance'])!,
      emergencyContactName: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}emergency_contact_name'])!,
      emergencyContactNumber: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}emergency_contact_number'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['names'] = Variable<String>(names);
    map['last_names'] = Variable<String>(lastNames);
    map['id_number'] = Variable<int>(idNumber);
    map['birth_date'] = Variable<DateTime>(birthDate);
    map['contact_number'] = Variable<int>(contactNumber);
    map['mail'] = Variable<String>(mail);
    map['city'] = Variable<String>(city);
    map['state'] = Variable<String>(state);
    map['adress'] = Variable<String>(adress);
    map['education'] = Variable<String>(education);
    map['ocupation'] = Variable<String>(ocupation);
    map['insurance'] = Variable<String>(insurance);
    map['emergency_contact_name'] = Variable<String>(emergencyContactName);
    map['emergency_contact_number'] = Variable<int>(emergencyContactNumber);
    return map;
  }

  PatientsCompanion toCompanion(bool nullToAbsent) {
    return PatientsCompanion(
      id: Value(id),
      names: Value(names),
      lastNames: Value(lastNames),
      idNumber: Value(idNumber),
      birthDate: Value(birthDate),
      contactNumber: Value(contactNumber),
      mail: Value(mail),
      city: Value(city),
      state: Value(state),
      adress: Value(adress),
      education: Value(education),
      ocupation: Value(ocupation),
      insurance: Value(insurance),
      emergencyContactName: Value(emergencyContactName),
      emergencyContactNumber: Value(emergencyContactNumber),
    );
  }

  factory Patient.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Patient(
      id: serializer.fromJson<int>(json['id']),
      names: serializer.fromJson<String>(json['names']),
      lastNames: serializer.fromJson<String>(json['lastNames']),
      idNumber: serializer.fromJson<int>(json['idNumber']),
      birthDate: serializer.fromJson<DateTime>(json['birthDate']),
      contactNumber: serializer.fromJson<int>(json['contactNumber']),
      mail: serializer.fromJson<String>(json['mail']),
      city: serializer.fromJson<String>(json['city']),
      state: serializer.fromJson<String>(json['state']),
      adress: serializer.fromJson<String>(json['adress']),
      education: serializer.fromJson<String>(json['education']),
      ocupation: serializer.fromJson<String>(json['ocupation']),
      insurance: serializer.fromJson<String>(json['insurance']),
      emergencyContactName:
          serializer.fromJson<String>(json['emergencyContactName']),
      emergencyContactNumber:
          serializer.fromJson<int>(json['emergencyContactNumber']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'names': serializer.toJson<String>(names),
      'lastNames': serializer.toJson<String>(lastNames),
      'idNumber': serializer.toJson<int>(idNumber),
      'birthDate': serializer.toJson<DateTime>(birthDate),
      'contactNumber': serializer.toJson<int>(contactNumber),
      'mail': serializer.toJson<String>(mail),
      'city': serializer.toJson<String>(city),
      'state': serializer.toJson<String>(state),
      'adress': serializer.toJson<String>(adress),
      'education': serializer.toJson<String>(education),
      'ocupation': serializer.toJson<String>(ocupation),
      'insurance': serializer.toJson<String>(insurance),
      'emergencyContactName': serializer.toJson<String>(emergencyContactName),
      'emergencyContactNumber': serializer.toJson<int>(emergencyContactNumber),
    };
  }

  Patient copyWith(
          {int? id,
          String? names,
          String? lastNames,
          int? idNumber,
          DateTime? birthDate,
          int? contactNumber,
          String? mail,
          String? city,
          String? state,
          String? adress,
          String? education,
          String? ocupation,
          String? insurance,
          String? emergencyContactName,
          int? emergencyContactNumber}) =>
      Patient(
        id: id ?? this.id,
        names: names ?? this.names,
        lastNames: lastNames ?? this.lastNames,
        idNumber: idNumber ?? this.idNumber,
        birthDate: birthDate ?? this.birthDate,
        contactNumber: contactNumber ?? this.contactNumber,
        mail: mail ?? this.mail,
        city: city ?? this.city,
        state: state ?? this.state,
        adress: adress ?? this.adress,
        education: education ?? this.education,
        ocupation: ocupation ?? this.ocupation,
        insurance: insurance ?? this.insurance,
        emergencyContactName: emergencyContactName ?? this.emergencyContactName,
        emergencyContactNumber:
            emergencyContactNumber ?? this.emergencyContactNumber,
      );
  @override
  String toString() {
    return (StringBuffer('Patient(')
          ..write('id: $id, ')
          ..write('names: $names, ')
          ..write('lastNames: $lastNames, ')
          ..write('idNumber: $idNumber, ')
          ..write('birthDate: $birthDate, ')
          ..write('contactNumber: $contactNumber, ')
          ..write('mail: $mail, ')
          ..write('city: $city, ')
          ..write('state: $state, ')
          ..write('adress: $adress, ')
          ..write('education: $education, ')
          ..write('ocupation: $ocupation, ')
          ..write('insurance: $insurance, ')
          ..write('emergencyContactName: $emergencyContactName, ')
          ..write('emergencyContactNumber: $emergencyContactNumber')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      names,
      lastNames,
      idNumber,
      birthDate,
      contactNumber,
      mail,
      city,
      state,
      adress,
      education,
      ocupation,
      insurance,
      emergencyContactName,
      emergencyContactNumber);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Patient &&
          other.id == this.id &&
          other.names == this.names &&
          other.lastNames == this.lastNames &&
          other.idNumber == this.idNumber &&
          other.birthDate == this.birthDate &&
          other.contactNumber == this.contactNumber &&
          other.mail == this.mail &&
          other.city == this.city &&
          other.state == this.state &&
          other.adress == this.adress &&
          other.education == this.education &&
          other.ocupation == this.ocupation &&
          other.insurance == this.insurance &&
          other.emergencyContactName == this.emergencyContactName &&
          other.emergencyContactNumber == this.emergencyContactNumber);
}

class PatientsCompanion extends UpdateCompanion<Patient> {
  final Value<int> id;
  final Value<String> names;
  final Value<String> lastNames;
  final Value<int> idNumber;
  final Value<DateTime> birthDate;
  final Value<int> contactNumber;
  final Value<String> mail;
  final Value<String> city;
  final Value<String> state;
  final Value<String> adress;
  final Value<String> education;
  final Value<String> ocupation;
  final Value<String> insurance;
  final Value<String> emergencyContactName;
  final Value<int> emergencyContactNumber;
  const PatientsCompanion({
    this.id = const Value.absent(),
    this.names = const Value.absent(),
    this.lastNames = const Value.absent(),
    this.idNumber = const Value.absent(),
    this.birthDate = const Value.absent(),
    this.contactNumber = const Value.absent(),
    this.mail = const Value.absent(),
    this.city = const Value.absent(),
    this.state = const Value.absent(),
    this.adress = const Value.absent(),
    this.education = const Value.absent(),
    this.ocupation = const Value.absent(),
    this.insurance = const Value.absent(),
    this.emergencyContactName = const Value.absent(),
    this.emergencyContactNumber = const Value.absent(),
  });
  PatientsCompanion.insert({
    this.id = const Value.absent(),
    required String names,
    required String lastNames,
    required int idNumber,
    required DateTime birthDate,
    required int contactNumber,
    required String mail,
    required String city,
    required String state,
    required String adress,
    required String education,
    required String ocupation,
    required String insurance,
    required String emergencyContactName,
    required int emergencyContactNumber,
  })  : names = Value(names),
        lastNames = Value(lastNames),
        idNumber = Value(idNumber),
        birthDate = Value(birthDate),
        contactNumber = Value(contactNumber),
        mail = Value(mail),
        city = Value(city),
        state = Value(state),
        adress = Value(adress),
        education = Value(education),
        ocupation = Value(ocupation),
        insurance = Value(insurance),
        emergencyContactName = Value(emergencyContactName),
        emergencyContactNumber = Value(emergencyContactNumber);
  static Insertable<Patient> custom({
    Expression<int>? id,
    Expression<String>? names,
    Expression<String>? lastNames,
    Expression<int>? idNumber,
    Expression<DateTime>? birthDate,
    Expression<int>? contactNumber,
    Expression<String>? mail,
    Expression<String>? city,
    Expression<String>? state,
    Expression<String>? adress,
    Expression<String>? education,
    Expression<String>? ocupation,
    Expression<String>? insurance,
    Expression<String>? emergencyContactName,
    Expression<int>? emergencyContactNumber,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (names != null) 'names': names,
      if (lastNames != null) 'last_names': lastNames,
      if (idNumber != null) 'id_number': idNumber,
      if (birthDate != null) 'birth_date': birthDate,
      if (contactNumber != null) 'contact_number': contactNumber,
      if (mail != null) 'mail': mail,
      if (city != null) 'city': city,
      if (state != null) 'state': state,
      if (adress != null) 'adress': adress,
      if (education != null) 'education': education,
      if (ocupation != null) 'ocupation': ocupation,
      if (insurance != null) 'insurance': insurance,
      if (emergencyContactName != null)
        'emergency_contact_name': emergencyContactName,
      if (emergencyContactNumber != null)
        'emergency_contact_number': emergencyContactNumber,
    });
  }

  PatientsCompanion copyWith(
      {Value<int>? id,
      Value<String>? names,
      Value<String>? lastNames,
      Value<int>? idNumber,
      Value<DateTime>? birthDate,
      Value<int>? contactNumber,
      Value<String>? mail,
      Value<String>? city,
      Value<String>? state,
      Value<String>? adress,
      Value<String>? education,
      Value<String>? ocupation,
      Value<String>? insurance,
      Value<String>? emergencyContactName,
      Value<int>? emergencyContactNumber}) {
    return PatientsCompanion(
      id: id ?? this.id,
      names: names ?? this.names,
      lastNames: lastNames ?? this.lastNames,
      idNumber: idNumber ?? this.idNumber,
      birthDate: birthDate ?? this.birthDate,
      contactNumber: contactNumber ?? this.contactNumber,
      mail: mail ?? this.mail,
      city: city ?? this.city,
      state: state ?? this.state,
      adress: adress ?? this.adress,
      education: education ?? this.education,
      ocupation: ocupation ?? this.ocupation,
      insurance: insurance ?? this.insurance,
      emergencyContactName: emergencyContactName ?? this.emergencyContactName,
      emergencyContactNumber:
          emergencyContactNumber ?? this.emergencyContactNumber,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (names.present) {
      map['names'] = Variable<String>(names.value);
    }
    if (lastNames.present) {
      map['last_names'] = Variable<String>(lastNames.value);
    }
    if (idNumber.present) {
      map['id_number'] = Variable<int>(idNumber.value);
    }
    if (birthDate.present) {
      map['birth_date'] = Variable<DateTime>(birthDate.value);
    }
    if (contactNumber.present) {
      map['contact_number'] = Variable<int>(contactNumber.value);
    }
    if (mail.present) {
      map['mail'] = Variable<String>(mail.value);
    }
    if (city.present) {
      map['city'] = Variable<String>(city.value);
    }
    if (state.present) {
      map['state'] = Variable<String>(state.value);
    }
    if (adress.present) {
      map['adress'] = Variable<String>(adress.value);
    }
    if (education.present) {
      map['education'] = Variable<String>(education.value);
    }
    if (ocupation.present) {
      map['ocupation'] = Variable<String>(ocupation.value);
    }
    if (insurance.present) {
      map['insurance'] = Variable<String>(insurance.value);
    }
    if (emergencyContactName.present) {
      map['emergency_contact_name'] =
          Variable<String>(emergencyContactName.value);
    }
    if (emergencyContactNumber.present) {
      map['emergency_contact_number'] =
          Variable<int>(emergencyContactNumber.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PatientsCompanion(')
          ..write('id: $id, ')
          ..write('names: $names, ')
          ..write('lastNames: $lastNames, ')
          ..write('idNumber: $idNumber, ')
          ..write('birthDate: $birthDate, ')
          ..write('contactNumber: $contactNumber, ')
          ..write('mail: $mail, ')
          ..write('city: $city, ')
          ..write('state: $state, ')
          ..write('adress: $adress, ')
          ..write('education: $education, ')
          ..write('ocupation: $ocupation, ')
          ..write('insurance: $insurance, ')
          ..write('emergencyContactName: $emergencyContactName, ')
          ..write('emergencyContactNumber: $emergencyContactNumber')
          ..write(')'))
        .toString();
  }
}

class $PatientsTable extends Patients with TableInfo<$PatientsTable, Patient> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PatientsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _namesMeta = const VerificationMeta('names');
  @override
  late final GeneratedColumn<String?> names = GeneratedColumn<String?>(
      'names', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _lastNamesMeta = const VerificationMeta('lastNames');
  @override
  late final GeneratedColumn<String?> lastNames = GeneratedColumn<String?>(
      'last_names', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _idNumberMeta = const VerificationMeta('idNumber');
  @override
  late final GeneratedColumn<int?> idNumber = GeneratedColumn<int?>(
      'id_number', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: true,
      defaultConstraints: 'UNIQUE');
  final VerificationMeta _birthDateMeta = const VerificationMeta('birthDate');
  @override
  late final GeneratedColumn<DateTime?> birthDate = GeneratedColumn<DateTime?>(
      'birth_date', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _contactNumberMeta =
      const VerificationMeta('contactNumber');
  @override
  late final GeneratedColumn<int?> contactNumber = GeneratedColumn<int?>(
      'contact_number', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _mailMeta = const VerificationMeta('mail');
  @override
  late final GeneratedColumn<String?> mail = GeneratedColumn<String?>(
      'mail', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _cityMeta = const VerificationMeta('city');
  @override
  late final GeneratedColumn<String?> city = GeneratedColumn<String?>(
      'city', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _stateMeta = const VerificationMeta('state');
  @override
  late final GeneratedColumn<String?> state = GeneratedColumn<String?>(
      'state', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _adressMeta = const VerificationMeta('adress');
  @override
  late final GeneratedColumn<String?> adress = GeneratedColumn<String?>(
      'adress', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _educationMeta = const VerificationMeta('education');
  @override
  late final GeneratedColumn<String?> education = GeneratedColumn<String?>(
      'education', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _ocupationMeta = const VerificationMeta('ocupation');
  @override
  late final GeneratedColumn<String?> ocupation = GeneratedColumn<String?>(
      'ocupation', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _insuranceMeta = const VerificationMeta('insurance');
  @override
  late final GeneratedColumn<String?> insurance = GeneratedColumn<String?>(
      'insurance', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _emergencyContactNameMeta =
      const VerificationMeta('emergencyContactName');
  @override
  late final GeneratedColumn<String?> emergencyContactName =
      GeneratedColumn<String?>('emergency_contact_name', aliasedName, false,
          type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _emergencyContactNumberMeta =
      const VerificationMeta('emergencyContactNumber');
  @override
  late final GeneratedColumn<int?> emergencyContactNumber =
      GeneratedColumn<int?>('emergency_contact_number', aliasedName, false,
          type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        names,
        lastNames,
        idNumber,
        birthDate,
        contactNumber,
        mail,
        city,
        state,
        adress,
        education,
        ocupation,
        insurance,
        emergencyContactName,
        emergencyContactNumber
      ];
  @override
  String get aliasedName => _alias ?? 'patients';
  @override
  String get actualTableName => 'patients';
  @override
  VerificationContext validateIntegrity(Insertable<Patient> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('names')) {
      context.handle(
          _namesMeta, names.isAcceptableOrUnknown(data['names']!, _namesMeta));
    } else if (isInserting) {
      context.missing(_namesMeta);
    }
    if (data.containsKey('last_names')) {
      context.handle(_lastNamesMeta,
          lastNames.isAcceptableOrUnknown(data['last_names']!, _lastNamesMeta));
    } else if (isInserting) {
      context.missing(_lastNamesMeta);
    }
    if (data.containsKey('id_number')) {
      context.handle(_idNumberMeta,
          idNumber.isAcceptableOrUnknown(data['id_number']!, _idNumberMeta));
    } else if (isInserting) {
      context.missing(_idNumberMeta);
    }
    if (data.containsKey('birth_date')) {
      context.handle(_birthDateMeta,
          birthDate.isAcceptableOrUnknown(data['birth_date']!, _birthDateMeta));
    } else if (isInserting) {
      context.missing(_birthDateMeta);
    }
    if (data.containsKey('contact_number')) {
      context.handle(
          _contactNumberMeta,
          contactNumber.isAcceptableOrUnknown(
              data['contact_number']!, _contactNumberMeta));
    } else if (isInserting) {
      context.missing(_contactNumberMeta);
    }
    if (data.containsKey('mail')) {
      context.handle(
          _mailMeta, mail.isAcceptableOrUnknown(data['mail']!, _mailMeta));
    } else if (isInserting) {
      context.missing(_mailMeta);
    }
    if (data.containsKey('city')) {
      context.handle(
          _cityMeta, city.isAcceptableOrUnknown(data['city']!, _cityMeta));
    } else if (isInserting) {
      context.missing(_cityMeta);
    }
    if (data.containsKey('state')) {
      context.handle(
          _stateMeta, state.isAcceptableOrUnknown(data['state']!, _stateMeta));
    } else if (isInserting) {
      context.missing(_stateMeta);
    }
    if (data.containsKey('adress')) {
      context.handle(_adressMeta,
          adress.isAcceptableOrUnknown(data['adress']!, _adressMeta));
    } else if (isInserting) {
      context.missing(_adressMeta);
    }
    if (data.containsKey('education')) {
      context.handle(_educationMeta,
          education.isAcceptableOrUnknown(data['education']!, _educationMeta));
    } else if (isInserting) {
      context.missing(_educationMeta);
    }
    if (data.containsKey('ocupation')) {
      context.handle(_ocupationMeta,
          ocupation.isAcceptableOrUnknown(data['ocupation']!, _ocupationMeta));
    } else if (isInserting) {
      context.missing(_ocupationMeta);
    }
    if (data.containsKey('insurance')) {
      context.handle(_insuranceMeta,
          insurance.isAcceptableOrUnknown(data['insurance']!, _insuranceMeta));
    } else if (isInserting) {
      context.missing(_insuranceMeta);
    }
    if (data.containsKey('emergency_contact_name')) {
      context.handle(
          _emergencyContactNameMeta,
          emergencyContactName.isAcceptableOrUnknown(
              data['emergency_contact_name']!, _emergencyContactNameMeta));
    } else if (isInserting) {
      context.missing(_emergencyContactNameMeta);
    }
    if (data.containsKey('emergency_contact_number')) {
      context.handle(
          _emergencyContactNumberMeta,
          emergencyContactNumber.isAcceptableOrUnknown(
              data['emergency_contact_number']!, _emergencyContactNumberMeta));
    } else if (isInserting) {
      context.missing(_emergencyContactNumberMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Patient map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Patient.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $PatientsTable createAlias(String alias) {
    return $PatientsTable(attachedDatabase, alias);
  }
}

class ClinicHistoryData extends DataClass
    implements Insertable<ClinicHistoryData> {
  final int id;
  final String registerNumber;
  final DateTime currentDate;
  final String consultationReason;
  final String mentalExamination;
  final String treatment;
  final String medAntecedents;
  final String psiAntecedents;
  final String familyHistory;
  final String personalHistory;
  final String diagnostic;
  final int idNumber;
  ClinicHistoryData(
      {required this.id,
      required this.registerNumber,
      required this.currentDate,
      required this.consultationReason,
      required this.mentalExamination,
      required this.treatment,
      required this.medAntecedents,
      required this.psiAntecedents,
      required this.familyHistory,
      required this.personalHistory,
      required this.diagnostic,
      required this.idNumber});
  factory ClinicHistoryData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return ClinicHistoryData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      registerNumber: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}register_number'])!,
      currentDate: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}current_date'])!,
      consultationReason: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}consultation_reason'])!,
      mentalExamination: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}mental_examination'])!,
      treatment: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}treatment'])!,
      medAntecedents: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}med_antecedents'])!,
      psiAntecedents: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}psi_antecedents'])!,
      familyHistory: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}family_history'])!,
      personalHistory: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}personal_history'])!,
      diagnostic: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}diagnostic'])!,
      idNumber: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_number'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['register_number'] = Variable<String>(registerNumber);
    map['current_date'] = Variable<DateTime>(currentDate);
    map['consultation_reason'] = Variable<String>(consultationReason);
    map['mental_examination'] = Variable<String>(mentalExamination);
    map['treatment'] = Variable<String>(treatment);
    map['med_antecedents'] = Variable<String>(medAntecedents);
    map['psi_antecedents'] = Variable<String>(psiAntecedents);
    map['family_history'] = Variable<String>(familyHistory);
    map['personal_history'] = Variable<String>(personalHistory);
    map['diagnostic'] = Variable<String>(diagnostic);
    map['id_number'] = Variable<int>(idNumber);
    return map;
  }

  ClinicHistoryCompanion toCompanion(bool nullToAbsent) {
    return ClinicHistoryCompanion(
      id: Value(id),
      registerNumber: Value(registerNumber),
      currentDate: Value(currentDate),
      consultationReason: Value(consultationReason),
      mentalExamination: Value(mentalExamination),
      treatment: Value(treatment),
      medAntecedents: Value(medAntecedents),
      psiAntecedents: Value(psiAntecedents),
      familyHistory: Value(familyHistory),
      personalHistory: Value(personalHistory),
      diagnostic: Value(diagnostic),
      idNumber: Value(idNumber),
    );
  }

  factory ClinicHistoryData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ClinicHistoryData(
      id: serializer.fromJson<int>(json['id']),
      registerNumber: serializer.fromJson<String>(json['registerNumber']),
      currentDate: serializer.fromJson<DateTime>(json['currentDate']),
      consultationReason:
          serializer.fromJson<String>(json['consultationReason']),
      mentalExamination: serializer.fromJson<String>(json['mentalExamination']),
      treatment: serializer.fromJson<String>(json['treatment']),
      medAntecedents: serializer.fromJson<String>(json['medAntecedents']),
      psiAntecedents: serializer.fromJson<String>(json['psiAntecedents']),
      familyHistory: serializer.fromJson<String>(json['familyHistory']),
      personalHistory: serializer.fromJson<String>(json['personalHistory']),
      diagnostic: serializer.fromJson<String>(json['diagnostic']),
      idNumber: serializer.fromJson<int>(json['idNumber']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'registerNumber': serializer.toJson<String>(registerNumber),
      'currentDate': serializer.toJson<DateTime>(currentDate),
      'consultationReason': serializer.toJson<String>(consultationReason),
      'mentalExamination': serializer.toJson<String>(mentalExamination),
      'treatment': serializer.toJson<String>(treatment),
      'medAntecedents': serializer.toJson<String>(medAntecedents),
      'psiAntecedents': serializer.toJson<String>(psiAntecedents),
      'familyHistory': serializer.toJson<String>(familyHistory),
      'personalHistory': serializer.toJson<String>(personalHistory),
      'diagnostic': serializer.toJson<String>(diagnostic),
      'idNumber': serializer.toJson<int>(idNumber),
    };
  }

  ClinicHistoryData copyWith(
          {int? id,
          String? registerNumber,
          DateTime? currentDate,
          String? consultationReason,
          String? mentalExamination,
          String? treatment,
          String? medAntecedents,
          String? psiAntecedents,
          String? familyHistory,
          String? personalHistory,
          String? diagnostic,
          int? idNumber}) =>
      ClinicHistoryData(
        id: id ?? this.id,
        registerNumber: registerNumber ?? this.registerNumber,
        currentDate: currentDate ?? this.currentDate,
        consultationReason: consultationReason ?? this.consultationReason,
        mentalExamination: mentalExamination ?? this.mentalExamination,
        treatment: treatment ?? this.treatment,
        medAntecedents: medAntecedents ?? this.medAntecedents,
        psiAntecedents: psiAntecedents ?? this.psiAntecedents,
        familyHistory: familyHistory ?? this.familyHistory,
        personalHistory: personalHistory ?? this.personalHistory,
        diagnostic: diagnostic ?? this.diagnostic,
        idNumber: idNumber ?? this.idNumber,
      );
  @override
  String toString() {
    return (StringBuffer('ClinicHistoryData(')
          ..write('id: $id, ')
          ..write('registerNumber: $registerNumber, ')
          ..write('currentDate: $currentDate, ')
          ..write('consultationReason: $consultationReason, ')
          ..write('mentalExamination: $mentalExamination, ')
          ..write('treatment: $treatment, ')
          ..write('medAntecedents: $medAntecedents, ')
          ..write('psiAntecedents: $psiAntecedents, ')
          ..write('familyHistory: $familyHistory, ')
          ..write('personalHistory: $personalHistory, ')
          ..write('diagnostic: $diagnostic, ')
          ..write('idNumber: $idNumber')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      registerNumber,
      currentDate,
      consultationReason,
      mentalExamination,
      treatment,
      medAntecedents,
      psiAntecedents,
      familyHistory,
      personalHistory,
      diagnostic,
      idNumber);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ClinicHistoryData &&
          other.id == this.id &&
          other.registerNumber == this.registerNumber &&
          other.currentDate == this.currentDate &&
          other.consultationReason == this.consultationReason &&
          other.mentalExamination == this.mentalExamination &&
          other.treatment == this.treatment &&
          other.medAntecedents == this.medAntecedents &&
          other.psiAntecedents == this.psiAntecedents &&
          other.familyHistory == this.familyHistory &&
          other.personalHistory == this.personalHistory &&
          other.diagnostic == this.diagnostic &&
          other.idNumber == this.idNumber);
}

class ClinicHistoryCompanion extends UpdateCompanion<ClinicHistoryData> {
  final Value<int> id;
  final Value<String> registerNumber;
  final Value<DateTime> currentDate;
  final Value<String> consultationReason;
  final Value<String> mentalExamination;
  final Value<String> treatment;
  final Value<String> medAntecedents;
  final Value<String> psiAntecedents;
  final Value<String> familyHistory;
  final Value<String> personalHistory;
  final Value<String> diagnostic;
  final Value<int> idNumber;
  const ClinicHistoryCompanion({
    this.id = const Value.absent(),
    this.registerNumber = const Value.absent(),
    this.currentDate = const Value.absent(),
    this.consultationReason = const Value.absent(),
    this.mentalExamination = const Value.absent(),
    this.treatment = const Value.absent(),
    this.medAntecedents = const Value.absent(),
    this.psiAntecedents = const Value.absent(),
    this.familyHistory = const Value.absent(),
    this.personalHistory = const Value.absent(),
    this.diagnostic = const Value.absent(),
    this.idNumber = const Value.absent(),
  });
  ClinicHistoryCompanion.insert({
    this.id = const Value.absent(),
    required String registerNumber,
    required DateTime currentDate,
    required String consultationReason,
    required String mentalExamination,
    required String treatment,
    required String medAntecedents,
    required String psiAntecedents,
    required String familyHistory,
    required String personalHistory,
    required String diagnostic,
    required int idNumber,
  })  : registerNumber = Value(registerNumber),
        currentDate = Value(currentDate),
        consultationReason = Value(consultationReason),
        mentalExamination = Value(mentalExamination),
        treatment = Value(treatment),
        medAntecedents = Value(medAntecedents),
        psiAntecedents = Value(psiAntecedents),
        familyHistory = Value(familyHistory),
        personalHistory = Value(personalHistory),
        diagnostic = Value(diagnostic),
        idNumber = Value(idNumber);
  static Insertable<ClinicHistoryData> custom({
    Expression<int>? id,
    Expression<String>? registerNumber,
    Expression<DateTime>? currentDate,
    Expression<String>? consultationReason,
    Expression<String>? mentalExamination,
    Expression<String>? treatment,
    Expression<String>? medAntecedents,
    Expression<String>? psiAntecedents,
    Expression<String>? familyHistory,
    Expression<String>? personalHistory,
    Expression<String>? diagnostic,
    Expression<int>? idNumber,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (registerNumber != null) 'register_number': registerNumber,
      if (currentDate != null) 'current_date': currentDate,
      if (consultationReason != null) 'consultation_reason': consultationReason,
      if (mentalExamination != null) 'mental_examination': mentalExamination,
      if (treatment != null) 'treatment': treatment,
      if (medAntecedents != null) 'med_antecedents': medAntecedents,
      if (psiAntecedents != null) 'psi_antecedents': psiAntecedents,
      if (familyHistory != null) 'family_history': familyHistory,
      if (personalHistory != null) 'personal_history': personalHistory,
      if (diagnostic != null) 'diagnostic': diagnostic,
      if (idNumber != null) 'id_number': idNumber,
    });
  }

  ClinicHistoryCompanion copyWith(
      {Value<int>? id,
      Value<String>? registerNumber,
      Value<DateTime>? currentDate,
      Value<String>? consultationReason,
      Value<String>? mentalExamination,
      Value<String>? treatment,
      Value<String>? medAntecedents,
      Value<String>? psiAntecedents,
      Value<String>? familyHistory,
      Value<String>? personalHistory,
      Value<String>? diagnostic,
      Value<int>? idNumber}) {
    return ClinicHistoryCompanion(
      id: id ?? this.id,
      registerNumber: registerNumber ?? this.registerNumber,
      currentDate: currentDate ?? this.currentDate,
      consultationReason: consultationReason ?? this.consultationReason,
      mentalExamination: mentalExamination ?? this.mentalExamination,
      treatment: treatment ?? this.treatment,
      medAntecedents: medAntecedents ?? this.medAntecedents,
      psiAntecedents: psiAntecedents ?? this.psiAntecedents,
      familyHistory: familyHistory ?? this.familyHistory,
      personalHistory: personalHistory ?? this.personalHistory,
      diagnostic: diagnostic ?? this.diagnostic,
      idNumber: idNumber ?? this.idNumber,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (registerNumber.present) {
      map['register_number'] = Variable<String>(registerNumber.value);
    }
    if (currentDate.present) {
      map['current_date'] = Variable<DateTime>(currentDate.value);
    }
    if (consultationReason.present) {
      map['consultation_reason'] = Variable<String>(consultationReason.value);
    }
    if (mentalExamination.present) {
      map['mental_examination'] = Variable<String>(mentalExamination.value);
    }
    if (treatment.present) {
      map['treatment'] = Variable<String>(treatment.value);
    }
    if (medAntecedents.present) {
      map['med_antecedents'] = Variable<String>(medAntecedents.value);
    }
    if (psiAntecedents.present) {
      map['psi_antecedents'] = Variable<String>(psiAntecedents.value);
    }
    if (familyHistory.present) {
      map['family_history'] = Variable<String>(familyHistory.value);
    }
    if (personalHistory.present) {
      map['personal_history'] = Variable<String>(personalHistory.value);
    }
    if (diagnostic.present) {
      map['diagnostic'] = Variable<String>(diagnostic.value);
    }
    if (idNumber.present) {
      map['id_number'] = Variable<int>(idNumber.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ClinicHistoryCompanion(')
          ..write('id: $id, ')
          ..write('registerNumber: $registerNumber, ')
          ..write('currentDate: $currentDate, ')
          ..write('consultationReason: $consultationReason, ')
          ..write('mentalExamination: $mentalExamination, ')
          ..write('treatment: $treatment, ')
          ..write('medAntecedents: $medAntecedents, ')
          ..write('psiAntecedents: $psiAntecedents, ')
          ..write('familyHistory: $familyHistory, ')
          ..write('personalHistory: $personalHistory, ')
          ..write('diagnostic: $diagnostic, ')
          ..write('idNumber: $idNumber')
          ..write(')'))
        .toString();
  }
}

class $ClinicHistoryTable extends ClinicHistory
    with TableInfo<$ClinicHistoryTable, ClinicHistoryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ClinicHistoryTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _registerNumberMeta =
      const VerificationMeta('registerNumber');
  @override
  late final GeneratedColumn<String?> registerNumber = GeneratedColumn<String?>(
      'register_number', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _currentDateMeta =
      const VerificationMeta('currentDate');
  @override
  late final GeneratedColumn<DateTime?> currentDate =
      GeneratedColumn<DateTime?>('current_date', aliasedName, false,
          type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _consultationReasonMeta =
      const VerificationMeta('consultationReason');
  @override
  late final GeneratedColumn<String?> consultationReason =
      GeneratedColumn<String?>('consultation_reason', aliasedName, false,
          type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _mentalExaminationMeta =
      const VerificationMeta('mentalExamination');
  @override
  late final GeneratedColumn<String?> mentalExamination =
      GeneratedColumn<String?>('mental_examination', aliasedName, false,
          type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _treatmentMeta = const VerificationMeta('treatment');
  @override
  late final GeneratedColumn<String?> treatment = GeneratedColumn<String?>(
      'treatment', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _medAntecedentsMeta =
      const VerificationMeta('medAntecedents');
  @override
  late final GeneratedColumn<String?> medAntecedents = GeneratedColumn<String?>(
      'med_antecedents', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _psiAntecedentsMeta =
      const VerificationMeta('psiAntecedents');
  @override
  late final GeneratedColumn<String?> psiAntecedents = GeneratedColumn<String?>(
      'psi_antecedents', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _familyHistoryMeta =
      const VerificationMeta('familyHistory');
  @override
  late final GeneratedColumn<String?> familyHistory = GeneratedColumn<String?>(
      'family_history', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _personalHistoryMeta =
      const VerificationMeta('personalHistory');
  @override
  late final GeneratedColumn<String?> personalHistory =
      GeneratedColumn<String?>('personal_history', aliasedName, false,
          type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _diagnosticMeta = const VerificationMeta('diagnostic');
  @override
  late final GeneratedColumn<String?> diagnostic = GeneratedColumn<String?>(
      'diagnostic', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _idNumberMeta = const VerificationMeta('idNumber');
  @override
  late final GeneratedColumn<int?> idNumber = GeneratedColumn<int?>(
      'id_number', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES patients (id_number)');
  @override
  List<GeneratedColumn> get $columns => [
        id,
        registerNumber,
        currentDate,
        consultationReason,
        mentalExamination,
        treatment,
        medAntecedents,
        psiAntecedents,
        familyHistory,
        personalHistory,
        diagnostic,
        idNumber
      ];
  @override
  String get aliasedName => _alias ?? 'clinic_history';
  @override
  String get actualTableName => 'clinic_history';
  @override
  VerificationContext validateIntegrity(Insertable<ClinicHistoryData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('register_number')) {
      context.handle(
          _registerNumberMeta,
          registerNumber.isAcceptableOrUnknown(
              data['register_number']!, _registerNumberMeta));
    } else if (isInserting) {
      context.missing(_registerNumberMeta);
    }
    if (data.containsKey('current_date')) {
      context.handle(
          _currentDateMeta,
          currentDate.isAcceptableOrUnknown(
              data['current_date']!, _currentDateMeta));
    } else if (isInserting) {
      context.missing(_currentDateMeta);
    }
    if (data.containsKey('consultation_reason')) {
      context.handle(
          _consultationReasonMeta,
          consultationReason.isAcceptableOrUnknown(
              data['consultation_reason']!, _consultationReasonMeta));
    } else if (isInserting) {
      context.missing(_consultationReasonMeta);
    }
    if (data.containsKey('mental_examination')) {
      context.handle(
          _mentalExaminationMeta,
          mentalExamination.isAcceptableOrUnknown(
              data['mental_examination']!, _mentalExaminationMeta));
    } else if (isInserting) {
      context.missing(_mentalExaminationMeta);
    }
    if (data.containsKey('treatment')) {
      context.handle(_treatmentMeta,
          treatment.isAcceptableOrUnknown(data['treatment']!, _treatmentMeta));
    } else if (isInserting) {
      context.missing(_treatmentMeta);
    }
    if (data.containsKey('med_antecedents')) {
      context.handle(
          _medAntecedentsMeta,
          medAntecedents.isAcceptableOrUnknown(
              data['med_antecedents']!, _medAntecedentsMeta));
    } else if (isInserting) {
      context.missing(_medAntecedentsMeta);
    }
    if (data.containsKey('psi_antecedents')) {
      context.handle(
          _psiAntecedentsMeta,
          psiAntecedents.isAcceptableOrUnknown(
              data['psi_antecedents']!, _psiAntecedentsMeta));
    } else if (isInserting) {
      context.missing(_psiAntecedentsMeta);
    }
    if (data.containsKey('family_history')) {
      context.handle(
          _familyHistoryMeta,
          familyHistory.isAcceptableOrUnknown(
              data['family_history']!, _familyHistoryMeta));
    } else if (isInserting) {
      context.missing(_familyHistoryMeta);
    }
    if (data.containsKey('personal_history')) {
      context.handle(
          _personalHistoryMeta,
          personalHistory.isAcceptableOrUnknown(
              data['personal_history']!, _personalHistoryMeta));
    } else if (isInserting) {
      context.missing(_personalHistoryMeta);
    }
    if (data.containsKey('diagnostic')) {
      context.handle(
          _diagnosticMeta,
          diagnostic.isAcceptableOrUnknown(
              data['diagnostic']!, _diagnosticMeta));
    } else if (isInserting) {
      context.missing(_diagnosticMeta);
    }
    if (data.containsKey('id_number')) {
      context.handle(_idNumberMeta,
          idNumber.isAcceptableOrUnknown(data['id_number']!, _idNumberMeta));
    } else if (isInserting) {
      context.missing(_idNumberMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ClinicHistoryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return ClinicHistoryData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ClinicHistoryTable createAlias(String alias) {
    return $ClinicHistoryTable(attachedDatabase, alias);
  }
}

class Session extends DataClass implements Insertable<Session> {
  final int sessionId;
  final DateTime sessionDate;
  final String sessionSummary;
  final String sessionObjectives;
  final String therapeuticArchievements;
  final int idNumber;
  final String professionalName;
  Session(
      {required this.sessionId,
      required this.sessionDate,
      required this.sessionSummary,
      required this.sessionObjectives,
      required this.therapeuticArchievements,
      required this.idNumber,
      required this.professionalName});
  factory Session.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Session(
      sessionId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}session_id'])!,
      sessionDate: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}session_date'])!,
      sessionSummary: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}session_summary'])!,
      sessionObjectives: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}session_objectives'])!,
      therapeuticArchievements: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}therapeutic_archievements'])!,
      idNumber: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_number'])!,
      professionalName: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}professional_name'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['session_id'] = Variable<int>(sessionId);
    map['session_date'] = Variable<DateTime>(sessionDate);
    map['session_summary'] = Variable<String>(sessionSummary);
    map['session_objectives'] = Variable<String>(sessionObjectives);
    map['therapeutic_archievements'] =
        Variable<String>(therapeuticArchievements);
    map['id_number'] = Variable<int>(idNumber);
    map['professional_name'] = Variable<String>(professionalName);
    return map;
  }

  SessionsCompanion toCompanion(bool nullToAbsent) {
    return SessionsCompanion(
      sessionId: Value(sessionId),
      sessionDate: Value(sessionDate),
      sessionSummary: Value(sessionSummary),
      sessionObjectives: Value(sessionObjectives),
      therapeuticArchievements: Value(therapeuticArchievements),
      idNumber: Value(idNumber),
      professionalName: Value(professionalName),
    );
  }

  factory Session.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Session(
      sessionId: serializer.fromJson<int>(json['sessionId']),
      sessionDate: serializer.fromJson<DateTime>(json['sessionDate']),
      sessionSummary: serializer.fromJson<String>(json['sessionSummary']),
      sessionObjectives: serializer.fromJson<String>(json['sessionObjectives']),
      therapeuticArchievements:
          serializer.fromJson<String>(json['therapeuticArchievements']),
      idNumber: serializer.fromJson<int>(json['idNumber']),
      professionalName: serializer.fromJson<String>(json['professionalName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'sessionId': serializer.toJson<int>(sessionId),
      'sessionDate': serializer.toJson<DateTime>(sessionDate),
      'sessionSummary': serializer.toJson<String>(sessionSummary),
      'sessionObjectives': serializer.toJson<String>(sessionObjectives),
      'therapeuticArchievements':
          serializer.toJson<String>(therapeuticArchievements),
      'idNumber': serializer.toJson<int>(idNumber),
      'professionalName': serializer.toJson<String>(professionalName),
    };
  }

  Session copyWith(
          {int? sessionId,
          DateTime? sessionDate,
          String? sessionSummary,
          String? sessionObjectives,
          String? therapeuticArchievements,
          int? idNumber,
          String? professionalName}) =>
      Session(
        sessionId: sessionId ?? this.sessionId,
        sessionDate: sessionDate ?? this.sessionDate,
        sessionSummary: sessionSummary ?? this.sessionSummary,
        sessionObjectives: sessionObjectives ?? this.sessionObjectives,
        therapeuticArchievements:
            therapeuticArchievements ?? this.therapeuticArchievements,
        idNumber: idNumber ?? this.idNumber,
        professionalName: professionalName ?? this.professionalName,
      );
  @override
  String toString() {
    return (StringBuffer('Session(')
          ..write('sessionId: $sessionId, ')
          ..write('sessionDate: $sessionDate, ')
          ..write('sessionSummary: $sessionSummary, ')
          ..write('sessionObjectives: $sessionObjectives, ')
          ..write('therapeuticArchievements: $therapeuticArchievements, ')
          ..write('idNumber: $idNumber, ')
          ..write('professionalName: $professionalName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(sessionId, sessionDate, sessionSummary,
      sessionObjectives, therapeuticArchievements, idNumber, professionalName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Session &&
          other.sessionId == this.sessionId &&
          other.sessionDate == this.sessionDate &&
          other.sessionSummary == this.sessionSummary &&
          other.sessionObjectives == this.sessionObjectives &&
          other.therapeuticArchievements == this.therapeuticArchievements &&
          other.idNumber == this.idNumber &&
          other.professionalName == this.professionalName);
}

class SessionsCompanion extends UpdateCompanion<Session> {
  final Value<int> sessionId;
  final Value<DateTime> sessionDate;
  final Value<String> sessionSummary;
  final Value<String> sessionObjectives;
  final Value<String> therapeuticArchievements;
  final Value<int> idNumber;
  final Value<String> professionalName;
  const SessionsCompanion({
    this.sessionId = const Value.absent(),
    this.sessionDate = const Value.absent(),
    this.sessionSummary = const Value.absent(),
    this.sessionObjectives = const Value.absent(),
    this.therapeuticArchievements = const Value.absent(),
    this.idNumber = const Value.absent(),
    this.professionalName = const Value.absent(),
  });
  SessionsCompanion.insert({
    this.sessionId = const Value.absent(),
    required DateTime sessionDate,
    required String sessionSummary,
    required String sessionObjectives,
    required String therapeuticArchievements,
    required int idNumber,
    required String professionalName,
  })  : sessionDate = Value(sessionDate),
        sessionSummary = Value(sessionSummary),
        sessionObjectives = Value(sessionObjectives),
        therapeuticArchievements = Value(therapeuticArchievements),
        idNumber = Value(idNumber),
        professionalName = Value(professionalName);
  static Insertable<Session> custom({
    Expression<int>? sessionId,
    Expression<DateTime>? sessionDate,
    Expression<String>? sessionSummary,
    Expression<String>? sessionObjectives,
    Expression<String>? therapeuticArchievements,
    Expression<int>? idNumber,
    Expression<String>? professionalName,
  }) {
    return RawValuesInsertable({
      if (sessionId != null) 'session_id': sessionId,
      if (sessionDate != null) 'session_date': sessionDate,
      if (sessionSummary != null) 'session_summary': sessionSummary,
      if (sessionObjectives != null) 'session_objectives': sessionObjectives,
      if (therapeuticArchievements != null)
        'therapeutic_archievements': therapeuticArchievements,
      if (idNumber != null) 'id_number': idNumber,
      if (professionalName != null) 'professional_name': professionalName,
    });
  }

  SessionsCompanion copyWith(
      {Value<int>? sessionId,
      Value<DateTime>? sessionDate,
      Value<String>? sessionSummary,
      Value<String>? sessionObjectives,
      Value<String>? therapeuticArchievements,
      Value<int>? idNumber,
      Value<String>? professionalName}) {
    return SessionsCompanion(
      sessionId: sessionId ?? this.sessionId,
      sessionDate: sessionDate ?? this.sessionDate,
      sessionSummary: sessionSummary ?? this.sessionSummary,
      sessionObjectives: sessionObjectives ?? this.sessionObjectives,
      therapeuticArchievements:
          therapeuticArchievements ?? this.therapeuticArchievements,
      idNumber: idNumber ?? this.idNumber,
      professionalName: professionalName ?? this.professionalName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (sessionId.present) {
      map['session_id'] = Variable<int>(sessionId.value);
    }
    if (sessionDate.present) {
      map['session_date'] = Variable<DateTime>(sessionDate.value);
    }
    if (sessionSummary.present) {
      map['session_summary'] = Variable<String>(sessionSummary.value);
    }
    if (sessionObjectives.present) {
      map['session_objectives'] = Variable<String>(sessionObjectives.value);
    }
    if (therapeuticArchievements.present) {
      map['therapeutic_archievements'] =
          Variable<String>(therapeuticArchievements.value);
    }
    if (idNumber.present) {
      map['id_number'] = Variable<int>(idNumber.value);
    }
    if (professionalName.present) {
      map['professional_name'] = Variable<String>(professionalName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SessionsCompanion(')
          ..write('sessionId: $sessionId, ')
          ..write('sessionDate: $sessionDate, ')
          ..write('sessionSummary: $sessionSummary, ')
          ..write('sessionObjectives: $sessionObjectives, ')
          ..write('therapeuticArchievements: $therapeuticArchievements, ')
          ..write('idNumber: $idNumber, ')
          ..write('professionalName: $professionalName')
          ..write(')'))
        .toString();
  }
}

class $SessionsTable extends Sessions with TableInfo<$SessionsTable, Session> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SessionsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _sessionIdMeta = const VerificationMeta('sessionId');
  @override
  late final GeneratedColumn<int?> sessionId = GeneratedColumn<int?>(
      'session_id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _sessionDateMeta =
      const VerificationMeta('sessionDate');
  @override
  late final GeneratedColumn<DateTime?> sessionDate =
      GeneratedColumn<DateTime?>('session_date', aliasedName, false,
          type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _sessionSummaryMeta =
      const VerificationMeta('sessionSummary');
  @override
  late final GeneratedColumn<String?> sessionSummary = GeneratedColumn<String?>(
      'session_summary', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _sessionObjectivesMeta =
      const VerificationMeta('sessionObjectives');
  @override
  late final GeneratedColumn<String?> sessionObjectives =
      GeneratedColumn<String?>('session_objectives', aliasedName, false,
          type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _therapeuticArchievementsMeta =
      const VerificationMeta('therapeuticArchievements');
  @override
  late final GeneratedColumn<String?> therapeuticArchievements =
      GeneratedColumn<String?>('therapeutic_archievements', aliasedName, false,
          type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _idNumberMeta = const VerificationMeta('idNumber');
  @override
  late final GeneratedColumn<int?> idNumber = GeneratedColumn<int?>(
      'id_number', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES clinic_history (id_number)');
  final VerificationMeta _professionalNameMeta =
      const VerificationMeta('professionalName');
  @override
  late final GeneratedColumn<String?> professionalName =
      GeneratedColumn<String?>('professional_name', aliasedName, false,
          type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        sessionId,
        sessionDate,
        sessionSummary,
        sessionObjectives,
        therapeuticArchievements,
        idNumber,
        professionalName
      ];
  @override
  String get aliasedName => _alias ?? 'sessions';
  @override
  String get actualTableName => 'sessions';
  @override
  VerificationContext validateIntegrity(Insertable<Session> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('session_id')) {
      context.handle(_sessionIdMeta,
          sessionId.isAcceptableOrUnknown(data['session_id']!, _sessionIdMeta));
    }
    if (data.containsKey('session_date')) {
      context.handle(
          _sessionDateMeta,
          sessionDate.isAcceptableOrUnknown(
              data['session_date']!, _sessionDateMeta));
    } else if (isInserting) {
      context.missing(_sessionDateMeta);
    }
    if (data.containsKey('session_summary')) {
      context.handle(
          _sessionSummaryMeta,
          sessionSummary.isAcceptableOrUnknown(
              data['session_summary']!, _sessionSummaryMeta));
    } else if (isInserting) {
      context.missing(_sessionSummaryMeta);
    }
    if (data.containsKey('session_objectives')) {
      context.handle(
          _sessionObjectivesMeta,
          sessionObjectives.isAcceptableOrUnknown(
              data['session_objectives']!, _sessionObjectivesMeta));
    } else if (isInserting) {
      context.missing(_sessionObjectivesMeta);
    }
    if (data.containsKey('therapeutic_archievements')) {
      context.handle(
          _therapeuticArchievementsMeta,
          therapeuticArchievements.isAcceptableOrUnknown(
              data['therapeutic_archievements']!,
              _therapeuticArchievementsMeta));
    } else if (isInserting) {
      context.missing(_therapeuticArchievementsMeta);
    }
    if (data.containsKey('id_number')) {
      context.handle(_idNumberMeta,
          idNumber.isAcceptableOrUnknown(data['id_number']!, _idNumberMeta));
    } else if (isInserting) {
      context.missing(_idNumberMeta);
    }
    if (data.containsKey('professional_name')) {
      context.handle(
          _professionalNameMeta,
          professionalName.isAcceptableOrUnknown(
              data['professional_name']!, _professionalNameMeta));
    } else if (isInserting) {
      context.missing(_professionalNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {sessionId};
  @override
  Session map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Session.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $SessionsTable createAlias(String alias) {
    return $SessionsTable(attachedDatabase, alias);
  }
}

class ProfessionalData extends DataClass
    implements Insertable<ProfessionalData> {
  final int personalID;
  final String names;
  final String lastNames;
  final String profession;
  final int professionalID;
  final String userName;
  final String password;
  ProfessionalData(
      {required this.personalID,
      required this.names,
      required this.lastNames,
      required this.profession,
      required this.professionalID,
      required this.userName,
      required this.password});
  factory ProfessionalData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return ProfessionalData(
      personalID: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}personal_i_d'])!,
      names: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}names'])!,
      lastNames: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}last_names'])!,
      profession: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}profession'])!,
      professionalID: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}professional_i_d'])!,
      userName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_name'])!,
      password: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}password'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['personal_i_d'] = Variable<int>(personalID);
    map['names'] = Variable<String>(names);
    map['last_names'] = Variable<String>(lastNames);
    map['profession'] = Variable<String>(profession);
    map['professional_i_d'] = Variable<int>(professionalID);
    map['user_name'] = Variable<String>(userName);
    map['password'] = Variable<String>(password);
    return map;
  }

  ProfessionalCompanion toCompanion(bool nullToAbsent) {
    return ProfessionalCompanion(
      personalID: Value(personalID),
      names: Value(names),
      lastNames: Value(lastNames),
      profession: Value(profession),
      professionalID: Value(professionalID),
      userName: Value(userName),
      password: Value(password),
    );
  }

  factory ProfessionalData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProfessionalData(
      personalID: serializer.fromJson<int>(json['personalID']),
      names: serializer.fromJson<String>(json['names']),
      lastNames: serializer.fromJson<String>(json['lastNames']),
      profession: serializer.fromJson<String>(json['profession']),
      professionalID: serializer.fromJson<int>(json['professionalID']),
      userName: serializer.fromJson<String>(json['userName']),
      password: serializer.fromJson<String>(json['password']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'personalID': serializer.toJson<int>(personalID),
      'names': serializer.toJson<String>(names),
      'lastNames': serializer.toJson<String>(lastNames),
      'profession': serializer.toJson<String>(profession),
      'professionalID': serializer.toJson<int>(professionalID),
      'userName': serializer.toJson<String>(userName),
      'password': serializer.toJson<String>(password),
    };
  }

  ProfessionalData copyWith(
          {int? personalID,
          String? names,
          String? lastNames,
          String? profession,
          int? professionalID,
          String? userName,
          String? password}) =>
      ProfessionalData(
        personalID: personalID ?? this.personalID,
        names: names ?? this.names,
        lastNames: lastNames ?? this.lastNames,
        profession: profession ?? this.profession,
        professionalID: professionalID ?? this.professionalID,
        userName: userName ?? this.userName,
        password: password ?? this.password,
      );
  @override
  String toString() {
    return (StringBuffer('ProfessionalData(')
          ..write('personalID: $personalID, ')
          ..write('names: $names, ')
          ..write('lastNames: $lastNames, ')
          ..write('profession: $profession, ')
          ..write('professionalID: $professionalID, ')
          ..write('userName: $userName, ')
          ..write('password: $password')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(personalID, names, lastNames, profession,
      professionalID, userName, password);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProfessionalData &&
          other.personalID == this.personalID &&
          other.names == this.names &&
          other.lastNames == this.lastNames &&
          other.profession == this.profession &&
          other.professionalID == this.professionalID &&
          other.userName == this.userName &&
          other.password == this.password);
}

class ProfessionalCompanion extends UpdateCompanion<ProfessionalData> {
  final Value<int> personalID;
  final Value<String> names;
  final Value<String> lastNames;
  final Value<String> profession;
  final Value<int> professionalID;
  final Value<String> userName;
  final Value<String> password;
  const ProfessionalCompanion({
    this.personalID = const Value.absent(),
    this.names = const Value.absent(),
    this.lastNames = const Value.absent(),
    this.profession = const Value.absent(),
    this.professionalID = const Value.absent(),
    this.userName = const Value.absent(),
    this.password = const Value.absent(),
  });
  ProfessionalCompanion.insert({
    required int personalID,
    required String names,
    required String lastNames,
    required String profession,
    required int professionalID,
    required String userName,
    required String password,
  })  : personalID = Value(personalID),
        names = Value(names),
        lastNames = Value(lastNames),
        profession = Value(profession),
        professionalID = Value(professionalID),
        userName = Value(userName),
        password = Value(password);
  static Insertable<ProfessionalData> custom({
    Expression<int>? personalID,
    Expression<String>? names,
    Expression<String>? lastNames,
    Expression<String>? profession,
    Expression<int>? professionalID,
    Expression<String>? userName,
    Expression<String>? password,
  }) {
    return RawValuesInsertable({
      if (personalID != null) 'personal_i_d': personalID,
      if (names != null) 'names': names,
      if (lastNames != null) 'last_names': lastNames,
      if (profession != null) 'profession': profession,
      if (professionalID != null) 'professional_i_d': professionalID,
      if (userName != null) 'user_name': userName,
      if (password != null) 'password': password,
    });
  }

  ProfessionalCompanion copyWith(
      {Value<int>? personalID,
      Value<String>? names,
      Value<String>? lastNames,
      Value<String>? profession,
      Value<int>? professionalID,
      Value<String>? userName,
      Value<String>? password}) {
    return ProfessionalCompanion(
      personalID: personalID ?? this.personalID,
      names: names ?? this.names,
      lastNames: lastNames ?? this.lastNames,
      profession: profession ?? this.profession,
      professionalID: professionalID ?? this.professionalID,
      userName: userName ?? this.userName,
      password: password ?? this.password,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (personalID.present) {
      map['personal_i_d'] = Variable<int>(personalID.value);
    }
    if (names.present) {
      map['names'] = Variable<String>(names.value);
    }
    if (lastNames.present) {
      map['last_names'] = Variable<String>(lastNames.value);
    }
    if (profession.present) {
      map['profession'] = Variable<String>(profession.value);
    }
    if (professionalID.present) {
      map['professional_i_d'] = Variable<int>(professionalID.value);
    }
    if (userName.present) {
      map['user_name'] = Variable<String>(userName.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProfessionalCompanion(')
          ..write('personalID: $personalID, ')
          ..write('names: $names, ')
          ..write('lastNames: $lastNames, ')
          ..write('profession: $profession, ')
          ..write('professionalID: $professionalID, ')
          ..write('userName: $userName, ')
          ..write('password: $password')
          ..write(')'))
        .toString();
  }
}

class $ProfessionalTable extends Professional
    with TableInfo<$ProfessionalTable, ProfessionalData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProfessionalTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _personalIDMeta = const VerificationMeta('personalID');
  @override
  late final GeneratedColumn<int?> personalID = GeneratedColumn<int?>(
      'personal_i_d', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: true,
      defaultConstraints: 'UNIQUE');
  final VerificationMeta _namesMeta = const VerificationMeta('names');
  @override
  late final GeneratedColumn<String?> names = GeneratedColumn<String?>(
      'names', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _lastNamesMeta = const VerificationMeta('lastNames');
  @override
  late final GeneratedColumn<String?> lastNames = GeneratedColumn<String?>(
      'last_names', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _professionMeta = const VerificationMeta('profession');
  @override
  late final GeneratedColumn<String?> profession = GeneratedColumn<String?>(
      'profession', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _professionalIDMeta =
      const VerificationMeta('professionalID');
  @override
  late final GeneratedColumn<int?> professionalID = GeneratedColumn<int?>(
      'professional_i_d', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _userNameMeta = const VerificationMeta('userName');
  @override
  late final GeneratedColumn<String?> userName = GeneratedColumn<String?>(
      'user_name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _passwordMeta = const VerificationMeta('password');
  @override
  late final GeneratedColumn<String?> password = GeneratedColumn<String?>(
      'password', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        personalID,
        names,
        lastNames,
        profession,
        professionalID,
        userName,
        password
      ];
  @override
  String get aliasedName => _alias ?? 'professional';
  @override
  String get actualTableName => 'professional';
  @override
  VerificationContext validateIntegrity(Insertable<ProfessionalData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('personal_i_d')) {
      context.handle(
          _personalIDMeta,
          personalID.isAcceptableOrUnknown(
              data['personal_i_d']!, _personalIDMeta));
    } else if (isInserting) {
      context.missing(_personalIDMeta);
    }
    if (data.containsKey('names')) {
      context.handle(
          _namesMeta, names.isAcceptableOrUnknown(data['names']!, _namesMeta));
    } else if (isInserting) {
      context.missing(_namesMeta);
    }
    if (data.containsKey('last_names')) {
      context.handle(_lastNamesMeta,
          lastNames.isAcceptableOrUnknown(data['last_names']!, _lastNamesMeta));
    } else if (isInserting) {
      context.missing(_lastNamesMeta);
    }
    if (data.containsKey('profession')) {
      context.handle(
          _professionMeta,
          profession.isAcceptableOrUnknown(
              data['profession']!, _professionMeta));
    } else if (isInserting) {
      context.missing(_professionMeta);
    }
    if (data.containsKey('professional_i_d')) {
      context.handle(
          _professionalIDMeta,
          professionalID.isAcceptableOrUnknown(
              data['professional_i_d']!, _professionalIDMeta));
    } else if (isInserting) {
      context.missing(_professionalIDMeta);
    }
    if (data.containsKey('user_name')) {
      context.handle(_userNameMeta,
          userName.isAcceptableOrUnknown(data['user_name']!, _userNameMeta));
    } else if (isInserting) {
      context.missing(_userNameMeta);
    }
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password']!, _passwordMeta));
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  ProfessionalData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return ProfessionalData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ProfessionalTable createAlias(String alias) {
    return $ProfessionalTable(attachedDatabase, alias);
  }
}

abstract class _$LocalDatabase extends GeneratedDatabase {
  _$LocalDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $PatientsTable patients = $PatientsTable(this);
  late final $ClinicHistoryTable clinicHistory = $ClinicHistoryTable(this);
  late final $SessionsTable sessions = $SessionsTable(this);
  late final $ProfessionalTable professional = $ProfessionalTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [patients, clinicHistory, sessions, professional];
}
