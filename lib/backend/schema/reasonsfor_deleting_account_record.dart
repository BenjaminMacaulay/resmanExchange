import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReasonsforDeletingAccountRecord extends FirestoreRecord {
  ReasonsforDeletingAccountRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "reasonString" field.
  String? _reasonString;
  String get reasonString => _reasonString ?? '';
  bool hasReasonString() => _reasonString != null;

  void _initializeFields() {
    _reasonString = snapshotData['reasonString'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ReasonsforDeletingAccount');

  static Stream<ReasonsforDeletingAccountRecord> getDocument(
          DocumentReference ref) =>
      ref
          .snapshots()
          .map((s) => ReasonsforDeletingAccountRecord.fromSnapshot(s));

  static Future<ReasonsforDeletingAccountRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ReasonsforDeletingAccountRecord.fromSnapshot(s));

  static ReasonsforDeletingAccountRecord fromSnapshot(
          DocumentSnapshot snapshot) =>
      ReasonsforDeletingAccountRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReasonsforDeletingAccountRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReasonsforDeletingAccountRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReasonsforDeletingAccountRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReasonsforDeletingAccountRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReasonsforDeletingAccountRecordData({
  String? reasonString,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'reasonString': reasonString,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReasonsforDeletingAccountRecordDocumentEquality
    implements Equality<ReasonsforDeletingAccountRecord> {
  const ReasonsforDeletingAccountRecordDocumentEquality();

  @override
  bool equals(ReasonsforDeletingAccountRecord? e1,
      ReasonsforDeletingAccountRecord? e2) {
    return e1?.reasonString == e2?.reasonString;
  }

  @override
  int hash(ReasonsforDeletingAccountRecord? e) =>
      const ListEquality().hash([e?.reasonString]);

  @override
  bool isValidKey(Object? o) => o is ReasonsforDeletingAccountRecord;
}
