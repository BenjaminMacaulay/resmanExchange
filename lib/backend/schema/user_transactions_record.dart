import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserTransactionsRecord extends FirestoreRecord {
  UserTransactionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "transactionID" field.
  DocumentReference? _transactionID;
  DocumentReference? get transactionID => _transactionID;
  bool hasTransactionID() => _transactionID != null;

  // "userID" field.
  String? _userID;
  String get userID => _userID ?? '';
  bool hasUserID() => _userID != null;

  // "transactionType" field.
  String? _transactionType;
  String get transactionType => _transactionType ?? '';
  bool hasTransactionType() => _transactionType != null;

  // "Country_currency" field.
  CountryCurrencyDataTypeStruct? _countryCurrency;
  CountryCurrencyDataTypeStruct get countryCurrency =>
      _countryCurrency ?? CountryCurrencyDataTypeStruct();
  bool hasCountryCurrency() => _countryCurrency != null;

  // "CreatedDate" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  // "cryptoChoice" field.
  CryptoNameStruct? _cryptoChoice;
  CryptoNameStruct get cryptoChoice => _cryptoChoice ?? CryptoNameStruct();
  bool hasCryptoChoice() => _cryptoChoice != null;

  // "BuyTransaction" field.
  BuyTransactionInitiatedStruct? _buyTransaction;
  BuyTransactionInitiatedStruct get buyTransaction =>
      _buyTransaction ?? BuyTransactionInitiatedStruct();
  bool hasBuyTransaction() => _buyTransaction != null;

  // "TransactionStatus" field.
  String? _transactionStatus;
  String get transactionStatus => _transactionStatus ?? '';
  bool hasTransactionStatus() => _transactionStatus != null;

  // "expiredDate" field.
  DateTime? _expiredDate;
  DateTime? get expiredDate => _expiredDate;
  bool hasExpiredDate() => _expiredDate != null;

  // "expired" field.
  bool? _expired;
  bool get expired => _expired ?? false;
  bool hasExpired() => _expired != null;

  // "AdminChatAccessedTime" field.
  DateTime? _adminChatAccessedTime;
  DateTime? get adminChatAccessedTime => _adminChatAccessedTime;
  bool hasAdminChatAccessedTime() => _adminChatAccessedTime != null;

  // "AdminChatAccessed" field.
  bool? _adminChatAccessed;
  bool get adminChatAccessed => _adminChatAccessed ?? false;
  bool hasAdminChatAccessed() => _adminChatAccessed != null;

  // "chatStatus" field.
  String? _chatStatus;
  String get chatStatus => _chatStatus ?? '';
  bool hasChatStatus() => _chatStatus != null;

  // "messageNumber" field.
  int? _messageNumber;
  int get messageNumber => _messageNumber ?? 0;
  bool hasMessageNumber() => _messageNumber != null;

  // "LastMessage" field.
  String? _lastMessage;
  String get lastMessage => _lastMessage ?? '';
  bool hasLastMessage() => _lastMessage != null;

  // "ChatLastTime" field.
  DateTime? _chatLastTime;
  DateTime? get chatLastTime => _chatLastTime;
  bool hasChatLastTime() => _chatLastTime != null;

  // "transactionsCodeRef" field.
  String? _transactionsCodeRef;
  String get transactionsCodeRef => _transactionsCodeRef ?? '';
  bool hasTransactionsCodeRef() => _transactionsCodeRef != null;

  // "ratePerDollar" field.
  double? _ratePerDollar;
  double get ratePerDollar => _ratePerDollar ?? 0.0;
  bool hasRatePerDollar() => _ratePerDollar != null;

  // "SellOrderTransaction" field.
  SellOrderInitiatedStruct? _sellOrderTransaction;
  SellOrderInitiatedStruct get sellOrderTransaction =>
      _sellOrderTransaction ?? SellOrderInitiatedStruct();
  bool hasSellOrderTransaction() => _sellOrderTransaction != null;

  // "BankAccountToPay" field.
  DocumentReference? _bankAccountToPay;
  DocumentReference? get bankAccountToPay => _bankAccountToPay;
  bool hasBankAccountToPay() => _bankAccountToPay != null;

  // "AdminRejectedComment" field.
  String? _adminRejectedComment;
  String get adminRejectedComment => _adminRejectedComment ?? '';
  bool hasAdminRejectedComment() => _adminRejectedComment != null;

  // "sellTradeInChat" field.
  bool? _sellTradeInChat;
  bool get sellTradeInChat => _sellTradeInChat ?? false;
  bool hasSellTradeInChat() => _sellTradeInChat != null;

  // "transactionImage" field.
  String? _transactionImage;
  String get transactionImage => _transactionImage ?? '';
  bool hasTransactionImage() => _transactionImage != null;

  // "userWalletAddress" field.
  String? _userWalletAddress;
  String get userWalletAddress => _userWalletAddress ?? '';
  bool hasUserWalletAddress() => _userWalletAddress != null;

  void _initializeFields() {
    _transactionID = snapshotData['transactionID'] as DocumentReference?;
    _userID = snapshotData['userID'] as String?;
    _transactionType = snapshotData['transactionType'] as String?;
    _countryCurrency = CountryCurrencyDataTypeStruct.maybeFromMap(
        snapshotData['Country_currency']);
    _createdDate = snapshotData['CreatedDate'] as DateTime?;
    _cryptoChoice = CryptoNameStruct.maybeFromMap(snapshotData['cryptoChoice']);
    _buyTransaction = BuyTransactionInitiatedStruct.maybeFromMap(
        snapshotData['BuyTransaction']);
    _transactionStatus = snapshotData['TransactionStatus'] as String?;
    _expiredDate = snapshotData['expiredDate'] as DateTime?;
    _expired = snapshotData['expired'] as bool?;
    _adminChatAccessedTime = snapshotData['AdminChatAccessedTime'] as DateTime?;
    _adminChatAccessed = snapshotData['AdminChatAccessed'] as bool?;
    _chatStatus = snapshotData['chatStatus'] as String?;
    _messageNumber = castToType<int>(snapshotData['messageNumber']);
    _lastMessage = snapshotData['LastMessage'] as String?;
    _chatLastTime = snapshotData['ChatLastTime'] as DateTime?;
    _transactionsCodeRef = snapshotData['transactionsCodeRef'] as String?;
    _ratePerDollar = castToType<double>(snapshotData['ratePerDollar']);
    _sellOrderTransaction = SellOrderInitiatedStruct.maybeFromMap(
        snapshotData['SellOrderTransaction']);
    _bankAccountToPay = snapshotData['BankAccountToPay'] as DocumentReference?;
    _adminRejectedComment = snapshotData['AdminRejectedComment'] as String?;
    _sellTradeInChat = snapshotData['sellTradeInChat'] as bool?;
    _transactionImage = snapshotData['transactionImage'] as String?;
    _userWalletAddress = snapshotData['userWalletAddress'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('User_Transactions');

  static Stream<UserTransactionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserTransactionsRecord.fromSnapshot(s));

  static Future<UserTransactionsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => UserTransactionsRecord.fromSnapshot(s));

  static UserTransactionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserTransactionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserTransactionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserTransactionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserTransactionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserTransactionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserTransactionsRecordData({
  DocumentReference? transactionID,
  String? userID,
  String? transactionType,
  CountryCurrencyDataTypeStruct? countryCurrency,
  DateTime? createdDate,
  CryptoNameStruct? cryptoChoice,
  BuyTransactionInitiatedStruct? buyTransaction,
  String? transactionStatus,
  DateTime? expiredDate,
  bool? expired,
  DateTime? adminChatAccessedTime,
  bool? adminChatAccessed,
  String? chatStatus,
  int? messageNumber,
  String? lastMessage,
  DateTime? chatLastTime,
  String? transactionsCodeRef,
  double? ratePerDollar,
  SellOrderInitiatedStruct? sellOrderTransaction,
  DocumentReference? bankAccountToPay,
  String? adminRejectedComment,
  bool? sellTradeInChat,
  String? transactionImage,
  String? userWalletAddress,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'transactionID': transactionID,
      'userID': userID,
      'transactionType': transactionType,
      'Country_currency': CountryCurrencyDataTypeStruct().toMap(),
      'CreatedDate': createdDate,
      'cryptoChoice': CryptoNameStruct().toMap(),
      'BuyTransaction': BuyTransactionInitiatedStruct().toMap(),
      'TransactionStatus': transactionStatus,
      'expiredDate': expiredDate,
      'expired': expired,
      'AdminChatAccessedTime': adminChatAccessedTime,
      'AdminChatAccessed': adminChatAccessed,
      'chatStatus': chatStatus,
      'messageNumber': messageNumber,
      'LastMessage': lastMessage,
      'ChatLastTime': chatLastTime,
      'transactionsCodeRef': transactionsCodeRef,
      'ratePerDollar': ratePerDollar,
      'SellOrderTransaction': SellOrderInitiatedStruct().toMap(),
      'BankAccountToPay': bankAccountToPay,
      'AdminRejectedComment': adminRejectedComment,
      'sellTradeInChat': sellTradeInChat,
      'transactionImage': transactionImage,
      'userWalletAddress': userWalletAddress,
    }.withoutNulls,
  );

  // Handle nested data for "Country_currency" field.
  addCountryCurrencyDataTypeStructData(
      firestoreData, countryCurrency, 'Country_currency');

  // Handle nested data for "cryptoChoice" field.
  addCryptoNameStructData(firestoreData, cryptoChoice, 'cryptoChoice');

  // Handle nested data for "BuyTransaction" field.
  addBuyTransactionInitiatedStructData(
      firestoreData, buyTransaction, 'BuyTransaction');

  // Handle nested data for "SellOrderTransaction" field.
  addSellOrderInitiatedStructData(
      firestoreData, sellOrderTransaction, 'SellOrderTransaction');

  return firestoreData;
}

class UserTransactionsRecordDocumentEquality
    implements Equality<UserTransactionsRecord> {
  const UserTransactionsRecordDocumentEquality();

  @override
  bool equals(UserTransactionsRecord? e1, UserTransactionsRecord? e2) {
    return e1?.transactionID == e2?.transactionID &&
        e1?.userID == e2?.userID &&
        e1?.transactionType == e2?.transactionType &&
        e1?.countryCurrency == e2?.countryCurrency &&
        e1?.createdDate == e2?.createdDate &&
        e1?.cryptoChoice == e2?.cryptoChoice &&
        e1?.buyTransaction == e2?.buyTransaction &&
        e1?.transactionStatus == e2?.transactionStatus &&
        e1?.expiredDate == e2?.expiredDate &&
        e1?.expired == e2?.expired &&
        e1?.adminChatAccessedTime == e2?.adminChatAccessedTime &&
        e1?.adminChatAccessed == e2?.adminChatAccessed &&
        e1?.chatStatus == e2?.chatStatus &&
        e1?.messageNumber == e2?.messageNumber &&
        e1?.lastMessage == e2?.lastMessage &&
        e1?.chatLastTime == e2?.chatLastTime &&
        e1?.transactionsCodeRef == e2?.transactionsCodeRef &&
        e1?.ratePerDollar == e2?.ratePerDollar &&
        e1?.sellOrderTransaction == e2?.sellOrderTransaction &&
        e1?.bankAccountToPay == e2?.bankAccountToPay &&
        e1?.adminRejectedComment == e2?.adminRejectedComment &&
        e1?.sellTradeInChat == e2?.sellTradeInChat &&
        e1?.transactionImage == e2?.transactionImage &&
        e1?.userWalletAddress == e2?.userWalletAddress;
  }

  @override
  int hash(UserTransactionsRecord? e) => const ListEquality().hash([
        e?.transactionID,
        e?.userID,
        e?.transactionType,
        e?.countryCurrency,
        e?.createdDate,
        e?.cryptoChoice,
        e?.buyTransaction,
        e?.transactionStatus,
        e?.expiredDate,
        e?.expired,
        e?.adminChatAccessedTime,
        e?.adminChatAccessed,
        e?.chatStatus,
        e?.messageNumber,
        e?.lastMessage,
        e?.chatLastTime,
        e?.transactionsCodeRef,
        e?.ratePerDollar,
        e?.sellOrderTransaction,
        e?.bankAccountToPay,
        e?.adminRejectedComment,
        e?.sellTradeInChat,
        e?.transactionImage,
        e?.userWalletAddress
      ]);

  @override
  bool isValidKey(Object? o) => o is UserTransactionsRecord;
}
