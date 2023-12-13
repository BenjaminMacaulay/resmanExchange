import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AdminAboutUsRecord extends FirestoreRecord {
  AdminAboutUsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Number" field.
  int? _number;
  int get number => _number ?? 0;
  bool hasNumber() => _number != null;

  // "Title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "CreatedDate" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  // "Body" field.
  String? _body;
  String get body => _body ?? '';
  bool hasBody() => _body != null;

  void _initializeFields() {
    _number = castToType<int>(snapshotData['Number']);
    _title = snapshotData['Title'] as String?;
    _createdDate = snapshotData['CreatedDate'] as DateTime?;
    _body = snapshotData['Body'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Admin_AboutUs');

  static Stream<AdminAboutUsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AdminAboutUsRecord.fromSnapshot(s));

  static Future<AdminAboutUsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AdminAboutUsRecord.fromSnapshot(s));

  static AdminAboutUsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AdminAboutUsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AdminAboutUsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AdminAboutUsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AdminAboutUsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AdminAboutUsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAdminAboutUsRecordData({
  int? number,
  String? title,
  DateTime? createdDate,
  String? body,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Number': number,
      'Title': title,
      'CreatedDate': createdDate,
      'Body': body,
    }.withoutNulls,
  );

  return firestoreData;
}

class AdminAboutUsRecordDocumentEquality
    implements Equality<AdminAboutUsRecord> {
  const AdminAboutUsRecordDocumentEquality();

  @override
  bool equals(AdminAboutUsRecord? e1, AdminAboutUsRecord? e2) {
    return e1?.number == e2?.number &&
        e1?.title == e2?.title &&
        e1?.createdDate == e2?.createdDate &&
        e1?.body == e2?.body;
  }

  @override
  int hash(AdminAboutUsRecord? e) =>
      const ListEquality().hash([e?.number, e?.title, e?.createdDate, e?.body]);

  @override
  bool isValidKey(Object? o) => o is AdminAboutUsRecord;
}
