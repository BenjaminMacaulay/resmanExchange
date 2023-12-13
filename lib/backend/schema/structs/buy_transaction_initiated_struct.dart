// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BuyTransactionInitiatedStruct extends FFFirebaseStruct {
  BuyTransactionInitiatedStruct({
    double? amountToBuyCurrency,
    double? amountToBuyinDollars,
    double? amountToBuyInCrypto,
    double? cryptoAddress,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _amountToBuyCurrency = amountToBuyCurrency,
        _amountToBuyinDollars = amountToBuyinDollars,
        _amountToBuyInCrypto = amountToBuyInCrypto,
        _cryptoAddress = cryptoAddress,
        super(firestoreUtilData);

  // "amountToBuyCurrency" field.
  double? _amountToBuyCurrency;
  double get amountToBuyCurrency => _amountToBuyCurrency ?? 0.0;
  set amountToBuyCurrency(double? val) => _amountToBuyCurrency = val;
  void incrementAmountToBuyCurrency(double amount) =>
      _amountToBuyCurrency = amountToBuyCurrency + amount;
  bool hasAmountToBuyCurrency() => _amountToBuyCurrency != null;

  // "amountToBuyinDollars" field.
  double? _amountToBuyinDollars;
  double get amountToBuyinDollars => _amountToBuyinDollars ?? 0.0;
  set amountToBuyinDollars(double? val) => _amountToBuyinDollars = val;
  void incrementAmountToBuyinDollars(double amount) =>
      _amountToBuyinDollars = amountToBuyinDollars + amount;
  bool hasAmountToBuyinDollars() => _amountToBuyinDollars != null;

  // "amountToBuyInCrypto" field.
  double? _amountToBuyInCrypto;
  double get amountToBuyInCrypto => _amountToBuyInCrypto ?? 0.0;
  set amountToBuyInCrypto(double? val) => _amountToBuyInCrypto = val;
  void incrementAmountToBuyInCrypto(double amount) =>
      _amountToBuyInCrypto = amountToBuyInCrypto + amount;
  bool hasAmountToBuyInCrypto() => _amountToBuyInCrypto != null;

  // "cryptoAddress" field.
  double? _cryptoAddress;
  double get cryptoAddress => _cryptoAddress ?? 0.0;
  set cryptoAddress(double? val) => _cryptoAddress = val;
  void incrementCryptoAddress(double amount) =>
      _cryptoAddress = cryptoAddress + amount;
  bool hasCryptoAddress() => _cryptoAddress != null;

  static BuyTransactionInitiatedStruct fromMap(Map<String, dynamic> data) =>
      BuyTransactionInitiatedStruct(
        amountToBuyCurrency: castToType<double>(data['amountToBuyCurrency']),
        amountToBuyinDollars: castToType<double>(data['amountToBuyinDollars']),
        amountToBuyInCrypto: castToType<double>(data['amountToBuyInCrypto']),
        cryptoAddress: castToType<double>(data['cryptoAddress']),
      );

  static BuyTransactionInitiatedStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic>
          ? BuyTransactionInitiatedStruct.fromMap(data)
          : null;

  Map<String, dynamic> toMap() => {
        'amountToBuyCurrency': _amountToBuyCurrency,
        'amountToBuyinDollars': _amountToBuyinDollars,
        'amountToBuyInCrypto': _amountToBuyInCrypto,
        'cryptoAddress': _cryptoAddress,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'amountToBuyCurrency': serializeParam(
          _amountToBuyCurrency,
          ParamType.double,
        ),
        'amountToBuyinDollars': serializeParam(
          _amountToBuyinDollars,
          ParamType.double,
        ),
        'amountToBuyInCrypto': serializeParam(
          _amountToBuyInCrypto,
          ParamType.double,
        ),
        'cryptoAddress': serializeParam(
          _cryptoAddress,
          ParamType.double,
        ),
      }.withoutNulls;

  static BuyTransactionInitiatedStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      BuyTransactionInitiatedStruct(
        amountToBuyCurrency: deserializeParam(
          data['amountToBuyCurrency'],
          ParamType.double,
          false,
        ),
        amountToBuyinDollars: deserializeParam(
          data['amountToBuyinDollars'],
          ParamType.double,
          false,
        ),
        amountToBuyInCrypto: deserializeParam(
          data['amountToBuyInCrypto'],
          ParamType.double,
          false,
        ),
        cryptoAddress: deserializeParam(
          data['cryptoAddress'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'BuyTransactionInitiatedStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BuyTransactionInitiatedStruct &&
        amountToBuyCurrency == other.amountToBuyCurrency &&
        amountToBuyinDollars == other.amountToBuyinDollars &&
        amountToBuyInCrypto == other.amountToBuyInCrypto &&
        cryptoAddress == other.cryptoAddress;
  }

  @override
  int get hashCode => const ListEquality().hash([
        amountToBuyCurrency,
        amountToBuyinDollars,
        amountToBuyInCrypto,
        cryptoAddress
      ]);
}

BuyTransactionInitiatedStruct createBuyTransactionInitiatedStruct({
  double? amountToBuyCurrency,
  double? amountToBuyinDollars,
  double? amountToBuyInCrypto,
  double? cryptoAddress,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BuyTransactionInitiatedStruct(
      amountToBuyCurrency: amountToBuyCurrency,
      amountToBuyinDollars: amountToBuyinDollars,
      amountToBuyInCrypto: amountToBuyInCrypto,
      cryptoAddress: cryptoAddress,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BuyTransactionInitiatedStruct? updateBuyTransactionInitiatedStruct(
  BuyTransactionInitiatedStruct? buyTransactionInitiated, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    buyTransactionInitiated
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBuyTransactionInitiatedStructData(
  Map<String, dynamic> firestoreData,
  BuyTransactionInitiatedStruct? buyTransactionInitiated,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (buyTransactionInitiated == null) {
    return;
  }
  if (buyTransactionInitiated.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      buyTransactionInitiated.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final buyTransactionInitiatedData = getBuyTransactionInitiatedFirestoreData(
      buyTransactionInitiated, forFieldValue);
  final nestedData =
      buyTransactionInitiatedData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      buyTransactionInitiated.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBuyTransactionInitiatedFirestoreData(
  BuyTransactionInitiatedStruct? buyTransactionInitiated, [
  bool forFieldValue = false,
]) {
  if (buyTransactionInitiated == null) {
    return {};
  }
  final firestoreData = mapToFirestore(buyTransactionInitiated.toMap());

  // Add any Firestore field values
  buyTransactionInitiated.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBuyTransactionInitiatedListFirestoreData(
  List<BuyTransactionInitiatedStruct>? buyTransactionInitiateds,
) =>
    buyTransactionInitiateds
        ?.map((e) => getBuyTransactionInitiatedFirestoreData(e, true))
        .toList() ??
    [];
