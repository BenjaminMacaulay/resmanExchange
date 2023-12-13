import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CountriesCurrencyRecord extends FirestoreRecord {
  CountriesCurrencyRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "countryCurrency" field.
  CountryCurrencyDataTypeStruct? _countryCurrency;
  CountryCurrencyDataTypeStruct get countryCurrency =>
      _countryCurrency ?? CountryCurrencyDataTypeStruct();
  bool hasCountryCurrency() => _countryCurrency != null;

  // "UserUID" field.
  String? _userUID;
  String get userUID => _userUID ?? '';
  bool hasUserUID() => _userUID != null;

  // "CreatedDate" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  // "countryCode_VerifyIdentity" field.
  String? _countryCodeVerifyIdentity;
  String get countryCodeVerifyIdentity => _countryCodeVerifyIdentity ?? '';
  bool hasCountryCodeVerifyIdentity() => _countryCodeVerifyIdentity != null;

  // "accepted" field.
  bool? _accepted;
  bool get accepted => _accepted ?? false;
  bool hasAccepted() => _accepted != null;

  void _initializeFields() {
    _countryCurrency = CountryCurrencyDataTypeStruct.maybeFromMap(
        snapshotData['countryCurrency']);
    _userUID = snapshotData['UserUID'] as String?;
    _createdDate = snapshotData['CreatedDate'] as DateTime?;
    _countryCodeVerifyIdentity =
        snapshotData['countryCode_VerifyIdentity'] as String?;
    _accepted = snapshotData['accepted'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Countries_Currency');

  static Stream<CountriesCurrencyRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CountriesCurrencyRecord.fromSnapshot(s));

  static Future<CountriesCurrencyRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CountriesCurrencyRecord.fromSnapshot(s));

  static CountriesCurrencyRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CountriesCurrencyRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CountriesCurrencyRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CountriesCurrencyRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CountriesCurrencyRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CountriesCurrencyRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCountriesCurrencyRecordData({
  CountryCurrencyDataTypeStruct? countryCurrency,
  String? userUID,
  DateTime? createdDate,
  String? countryCodeVerifyIdentity,
  bool? accepted,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'countryCurrency': CountryCurrencyDataTypeStruct().toMap(),
      'UserUID': userUID,
      'CreatedDate': createdDate,
      'countryCode_VerifyIdentity': countryCodeVerifyIdentity,
      'accepted': accepted,
    }.withoutNulls,
  );

  // Handle nested data for "countryCurrency" field.
  addCountryCurrencyDataTypeStructData(
      firestoreData, countryCurrency, 'countryCurrency');

  return firestoreData;
}

class CountriesCurrencyRecordDocumentEquality
    implements Equality<CountriesCurrencyRecord> {
  const CountriesCurrencyRecordDocumentEquality();

  @override
  bool equals(CountriesCurrencyRecord? e1, CountriesCurrencyRecord? e2) {
    return e1?.countryCurrency == e2?.countryCurrency &&
        e1?.userUID == e2?.userUID &&
        e1?.createdDate == e2?.createdDate &&
        e1?.countryCodeVerifyIdentity == e2?.countryCodeVerifyIdentity &&
        e1?.accepted == e2?.accepted;
  }

  @override
  int hash(CountriesCurrencyRecord? e) => const ListEquality().hash([
        e?.countryCurrency,
        e?.userUID,
        e?.createdDate,
        e?.countryCodeVerifyIdentity,
        e?.accepted
      ]);

  @override
  bool isValidKey(Object? o) => o is CountriesCurrencyRecord;
}
