// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_model.dart';

// ignore_for_file: type=lint
class $ProfessionalTable extends Professional
    with TableInfo<$ProfessionalTable, ProfessionalData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProfessionalTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _personalIDMeta =
      const VerificationMeta('personalID');
  @override
  late final GeneratedColumn<int> personalID = GeneratedColumn<int>(
      'personal_i_d', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _namesMeta = const VerificationMeta('names');
  @override
  late final GeneratedColumn<String> names = GeneratedColumn<String>(
      'names', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _lastNamesMeta =
      const VerificationMeta('lastNames');
  @override
  late final GeneratedColumn<String> lastNames = GeneratedColumn<String>(
      'last_names', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _professionalIDMeta =
      const VerificationMeta('professionalID');
  @override
  late final GeneratedColumn<int> professionalID = GeneratedColumn<int>(
      'professional_i_d', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _userNameMeta =
      const VerificationMeta('userName');
  @override
  late final GeneratedColumn<String> userName = GeneratedColumn<String>(
      'user_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _passwordMeta =
      const VerificationMeta('password');
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
      'password', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, personalID, names, lastNames, professionalID, userName, password];
  @override
  String get aliasedName => _alias ?? 'professional';
  @override
  String get actualTableName => 'professional';
  @override
  VerificationContext validateIntegrity(Insertable<ProfessionalData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
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
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProfessionalData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProfessionalData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      personalID: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}personal_i_d'])!,
      names: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}names'])!,
      lastNames: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last_names'])!,
      professionalID: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}professional_i_d'])!,
      userName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_name'])!,
      password: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}password'])!,
    );
  }

  @override
  $ProfessionalTable createAlias(String alias) {
    return $ProfessionalTable(attachedDatabase, alias);
  }
}

class ProfessionalData extends DataClass
    implements Insertable<ProfessionalData> {
  final int id;
  final int personalID;
  final String names;
  final String lastNames;
  final int professionalID;
  final String userName;
  final String password;
  const ProfessionalData(
      {required this.id,
      required this.personalID,
      required this.names,
      required this.lastNames,
      required this.professionalID,
      required this.userName,
      required this.password});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['personal_i_d'] = Variable<int>(personalID);
    map['names'] = Variable<String>(names);
    map['last_names'] = Variable<String>(lastNames);
    map['professional_i_d'] = Variable<int>(professionalID);
    map['user_name'] = Variable<String>(userName);
    map['password'] = Variable<String>(password);
    return map;
  }

  ProfessionalCompanion toCompanion(bool nullToAbsent) {
    return ProfessionalCompanion(
      id: Value(id),
      personalID: Value(personalID),
      names: Value(names),
      lastNames: Value(lastNames),
      professionalID: Value(professionalID),
      userName: Value(userName),
      password: Value(password),
    );
  }

  factory ProfessionalData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProfessionalData(
      id: serializer.fromJson<int>(json['id']),
      personalID: serializer.fromJson<int>(json['personalID']),
      names: serializer.fromJson<String>(json['names']),
      lastNames: serializer.fromJson<String>(json['lastNames']),
      professionalID: serializer.fromJson<int>(json['professionalID']),
      userName: serializer.fromJson<String>(json['userName']),
      password: serializer.fromJson<String>(json['password']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'personalID': serializer.toJson<int>(personalID),
      'names': serializer.toJson<String>(names),
      'lastNames': serializer.toJson<String>(lastNames),
      'professionalID': serializer.toJson<int>(professionalID),
      'userName': serializer.toJson<String>(userName),
      'password': serializer.toJson<String>(password),
    };
  }

  ProfessionalData copyWith(
          {int? id,
          int? personalID,
          String? names,
          String? lastNames,
          int? professionalID,
          String? userName,
          String? password}) =>
      ProfessionalData(
        id: id ?? this.id,
        personalID: personalID ?? this.personalID,
        names: names ?? this.names,
        lastNames: lastNames ?? this.lastNames,
        professionalID: professionalID ?? this.professionalID,
        userName: userName ?? this.userName,
        password: password ?? this.password,
      );
  @override
  String toString() {
    return (StringBuffer('ProfessionalData(')
          ..write('id: $id, ')
          ..write('personalID: $personalID, ')
          ..write('names: $names, ')
          ..write('lastNames: $lastNames, ')
          ..write('professionalID: $professionalID, ')
          ..write('userName: $userName, ')
          ..write('password: $password')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, personalID, names, lastNames, professionalID, userName, password);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProfessionalData &&
          other.id == this.id &&
          other.personalID == this.personalID &&
          other.names == this.names &&
          other.lastNames == this.lastNames &&
          other.professionalID == this.professionalID &&
          other.userName == this.userName &&
          other.password == this.password);
}

class ProfessionalCompanion extends UpdateCompanion<ProfessionalData> {
  final Value<int> id;
  final Value<int> personalID;
  final Value<String> names;
  final Value<String> lastNames;
  final Value<int> professionalID;
  final Value<String> userName;
  final Value<String> password;
  const ProfessionalCompanion({
    this.id = const Value.absent(),
    this.personalID = const Value.absent(),
    this.names = const Value.absent(),
    this.lastNames = const Value.absent(),
    this.professionalID = const Value.absent(),
    this.userName = const Value.absent(),
    this.password = const Value.absent(),
  });
  ProfessionalCompanion.insert({
    this.id = const Value.absent(),
    required int personalID,
    required String names,
    required String lastNames,
    required int professionalID,
    required String userName,
    required String password,
  })  : personalID = Value(personalID),
        names = Value(names),
        lastNames = Value(lastNames),
        professionalID = Value(professionalID),
        userName = Value(userName),
        password = Value(password);
  static Insertable<ProfessionalData> custom({
    Expression<int>? id,
    Expression<int>? personalID,
    Expression<String>? names,
    Expression<String>? lastNames,
    Expression<int>? professionalID,
    Expression<String>? userName,
    Expression<String>? password,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (personalID != null) 'personal_i_d': personalID,
      if (names != null) 'names': names,
      if (lastNames != null) 'last_names': lastNames,
      if (professionalID != null) 'professional_i_d': professionalID,
      if (userName != null) 'user_name': userName,
      if (password != null) 'password': password,
    });
  }

  ProfessionalCompanion copyWith(
      {Value<int>? id,
      Value<int>? personalID,
      Value<String>? names,
      Value<String>? lastNames,
      Value<int>? professionalID,
      Value<String>? userName,
      Value<String>? password}) {
    return ProfessionalCompanion(
      id: id ?? this.id,
      personalID: personalID ?? this.personalID,
      names: names ?? this.names,
      lastNames: lastNames ?? this.lastNames,
      professionalID: professionalID ?? this.professionalID,
      userName: userName ?? this.userName,
      password: password ?? this.password,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (personalID.present) {
      map['personal_i_d'] = Variable<int>(personalID.value);
    }
    if (names.present) {
      map['names'] = Variable<String>(names.value);
    }
    if (lastNames.present) {
      map['last_names'] = Variable<String>(lastNames.value);
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
          ..write('id: $id, ')
          ..write('personalID: $personalID, ')
          ..write('names: $names, ')
          ..write('lastNames: $lastNames, ')
          ..write('professionalID: $professionalID, ')
          ..write('userName: $userName, ')
          ..write('password: $password')
          ..write(')'))
        .toString();
  }
}

class $PatientsTable extends Patients with TableInfo<$PatientsTable, Patient> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PatientsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _namesMeta = const VerificationMeta('names');
  @override
  late final GeneratedColumn<String> names = GeneratedColumn<String>(
      'names', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _lastNamesMeta =
      const VerificationMeta('lastNames');
  @override
  late final GeneratedColumn<String> lastNames = GeneratedColumn<String>(
      'last_names', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _idNumberMeta =
      const VerificationMeta('idNumber');
  @override
  late final GeneratedColumn<int> idNumber = GeneratedColumn<int>(
      'id_number', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _birthDateMeta =
      const VerificationMeta('birthDate');
  @override
  late final GeneratedColumn<DateTime> birthDate = GeneratedColumn<DateTime>(
      'birth_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _contactNumberMeta =
      const VerificationMeta('contactNumber');
  @override
  late final GeneratedColumn<int> contactNumber = GeneratedColumn<int>(
      'contact_number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _mailMeta = const VerificationMeta('mail');
  @override
  late final GeneratedColumn<String> mail = GeneratedColumn<String>(
      'mail', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _cityMeta = const VerificationMeta('city');
  @override
  late final GeneratedColumn<String> city = GeneratedColumn<String>(
      'city', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _stateMeta = const VerificationMeta('state');
  @override
  late final GeneratedColumn<String> state = GeneratedColumn<String>(
      'state', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _adressMeta = const VerificationMeta('adress');
  @override
  late final GeneratedColumn<String> adress = GeneratedColumn<String>(
      'adress', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _educationMeta =
      const VerificationMeta('education');
  @override
  late final GeneratedColumn<String> education = GeneratedColumn<String>(
      'education', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _ocupationMeta =
      const VerificationMeta('ocupation');
  @override
  late final GeneratedColumn<String> ocupation = GeneratedColumn<String>(
      'ocupation', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _insuranceMeta =
      const VerificationMeta('insurance');
  @override
  late final GeneratedColumn<String> insurance = GeneratedColumn<String>(
      'insurance', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _emergencyContactNameMeta =
      const VerificationMeta('emergencyContactName');
  @override
  late final GeneratedColumn<String> emergencyContactName =
      GeneratedColumn<String>('emergency_contact_name', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _emergencyContactNumberMeta =
      const VerificationMeta('emergencyContactNumber');
  @override
  late final GeneratedColumn<int> emergencyContactNumber = GeneratedColumn<int>(
      'emergency_contact_number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _creationDateMeta =
      const VerificationMeta('creationDate');
  @override
  late final GeneratedColumn<DateTime> creationDate = GeneratedColumn<DateTime>(
      'creation_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive =
      GeneratedColumn<bool>('is_active', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_active" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _professionalIDMeta =
      const VerificationMeta('professionalID');
  @override
  late final GeneratedColumn<int> professionalID = GeneratedColumn<int>(
      'professional_i_d', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES professional (professional_i_d)'));
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
        emergencyContactNumber,
        creationDate,
        isActive,
        professionalID
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
    if (data.containsKey('creation_date')) {
      context.handle(
          _creationDateMeta,
          creationDate.isAcceptableOrUnknown(
              data['creation_date']!, _creationDateMeta));
    } else if (isInserting) {
      context.missing(_creationDateMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    } else if (isInserting) {
      context.missing(_isActiveMeta);
    }
    if (data.containsKey('professional_i_d')) {
      context.handle(
          _professionalIDMeta,
          professionalID.isAcceptableOrUnknown(
              data['professional_i_d']!, _professionalIDMeta));
    } else if (isInserting) {
      context.missing(_professionalIDMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Patient map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Patient(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      names: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}names'])!,
      lastNames: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last_names'])!,
      idNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_number'])!,
      birthDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}birth_date'])!,
      contactNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}contact_number'])!,
      mail: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}mail'])!,
      city: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}city'])!,
      state: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}state'])!,
      adress: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}adress'])!,
      education: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}education'])!,
      ocupation: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ocupation'])!,
      insurance: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}insurance'])!,
      emergencyContactName: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}emergency_contact_name'])!,
      emergencyContactNumber: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}emergency_contact_number'])!,
      creationDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}creation_date'])!,
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
      professionalID: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}professional_i_d'])!,
    );
  }

  @override
  $PatientsTable createAlias(String alias) {
    return $PatientsTable(attachedDatabase, alias);
  }
}

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
  final DateTime creationDate;
  final bool isActive;
  final int professionalID;
  const Patient(
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
      required this.emergencyContactNumber,
      required this.creationDate,
      required this.isActive,
      required this.professionalID});
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
    map['creation_date'] = Variable<DateTime>(creationDate);
    map['is_active'] = Variable<bool>(isActive);
    map['professional_i_d'] = Variable<int>(professionalID);
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
      creationDate: Value(creationDate),
      isActive: Value(isActive),
      professionalID: Value(professionalID),
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
      creationDate: serializer.fromJson<DateTime>(json['creationDate']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      professionalID: serializer.fromJson<int>(json['professionalID']),
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
      'creationDate': serializer.toJson<DateTime>(creationDate),
      'isActive': serializer.toJson<bool>(isActive),
      'professionalID': serializer.toJson<int>(professionalID),
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
          int? emergencyContactNumber,
          DateTime? creationDate,
          bool? isActive,
          int? professionalID}) =>
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
        creationDate: creationDate ?? this.creationDate,
        isActive: isActive ?? this.isActive,
        professionalID: professionalID ?? this.professionalID,
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
          ..write('emergencyContactNumber: $emergencyContactNumber, ')
          ..write('creationDate: $creationDate, ')
          ..write('isActive: $isActive, ')
          ..write('professionalID: $professionalID')
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
      emergencyContactNumber,
      creationDate,
      isActive,
      professionalID);
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
          other.emergencyContactNumber == this.emergencyContactNumber &&
          other.creationDate == this.creationDate &&
          other.isActive == this.isActive &&
          other.professionalID == this.professionalID);
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
  final Value<DateTime> creationDate;
  final Value<bool> isActive;
  final Value<int> professionalID;
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
    this.creationDate = const Value.absent(),
    this.isActive = const Value.absent(),
    this.professionalID = const Value.absent(),
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
    required DateTime creationDate,
    required bool isActive,
    required int professionalID,
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
        emergencyContactNumber = Value(emergencyContactNumber),
        creationDate = Value(creationDate),
        isActive = Value(isActive),
        professionalID = Value(professionalID);
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
    Expression<DateTime>? creationDate,
    Expression<bool>? isActive,
    Expression<int>? professionalID,
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
      if (creationDate != null) 'creation_date': creationDate,
      if (isActive != null) 'is_active': isActive,
      if (professionalID != null) 'professional_i_d': professionalID,
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
      Value<int>? emergencyContactNumber,
      Value<DateTime>? creationDate,
      Value<bool>? isActive,
      Value<int>? professionalID}) {
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
      creationDate: creationDate ?? this.creationDate,
      isActive: isActive ?? this.isActive,
      professionalID: professionalID ?? this.professionalID,
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
    if (creationDate.present) {
      map['creation_date'] = Variable<DateTime>(creationDate.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (professionalID.present) {
      map['professional_i_d'] = Variable<int>(professionalID.value);
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
          ..write('emergencyContactNumber: $emergencyContactNumber, ')
          ..write('creationDate: $creationDate, ')
          ..write('isActive: $isActive, ')
          ..write('professionalID: $professionalID')
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
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _registerNumberMeta =
      const VerificationMeta('registerNumber');
  @override
  late final GeneratedColumn<String> registerNumber = GeneratedColumn<String>(
      'register_number', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _currentDateMeta =
      const VerificationMeta('currentDate');
  @override
  late final GeneratedColumn<DateTime> currentDate = GeneratedColumn<DateTime>(
      'current_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _consultationReasonMeta =
      const VerificationMeta('consultationReason');
  @override
  late final GeneratedColumn<String> consultationReason =
      GeneratedColumn<String>('consultation_reason', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _mentalExaminationMeta =
      const VerificationMeta('mentalExamination');
  @override
  late final GeneratedColumn<String> mentalExamination =
      GeneratedColumn<String>('mental_examination', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _treatmentMeta =
      const VerificationMeta('treatment');
  @override
  late final GeneratedColumn<String> treatment = GeneratedColumn<String>(
      'treatment', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _medAntecedentsMeta =
      const VerificationMeta('medAntecedents');
  @override
  late final GeneratedColumn<String> medAntecedents = GeneratedColumn<String>(
      'med_antecedents', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _psiAntecedentsMeta =
      const VerificationMeta('psiAntecedents');
  @override
  late final GeneratedColumn<String> psiAntecedents = GeneratedColumn<String>(
      'psi_antecedents', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _familyHistoryMeta =
      const VerificationMeta('familyHistory');
  @override
  late final GeneratedColumn<String> familyHistory = GeneratedColumn<String>(
      'family_history', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _personalHistoryMeta =
      const VerificationMeta('personalHistory');
  @override
  late final GeneratedColumn<String> personalHistory = GeneratedColumn<String>(
      'personal_history', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _diagnosticMeta =
      const VerificationMeta('diagnostic');
  @override
  late final GeneratedColumn<String> diagnostic = GeneratedColumn<String>(
      'diagnostic', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _idNumberMeta =
      const VerificationMeta('idNumber');
  @override
  late final GeneratedColumn<int> idNumber = GeneratedColumn<int>(
      'id_number', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES patients (id_number)'));
  static const VerificationMeta _professionalIDMeta =
      const VerificationMeta('professionalID');
  @override
  late final GeneratedColumn<int> professionalID = GeneratedColumn<int>(
      'professional_i_d', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES professional (professional_i_d)'));
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
        idNumber,
        professionalID
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
    if (data.containsKey('professional_i_d')) {
      context.handle(
          _professionalIDMeta,
          professionalID.isAcceptableOrUnknown(
              data['professional_i_d']!, _professionalIDMeta));
    } else if (isInserting) {
      context.missing(_professionalIDMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ClinicHistoryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ClinicHistoryData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      registerNumber: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}register_number'])!,
      currentDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}current_date'])!,
      consultationReason: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}consultation_reason'])!,
      mentalExamination: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}mental_examination'])!,
      treatment: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}treatment'])!,
      medAntecedents: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}med_antecedents'])!,
      psiAntecedents: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}psi_antecedents'])!,
      familyHistory: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}family_history'])!,
      personalHistory: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}personal_history'])!,
      diagnostic: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}diagnostic'])!,
      idNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_number'])!,
      professionalID: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}professional_i_d'])!,
    );
  }

  @override
  $ClinicHistoryTable createAlias(String alias) {
    return $ClinicHistoryTable(attachedDatabase, alias);
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
  final int professionalID;
  const ClinicHistoryData(
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
      required this.idNumber,
      required this.professionalID});
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
    map['professional_i_d'] = Variable<int>(professionalID);
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
      professionalID: Value(professionalID),
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
      professionalID: serializer.fromJson<int>(json['professionalID']),
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
      'professionalID': serializer.toJson<int>(professionalID),
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
          int? idNumber,
          int? professionalID}) =>
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
        professionalID: professionalID ?? this.professionalID,
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
          ..write('idNumber: $idNumber, ')
          ..write('professionalID: $professionalID')
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
      idNumber,
      professionalID);
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
          other.idNumber == this.idNumber &&
          other.professionalID == this.professionalID);
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
  final Value<int> professionalID;
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
    this.professionalID = const Value.absent(),
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
    required int professionalID,
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
        idNumber = Value(idNumber),
        professionalID = Value(professionalID);
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
    Expression<int>? professionalID,
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
      if (professionalID != null) 'professional_i_d': professionalID,
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
      Value<int>? idNumber,
      Value<int>? professionalID}) {
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
      professionalID: professionalID ?? this.professionalID,
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
    if (professionalID.present) {
      map['professional_i_d'] = Variable<int>(professionalID.value);
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
          ..write('idNumber: $idNumber, ')
          ..write('professionalID: $professionalID')
          ..write(')'))
        .toString();
  }
}

class $SessionsTable extends Sessions with TableInfo<$SessionsTable, Session> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SessionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _sessionIdMeta =
      const VerificationMeta('sessionId');
  @override
  late final GeneratedColumn<int> sessionId = GeneratedColumn<int>(
      'session_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _sessionDateMeta =
      const VerificationMeta('sessionDate');
  @override
  late final GeneratedColumn<DateTime> sessionDate = GeneratedColumn<DateTime>(
      'session_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _sessionSummaryMeta =
      const VerificationMeta('sessionSummary');
  @override
  late final GeneratedColumn<String> sessionSummary = GeneratedColumn<String>(
      'session_summary', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sessionObjectivesMeta =
      const VerificationMeta('sessionObjectives');
  @override
  late final GeneratedColumn<String> sessionObjectives =
      GeneratedColumn<String>('session_objectives', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _therapeuticArchievementsMeta =
      const VerificationMeta('therapeuticArchievements');
  @override
  late final GeneratedColumn<String> therapeuticArchievements =
      GeneratedColumn<String>('therapeutic_archievements', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sessionNotesMeta =
      const VerificationMeta('sessionNotes');
  @override
  late final GeneratedColumn<String> sessionNotes = GeneratedColumn<String>(
      'session_notes', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sessionPerformanceMeta =
      const VerificationMeta('sessionPerformance');
  @override
  late final GeneratedColumn<String> sessionPerformance =
      GeneratedColumn<String>('session_performance', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _idNumberMeta =
      const VerificationMeta('idNumber');
  @override
  late final GeneratedColumn<int> idNumber = GeneratedColumn<int>(
      'id_number', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES patients (id_number)'));
  static const VerificationMeta _professionalIDMeta =
      const VerificationMeta('professionalID');
  @override
  late final GeneratedColumn<int> professionalID = GeneratedColumn<int>(
      'professional_i_d', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES professional (professional_i_d)'));
  @override
  List<GeneratedColumn> get $columns => [
        sessionId,
        sessionDate,
        sessionSummary,
        sessionObjectives,
        therapeuticArchievements,
        sessionNotes,
        sessionPerformance,
        idNumber,
        professionalID
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
    if (data.containsKey('session_notes')) {
      context.handle(
          _sessionNotesMeta,
          sessionNotes.isAcceptableOrUnknown(
              data['session_notes']!, _sessionNotesMeta));
    } else if (isInserting) {
      context.missing(_sessionNotesMeta);
    }
    if (data.containsKey('session_performance')) {
      context.handle(
          _sessionPerformanceMeta,
          sessionPerformance.isAcceptableOrUnknown(
              data['session_performance']!, _sessionPerformanceMeta));
    } else if (isInserting) {
      context.missing(_sessionPerformanceMeta);
    }
    if (data.containsKey('id_number')) {
      context.handle(_idNumberMeta,
          idNumber.isAcceptableOrUnknown(data['id_number']!, _idNumberMeta));
    } else if (isInserting) {
      context.missing(_idNumberMeta);
    }
    if (data.containsKey('professional_i_d')) {
      context.handle(
          _professionalIDMeta,
          professionalID.isAcceptableOrUnknown(
              data['professional_i_d']!, _professionalIDMeta));
    } else if (isInserting) {
      context.missing(_professionalIDMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {sessionId};
  @override
  Session map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Session(
      sessionId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}session_id'])!,
      sessionDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}session_date'])!,
      sessionSummary: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}session_summary'])!,
      sessionObjectives: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}session_objectives'])!,
      therapeuticArchievements: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}therapeutic_archievements'])!,
      sessionNotes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}session_notes'])!,
      sessionPerformance: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}session_performance'])!,
      idNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_number'])!,
      professionalID: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}professional_i_d'])!,
    );
  }

  @override
  $SessionsTable createAlias(String alias) {
    return $SessionsTable(attachedDatabase, alias);
  }
}

class Session extends DataClass implements Insertable<Session> {
  final int sessionId;
  final DateTime sessionDate;
  final String sessionSummary;
  final String sessionObjectives;
  final String therapeuticArchievements;
  final String sessionNotes;
  final String sessionPerformance;
  final int idNumber;
  final int professionalID;
  const Session(
      {required this.sessionId,
      required this.sessionDate,
      required this.sessionSummary,
      required this.sessionObjectives,
      required this.therapeuticArchievements,
      required this.sessionNotes,
      required this.sessionPerformance,
      required this.idNumber,
      required this.professionalID});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['session_id'] = Variable<int>(sessionId);
    map['session_date'] = Variable<DateTime>(sessionDate);
    map['session_summary'] = Variable<String>(sessionSummary);
    map['session_objectives'] = Variable<String>(sessionObjectives);
    map['therapeutic_archievements'] =
        Variable<String>(therapeuticArchievements);
    map['session_notes'] = Variable<String>(sessionNotes);
    map['session_performance'] = Variable<String>(sessionPerformance);
    map['id_number'] = Variable<int>(idNumber);
    map['professional_i_d'] = Variable<int>(professionalID);
    return map;
  }

  SessionsCompanion toCompanion(bool nullToAbsent) {
    return SessionsCompanion(
      sessionId: Value(sessionId),
      sessionDate: Value(sessionDate),
      sessionSummary: Value(sessionSummary),
      sessionObjectives: Value(sessionObjectives),
      therapeuticArchievements: Value(therapeuticArchievements),
      sessionNotes: Value(sessionNotes),
      sessionPerformance: Value(sessionPerformance),
      idNumber: Value(idNumber),
      professionalID: Value(professionalID),
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
      sessionNotes: serializer.fromJson<String>(json['sessionNotes']),
      sessionPerformance:
          serializer.fromJson<String>(json['sessionPerformance']),
      idNumber: serializer.fromJson<int>(json['idNumber']),
      professionalID: serializer.fromJson<int>(json['professionalID']),
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
      'sessionNotes': serializer.toJson<String>(sessionNotes),
      'sessionPerformance': serializer.toJson<String>(sessionPerformance),
      'idNumber': serializer.toJson<int>(idNumber),
      'professionalID': serializer.toJson<int>(professionalID),
    };
  }

  Session copyWith(
          {int? sessionId,
          DateTime? sessionDate,
          String? sessionSummary,
          String? sessionObjectives,
          String? therapeuticArchievements,
          String? sessionNotes,
          String? sessionPerformance,
          int? idNumber,
          int? professionalID}) =>
      Session(
        sessionId: sessionId ?? this.sessionId,
        sessionDate: sessionDate ?? this.sessionDate,
        sessionSummary: sessionSummary ?? this.sessionSummary,
        sessionObjectives: sessionObjectives ?? this.sessionObjectives,
        therapeuticArchievements:
            therapeuticArchievements ?? this.therapeuticArchievements,
        sessionNotes: sessionNotes ?? this.sessionNotes,
        sessionPerformance: sessionPerformance ?? this.sessionPerformance,
        idNumber: idNumber ?? this.idNumber,
        professionalID: professionalID ?? this.professionalID,
      );
  @override
  String toString() {
    return (StringBuffer('Session(')
          ..write('sessionId: $sessionId, ')
          ..write('sessionDate: $sessionDate, ')
          ..write('sessionSummary: $sessionSummary, ')
          ..write('sessionObjectives: $sessionObjectives, ')
          ..write('therapeuticArchievements: $therapeuticArchievements, ')
          ..write('sessionNotes: $sessionNotes, ')
          ..write('sessionPerformance: $sessionPerformance, ')
          ..write('idNumber: $idNumber, ')
          ..write('professionalID: $professionalID')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      sessionId,
      sessionDate,
      sessionSummary,
      sessionObjectives,
      therapeuticArchievements,
      sessionNotes,
      sessionPerformance,
      idNumber,
      professionalID);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Session &&
          other.sessionId == this.sessionId &&
          other.sessionDate == this.sessionDate &&
          other.sessionSummary == this.sessionSummary &&
          other.sessionObjectives == this.sessionObjectives &&
          other.therapeuticArchievements == this.therapeuticArchievements &&
          other.sessionNotes == this.sessionNotes &&
          other.sessionPerformance == this.sessionPerformance &&
          other.idNumber == this.idNumber &&
          other.professionalID == this.professionalID);
}

class SessionsCompanion extends UpdateCompanion<Session> {
  final Value<int> sessionId;
  final Value<DateTime> sessionDate;
  final Value<String> sessionSummary;
  final Value<String> sessionObjectives;
  final Value<String> therapeuticArchievements;
  final Value<String> sessionNotes;
  final Value<String> sessionPerformance;
  final Value<int> idNumber;
  final Value<int> professionalID;
  const SessionsCompanion({
    this.sessionId = const Value.absent(),
    this.sessionDate = const Value.absent(),
    this.sessionSummary = const Value.absent(),
    this.sessionObjectives = const Value.absent(),
    this.therapeuticArchievements = const Value.absent(),
    this.sessionNotes = const Value.absent(),
    this.sessionPerformance = const Value.absent(),
    this.idNumber = const Value.absent(),
    this.professionalID = const Value.absent(),
  });
  SessionsCompanion.insert({
    this.sessionId = const Value.absent(),
    required DateTime sessionDate,
    required String sessionSummary,
    required String sessionObjectives,
    required String therapeuticArchievements,
    required String sessionNotes,
    required String sessionPerformance,
    required int idNumber,
    required int professionalID,
  })  : sessionDate = Value(sessionDate),
        sessionSummary = Value(sessionSummary),
        sessionObjectives = Value(sessionObjectives),
        therapeuticArchievements = Value(therapeuticArchievements),
        sessionNotes = Value(sessionNotes),
        sessionPerformance = Value(sessionPerformance),
        idNumber = Value(idNumber),
        professionalID = Value(professionalID);
  static Insertable<Session> custom({
    Expression<int>? sessionId,
    Expression<DateTime>? sessionDate,
    Expression<String>? sessionSummary,
    Expression<String>? sessionObjectives,
    Expression<String>? therapeuticArchievements,
    Expression<String>? sessionNotes,
    Expression<String>? sessionPerformance,
    Expression<int>? idNumber,
    Expression<int>? professionalID,
  }) {
    return RawValuesInsertable({
      if (sessionId != null) 'session_id': sessionId,
      if (sessionDate != null) 'session_date': sessionDate,
      if (sessionSummary != null) 'session_summary': sessionSummary,
      if (sessionObjectives != null) 'session_objectives': sessionObjectives,
      if (therapeuticArchievements != null)
        'therapeutic_archievements': therapeuticArchievements,
      if (sessionNotes != null) 'session_notes': sessionNotes,
      if (sessionPerformance != null) 'session_performance': sessionPerformance,
      if (idNumber != null) 'id_number': idNumber,
      if (professionalID != null) 'professional_i_d': professionalID,
    });
  }

  SessionsCompanion copyWith(
      {Value<int>? sessionId,
      Value<DateTime>? sessionDate,
      Value<String>? sessionSummary,
      Value<String>? sessionObjectives,
      Value<String>? therapeuticArchievements,
      Value<String>? sessionNotes,
      Value<String>? sessionPerformance,
      Value<int>? idNumber,
      Value<int>? professionalID}) {
    return SessionsCompanion(
      sessionId: sessionId ?? this.sessionId,
      sessionDate: sessionDate ?? this.sessionDate,
      sessionSummary: sessionSummary ?? this.sessionSummary,
      sessionObjectives: sessionObjectives ?? this.sessionObjectives,
      therapeuticArchievements:
          therapeuticArchievements ?? this.therapeuticArchievements,
      sessionNotes: sessionNotes ?? this.sessionNotes,
      sessionPerformance: sessionPerformance ?? this.sessionPerformance,
      idNumber: idNumber ?? this.idNumber,
      professionalID: professionalID ?? this.professionalID,
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
    if (sessionNotes.present) {
      map['session_notes'] = Variable<String>(sessionNotes.value);
    }
    if (sessionPerformance.present) {
      map['session_performance'] = Variable<String>(sessionPerformance.value);
    }
    if (idNumber.present) {
      map['id_number'] = Variable<int>(idNumber.value);
    }
    if (professionalID.present) {
      map['professional_i_d'] = Variable<int>(professionalID.value);
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
          ..write('sessionNotes: $sessionNotes, ')
          ..write('sessionPerformance: $sessionPerformance, ')
          ..write('idNumber: $idNumber, ')
          ..write('professionalID: $professionalID')
          ..write(')'))
        .toString();
  }
}

class $TestsTable extends Tests with TableInfo<$TestsTable, Test> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TestsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _testDateMeta =
      const VerificationMeta('testDate');
  @override
  late final GeneratedColumn<DateTime> testDate = GeneratedColumn<DateTime>(
      'test_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _patientIDMeta =
      const VerificationMeta('patientID');
  @override
  late final GeneratedColumn<int> patientID = GeneratedColumn<int>(
      'patient_i_d', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES patients (id_number)'));
  static const VerificationMeta _professionalIDMeta =
      const VerificationMeta('professionalID');
  @override
  late final GeneratedColumn<int> professionalID = GeneratedColumn<int>(
      'professional_i_d', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES professional (professional_i_d)'));
  static const VerificationMeta _sessionIDMeta =
      const VerificationMeta('sessionID');
  @override
  late final GeneratedColumn<int> sessionID = GeneratedColumn<int>(
      'session_i_d', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES sessions (session_id)'));
  static const VerificationMeta _testDescriptionMeta =
      const VerificationMeta('testDescription');
  @override
  late final GeneratedColumn<String> testDescription = GeneratedColumn<String>(
      'test_description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _testDataMeta =
      const VerificationMeta('testData');
  @override
  late final GeneratedColumn<String> testData = GeneratedColumn<String>(
      'test_data', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        testDate,
        patientID,
        professionalID,
        sessionID,
        testDescription,
        category,
        testData
      ];
  @override
  String get aliasedName => _alias ?? 'tests';
  @override
  String get actualTableName => 'tests';
  @override
  VerificationContext validateIntegrity(Insertable<Test> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('test_date')) {
      context.handle(_testDateMeta,
          testDate.isAcceptableOrUnknown(data['test_date']!, _testDateMeta));
    } else if (isInserting) {
      context.missing(_testDateMeta);
    }
    if (data.containsKey('patient_i_d')) {
      context.handle(
          _patientIDMeta,
          patientID.isAcceptableOrUnknown(
              data['patient_i_d']!, _patientIDMeta));
    } else if (isInserting) {
      context.missing(_patientIDMeta);
    }
    if (data.containsKey('professional_i_d')) {
      context.handle(
          _professionalIDMeta,
          professionalID.isAcceptableOrUnknown(
              data['professional_i_d']!, _professionalIDMeta));
    } else if (isInserting) {
      context.missing(_professionalIDMeta);
    }
    if (data.containsKey('session_i_d')) {
      context.handle(
          _sessionIDMeta,
          sessionID.isAcceptableOrUnknown(
              data['session_i_d']!, _sessionIDMeta));
    } else if (isInserting) {
      context.missing(_sessionIDMeta);
    }
    if (data.containsKey('test_description')) {
      context.handle(
          _testDescriptionMeta,
          testDescription.isAcceptableOrUnknown(
              data['test_description']!, _testDescriptionMeta));
    } else if (isInserting) {
      context.missing(_testDescriptionMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('test_data')) {
      context.handle(_testDataMeta,
          testData.isAcceptableOrUnknown(data['test_data']!, _testDataMeta));
    } else if (isInserting) {
      context.missing(_testDataMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Test map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Test(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      testDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}test_date'])!,
      patientID: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}patient_i_d'])!,
      professionalID: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}professional_i_d'])!,
      sessionID: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}session_i_d'])!,
      testDescription: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}test_description'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
      testData: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}test_data'])!,
    );
  }

  @override
  $TestsTable createAlias(String alias) {
    return $TestsTable(attachedDatabase, alias);
  }
}

class Test extends DataClass implements Insertable<Test> {
  final int id;
  final DateTime testDate;
  final int patientID;
  final int professionalID;
  final int sessionID;
  final String testDescription;
  final String category;
  final String testData;
  const Test(
      {required this.id,
      required this.testDate,
      required this.patientID,
      required this.professionalID,
      required this.sessionID,
      required this.testDescription,
      required this.category,
      required this.testData});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['test_date'] = Variable<DateTime>(testDate);
    map['patient_i_d'] = Variable<int>(patientID);
    map['professional_i_d'] = Variable<int>(professionalID);
    map['session_i_d'] = Variable<int>(sessionID);
    map['test_description'] = Variable<String>(testDescription);
    map['category'] = Variable<String>(category);
    map['test_data'] = Variable<String>(testData);
    return map;
  }

  TestsCompanion toCompanion(bool nullToAbsent) {
    return TestsCompanion(
      id: Value(id),
      testDate: Value(testDate),
      patientID: Value(patientID),
      professionalID: Value(professionalID),
      sessionID: Value(sessionID),
      testDescription: Value(testDescription),
      category: Value(category),
      testData: Value(testData),
    );
  }

  factory Test.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Test(
      id: serializer.fromJson<int>(json['id']),
      testDate: serializer.fromJson<DateTime>(json['testDate']),
      patientID: serializer.fromJson<int>(json['patientID']),
      professionalID: serializer.fromJson<int>(json['professionalID']),
      sessionID: serializer.fromJson<int>(json['sessionID']),
      testDescription: serializer.fromJson<String>(json['testDescription']),
      category: serializer.fromJson<String>(json['category']),
      testData: serializer.fromJson<String>(json['testData']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'testDate': serializer.toJson<DateTime>(testDate),
      'patientID': serializer.toJson<int>(patientID),
      'professionalID': serializer.toJson<int>(professionalID),
      'sessionID': serializer.toJson<int>(sessionID),
      'testDescription': serializer.toJson<String>(testDescription),
      'category': serializer.toJson<String>(category),
      'testData': serializer.toJson<String>(testData),
    };
  }

  Test copyWith(
          {int? id,
          DateTime? testDate,
          int? patientID,
          int? professionalID,
          int? sessionID,
          String? testDescription,
          String? category,
          String? testData}) =>
      Test(
        id: id ?? this.id,
        testDate: testDate ?? this.testDate,
        patientID: patientID ?? this.patientID,
        professionalID: professionalID ?? this.professionalID,
        sessionID: sessionID ?? this.sessionID,
        testDescription: testDescription ?? this.testDescription,
        category: category ?? this.category,
        testData: testData ?? this.testData,
      );
  @override
  String toString() {
    return (StringBuffer('Test(')
          ..write('id: $id, ')
          ..write('testDate: $testDate, ')
          ..write('patientID: $patientID, ')
          ..write('professionalID: $professionalID, ')
          ..write('sessionID: $sessionID, ')
          ..write('testDescription: $testDescription, ')
          ..write('category: $category, ')
          ..write('testData: $testData')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, testDate, patientID, professionalID,
      sessionID, testDescription, category, testData);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Test &&
          other.id == this.id &&
          other.testDate == this.testDate &&
          other.patientID == this.patientID &&
          other.professionalID == this.professionalID &&
          other.sessionID == this.sessionID &&
          other.testDescription == this.testDescription &&
          other.category == this.category &&
          other.testData == this.testData);
}

class TestsCompanion extends UpdateCompanion<Test> {
  final Value<int> id;
  final Value<DateTime> testDate;
  final Value<int> patientID;
  final Value<int> professionalID;
  final Value<int> sessionID;
  final Value<String> testDescription;
  final Value<String> category;
  final Value<String> testData;
  const TestsCompanion({
    this.id = const Value.absent(),
    this.testDate = const Value.absent(),
    this.patientID = const Value.absent(),
    this.professionalID = const Value.absent(),
    this.sessionID = const Value.absent(),
    this.testDescription = const Value.absent(),
    this.category = const Value.absent(),
    this.testData = const Value.absent(),
  });
  TestsCompanion.insert({
    this.id = const Value.absent(),
    required DateTime testDate,
    required int patientID,
    required int professionalID,
    required int sessionID,
    required String testDescription,
    required String category,
    required String testData,
  })  : testDate = Value(testDate),
        patientID = Value(patientID),
        professionalID = Value(professionalID),
        sessionID = Value(sessionID),
        testDescription = Value(testDescription),
        category = Value(category),
        testData = Value(testData);
  static Insertable<Test> custom({
    Expression<int>? id,
    Expression<DateTime>? testDate,
    Expression<int>? patientID,
    Expression<int>? professionalID,
    Expression<int>? sessionID,
    Expression<String>? testDescription,
    Expression<String>? category,
    Expression<String>? testData,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (testDate != null) 'test_date': testDate,
      if (patientID != null) 'patient_i_d': patientID,
      if (professionalID != null) 'professional_i_d': professionalID,
      if (sessionID != null) 'session_i_d': sessionID,
      if (testDescription != null) 'test_description': testDescription,
      if (category != null) 'category': category,
      if (testData != null) 'test_data': testData,
    });
  }

  TestsCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? testDate,
      Value<int>? patientID,
      Value<int>? professionalID,
      Value<int>? sessionID,
      Value<String>? testDescription,
      Value<String>? category,
      Value<String>? testData}) {
    return TestsCompanion(
      id: id ?? this.id,
      testDate: testDate ?? this.testDate,
      patientID: patientID ?? this.patientID,
      professionalID: professionalID ?? this.professionalID,
      sessionID: sessionID ?? this.sessionID,
      testDescription: testDescription ?? this.testDescription,
      category: category ?? this.category,
      testData: testData ?? this.testData,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (testDate.present) {
      map['test_date'] = Variable<DateTime>(testDate.value);
    }
    if (patientID.present) {
      map['patient_i_d'] = Variable<int>(patientID.value);
    }
    if (professionalID.present) {
      map['professional_i_d'] = Variable<int>(professionalID.value);
    }
    if (sessionID.present) {
      map['session_i_d'] = Variable<int>(sessionID.value);
    }
    if (testDescription.present) {
      map['test_description'] = Variable<String>(testDescription.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (testData.present) {
      map['test_data'] = Variable<String>(testData.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TestsCompanion(')
          ..write('id: $id, ')
          ..write('testDate: $testDate, ')
          ..write('patientID: $patientID, ')
          ..write('professionalID: $professionalID, ')
          ..write('sessionID: $sessionID, ')
          ..write('testDescription: $testDescription, ')
          ..write('category: $category, ')
          ..write('testData: $testData')
          ..write(')'))
        .toString();
  }
}

abstract class _$LocalDatabase extends GeneratedDatabase {
  _$LocalDatabase(QueryExecutor e) : super(e);
  late final $ProfessionalTable professional = $ProfessionalTable(this);
  late final $PatientsTable patients = $PatientsTable(this);
  late final $ClinicHistoryTable clinicHistory = $ClinicHistoryTable(this);
  late final $SessionsTable sessions = $SessionsTable(this);
  late final $TestsTable tests = $TestsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [professional, patients, clinicHistory, sessions, tests];
}
