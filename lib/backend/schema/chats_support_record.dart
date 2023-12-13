import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatsSupportRecord extends FirestoreRecord {
  ChatsSupportRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "CreatedBy" field.
  String? _createdBy;
  String get createdBy => _createdBy ?? '';
  bool hasCreatedBy() => _createdBy != null;

  // "DateCreated" field.
  DateTime? _dateCreated;
  DateTime? get dateCreated => _dateCreated;
  bool hasDateCreated() => _dateCreated != null;

  // "Read" field.
  bool? _read;
  bool get read => _read ?? false;
  bool hasRead() => _read != null;

  // "Picture" field.
  String? _picture;
  String get picture => _picture ?? '';
  bool hasPicture() => _picture != null;

  // "MessageType" field.
  String? _messageType;
  String get messageType => _messageType ?? '';
  bool hasMessageType() => _messageType != null;

  // "transactionActionEnabled" field.
  bool? _transactionActionEnabled;
  bool get transactionActionEnabled => _transactionActionEnabled ?? false;
  bool hasTransactionActionEnabled() => _transactionActionEnabled != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _message = snapshotData['Message'] as String?;
    _createdBy = snapshotData['CreatedBy'] as String?;
    _dateCreated = snapshotData['DateCreated'] as DateTime?;
    _read = snapshotData['Read'] as bool?;
    _picture = snapshotData['Picture'] as String?;
    _messageType = snapshotData['MessageType'] as String?;
    _transactionActionEnabled =
        snapshotData['transactionActionEnabled'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('chatsSupport')
          : FirebaseFirestore.instance.collectionGroup('chatsSupport');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('chatsSupport').doc();

  static Stream<ChatsSupportRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatsSupportRecord.fromSnapshot(s));

  static Future<ChatsSupportRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatsSupportRecord.fromSnapshot(s));

  static ChatsSupportRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChatsSupportRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatsSupportRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatsSupportRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatsSupportRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatsSupportRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatsSupportRecordData({
  String? message,
  String? createdBy,
  DateTime? dateCreated,
  bool? read,
  String? picture,
  String? messageType,
  bool? transactionActionEnabled,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Message': message,
      'CreatedBy': createdBy,
      'DateCreated': dateCreated,
      'Read': read,
      'Picture': picture,
      'MessageType': messageType,
      'transactionActionEnabled': transactionActionEnabled,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatsSupportRecordDocumentEquality
    implements Equality<ChatsSupportRecord> {
  const ChatsSupportRecordDocumentEquality();

  @override
  bool equals(ChatsSupportRecord? e1, ChatsSupportRecord? e2) {
    return e1?.message == e2?.message &&
        e1?.createdBy == e2?.createdBy &&
        e1?.dateCreated == e2?.dateCreated &&
        e1?.read == e2?.read &&
        e1?.picture == e2?.picture &&
        e1?.messageType == e2?.messageType &&
        e1?.transactionActionEnabled == e2?.transactionActionEnabled;
  }

  @override
  int hash(ChatsSupportRecord? e) => const ListEquality().hash([
        e?.message,
        e?.createdBy,
        e?.dateCreated,
        e?.read,
        e?.picture,
        e?.messageType,
        e?.transactionActionEnabled
      ]);

  @override
  bool isValidKey(Object? o) => o is ChatsSupportRecord;
}
