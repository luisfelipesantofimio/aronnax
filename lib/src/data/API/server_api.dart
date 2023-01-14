import 'dart:developer';
import 'package:aronnax/main.dart';
import 'package:aronnax/src/data/database/settings_model.dart';
import 'package:mysql1/mysql1.dart';

// TODO: Update remote data model and queries with required values

ServerSettings localData = localdb.get("serverSettings");

String host = localData.server;
int port = int.parse(localData.port);
String db = localData.databaseName;
String user = localData.userName;
String password = localData.password;

class MySQL {
  String host = localData.server;
  int port = int.parse(localData.port);
  String db = localData.databaseName;
  String user = localData.userName;
  String password = localData.password;
  MySQL();
  Future<MySqlConnection> getConnection() async {
    var settings = ConnectionSettings(
      host: host,
      db: db,
      user: user,
      password: password,
      port: port,
      timeout: const Duration(seconds: 30),
    );
    return await MySqlConnection.connect(settings);
  }
}

Future createTables() async {
  final conn = await MySqlConnection.connect(
    ConnectionSettings(
        host: host,
        port: port,
        db: db,
        user: user,
        password: password,
        timeout: const Duration(seconds: 30)),
  );
  //Create tables
  await conn.query(
      'CREATE TABLE patients (id int NOT NULL AUTO_INCREMENT PRIMARY KEY, names varchar(255) NOT NULL, lastNames varchar(255) NOT NULL, birthDate varchar(255) NOT NULL, idNumber int NOT NULL UNIQUE, contactNumber varchar(255) NOT NULL, mail varchar(255) NOT NULL, city varchar(255) NOT NULL, state varchar(255) NOT NULL, adress varchar(255) NOT NULL, education varchar(255) NOT NULL, ocupation varchar(255) NOT NULL, insurance varchar(255) NOT NULL, emergencyContactName varchar(255) NOT NULL, emergencyContactNumber varchar(255) NOT NULL) ENGINE=INNODB;');
  await conn.query(
      'CREATE TABLE clinic_history (registerCode varchar(255) PRIMARY KEY NOT NULL, dateTime varchar(255) NOT NULL, consultationReason LONGTEXT NOT NULL, mentalExamn LONGTEXT NOT NULL, treatment LONGTEXT NOT NULL, medAntecedents LONGTEXT NOT NULL, psiAntecedents LONGTEXT NOT NULL, familyHistory LONGTEXT NOT NULL, personalHistory LONGTEXT NOT NULL, diagnostic LONGTEXT NOT NULL, idNumber int NOT NULL UNIQUE, createdBy varchar(255) NOT NULL) ENGINE=INNODB;');
  await conn.query(
      'CREATE TABLE sessions (sessionId int NOT NULL PRIMARY KEY AUTO_INCREMENT, dateTime varchar(255) NOT NULL, sessionSummary LONGTEXT NOT NULL, sessionObjectives LONGTEXT NOT NULL, therapeuticArchievements LONGTEXT NOT NULL, idNumber int NOT NULL, professionalName varchar(255) NOT NULL) ENGINE=INNODB;');
  await conn.query(
      'CREATE TABLE professional (personalID int PRIMARY KEY NOT NULL, names varchar(255) NOT NULL, lastNames varchar(255) NOT NULL, profession varchar(255) NOT NULL, professionalID int NOT NULL UNIQUE, userName varchar(255) NOT NULL, password varchar(255) NOT NULL) ENGINE=INNODB;');
  await conn.query(
      'ALTER TABLE clinic_history ADD FOREIGN KEY (idNumber) REFERENCES patients (idNumber)');
  await conn.query(
      'ALTER TABLE sessions ADD FOREIGN KEY (idNumber) REFERENCES clinic_history (idNumber)');
}

insertPatientData(
  names,
  lastNames,
  birthDate,
  idNumber,
  contactNumber,
  mail,
  city,
  state,
  adress,
  insurance,
  education,
  ocupation,
  emergencyContactName,
  emergencyContactNumber,
) async {
  final conn = await MySqlConnection.connect(
    ConnectionSettings(
      host: host,
      port: port,
      db: db,
      user: user,
      password: password,
      timeout: const Duration(seconds: 30),
    ),
  );
  await conn.query(
    'insert into patients (names, lastNames, birthDate, idNumber, contactNumber, mail, city, state, adress, insurance, education, ocupation, emergencyContactName, emergencyContactNumber) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)',
    [
      names,
      lastNames,
      birthDate,
      idNumber,
      contactNumber,
      mail,
      city,
      state,
      adress,
      insurance,
      education,
      ocupation,
      emergencyContactName,
      emergencyContactNumber,
    ],
  );
}

insertClinicHistory(
    registerCode,
    dateTime,
    consultationReason,
    mentalExamn,
    treatment,
    medAntecedents,
    psiAntecedents,
    familyHistory,
    personalHistory,
    diagnostic,
    idNumber,
    createdBy) async {
  final conn = await MySqlConnection.connect(
    ConnectionSettings(
      host: host,
      port: port,
      db: db,
      user: user,
      password: password,
      timeout: const Duration(seconds: 30),
    ),
  );
  await conn.query(
    'insert into clinic_history (registerCode, dateTime, consultationReason, mentalExamn, treatment, medAntecedents, psiAntecedents, familyHistory, personalHistory, diagnostic, idNumber, createdBy) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)',
    [
      registerCode,
      dateTime,
      consultationReason,
      mentalExamn,
      treatment,
      medAntecedents,
      psiAntecedents,
      familyHistory,
      personalHistory,
      diagnostic,
      idNumber,
      createdBy
    ],
  );
}

insertSessionData(dateTime, sessionSummary, sessionObjectives,
    therapeuticArchievements, idNumber, professionalName) async {
  final conn = await MySqlConnection.connect(
    ConnectionSettings(
      host: host,
      port: port,
      db: db,
      user: user,
      password: password,
      timeout: const Duration(seconds: 30),
    ),
  );
  await conn.query(
    'insert into sessions (dateTime, sessionSummary, sessionObjectives, therapeuticArchievements, idNumber, professionalName) values (?, ?, ?, ?, ?, ?)',
    [
      dateTime,
      sessionSummary,
      sessionObjectives,
      therapeuticArchievements,
      idNumber,
      professionalName
    ],
  );
}

insertProfessional(personalID, names, lastNames, profession, professionalID,
    userName, userPassword) async {
  final conn = await MySqlConnection.connect(
    ConnectionSettings(
      host: host,
      port: port,
      db: db,
      user: user,
      password: password,
      timeout: const Duration(seconds: 30),
    ),
  );
  await conn.query(
    'insert into professional (personalID, names, lastNames, profession, professionalID, userName, password) values (?, ?, ?, ?, ?, ?, ?)',
    [
      personalID,
      names,
      lastNames,
      profession,
      professionalID,
      userName,
      userPassword
    ],
  );
}

updatePassword(int professionalID, String newPassword) async {
  final conn = await MySqlConnection.connect(
    ConnectionSettings(
      host: host,
      port: port,
      db: db,
      user: user,
      password: password,
      timeout: const Duration(seconds: 30),
    ),
  );
  await conn.query(
      "update professional set password='$newPassword' where professionalID=$professionalID");
}

consultData(selected) async {
  final conn = await MySqlConnection.connect(
    ConnectionSettings(
      host: host,
      port: port,
      db: db,
      user: user,
      password: password,
      timeout: const Duration(seconds: 30),
    ),
  );
  var result = await conn.query(
    'select names from patients where idNumber = ?',
    [selected],
  );

  return log(result.toString());
}

askForPassword(argument) async {
  final conn = await MySqlConnection.connect(
    ConnectionSettings(
      host: host,
      port: port,
      db: db,
      user: user,
      password: password,
      timeout: const Duration(seconds: 30),
    ),
  );
  var result =
      conn.query("select names from patients where idNumber = '$argument'");
  return log(result.toString());
}
