// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NigerianBankAcctStruct extends FFFirebaseStruct {
  NigerianBankAcctStruct({
    String? accountNumber,
    String? bankName,
    String? accountName,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _accountNumber = accountNumber,
        _bankName = bankName,
        _accountName = accountName,
        super(firestoreUtilData);

  // "AccountNumber" field.
  String? _accountNumber;
  String get accountNumber => _accountNumber ?? '';
  set accountNumber(String? val) => _accountNumber = val;
  bool hasAccountNumber() => _accountNumber != null;

  // "BankName" field.
  String? _bankName;
  String get bankName => _bankName ?? '';
  set bankName(String? val) => _bankName = val;
  bool hasBankName() => _bankName != null;

  // "AccountName" field.
  String? _accountName;
  String get accountName => _accountName ?? '';
  set accountName(String? val) => _accountName = val;
  bool hasAccountName() => _accountName != null;

  static NigerianBankAcctStruct fromMap(Map<String, dynamic> data) =>
      NigerianBankAcctStruct(
        accountNumber: data['AccountNumber'] as String?,
        bankName: data['BankName'] as String?,
        accountName: data['AccountName'] as String?,
      );

  static NigerianBankAcctStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic>
          ? NigerianBankAcctStruct.fromMap(data)
          : null;

  Map<String, dynamic> toMap() => {
        'AccountNumber': _accountNumber,
        'BankName': _bankName,
        'AccountName': _accountName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'AccountNumber': serializeParam(
          _accountNumber,
          ParamType.String,
        ),
        'BankName': serializeParam(
          _bankName,
          ParamType.String,
        ),
        'AccountName': serializeParam(
          _accountName,
          ParamType.String,
        ),
      }.withoutNulls;

  static NigerianBankAcctStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      NigerianBankAcctStruct(
        accountNumber: deserializeParam(
          data['AccountNumber'],
          ParamType.String,
          false,
        ),
        bankName: deserializeParam(
          data['BankName'],
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
  String toString() => 'NigerianBankAcctStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NigerianBankAcctStruct &&
        accountNumber == other.accountNumber &&
        bankName == other.bankName &&
        accountName == other.accountName;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([accountNumber, bankName, accountName]);
}

NigerianBankAcctStruct createNigerianBankAcctStruct({
  String? accountNumber,
  String? bankName,
  String? accountName,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    NigerianBankAcctStruct(
      accountNumber: accountNumber,
      bankName: bankName,
      accountName: accountName,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

NigerianBankAcctStruct? updateNigerianBankAcctStruct(
  NigerianBankAcctStruct? nigerianBankAcct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    nigerianBankAcct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addNigerianBankAcctStructData(
  Map<String, dynamic> firestoreData,
  NigerianBankAcctStruct? nigerianBankAcct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (nigerianBankAcct == null) {
    return;
  }
  if (nigerianBankAcct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && nigerianBankAcct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final nigerianBankAcctData =
      getNigerianBankAcctFirestoreData(nigerianBankAcct, forFieldValue);
  final nestedData =
      nigerianBankAcctData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = nigerianBankAcct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getNigerianBankAcctFirestoreData(
  NigerianBankAcctStruct? nigerianBankAcct, [
  bool forFieldValue = false,
]) {
  if (nigerianBankAcct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(nigerianBankAcct.toMap());

  // Add any Firestore field values
  nigerianBankAcct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getNigerianBankAcctListFirestoreData(
  List<NigerianBankAcctStruct>? nigerianBankAccts,
) =>
    nigerianBankAccts
        ?.map((e) => getNigerianBankAcctFirestoreData(e, true))
        .toList() ??
    [];
