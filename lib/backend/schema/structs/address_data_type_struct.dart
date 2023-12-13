// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AddressDataTypeStruct extends FFFirebaseStruct {
  AddressDataTypeStruct({
    String? country,
    String? city,
    String? state,
    String? streetAddress,
    String? fullAddress,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _country = country,
        _city = city,
        _state = state,
        _streetAddress = streetAddress,
        _fullAddress = fullAddress,
        super(firestoreUtilData);

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  set country(String? val) => _country = val;
  bool hasCountry() => _country != null;

  // "City" field.
  String? _city;
  String get city => _city ?? '';
  set city(String? val) => _city = val;
  bool hasCity() => _city != null;

  // "State" field.
  String? _state;
  String get state => _state ?? '';
  set state(String? val) => _state = val;
  bool hasState() => _state != null;

  // "StreetAddress" field.
  String? _streetAddress;
  String get streetAddress => _streetAddress ?? '';
  set streetAddress(String? val) => _streetAddress = val;
  bool hasStreetAddress() => _streetAddress != null;

  // "FullAddress" field.
  String? _fullAddress;
  String get fullAddress => _fullAddress ?? '';
  set fullAddress(String? val) => _fullAddress = val;
  bool hasFullAddress() => _fullAddress != null;

  static AddressDataTypeStruct fromMap(Map<String, dynamic> data) =>
      AddressDataTypeStruct(
        country: data['country'] as String?,
        city: data['City'] as String?,
        state: data['State'] as String?,
        streetAddress: data['StreetAddress'] as String?,
        fullAddress: data['FullAddress'] as String?,
      );

  static AddressDataTypeStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? AddressDataTypeStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'country': _country,
        'City': _city,
        'State': _state,
        'StreetAddress': _streetAddress,
        'FullAddress': _fullAddress,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'country': serializeParam(
          _country,
          ParamType.String,
        ),
        'City': serializeParam(
          _city,
          ParamType.String,
        ),
        'State': serializeParam(
          _state,
          ParamType.String,
        ),
        'StreetAddress': serializeParam(
          _streetAddress,
          ParamType.String,
        ),
        'FullAddress': serializeParam(
          _fullAddress,
          ParamType.String,
        ),
      }.withoutNulls;

  static AddressDataTypeStruct fromSerializableMap(Map<String, dynamic> data) =>
      AddressDataTypeStruct(
        country: deserializeParam(
          data['country'],
          ParamType.String,
          false,
        ),
        city: deserializeParam(
          data['City'],
          ParamType.String,
          false,
        ),
        state: deserializeParam(
          data['State'],
          ParamType.String,
          false,
        ),
        streetAddress: deserializeParam(
          data['StreetAddress'],
          ParamType.String,
          false,
        ),
        fullAddress: deserializeParam(
          data['FullAddress'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AddressDataTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AddressDataTypeStruct &&
        country == other.country &&
        city == other.city &&
        state == other.state &&
        streetAddress == other.streetAddress &&
        fullAddress == other.fullAddress;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([country, city, state, streetAddress, fullAddress]);
}

AddressDataTypeStruct createAddressDataTypeStruct({
  String? country,
  String? city,
  String? state,
  String? streetAddress,
  String? fullAddress,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AddressDataTypeStruct(
      country: country,
      city: city,
      state: state,
      streetAddress: streetAddress,
      fullAddress: fullAddress,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AddressDataTypeStruct? updateAddressDataTypeStruct(
  AddressDataTypeStruct? addressDataType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    addressDataType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAddressDataTypeStructData(
  Map<String, dynamic> firestoreData,
  AddressDataTypeStruct? addressDataType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (addressDataType == null) {
    return;
  }
  if (addressDataType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && addressDataType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final addressDataTypeData =
      getAddressDataTypeFirestoreData(addressDataType, forFieldValue);
  final nestedData =
      addressDataTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = addressDataType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAddressDataTypeFirestoreData(
  AddressDataTypeStruct? addressDataType, [
  bool forFieldValue = false,
]) {
  if (addressDataType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(addressDataType.toMap());

  // Add any Firestore field values
  addressDataType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAddressDataTypeListFirestoreData(
  List<AddressDataTypeStruct>? addressDataTypes,
) =>
    addressDataTypes
        ?.map((e) => getAddressDataTypeFirestoreData(e, true))
        .toList() ??
    [];
