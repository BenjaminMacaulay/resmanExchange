import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UpdatedProfileRecord extends FirestoreRecord {
  UpdatedProfileRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "PropertyToChange" field.
  String? _propertyToChange;
  String get propertyToChange => _propertyToChange ?? '';
  bool hasPropertyToChange() => _propertyToChange != null;

  // "dateCreated" field.
  DateTime? _dateCreated;
  DateTime? get dateCreated => _dateCreated;
  bool hasDateCreated() => _dateCreated != null;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _propertyToChange = snapshotData['PropertyToChange'] as String?;
    _dateCreated = snapshotData['dateCreated'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('updatedProfile');

  static Stream<UpdatedProfileRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UpdatedProfileRecord.fromSnapshot(s));

  static Future<UpdatedProfileRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UpdatedProfileRecord.fromSnapshot(s));

  static UpdatedProfileRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UpdatedProfileRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UpdatedProfileRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UpdatedProfileRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UpdatedProfileRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UpdatedProfileRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUpdatedProfileRecordData({
  DocumentReference? userRef,
  String? propertyToChange,
  DateTime? dateCreated,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'PropertyToChange': propertyToChange,
      'dateCreated': dateCreated,
    }.withoutNulls,
  );

  return firestoreData;
}

class UpdatedProfileRecordDocumentEquality
    implements Equality<UpdatedProfileRecord> {
  const UpdatedProfileRecordDocumentEquality();

  @override
  bool equals(UpdatedProfileRecord? e1, UpdatedProfileRecord? e2) {
    return e1?.userRef == e2?.userRef &&
        e1?.propertyToChange == e2?.propertyToChange &&
        e1?.dateCreated == e2?.dateCreated;
  }

  @override
  int hash(UpdatedProfileRecord? e) => const ListEquality()
      .hash([e?.userRef, e?.propertyToChange, e?.dateCreated]);

  @override
  bool isValidKey(Object? o) => o is UpdatedProfileRecord;
}
