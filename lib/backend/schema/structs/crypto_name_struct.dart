// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CryptoNameStruct extends FFFirebaseStruct {
  CryptoNameStruct({
    String? name,
    DocumentReference? cryptoChosenRef,
    String? imageCoin,
    String? symbol,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _cryptoChosenRef = cryptoChosenRef,
        _imageCoin = imageCoin,
        _symbol = symbol,
        super(firestoreUtilData);

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "cryptoChosenRef" field.
  DocumentReference? _cryptoChosenRef;
  DocumentReference? get cryptoChosenRef => _cryptoChosenRef;
  set cryptoChosenRef(DocumentReference? val) => _cryptoChosenRef = val;
  bool hasCryptoChosenRef() => _cryptoChosenRef != null;

  // "ImageCoin" field.
  String? _imageCoin;
  String get imageCoin => _imageCoin ?? '';
  set imageCoin(String? val) => _imageCoin = val;
  bool hasImageCoin() => _imageCoin != null;

  // "symbol" field.
  String? _symbol;
  String get symbol => _symbol ?? '';
  set symbol(String? val) => _symbol = val;
  bool hasSymbol() => _symbol != null;

  static CryptoNameStruct fromMap(Map<String, dynamic> data) =>
      CryptoNameStruct(
        name: data['Name'] as String?,
        cryptoChosenRef: data['cryptoChosenRef'] as DocumentReference?,
        imageCoin: data['ImageCoin'] as String?,
        symbol: data['symbol'] as String?,
      );

  static CryptoNameStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? CryptoNameStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'Name': _name,
        'cryptoChosenRef': _cryptoChosenRef,
        'ImageCoin': _imageCoin,
        'symbol': _symbol,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Name': serializeParam(
          _name,
          ParamType.String,
        ),
        'cryptoChosenRef': serializeParam(
          _cryptoChosenRef,
          ParamType.DocumentReference,
        ),
        'ImageCoin': serializeParam(
          _imageCoin,
          ParamType.String,
        ),
        'symbol': serializeParam(
          _symbol,
          ParamType.String,
        ),
      }.withoutNulls;

  static CryptoNameStruct fromSerializableMap(Map<String, dynamic> data) =>
      CryptoNameStruct(
        name: deserializeParam(
          data['Name'],
          ParamType.String,
          false,
        ),
        cryptoChosenRef: deserializeParam(
          data['cryptoChosenRef'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['CryptocurrenciesCollection'],
        ),
        imageCoin: deserializeParam(
          data['ImageCoin'],
          ParamType.String,
          false,
        ),
        symbol: deserializeParam(
          data['symbol'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CryptoNameStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CryptoNameStruct &&
        name == other.name &&
        cryptoChosenRef == other.cryptoChosenRef &&
        imageCoin == other.imageCoin &&
        symbol == other.symbol;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([name, cryptoChosenRef, imageCoin, symbol]);
}

CryptoNameStruct createCryptoNameStruct({
  String? name,
  DocumentReference? cryptoChosenRef,
  String? imageCoin,
  String? symbol,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CryptoNameStruct(
      name: name,
      cryptoChosenRef: cryptoChosenRef,
      imageCoin: imageCoin,
      symbol: symbol,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CryptoNameStruct? updateCryptoNameStruct(
  CryptoNameStruct? cryptoName, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    cryptoName
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCryptoNameStructData(
  Map<String, dynamic> firestoreData,
  CryptoNameStruct? cryptoName,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (cryptoName == null) {
    return;
  }
  if (cryptoName.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && cryptoName.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final cryptoNameData = getCryptoNameFirestoreData(cryptoName, forFieldValue);
  final nestedData = cryptoNameData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = cryptoName.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCryptoNameFirestoreData(
  CryptoNameStruct? cryptoName, [
  bool forFieldValue = false,
]) {
  if (cryptoName == null) {
    return {};
  }
  final firestoreData = mapToFirestore(cryptoName.toMap());

  // Add any Firestore field values
  cryptoName.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCryptoNameListFirestoreData(
  List<CryptoNameStruct>? cryptoNames,
) =>
    cryptoNames?.map((e) => getCryptoNameFirestoreData(e, true)).toList() ?? [];
