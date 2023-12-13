// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BankVerificationStruct extends FFFirebaseStruct {
  BankVerificationStruct({
    bool? bankVerificationSuccess,
    String? bankCode,
    String? bankName,
    String? accountName,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _bankVerificationSuccess = bankVerificationSuccess,
        _bankCode = bankCode,
        _bankName = bankName,
        _accountName = accountName,
        super(firestoreUtilData);

  // "bankVerificationSuccess" field.
  bool? _bankVerificationSuccess;
  bool get bankVerificationSuccess => _bankVerificationSuccess ?? false;
  set bankVerificationSuccess(bool? val) => _bankVerificationSuccess = val;
  bool hasBankVerificationSuccess() => _bankVerificationSuccess != null;

  // "bankCode" field.
  String? _bankCode;
  String get bankCode => _bankCode ?? '';
  set bankCode(String? val) => _bankCode = val;
  bool hasBankCode() => _bankCode != null;

  // "bankName" field.
  String? _bankName;
  String get bankName => _bankName ?? '';
  set bankName(String? val) => _bankName = val;
  bool hasBankName() => _bankName != null;

  // "AccountName" field.
  String? _accountName;
  String get accountName => _accountName ?? '';
  set accountName(String? val) => _accountName = val;
  bool hasAccountName() => _accountName != null;

  static BankVerificationStruct fromMap(Map<String, dynamic> data) =>
      BankVerificationStruct(
        bankVerificationSuccess: data['bankVerificationSuccess'] as bool?,
        bankCode: data['bankCode'] as String?,
        bankName: data['bankName'] as String?,
        accountName: data['AccountName'] as String?,
      );

  static BankVerificationStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic>
          ? BankVerificationStruct.fromMap(data)
          : null;

  Map<String, dynamic> toMap() => {
        'bankVerificationSuccess': _bankVerificationSuccess,
        'bankCode': _bankCode,
        'bankName': _bankName,
        'AccountName': _accountName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'bankVerificationSuccess': serializeParam(
          _bankVerificationSuccess,
          ParamType.bool,
        ),
        'bankCode': serializeParam(
          _bankCode,
          ParamType.String,
        ),
        'bankName': serializeParam(
          _bankName,
          ParamType.String,
        ),
        'AccountName': serializeParam(
          _accountName,
          ParamType.String,
        ),
      }.withoutNulls;

  static BankVerificationStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      BankVerificationStruct(
        bankVerificationSuccess: deserializeParam(
          data['bankVerificationSuccess'],
          ParamType.bool,
          false,
        ),
        bankCode: deserializeParam(
          data['bankCode'],
          ParamType.String,
          false,
        ),
        bankName: deserializeParam(
          data['bankName'],
          ParamType.String,
          false,
        ),
        accountName: deserializeParam(
          data['AccountName'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'BankVerificationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BankVerificationStruct &&
        bankVerificationSuccess == other.bankVerificationSuccess &&
        bankCode == other.bankCode &&
        bankName == other.bankName &&
        accountName == other.accountName;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([bankVerificationSuccess, bankCode, bankName, accountName]);
}

BankVerificationStruct createBankVerificationStruct({
  bool? bankVerificationSuccess,
  String? bankCode,
  String? bankName,
  String? accountName,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BankVerificationStruct(
      bankVerificationSuccess: bankVerificationSuccess,
      bankCode: bankCode,
      bankName: bankName,
      accountName: accountName,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BankVerificationStruct? updateBankVerificationStruct(
  BankVerificationStruct? bankVerification, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    bankVerification
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBankVerificationStructData(
  Map<String, dynamic> firestoreData,
  BankVerificationStruct? bankVerification,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (bankVerification == null) {
    return;
  }
  if (bankVerification.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && bankVerification.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final bankVerificationData =
      getBankVerificationFirestoreData(bankVerification, forFieldValue);
  final nestedData =
      bankVerificationData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = bankVerification.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBankVerificationFirestoreData(
  BankVerificationStruct? bankVerification, [
  bool forFieldValue = false,
]) {
  if (bankVerification == null) {
    return {};
  }
  final firestoreData = mapToFirestore(bankVerification.toMap());

  // Add any Firestore field values
  bankVerification.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBankVerificationListFirestoreData(
  List<BankVerificationStruct>? bankVerifications,
) =>
    bankVerifications
        ?.map((e) => getBankVerificationFirestoreData(e, true))
        .toList() ??
    [];
