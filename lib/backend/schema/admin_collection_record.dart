import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AdminCollectionRecord extends FirestoreRecord {
  AdminCollectionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Username" field.
  String? _username;
  String get username => _username ?? '';
  bool hasUsername() => _username != null;

  // "Password" field.
  String? _password;
  String get password => _password ?? '';
  bool hasPassword() => _password != null;

  // "CreatedDate" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  // "UserUID" field.
  String? _userUID;
  String get userUID => _userUID ?? '';
  bool hasUserUID() => _userUID != null;

  void _initializeFields() {
    _username = snapshotData['Username'] as String?;
    _password = snapshotData['Password'] as String?;
    _createdDate = snapshotData['CreatedDate'] as DateTime?;
    _userUID = snapshotData['UserUID'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('AdminCollection');

  static Stream<AdminCollectionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AdminCollectionRecord.fromSnapshot(s));

  static Future<AdminCollectionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AdminCollectionRecord.fromSnapshot(s));

  static AdminCollectionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AdminCollectionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AdminCollectionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AdminCollectionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AdminCollectionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AdminCollectionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAdminCollectionRecordData({
  String? username,
  String? password,
  DateTime? createdDate,
  String? userUID,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Username': username,
      'Password': password,
      'CreatedDate': createdDate,
      'UserUID': userUID,
    }.withoutNulls,
  );

  return firestoreData;
}

class AdminCollectionRecordDocumentEquality
    implements Equality<AdminCollectionRecord> {
  const AdminCollectionRecordDocumentEquality();

  @override
  bool equals(AdminCollectionRecord? e1, AdminCollectionRecord? e2) {
    return e1?.username == e2?.username &&
        e1?.password == e2?.password &&
        e1?.createdDate == e2?.createdDate &&
        e1?.userUID == e2?.userUID;
  }

  @override
  int hash(AdminCollectionRecord? e) => const ListEquality()
      .hash([e?.username, e?.password, e?.createdDate, e?.userUID]);

  @override
  bool isValidKey(Object? o) => o is AdminCollectionRecord;
}
