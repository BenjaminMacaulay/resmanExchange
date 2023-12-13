import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserNamesRecord extends FirestoreRecord {
  UserNamesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "UserNameString" field.
  String? _userNameString;
  String get userNameString => _userNameString ?? '';
  bool hasUserNameString() => _userNameString != null;

  void _initializeFields() {
    _userNameString = snapshotData['UserNameString'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('userNames');

  static Stream<UserNamesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserNamesRecord.fromSnapshot(s));

  static Future<UserNamesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserNamesRecord.fromSnapshot(s));

  static UserNamesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserNamesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserNamesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserNamesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserNamesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserNamesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserNamesRecordData({
  String? userNameString,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'UserNameString': userNameString,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserNamesRecordDocumentEquality implements Equality<UserNamesRecord> {
  const UserNamesRecordDocumentEquality();

  @override
  bool equals(UserNamesRecord? e1, UserNamesRecord? e2) {
    return e1?.userNameString == e2?.userNameString;
  }

  @override
  int hash(UserNamesRecord? e) =>
      const ListEquality().hash([e?.userNameString]);

  @override
  bool isValidKey(Object? o) => o is UserNamesRecord;
}
