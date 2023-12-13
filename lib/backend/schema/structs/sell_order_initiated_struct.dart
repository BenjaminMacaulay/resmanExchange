// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SellOrderInitiatedStruct extends FFFirebaseStruct {
  SellOrderInitiatedStruct({
    double? amountToSellInDollars,
    double? amountToSellInCrypto,
    double? amountToRecieveInLocalCurrency,
    String? walletAddressSentTo,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _amountToSellInDollars = amountToSellInDollars,
        _amountToSellInCrypto = amountToSellInCrypto,
        _amountToRecieveInLocalCurrency = amountToRecieveInLocalCurrency,
        _walletAddressSentTo = walletAddressSentTo,
        super(firestoreUtilData);

  // "AmountToSellInDollars" field.
  double? _amountToSellInDollars;
  double get amountToSellInDollars => _amountToSellInDollars ?? 0.0;
  set amountToSellInDollars(double? val) => _amountToSellInDollars = val;
  void incrementAmountToSellInDollars(double amount) =>
      _amountToSellInDollars = amountToSellInDollars + amount;
  bool hasAmountToSellInDollars() => _amountToSellInDollars != null;

  // "AmountToSellInCrypto" field.
  double? _amountToSellInCrypto;
  double get amountToSellInCrypto => _amountToSellInCrypto ?? 0.0;
  set amountToSellInCrypto(double? val) => _amountToSellInCrypto = val;
  void incrementAmountToSellInCrypto(double amount) =>
      _amountToSellInCrypto = amountToSellInCrypto + amount;
  bool hasAmountToSellInCrypto() => _amountToSellInCrypto != null;

  // "AmountToRecieveInLocalCurrency" field.
  double? _amountToRecieveInLocalCurrency;
  double get amountToRecieveInLocalCurrency =>
      _amountToRecieveInLocalCurrency ?? 0.0;
  set amountToRecieveInLocalCurrency(double? val) =>
      _amountToRecieveInLocalCurrency = val;
  void incrementAmountToRecieveInLocalCurrency(double amount) =>
      _amountToRecieveInLocalCurrency = amountToRecieveInLocalCurrency + amount;
  bool hasAmountToRecieveInLocalCurrency() =>
      _amountToRecieveInLocalCurrency != null;

  // "walletAddressSentTo" field.
  String? _walletAddressSentTo;
  String get walletAddressSentTo => _walletAddressSentTo ?? '';
  set walletAddressSentTo(String? val) => _walletAddressSentTo = val;
  bool hasWalletAddressSentTo() => _walletAddressSentTo != null;

  static SellOrderInitiatedStruct fromMap(Map<String, dynamic> data) =>
      SellOrderInitiatedStruct(
        amountToSellInDollars:
            castToType<double>(data['AmountToSellInDollars']),
        amountToSellInCrypto: castToType<double>(data['AmountToSellInCrypto']),
        amountToRecieveInLocalCurrency:
            castToType<double>(data['AmountToRecieveInLocalCurrency']),
        walletAddressSentTo: data['walletAddressSentTo'] as String?,
      );

  static SellOrderInitiatedStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic>
          ? SellOrderInitiatedStruct.fromMap(data)
          : null;

  Map<String, dynamic> toMap() => {
        'AmountToSellInDollars': _amountToSellInDollars,
        'AmountToSellInCrypto': _amountToSellInCrypto,
        'AmountToRecieveInLocalCurrency': _amountToRecieveInLocalCurrency,
        'walletAddressSentTo': _walletAddressSentTo,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'AmountToSellInDollars': serializeParam(
          _amountToSellInDollars,
          ParamType.double,
        ),
        'AmountToSellInCrypto': serializeParam(
          _amountToSellInCrypto,
          ParamType.double,
        ),
        'AmountToRecieveInLocalCurrency': serializeParam(
          _amountToRecieveInLocalCurrency,
          ParamType.double,
        ),
        'walletAddressSentTo': serializeParam(
          _walletAddressSentTo,
          ParamType.String,
        ),
      }.withoutNulls;

  static SellOrderInitiatedStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      SellOrderInitiatedStruct(
        amountToSellInDollars: deserializeParam(
          data['AmountToSellInDollars'],
          ParamType.double,
          false,
        ),
        amountToSellInCrypto: deserializeParam(
          data['AmountToSellInCrypto'],
          ParamType.double,
          false,
        ),
        amountToRecieveInLocalCurrency: deserializeParam(
          data['AmountToRecieveInLocalCurrency'],
          ParamType.double,
          false,
        ),
        walletAddressSentTo: deserializeParam(
          data['walletAddressSentTo'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SellOrderInitiatedStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SellOrderInitiatedStruct &&
        amountToSellInDollars == other.amountToSellInDollars &&
        amountToSellInCrypto == other.amountToSellInCrypto &&
        amountToRecieveInLocalCurrency ==
            other.amountToRecieveInLocalCurrency &&
        walletAddressSentTo == other.walletAddressSentTo;
  }

  @override
  int get hashCode => const ListEquality().hash([
        amountToSellInDollars,
        amountToSellInCrypto,
        amountToRecieveInLocalCurrency,
        walletAddressSentTo
      ]);
}

SellOrderInitiatedStruct createSellOrderInitiatedStruct({
  double? amountToSellInDollars,
  double? amountToSellInCrypto,
  double? amountToRecieveInLocalCurrency,
  String? walletAddressSentTo,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SellOrderInitiatedStruct(
      amountToSellInDollars: amountToSellInDollars,
      amountToSellInCrypto: amountToSellInCrypto,
      amountToRecieveInLocalCurrency: amountToRecieveInLocalCurrency,
      walletAddressSentTo: walletAddressSentTo,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SellOrderInitiatedStruct? updateSellOrderInitiatedStruct(
  SellOrderInitiatedStruct? sellOrderInitiated, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    sellOrderInitiated
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSellOrderInitiatedStructData(
  Map<String, dynamic> firestoreData,
  SellOrderInitiatedStruct? sellOrderInitiated,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (sellOrderInitiated == null) {
    return;
  }
  if (sellOrderInitiated.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && sellOrderInitiated.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final sellOrderInitiatedData =
      getSellOrderInitiatedFirestoreData(sellOrderInitiated, forFieldValue);
  final nestedData =
      sellOrderInitiatedData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      sellOrderInitiated.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSellOrderInitiatedFirestoreData(
  SellOrderInitiatedStruct? sellOrderInitiated, [
  bool forFieldValue = false,
]) {
  if (sellOrderInitiated == null) {
    return {};
  }
  final firestoreData = mapToFirestore(sellOrderInitiated.toMap());

  // Add any Firestore field values
  sellOrderInitiated.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSellOrderInitiatedListFirestoreData(
  List<SellOrderInitiatedStruct>? sellOrderInitiateds,
) =>
    sellOrderInitiateds
        ?.map((e) => getSellOrderInitiatedFirestoreData(e, true))
        .toList() ??
    [];
