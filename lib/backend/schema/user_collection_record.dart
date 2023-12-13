import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserCollectionRecord extends FirestoreRecord {
  UserCollectionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "Admin" field.
  bool? _admin;
  bool get admin => _admin ?? false;
  bool hasAdmin() => _admin != null;

  // "Password" field.
  String? _password;
  String get password => _password ?? '';
  bool hasPassword() => _password != null;

  // "KycVerified" field.
  bool? _kycVerified;
  bool get kycVerified => _kycVerified ?? false;
  bool hasKycVerified() => _kycVerified != null;

  // "Country_Currency" field.
  CountryCurrencyDataTypeStruct? _countryCurrency;
  CountryCurrencyDataTypeStruct get countryCurrency =>
      _countryCurrency ?? CountryCurrencyDataTypeStruct();
  bool hasCountryCurrency() => _countryCurrency != null;

  // "NewTransaction_Cache" field.
  bool? _newTransactionCache;
  bool get newTransactionCache => _newTransactionCache ?? false;
  bool hasNewTransactionCache() => _newTransactionCache != null;

  // "Address" field.
  AddressDataTypeStruct? _address;
  AddressDataTypeStruct get address => _address ?? AddressDataTypeStruct();
  bool hasAddress() => _address != null;

  // "username" field.
  String? _username;
  String get username => _username ?? '';
  bool hasUsername() => _username != null;

  // "UserEmailVerified" field.
  bool? _userEmailVerified;
  bool get userEmailVerified => _userEmailVerified ?? false;
  bool hasUserEmailVerified() => _userEmailVerified != null;

  // "pinSet" field.
  bool? _pinSet;
  bool get pinSet => _pinSet ?? false;
  bool hasPinSet() => _pinSet != null;

  // "TwofADetails" field.
  VerificationChoiceStruct? _twofADetails;
  VerificationChoiceStruct get twofADetails =>
      _twofADetails ?? VerificationChoiceStruct();
  bool hasTwofADetails() => _twofADetails != null;

  // "pinCode" field.
  String? _pinCode;
  String get pinCode => _pinCode ?? '';
  bool hasPinCode() => _pinCode != null;

  // "DefaultAccount" field.
  DocumentReference? _defaultAccount;
  DocumentReference? get defaultAccount => _defaultAccount;
  bool hasDefaultAccount() => _defaultAccount != null;

  // "noOfTransactions" field.
  int? _noOfTransactions;
  int get noOfTransactions => _noOfTransactions ?? 0;
  bool hasNoOfTransactions() => _noOfTransactions != null;

  // "setCurrencyToTrade" field.
  bool? _setCurrencyToTrade;
  bool get setCurrencyToTrade => _setCurrencyToTrade ?? false;
  bool hasSetCurrencyToTrade() => _setCurrencyToTrade != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _admin = snapshotData['Admin'] as bool?;
    _password = snapshotData['Password'] as String?;
    _kycVerified = snapshotData['KycVerified'] as bool?;
    _countryCurrency = CountryCurrencyDataTypeStruct.maybeFromMap(
        snapshotData['Country_Currency']);
    _newTransactionCache = snapshotData['NewTransaction_Cache'] as bool?;
    _address = AddressDataTypeStruct.maybeFromMap(snapshotData['Address']);
    _username = snapshotData['username'] as String?;
    _userEmailVerified = snapshotData['UserEmailVerified'] as bool?;
    _pinSet = snapshotData['pinSet'] as bool?;
    _twofADetails =
        VerificationChoiceStruct.maybeFromMap(snapshotData['TwofADetails']);
    _pinCode = snapshotData['pinCode'] as String?;
    _defaultAccount = snapshotData['DefaultAccount'] as DocumentReference?;
    _noOfTransactions = castToType<int>(snapshotData['noOfTransactions']);
    _setCurrencyToTrade = snapshotData['setCurrencyToTrade'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user_Collection');

  static Stream<UserCollectionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserCollectionRecord.fromSnapshot(s));

  static Future<UserCollectionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserCollectionRecord.fromSnapshot(s));

  static UserCollectionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserCollectionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserCollectionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserCollectionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserCollectionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserCollectionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserCollectionRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  bool? admin,
  String? password,
  bool? kycVerified,
  CountryCurrencyDataTypeStruct? countryCurrency,
  bool? newTransactionCache,
  AddressDataTypeStruct? address,
  String? username,
  bool? userEmailVerified,
  bool? pinSet,
  VerificationChoiceStruct? twofADetails,
  String? pinCode,
  DocumentReference? defaultAccount,
  int? noOfTransactions,
  bool? setCurrencyToTrade,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'Admin': admin,
      'Password': password,
      'KycVerified': kycVerified,
      'Country_Currency': CountryCurrencyDataTypeStruct().toMap(),
      'NewTransaction_Cache': newTransactionCache,
      'Address': AddressDataTypeStruct().toMap(),
      'username': username,
      'UserEmailVerified': userEmailVerified,
      'pinSet': pinSet,
      'TwofADetails': VerificationChoiceStruct().toMap(),
      'pinCode': pinCode,
      'DefaultAccount': defaultAccount,
      'noOfTransactions': noOfTransactions,
      'setCurrencyToTrade': setCurrencyToTrade,
    }.withoutNulls,
  );

  // Handle nested data for "Country_Currency" field.
  addCountryCurrencyDataTypeStructData(
      firestoreData, countryCurrency, 'Country_Currency');

  // Handle nested data for "Address" field.
  addAddressDataTypeStructData(firestoreData, address, 'Address');

  // Handle nested data for "TwofADetails" field.
  addVerificationChoiceStructData(firestoreData, twofADetails, 'TwofADetails');

  return firestoreData;
}

class UserCollectionRecordDocumentEquality
    implements Equality<UserCollectionRecord> {
  const UserCollectionRecordDocumentEquality();

  @override
  bool equals(UserCollectionRecord? e1, UserCollectionRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.admin == e2?.admin &&
        e1?.password == e2?.password &&
        e1?.kycVerified == e2?.kycVerified &&
        e1?.countryCurrency == e2?.countryCurrency &&
        e1?.newTransactionCache == e2?.newTransactionCache &&
        e1?.address == e2?.address &&
        e1?.username == e2?.username &&
        e1?.userEmailVerified == e2?.userEmailVerified &&
        e1?.pinSet == e2?.pinSet &&
        e1?.twofADetails == e2?.twofADetails &&
        e1?.pinCode == e2?.pinCode &&
        e1?.defaultAccount == e2?.defaultAccount &&
        e1?.noOfTransactions == e2?.noOfTransactions &&
        e1?.setCurrencyToTrade == e2?.setCurrencyToTrade;
  }

  @override
  int hash(UserCollectionRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.admin,
        e?.password,
        e?.kycVerified,
        e?.countryCurrency,
        e?.newTransactionCache,
        e?.address,
        e?.username,
        e?.userEmailVerified,
        e?.pinSet,
        e?.twofADetails,
        e?.pinCode,
        e?.defaultAccount,
        e?.noOfTransactions,
        e?.setCurrencyToTrade
      ]);

  @override
  bool isValidKey(Object? o) => o is UserCollectionRecord;
}
