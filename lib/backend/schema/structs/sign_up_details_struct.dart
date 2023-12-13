// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SignUpDetailsStruct extends FFFirebaseStruct {
  SignUpDetailsStruct({
    String? username,
    String? email,
    String? password,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _username = username,
        _email = email,
        _password = password,
        super(firestoreUtilData);

  // "username" field.
  String? _username;
  String get username => _username ?? '';
  set username(String? val) => _username = val;
  bool hasUsername() => _username != null;

  // "Email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;
  bool hasEmail() => _email != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  set password(String? val) => _password = val;
  bool hasPassword() => _password != null;

  static SignUpDetailsStruct fromMap(Map<String, dynamic> data) =>
      SignUpDetailsStruct(
        username: data['username'] as String?,
        email: data['Email'] as String?,
        password: data['password'] as String?,
      );

  static SignUpDetailsStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? SignUpDetailsStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'username': _username,
        'Email': _email,
        'password': _password,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'username': serializeParam(
          _username,
          ParamType.String,
        ),
        'Email': serializeParam(
          _email,
          ParamType.String,
        ),
        'password': serializeParam(
          _password,
          ParamType.String,
        ),
      }.withoutNulls;

  static SignUpDetailsStruct fromSerializableMap(Map<String, dynamic> data) =>
      SignUpDetailsStruct(
        username: deserializeParam(
          data['username'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['Email'],
          ParamType.String,
          false,
        ),
        password: deserializeParam(
          data['password'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SignUpDetailsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SignUpDetailsStruct &&
        username == other.username &&
        email == other.email &&
        password == other.password;
  }

  @override
  int get hashCode => const ListEquality().hash([username, email, password]);
}

SignUpDetailsStruct createSignUpDetailsStruct({
  String? username,
  String? email,
  String? password,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SignUpDetailsStruct(
      username: username,
      email: email,
      password: password,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SignUpDetailsStruct? updateSignUpDetailsStruct(
  SignUpDetailsStruct? signUpDetails, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    signUpDetails
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSignUpDetailsStructData(
  Map<String, dynamic> firestoreData,
  SignUpDetailsStruct? signUpDetails,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (signUpDetails == null) {
    return;
  }
  if (signUpDetails.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && signUpDetails.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final signUpDetailsData =
      getSignUpDetailsFirestoreData(signUpDetails, forFieldValue);
  final nestedData =
      signUpDetailsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = signUpDetails.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSignUpDetailsFirestoreData(
  SignUpDetailsStruct? signUpDetails, [
  bool forFieldValue = false,
]) {
  if (signUpDetails == null) {
    return {};
  }
  final firestoreData = mapToFirestore(signUpDetails.toMap());

  // Add any Firestore field values
  signUpDetails.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSignUpDetailsListFirestoreData(
  List<SignUpDetailsStruct>? signUpDetailss,
) =>
    signUpDetailss
        ?.map((e) => getSignUpDetailsFirestoreData(e, true))
        .toList() ??
    [];
