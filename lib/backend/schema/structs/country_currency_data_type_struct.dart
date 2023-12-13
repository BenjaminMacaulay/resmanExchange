// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CountryCurrencyDataTypeStruct extends FFFirebaseStruct {
  CountryCurrencyDataTypeStruct({
    String? countryName,
    String? currencyCode,
    String? countryFlag,
    String? blurHash,
    DocumentReference? currencyRef,
    double? rateBuy,
    double? rateSell,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _countryName = countryName,
        _currencyCode = currencyCode,
        _countryFlag = countryFlag,
        _blurHash = blurHash,
        _currencyRef = currencyRef,
        _rateBuy = rateBuy,
        _rateSell = rateSell,
        super(firestoreUtilData);

  // "CountryName" field.
  String? _countryName;
  String get countryName => _countryName ?? '';
  set countryName(String? val) => _countryName = val;
  bool hasCountryName() => _countryName != null;

  // "CurrencyCode" field.
  String? _currencyCode;
  String get currencyCode => _currencyCode ?? '';
  set currencyCode(String? val) => _currencyCode = val;
  bool hasCurrencyCode() => _currencyCode != null;

  // "countryFlag" field.
  String? _countryFlag;
  String get countryFlag => _countryFlag ?? '';
  set countryFlag(String? val) => _countryFlag = val;
  bool hasCountryFlag() => _countryFlag != null;

  // "blurHash" field.
  String? _blurHash;
  String get blurHash => _blurHash ?? '';
  set blurHash(String? val) => _blurHash = val;
  bool hasBlurHash() => _blurHash != null;

  // "CurrencyRef" field.
  DocumentReference? _currencyRef;
  DocumentReference? get currencyRef => _currencyRef;
  set currencyRef(DocumentReference? val) => _currencyRef = val;
  bool hasCurrencyRef() => _currencyRef != null;

  // "rate_buy" field.
  double? _rateBuy;
  double get rateBuy => _rateBuy ?? 0.0;
  set rateBuy(double? val) => _rateBuy = val;
  void incrementRateBuy(double amount) => _rateBuy = rateBuy + amount;
  bool hasRateBuy() => _rateBuy != null;

  // "rate_sell" field.
  double? _rateSell;
  double get rateSell => _rateSell ?? 0.0;
  set rateSell(double? val) => _rateSell = val;
  void incrementRateSell(double amount) => _rateSell = rateSell + amount;
  bool hasRateSell() => _rateSell != null;

  static CountryCurrencyDataTypeStruct fromMap(Map<String, dynamic> data) =>
      CountryCurrencyDataTypeStruct(
        countryName: data['CountryName'] as String?,
        currencyCode: data['CurrencyCode'] as String?,
        countryFlag: data['countryFlag'] as String?,
        blurHash: data['blurHash'] as String?,
        currencyRef: data['CurrencyRef'] as DocumentReference?,
        rateBuy: castToType<double>(data['rate_buy']),
        rateSell: castToType<double>(data['rate_sell']),
      );

  static CountryCurrencyDataTypeStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic>
          ? CountryCurrencyDataTypeStruct.fromMap(data)
          : null;

  Map<String, dynamic> toMap() => {
        'CountryName': _countryName,
        'CurrencyCode': _currencyCode,
        'countryFlag': _countryFlag,
        'blurHash': _blurHash,
        'CurrencyRef': _currencyRef,
        'rate_buy': _rateBuy,
        'rate_sell': _rateSell,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'CountryName': serializeParam(
          _countryName,
          ParamType.String,
        ),
        'CurrencyCode': serializeParam(
          _currencyCode,
          ParamType.String,
        ),
        'countryFlag': serializeParam(
          _countryFlag,
          ParamType.String,
        ),
        'blurHash': serializeParam(
          _blurHash,
          ParamType.String,
        ),
        'CurrencyRef': serializeParam(
          _currencyRef,
          ParamType.DocumentReference,
        ),
        'rate_buy': serializeParam(
          _rateBuy,
          ParamType.double,
        ),
        'rate_sell': serializeParam(
          _rateSell,
          ParamType.double,
        ),
      }.withoutNulls;

  static CountryCurrencyDataTypeStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      CountryCurrencyDataTypeStruct(
        countryName: deserializeParam(
          data['CountryName'],
          ParamType.String,
          false,
        ),
        currencyCode: deserializeParam(
          data['CurrencyCode'],
          ParamType.String,
          false,
        ),
        countryFlag: deserializeParam(
          data['countryFlag'],
          ParamType.String,
          false,
        ),
        blurHash: deserializeParam(
          data['blurHash'],
          ParamType.String,
          false,
        ),
        currencyRef: deserializeParam(
          data['CurrencyRef'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Countries_Currency'],
        ),
        rateBuy: deserializeParam(
          data['rate_buy'],
          ParamType.double,
          false,
        ),
        rateSell: deserializeParam(
          data['rate_sell'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'CountryCurrencyDataTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CountryCurrencyDataTypeStruct &&
        countryName == other.countryName &&
        currencyCode == other.currencyCode &&
        countryFlag == other.countryFlag &&
        blurHash == other.blurHash &&
        currencyRef == other.currencyRef &&
        rateBuy == other.rateBuy &&
        rateSell == other.rateSell;
  }

  @override
  int get hashCode => const ListEquality().hash([
        countryName,
        currencyCode,
        countryFlag,
        blurHash,
        currencyRef,
        rateBuy,
        rateSell
      ]);
}

CountryCurrencyDataTypeStruct createCountryCurrencyDataTypeStruct({
  String? countryName,
  String? currencyCode,
  String? countryFlag,
  String? blurHash,
  DocumentReference? currencyRef,
  double? rateBuy,
  double? rateSell,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CountryCurrencyDataTypeStruct(
      countryName: countryName,
      currencyCode: currencyCode,
      countryFlag: countryFlag,
      blurHash: blurHash,
      currencyRef: currencyRef,
      rateBuy: rateBuy,
      rateSell: rateSell,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CountryCurrencyDataTypeStruct? updateCountryCurrencyDataTypeStruct(
  CountryCurrencyDataTypeStruct? countryCurrencyDataType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    countryCurrencyDataType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCountryCurrencyDataTypeStructData(
  Map<String, dynamic> firestoreData,
  CountryCurrencyDataTypeStruct? countryCurrencyDataType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (countryCurrencyDataType == null) {
    return;
  }
  if (countryCurrencyDataType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      countryCurrencyDataType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final countryCurrencyDataTypeData = getCountryCurrencyDataTypeFirestoreData(
      countryCurrencyDataType, forFieldValue);
  final nestedData =
      countryCurrencyDataTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      countryCurrencyDataType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCountryCurrencyDataTypeFirestoreData(
  CountryCurrencyDataTypeStruct? countryCurrencyDataType, [
  bool forFieldValue = false,
]) {
  if (countryCurrencyDataType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(countryCurrencyDataType.toMap());

  // Add any Firestore field values
  countryCurrencyDataType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCountryCurrencyDataTypeListFirestoreData(
  List<CountryCurrencyDataTypeStruct>? countryCurrencyDataTypes,
) =>
    countryCurrencyDataTypes
        ?.map((e) => getCountryCurrencyDataTypeFirestoreData(e, true))
        .toList() ??
    [];
