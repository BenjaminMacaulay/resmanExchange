import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GovtIssuedIDSRecord extends FirestoreRecord {
  GovtIssuedIDSRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "acceptedCountriesCode" field.
  List<String>? _acceptedCountriesCode;
  List<String> get acceptedCountriesCode => _acceptedCountriesCode ?? const [];
  bool hasAcceptedCountriesCode() => _acceptedCountriesCode != null;

  // "NameOfTheDocument" field.
  String? _nameOfTheDocument;
  String get nameOfTheDocument => _nameOfTheDocument ?? '';
  bool hasNameOfTheDocument() => _nameOfTheDocument != null;

  // "dateIssued" field.
  DateTime? _dateIssued;
  DateTime? get dateIssued => _dateIssued;
  bool hasDateIssued() => _dateIssued != null;

  // "verificationUserSession" field.
  DocumentReference? _verificationUserSession;
  DocumentReference? get verificationUserSession => _verificationUserSession;
  bool hasVerificationUserSession() => _verificationUserSession != null;

  void _initializeFields() {
    _acceptedCountriesCode = getDataList(snapshotData['acceptedCountriesCode']);
    _nameOfTheDocument = snapshotData['NameOfTheDocument'] as String?;
    _dateIssued = snapshotData['dateIssued'] as DateTime?;
    _verificationUserSession =
        snapshotData['verificationUserSession'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('GovtIssuedIDS');

  static Stream<GovtIssuedIDSRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GovtIssuedIDSRecord.fromSnapshot(s));

  static Future<GovtIssuedIDSRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GovtIssuedIDSRecord.fromSnapshot(s));

  static GovtIssuedIDSRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GovtIssuedIDSRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GovtIssuedIDSRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GovtIssuedIDSRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GovtIssuedIDSRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GovtIssuedIDSRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGovtIssuedIDSRecordData({
  String? nameOfTheDocument,
  DateTime? dateIssued,
  DocumentReference? verificationUserSession,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'NameOfTheDocument': nameOfTheDocument,
      'dateIssued': dateIssued,
      'verificationUserSession': verificationUserSession,
    }.withoutNulls,
  );

  return firestoreData;
}

class GovtIssuedIDSRecordDocumentEquality
    implements Equality<GovtIssuedIDSRecord> {
  const GovtIssuedIDSRecordDocumentEquality();

  @override
  bool equals(GovtIssuedIDSRecord? e1, GovtIssuedIDSRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(
            e1?.acceptedCountriesCode, e2?.acceptedCountriesCode) &&
        e1?.nameOfTheDocument == e2?.nameOfTheDocument &&
        e1?.dateIssued == e2?.dateIssued &&
        e1?.verificationUserSession == e2?.verificationUserSession;
  }

  @override
  int hash(GovtIssuedIDSRecord? e) => const ListEquality().hash([
        e?.acceptedCountriesCode,
        e?.nameOfTheDocument,
        e?.dateIssued,
        e?.verificationUserSession
      ]);

  @override
  bool isValidKey(Object? o) => o is GovtIssuedIDSRecord;
}
