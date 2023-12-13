import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AppVersionNumberRecord extends FirestoreRecord {
  AppVersionNumberRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "AppVersionNumber" field.
  double? _appVersionNumber;
  double get appVersionNumber => _appVersionNumber ?? 0.0;
  bool hasAppVersionNumber() => _appVersionNumber != null;

  // "createdDate" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  void _initializeFields() {
    _appVersionNumber = castToType<double>(snapshotData['AppVersionNumber']);
    _createdDate = snapshotData['createdDate'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('AppVersionNumber');

  static Stream<AppVersionNumberRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AppVersionNumberRecord.fromSnapshot(s));

  static Future<AppVersionNumberRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => AppVersionNumberRecord.fromSnapshot(s));

  static AppVersionNumberRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AppVersionNumberRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AppVersionNumberRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AppVersionNumberRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AppVersionNumberRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AppVersionNumberRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAppVersionNumberRecordData({
  double? appVersionNumber,
  DateTime? createdDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'AppVersionNumber': appVersionNumber,
      'createdDate': createdDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class AppVersionNumberRecordDocumentEquality
    implements Equality<AppVersionNumberRecord> {
  const AppVersionNumberRecordDocumentEquality();

  @override
  bool equals(AppVersionNumberRecord? e1, AppVersionNumberRecord? e2) {
    return e1?.appVersionNumber == e2?.appVersionNumber &&
        e1?.createdDate == e2?.createdDate;
  }

  @override
  int hash(AppVersionNumberRecord? e) =>
      const ListEquality().hash([e?.appVersionNumber, e?.createdDate]);

  @override
  bool isValidKey(Object? o) => o is AppVersionNumberRecord;
}
