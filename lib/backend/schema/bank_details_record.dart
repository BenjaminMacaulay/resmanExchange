import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BankDetailsRecord extends FirestoreRecord {
  BankDetailsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "bankName" field.
  String? _bankName;
  String get bankName => _bankName ?? '';
  bool hasBankName() => _bankName != null;

  // "AccountNumber" field.
  String? _accountNumber;
  String get accountNumber => _accountNumber ?? '';
  bool hasAccountNumber() => _accountNumber != null;

  // "AccountName" field.
  String? _accountName;
  String get accountName => _accountName ?? '';
  bool hasAccountName() => _accountName != null;

  // "userUID" field.
  String? _userUID;
  String get userUID => _userUID ?? '';
  bool hasUserUID() => _userUID != null;

  // "createdDate" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  // "branchCode" field.
  String? _branchCode;
  String get branchCode => _branchCode ?? '';
  bool hasBranchCode() => _branchCode != null;

  void _initializeFields() {
    _bankName = snapshotData['bankName'] as String?;
    _accountNumber = snapshotData['AccountNumber'] as String?;
    _accountName = snapshotData['AccountName'] as String?;
    _userUID = snapshotData['userUID'] as String?;
    _createdDate = snapshotData['createdDate'] as DateTime?;
    _branchCode = snapshotData['branchCode'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('bankDetails');

  static Stream<BankDetailsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BankDetailsRecord.fromSnapshot(s));

  static Future<BankDetailsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BankDetailsRecord.fromSnapshot(s));

  static BankDetailsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BankDetailsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BankDetailsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BankDetailsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BankDetailsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BankDetailsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBankDetailsRecordData({
  String? bankName,
  String? accountNumber,
  String? accountName,
  String? userUID,
  DateTime? createdDate,
  String? branchCode,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'bankName': bankName,
      'AccountNumber': accountNumber,
      'AccountName': accountName,
      'userUID': userUID,
      'createdDate': createdDate,
      'branchCode': branchCode,
    }.withoutNulls,
  );

  return firestoreData;
}

class BankDetailsRecordDocumentEquality implements Equality<BankDetailsRecord> {
  const BankDetailsRecordDocumentEquality();

  @override
  bool equals(BankDetailsRecord? e1, BankDetailsRecord? e2) {
    return e1?.bankName == e2?.bankName &&
        e1?.accountNumber == e2?.accountNumber &&
        e1?.accountName == e2?.accountName &&
        e1?.userUID == e2?.userUID &&
        e1?.createdDate == e2?.createdDate &&
        e1?.branchCode == e2?.branchCode;
  }

  @override
  int hash(BankDetailsRecord? e) => const ListEquality().hash([
        e?.bankName,
        e?.accountNumber,
        e?.accountName,
        e?.userUID,
        e?.createdDate,
        e?.branchCode
      ]);

  @override
  bool isValidKey(Object? o) => o is BankDetailsRecord;
}
