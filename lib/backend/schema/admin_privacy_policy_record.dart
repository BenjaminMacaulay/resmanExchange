import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AdminPrivacyPolicyRecord extends FirestoreRecord {
  AdminPrivacyPolicyRecord._(
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
      FirebaseFirestore.instance.collection('Admin_PrivacyPolicy');

  static Stream<AdminPrivacyPolicyRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AdminPrivacyPolicyRecord.fromSnapshot(s));

  static Future<AdminPrivacyPolicyRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => AdminPrivacyPolicyRecord.fromSnapshot(s));

  static AdminPrivacyPolicyRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AdminPrivacyPolicyRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AdminPrivacyPolicyRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AdminPrivacyPolicyRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AdminPrivacyPolicyRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AdminPrivacyPolicyRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAdminPrivacyPolicyRecordData({
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

class AdminPrivacyPolicyRecordDocumentEquality
    implements Equality<AdminPrivacyPolicyRecord> {
  const AdminPrivacyPolicyRecordDocumentEquality();

  @override
  bool equals(AdminPrivacyPolicyRecord? e1, AdminPrivacyPolicyRecord? e2) {
    return e1?.number == e2?.number &&
        e1?.title == e2?.title &&
        e1?.createdDate == e2?.createdDate &&
        e1?.body == e2?.body;
  }

  @override
  int hash(AdminPrivacyPolicyRecord? e) =>
      const ListEquality().hash([e?.number, e?.title, e?.createdDate, e?.body]);

  @override
  bool isValidKey(Object? o) => o is AdminPrivacyPolicyRecord;
}
