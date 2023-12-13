import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AdminSocialPagesRecord extends FirestoreRecord {
  AdminSocialPagesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "SupportLink" field.
  String? _supportLink;
  String get supportLink => _supportLink ?? '';
  bool hasSupportLink() => _supportLink != null;

  // "Instagram" field.
  String? _instagram;
  String get instagram => _instagram ?? '';
  bool hasInstagram() => _instagram != null;

  // "Twitter" field.
  String? _twitter;
  String get twitter => _twitter ?? '';
  bool hasTwitter() => _twitter != null;

  void _initializeFields() {
    _email = snapshotData['Email'] as String?;
    _supportLink = snapshotData['SupportLink'] as String?;
    _instagram = snapshotData['Instagram'] as String?;
    _twitter = snapshotData['Twitter'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Admin_SocialPages');

  static Stream<AdminSocialPagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AdminSocialPagesRecord.fromSnapshot(s));

  static Future<AdminSocialPagesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => AdminSocialPagesRecord.fromSnapshot(s));

  static AdminSocialPagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AdminSocialPagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AdminSocialPagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AdminSocialPagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AdminSocialPagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AdminSocialPagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAdminSocialPagesRecordData({
  String? email,
  String? supportLink,
  String? instagram,
  String? twitter,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Email': email,
      'SupportLink': supportLink,
      'Instagram': instagram,
      'Twitter': twitter,
    }.withoutNulls,
  );

  return firestoreData;
}

class AdminSocialPagesRecordDocumentEquality
    implements Equality<AdminSocialPagesRecord> {
  const AdminSocialPagesRecordDocumentEquality();

  @override
  bool equals(AdminSocialPagesRecord? e1, AdminSocialPagesRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.supportLink == e2?.supportLink &&
        e1?.instagram == e2?.instagram &&
        e1?.twitter == e2?.twitter;
  }

  @override
  int hash(AdminSocialPagesRecord? e) => const ListEquality()
      .hash([e?.email, e?.supportLink, e?.instagram, e?.twitter]);

  @override
  bool isValidKey(Object? o) => o is AdminSocialPagesRecord;
}
