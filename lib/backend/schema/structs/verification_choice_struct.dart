// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VerificationChoiceStruct extends FFFirebaseStruct {
  VerificationChoiceStruct({
    bool? biometricVerification,
    bool? phoneVerification,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _biometricVerification = biometricVerification,
        _phoneVerification = phoneVerification,
        super(firestoreUtilData);

  // "biometricVerification" field.
  bool? _biometricVerification;
  bool get biometricVerification => _biometricVerification ?? false;
  set biometricVerification(bool? val) => _biometricVerification = val;
  bool hasBiometricVerification() => _biometricVerification != null;

  // "PhoneVerification" field.
  bool? _phoneVerification;
  bool get phoneVerification => _phoneVerification ?? false;
  set phoneVerification(bool? val) => _phoneVerification = val;
  bool hasPhoneVerification() => _phoneVerification != null;

  static VerificationChoiceStruct fromMap(Map<String, dynamic> data) =>
      VerificationChoiceStruct(
        biometricVerification: data['biometricVerification'] as bool?,
        phoneVerification: data['PhoneVerification'] as bool?,
      );

  static VerificationChoiceStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic>
          ? VerificationChoiceStruct.fromMap(data)
          : null;

  Map<String, dynamic> toMap() => {
        'biometricVerification': _biometricVerification,
        'PhoneVerification': _phoneVerification,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'biometricVerification': serializeParam(
          _biometricVerification,
          ParamType.bool,
        ),
        'PhoneVerification': serializeParam(
          _phoneVerification,
          ParamType.bool,
        ),
      }.withoutNulls;

  static VerificationChoiceStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      VerificationChoiceStruct(
        biometricVerification: deserializeParam(
          data['biometricVerification'],
          ParamType.bool,
          false,
        ),
        phoneVerification: deserializeParam(
          data['PhoneVerification'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'VerificationChoiceStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is VerificationChoiceStruct &&
        biometricVerification == other.biometricVerification &&
        phoneVerification == other.phoneVerification;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([biometricVerification, phoneVerification]);
}

VerificationChoiceStruct createVerificationChoiceStruct({
  bool? biometricVerification,
  bool? phoneVerification,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    VerificationChoiceStruct(
      biometricVerification: biometricVerification,
      phoneVerification: phoneVerification,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

VerificationChoiceStruct? updateVerificationChoiceStruct(
  VerificationChoiceStruct? verificationChoice, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    verificationChoice
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addVerificationChoiceStructData(
  Map<String, dynamic> firestoreData,
  VerificationChoiceStruct? verificationChoice,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (verificationChoice == null) {
    return;
  }
  if (verificationChoice.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && verificationChoice.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final verificationChoiceData =
      getVerificationChoiceFirestoreData(verificationChoice, forFieldValue);
  final nestedData =
      verificationChoiceData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      verificationChoice.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getVerificationChoiceFirestoreData(
  VerificationChoiceStruct? verificationChoice, [
  bool forFieldValue = false,
]) {
  if (verificationChoice == null) {
    return {};
  }
  final firestoreData = mapToFirestore(verificationChoice.toMap());

  // Add any Firestore field values
  verificationChoice.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getVerificationChoiceListFirestoreData(
  List<VerificationChoiceStruct>? verificationChoices,
) =>
    verificationChoices
        ?.map((e) => getVerificationChoiceFirestoreData(e, true))
        .toList() ??
    [];
