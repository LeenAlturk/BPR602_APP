// import 'dart:developer';

// import 'package:hive_flutter/adapters.dart';

// class DataStore {
//   late Box<dynamic> box;
//   static const lANG = "lang";
//   static const tOKEN = "token";
//   static const userEmail = "userEmail";
//   static const firstName = "firstName";
//   static const lastName = "lastName";
//   static const userId = "userId";
//   static const dEFAULTBOX = "esim_box";
//   static const firstOpenApp = "FirstOpen";
//   static const refreshToken = "refreshToken";
//   static const roalUser = "roalUser";

//   static const teacherName = "teacherName";
//   static const phoneNumberTeacher = "phoneNumberTeacher";
//   static const classeName = "classeName";
//   static const studentCountClasse = "studentCountTeacher";
//   static const classTeacherId = "classTeacherId";
//   static const linkCV = "linkCV";

//   static final DataStore _instance = DataStore._internal();
//   static DataStore get instance => _instance;
//   DataStore._internal();

//   /// Getters
//   String? get getTeacherName =>
//       box.containsKey(teacherName) ? "${box.get(teacherName)}" : null;
//   String? get getLinkCV =>
//       box.containsKey(linkCV) ? "${box.get(linkCV)}" : null;
//   String? get getPhoneNumberTeacher => box.containsKey(phoneNumberTeacher)
//       ? "${box.get(phoneNumberTeacher)}"
//       : null;
//   String? get getClasseName =>
//       box.containsKey(classeName) ? "${box.get(classeName)}" : null;
//   String? get getStudentCountClasse => box.containsKey(studentCountClasse)
//       ? "${box.get(studentCountClasse)}"
//       : null;
//   String? get getClassTeacherId =>
//       box.containsKey(classTeacherId) ? "${box.get(classTeacherId)}" : null;
//   Future<void> setTeacherName(String value) => box.put(teacherName, value);
//   Future<void> setPhoneNumberTeacher(String value) =>
//       box.put(phoneNumberTeacher, value);
//   Future<void> setClasseName(String value) => box.put(classeName, value);
//   Future<void> setStudentCountClasse(String value) =>
//       box.put(studentCountClasse, value);
//   Future<void> setClassTeacherId(String value) =>
//       box.put(classTeacherId, value);
//   Future<void> setlinkCV(String value) => box.put(linkCV, value);

//   Future<void> deleateTeacherName() => box.delete(teacherName);
//   Future<void> deleatelinkCV() => box.delete(linkCV);

//   Future<void> deleatePhoneNumberTeacher() => box.delete(phoneNumberTeacher);
//   Future<void> deleateClasseName() => box.delete(classeName);
//   Future<void> deleateStudentCountClasse() => box.delete(studentCountClasse);
//   Future<void> deleateTeacherId() => box.delete(classTeacherId);

//   String get lang => box.get(lANG, defaultValue: "en")!;

//   String? get token => box.containsKey(tOKEN) ? "${box.get(tOKEN)}" : null;
//   String? get roal => box.containsKey(roalUser) ? "${box.get(roalUser)}" : null;

//   String? get getrefreshToken =>
//       box.containsKey(refreshToken) ? "${box.get(refreshToken)}" : null;
//   String? get getUserEmail =>
//       box.containsKey(userEmail) ? "${box.get(userEmail)}" : null;

//   String? get getUserFirstName =>
//       box.containsKey(firstName) ? "${box.get(firstName)}" : null;
//   String? get getUserLastName =>
//       box.containsKey(lastName) ? "${box.get(lastName)}" : null;

//   String? get userID => box.containsKey(userId) ? box.get(userId) : null;

//   //String? get numOpen => box.containsKey(firstOpenApp) ? firstOpenApp : null;
//   String? get numOpen => box.get(firstOpenApp);


//   Future<void> init() async {
//     await Hive.initFlutter();

//     box = await Hive.openBox(dEFAULTBOX);
//     log("Datastore initialized", name: "$runtimeType");
//   }

//   /// Checkers
//   bool get hasToken => box.containsKey(tOKEN);

//   /// Setters
//   Future<void> setLang(String value) => box.put(lANG, value);
//   Future<void> setRoalUser(String value) => box.put(roalUser, value);
//   Future<void> deleateRoalUser() => box.delete(roalUser);

//   Future<void> setNumOpenApp(String value) => box.put(firstOpenApp, value);
//   Future<void> setToken(String value) => box.put(tOKEN, value);
//   Future<void> setRefreshToken(String value) => box.put(refreshToken, value);
//   Future<void> deleateRefreshToken() => box.delete(refreshToken);
//   Future<void> setEmailUSer(String value) => box.put(userEmail, value);
//   Future<void> deleateEmailUser() => box.delete(userEmail);
//   Future<void> setFirstNameUser(String value) => box.put(firstName, value);
//   Future<void> deleateFirstNameUser() => box.delete(firstName);
//   Future<void> setLastNameUser(String value) => box.put(lastName, value);
//   Future<void> deleateLastNameUser() => box.delete(lastName);
//   Future<void> deleateToken() => box.delete(tOKEN);
//   Future<void> setUserId(int value) => box.put(userId, value);
//   Future<void> deleateUserId() => box.delete(userId);

//   // Future<void> setAuth(AuthState value) => box.put(TOKEN, value.name);
// }
import 'dart:developer';
import 'package:hive_flutter/adapters.dart';

class DataStore {
  late Box<dynamic> box;
  static const lANG = "lang";
  static const tOKEN = "token";
  static const userEmail = "userEmail";
  static const firstName = "firstName";
  static const lastName = "lastName";
  static const userId = "userId";
  static const dEFAULTBOX = "esim_box";
  static const firstOpenApp = "FirstOpen";
  static const refreshToken = "refreshToken";
  static const roalUser = "roalUser";

  static const teacherName = "teacherName";
  static const phoneNumberTeacher = "phoneNumberTeacher";
  static const classeName = "classeName";
  static const studentCountClasse = "studentCountTeacher";
  static const classTeacherId = "classTeacherId";
  static const linkCV = "linkCV";

  static final DataStore _instance = DataStore._internal();
  static DataStore get instance => _instance;
  DataStore._internal();

  /// Getters
  String? get getTeacherName =>
      box.containsKey(teacherName) ? "${box.get(teacherName)}" : null;
  String? get getLinkCV =>
      box.containsKey(linkCV) ? "${box.get(linkCV)}" : null;
  String? get getPhoneNumberTeacher => box.containsKey(phoneNumberTeacher)
      ? "${box.get(phoneNumberTeacher)}"
      : null;
  String? get getClasseName =>
      box.containsKey(classeName) ? "${box.get(classeName)}" : null;
  String? get getStudentCountClasse => box.containsKey(studentCountClasse)
      ? "${box.get(studentCountClasse)}"
      : null;
  String? get getClassTeacherId =>
      box.containsKey(classTeacherId) ? "${box.get(classTeacherId)}" : null;

  Future<void> setTeacherName(String value) => box.put(teacherName, value);
  Future<void> setPhoneNumberTeacher(String value) =>
      box.put(phoneNumberTeacher, value);
  Future<void> setClasseName(String value) => box.put(classeName, value);
  Future<void> setStudentCountClasse(String value) =>
      box.put(studentCountClasse, value);
  Future<void> setClassTeacherId(String value) =>
      box.put(classTeacherId, value);
  Future<void> setlinkCV(String value) => box.put(linkCV, value);

  Future<void> deleateTeacherName() => box.delete(teacherName);
  Future<void> deleatelinkCV() => box.delete(linkCV);
  Future<void> deleatePhoneNumberTeacher() => box.delete(phoneNumberTeacher);
  Future<void> deleateClasseName() => box.delete(classeName);
  Future<void> deleateStudentCountClasse() => box.delete(studentCountClasse);
  Future<void> deleateTeacherId() => box.delete(classTeacherId);

  String get lang => box.get(lANG, defaultValue: "en")!;
  String? get token => box.containsKey(tOKEN) ? "${box.get(tOKEN)}" : null;
  String? get roal => box.containsKey(roalUser) ? "${box.get(roalUser)}" : null;
  String? get getrefreshToken =>
      box.containsKey(refreshToken) ? "${box.get(refreshToken)}" : null;
  String? get getUserEmail =>
      box.containsKey(userEmail) ? "${box.get(userEmail)}" : null;
  String? get getUserFirstName =>
      box.containsKey(firstName) ? "${box.get(firstName)}" : null;
  String? get getUserLastName =>
      box.containsKey(lastName) ? "${box.get(lastName)}" : null;

  int? get userID => box.get(userId); // ✅ تعديل النوع إلى int?

  String? get numOpen => box.get(firstOpenApp);

  Future<void> init() async {
    await Hive.initFlutter();
    box = await Hive.openBox(dEFAULTBOX);
    log("Datastore initialized", name: "$runtimeType");
  }

  /// Checkers
  bool get hasToken => box.containsKey(tOKEN);

  /// Setters
  Future<void> setLang(String value) => box.put(lANG, value);
  Future<void> setRoalUser(String value) => box.put(roalUser, value);
  Future<void> deleateRoalUser() => box.delete(roalUser);
  Future<void> setNumOpenApp(String value) => box.put(firstOpenApp, value);
  Future<void> setToken(String value) => box.put(tOKEN, value);
  Future<void> setRefreshToken(String value) => box.put(refreshToken, value);
  Future<void> deleateRefreshToken() => box.delete(refreshToken);
  Future<void> setEmailUSer(String value) => box.put(userEmail, value);
  Future<void> deleateEmailUser() => box.delete(userEmail);
  Future<void> setFirstNameUser(String value) => box.put(firstName, value);
  Future<void> deleateFirstNameUser() => box.delete(firstName);
  Future<void> setLastNameUser(String value) => box.put(lastName, value);
  Future<void> deleateLastNameUser() => box.delete(lastName);
  Future<void> deleateToken() => box.delete(tOKEN);
  Future<void> setUserId(int value) => box.put(userId, value);
  Future<void> deleateUserId() => box.delete(userId);
}
