import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CryptocurrenciesCollectionRecord extends FirestoreRecord {
  CryptocurrenciesCollectionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "symbol" field.
  String? _symbol;
  String get symbol => _symbol ?? '';
  bool hasSymbol() => _symbol != null;

  // "AdminRef" field.
  DocumentReference? _adminRef;
  DocumentReference? get adminRef => _adminRef;
  bool hasAdminRef() => _adminRef != null;

  // "UserUID" field.
  String? _userUID;
  String get userUID => _userUID ?? '';
  bool hasUserUID() => _userUID != null;

  // "ImageCoin" field.
  String? _imageCoin;
  String get imageCoin => _imageCoin ?? '';
  bool hasImageCoin() => _imageCoin != null;

  // "ApiSymbol" field.
  String? _apiSymbol;
  String get apiSymbol => _apiSymbol ?? '';
  bool hasApiSymbol() => _apiSymbol != null;

  // "createdDate" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _symbol = snapshotData['symbol'] as String?;
    _adminRef = snapshotData['AdminRef'] as DocumentReference?;
    _userUID = snapshotData['UserUID'] as String?;
    _imageCoin = snapshotData['ImageCoin'] as String?;
    _apiSymbol = snapshotData['ApiSymbol'] as String?;
    _createdDate = snapshotData['createdDate'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('CryptocurrenciesCollection');

  static Stream<CryptocurrenciesCollectionRecord> getDocument(
          DocumentReference ref) =>
      ref
          .snapshots()
          .map((s) => CryptocurrenciesCollectionRecord.fromSnapshot(s));

  static Future<CryptocurrenciesCollectionRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CryptocurrenciesCollectionRecord.fromSnapshot(s));

  static CryptocurrenciesCollectionRecord fromSnapshot(
          DocumentSnapshot snapshot) =>
      CryptocurrenciesCollectionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CryptocurrenciesCollectionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CryptocurrenciesCollectionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CryptocurrenciesCollectionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CryptocurrenciesCollectionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCryptocurrenciesCollectionRecordData({
  String? name,
  String? symbol,
  DocumentReference? adminRef,
  String? userUID,
  String? imageCoin,
  String? apiSymbol,
  DateTime? createdDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'symbol': symbol,
      'AdminRef': adminRef,
      'UserUID': userUID,
      'ImageCoin': imageCoin,
      'ApiSymbol': apiSymbol,
      'createdDate': createdDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class CryptocurrenciesCollectionRecordDocumentEquality
    implements Equality<CryptocurrenciesCollectionRecord> {
  const CryptocurrenciesCollectionRecordDocumentEquality();

  @override
  bool equals(CryptocurrenciesCollectionRecord? e1,
      CryptocurrenciesCollectionRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.symbol == e2?.symbol &&
        e1?.adminRef == e2?.adminRef &&
        e1?.userUID == e2?.userUID &&
        e1?.imageCoin == e2?.imageCoin &&
        e1?.apiSymbol == e2?.apiSymbol &&
        e1?.createdDate == e2?.createdDate;
  }

  @override
  int hash(CryptocurrenciesCollectionRecord? e) => const ListEquality().hash([
        e?.name,
        e?.symbol,
        e?.adminRef,
        e?.userUID,
        e?.imageCoin,
        e?.apiSymbol,
        e?.createdDate
      ]);

  @override
  bool isValidKey(Object? o) => o is CryptocurrenciesCollectionRecord;
}
