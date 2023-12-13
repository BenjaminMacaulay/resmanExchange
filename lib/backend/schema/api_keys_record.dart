import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ApiKeysRecord extends FirestoreRecord {
  ApiKeysRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "key" field.
  String? _key;
  String get key => _key ?? '';
  bool hasKey() => _key != null;

  void _initializeFields() {
    _type = snapshotData['type'] as String?;
    _key = snapshotData['key'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('apiKeys');

  static Stream<ApiKeysRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ApiKeysRecord.fromSnapshot(s));

  static Future<ApiKeysRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ApiKeysRecord.fromSnapshot(s));

  static ApiKeysRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ApiKeysRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ApiKeysRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ApiKeysRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ApiKeysRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ApiKeysRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createApiKeysRecordData({
  String? type,
  String? key,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'type': type,
      'key': key,
    }.withoutNulls,
  );

  return firestoreData;
}

class ApiKeysRecordDocumentEquality implements Equality<ApiKeysRecord> {
  const ApiKeysRecordDocumentEquality();

  @override
  bool equals(ApiKeysRecord? e1, ApiKeysRecord? e2) {
    return e1?.type == e2?.type && e1?.key == e2?.key;
  }

  @override
  int hash(ApiKeysRecord? e) => const ListEquality().hash([e?.type, e?.key]);

  @override
  bool isValidKey(Object? o) => o is ApiKeysRecord;
}
