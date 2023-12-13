import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VerificationUserSessionRecord extends FirestoreRecord {
  VerificationUserSessionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userID" field.
  String? _userID;
  String get userID => _userID ?? '';
  bool hasUserID() => _userID != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "AdminNotAcceptedComment" field.
  String? _adminNotAcceptedComment;
  String get adminNotAcceptedComment => _adminNotAcceptedComment ?? '';
  bool hasAdminNotAcceptedComment() => _adminNotAcceptedComment != null;

  // "AcceptedStatus" field.
  String? _acceptedStatus;
  String get acceptedStatus => _acceptedStatus ?? '';
  bool hasAcceptedStatus() => _acceptedStatus != null;

  // "IDDocumentPicture" field.
  String? _iDDocumentPicture;
  String get iDDocumentPicture => _iDDocumentPicture ?? '';
  bool hasIDDocumentPicture() => _iDDocumentPicture != null;

  // "userProfilePicture" field.
  String? _userProfilePicture;
  String get userProfilePicture => _userProfilePicture ?? '';
  bool hasUserProfilePicture() => _userProfilePicture != null;

  // "usersName" field.
  String? _usersName;
  String get usersName => _usersName ?? '';
  bool hasUsersName() => _usersName != null;

  // "DocumentType" field.
  String? _documentType;
  String get documentType => _documentType ?? '';
  bool hasDocumentType() => _documentType != null;

  // "userREF" field.
  DocumentReference? _userREF;
  DocumentReference? get userREF => _userREF;
  bool hasUserREF() => _userREF != null;

  void _initializeFields() {
    _userID = snapshotData['userID'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _adminNotAcceptedComment =
        snapshotData['AdminNotAcceptedComment'] as String?;
    _acceptedStatus = snapshotData['AcceptedStatus'] as String?;
    _iDDocumentPicture = snapshotData['IDDocumentPicture'] as String?;
    _userProfilePicture = snapshotData['userProfilePicture'] as String?;
    _usersName = snapshotData['usersName'] as String?;
    _documentType = snapshotData['DocumentType'] as String?;
    _userREF = snapshotData['userREF'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('verificationUserSession');

  static Stream<VerificationUserSessionRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => VerificationUserSessionRecord.fromSnapshot(s));

  static Future<VerificationUserSessionRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => VerificationUserSessionRecord.fromSnapshot(s));

  static VerificationUserSessionRecord fromSnapshot(
          DocumentSnapshot snapshot) =>
      VerificationUserSessionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VerificationUserSessionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VerificationUserSessionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VerificationUserSessionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VerificationUserSessionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVerificationUserSessionRecordData({
  String? userID,
  DateTime? date,
  String? adminNotAcceptedComment,
  String? acceptedStatus,
  String? iDDocumentPicture,
  String? userProfilePicture,
  String? usersName,
  String? documentType,
  DocumentReference? userREF,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userID': userID,
      'date': date,
      'AdminNotAcceptedComment': adminNotAcceptedComment,
      'AcceptedStatus': acceptedStatus,
      'IDDocumentPicture': iDDocumentPicture,
      'userProfilePicture': userProfilePicture,
      'usersName': usersName,
      'DocumentType': documentType,
      'userREF': userREF,
    }.withoutNulls,
  );

  return firestoreData;
}

class VerificationUserSessionRecordDocumentEquality
    implements Equality<VerificationUserSessionRecord> {
  const VerificationUserSessionRecordDocumentEquality();

  @override
  bool equals(
      VerificationUserSessionRecord? e1, VerificationUserSessionRecord? e2) {
    return e1?.userID == e2?.userID &&
        e1?.date == e2?.date &&
        e1?.adminNotAcceptedComment == e2?.adminNotAcceptedComment &&
        e1?.acceptedStatus == e2?.acceptedStatus &&
        e1?.iDDocumentPicture == e2?.iDDocumentPicture &&
        e1?.userProfilePicture == e2?.userProfilePicture &&
        e1?.usersName == e2?.usersName &&
        e1?.documentType == e2?.documentType &&
        e1?.userREF == e2?.userREF;
  }

  @override
  int hash(VerificationUserSessionRecord? e) => const ListEquality().hash([
        e?.userID,
        e?.date,
        e?.adminNotAcceptedComment,
        e?.acceptedStatus,
        e?.iDDocumentPicture,
        e?.userProfilePicture,
        e?.usersName,
        e?.documentType,
        e?.userREF
      ]);

  @override
  bool isValidKey(Object? o) => o is VerificationUserSessionRecord;
}
