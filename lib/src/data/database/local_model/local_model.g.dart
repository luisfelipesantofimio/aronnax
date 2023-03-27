// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_model.dart';

// ignore_for_file: type=lint
class $LocalProfessionalTable extends LocalProfessional
    with TableInfo<$LocalProfessionalTable, LocalProfessionalData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalProfessionalTable(this.attachedDatabase, [this._alias]);
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
      type: DriftSqlType.int, requiredDuringInsert: true);
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
  static const VerificationMeta _countryCodeMeta =
      const VerificationMeta('countryCode');
  @override
  late final GeneratedColumn<String> countryCode = GeneratedColumn<String>(
      'country_code', aliasedName, false,
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
  List<GeneratedColumn> get $columns => [
        id,
        personalID,
        names,
        lastNames,
        countryCode,
        professionalID,
        userName,
        password
      ];
  @override
  String get aliasedName => _alias ?? 'local_professional';
  @override
  String get actualTableName => 'local_professional';
  @override
  VerificationContext validateIntegrity(
      Insertable<LocalProfessionalData> instance,
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
    if (data.containsKey('country_code')) {
      context.handle(
          _countryCodeMeta,
          countryCode.isAcceptableOrUnknown(
              data['country_code']!, _countryCodeMeta));
    } else if (isInserting) {
      context.missing(_countryCodeMeta);
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
  LocalProfessionalData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalProfessionalData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      personalID: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}personal_i_d'])!,
      names: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}names'])!,
      lastNames: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last_names'])!,
      countryCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}country_code'])!,
      professionalID: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}professional_i_d'])!,
      userName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_name'])!,
      password: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}password'])!,
    );
  }

  @override
  $LocalProfessionalTable createAlias(String alias) {
    return $LocalProfessionalTable(attachedDatabase, alias);
  }
}

class LocalProfessionalData extends DataClass
    implements Insertable<LocalProfessionalData> {
  final int id;
  final int personalID;
  final String names;
  final String lastNames;
  final String countryCode;
  final int professionalID;
  final String userName;
  final String password;
  const LocalProfessionalData(
      {required this.id,
      required this.personalID,
      required this.names,
      required this.lastNames,
      required this.countryCode,
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
    map['country_code'] = Variable<String>(countryCode);
    map['professional_i_d'] = Variable<int>(professionalID);
    map['user_name'] = Variable<String>(userName);
    map['password'] = Variable<String>(password);
    return map;
  }

  LocalProfessionalCompanion toCompanion(bool nullToAbsent) {
    return LocalProfessionalCompanion(
      id: Value(id),
      personalID: Value(personalID),
      names: Value(names),
      lastNames: Value(lastNames),
      countryCode: Value(countryCode),
      professionalID: Value(professionalID),
      userName: Value(userName),
      password: Value(password),
    );
  }

  factory LocalProfessionalData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalProfessionalData(
      id: serializer.fromJson<int>(json['id']),
      personalID: serializer.fromJson<int>(json['personalID']),
      names: serializer.fromJson<String>(json['names']),
      lastNames: serializer.fromJson<String>(json['lastNames']),
      countryCode: serializer.fromJson<String>(json['countryCode']),
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
      'countryCode': serializer.toJson<String>(countryCode),
      'professionalID': serializer.toJson<int>(professionalID),
      'userName': serializer.toJson<String>(userName),
      'password': serializer.toJson<String>(password),
    };
  }

  LocalProfessionalData copyWith(
          {int? id,
          int? personalID,
          String? names,
          String? lastNames,
          String? countryCode,
          int? professionalID,
          String? userName,
          String? password}) =>
      LocalProfessionalData(
        id: id ?? this.id,
        personalID: personalID ?? this.personalID,
        names: names ?? this.names,
        lastNames: lastNames ?? this.lastNames,
        countryCode: countryCode ?? this.countryCode,
        professionalID: professionalID ?? this.professionalID,
        userName: userName ?? this.userName,
        password: password ?? this.password,
      );
  @override
  String toString() {
    return (StringBuffer('LocalProfessionalData(')
          ..write('id: $id, ')
          ..write('personalID: $personalID, ')
          ..write('names: $names, ')
          ..write('lastNames: $lastNames, ')
          ..write('countryCode: $countryCode, ')
          ..write('professionalID: $professionalID, ')
          ..write('userName: $userName, ')
          ..write('password: $password')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, personalID, names, lastNames, countryCode,
      professionalID, userName, password);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalProfessionalData &&
          other.id == this.id &&
          other.personalID == this.personalID &&
          other.names == this.names &&
          other.lastNames == this.lastNames &&
          other.countryCode == this.countryCode &&
          other.professionalID == this.professionalID &&
          other.userName == this.userName &&
          other.password == this.password);
}

class LocalProfessionalCompanion
    extends UpdateCompanion<LocalProfessionalData> {
  final Value<int> id;
  final Value<int> personalID;
  final Value<String> names;
  final Value<String> lastNames;
  final Value<String> countryCode;
  final Value<int> professionalID;
  final Value<String> userName;
  final Value<String> password;
  const LocalProfessionalCompanion({
    this.id = const Value.absent(),
    this.personalID = const Value.absent(),
    this.names = const Value.absent(),
    this.lastNames = const Value.absent(),
    this.countryCode = const Value.absent(),
    this.professionalID = const Value.absent(),
    this.userName = const Value.absent(),
    this.password = const Value.absent(),
  });
  LocalProfessionalCompanion.insert({
    this.id = const Value.absent(),
    required int personalID,
    required String names,
    required String lastNames,
    required String countryCode,
    required int professionalID,
    required String userName,
    required String password,
  })  : personalID = Value(personalID),
        names = Value(names),
        lastNames = Value(lastNames),
        countryCode = Value(countryCode),
        professionalID = Value(professionalID),
        userName = Value(userName),
        password = Value(password);
  static Insertable<LocalProfessionalData> custom({
    Expression<int>? id,
    Expression<int>? personalID,
    Expression<String>? names,
    Expression<String>? lastNames,
    Expression<String>? countryCode,
    Expression<int>? professionalID,
    Expression<String>? userName,
    Expression<String>? password,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (personalID != null) 'personal_i_d': personalID,
      if (names != null) 'names': names,
      if (lastNames != null) 'last_names': lastNames,
      if (countryCode != null) 'country_code': countryCode,
      if (professionalID != null) 'professional_i_d': professionalID,
      if (userName != null) 'user_name': userName,
      if (password != null) 'password': password,
    });
  }

  LocalProfessionalCompanion copyWith(
      {Value<int>? id,
      Value<int>? personalID,
      Value<String>? names,
      Value<String>? lastNames,
      Value<String>? countryCode,
      Value<int>? professionalID,
      Value<String>? userName,
      Value<String>? password}) {
    return LocalProfessionalCompanion(
      id: id ?? this.id,
      personalID: personalID ?? this.personalID,
      names: names ?? this.names,
      lastNames: lastNames ?? this.lastNames,
      countryCode: countryCode ?? this.countryCode,
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
    if (countryCode.present) {
      map['country_code'] = Variable<String>(countryCode.value);
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
    return (StringBuffer('LocalProfessionalCompanion(')
          ..write('id: $id, ')
          ..write('personalID: $personalID, ')
          ..write('names: $names, ')
          ..write('lastNames: $lastNames, ')
          ..write('countryCode: $countryCode, ')
          ..write('professionalID: $professionalID, ')
          ..write('userName: $userName, ')
          ..write('password: $password')
          ..write(')'))
        .toString();
  }
}

class $LocalPatientsTable extends LocalPatients
    with TableInfo<$LocalPatientsTable, LocalPatient> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalPatientsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedColumn<String> gender = GeneratedColumn<String>(
      'gender', aliasedName, false,
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
          'REFERENCES local_professional (id)'));
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
        gender,
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
  String get aliasedName => _alias ?? 'local_patients';
  @override
  String get actualTableName => 'local_patients';
  @override
  VerificationContext validateIntegrity(Insertable<LocalPatient> instance,
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
    if (data.containsKey('gender')) {
      context.handle(_genderMeta,
          gender.isAcceptableOrUnknown(data['gender']!, _genderMeta));
    } else if (isInserting) {
      context.missing(_genderMeta);
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
  LocalPatient map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalPatient(
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
      gender: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}gender'])!,
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
  $LocalPatientsTable createAlias(String alias) {
    return $LocalPatientsTable(attachedDatabase, alias);
  }
}

class LocalPatient extends DataClass implements Insertable<LocalPatient> {
  final int id;
  final String names;
  final String lastNames;
  final int idNumber;
  final DateTime birthDate;
  final int contactNumber;
  final String mail;
  final String city;
  final String state;
  final String gender;
  final String adress;
  final String education;
  final String ocupation;
  final String insurance;
  final String emergencyContactName;
  final int emergencyContactNumber;
  final DateTime creationDate;
  final bool isActive;
  final int professionalID;
  const LocalPatient(
      {required this.id,
      required this.names,
      required this.lastNames,
      required this.idNumber,
      required this.birthDate,
      required this.contactNumber,
      required this.mail,
      required this.city,
      required this.state,
      required this.gender,
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
    map['gender'] = Variable<String>(gender);
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

  LocalPatientsCompanion toCompanion(bool nullToAbsent) {
    return LocalPatientsCompanion(
      id: Value(id),
      names: Value(names),
      lastNames: Value(lastNames),
      idNumber: Value(idNumber),
      birthDate: Value(birthDate),
      contactNumber: Value(contactNumber),
      mail: Value(mail),
      city: Value(city),
      state: Value(state),
      gender: Value(gender),
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

  factory LocalPatient.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalPatient(
      id: serializer.fromJson<int>(json['id']),
      names: serializer.fromJson<String>(json['names']),
      lastNames: serializer.fromJson<String>(json['lastNames']),
      idNumber: serializer.fromJson<int>(json['idNumber']),
      birthDate: serializer.fromJson<DateTime>(json['birthDate']),
      contactNumber: serializer.fromJson<int>(json['contactNumber']),
      mail: serializer.fromJson<String>(json['mail']),
      city: serializer.fromJson<String>(json['city']),
      state: serializer.fromJson<String>(json['state']),
      gender: serializer.fromJson<String>(json['gender']),
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
      'gender': serializer.toJson<String>(gender),
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

  LocalPatient copyWith(
          {int? id,
          String? names,
          String? lastNames,
          int? idNumber,
          DateTime? birthDate,
          int? contactNumber,
          String? mail,
          String? city,
          String? state,
          String? gender,
          String? adress,
          String? education,
          String? ocupation,
          String? insurance,
          String? emergencyContactName,
          int? emergencyContactNumber,
          DateTime? creationDate,
          bool? isActive,
          int? professionalID}) =>
      LocalPatient(
        id: id ?? this.id,
        names: names ?? this.names,
        lastNames: lastNames ?? this.lastNames,
        idNumber: idNumber ?? this.idNumber,
        birthDate: birthDate ?? this.birthDate,
        contactNumber: contactNumber ?? this.contactNumber,
        mail: mail ?? this.mail,
        city: city ?? this.city,
        state: state ?? this.state,
        gender: gender ?? this.gender,
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
    return (StringBuffer('LocalPatient(')
          ..write('id: $id, ')
          ..write('names: $names, ')
          ..write('lastNames: $lastNames, ')
          ..write('idNumber: $idNumber, ')
          ..write('birthDate: $birthDate, ')
          ..write('contactNumber: $contactNumber, ')
          ..write('mail: $mail, ')
          ..write('city: $city, ')
          ..write('state: $state, ')
          ..write('gender: $gender, ')
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
      gender,
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
      (other is LocalPatient &&
          other.id == this.id &&
          other.names == this.names &&
          other.lastNames == this.lastNames &&
          other.idNumber == this.idNumber &&
          other.birthDate == this.birthDate &&
          other.contactNumber == this.contactNumber &&
          other.mail == this.mail &&
          other.city == this.city &&
          other.state == this.state &&
          other.gender == this.gender &&
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

class LocalPatientsCompanion extends UpdateCompanion<LocalPatient> {
  final Value<int> id;
  final Value<String> names;
  final Value<String> lastNames;
  final Value<int> idNumber;
  final Value<DateTime> birthDate;
  final Value<int> contactNumber;
  final Value<String> mail;
  final Value<String> city;
  final Value<String> state;
  final Value<String> gender;
  final Value<String> adress;
  final Value<String> education;
  final Value<String> ocupation;
  final Value<String> insurance;
  final Value<String> emergencyContactName;
  final Value<int> emergencyContactNumber;
  final Value<DateTime> creationDate;
  final Value<bool> isActive;
  final Value<int> professionalID;
  const LocalPatientsCompanion({
    this.id = const Value.absent(),
    this.names = const Value.absent(),
    this.lastNames = const Value.absent(),
    this.idNumber = const Value.absent(),
    this.birthDate = const Value.absent(),
    this.contactNumber = const Value.absent(),
    this.mail = const Value.absent(),
    this.city = const Value.absent(),
    this.state = const Value.absent(),
    this.gender = const Value.absent(),
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
  LocalPatientsCompanion.insert({
    this.id = const Value.absent(),
    required String names,
    required String lastNames,
    required int idNumber,
    required DateTime birthDate,
    required int contactNumber,
    required String mail,
    required String city,
    required String state,
    required String gender,
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
        gender = Value(gender),
        adress = Value(adress),
        education = Value(education),
        ocupation = Value(ocupation),
        insurance = Value(insurance),
        emergencyContactName = Value(emergencyContactName),
        emergencyContactNumber = Value(emergencyContactNumber),
        creationDate = Value(creationDate),
        isActive = Value(isActive),
        professionalID = Value(professionalID);
  static Insertable<LocalPatient> custom({
    Expression<int>? id,
    Expression<String>? names,
    Expression<String>? lastNames,
    Expression<int>? idNumber,
    Expression<DateTime>? birthDate,
    Expression<int>? contactNumber,
    Expression<String>? mail,
    Expression<String>? city,
    Expression<String>? state,
    Expression<String>? gender,
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
      if (gender != null) 'gender': gender,
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

  LocalPatientsCompanion copyWith(
      {Value<int>? id,
      Value<String>? names,
      Value<String>? lastNames,
      Value<int>? idNumber,
      Value<DateTime>? birthDate,
      Value<int>? contactNumber,
      Value<String>? mail,
      Value<String>? city,
      Value<String>? state,
      Value<String>? gender,
      Value<String>? adress,
      Value<String>? education,
      Value<String>? ocupation,
      Value<String>? insurance,
      Value<String>? emergencyContactName,
      Value<int>? emergencyContactNumber,
      Value<DateTime>? creationDate,
      Value<bool>? isActive,
      Value<int>? professionalID}) {
    return LocalPatientsCompanion(
      id: id ?? this.id,
      names: names ?? this.names,
      lastNames: lastNames ?? this.lastNames,
      idNumber: idNumber ?? this.idNumber,
      birthDate: birthDate ?? this.birthDate,
      contactNumber: contactNumber ?? this.contactNumber,
      mail: mail ?? this.mail,
      city: city ?? this.city,
      state: state ?? this.state,
      gender: gender ?? this.gender,
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
    if (gender.present) {
      map['gender'] = Variable<String>(gender.value);
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
    return (StringBuffer('LocalPatientsCompanion(')
          ..write('id: $id, ')
          ..write('names: $names, ')
          ..write('lastNames: $lastNames, ')
          ..write('idNumber: $idNumber, ')
          ..write('birthDate: $birthDate, ')
          ..write('contactNumber: $contactNumber, ')
          ..write('mail: $mail, ')
          ..write('city: $city, ')
          ..write('state: $state, ')
          ..write('gender: $gender, ')
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

class $LocalClinicHistoryTable extends LocalClinicHistory
    with TableInfo<$LocalClinicHistoryTable, LocalClinicHistoryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalClinicHistoryTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _mentalExaminationMeta =
      const VerificationMeta('mentalExamination');
  @override
  late final GeneratedColumn<String> mentalExamination =
      GeneratedColumn<String>('mental_examination', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _medAntecedentsMeta =
      const VerificationMeta('medAntecedents');
  @override
  late final GeneratedColumn<String> medAntecedents = GeneratedColumn<String>(
      'med_antecedents', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _psyAntecedentsMeta =
      const VerificationMeta('psyAntecedents');
  @override
  late final GeneratedColumn<String> psyAntecedents = GeneratedColumn<String>(
      'psy_antecedents', aliasedName, false,
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
  static const VerificationMeta _patientIdMeta =
      const VerificationMeta('patientId');
  @override
  late final GeneratedColumn<int> patientId = GeneratedColumn<int>(
      'patient_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES local_patients (id)'));
  static const VerificationMeta _professionalIDMeta =
      const VerificationMeta('professionalID');
  @override
  late final GeneratedColumn<int> professionalID = GeneratedColumn<int>(
      'professional_i_d', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES local_professional (id)'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        registerNumber,
        currentDate,
        mentalExamination,
        medAntecedents,
        psyAntecedents,
        familyHistory,
        personalHistory,
        patientId,
        professionalID
      ];
  @override
  String get aliasedName => _alias ?? 'local_clinic_history';
  @override
  String get actualTableName => 'local_clinic_history';
  @override
  VerificationContext validateIntegrity(
      Insertable<LocalClinicHistoryData> instance,
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
    if (data.containsKey('mental_examination')) {
      context.handle(
          _mentalExaminationMeta,
          mentalExamination.isAcceptableOrUnknown(
              data['mental_examination']!, _mentalExaminationMeta));
    } else if (isInserting) {
      context.missing(_mentalExaminationMeta);
    }
    if (data.containsKey('med_antecedents')) {
      context.handle(
          _medAntecedentsMeta,
          medAntecedents.isAcceptableOrUnknown(
              data['med_antecedents']!, _medAntecedentsMeta));
    } else if (isInserting) {
      context.missing(_medAntecedentsMeta);
    }
    if (data.containsKey('psy_antecedents')) {
      context.handle(
          _psyAntecedentsMeta,
          psyAntecedents.isAcceptableOrUnknown(
              data['psy_antecedents']!, _psyAntecedentsMeta));
    } else if (isInserting) {
      context.missing(_psyAntecedentsMeta);
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
    if (data.containsKey('patient_id')) {
      context.handle(_patientIdMeta,
          patientId.isAcceptableOrUnknown(data['patient_id']!, _patientIdMeta));
    } else if (isInserting) {
      context.missing(_patientIdMeta);
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
  LocalClinicHistoryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalClinicHistoryData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      registerNumber: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}register_number'])!,
      currentDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}current_date'])!,
      mentalExamination: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}mental_examination'])!,
      medAntecedents: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}med_antecedents'])!,
      psyAntecedents: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}psy_antecedents'])!,
      familyHistory: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}family_history'])!,
      personalHistory: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}personal_history'])!,
      patientId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}patient_id'])!,
      professionalID: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}professional_i_d'])!,
    );
  }

  @override
  $LocalClinicHistoryTable createAlias(String alias) {
    return $LocalClinicHistoryTable(attachedDatabase, alias);
  }
}

class LocalClinicHistoryData extends DataClass
    implements Insertable<LocalClinicHistoryData> {
  final int id;
  final String registerNumber;
  final DateTime currentDate;
  final String mentalExamination;
  final String medAntecedents;
  final String psyAntecedents;
  final String familyHistory;
  final String personalHistory;
  final int patientId;
  final int professionalID;
  const LocalClinicHistoryData(
      {required this.id,
      required this.registerNumber,
      required this.currentDate,
      required this.mentalExamination,
      required this.medAntecedents,
      required this.psyAntecedents,
      required this.familyHistory,
      required this.personalHistory,
      required this.patientId,
      required this.professionalID});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['register_number'] = Variable<String>(registerNumber);
    map['current_date'] = Variable<DateTime>(currentDate);
    map['mental_examination'] = Variable<String>(mentalExamination);
    map['med_antecedents'] = Variable<String>(medAntecedents);
    map['psy_antecedents'] = Variable<String>(psyAntecedents);
    map['family_history'] = Variable<String>(familyHistory);
    map['personal_history'] = Variable<String>(personalHistory);
    map['patient_id'] = Variable<int>(patientId);
    map['professional_i_d'] = Variable<int>(professionalID);
    return map;
  }

  LocalClinicHistoryCompanion toCompanion(bool nullToAbsent) {
    return LocalClinicHistoryCompanion(
      id: Value(id),
      registerNumber: Value(registerNumber),
      currentDate: Value(currentDate),
      mentalExamination: Value(mentalExamination),
      medAntecedents: Value(medAntecedents),
      psyAntecedents: Value(psyAntecedents),
      familyHistory: Value(familyHistory),
      personalHistory: Value(personalHistory),
      patientId: Value(patientId),
      professionalID: Value(professionalID),
    );
  }

  factory LocalClinicHistoryData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalClinicHistoryData(
      id: serializer.fromJson<int>(json['id']),
      registerNumber: serializer.fromJson<String>(json['registerNumber']),
      currentDate: serializer.fromJson<DateTime>(json['currentDate']),
      mentalExamination: serializer.fromJson<String>(json['mentalExamination']),
      medAntecedents: serializer.fromJson<String>(json['medAntecedents']),
      psyAntecedents: serializer.fromJson<String>(json['psyAntecedents']),
      familyHistory: serializer.fromJson<String>(json['familyHistory']),
      personalHistory: serializer.fromJson<String>(json['personalHistory']),
      patientId: serializer.fromJson<int>(json['patientId']),
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
      'mentalExamination': serializer.toJson<String>(mentalExamination),
      'medAntecedents': serializer.toJson<String>(medAntecedents),
      'psyAntecedents': serializer.toJson<String>(psyAntecedents),
      'familyHistory': serializer.toJson<String>(familyHistory),
      'personalHistory': serializer.toJson<String>(personalHistory),
      'patientId': serializer.toJson<int>(patientId),
      'professionalID': serializer.toJson<int>(professionalID),
    };
  }

  LocalClinicHistoryData copyWith(
          {int? id,
          String? registerNumber,
          DateTime? currentDate,
          String? mentalExamination,
          String? medAntecedents,
          String? psyAntecedents,
          String? familyHistory,
          String? personalHistory,
          int? patientId,
          int? professionalID}) =>
      LocalClinicHistoryData(
        id: id ?? this.id,
        registerNumber: registerNumber ?? this.registerNumber,
        currentDate: currentDate ?? this.currentDate,
        mentalExamination: mentalExamination ?? this.mentalExamination,
        medAntecedents: medAntecedents ?? this.medAntecedents,
        psyAntecedents: psyAntecedents ?? this.psyAntecedents,
        familyHistory: familyHistory ?? this.familyHistory,
        personalHistory: personalHistory ?? this.personalHistory,
        patientId: patientId ?? this.patientId,
        professionalID: professionalID ?? this.professionalID,
      );
  @override
  String toString() {
    return (StringBuffer('LocalClinicHistoryData(')
          ..write('id: $id, ')
          ..write('registerNumber: $registerNumber, ')
          ..write('currentDate: $currentDate, ')
          ..write('mentalExamination: $mentalExamination, ')
          ..write('medAntecedents: $medAntecedents, ')
          ..write('psyAntecedents: $psyAntecedents, ')
          ..write('familyHistory: $familyHistory, ')
          ..write('personalHistory: $personalHistory, ')
          ..write('patientId: $patientId, ')
          ..write('professionalID: $professionalID')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      registerNumber,
      currentDate,
      mentalExamination,
      medAntecedents,
      psyAntecedents,
      familyHistory,
      personalHistory,
      patientId,
      professionalID);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalClinicHistoryData &&
          other.id == this.id &&
          other.registerNumber == this.registerNumber &&
          other.currentDate == this.currentDate &&
          other.mentalExamination == this.mentalExamination &&
          other.medAntecedents == this.medAntecedents &&
          other.psyAntecedents == this.psyAntecedents &&
          other.familyHistory == this.familyHistory &&
          other.personalHistory == this.personalHistory &&
          other.patientId == this.patientId &&
          other.professionalID == this.professionalID);
}

class LocalClinicHistoryCompanion
    extends UpdateCompanion<LocalClinicHistoryData> {
  final Value<int> id;
  final Value<String> registerNumber;
  final Value<DateTime> currentDate;
  final Value<String> mentalExamination;
  final Value<String> medAntecedents;
  final Value<String> psyAntecedents;
  final Value<String> familyHistory;
  final Value<String> personalHistory;
  final Value<int> patientId;
  final Value<int> professionalID;
  const LocalClinicHistoryCompanion({
    this.id = const Value.absent(),
    this.registerNumber = const Value.absent(),
    this.currentDate = const Value.absent(),
    this.mentalExamination = const Value.absent(),
    this.medAntecedents = const Value.absent(),
    this.psyAntecedents = const Value.absent(),
    this.familyHistory = const Value.absent(),
    this.personalHistory = const Value.absent(),
    this.patientId = const Value.absent(),
    this.professionalID = const Value.absent(),
  });
  LocalClinicHistoryCompanion.insert({
    this.id = const Value.absent(),
    required String registerNumber,
    required DateTime currentDate,
    required String mentalExamination,
    required String medAntecedents,
    required String psyAntecedents,
    required String familyHistory,
    required String personalHistory,
    required int patientId,
    required int professionalID,
  })  : registerNumber = Value(registerNumber),
        currentDate = Value(currentDate),
        mentalExamination = Value(mentalExamination),
        medAntecedents = Value(medAntecedents),
        psyAntecedents = Value(psyAntecedents),
        familyHistory = Value(familyHistory),
        personalHistory = Value(personalHistory),
        patientId = Value(patientId),
        professionalID = Value(professionalID);
  static Insertable<LocalClinicHistoryData> custom({
    Expression<int>? id,
    Expression<String>? registerNumber,
    Expression<DateTime>? currentDate,
    Expression<String>? mentalExamination,
    Expression<String>? medAntecedents,
    Expression<String>? psyAntecedents,
    Expression<String>? familyHistory,
    Expression<String>? personalHistory,
    Expression<int>? patientId,
    Expression<int>? professionalID,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (registerNumber != null) 'register_number': registerNumber,
      if (currentDate != null) 'current_date': currentDate,
      if (mentalExamination != null) 'mental_examination': mentalExamination,
      if (medAntecedents != null) 'med_antecedents': medAntecedents,
      if (psyAntecedents != null) 'psy_antecedents': psyAntecedents,
      if (familyHistory != null) 'family_history': familyHistory,
      if (personalHistory != null) 'personal_history': personalHistory,
      if (patientId != null) 'patient_id': patientId,
      if (professionalID != null) 'professional_i_d': professionalID,
    });
  }

  LocalClinicHistoryCompanion copyWith(
      {Value<int>? id,
      Value<String>? registerNumber,
      Value<DateTime>? currentDate,
      Value<String>? mentalExamination,
      Value<String>? medAntecedents,
      Value<String>? psyAntecedents,
      Value<String>? familyHistory,
      Value<String>? personalHistory,
      Value<int>? patientId,
      Value<int>? professionalID}) {
    return LocalClinicHistoryCompanion(
      id: id ?? this.id,
      registerNumber: registerNumber ?? this.registerNumber,
      currentDate: currentDate ?? this.currentDate,
      mentalExamination: mentalExamination ?? this.mentalExamination,
      medAntecedents: medAntecedents ?? this.medAntecedents,
      psyAntecedents: psyAntecedents ?? this.psyAntecedents,
      familyHistory: familyHistory ?? this.familyHistory,
      personalHistory: personalHistory ?? this.personalHistory,
      patientId: patientId ?? this.patientId,
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
    if (mentalExamination.present) {
      map['mental_examination'] = Variable<String>(mentalExamination.value);
    }
    if (medAntecedents.present) {
      map['med_antecedents'] = Variable<String>(medAntecedents.value);
    }
    if (psyAntecedents.present) {
      map['psy_antecedents'] = Variable<String>(psyAntecedents.value);
    }
    if (familyHistory.present) {
      map['family_history'] = Variable<String>(familyHistory.value);
    }
    if (personalHistory.present) {
      map['personal_history'] = Variable<String>(personalHistory.value);
    }
    if (patientId.present) {
      map['patient_id'] = Variable<int>(patientId.value);
    }
    if (professionalID.present) {
      map['professional_i_d'] = Variable<int>(professionalID.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalClinicHistoryCompanion(')
          ..write('id: $id, ')
          ..write('registerNumber: $registerNumber, ')
          ..write('currentDate: $currentDate, ')
          ..write('mentalExamination: $mentalExamination, ')
          ..write('medAntecedents: $medAntecedents, ')
          ..write('psyAntecedents: $psyAntecedents, ')
          ..write('familyHistory: $familyHistory, ')
          ..write('personalHistory: $personalHistory, ')
          ..write('patientId: $patientId, ')
          ..write('professionalID: $professionalID')
          ..write(')'))
        .toString();
  }
}

class $LocalTreatmentPlansTable extends LocalTreatmentPlans
    with TableInfo<$LocalTreatmentPlansTable, LocalTreatmentPlan> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalTreatmentPlansTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _creationDateMeta =
      const VerificationMeta('creationDate');
  @override
  late final GeneratedColumn<DateTime> creationDate = GeneratedColumn<DateTime>(
      'creation_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _treatmentTitleMeta =
      const VerificationMeta('treatmentTitle');
  @override
  late final GeneratedColumn<String> treatmentTitle = GeneratedColumn<String>(
      'treatment_title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _treatmentDescriptionMeta =
      const VerificationMeta('treatmentDescription');
  @override
  late final GeneratedColumn<String> treatmentDescription =
      GeneratedColumn<String>('treatment_description', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _treatmentDataMeta =
      const VerificationMeta('treatmentData');
  @override
  late final GeneratedColumn<String> treatmentData = GeneratedColumn<String>(
      'treatment_data', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _professionalIDMeta =
      const VerificationMeta('professionalID');
  @override
  late final GeneratedColumn<int> professionalID = GeneratedColumn<int>(
      'professional_i_d', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES local_professional (id)'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        creationDate,
        treatmentTitle,
        treatmentDescription,
        treatmentData,
        professionalID
      ];
  @override
  String get aliasedName => _alias ?? 'local_treatment_plans';
  @override
  String get actualTableName => 'local_treatment_plans';
  @override
  VerificationContext validateIntegrity(Insertable<LocalTreatmentPlan> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('creation_date')) {
      context.handle(
          _creationDateMeta,
          creationDate.isAcceptableOrUnknown(
              data['creation_date']!, _creationDateMeta));
    } else if (isInserting) {
      context.missing(_creationDateMeta);
    }
    if (data.containsKey('treatment_title')) {
      context.handle(
          _treatmentTitleMeta,
          treatmentTitle.isAcceptableOrUnknown(
              data['treatment_title']!, _treatmentTitleMeta));
    } else if (isInserting) {
      context.missing(_treatmentTitleMeta);
    }
    if (data.containsKey('treatment_description')) {
      context.handle(
          _treatmentDescriptionMeta,
          treatmentDescription.isAcceptableOrUnknown(
              data['treatment_description']!, _treatmentDescriptionMeta));
    } else if (isInserting) {
      context.missing(_treatmentDescriptionMeta);
    }
    if (data.containsKey('treatment_data')) {
      context.handle(
          _treatmentDataMeta,
          treatmentData.isAcceptableOrUnknown(
              data['treatment_data']!, _treatmentDataMeta));
    } else if (isInserting) {
      context.missing(_treatmentDataMeta);
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
  LocalTreatmentPlan map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalTreatmentPlan(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      creationDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}creation_date'])!,
      treatmentTitle: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}treatment_title'])!,
      treatmentDescription: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}treatment_description'])!,
      treatmentData: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}treatment_data'])!,
      professionalID: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}professional_i_d'])!,
    );
  }

  @override
  $LocalTreatmentPlansTable createAlias(String alias) {
    return $LocalTreatmentPlansTable(attachedDatabase, alias);
  }
}

class LocalTreatmentPlan extends DataClass
    implements Insertable<LocalTreatmentPlan> {
  final int id;
  final DateTime creationDate;
  final String treatmentTitle;
  final String treatmentDescription;
  final String treatmentData;
  final int professionalID;
  const LocalTreatmentPlan(
      {required this.id,
      required this.creationDate,
      required this.treatmentTitle,
      required this.treatmentDescription,
      required this.treatmentData,
      required this.professionalID});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['creation_date'] = Variable<DateTime>(creationDate);
    map['treatment_title'] = Variable<String>(treatmentTitle);
    map['treatment_description'] = Variable<String>(treatmentDescription);
    map['treatment_data'] = Variable<String>(treatmentData);
    map['professional_i_d'] = Variable<int>(professionalID);
    return map;
  }

  LocalTreatmentPlansCompanion toCompanion(bool nullToAbsent) {
    return LocalTreatmentPlansCompanion(
      id: Value(id),
      creationDate: Value(creationDate),
      treatmentTitle: Value(treatmentTitle),
      treatmentDescription: Value(treatmentDescription),
      treatmentData: Value(treatmentData),
      professionalID: Value(professionalID),
    );
  }

  factory LocalTreatmentPlan.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalTreatmentPlan(
      id: serializer.fromJson<int>(json['id']),
      creationDate: serializer.fromJson<DateTime>(json['creationDate']),
      treatmentTitle: serializer.fromJson<String>(json['treatmentTitle']),
      treatmentDescription:
          serializer.fromJson<String>(json['treatmentDescription']),
      treatmentData: serializer.fromJson<String>(json['treatmentData']),
      professionalID: serializer.fromJson<int>(json['professionalID']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'creationDate': serializer.toJson<DateTime>(creationDate),
      'treatmentTitle': serializer.toJson<String>(treatmentTitle),
      'treatmentDescription': serializer.toJson<String>(treatmentDescription),
      'treatmentData': serializer.toJson<String>(treatmentData),
      'professionalID': serializer.toJson<int>(professionalID),
    };
  }

  LocalTreatmentPlan copyWith(
          {int? id,
          DateTime? creationDate,
          String? treatmentTitle,
          String? treatmentDescription,
          String? treatmentData,
          int? professionalID}) =>
      LocalTreatmentPlan(
        id: id ?? this.id,
        creationDate: creationDate ?? this.creationDate,
        treatmentTitle: treatmentTitle ?? this.treatmentTitle,
        treatmentDescription: treatmentDescription ?? this.treatmentDescription,
        treatmentData: treatmentData ?? this.treatmentData,
        professionalID: professionalID ?? this.professionalID,
      );
  @override
  String toString() {
    return (StringBuffer('LocalTreatmentPlan(')
          ..write('id: $id, ')
          ..write('creationDate: $creationDate, ')
          ..write('treatmentTitle: $treatmentTitle, ')
          ..write('treatmentDescription: $treatmentDescription, ')
          ..write('treatmentData: $treatmentData, ')
          ..write('professionalID: $professionalID')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, creationDate, treatmentTitle,
      treatmentDescription, treatmentData, professionalID);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalTreatmentPlan &&
          other.id == this.id &&
          other.creationDate == this.creationDate &&
          other.treatmentTitle == this.treatmentTitle &&
          other.treatmentDescription == this.treatmentDescription &&
          other.treatmentData == this.treatmentData &&
          other.professionalID == this.professionalID);
}

class LocalTreatmentPlansCompanion extends UpdateCompanion<LocalTreatmentPlan> {
  final Value<int> id;
  final Value<DateTime> creationDate;
  final Value<String> treatmentTitle;
  final Value<String> treatmentDescription;
  final Value<String> treatmentData;
  final Value<int> professionalID;
  const LocalTreatmentPlansCompanion({
    this.id = const Value.absent(),
    this.creationDate = const Value.absent(),
    this.treatmentTitle = const Value.absent(),
    this.treatmentDescription = const Value.absent(),
    this.treatmentData = const Value.absent(),
    this.professionalID = const Value.absent(),
  });
  LocalTreatmentPlansCompanion.insert({
    this.id = const Value.absent(),
    required DateTime creationDate,
    required String treatmentTitle,
    required String treatmentDescription,
    required String treatmentData,
    required int professionalID,
  })  : creationDate = Value(creationDate),
        treatmentTitle = Value(treatmentTitle),
        treatmentDescription = Value(treatmentDescription),
        treatmentData = Value(treatmentData),
        professionalID = Value(professionalID);
  static Insertable<LocalTreatmentPlan> custom({
    Expression<int>? id,
    Expression<DateTime>? creationDate,
    Expression<String>? treatmentTitle,
    Expression<String>? treatmentDescription,
    Expression<String>? treatmentData,
    Expression<int>? professionalID,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (creationDate != null) 'creation_date': creationDate,
      if (treatmentTitle != null) 'treatment_title': treatmentTitle,
      if (treatmentDescription != null)
        'treatment_description': treatmentDescription,
      if (treatmentData != null) 'treatment_data': treatmentData,
      if (professionalID != null) 'professional_i_d': professionalID,
    });
  }

  LocalTreatmentPlansCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? creationDate,
      Value<String>? treatmentTitle,
      Value<String>? treatmentDescription,
      Value<String>? treatmentData,
      Value<int>? professionalID}) {
    return LocalTreatmentPlansCompanion(
      id: id ?? this.id,
      creationDate: creationDate ?? this.creationDate,
      treatmentTitle: treatmentTitle ?? this.treatmentTitle,
      treatmentDescription: treatmentDescription ?? this.treatmentDescription,
      treatmentData: treatmentData ?? this.treatmentData,
      professionalID: professionalID ?? this.professionalID,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (creationDate.present) {
      map['creation_date'] = Variable<DateTime>(creationDate.value);
    }
    if (treatmentTitle.present) {
      map['treatment_title'] = Variable<String>(treatmentTitle.value);
    }
    if (treatmentDescription.present) {
      map['treatment_description'] =
          Variable<String>(treatmentDescription.value);
    }
    if (treatmentData.present) {
      map['treatment_data'] = Variable<String>(treatmentData.value);
    }
    if (professionalID.present) {
      map['professional_i_d'] = Variable<int>(professionalID.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalTreatmentPlansCompanion(')
          ..write('id: $id, ')
          ..write('creationDate: $creationDate, ')
          ..write('treatmentTitle: $treatmentTitle, ')
          ..write('treatmentDescription: $treatmentDescription, ')
          ..write('treatmentData: $treatmentData, ')
          ..write('professionalID: $professionalID')
          ..write(')'))
        .toString();
  }
}

class $LocaltreatmentResultsTable extends LocaltreatmentResults
    with TableInfo<$LocaltreatmentResultsTable, LocaltreatmentResult> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocaltreatmentResultsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _sessionNumberMeta =
      const VerificationMeta('sessionNumber');
  @override
  late final GeneratedColumn<int> sessionNumber = GeneratedColumn<int>(
      'session_number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _applicationDateMeta =
      const VerificationMeta('applicationDate');
  @override
  late final GeneratedColumn<DateTime> applicationDate =
      GeneratedColumn<DateTime>('application_date', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _patientIDMeta =
      const VerificationMeta('patientID');
  @override
  late final GeneratedColumn<int> patientID = GeneratedColumn<int>(
      'patient_i_d', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES local_patients (id)'));
  static const VerificationMeta _professionalIDMeta =
      const VerificationMeta('professionalID');
  @override
  late final GeneratedColumn<int> professionalID = GeneratedColumn<int>(
      'professional_i_d', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES local_professional (id)'));
  static const VerificationMeta _treatmentPlanIDMeta =
      const VerificationMeta('treatmentPlanID');
  @override
  late final GeneratedColumn<String> treatmentPlanID = GeneratedColumn<String>(
      'treatment_plan_i_d', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES local_treatment_plans (id)'));
  static const VerificationMeta _treatmentResultsDataMeta =
      const VerificationMeta('treatmentResultsData');
  @override
  late final GeneratedColumn<String> treatmentResultsData =
      GeneratedColumn<String>('treatment_results_data', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        sessionNumber,
        applicationDate,
        patientID,
        professionalID,
        treatmentPlanID,
        treatmentResultsData
      ];
  @override
  String get aliasedName => _alias ?? 'localtreatment_results';
  @override
  String get actualTableName => 'localtreatment_results';
  @override
  VerificationContext validateIntegrity(
      Insertable<LocaltreatmentResult> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('session_number')) {
      context.handle(
          _sessionNumberMeta,
          sessionNumber.isAcceptableOrUnknown(
              data['session_number']!, _sessionNumberMeta));
    } else if (isInserting) {
      context.missing(_sessionNumberMeta);
    }
    if (data.containsKey('application_date')) {
      context.handle(
          _applicationDateMeta,
          applicationDate.isAcceptableOrUnknown(
              data['application_date']!, _applicationDateMeta));
    } else if (isInserting) {
      context.missing(_applicationDateMeta);
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
    if (data.containsKey('treatment_plan_i_d')) {
      context.handle(
          _treatmentPlanIDMeta,
          treatmentPlanID.isAcceptableOrUnknown(
              data['treatment_plan_i_d']!, _treatmentPlanIDMeta));
    } else if (isInserting) {
      context.missing(_treatmentPlanIDMeta);
    }
    if (data.containsKey('treatment_results_data')) {
      context.handle(
          _treatmentResultsDataMeta,
          treatmentResultsData.isAcceptableOrUnknown(
              data['treatment_results_data']!, _treatmentResultsDataMeta));
    } else if (isInserting) {
      context.missing(_treatmentResultsDataMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LocaltreatmentResult map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocaltreatmentResult(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      sessionNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}session_number'])!,
      applicationDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}application_date'])!,
      patientID: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}patient_i_d'])!,
      professionalID: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}professional_i_d'])!,
      treatmentPlanID: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}treatment_plan_i_d'])!,
      treatmentResultsData: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}treatment_results_data'])!,
    );
  }

  @override
  $LocaltreatmentResultsTable createAlias(String alias) {
    return $LocaltreatmentResultsTable(attachedDatabase, alias);
  }
}

class LocaltreatmentResult extends DataClass
    implements Insertable<LocaltreatmentResult> {
  final int id;
  final int sessionNumber;
  final DateTime applicationDate;
  final int patientID;
  final int professionalID;
  final String treatmentPlanID;
  final String treatmentResultsData;
  const LocaltreatmentResult(
      {required this.id,
      required this.sessionNumber,
      required this.applicationDate,
      required this.patientID,
      required this.professionalID,
      required this.treatmentPlanID,
      required this.treatmentResultsData});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['session_number'] = Variable<int>(sessionNumber);
    map['application_date'] = Variable<DateTime>(applicationDate);
    map['patient_i_d'] = Variable<int>(patientID);
    map['professional_i_d'] = Variable<int>(professionalID);
    map['treatment_plan_i_d'] = Variable<String>(treatmentPlanID);
    map['treatment_results_data'] = Variable<String>(treatmentResultsData);
    return map;
  }

  LocaltreatmentResultsCompanion toCompanion(bool nullToAbsent) {
    return LocaltreatmentResultsCompanion(
      id: Value(id),
      sessionNumber: Value(sessionNumber),
      applicationDate: Value(applicationDate),
      patientID: Value(patientID),
      professionalID: Value(professionalID),
      treatmentPlanID: Value(treatmentPlanID),
      treatmentResultsData: Value(treatmentResultsData),
    );
  }

  factory LocaltreatmentResult.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocaltreatmentResult(
      id: serializer.fromJson<int>(json['id']),
      sessionNumber: serializer.fromJson<int>(json['sessionNumber']),
      applicationDate: serializer.fromJson<DateTime>(json['applicationDate']),
      patientID: serializer.fromJson<int>(json['patientID']),
      professionalID: serializer.fromJson<int>(json['professionalID']),
      treatmentPlanID: serializer.fromJson<String>(json['treatmentPlanID']),
      treatmentResultsData:
          serializer.fromJson<String>(json['treatmentResultsData']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'sessionNumber': serializer.toJson<int>(sessionNumber),
      'applicationDate': serializer.toJson<DateTime>(applicationDate),
      'patientID': serializer.toJson<int>(patientID),
      'professionalID': serializer.toJson<int>(professionalID),
      'treatmentPlanID': serializer.toJson<String>(treatmentPlanID),
      'treatmentResultsData': serializer.toJson<String>(treatmentResultsData),
    };
  }

  LocaltreatmentResult copyWith(
          {int? id,
          int? sessionNumber,
          DateTime? applicationDate,
          int? patientID,
          int? professionalID,
          String? treatmentPlanID,
          String? treatmentResultsData}) =>
      LocaltreatmentResult(
        id: id ?? this.id,
        sessionNumber: sessionNumber ?? this.sessionNumber,
        applicationDate: applicationDate ?? this.applicationDate,
        patientID: patientID ?? this.patientID,
        professionalID: professionalID ?? this.professionalID,
        treatmentPlanID: treatmentPlanID ?? this.treatmentPlanID,
        treatmentResultsData: treatmentResultsData ?? this.treatmentResultsData,
      );
  @override
  String toString() {
    return (StringBuffer('LocaltreatmentResult(')
          ..write('id: $id, ')
          ..write('sessionNumber: $sessionNumber, ')
          ..write('applicationDate: $applicationDate, ')
          ..write('patientID: $patientID, ')
          ..write('professionalID: $professionalID, ')
          ..write('treatmentPlanID: $treatmentPlanID, ')
          ..write('treatmentResultsData: $treatmentResultsData')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, sessionNumber, applicationDate, patientID,
      professionalID, treatmentPlanID, treatmentResultsData);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocaltreatmentResult &&
          other.id == this.id &&
          other.sessionNumber == this.sessionNumber &&
          other.applicationDate == this.applicationDate &&
          other.patientID == this.patientID &&
          other.professionalID == this.professionalID &&
          other.treatmentPlanID == this.treatmentPlanID &&
          other.treatmentResultsData == this.treatmentResultsData);
}

class LocaltreatmentResultsCompanion
    extends UpdateCompanion<LocaltreatmentResult> {
  final Value<int> id;
  final Value<int> sessionNumber;
  final Value<DateTime> applicationDate;
  final Value<int> patientID;
  final Value<int> professionalID;
  final Value<String> treatmentPlanID;
  final Value<String> treatmentResultsData;
  const LocaltreatmentResultsCompanion({
    this.id = const Value.absent(),
    this.sessionNumber = const Value.absent(),
    this.applicationDate = const Value.absent(),
    this.patientID = const Value.absent(),
    this.professionalID = const Value.absent(),
    this.treatmentPlanID = const Value.absent(),
    this.treatmentResultsData = const Value.absent(),
  });
  LocaltreatmentResultsCompanion.insert({
    this.id = const Value.absent(),
    required int sessionNumber,
    required DateTime applicationDate,
    required int patientID,
    required int professionalID,
    required String treatmentPlanID,
    required String treatmentResultsData,
  })  : sessionNumber = Value(sessionNumber),
        applicationDate = Value(applicationDate),
        patientID = Value(patientID),
        professionalID = Value(professionalID),
        treatmentPlanID = Value(treatmentPlanID),
        treatmentResultsData = Value(treatmentResultsData);
  static Insertable<LocaltreatmentResult> custom({
    Expression<int>? id,
    Expression<int>? sessionNumber,
    Expression<DateTime>? applicationDate,
    Expression<int>? patientID,
    Expression<int>? professionalID,
    Expression<String>? treatmentPlanID,
    Expression<String>? treatmentResultsData,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sessionNumber != null) 'session_number': sessionNumber,
      if (applicationDate != null) 'application_date': applicationDate,
      if (patientID != null) 'patient_i_d': patientID,
      if (professionalID != null) 'professional_i_d': professionalID,
      if (treatmentPlanID != null) 'treatment_plan_i_d': treatmentPlanID,
      if (treatmentResultsData != null)
        'treatment_results_data': treatmentResultsData,
    });
  }

  LocaltreatmentResultsCompanion copyWith(
      {Value<int>? id,
      Value<int>? sessionNumber,
      Value<DateTime>? applicationDate,
      Value<int>? patientID,
      Value<int>? professionalID,
      Value<String>? treatmentPlanID,
      Value<String>? treatmentResultsData}) {
    return LocaltreatmentResultsCompanion(
      id: id ?? this.id,
      sessionNumber: sessionNumber ?? this.sessionNumber,
      applicationDate: applicationDate ?? this.applicationDate,
      patientID: patientID ?? this.patientID,
      professionalID: professionalID ?? this.professionalID,
      treatmentPlanID: treatmentPlanID ?? this.treatmentPlanID,
      treatmentResultsData: treatmentResultsData ?? this.treatmentResultsData,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (sessionNumber.present) {
      map['session_number'] = Variable<int>(sessionNumber.value);
    }
    if (applicationDate.present) {
      map['application_date'] = Variable<DateTime>(applicationDate.value);
    }
    if (patientID.present) {
      map['patient_i_d'] = Variable<int>(patientID.value);
    }
    if (professionalID.present) {
      map['professional_i_d'] = Variable<int>(professionalID.value);
    }
    if (treatmentPlanID.present) {
      map['treatment_plan_i_d'] = Variable<String>(treatmentPlanID.value);
    }
    if (treatmentResultsData.present) {
      map['treatment_results_data'] =
          Variable<String>(treatmentResultsData.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocaltreatmentResultsCompanion(')
          ..write('id: $id, ')
          ..write('sessionNumber: $sessionNumber, ')
          ..write('applicationDate: $applicationDate, ')
          ..write('patientID: $patientID, ')
          ..write('professionalID: $professionalID, ')
          ..write('treatmentPlanID: $treatmentPlanID, ')
          ..write('treatmentResultsData: $treatmentResultsData')
          ..write(')'))
        .toString();
  }
}

class $LocalPatientCaseTable extends LocalPatientCase
    with TableInfo<$LocalPatientCaseTable, LocalPatientCaseData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalPatientCaseTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _creationDateMeta =
      const VerificationMeta('creationDate');
  @override
  late final GeneratedColumn<DateTime> creationDate = GeneratedColumn<DateTime>(
      'creation_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _patientIdMeta =
      const VerificationMeta('patientId');
  @override
  late final GeneratedColumn<int> patientId = GeneratedColumn<int>(
      'patient_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES local_patients (id)'));
  static const VerificationMeta _professionalIdMeta =
      const VerificationMeta('professionalId');
  @override
  late final GeneratedColumn<int> professionalId = GeneratedColumn<int>(
      'professional_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES local_professional (id)'));
  static const VerificationMeta _consultationReasonMeta =
      const VerificationMeta('consultationReason');
  @override
  late final GeneratedColumn<String> consultationReason =
      GeneratedColumn<String>('consultation_reason', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _diagnosticMeta =
      const VerificationMeta('diagnostic');
  @override
  late final GeneratedColumn<String> diagnostic = GeneratedColumn<String>(
      'diagnostic', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _treatmentProposalMeta =
      const VerificationMeta('treatmentProposal');
  @override
  late final GeneratedColumn<String> treatmentProposal =
      GeneratedColumn<String>('treatment_proposal', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _caseNotesMeta =
      const VerificationMeta('caseNotes');
  @override
  late final GeneratedColumn<String> caseNotes = GeneratedColumn<String>(
      'case_notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
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
  static const VerificationMeta _patientCaseClosedMeta =
      const VerificationMeta('patientCaseClosed');
  @override
  late final GeneratedColumn<bool> patientCaseClosed =
      GeneratedColumn<bool>('patient_case_closed', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("patient_case_closed" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _treatmentPlanOutcomeMeta =
      const VerificationMeta('treatmentPlanOutcome');
  @override
  late final GeneratedColumn<String> treatmentPlanOutcome =
      GeneratedColumn<String>('treatment_plan_outcome', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _treatmentPlanIdMeta =
      const VerificationMeta('treatmentPlanId');
  @override
  late final GeneratedColumn<int> treatmentPlanId = GeneratedColumn<int>(
      'treatment_plan_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES local_treatment_plans (id)'));
  static const VerificationMeta _localTreatmentPlanResultsMeta =
      const VerificationMeta('localTreatmentPlanResults');
  @override
  late final GeneratedColumn<int> localTreatmentPlanResults =
      GeneratedColumn<int>('local_treatment_plan_results', aliasedName, true,
          type: DriftSqlType.int,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'REFERENCES localtreatment_results (id)'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        creationDate,
        patientId,
        professionalId,
        consultationReason,
        diagnostic,
        treatmentProposal,
        caseNotes,
        isActive,
        patientCaseClosed,
        treatmentPlanOutcome,
        treatmentPlanId,
        localTreatmentPlanResults
      ];
  @override
  String get aliasedName => _alias ?? 'local_patient_case';
  @override
  String get actualTableName => 'local_patient_case';
  @override
  VerificationContext validateIntegrity(
      Insertable<LocalPatientCaseData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('creation_date')) {
      context.handle(
          _creationDateMeta,
          creationDate.isAcceptableOrUnknown(
              data['creation_date']!, _creationDateMeta));
    } else if (isInserting) {
      context.missing(_creationDateMeta);
    }
    if (data.containsKey('patient_id')) {
      context.handle(_patientIdMeta,
          patientId.isAcceptableOrUnknown(data['patient_id']!, _patientIdMeta));
    } else if (isInserting) {
      context.missing(_patientIdMeta);
    }
    if (data.containsKey('professional_id')) {
      context.handle(
          _professionalIdMeta,
          professionalId.isAcceptableOrUnknown(
              data['professional_id']!, _professionalIdMeta));
    } else if (isInserting) {
      context.missing(_professionalIdMeta);
    }
    if (data.containsKey('consultation_reason')) {
      context.handle(
          _consultationReasonMeta,
          consultationReason.isAcceptableOrUnknown(
              data['consultation_reason']!, _consultationReasonMeta));
    } else if (isInserting) {
      context.missing(_consultationReasonMeta);
    }
    if (data.containsKey('diagnostic')) {
      context.handle(
          _diagnosticMeta,
          diagnostic.isAcceptableOrUnknown(
              data['diagnostic']!, _diagnosticMeta));
    } else if (isInserting) {
      context.missing(_diagnosticMeta);
    }
    if (data.containsKey('treatment_proposal')) {
      context.handle(
          _treatmentProposalMeta,
          treatmentProposal.isAcceptableOrUnknown(
              data['treatment_proposal']!, _treatmentProposalMeta));
    } else if (isInserting) {
      context.missing(_treatmentProposalMeta);
    }
    if (data.containsKey('case_notes')) {
      context.handle(_caseNotesMeta,
          caseNotes.isAcceptableOrUnknown(data['case_notes']!, _caseNotesMeta));
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    } else if (isInserting) {
      context.missing(_isActiveMeta);
    }
    if (data.containsKey('patient_case_closed')) {
      context.handle(
          _patientCaseClosedMeta,
          patientCaseClosed.isAcceptableOrUnknown(
              data['patient_case_closed']!, _patientCaseClosedMeta));
    } else if (isInserting) {
      context.missing(_patientCaseClosedMeta);
    }
    if (data.containsKey('treatment_plan_outcome')) {
      context.handle(
          _treatmentPlanOutcomeMeta,
          treatmentPlanOutcome.isAcceptableOrUnknown(
              data['treatment_plan_outcome']!, _treatmentPlanOutcomeMeta));
    }
    if (data.containsKey('treatment_plan_id')) {
      context.handle(
          _treatmentPlanIdMeta,
          treatmentPlanId.isAcceptableOrUnknown(
              data['treatment_plan_id']!, _treatmentPlanIdMeta));
    }
    if (data.containsKey('local_treatment_plan_results')) {
      context.handle(
          _localTreatmentPlanResultsMeta,
          localTreatmentPlanResults.isAcceptableOrUnknown(
              data['local_treatment_plan_results']!,
              _localTreatmentPlanResultsMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LocalPatientCaseData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalPatientCaseData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      creationDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}creation_date'])!,
      patientId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}patient_id'])!,
      professionalId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}professional_id'])!,
      consultationReason: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}consultation_reason'])!,
      diagnostic: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}diagnostic'])!,
      treatmentProposal: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}treatment_proposal'])!,
      caseNotes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}case_notes']),
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
      patientCaseClosed: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}patient_case_closed'])!,
      treatmentPlanOutcome: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}treatment_plan_outcome']),
      treatmentPlanId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}treatment_plan_id']),
      localTreatmentPlanResults: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}local_treatment_plan_results']),
    );
  }

  @override
  $LocalPatientCaseTable createAlias(String alias) {
    return $LocalPatientCaseTable(attachedDatabase, alias);
  }
}

class LocalPatientCaseData extends DataClass
    implements Insertable<LocalPatientCaseData> {
  final int id;
  final DateTime creationDate;
  final int patientId;
  final int professionalId;
  final String consultationReason;
  final String diagnostic;
  final String treatmentProposal;
  final String? caseNotes;
  final bool isActive;
  final bool patientCaseClosed;

  ///String with a positive, neutral or negative result
  final String? treatmentPlanOutcome;
  final int? treatmentPlanId;
  final int? localTreatmentPlanResults;
  const LocalPatientCaseData(
      {required this.id,
      required this.creationDate,
      required this.patientId,
      required this.professionalId,
      required this.consultationReason,
      required this.diagnostic,
      required this.treatmentProposal,
      this.caseNotes,
      required this.isActive,
      required this.patientCaseClosed,
      this.treatmentPlanOutcome,
      this.treatmentPlanId,
      this.localTreatmentPlanResults});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['creation_date'] = Variable<DateTime>(creationDate);
    map['patient_id'] = Variable<int>(patientId);
    map['professional_id'] = Variable<int>(professionalId);
    map['consultation_reason'] = Variable<String>(consultationReason);
    map['diagnostic'] = Variable<String>(diagnostic);
    map['treatment_proposal'] = Variable<String>(treatmentProposal);
    if (!nullToAbsent || caseNotes != null) {
      map['case_notes'] = Variable<String>(caseNotes);
    }
    map['is_active'] = Variable<bool>(isActive);
    map['patient_case_closed'] = Variable<bool>(patientCaseClosed);
    if (!nullToAbsent || treatmentPlanOutcome != null) {
      map['treatment_plan_outcome'] = Variable<String>(treatmentPlanOutcome);
    }
    if (!nullToAbsent || treatmentPlanId != null) {
      map['treatment_plan_id'] = Variable<int>(treatmentPlanId);
    }
    if (!nullToAbsent || localTreatmentPlanResults != null) {
      map['local_treatment_plan_results'] =
          Variable<int>(localTreatmentPlanResults);
    }
    return map;
  }

  LocalPatientCaseCompanion toCompanion(bool nullToAbsent) {
    return LocalPatientCaseCompanion(
      id: Value(id),
      creationDate: Value(creationDate),
      patientId: Value(patientId),
      professionalId: Value(professionalId),
      consultationReason: Value(consultationReason),
      diagnostic: Value(diagnostic),
      treatmentProposal: Value(treatmentProposal),
      caseNotes: caseNotes == null && nullToAbsent
          ? const Value.absent()
          : Value(caseNotes),
      isActive: Value(isActive),
      patientCaseClosed: Value(patientCaseClosed),
      treatmentPlanOutcome: treatmentPlanOutcome == null && nullToAbsent
          ? const Value.absent()
          : Value(treatmentPlanOutcome),
      treatmentPlanId: treatmentPlanId == null && nullToAbsent
          ? const Value.absent()
          : Value(treatmentPlanId),
      localTreatmentPlanResults:
          localTreatmentPlanResults == null && nullToAbsent
              ? const Value.absent()
              : Value(localTreatmentPlanResults),
    );
  }

  factory LocalPatientCaseData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalPatientCaseData(
      id: serializer.fromJson<int>(json['id']),
      creationDate: serializer.fromJson<DateTime>(json['creationDate']),
      patientId: serializer.fromJson<int>(json['patientId']),
      professionalId: serializer.fromJson<int>(json['professionalId']),
      consultationReason:
          serializer.fromJson<String>(json['consultationReason']),
      diagnostic: serializer.fromJson<String>(json['diagnostic']),
      treatmentProposal: serializer.fromJson<String>(json['treatmentProposal']),
      caseNotes: serializer.fromJson<String?>(json['caseNotes']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      patientCaseClosed: serializer.fromJson<bool>(json['patientCaseClosed']),
      treatmentPlanOutcome:
          serializer.fromJson<String?>(json['treatmentPlanOutcome']),
      treatmentPlanId: serializer.fromJson<int?>(json['treatmentPlanId']),
      localTreatmentPlanResults:
          serializer.fromJson<int?>(json['localTreatmentPlanResults']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'creationDate': serializer.toJson<DateTime>(creationDate),
      'patientId': serializer.toJson<int>(patientId),
      'professionalId': serializer.toJson<int>(professionalId),
      'consultationReason': serializer.toJson<String>(consultationReason),
      'diagnostic': serializer.toJson<String>(diagnostic),
      'treatmentProposal': serializer.toJson<String>(treatmentProposal),
      'caseNotes': serializer.toJson<String?>(caseNotes),
      'isActive': serializer.toJson<bool>(isActive),
      'patientCaseClosed': serializer.toJson<bool>(patientCaseClosed),
      'treatmentPlanOutcome': serializer.toJson<String?>(treatmentPlanOutcome),
      'treatmentPlanId': serializer.toJson<int?>(treatmentPlanId),
      'localTreatmentPlanResults':
          serializer.toJson<int?>(localTreatmentPlanResults),
    };
  }

  LocalPatientCaseData copyWith(
          {int? id,
          DateTime? creationDate,
          int? patientId,
          int? professionalId,
          String? consultationReason,
          String? diagnostic,
          String? treatmentProposal,
          Value<String?> caseNotes = const Value.absent(),
          bool? isActive,
          bool? patientCaseClosed,
          Value<String?> treatmentPlanOutcome = const Value.absent(),
          Value<int?> treatmentPlanId = const Value.absent(),
          Value<int?> localTreatmentPlanResults = const Value.absent()}) =>
      LocalPatientCaseData(
        id: id ?? this.id,
        creationDate: creationDate ?? this.creationDate,
        patientId: patientId ?? this.patientId,
        professionalId: professionalId ?? this.professionalId,
        consultationReason: consultationReason ?? this.consultationReason,
        diagnostic: diagnostic ?? this.diagnostic,
        treatmentProposal: treatmentProposal ?? this.treatmentProposal,
        caseNotes: caseNotes.present ? caseNotes.value : this.caseNotes,
        isActive: isActive ?? this.isActive,
        patientCaseClosed: patientCaseClosed ?? this.patientCaseClosed,
        treatmentPlanOutcome: treatmentPlanOutcome.present
            ? treatmentPlanOutcome.value
            : this.treatmentPlanOutcome,
        treatmentPlanId: treatmentPlanId.present
            ? treatmentPlanId.value
            : this.treatmentPlanId,
        localTreatmentPlanResults: localTreatmentPlanResults.present
            ? localTreatmentPlanResults.value
            : this.localTreatmentPlanResults,
      );
  @override
  String toString() {
    return (StringBuffer('LocalPatientCaseData(')
          ..write('id: $id, ')
          ..write('creationDate: $creationDate, ')
          ..write('patientId: $patientId, ')
          ..write('professionalId: $professionalId, ')
          ..write('consultationReason: $consultationReason, ')
          ..write('diagnostic: $diagnostic, ')
          ..write('treatmentProposal: $treatmentProposal, ')
          ..write('caseNotes: $caseNotes, ')
          ..write('isActive: $isActive, ')
          ..write('patientCaseClosed: $patientCaseClosed, ')
          ..write('treatmentPlanOutcome: $treatmentPlanOutcome, ')
          ..write('treatmentPlanId: $treatmentPlanId, ')
          ..write('localTreatmentPlanResults: $localTreatmentPlanResults')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      creationDate,
      patientId,
      professionalId,
      consultationReason,
      diagnostic,
      treatmentProposal,
      caseNotes,
      isActive,
      patientCaseClosed,
      treatmentPlanOutcome,
      treatmentPlanId,
      localTreatmentPlanResults);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalPatientCaseData &&
          other.id == this.id &&
          other.creationDate == this.creationDate &&
          other.patientId == this.patientId &&
          other.professionalId == this.professionalId &&
          other.consultationReason == this.consultationReason &&
          other.diagnostic == this.diagnostic &&
          other.treatmentProposal == this.treatmentProposal &&
          other.caseNotes == this.caseNotes &&
          other.isActive == this.isActive &&
          other.patientCaseClosed == this.patientCaseClosed &&
          other.treatmentPlanOutcome == this.treatmentPlanOutcome &&
          other.treatmentPlanId == this.treatmentPlanId &&
          other.localTreatmentPlanResults == this.localTreatmentPlanResults);
}

class LocalPatientCaseCompanion extends UpdateCompanion<LocalPatientCaseData> {
  final Value<int> id;
  final Value<DateTime> creationDate;
  final Value<int> patientId;
  final Value<int> professionalId;
  final Value<String> consultationReason;
  final Value<String> diagnostic;
  final Value<String> treatmentProposal;
  final Value<String?> caseNotes;
  final Value<bool> isActive;
  final Value<bool> patientCaseClosed;
  final Value<String?> treatmentPlanOutcome;
  final Value<int?> treatmentPlanId;
  final Value<int?> localTreatmentPlanResults;
  const LocalPatientCaseCompanion({
    this.id = const Value.absent(),
    this.creationDate = const Value.absent(),
    this.patientId = const Value.absent(),
    this.professionalId = const Value.absent(),
    this.consultationReason = const Value.absent(),
    this.diagnostic = const Value.absent(),
    this.treatmentProposal = const Value.absent(),
    this.caseNotes = const Value.absent(),
    this.isActive = const Value.absent(),
    this.patientCaseClosed = const Value.absent(),
    this.treatmentPlanOutcome = const Value.absent(),
    this.treatmentPlanId = const Value.absent(),
    this.localTreatmentPlanResults = const Value.absent(),
  });
  LocalPatientCaseCompanion.insert({
    this.id = const Value.absent(),
    required DateTime creationDate,
    required int patientId,
    required int professionalId,
    required String consultationReason,
    required String diagnostic,
    required String treatmentProposal,
    this.caseNotes = const Value.absent(),
    required bool isActive,
    required bool patientCaseClosed,
    this.treatmentPlanOutcome = const Value.absent(),
    this.treatmentPlanId = const Value.absent(),
    this.localTreatmentPlanResults = const Value.absent(),
  })  : creationDate = Value(creationDate),
        patientId = Value(patientId),
        professionalId = Value(professionalId),
        consultationReason = Value(consultationReason),
        diagnostic = Value(diagnostic),
        treatmentProposal = Value(treatmentProposal),
        isActive = Value(isActive),
        patientCaseClosed = Value(patientCaseClosed);
  static Insertable<LocalPatientCaseData> custom({
    Expression<int>? id,
    Expression<DateTime>? creationDate,
    Expression<int>? patientId,
    Expression<int>? professionalId,
    Expression<String>? consultationReason,
    Expression<String>? diagnostic,
    Expression<String>? treatmentProposal,
    Expression<String>? caseNotes,
    Expression<bool>? isActive,
    Expression<bool>? patientCaseClosed,
    Expression<String>? treatmentPlanOutcome,
    Expression<int>? treatmentPlanId,
    Expression<int>? localTreatmentPlanResults,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (creationDate != null) 'creation_date': creationDate,
      if (patientId != null) 'patient_id': patientId,
      if (professionalId != null) 'professional_id': professionalId,
      if (consultationReason != null) 'consultation_reason': consultationReason,
      if (diagnostic != null) 'diagnostic': diagnostic,
      if (treatmentProposal != null) 'treatment_proposal': treatmentProposal,
      if (caseNotes != null) 'case_notes': caseNotes,
      if (isActive != null) 'is_active': isActive,
      if (patientCaseClosed != null) 'patient_case_closed': patientCaseClosed,
      if (treatmentPlanOutcome != null)
        'treatment_plan_outcome': treatmentPlanOutcome,
      if (treatmentPlanId != null) 'treatment_plan_id': treatmentPlanId,
      if (localTreatmentPlanResults != null)
        'local_treatment_plan_results': localTreatmentPlanResults,
    });
  }

  LocalPatientCaseCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? creationDate,
      Value<int>? patientId,
      Value<int>? professionalId,
      Value<String>? consultationReason,
      Value<String>? diagnostic,
      Value<String>? treatmentProposal,
      Value<String?>? caseNotes,
      Value<bool>? isActive,
      Value<bool>? patientCaseClosed,
      Value<String?>? treatmentPlanOutcome,
      Value<int?>? treatmentPlanId,
      Value<int?>? localTreatmentPlanResults}) {
    return LocalPatientCaseCompanion(
      id: id ?? this.id,
      creationDate: creationDate ?? this.creationDate,
      patientId: patientId ?? this.patientId,
      professionalId: professionalId ?? this.professionalId,
      consultationReason: consultationReason ?? this.consultationReason,
      diagnostic: diagnostic ?? this.diagnostic,
      treatmentProposal: treatmentProposal ?? this.treatmentProposal,
      caseNotes: caseNotes ?? this.caseNotes,
      isActive: isActive ?? this.isActive,
      patientCaseClosed: patientCaseClosed ?? this.patientCaseClosed,
      treatmentPlanOutcome: treatmentPlanOutcome ?? this.treatmentPlanOutcome,
      treatmentPlanId: treatmentPlanId ?? this.treatmentPlanId,
      localTreatmentPlanResults:
          localTreatmentPlanResults ?? this.localTreatmentPlanResults,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (creationDate.present) {
      map['creation_date'] = Variable<DateTime>(creationDate.value);
    }
    if (patientId.present) {
      map['patient_id'] = Variable<int>(patientId.value);
    }
    if (professionalId.present) {
      map['professional_id'] = Variable<int>(professionalId.value);
    }
    if (consultationReason.present) {
      map['consultation_reason'] = Variable<String>(consultationReason.value);
    }
    if (diagnostic.present) {
      map['diagnostic'] = Variable<String>(diagnostic.value);
    }
    if (treatmentProposal.present) {
      map['treatment_proposal'] = Variable<String>(treatmentProposal.value);
    }
    if (caseNotes.present) {
      map['case_notes'] = Variable<String>(caseNotes.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (patientCaseClosed.present) {
      map['patient_case_closed'] = Variable<bool>(patientCaseClosed.value);
    }
    if (treatmentPlanOutcome.present) {
      map['treatment_plan_outcome'] =
          Variable<String>(treatmentPlanOutcome.value);
    }
    if (treatmentPlanId.present) {
      map['treatment_plan_id'] = Variable<int>(treatmentPlanId.value);
    }
    if (localTreatmentPlanResults.present) {
      map['local_treatment_plan_results'] =
          Variable<int>(localTreatmentPlanResults.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalPatientCaseCompanion(')
          ..write('id: $id, ')
          ..write('creationDate: $creationDate, ')
          ..write('patientId: $patientId, ')
          ..write('professionalId: $professionalId, ')
          ..write('consultationReason: $consultationReason, ')
          ..write('diagnostic: $diagnostic, ')
          ..write('treatmentProposal: $treatmentProposal, ')
          ..write('caseNotes: $caseNotes, ')
          ..write('isActive: $isActive, ')
          ..write('patientCaseClosed: $patientCaseClosed, ')
          ..write('treatmentPlanOutcome: $treatmentPlanOutcome, ')
          ..write('treatmentPlanId: $treatmentPlanId, ')
          ..write('localTreatmentPlanResults: $localTreatmentPlanResults')
          ..write(')'))
        .toString();
  }
}

class $LocalSessionsTable extends LocalSessions
    with TableInfo<$LocalSessionsTable, LocalSession> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalSessionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
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
      'session_notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _sessionPerformanceMeta =
      const VerificationMeta('sessionPerformance');
  @override
  late final GeneratedColumn<String> sessionPerformance =
      GeneratedColumn<String>('session_performance', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sessionPerformanceExplanationMeta =
      const VerificationMeta('sessionPerformanceExplanation');
  @override
  late final GeneratedColumn<String> sessionPerformanceExplanation =
      GeneratedColumn<String>(
          'session_performance_explanation', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _idNumberMeta =
      const VerificationMeta('idNumber');
  @override
  late final GeneratedColumn<int> idNumber = GeneratedColumn<int>(
      'id_number', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES local_patients (id)'));
  static const VerificationMeta _professionalIDMeta =
      const VerificationMeta('professionalID');
  @override
  late final GeneratedColumn<int> professionalID = GeneratedColumn<int>(
      'professional_i_d', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES local_professional (id)'));
  static const VerificationMeta _caseIdMeta = const VerificationMeta('caseId');
  @override
  late final GeneratedColumn<int> caseId = GeneratedColumn<int>(
      'case_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES local_patient_case (id)'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        sessionDate,
        sessionSummary,
        sessionObjectives,
        therapeuticArchievements,
        sessionNotes,
        sessionPerformance,
        sessionPerformanceExplanation,
        idNumber,
        professionalID,
        caseId
      ];
  @override
  String get aliasedName => _alias ?? 'local_sessions';
  @override
  String get actualTableName => 'local_sessions';
  @override
  VerificationContext validateIntegrity(Insertable<LocalSession> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
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
    }
    if (data.containsKey('session_performance')) {
      context.handle(
          _sessionPerformanceMeta,
          sessionPerformance.isAcceptableOrUnknown(
              data['session_performance']!, _sessionPerformanceMeta));
    } else if (isInserting) {
      context.missing(_sessionPerformanceMeta);
    }
    if (data.containsKey('session_performance_explanation')) {
      context.handle(
          _sessionPerformanceExplanationMeta,
          sessionPerformanceExplanation.isAcceptableOrUnknown(
              data['session_performance_explanation']!,
              _sessionPerformanceExplanationMeta));
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
    if (data.containsKey('case_id')) {
      context.handle(_caseIdMeta,
          caseId.isAcceptableOrUnknown(data['case_id']!, _caseIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LocalSession map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalSession(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
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
          .read(DriftSqlType.string, data['${effectivePrefix}session_notes']),
      sessionPerformance: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}session_performance'])!,
      sessionPerformanceExplanation: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}session_performance_explanation']),
      idNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_number'])!,
      professionalID: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}professional_i_d'])!,
      caseId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}case_id']),
    );
  }

  @override
  $LocalSessionsTable createAlias(String alias) {
    return $LocalSessionsTable(attachedDatabase, alias);
  }
}

class LocalSession extends DataClass implements Insertable<LocalSession> {
  final int id;
  final DateTime sessionDate;
  final String sessionSummary;
  final String sessionObjectives;
  final String therapeuticArchievements;
  final String? sessionNotes;
  final String sessionPerformance;
  final String? sessionPerformanceExplanation;
  final int idNumber;
  final int professionalID;
  final int? caseId;
  const LocalSession(
      {required this.id,
      required this.sessionDate,
      required this.sessionSummary,
      required this.sessionObjectives,
      required this.therapeuticArchievements,
      this.sessionNotes,
      required this.sessionPerformance,
      this.sessionPerformanceExplanation,
      required this.idNumber,
      required this.professionalID,
      this.caseId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['session_date'] = Variable<DateTime>(sessionDate);
    map['session_summary'] = Variable<String>(sessionSummary);
    map['session_objectives'] = Variable<String>(sessionObjectives);
    map['therapeutic_archievements'] =
        Variable<String>(therapeuticArchievements);
    if (!nullToAbsent || sessionNotes != null) {
      map['session_notes'] = Variable<String>(sessionNotes);
    }
    map['session_performance'] = Variable<String>(sessionPerformance);
    if (!nullToAbsent || sessionPerformanceExplanation != null) {
      map['session_performance_explanation'] =
          Variable<String>(sessionPerformanceExplanation);
    }
    map['id_number'] = Variable<int>(idNumber);
    map['professional_i_d'] = Variable<int>(professionalID);
    if (!nullToAbsent || caseId != null) {
      map['case_id'] = Variable<int>(caseId);
    }
    return map;
  }

  LocalSessionsCompanion toCompanion(bool nullToAbsent) {
    return LocalSessionsCompanion(
      id: Value(id),
      sessionDate: Value(sessionDate),
      sessionSummary: Value(sessionSummary),
      sessionObjectives: Value(sessionObjectives),
      therapeuticArchievements: Value(therapeuticArchievements),
      sessionNotes: sessionNotes == null && nullToAbsent
          ? const Value.absent()
          : Value(sessionNotes),
      sessionPerformance: Value(sessionPerformance),
      sessionPerformanceExplanation:
          sessionPerformanceExplanation == null && nullToAbsent
              ? const Value.absent()
              : Value(sessionPerformanceExplanation),
      idNumber: Value(idNumber),
      professionalID: Value(professionalID),
      caseId:
          caseId == null && nullToAbsent ? const Value.absent() : Value(caseId),
    );
  }

  factory LocalSession.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalSession(
      id: serializer.fromJson<int>(json['id']),
      sessionDate: serializer.fromJson<DateTime>(json['sessionDate']),
      sessionSummary: serializer.fromJson<String>(json['sessionSummary']),
      sessionObjectives: serializer.fromJson<String>(json['sessionObjectives']),
      therapeuticArchievements:
          serializer.fromJson<String>(json['therapeuticArchievements']),
      sessionNotes: serializer.fromJson<String?>(json['sessionNotes']),
      sessionPerformance:
          serializer.fromJson<String>(json['sessionPerformance']),
      sessionPerformanceExplanation:
          serializer.fromJson<String?>(json['sessionPerformanceExplanation']),
      idNumber: serializer.fromJson<int>(json['idNumber']),
      professionalID: serializer.fromJson<int>(json['professionalID']),
      caseId: serializer.fromJson<int?>(json['caseId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'sessionDate': serializer.toJson<DateTime>(sessionDate),
      'sessionSummary': serializer.toJson<String>(sessionSummary),
      'sessionObjectives': serializer.toJson<String>(sessionObjectives),
      'therapeuticArchievements':
          serializer.toJson<String>(therapeuticArchievements),
      'sessionNotes': serializer.toJson<String?>(sessionNotes),
      'sessionPerformance': serializer.toJson<String>(sessionPerformance),
      'sessionPerformanceExplanation':
          serializer.toJson<String?>(sessionPerformanceExplanation),
      'idNumber': serializer.toJson<int>(idNumber),
      'professionalID': serializer.toJson<int>(professionalID),
      'caseId': serializer.toJson<int?>(caseId),
    };
  }

  LocalSession copyWith(
          {int? id,
          DateTime? sessionDate,
          String? sessionSummary,
          String? sessionObjectives,
          String? therapeuticArchievements,
          Value<String?> sessionNotes = const Value.absent(),
          String? sessionPerformance,
          Value<String?> sessionPerformanceExplanation = const Value.absent(),
          int? idNumber,
          int? professionalID,
          Value<int?> caseId = const Value.absent()}) =>
      LocalSession(
        id: id ?? this.id,
        sessionDate: sessionDate ?? this.sessionDate,
        sessionSummary: sessionSummary ?? this.sessionSummary,
        sessionObjectives: sessionObjectives ?? this.sessionObjectives,
        therapeuticArchievements:
            therapeuticArchievements ?? this.therapeuticArchievements,
        sessionNotes:
            sessionNotes.present ? sessionNotes.value : this.sessionNotes,
        sessionPerformance: sessionPerformance ?? this.sessionPerformance,
        sessionPerformanceExplanation: sessionPerformanceExplanation.present
            ? sessionPerformanceExplanation.value
            : this.sessionPerformanceExplanation,
        idNumber: idNumber ?? this.idNumber,
        professionalID: professionalID ?? this.professionalID,
        caseId: caseId.present ? caseId.value : this.caseId,
      );
  @override
  String toString() {
    return (StringBuffer('LocalSession(')
          ..write('id: $id, ')
          ..write('sessionDate: $sessionDate, ')
          ..write('sessionSummary: $sessionSummary, ')
          ..write('sessionObjectives: $sessionObjectives, ')
          ..write('therapeuticArchievements: $therapeuticArchievements, ')
          ..write('sessionNotes: $sessionNotes, ')
          ..write('sessionPerformance: $sessionPerformance, ')
          ..write(
              'sessionPerformanceExplanation: $sessionPerformanceExplanation, ')
          ..write('idNumber: $idNumber, ')
          ..write('professionalID: $professionalID, ')
          ..write('caseId: $caseId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      sessionDate,
      sessionSummary,
      sessionObjectives,
      therapeuticArchievements,
      sessionNotes,
      sessionPerformance,
      sessionPerformanceExplanation,
      idNumber,
      professionalID,
      caseId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalSession &&
          other.id == this.id &&
          other.sessionDate == this.sessionDate &&
          other.sessionSummary == this.sessionSummary &&
          other.sessionObjectives == this.sessionObjectives &&
          other.therapeuticArchievements == this.therapeuticArchievements &&
          other.sessionNotes == this.sessionNotes &&
          other.sessionPerformance == this.sessionPerformance &&
          other.sessionPerformanceExplanation ==
              this.sessionPerformanceExplanation &&
          other.idNumber == this.idNumber &&
          other.professionalID == this.professionalID &&
          other.caseId == this.caseId);
}

class LocalSessionsCompanion extends UpdateCompanion<LocalSession> {
  final Value<int> id;
  final Value<DateTime> sessionDate;
  final Value<String> sessionSummary;
  final Value<String> sessionObjectives;
  final Value<String> therapeuticArchievements;
  final Value<String?> sessionNotes;
  final Value<String> sessionPerformance;
  final Value<String?> sessionPerformanceExplanation;
  final Value<int> idNumber;
  final Value<int> professionalID;
  final Value<int?> caseId;
  const LocalSessionsCompanion({
    this.id = const Value.absent(),
    this.sessionDate = const Value.absent(),
    this.sessionSummary = const Value.absent(),
    this.sessionObjectives = const Value.absent(),
    this.therapeuticArchievements = const Value.absent(),
    this.sessionNotes = const Value.absent(),
    this.sessionPerformance = const Value.absent(),
    this.sessionPerformanceExplanation = const Value.absent(),
    this.idNumber = const Value.absent(),
    this.professionalID = const Value.absent(),
    this.caseId = const Value.absent(),
  });
  LocalSessionsCompanion.insert({
    this.id = const Value.absent(),
    required DateTime sessionDate,
    required String sessionSummary,
    required String sessionObjectives,
    required String therapeuticArchievements,
    this.sessionNotes = const Value.absent(),
    required String sessionPerformance,
    this.sessionPerformanceExplanation = const Value.absent(),
    required int idNumber,
    required int professionalID,
    this.caseId = const Value.absent(),
  })  : sessionDate = Value(sessionDate),
        sessionSummary = Value(sessionSummary),
        sessionObjectives = Value(sessionObjectives),
        therapeuticArchievements = Value(therapeuticArchievements),
        sessionPerformance = Value(sessionPerformance),
        idNumber = Value(idNumber),
        professionalID = Value(professionalID);
  static Insertable<LocalSession> custom({
    Expression<int>? id,
    Expression<DateTime>? sessionDate,
    Expression<String>? sessionSummary,
    Expression<String>? sessionObjectives,
    Expression<String>? therapeuticArchievements,
    Expression<String>? sessionNotes,
    Expression<String>? sessionPerformance,
    Expression<String>? sessionPerformanceExplanation,
    Expression<int>? idNumber,
    Expression<int>? professionalID,
    Expression<int>? caseId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sessionDate != null) 'session_date': sessionDate,
      if (sessionSummary != null) 'session_summary': sessionSummary,
      if (sessionObjectives != null) 'session_objectives': sessionObjectives,
      if (therapeuticArchievements != null)
        'therapeutic_archievements': therapeuticArchievements,
      if (sessionNotes != null) 'session_notes': sessionNotes,
      if (sessionPerformance != null) 'session_performance': sessionPerformance,
      if (sessionPerformanceExplanation != null)
        'session_performance_explanation': sessionPerformanceExplanation,
      if (idNumber != null) 'id_number': idNumber,
      if (professionalID != null) 'professional_i_d': professionalID,
      if (caseId != null) 'case_id': caseId,
    });
  }

  LocalSessionsCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? sessionDate,
      Value<String>? sessionSummary,
      Value<String>? sessionObjectives,
      Value<String>? therapeuticArchievements,
      Value<String?>? sessionNotes,
      Value<String>? sessionPerformance,
      Value<String?>? sessionPerformanceExplanation,
      Value<int>? idNumber,
      Value<int>? professionalID,
      Value<int?>? caseId}) {
    return LocalSessionsCompanion(
      id: id ?? this.id,
      sessionDate: sessionDate ?? this.sessionDate,
      sessionSummary: sessionSummary ?? this.sessionSummary,
      sessionObjectives: sessionObjectives ?? this.sessionObjectives,
      therapeuticArchievements:
          therapeuticArchievements ?? this.therapeuticArchievements,
      sessionNotes: sessionNotes ?? this.sessionNotes,
      sessionPerformance: sessionPerformance ?? this.sessionPerformance,
      sessionPerformanceExplanation:
          sessionPerformanceExplanation ?? this.sessionPerformanceExplanation,
      idNumber: idNumber ?? this.idNumber,
      professionalID: professionalID ?? this.professionalID,
      caseId: caseId ?? this.caseId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
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
    if (sessionPerformanceExplanation.present) {
      map['session_performance_explanation'] =
          Variable<String>(sessionPerformanceExplanation.value);
    }
    if (idNumber.present) {
      map['id_number'] = Variable<int>(idNumber.value);
    }
    if (professionalID.present) {
      map['professional_i_d'] = Variable<int>(professionalID.value);
    }
    if (caseId.present) {
      map['case_id'] = Variable<int>(caseId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalSessionsCompanion(')
          ..write('id: $id, ')
          ..write('sessionDate: $sessionDate, ')
          ..write('sessionSummary: $sessionSummary, ')
          ..write('sessionObjectives: $sessionObjectives, ')
          ..write('therapeuticArchievements: $therapeuticArchievements, ')
          ..write('sessionNotes: $sessionNotes, ')
          ..write('sessionPerformance: $sessionPerformance, ')
          ..write(
              'sessionPerformanceExplanation: $sessionPerformanceExplanation, ')
          ..write('idNumber: $idNumber, ')
          ..write('professionalID: $professionalID, ')
          ..write('caseId: $caseId')
          ..write(')'))
        .toString();
  }
}

class $LocalTestsTable extends LocalTests
    with TableInfo<$LocalTestsTable, LocalTest> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalTestsTable(this.attachedDatabase, [this._alias]);
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
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES local_patients (id)'));
  static const VerificationMeta _professionalIDMeta =
      const VerificationMeta('professionalID');
  @override
  late final GeneratedColumn<int> professionalID = GeneratedColumn<int>(
      'professional_i_d', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES local_professional (id)'));
  static const VerificationMeta _sessionIDMeta =
      const VerificationMeta('sessionID');
  @override
  late final GeneratedColumn<int> sessionID = GeneratedColumn<int>(
      'session_i_d', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES local_sessions (id)'));
  static const VerificationMeta _testReasonMeta =
      const VerificationMeta('testReason');
  @override
  late final GeneratedColumn<String> testReason = GeneratedColumn<String>(
      'test_reason', aliasedName, false,
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
        testReason,
        category,
        testData
      ];
  @override
  String get aliasedName => _alias ?? 'local_tests';
  @override
  String get actualTableName => 'local_tests';
  @override
  VerificationContext validateIntegrity(Insertable<LocalTest> instance,
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
    if (data.containsKey('test_reason')) {
      context.handle(
          _testReasonMeta,
          testReason.isAcceptableOrUnknown(
              data['test_reason']!, _testReasonMeta));
    } else if (isInserting) {
      context.missing(_testReasonMeta);
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
  LocalTest map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalTest(
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
      testReason: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}test_reason'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
      testData: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}test_data'])!,
    );
  }

  @override
  $LocalTestsTable createAlias(String alias) {
    return $LocalTestsTable(attachedDatabase, alias);
  }
}

class LocalTest extends DataClass implements Insertable<LocalTest> {
  final int id;
  final DateTime testDate;
  final int patientID;
  final int professionalID;
  final int sessionID;
  final String testReason;
  final String category;
  final String testData;
  const LocalTest(
      {required this.id,
      required this.testDate,
      required this.patientID,
      required this.professionalID,
      required this.sessionID,
      required this.testReason,
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
    map['test_reason'] = Variable<String>(testReason);
    map['category'] = Variable<String>(category);
    map['test_data'] = Variable<String>(testData);
    return map;
  }

  LocalTestsCompanion toCompanion(bool nullToAbsent) {
    return LocalTestsCompanion(
      id: Value(id),
      testDate: Value(testDate),
      patientID: Value(patientID),
      professionalID: Value(professionalID),
      sessionID: Value(sessionID),
      testReason: Value(testReason),
      category: Value(category),
      testData: Value(testData),
    );
  }

  factory LocalTest.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalTest(
      id: serializer.fromJson<int>(json['id']),
      testDate: serializer.fromJson<DateTime>(json['testDate']),
      patientID: serializer.fromJson<int>(json['patientID']),
      professionalID: serializer.fromJson<int>(json['professionalID']),
      sessionID: serializer.fromJson<int>(json['sessionID']),
      testReason: serializer.fromJson<String>(json['testReason']),
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
      'testReason': serializer.toJson<String>(testReason),
      'category': serializer.toJson<String>(category),
      'testData': serializer.toJson<String>(testData),
    };
  }

  LocalTest copyWith(
          {int? id,
          DateTime? testDate,
          int? patientID,
          int? professionalID,
          int? sessionID,
          String? testReason,
          String? category,
          String? testData}) =>
      LocalTest(
        id: id ?? this.id,
        testDate: testDate ?? this.testDate,
        patientID: patientID ?? this.patientID,
        professionalID: professionalID ?? this.professionalID,
        sessionID: sessionID ?? this.sessionID,
        testReason: testReason ?? this.testReason,
        category: category ?? this.category,
        testData: testData ?? this.testData,
      );
  @override
  String toString() {
    return (StringBuffer('LocalTest(')
          ..write('id: $id, ')
          ..write('testDate: $testDate, ')
          ..write('patientID: $patientID, ')
          ..write('professionalID: $professionalID, ')
          ..write('sessionID: $sessionID, ')
          ..write('testReason: $testReason, ')
          ..write('category: $category, ')
          ..write('testData: $testData')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, testDate, patientID, professionalID,
      sessionID, testReason, category, testData);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalTest &&
          other.id == this.id &&
          other.testDate == this.testDate &&
          other.patientID == this.patientID &&
          other.professionalID == this.professionalID &&
          other.sessionID == this.sessionID &&
          other.testReason == this.testReason &&
          other.category == this.category &&
          other.testData == this.testData);
}

class LocalTestsCompanion extends UpdateCompanion<LocalTest> {
  final Value<int> id;
  final Value<DateTime> testDate;
  final Value<int> patientID;
  final Value<int> professionalID;
  final Value<int> sessionID;
  final Value<String> testReason;
  final Value<String> category;
  final Value<String> testData;
  const LocalTestsCompanion({
    this.id = const Value.absent(),
    this.testDate = const Value.absent(),
    this.patientID = const Value.absent(),
    this.professionalID = const Value.absent(),
    this.sessionID = const Value.absent(),
    this.testReason = const Value.absent(),
    this.category = const Value.absent(),
    this.testData = const Value.absent(),
  });
  LocalTestsCompanion.insert({
    this.id = const Value.absent(),
    required DateTime testDate,
    required int patientID,
    required int professionalID,
    required int sessionID,
    required String testReason,
    required String category,
    required String testData,
  })  : testDate = Value(testDate),
        patientID = Value(patientID),
        professionalID = Value(professionalID),
        sessionID = Value(sessionID),
        testReason = Value(testReason),
        category = Value(category),
        testData = Value(testData);
  static Insertable<LocalTest> custom({
    Expression<int>? id,
    Expression<DateTime>? testDate,
    Expression<int>? patientID,
    Expression<int>? professionalID,
    Expression<int>? sessionID,
    Expression<String>? testReason,
    Expression<String>? category,
    Expression<String>? testData,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (testDate != null) 'test_date': testDate,
      if (patientID != null) 'patient_i_d': patientID,
      if (professionalID != null) 'professional_i_d': professionalID,
      if (sessionID != null) 'session_i_d': sessionID,
      if (testReason != null) 'test_reason': testReason,
      if (category != null) 'category': category,
      if (testData != null) 'test_data': testData,
    });
  }

  LocalTestsCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? testDate,
      Value<int>? patientID,
      Value<int>? professionalID,
      Value<int>? sessionID,
      Value<String>? testReason,
      Value<String>? category,
      Value<String>? testData}) {
    return LocalTestsCompanion(
      id: id ?? this.id,
      testDate: testDate ?? this.testDate,
      patientID: patientID ?? this.patientID,
      professionalID: professionalID ?? this.professionalID,
      sessionID: sessionID ?? this.sessionID,
      testReason: testReason ?? this.testReason,
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
    if (testReason.present) {
      map['test_reason'] = Variable<String>(testReason.value);
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
    return (StringBuffer('LocalTestsCompanion(')
          ..write('id: $id, ')
          ..write('testDate: $testDate, ')
          ..write('patientID: $patientID, ')
          ..write('professionalID: $professionalID, ')
          ..write('sessionID: $sessionID, ')
          ..write('testReason: $testReason, ')
          ..write('category: $category, ')
          ..write('testData: $testData')
          ..write(')'))
        .toString();
  }
}

class $LocalTodosTable extends LocalTodos
    with TableInfo<$LocalTodosTable, LocalTodo> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalTodosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _creationDateMeta =
      const VerificationMeta('creationDate');
  @override
  late final GeneratedColumn<DateTime> creationDate = GeneratedColumn<DateTime>(
      'creation_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _todoMeta = const VerificationMeta('todo');
  @override
  late final GeneratedColumn<String> todo = GeneratedColumn<String>(
      'todo', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _itemColorMeta =
      const VerificationMeta('itemColor');
  @override
  late final GeneratedColumn<int> itemColor = GeneratedColumn<int>(
      'item_color', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _isCompleteMeta =
      const VerificationMeta('isComplete');
  @override
  late final GeneratedColumn<bool> isComplete =
      GeneratedColumn<bool>('is_complete', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_complete" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  @override
  List<GeneratedColumn> get $columns =>
      [id, creationDate, todo, description, category, itemColor, isComplete];
  @override
  String get aliasedName => _alias ?? 'local_todos';
  @override
  String get actualTableName => 'local_todos';
  @override
  VerificationContext validateIntegrity(Insertable<LocalTodo> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('creation_date')) {
      context.handle(
          _creationDateMeta,
          creationDate.isAcceptableOrUnknown(
              data['creation_date']!, _creationDateMeta));
    } else if (isInserting) {
      context.missing(_creationDateMeta);
    }
    if (data.containsKey('todo')) {
      context.handle(
          _todoMeta, todo.isAcceptableOrUnknown(data['todo']!, _todoMeta));
    } else if (isInserting) {
      context.missing(_todoMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    }
    if (data.containsKey('item_color')) {
      context.handle(_itemColorMeta,
          itemColor.isAcceptableOrUnknown(data['item_color']!, _itemColorMeta));
    } else if (isInserting) {
      context.missing(_itemColorMeta);
    }
    if (data.containsKey('is_complete')) {
      context.handle(
          _isCompleteMeta,
          isComplete.isAcceptableOrUnknown(
              data['is_complete']!, _isCompleteMeta));
    } else if (isInserting) {
      context.missing(_isCompleteMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LocalTodo map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalTodo(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      creationDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}creation_date'])!,
      todo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}todo'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category']),
      itemColor: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}item_color'])!,
      isComplete: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_complete'])!,
    );
  }

  @override
  $LocalTodosTable createAlias(String alias) {
    return $LocalTodosTable(attachedDatabase, alias);
  }
}

class LocalTodo extends DataClass implements Insertable<LocalTodo> {
  final int id;
  final DateTime creationDate;
  final String todo;
  final String? description;
  final String? category;
  final int itemColor;
  final bool isComplete;
  const LocalTodo(
      {required this.id,
      required this.creationDate,
      required this.todo,
      this.description,
      this.category,
      required this.itemColor,
      required this.isComplete});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['creation_date'] = Variable<DateTime>(creationDate);
    map['todo'] = Variable<String>(todo);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<String>(category);
    }
    map['item_color'] = Variable<int>(itemColor);
    map['is_complete'] = Variable<bool>(isComplete);
    return map;
  }

  LocalTodosCompanion toCompanion(bool nullToAbsent) {
    return LocalTodosCompanion(
      id: Value(id),
      creationDate: Value(creationDate),
      todo: Value(todo),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      itemColor: Value(itemColor),
      isComplete: Value(isComplete),
    );
  }

  factory LocalTodo.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalTodo(
      id: serializer.fromJson<int>(json['id']),
      creationDate: serializer.fromJson<DateTime>(json['creationDate']),
      todo: serializer.fromJson<String>(json['todo']),
      description: serializer.fromJson<String?>(json['description']),
      category: serializer.fromJson<String?>(json['category']),
      itemColor: serializer.fromJson<int>(json['itemColor']),
      isComplete: serializer.fromJson<bool>(json['isComplete']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'creationDate': serializer.toJson<DateTime>(creationDate),
      'todo': serializer.toJson<String>(todo),
      'description': serializer.toJson<String?>(description),
      'category': serializer.toJson<String?>(category),
      'itemColor': serializer.toJson<int>(itemColor),
      'isComplete': serializer.toJson<bool>(isComplete),
    };
  }

  LocalTodo copyWith(
          {int? id,
          DateTime? creationDate,
          String? todo,
          Value<String?> description = const Value.absent(),
          Value<String?> category = const Value.absent(),
          int? itemColor,
          bool? isComplete}) =>
      LocalTodo(
        id: id ?? this.id,
        creationDate: creationDate ?? this.creationDate,
        todo: todo ?? this.todo,
        description: description.present ? description.value : this.description,
        category: category.present ? category.value : this.category,
        itemColor: itemColor ?? this.itemColor,
        isComplete: isComplete ?? this.isComplete,
      );
  @override
  String toString() {
    return (StringBuffer('LocalTodo(')
          ..write('id: $id, ')
          ..write('creationDate: $creationDate, ')
          ..write('todo: $todo, ')
          ..write('description: $description, ')
          ..write('category: $category, ')
          ..write('itemColor: $itemColor, ')
          ..write('isComplete: $isComplete')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, creationDate, todo, description, category, itemColor, isComplete);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalTodo &&
          other.id == this.id &&
          other.creationDate == this.creationDate &&
          other.todo == this.todo &&
          other.description == this.description &&
          other.category == this.category &&
          other.itemColor == this.itemColor &&
          other.isComplete == this.isComplete);
}

class LocalTodosCompanion extends UpdateCompanion<LocalTodo> {
  final Value<int> id;
  final Value<DateTime> creationDate;
  final Value<String> todo;
  final Value<String?> description;
  final Value<String?> category;
  final Value<int> itemColor;
  final Value<bool> isComplete;
  const LocalTodosCompanion({
    this.id = const Value.absent(),
    this.creationDate = const Value.absent(),
    this.todo = const Value.absent(),
    this.description = const Value.absent(),
    this.category = const Value.absent(),
    this.itemColor = const Value.absent(),
    this.isComplete = const Value.absent(),
  });
  LocalTodosCompanion.insert({
    this.id = const Value.absent(),
    required DateTime creationDate,
    required String todo,
    this.description = const Value.absent(),
    this.category = const Value.absent(),
    required int itemColor,
    required bool isComplete,
  })  : creationDate = Value(creationDate),
        todo = Value(todo),
        itemColor = Value(itemColor),
        isComplete = Value(isComplete);
  static Insertable<LocalTodo> custom({
    Expression<int>? id,
    Expression<DateTime>? creationDate,
    Expression<String>? todo,
    Expression<String>? description,
    Expression<String>? category,
    Expression<int>? itemColor,
    Expression<bool>? isComplete,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (creationDate != null) 'creation_date': creationDate,
      if (todo != null) 'todo': todo,
      if (description != null) 'description': description,
      if (category != null) 'category': category,
      if (itemColor != null) 'item_color': itemColor,
      if (isComplete != null) 'is_complete': isComplete,
    });
  }

  LocalTodosCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? creationDate,
      Value<String>? todo,
      Value<String?>? description,
      Value<String?>? category,
      Value<int>? itemColor,
      Value<bool>? isComplete}) {
    return LocalTodosCompanion(
      id: id ?? this.id,
      creationDate: creationDate ?? this.creationDate,
      todo: todo ?? this.todo,
      description: description ?? this.description,
      category: category ?? this.category,
      itemColor: itemColor ?? this.itemColor,
      isComplete: isComplete ?? this.isComplete,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (creationDate.present) {
      map['creation_date'] = Variable<DateTime>(creationDate.value);
    }
    if (todo.present) {
      map['todo'] = Variable<String>(todo.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (itemColor.present) {
      map['item_color'] = Variable<int>(itemColor.value);
    }
    if (isComplete.present) {
      map['is_complete'] = Variable<bool>(isComplete.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalTodosCompanion(')
          ..write('id: $id, ')
          ..write('creationDate: $creationDate, ')
          ..write('todo: $todo, ')
          ..write('description: $description, ')
          ..write('category: $category, ')
          ..write('itemColor: $itemColor, ')
          ..write('isComplete: $isComplete')
          ..write(')'))
        .toString();
  }
}

class $LocalAppointmentsTable extends LocalAppointments
    with TableInfo<$LocalAppointmentsTable, LocalAppointment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalAppointmentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _professionalIDMeta =
      const VerificationMeta('professionalID');
  @override
  late final GeneratedColumn<int> professionalID = GeneratedColumn<int>(
      'professional_i_d', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES local_professional (id)'));
  static const VerificationMeta _patientIDMeta =
      const VerificationMeta('patientID');
  @override
  late final GeneratedColumn<int> patientID = GeneratedColumn<int>(
      'patient_i_d', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES local_patients (id)'));
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sessionTypeMeta =
      const VerificationMeta('sessionType');
  @override
  late final GeneratedColumn<String> sessionType = GeneratedColumn<String>(
      'session_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, date, professionalID, patientID, description, status, sessionType];
  @override
  String get aliasedName => _alias ?? 'local_appointments';
  @override
  String get actualTableName => 'local_appointments';
  @override
  VerificationContext validateIntegrity(Insertable<LocalAppointment> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('professional_i_d')) {
      context.handle(
          _professionalIDMeta,
          professionalID.isAcceptableOrUnknown(
              data['professional_i_d']!, _professionalIDMeta));
    } else if (isInserting) {
      context.missing(_professionalIDMeta);
    }
    if (data.containsKey('patient_i_d')) {
      context.handle(
          _patientIDMeta,
          patientID.isAcceptableOrUnknown(
              data['patient_i_d']!, _patientIDMeta));
    } else if (isInserting) {
      context.missing(_patientIDMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('session_type')) {
      context.handle(
          _sessionTypeMeta,
          sessionType.isAcceptableOrUnknown(
              data['session_type']!, _sessionTypeMeta));
    } else if (isInserting) {
      context.missing(_sessionTypeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LocalAppointment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalAppointment(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      professionalID: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}professional_i_d'])!,
      patientID: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}patient_i_d'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      sessionType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}session_type'])!,
    );
  }

  @override
  $LocalAppointmentsTable createAlias(String alias) {
    return $LocalAppointmentsTable(attachedDatabase, alias);
  }
}

class LocalAppointment extends DataClass
    implements Insertable<LocalAppointment> {
  final int id;
  final DateTime date;
  final int professionalID;
  final int patientID;
  final String? description;
  final String status;
  final String sessionType;
  const LocalAppointment(
      {required this.id,
      required this.date,
      required this.professionalID,
      required this.patientID,
      this.description,
      required this.status,
      required this.sessionType});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['date'] = Variable<DateTime>(date);
    map['professional_i_d'] = Variable<int>(professionalID);
    map['patient_i_d'] = Variable<int>(patientID);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['status'] = Variable<String>(status);
    map['session_type'] = Variable<String>(sessionType);
    return map;
  }

  LocalAppointmentsCompanion toCompanion(bool nullToAbsent) {
    return LocalAppointmentsCompanion(
      id: Value(id),
      date: Value(date),
      professionalID: Value(professionalID),
      patientID: Value(patientID),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      status: Value(status),
      sessionType: Value(sessionType),
    );
  }

  factory LocalAppointment.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalAppointment(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      professionalID: serializer.fromJson<int>(json['professionalID']),
      patientID: serializer.fromJson<int>(json['patientID']),
      description: serializer.fromJson<String?>(json['description']),
      status: serializer.fromJson<String>(json['status']),
      sessionType: serializer.fromJson<String>(json['sessionType']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime>(date),
      'professionalID': serializer.toJson<int>(professionalID),
      'patientID': serializer.toJson<int>(patientID),
      'description': serializer.toJson<String?>(description),
      'status': serializer.toJson<String>(status),
      'sessionType': serializer.toJson<String>(sessionType),
    };
  }

  LocalAppointment copyWith(
          {int? id,
          DateTime? date,
          int? professionalID,
          int? patientID,
          Value<String?> description = const Value.absent(),
          String? status,
          String? sessionType}) =>
      LocalAppointment(
        id: id ?? this.id,
        date: date ?? this.date,
        professionalID: professionalID ?? this.professionalID,
        patientID: patientID ?? this.patientID,
        description: description.present ? description.value : this.description,
        status: status ?? this.status,
        sessionType: sessionType ?? this.sessionType,
      );
  @override
  String toString() {
    return (StringBuffer('LocalAppointment(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('professionalID: $professionalID, ')
          ..write('patientID: $patientID, ')
          ..write('description: $description, ')
          ..write('status: $status, ')
          ..write('sessionType: $sessionType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, date, professionalID, patientID, description, status, sessionType);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalAppointment &&
          other.id == this.id &&
          other.date == this.date &&
          other.professionalID == this.professionalID &&
          other.patientID == this.patientID &&
          other.description == this.description &&
          other.status == this.status &&
          other.sessionType == this.sessionType);
}

class LocalAppointmentsCompanion extends UpdateCompanion<LocalAppointment> {
  final Value<int> id;
  final Value<DateTime> date;
  final Value<int> professionalID;
  final Value<int> patientID;
  final Value<String?> description;
  final Value<String> status;
  final Value<String> sessionType;
  const LocalAppointmentsCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.professionalID = const Value.absent(),
    this.patientID = const Value.absent(),
    this.description = const Value.absent(),
    this.status = const Value.absent(),
    this.sessionType = const Value.absent(),
  });
  LocalAppointmentsCompanion.insert({
    this.id = const Value.absent(),
    required DateTime date,
    required int professionalID,
    required int patientID,
    this.description = const Value.absent(),
    required String status,
    required String sessionType,
  })  : date = Value(date),
        professionalID = Value(professionalID),
        patientID = Value(patientID),
        status = Value(status),
        sessionType = Value(sessionType);
  static Insertable<LocalAppointment> custom({
    Expression<int>? id,
    Expression<DateTime>? date,
    Expression<int>? professionalID,
    Expression<int>? patientID,
    Expression<String>? description,
    Expression<String>? status,
    Expression<String>? sessionType,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (professionalID != null) 'professional_i_d': professionalID,
      if (patientID != null) 'patient_i_d': patientID,
      if (description != null) 'description': description,
      if (status != null) 'status': status,
      if (sessionType != null) 'session_type': sessionType,
    });
  }

  LocalAppointmentsCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? date,
      Value<int>? professionalID,
      Value<int>? patientID,
      Value<String?>? description,
      Value<String>? status,
      Value<String>? sessionType}) {
    return LocalAppointmentsCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      professionalID: professionalID ?? this.professionalID,
      patientID: patientID ?? this.patientID,
      description: description ?? this.description,
      status: status ?? this.status,
      sessionType: sessionType ?? this.sessionType,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (professionalID.present) {
      map['professional_i_d'] = Variable<int>(professionalID.value);
    }
    if (patientID.present) {
      map['patient_i_d'] = Variable<int>(patientID.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (sessionType.present) {
      map['session_type'] = Variable<String>(sessionType.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalAppointmentsCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('professionalID: $professionalID, ')
          ..write('patientID: $patientID, ')
          ..write('description: $description, ')
          ..write('status: $status, ')
          ..write('sessionType: $sessionType')
          ..write(')'))
        .toString();
  }
}

class $SettingsTable extends Settings with TableInfo<$SettingsTable, Setting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _isDarkModeEnabledMeta =
      const VerificationMeta('isDarkModeEnabled');
  @override
  late final GeneratedColumn<bool> isDarkModeEnabled =
      GeneratedColumn<bool>('is_dark_mode_enabled', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_dark_mode_enabled" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _isOfflineModeEnabledMeta =
      const VerificationMeta('isOfflineModeEnabled');
  @override
  late final GeneratedColumn<bool> isOfflineModeEnabled =
      GeneratedColumn<bool>('is_offline_mode_enabled', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_offline_mode_enabled" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _isConfiguredMeta =
      const VerificationMeta('isConfigured');
  @override
  late final GeneratedColumn<bool> isConfigured =
      GeneratedColumn<bool>('is_configured', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_configured" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  @override
  List<GeneratedColumn> get $columns =>
      [id, isDarkModeEnabled, isOfflineModeEnabled, isConfigured];
  @override
  String get aliasedName => _alias ?? 'settings';
  @override
  String get actualTableName => 'settings';
  @override
  VerificationContext validateIntegrity(Insertable<Setting> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('is_dark_mode_enabled')) {
      context.handle(
          _isDarkModeEnabledMeta,
          isDarkModeEnabled.isAcceptableOrUnknown(
              data['is_dark_mode_enabled']!, _isDarkModeEnabledMeta));
    } else if (isInserting) {
      context.missing(_isDarkModeEnabledMeta);
    }
    if (data.containsKey('is_offline_mode_enabled')) {
      context.handle(
          _isOfflineModeEnabledMeta,
          isOfflineModeEnabled.isAcceptableOrUnknown(
              data['is_offline_mode_enabled']!, _isOfflineModeEnabledMeta));
    } else if (isInserting) {
      context.missing(_isOfflineModeEnabledMeta);
    }
    if (data.containsKey('is_configured')) {
      context.handle(
          _isConfiguredMeta,
          isConfigured.isAcceptableOrUnknown(
              data['is_configured']!, _isConfiguredMeta));
    } else if (isInserting) {
      context.missing(_isConfiguredMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Setting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Setting(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      isDarkModeEnabled: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}is_dark_mode_enabled'])!,
      isOfflineModeEnabled: attachedDatabase.typeMapping.read(DriftSqlType.bool,
          data['${effectivePrefix}is_offline_mode_enabled'])!,
      isConfigured: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_configured'])!,
    );
  }

  @override
  $SettingsTable createAlias(String alias) {
    return $SettingsTable(attachedDatabase, alias);
  }
}

class Setting extends DataClass implements Insertable<Setting> {
  final int id;
  final bool isDarkModeEnabled;
  final bool isOfflineModeEnabled;
  final bool isConfigured;
  const Setting(
      {required this.id,
      required this.isDarkModeEnabled,
      required this.isOfflineModeEnabled,
      required this.isConfigured});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['is_dark_mode_enabled'] = Variable<bool>(isDarkModeEnabled);
    map['is_offline_mode_enabled'] = Variable<bool>(isOfflineModeEnabled);
    map['is_configured'] = Variable<bool>(isConfigured);
    return map;
  }

  SettingsCompanion toCompanion(bool nullToAbsent) {
    return SettingsCompanion(
      id: Value(id),
      isDarkModeEnabled: Value(isDarkModeEnabled),
      isOfflineModeEnabled: Value(isOfflineModeEnabled),
      isConfigured: Value(isConfigured),
    );
  }

  factory Setting.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Setting(
      id: serializer.fromJson<int>(json['id']),
      isDarkModeEnabled: serializer.fromJson<bool>(json['isDarkModeEnabled']),
      isOfflineModeEnabled:
          serializer.fromJson<bool>(json['isOfflineModeEnabled']),
      isConfigured: serializer.fromJson<bool>(json['isConfigured']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'isDarkModeEnabled': serializer.toJson<bool>(isDarkModeEnabled),
      'isOfflineModeEnabled': serializer.toJson<bool>(isOfflineModeEnabled),
      'isConfigured': serializer.toJson<bool>(isConfigured),
    };
  }

  Setting copyWith(
          {int? id,
          bool? isDarkModeEnabled,
          bool? isOfflineModeEnabled,
          bool? isConfigured}) =>
      Setting(
        id: id ?? this.id,
        isDarkModeEnabled: isDarkModeEnabled ?? this.isDarkModeEnabled,
        isOfflineModeEnabled: isOfflineModeEnabled ?? this.isOfflineModeEnabled,
        isConfigured: isConfigured ?? this.isConfigured,
      );
  @override
  String toString() {
    return (StringBuffer('Setting(')
          ..write('id: $id, ')
          ..write('isDarkModeEnabled: $isDarkModeEnabled, ')
          ..write('isOfflineModeEnabled: $isOfflineModeEnabled, ')
          ..write('isConfigured: $isConfigured')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, isDarkModeEnabled, isOfflineModeEnabled, isConfigured);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Setting &&
          other.id == this.id &&
          other.isDarkModeEnabled == this.isDarkModeEnabled &&
          other.isOfflineModeEnabled == this.isOfflineModeEnabled &&
          other.isConfigured == this.isConfigured);
}

class SettingsCompanion extends UpdateCompanion<Setting> {
  final Value<int> id;
  final Value<bool> isDarkModeEnabled;
  final Value<bool> isOfflineModeEnabled;
  final Value<bool> isConfigured;
  const SettingsCompanion({
    this.id = const Value.absent(),
    this.isDarkModeEnabled = const Value.absent(),
    this.isOfflineModeEnabled = const Value.absent(),
    this.isConfigured = const Value.absent(),
  });
  SettingsCompanion.insert({
    this.id = const Value.absent(),
    required bool isDarkModeEnabled,
    required bool isOfflineModeEnabled,
    required bool isConfigured,
  })  : isDarkModeEnabled = Value(isDarkModeEnabled),
        isOfflineModeEnabled = Value(isOfflineModeEnabled),
        isConfigured = Value(isConfigured);
  static Insertable<Setting> custom({
    Expression<int>? id,
    Expression<bool>? isDarkModeEnabled,
    Expression<bool>? isOfflineModeEnabled,
    Expression<bool>? isConfigured,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (isDarkModeEnabled != null) 'is_dark_mode_enabled': isDarkModeEnabled,
      if (isOfflineModeEnabled != null)
        'is_offline_mode_enabled': isOfflineModeEnabled,
      if (isConfigured != null) 'is_configured': isConfigured,
    });
  }

  SettingsCompanion copyWith(
      {Value<int>? id,
      Value<bool>? isDarkModeEnabled,
      Value<bool>? isOfflineModeEnabled,
      Value<bool>? isConfigured}) {
    return SettingsCompanion(
      id: id ?? this.id,
      isDarkModeEnabled: isDarkModeEnabled ?? this.isDarkModeEnabled,
      isOfflineModeEnabled: isOfflineModeEnabled ?? this.isOfflineModeEnabled,
      isConfigured: isConfigured ?? this.isConfigured,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (isDarkModeEnabled.present) {
      map['is_dark_mode_enabled'] = Variable<bool>(isDarkModeEnabled.value);
    }
    if (isOfflineModeEnabled.present) {
      map['is_offline_mode_enabled'] =
          Variable<bool>(isOfflineModeEnabled.value);
    }
    if (isConfigured.present) {
      map['is_configured'] = Variable<bool>(isConfigured.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SettingsCompanion(')
          ..write('id: $id, ')
          ..write('isDarkModeEnabled: $isDarkModeEnabled, ')
          ..write('isOfflineModeEnabled: $isOfflineModeEnabled, ')
          ..write('isConfigured: $isConfigured')
          ..write(')'))
        .toString();
  }
}

class $ServerDatabaseTable extends ServerDatabase
    with TableInfo<$ServerDatabaseTable, ServerDatabaseData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ServerDatabaseTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
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
  static const VerificationMeta _serverMeta = const VerificationMeta('server');
  @override
  late final GeneratedColumn<String> server = GeneratedColumn<String>(
      'server', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _portMeta = const VerificationMeta('port');
  @override
  late final GeneratedColumn<int> port = GeneratedColumn<int>(
      'port', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _databaseNameMeta =
      const VerificationMeta('databaseName');
  @override
  late final GeneratedColumn<String> databaseName = GeneratedColumn<String>(
      'database_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, userName, password, server, port, databaseName];
  @override
  String get aliasedName => _alias ?? 'server_database';
  @override
  String get actualTableName => 'server_database';
  @override
  VerificationContext validateIntegrity(Insertable<ServerDatabaseData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
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
    if (data.containsKey('server')) {
      context.handle(_serverMeta,
          server.isAcceptableOrUnknown(data['server']!, _serverMeta));
    } else if (isInserting) {
      context.missing(_serverMeta);
    }
    if (data.containsKey('port')) {
      context.handle(
          _portMeta, port.isAcceptableOrUnknown(data['port']!, _portMeta));
    } else if (isInserting) {
      context.missing(_portMeta);
    }
    if (data.containsKey('database_name')) {
      context.handle(
          _databaseNameMeta,
          databaseName.isAcceptableOrUnknown(
              data['database_name']!, _databaseNameMeta));
    } else if (isInserting) {
      context.missing(_databaseNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ServerDatabaseData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ServerDatabaseData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      userName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_name'])!,
      password: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}password'])!,
      server: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}server'])!,
      port: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}port'])!,
      databaseName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}database_name'])!,
    );
  }

  @override
  $ServerDatabaseTable createAlias(String alias) {
    return $ServerDatabaseTable(attachedDatabase, alias);
  }
}

class ServerDatabaseData extends DataClass
    implements Insertable<ServerDatabaseData> {
  final int id;
  final String userName;
  final String password;
  final String server;
  final int port;
  final String databaseName;
  const ServerDatabaseData(
      {required this.id,
      required this.userName,
      required this.password,
      required this.server,
      required this.port,
      required this.databaseName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_name'] = Variable<String>(userName);
    map['password'] = Variable<String>(password);
    map['server'] = Variable<String>(server);
    map['port'] = Variable<int>(port);
    map['database_name'] = Variable<String>(databaseName);
    return map;
  }

  ServerDatabaseCompanion toCompanion(bool nullToAbsent) {
    return ServerDatabaseCompanion(
      id: Value(id),
      userName: Value(userName),
      password: Value(password),
      server: Value(server),
      port: Value(port),
      databaseName: Value(databaseName),
    );
  }

  factory ServerDatabaseData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ServerDatabaseData(
      id: serializer.fromJson<int>(json['id']),
      userName: serializer.fromJson<String>(json['userName']),
      password: serializer.fromJson<String>(json['password']),
      server: serializer.fromJson<String>(json['server']),
      port: serializer.fromJson<int>(json['port']),
      databaseName: serializer.fromJson<String>(json['databaseName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userName': serializer.toJson<String>(userName),
      'password': serializer.toJson<String>(password),
      'server': serializer.toJson<String>(server),
      'port': serializer.toJson<int>(port),
      'databaseName': serializer.toJson<String>(databaseName),
    };
  }

  ServerDatabaseData copyWith(
          {int? id,
          String? userName,
          String? password,
          String? server,
          int? port,
          String? databaseName}) =>
      ServerDatabaseData(
        id: id ?? this.id,
        userName: userName ?? this.userName,
        password: password ?? this.password,
        server: server ?? this.server,
        port: port ?? this.port,
        databaseName: databaseName ?? this.databaseName,
      );
  @override
  String toString() {
    return (StringBuffer('ServerDatabaseData(')
          ..write('id: $id, ')
          ..write('userName: $userName, ')
          ..write('password: $password, ')
          ..write('server: $server, ')
          ..write('port: $port, ')
          ..write('databaseName: $databaseName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, userName, password, server, port, databaseName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ServerDatabaseData &&
          other.id == this.id &&
          other.userName == this.userName &&
          other.password == this.password &&
          other.server == this.server &&
          other.port == this.port &&
          other.databaseName == this.databaseName);
}

class ServerDatabaseCompanion extends UpdateCompanion<ServerDatabaseData> {
  final Value<int> id;
  final Value<String> userName;
  final Value<String> password;
  final Value<String> server;
  final Value<int> port;
  final Value<String> databaseName;
  const ServerDatabaseCompanion({
    this.id = const Value.absent(),
    this.userName = const Value.absent(),
    this.password = const Value.absent(),
    this.server = const Value.absent(),
    this.port = const Value.absent(),
    this.databaseName = const Value.absent(),
  });
  ServerDatabaseCompanion.insert({
    this.id = const Value.absent(),
    required String userName,
    required String password,
    required String server,
    required int port,
    required String databaseName,
  })  : userName = Value(userName),
        password = Value(password),
        server = Value(server),
        port = Value(port),
        databaseName = Value(databaseName);
  static Insertable<ServerDatabaseData> custom({
    Expression<int>? id,
    Expression<String>? userName,
    Expression<String>? password,
    Expression<String>? server,
    Expression<int>? port,
    Expression<String>? databaseName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userName != null) 'user_name': userName,
      if (password != null) 'password': password,
      if (server != null) 'server': server,
      if (port != null) 'port': port,
      if (databaseName != null) 'database_name': databaseName,
    });
  }

  ServerDatabaseCompanion copyWith(
      {Value<int>? id,
      Value<String>? userName,
      Value<String>? password,
      Value<String>? server,
      Value<int>? port,
      Value<String>? databaseName}) {
    return ServerDatabaseCompanion(
      id: id ?? this.id,
      userName: userName ?? this.userName,
      password: password ?? this.password,
      server: server ?? this.server,
      port: port ?? this.port,
      databaseName: databaseName ?? this.databaseName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userName.present) {
      map['user_name'] = Variable<String>(userName.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (server.present) {
      map['server'] = Variable<String>(server.value);
    }
    if (port.present) {
      map['port'] = Variable<int>(port.value);
    }
    if (databaseName.present) {
      map['database_name'] = Variable<String>(databaseName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ServerDatabaseCompanion(')
          ..write('id: $id, ')
          ..write('userName: $userName, ')
          ..write('password: $password, ')
          ..write('server: $server, ')
          ..write('port: $port, ')
          ..write('databaseName: $databaseName')
          ..write(')'))
        .toString();
  }
}

abstract class _$LocalDatabase extends GeneratedDatabase {
  _$LocalDatabase(QueryExecutor e) : super(e);
  late final $LocalProfessionalTable localProfessional =
      $LocalProfessionalTable(this);
  late final $LocalPatientsTable localPatients = $LocalPatientsTable(this);
  late final $LocalClinicHistoryTable localClinicHistory =
      $LocalClinicHistoryTable(this);
  late final $LocalTreatmentPlansTable localTreatmentPlans =
      $LocalTreatmentPlansTable(this);
  late final $LocaltreatmentResultsTable localtreatmentResults =
      $LocaltreatmentResultsTable(this);
  late final $LocalPatientCaseTable localPatientCase =
      $LocalPatientCaseTable(this);
  late final $LocalSessionsTable localSessions = $LocalSessionsTable(this);
  late final $LocalTestsTable localTests = $LocalTestsTable(this);
  late final $LocalTodosTable localTodos = $LocalTodosTable(this);
  late final $LocalAppointmentsTable localAppointments =
      $LocalAppointmentsTable(this);
  late final $SettingsTable settings = $SettingsTable(this);
  late final $ServerDatabaseTable serverDatabase = $ServerDatabaseTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        localProfessional,
        localPatients,
        localClinicHistory,
        localTreatmentPlans,
        localtreatmentResults,
        localPatientCase,
        localSessions,
        localTests,
        localTodos,
        localAppointments,
        settings,
        serverDatabase
      ];
}
