import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AdminAnouncementsRecord extends FirestoreRecord {
  AdminAnouncementsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "Body" field.
  String? _body;
  String get body => _body ?? '';
  bool hasBody() => _body != null;

  // "CreatedDate" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  // "UserUID" field.
  String? _userUID;
  String get userUID => _userUID ?? '';
  bool hasUserUID() => _userUID != null;

  void _initializeFields() {
    _title = snapshotData['Title'] as String?;
    _body = snapshotData['Body'] as String?;
    _createdDate = snapshotData['CreatedDate'] as DateTime?;
    _userUID = snapshotData['UserUID'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('AdminAnouncements');

  static Stream<AdminAnouncementsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AdminAnouncementsRecord.fromSnapshot(s));

  static Future<AdminAnouncementsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => AdminAnouncementsRecord.fromSnapshot(s));

  static AdminAnouncementsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AdminAnouncementsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AdminAnouncementsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AdminAnouncementsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AdminAnouncementsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AdminAnouncementsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAdminAnouncementsRecordData({
  String? title,
  String? body,
  DateTime? createdDate,
  String? userUID,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Title': title,
      'Body': body,
      'CreatedDate': createdDate,
      'UserUID': userUID,
    }.withoutNulls,
  );

  return firestoreData;
}

class AdminAnouncementsRecordDocumentEquality
    implements Equality<AdminAnouncementsRecord> {
  const AdminAnouncementsRecordDocumentEquality();

  @override
  bool equals(AdminAnouncementsRecord? e1, AdminAnouncementsRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.body == e2?.body &&
        e1?.createdDate == e2?.createdDate &&
        e1?.userUID == e2?.userUID;
  }

  @override
  int hash(AdminAnouncementsRecord? e) => const ListEquality()
      .hash([e?.title, e?.body, e?.createdDate, e?.userUID]);

  @override
  bool isValidKey(Object? o) => o is AdminAnouncementsRecord;
}
