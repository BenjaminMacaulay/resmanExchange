import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/back_component_widget.dart';
import '/components/message_box_widget.dart';
import '/components/picture_message_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chat_transactions_chat_model.dart';
export 'chat_transactions_chat_model.dart';

class ChatTransactionsChatWidget extends StatefulWidget {
  const ChatTransactionsChatWidget({
    Key? key,
    required this.transactionRef,
    bool? buyOrder,
    bool? chatON,
    bool? sellTradeOn,
    this.cryptoAmount,
    this.cryptoChosen,
    this.localAmountPayout,
    this.transactionCurrency,
  })  : this.buyOrder = buyOrder ?? false,
        this.chatON = chatON ?? false,
        this.sellTradeOn = sellTradeOn ?? false,
        super(key: key);

  final DocumentReference? transactionRef;
  final bool buyOrder;
  final bool chatON;
  final bool sellTradeOn;
  final String? cryptoAmount;
  final String? cryptoChosen;
  final String? localAmountPayout;
  final String? transactionCurrency;

  @override
  _ChatTransactionsChatWidgetState createState() =>
      _ChatTransactionsChatWidgetState();
}

class _ChatTransactionsChatWidgetState
    extends State<ChatTransactionsChatWidget> {
  late ChatTransactionsChatModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatTransactionsChatModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      final firestoreBatch = FirebaseFirestore.instance.batch();
      try {
        if (valueOrDefault<bool>(currentUserDocument?.admin, false)) {
          firestoreBatch.update(
              widget.transactionRef!,
              createUserTransactionsRecordData(
                adminChatAccessed: true,
                adminChatAccessedTime: getCurrentTimestamp,
              ));
        } else {
          _model.transactionRef = await UserTransactionsRecord.getDocumentOnce(
              widget.transactionRef!);
          if (_model.transactionRef!.messageNumber <= 0) {
            if (widget.sellTradeOn) {
              firestoreBatch.set(
                  ChatsSupportRecord.createDoc(widget.transactionRef!),
                  createChatsSupportRecordData(
                    message:
                        'Important Transaction Note: You have initiated a trade to sell ${widget.cryptoAmount} ${widget.cryptoChosen} for ${widget.transactionCurrency} ${widget.localAmountPayout}. Since this currency is not your primary currency, we don\'t have a payment method for it on record. Kindly provide a valid ${widget.cryptoChosen} payment method after we confirm the transaction to ensure a smooth process.',
                    createdBy: currentUserUid,
                    dateCreated: getCurrentTimestamp,
                    read: false,
                    messageType: 'adminNotif',
                    transactionActionEnabled: false,
                  ));

              firestoreBatch.update(widget.transactionRef!, {
                ...createUserTransactionsRecordData(
                  lastMessage:
                      'Hello Rexman Support,  I just created a ${widget.buyOrder ? 'buy ' : 'sell '}order with transaction number #${functions.removeUserTransactionsREF(widget.transactionRef!.id)}. Please look into it.',
                  chatLastTime: getCurrentTimestamp,
                ),
                ...mapToFirestore(
                  {
                    'messageNumber': FieldValue.increment(1),
                  },
                ),
              });

              firestoreBatch.set(
                  ChatsSupportRecord.createDoc(widget.transactionRef!),
                  createChatsSupportRecordData(
                    message:
                        'Hello Resman Support,  I just created a ${widget.buyOrder ? 'buy' : 'sell'} order with transaction number #${functions.removeUserTransactionsREF(widget.transactionRef!.id)}. Please comfirm it.',
                    createdBy: currentUserUid,
                    dateCreated: getCurrentTimestamp,
                    read: false,
                    messageType: 'text',
                    transactionActionEnabled: true,
                  ));

              firestoreBatch.update(widget.transactionRef!, {
                ...createUserTransactionsRecordData(
                  lastMessage:
                      'Hello Rexman Support,  I just created a ${widget.buyOrder ? 'buy ' : 'sell '}order with transaction number #${functions.removeUserTransactionsREF(widget.transactionRef!.id)}. Please look into it.',
                  chatLastTime: getCurrentTimestamp,
                ),
                ...mapToFirestore(
                  {
                    'messageNumber': FieldValue.increment(1),
                  },
                ),
              });
            } else {
              firestoreBatch.set(
                  ChatsSupportRecord.createDoc(widget.transactionRef!),
                  createChatsSupportRecordData(
                    message:
                        'Hello Resman Support,  I just created a ${widget.buyOrder ? 'buy' : 'sell'} order with transaction number #${functions.removeUserTransactionsREF(widget.transactionRef!.id)}. Please comfirm it.',
                    createdBy: currentUserUid,
                    dateCreated: getCurrentTimestamp,
                    read: false,
                    messageType: 'text',
                    transactionActionEnabled: true,
                  ));

              firestoreBatch.update(widget.transactionRef!, {
                ...createUserTransactionsRecordData(
                  lastMessage:
                      'Hello Rexman Support,  I just created a ${widget.buyOrder ? 'buy ' : 'sell '}order with transaction number #${functions.removeUserTransactionsREF(widget.transactionRef!.id)}. Please look into it.',
                  chatLastTime: getCurrentTimestamp,
                ),
                ...mapToFirestore(
                  {
                    'messageNumber': FieldValue.increment(1),
                  },
                ),
              });
            }
          }
        }
      } finally {
        await firestoreBatch.commit();
      }
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return StreamBuilder<UserTransactionsRecord>(
      stream: UserTransactionsRecord.getDocument(widget.transactionRef!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 40.0,
                height: 40.0,
                child: SpinKitDoubleBounce(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 40.0,
                ),
              ),
            ),
          );
        }
        final chatTransactionsChatUserTransactionsRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: wrapWithModel(
                      model: _model.backComponentModel,
                      updateCallback: () => setState(() {}),
                      child: BackComponentWidget(
                        pageName: 'Resman Exchange Support',
                        actionSet: false,
                        action: () async {},
                      ),
                    ),
                  ),
                ],
              ),
              actions: [],
              centerTitle: false,
              elevation: 0.0,
            ),
            body: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: StreamBuilder<List<ChatsSupportRecord>>(
                        stream: queryChatsSupportRecord(
                          parent: widget.transactionRef,
                          queryBuilder: (chatsSupportRecord) =>
                              chatsSupportRecord.orderBy('DateCreated',
                                  descending: true),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 40.0,
                                height: 40.0,
                                child: SpinKitDoubleBounce(
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 40.0,
                                ),
                              ),
                            );
                          }
                          List<ChatsSupportRecord>
                              listViewChatsSupportRecordList = snapshot.data!;
                          return ListView.separated(
                            padding: EdgeInsets.fromLTRB(
                              0,
                              80.0,
                              0,
                              32.0,
                            ),
                            reverse: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewChatsSupportRecordList.length,
                            separatorBuilder: (_, __) => SizedBox(height: 32.0),
                            itemBuilder: (context, listViewIndex) {
                              final listViewChatsSupportRecord =
                                  listViewChatsSupportRecordList[listViewIndex];
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (listViewChatsSupportRecord.createdBy !=
                                      currentUserUid)
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              '${dateTimeFormat('yMMMd', listViewChatsSupportRecord.dateCreated)} at ${dateTimeFormat('jm', listViewChatsSupportRecord.dateCreated)}',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Oxygen',
                                                        fontSize: 12.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                        if (listViewChatsSupportRecord
                                                .messageType ==
                                            'adminNotif')
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  width: 50.0,
                                                  height: 1.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 8,
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        listViewChatsSupportRecord
                                                            .message,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Oxygen',
                                                              fontSize: 12.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  width: 50.0,
                                                  height: 1.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 8.0)),
                                          ),
                                        if (listViewChatsSupportRecord
                                                .messageType ==
                                            'text')
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 0.0, 0.0),
                                                child: MessageBoxWidget(
                                                  key: Key(
                                                      'Keyu0q_${listViewIndex}_of_${listViewChatsSupportRecordList.length}'),
                                                  messageDoc:
                                                      listViewChatsSupportRecord,
                                                ),
                                              ),
                                            ],
                                          ),
                                        if (listViewChatsSupportRecord
                                                .messageType ==
                                            'picture')
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 0.0, 0.0),
                                                child: PictureMessageWidget(
                                                  key: Key(
                                                      'Key6qi_${listViewIndex}_of_${listViewChatsSupportRecordList.length}'),
                                                  messageDoc:
                                                      listViewChatsSupportRecord,
                                                ),
                                              ),
                                            ],
                                          ),
                                      ].divide(SizedBox(height: 12.0)),
                                    ),
                                  if (listViewChatsSupportRecord.createdBy ==
                                      currentUserUid)
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              '${dateTimeFormat('yMMMd', listViewChatsSupportRecord.dateCreated)} at ${dateTimeFormat('jm', listViewChatsSupportRecord.dateCreated)}',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Oxygen',
                                                        fontSize: 12.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                        if (listViewChatsSupportRecord
                                                .messageType ==
                                            'adminNotif')
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  width: 50.0,
                                                  height: 1.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 8,
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    listViewChatsSupportRecord
                                                        .message,
                                                    'Admin has joined the chat',
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Oxygen',
                                                        fontSize: 12.0,
                                                      ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  width: 50.0,
                                                  height: 1.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 8.0)),
                                          ),
                                        if (listViewChatsSupportRecord
                                                .messageType ==
                                            'text')
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 16.0, 0.0),
                                                child: MessageBoxWidget(
                                                  key: Key(
                                                      'Keymp4_${listViewIndex}_of_${listViewChatsSupportRecordList.length}'),
                                                  messageDoc:
                                                      listViewChatsSupportRecord,
                                                ),
                                              ),
                                            ],
                                          ),
                                        if (listViewChatsSupportRecord
                                                .messageType ==
                                            'picture')
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 16.0, 0.0),
                                                child: PictureMessageWidget(
                                                  key: Key(
                                                      'Keyer9_${listViewIndex}_of_${listViewChatsSupportRecordList.length}'),
                                                  messageDoc:
                                                      listViewChatsSupportRecord,
                                                ),
                                              ),
                                            ],
                                          ),
                                        if (listViewChatsSupportRecord.read)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 16.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  'Seen',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Oxygen',
                                                        color:
                                                            Color(0xFF8D8B92),
                                                        fontSize: 12.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                      ].divide(SizedBox(height: 12.0)),
                                    ),
                                ].divide(SizedBox(height: 20.0)),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Container(
                                width: 100.0,
                                height: 70.0,
                                constraints: BoxConstraints(
                                  minHeight: 70.0,
                                  maxHeight: 120.0,
                                ),
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      22.0, 0.0, 22.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              final firestoreBatch =
                                                  FirebaseFirestore.instance
                                                      .batch();
                                              try {
                                                final selectedMedia =
                                                    await selectMediaWithSourceBottomSheet(
                                                  context: context,
                                                  imageQuality: 75,
                                                  allowPhoto: true,
                                                  pickerFontFamily: 'Work Sans',
                                                );
                                                if (selectedMedia != null &&
                                                    selectedMedia.every((m) =>
                                                        validateFileFormat(
                                                            m.storagePath,
                                                            context))) {
                                                  setState(() => _model
                                                      .isDataUploading = true);
                                                  var selectedUploadedFiles =
                                                      <FFUploadedFile>[];

                                                  var downloadUrls = <String>[];
                                                  try {
                                                    showUploadMessage(
                                                      context,
                                                      'Uploading file...',
                                                      showLoading: true,
                                                    );
                                                    selectedUploadedFiles =
                                                        selectedMedia
                                                            .map((m) =>
                                                                FFUploadedFile(
                                                                  name: m
                                                                      .storagePath
                                                                      .split(
                                                                          '/')
                                                                      .last,
                                                                  bytes:
                                                                      m.bytes,
                                                                  height: m
                                                                      .dimensions
                                                                      ?.height,
                                                                  width: m
                                                                      .dimensions
                                                                      ?.width,
                                                                  blurHash: m
                                                                      .blurHash,
                                                                ))
                                                            .toList();

                                                    downloadUrls = (await Future
                                                            .wait(
                                                      selectedMedia.map(
                                                        (m) async =>
                                                            await uploadData(
                                                                m.storagePath,
                                                                m.bytes),
                                                      ),
                                                    ))
                                                        .where((u) => u != null)
                                                        .map((u) => u!)
                                                        .toList();
                                                  } finally {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .hideCurrentSnackBar();
                                                    _model.isDataUploading =
                                                        false;
                                                  }
                                                  if (selectedUploadedFiles
                                                              .length ==
                                                          selectedMedia
                                                              .length &&
                                                      downloadUrls.length ==
                                                          selectedMedia
                                                              .length) {
                                                    setState(() {
                                                      _model.uploadedLocalFile =
                                                          selectedUploadedFiles
                                                              .first;
                                                      _model.uploadedFileUrl =
                                                          downloadUrls.first;
                                                    });
                                                    showUploadMessage(
                                                        context, 'Success!');
                                                  } else {
                                                    setState(() {});
                                                    showUploadMessage(context,
                                                        'Failed to upload data');
                                                    return;
                                                  }
                                                }

                                                if (_model.uploadedFileUrl !=
                                                        null &&
                                                    _model.uploadedFileUrl !=
                                                        '') {
                                                  if (valueOrDefault<bool>(
                                                      currentUserDocument
                                                          ?.admin,
                                                      false)) {
                                                    var chatsSupportRecordReference1 =
                                                        ChatsSupportRecord
                                                            .createDoc(widget
                                                                .transactionRef!);
                                                    firestoreBatch.set(
                                                        chatsSupportRecordReference1,
                                                        createChatsSupportRecordData(
                                                          createdBy: 'Admin',
                                                          dateCreated:
                                                              getCurrentTimestamp,
                                                          read: false,
                                                          messageType:
                                                              'picture',
                                                          picture: _model
                                                              .uploadedFileUrl,
                                                        ));
                                                    _model.messageCreated34 =
                                                        ChatsSupportRecord
                                                            .getDocumentFromData(
                                                                createChatsSupportRecordData(
                                                                  createdBy:
                                                                      'Admin',
                                                                  dateCreated:
                                                                      getCurrentTimestamp,
                                                                  read: false,
                                                                  messageType:
                                                                      'picture',
                                                                  picture: _model
                                                                      .uploadedFileUrl,
                                                                ),
                                                                chatsSupportRecordReference1);

                                                    firestoreBatch.update(
                                                        widget.transactionRef!,
                                                        {
                                                          ...createUserTransactionsRecordData(
                                                            lastMessage:
                                                                '{photo}',
                                                            chatLastTime:
                                                                getCurrentTimestamp,
                                                            adminChatAccessedTime:
                                                                getCurrentTimestamp,
                                                          ),
                                                          ...mapToFirestore(
                                                            {
                                                              'messageNumber':
                                                                  FieldValue
                                                                      .increment(
                                                                          1),
                                                            },
                                                          ),
                                                        });
                                                  } else {
                                                    var chatsSupportRecordReference2 =
                                                        ChatsSupportRecord
                                                            .createDoc(widget
                                                                .transactionRef!);
                                                    firestoreBatch.set(
                                                        chatsSupportRecordReference2,
                                                        createChatsSupportRecordData(
                                                          createdBy:
                                                              currentUserUid,
                                                          dateCreated:
                                                              getCurrentTimestamp,
                                                          read: false,
                                                          messageType:
                                                              'picture',
                                                          picture: _model
                                                              .uploadedFileUrl,
                                                        ));
                                                    _model.messageCreated24 =
                                                        ChatsSupportRecord
                                                            .getDocumentFromData(
                                                                createChatsSupportRecordData(
                                                                  createdBy:
                                                                      currentUserUid,
                                                                  dateCreated:
                                                                      getCurrentTimestamp,
                                                                  read: false,
                                                                  messageType:
                                                                      'picture',
                                                                  picture: _model
                                                                      .uploadedFileUrl,
                                                                ),
                                                                chatsSupportRecordReference2);

                                                    firestoreBatch.update(
                                                        widget.transactionRef!,
                                                        {
                                                          ...createUserTransactionsRecordData(
                                                            lastMessage:
                                                                '{photo}',
                                                            chatLastTime:
                                                                getCurrentTimestamp,
                                                          ),
                                                          ...mapToFirestore(
                                                            {
                                                              'messageNumber':
                                                                  FieldValue
                                                                      .increment(
                                                                          1),
                                                            },
                                                          ),
                                                        });
                                                  }
                                                }
                                              } finally {
                                                await firestoreBatch.commit();
                                              }

                                              setState(() {});
                                            },
                                            child: Icon(
                                              Icons.photo_camera,
                                              color: Color(0xFF8D8B92),
                                              size: 25.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Expanded(
                                        flex: 9,
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 8.0, 0.0),
                                          child: TextFormField(
                                            controller: _model.textController,
                                            focusNode:
                                                _model.textFieldFocusNode,
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              '_model.textController',
                                              Duration(milliseconds: 100),
                                              () => setState(() {}),
                                            ),
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              hintText: 'Type your message',
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium,
                                              enabledBorder: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              errorBorder: InputBorder.none,
                                              focusedErrorBorder:
                                                  InputBorder.none,
                                              contentPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 8.0),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                            maxLines: 5,
                                            minLines: 1,
                                            validator: _model
                                                .textControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                      if (_model.textController.text != null &&
                                          _model.textController.text != '')
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            final firestoreBatch =
                                                FirebaseFirestore.instance
                                                    .batch();
                                            try {
                                              if (valueOrDefault<bool>(
                                                  currentUserDocument?.admin,
                                                  false)) {
                                                var chatsSupportRecordReference1 =
                                                    ChatsSupportRecord
                                                        .createDoc(widget
                                                            .transactionRef!);
                                                firestoreBatch.set(
                                                    chatsSupportRecordReference1,
                                                    createChatsSupportRecordData(
                                                      message: _model
                                                          .textController.text,
                                                      createdBy: 'Admin',
                                                      dateCreated:
                                                          getCurrentTimestamp,
                                                      read: false,
                                                      messageType: 'text',
                                                    ));
                                                _model.messageCreated =
                                                    ChatsSupportRecord
                                                        .getDocumentFromData(
                                                            createChatsSupportRecordData(
                                                              message: _model
                                                                  .textController
                                                                  .text,
                                                              createdBy:
                                                                  'Admin',
                                                              dateCreated:
                                                                  getCurrentTimestamp,
                                                              read: false,
                                                              messageType:
                                                                  'text',
                                                            ),
                                                            chatsSupportRecordReference1);

                                                firestoreBatch.update(
                                                    widget.transactionRef!, {
                                                  ...createUserTransactionsRecordData(
                                                    lastMessage: _model
                                                        .messageCreated
                                                        ?.message,
                                                    chatLastTime:
                                                        getCurrentTimestamp,
                                                    adminChatAccessedTime:
                                                        getCurrentTimestamp,
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'messageNumber':
                                                          FieldValue.increment(
                                                              1),
                                                    },
                                                  ),
                                                });
                                                _model.singleUser =
                                                    await queryUserCollectionRecordOnce(
                                                  queryBuilder:
                                                      (userCollectionRecord) =>
                                                          userCollectionRecord
                                                              .where(
                                                    'uid',
                                                    isEqualTo:
                                                        chatTransactionsChatUserTransactionsRecord
                                                            .userID,
                                                  ),
                                                  singleRecord: true,
                                                ).then((s) => s.firstOrNull);
                                                triggerPushNotification(
                                                  notificationTitle:
                                                      'New reply from Admin',
                                                  notificationText: _model
                                                              .messageCreated
                                                              ?.messageType ==
                                                          'picture'
                                                      ? '{Sent a Picture}'
                                                      : _model.messageCreated!
                                                          .message,
                                                  notificationImageUrl:
                                                      _model.uploadedFileUrl,
                                                  notificationSound: 'default',
                                                  userRefs: [
                                                    _model.singleUser!.reference
                                                  ],
                                                  initialPageName:
                                                      'ChatTransactionsChat',
                                                  parameterData: {
                                                    'transactionRef':
                                                        widget.transactionRef,
                                                    'buyOrder': widget.buyOrder,
                                                  },
                                                );
                                                setState(() {
                                                  _model.textController
                                                      ?.clear();
                                                });
                                              } else {
                                                var chatsSupportRecordReference2 =
                                                    ChatsSupportRecord
                                                        .createDoc(widget
                                                            .transactionRef!);
                                                firestoreBatch.set(
                                                    chatsSupportRecordReference2,
                                                    createChatsSupportRecordData(
                                                      message: _model
                                                          .textController.text,
                                                      createdBy: currentUserUid,
                                                      dateCreated:
                                                          getCurrentTimestamp,
                                                      read: false,
                                                      messageType: 'text',
                                                    ));
                                                _model.messageCreated2 =
                                                    ChatsSupportRecord
                                                        .getDocumentFromData(
                                                            createChatsSupportRecordData(
                                                              message: _model
                                                                  .textController
                                                                  .text,
                                                              createdBy:
                                                                  currentUserUid,
                                                              dateCreated:
                                                                  getCurrentTimestamp,
                                                              read: false,
                                                              messageType:
                                                                  'text',
                                                            ),
                                                            chatsSupportRecordReference2);

                                                firestoreBatch.update(
                                                    widget.transactionRef!, {
                                                  ...createUserTransactionsRecordData(
                                                    lastMessage: _model
                                                        .messageCreated2
                                                        ?.message,
                                                    chatLastTime:
                                                        getCurrentTimestamp,
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'messageNumber':
                                                          FieldValue.increment(
                                                              1),
                                                    },
                                                  ),
                                                });
                                                _model.adminFound =
                                                    await queryUserCollectionRecordOnce(
                                                  queryBuilder:
                                                      (userCollectionRecord) =>
                                                          userCollectionRecord
                                                              .where(
                                                    'Admin',
                                                    isEqualTo: true,
                                                  ),
                                                );
                                                triggerPushNotification(
                                                  notificationTitle:
                                                      'New message from user',
                                                  notificationText: _model
                                                              .messageCreated2
                                                              ?.messageType ==
                                                          'picture'
                                                      ? '{Sent a Picture}'
                                                      : _model.messageCreated2!
                                                          .message,
                                                  notificationImageUrl:
                                                      _model.uploadedFileUrl,
                                                  userRefs: _model.adminFound!
                                                      .map((e) => e.reference)
                                                      .toList(),
                                                  initialPageName:
                                                      'ChatTransactionsChat',
                                                  parameterData: {
                                                    'transactionRef':
                                                        widget.transactionRef,
                                                    'buyOrder': widget.buyOrder,
                                                  },
                                                );
                                                setState(() {
                                                  _model.textController
                                                      ?.clear();
                                                });
                                              }
                                            } finally {
                                              await firestoreBatch.commit();
                                            }

                                            setState(() {});
                                          },
                                          child: Icon(
                                            Icons.send_sharp,
                                            color: Color(0xFF8D8B92),
                                            size: 30.0,
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ].divide(SizedBox(width: 12.0)),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Container(
                        width: 100.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              22.0, 0.0, 22.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Transaction Id: ${functions.removeUserTransactionsREF(widget.transactionRef!.id)}'
                                    .maybeHandleOverflow(
                                  maxChars: 30,
                                  replacement: '…',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Oxygen',
                                      fontSize: 13.0,
                                    ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 8.0, 8.0, 8.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    if (valueOrDefault<bool>(
                                        currentUserDocument?.admin, false)) {
                                      context.pushNamed(
                                        'TransactiontrackingADMIN',
                                        queryParameters: {
                                          'transactionId': serializeParam(
                                            widget.transactionRef,
                                            ParamType.DocumentReference,
                                          ),
                                          'chatOn': serializeParam(
                                            chatTransactionsChatUserTransactionsRecord
                                                    .chatStatus ==
                                                'open',
                                            ParamType.bool,
                                          ),
                                          'boughtOn': serializeParam(
                                            chatTransactionsChatUserTransactionsRecord
                                                    .transactionType ==
                                                'bought',
                                            ParamType.bool,
                                          ),
                                          'transactionStatus': serializeParam(
                                            chatTransactionsChatUserTransactionsRecord
                                                .transactionStatus,
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );
                                    } else {
                                      context.pushNamed(
                                        'Transactiontracking',
                                        queryParameters: {
                                          'transactionId': serializeParam(
                                            widget.transactionRef,
                                            ParamType.DocumentReference,
                                          ),
                                        }.withoutNulls,
                                      );
                                    }
                                  },
                                  text: 'View Details',
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Oxygen',
                                          color: Colors.white,
                                        ),
                                    elevation: 3.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
