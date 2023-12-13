// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SAfricaBankAcctStruct extends FFFirebaseStruct {
  SAfricaBankAcctStruct({
    String? accountName,
    String? bankName,
    String? accountNumber,
    String? bankCode,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _accountName = accountName,
        _bankName = bankName,
        _accountNumber = accountNumber,
        _bankCode = bankCode,
        super(firestoreUtilData);

  // "AccountName" field.
  String? _accountName;
  String get accountName => _accountName ?? '';
  set accountName(String? val) => _accountName = val;
  bool hasAccountName() => _accountName != null;

  // "BankName" field.
  String? _bankName;
  String get bankName => _bankName ?? '';
  set bankName(String? val) => _bankName = val;
  bool hasBankName() => _bankName != null;

  // "AccountNumber" field.
  String? _accountNumber;
  String get accountNumber => _accountNumber ?? '';
  set accountNumber(String? val) => _accountNumber = val;
  bool hasAccountNumber() => _accountNumber != null;

  // "BankCode" field.
  String? _bankCode;
  String get bankCode => _bankCode ?? '';
  set bankCode(String? val) => _bankCode = val;
  bool hasBankCode() => _bankCode != null;

  static SAfricaBankAcctStruct fromMap(Map<String, dynamic> data) =>
      SAfricaBankAcctStruct(
        accountName: data['AccountName'] as String?,
        bankName: data['BankName'] as String?,
        accountNumber: data['AccountNumber'] as String?,
        bankCode: data['BankCode'] as String?,
      );

  static SAfricaBankAcctStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? SAfricaBankAcctStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'AccountName': _accountName,
        'BankName': _bankName,
        'AccountNumber': _accountNumber,
        'BankCode': _bankCode,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'AccountName': serializeParam(
          _accountName,
          ParamType.String,
        ),
        'BankName': serializeParam(
          _bankName,
          ParamType.String,
        ),
        'AccountNumber': serializeParam(
          _accountNumber,
          ParamType.String,
        ),
        'BankCode': serializeParam(
          _bankCode,
          ParamType.String,
        ),
      }.withoutNulls;

  static SAfricaBankAcctStruct fromSerializableMap(Map<String, dynamic> data) =>
      SAfricaBankAcctStruct(
        accountName: deserializeParam(
          data['AccountName'],
          ParamType.String,
          false,
        ),
        bankName: deserializeParam(
          data['BankName'],
          ParamType.String,
          false,
        ),
        accountNumber: deserializeParam(
          data['AccountNumber'],
          ParamType.String,
          false,
        ),
        bankCode: deserializeParam(
          data['BankCode'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SAfricaBankAcctStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SAfricaBankAcctStruct &&
        accountName == other.accountName &&
        bankName == other.bankName &&
        accountNumber == other.accountNumber &&
        bankCode == other.bankCode;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([accountName, bankName, accountNumber, bankCode]);
}

SAfricaBankAcctStruct createSAfricaBankAcctStruct({
  String? accountName,
  String? bankName,
  String? accountNumber,
  String? bankCode,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SAfricaBankAcctStruct(
      accountName: accountName,
      bankName: bankName,
      accountNumber: accountNumber,
      bankCode: bankCode,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SAfricaBankAcctStruct? updateSAfricaBankAcctStruct(
  SAfricaBankAcctStruct? sAfricaBankAcct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    sAfricaBankAcct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSAfricaBankAcctStructData(
  Map<String, dynamic> firestoreData,
  SAfricaBankAcctStruct? sAfricaBankAcct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (sAfricaBankAcct == null) {
    return;
  }
  if (sAfricaBankAcct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && sAfricaBankAcct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final sAfricaBankAcctData =
      getSAfricaBankAcctFirestoreData(sAfricaBankAcct, forFieldValue);
  final nestedData =
      sAfricaBankAcctData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = sAfricaBankAcct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSAfricaBankAcctFirestoreData(
  SAfricaBankAcctStruct? sAfricaBankAcct, [
  bool forFieldValue = false,
]) {
  if (sAfricaBankAcct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(sAfricaBankAcct.toMap());

  // Add any Firestore field values
  sAfricaBankAcct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSAfricaBankAcctListFirestoreData(
  List<SAfricaBankAcctStruct>? sAfricaBankAccts,
) =>
    sAfricaBankAccts
        ?.map((e) => getSAfricaBankAcctFirestoreData(e, true))
        .toList() ??
    [];
