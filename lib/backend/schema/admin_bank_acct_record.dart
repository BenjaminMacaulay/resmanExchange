import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AdminBankAcctRecord extends FirestoreRecord {
  AdminBankAcctRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "AdminNigerianAccount" field.
  NigerianBankAcctStruct? _adminNigerianAccount;
  NigerianBankAcctStruct get adminNigerianAccount =>
      _adminNigerianAccount ?? NigerianBankAcctStruct();
  bool hasAdminNigerianAccount() => _adminNigerianAccount != null;

  // "AdminS_AfricanAccount" field.
  SAfricaBankAcctStruct? _adminSAfricanAccount;
  SAfricaBankAcctStruct get adminSAfricanAccount =>
      _adminSAfricanAccount ?? SAfricaBankAcctStruct();
  bool hasAdminSAfricanAccount() => _adminSAfricanAccount != null;

  // "createdDate" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  // "currencyCode" field.
  String? _currencyCode;
  String get currencyCode => _currencyCode ?? '';
  bool hasCurrencyCode() => _currencyCode != null;

  void _initializeFields() {
    _adminNigerianAccount = NigerianBankAcctStruct.maybeFromMap(
        snapshotData['AdminNigerianAccount']);
    _adminSAfricanAccount = SAfricaBankAcctStruct.maybeFromMap(
        snapshotData['AdminS_AfricanAccount']);
    _createdDate = snapshotData['createdDate'] as DateTime?;
    _currencyCode = snapshotData['currencyCode'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('AdminBankAcct');

  static Stream<AdminBankAcctRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AdminBankAcctRecord.fromSnapshot(s));

  static Future<AdminBankAcctRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AdminBankAcctRecord.fromSnapshot(s));

  static AdminBankAcctRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AdminBankAcctRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AdminBankAcctRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AdminBankAcctRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AdminBankAcctRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AdminBankAcctRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAdminBankAcctRecordData({
  NigerianBankAcctStruct? adminNigerianAccount,
  SAfricaBankAcctStruct? adminSAfricanAccount,
  DateTime? createdDate,
  String? currencyCode,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'AdminNigerianAccount': NigerianBankAcctStruct().toMap(),
      'AdminS_AfricanAccount': SAfricaBankAcctStruct().toMap(),
      'createdDate': createdDate,
      'currencyCode': currencyCode,
    }.withoutNulls,
  );

  // Handle nested data for "AdminNigerianAccount" field.
  addNigerianBankAcctStructData(
      firestoreData, adminNigerianAccount, 'AdminNigerianAccount');

  // Handle nested data for "AdminS_AfricanAccount" field.
  addSAfricaBankAcctStructData(
      firestoreData, adminSAfricanAccount, 'AdminS_AfricanAccount');

  return firestoreData;
}

class AdminBankAcctRecordDocumentEquality
    implements Equality<AdminBankAcctRecord> {
  const AdminBankAcctRecordDocumentEquality();

  @override
  bool equals(AdminBankAcctRecord? e1, AdminBankAcctRecord? e2) {
    return e1?.adminNigerianAccount == e2?.adminNigerianAccount &&
        e1?.adminSAfricanAccount == e2?.adminSAfricanAccount &&
        e1?.createdDate == e2?.createdDate &&
        e1?.currencyCode == e2?.currencyCode;
  }

  @override
  int hash(AdminBankAcctRecord? e) => const ListEquality().hash([
        e?.adminNigerianAccount,
        e?.adminSAfricanAccount,
        e?.createdDate,
        e?.currencyCode
      ]);

  @override
  bool isValidKey(Object? o) => o is AdminBankAcctRecord;
}
