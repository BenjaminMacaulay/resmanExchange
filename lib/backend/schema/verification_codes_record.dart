import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VerificationCodesRecord extends FirestoreRecord {
  VerificationCodesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "token" field.
  String? _token;
  String get token => _token ?? '';
  bool hasToken() => _token != null;

  // "UserUID" field.
  String? _userUID;
  String get userUID => _userUID ?? '';
  bool hasUserUID() => _userUID != null;

  // "CreatedDate" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  // "EmailOrPhone" field.
  String? _emailOrPhone;
  String get emailOrPhone => _emailOrPhone ?? '';
  bool hasEmailOrPhone() => _emailOrPhone != null;

  void _initializeFields() {
    _token = snapshotData['token'] as String?;
    _userUID = snapshotData['UserUID'] as String?;
    _createdDate = snapshotData['CreatedDate'] as DateTime?;
    _emailOrPhone = snapshotData['EmailOrPhone'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('VerificationCodes');

  static Stream<VerificationCodesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VerificationCodesRecord.fromSnapshot(s));

  static Future<VerificationCodesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => VerificationCodesRecord.fromSnapshot(s));

  static VerificationCodesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VerificationCodesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VerificationCodesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VerificationCodesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VerificationCodesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VerificationCodesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVerificationCodesRecordData({
  String? token,
  String? userUID,
  DateTime? createdDate,
  String? emailOrPhone,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'token': token,
      'UserUID': userUID,
      'CreatedDate': createdDate,
      'EmailOrPhone': emailOrPhone,
    }.withoutNulls,
  );

  return firestoreData;
}

class VerificationCodesRecordDocumentEquality
    implements Equality<VerificationCodesRecord> {
  const VerificationCodesRecordDocumentEquality();

  @override
  bool equals(VerificationCodesRecord? e1, VerificationCodesRecord? e2) {
    return e1?.token == e2?.token &&
        e1?.userUID == e2?.userUID &&
        e1?.createdDate == e2?.createdDate &&
        e1?.emailOrPhone == e2?.emailOrPhone;
  }

  @override
  int hash(VerificationCodesRecord? e) => const ListEquality()
      .hash([e?.token, e?.userUID, e?.createdDate, e?.emailOrPhone]);

  @override
  bool isValidKey(Object? o) => o is VerificationCodesRecord;
}
