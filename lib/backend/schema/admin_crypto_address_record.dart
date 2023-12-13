import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AdminCryptoAddressRecord extends FirestoreRecord {
  AdminCryptoAddressRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "WalletAddress" field.
  String? _walletAddress;
  String get walletAddress => _walletAddress ?? '';
  bool hasWalletAddress() => _walletAddress != null;

  // "CryptoChosen" field.
  CryptoNameStruct? _cryptoChosen;
  CryptoNameStruct get cryptoChosen => _cryptoChosen ?? CryptoNameStruct();
  bool hasCryptoChosen() => _cryptoChosen != null;

  // "createdDate" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  void _initializeFields() {
    _walletAddress = snapshotData['WalletAddress'] as String?;
    _cryptoChosen = CryptoNameStruct.maybeFromMap(snapshotData['CryptoChosen']);
    _createdDate = snapshotData['createdDate'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('AdminCryptoAddress');

  static Stream<AdminCryptoAddressRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AdminCryptoAddressRecord.fromSnapshot(s));

  static Future<AdminCryptoAddressRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => AdminCryptoAddressRecord.fromSnapshot(s));

  static AdminCryptoAddressRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AdminCryptoAddressRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AdminCryptoAddressRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AdminCryptoAddressRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AdminCryptoAddressRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AdminCryptoAddressRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAdminCryptoAddressRecordData({
  String? walletAddress,
  CryptoNameStruct? cryptoChosen,
  DateTime? createdDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'WalletAddress': walletAddress,
      'CryptoChosen': CryptoNameStruct().toMap(),
      'createdDate': createdDate,
    }.withoutNulls,
  );

  // Handle nested data for "CryptoChosen" field.
  addCryptoNameStructData(firestoreData, cryptoChosen, 'CryptoChosen');

  return firestoreData;
}

class AdminCryptoAddressRecordDocumentEquality
    implements Equality<AdminCryptoAddressRecord> {
  const AdminCryptoAddressRecordDocumentEquality();

  @override
  bool equals(AdminCryptoAddressRecord? e1, AdminCryptoAddressRecord? e2) {
    return e1?.walletAddress == e2?.walletAddress &&
        e1?.cryptoChosen == e2?.cryptoChosen &&
        e1?.createdDate == e2?.createdDate;
  }

  @override
  int hash(AdminCryptoAddressRecord? e) => const ListEquality()
      .hash([e?.walletAddress, e?.cryptoChosen, e?.createdDate]);

  @override
  bool isValidKey(Object? o) => o is AdminCryptoAddressRecord;
}
