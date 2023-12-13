import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/skeleton_loader_widget.dart';
import '/components/transaction_timer_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'make_payment_model.dart';
export 'make_payment_model.dart';

class MakePaymentWidget extends StatefulWidget {
  const MakePaymentWidget({
    Key? key,
    required this.transactionRef,
  }) : super(key: key);

  final DocumentReference? transactionRef;

  @override
  _MakePaymentWidgetState createState() => _MakePaymentWidgetState();
}

class _MakePaymentWidgetState extends State<MakePaymentWidget> {
  late MakePaymentModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MakePaymentModel());

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
        final makePaymentUserTransactionsRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              appBar: AppBar(
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                automaticallyImplyLeading: false,
                title: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Make payment',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Oxygen',
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ].divide(SizedBox(width: 11.0)),
                ),
                actions: [],
                centerTitle: false,
                elevation: 0.0,
              ),
              body: SafeArea(
                top: true,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  22.0, 25.0, 22.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RichText(
                                    textScaleFactor:
                                        MediaQuery.of(context).textScaleFactor,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Order will be canceled in ',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Oxygen',
                                                color: Color(0xFF8D8B92),
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        )
                                      ],
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Oxygen',
                                            fontSize: 13.0,
                                          ),
                                    ),
                                  ),
                                  wrapWithModel(
                                    model: _model.transactionTimerModel,
                                    updateCallback: () => setState(() {}),
                                    updateOnChange: true,
                                    child: TransactionTimerWidget(
                                      customTime: true,
                                      colorPicked:
                                          FlutterFlowTheme.of(context).error,
                                      time: makePaymentUserTransactionsRecord
                                          .expiredDate!,
                                    ),
                                  ),
                                ].divide(SizedBox(width: 8.0)),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${makePaymentUserTransactionsRecord.countryCurrency.currencyCode} ${formatNumber(
                                      makePaymentUserTransactionsRecord
                                          .buyTransaction.amountToBuyCurrency,
                                      formatType: FormatType.decimal,
                                      decimalType: DecimalType.periodDecimal,
                                    )}',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Oxygen',
                                          fontSize: 35.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  26.0, 24.0, 18.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: RichText(
                                      textScaleFactor: MediaQuery.of(context)
                                          .textScaleFactor,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'STEP 1:  ',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Oxygen',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 13.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                          TextSpan(
                                            text:
                                                'Manually transfer the payment to our account using your selected payment platform with the info below:',
                                            style: TextStyle(
                                              color: Color(0xFF8D8B92),
                                            ),
                                          )
                                        ],
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Oxygen',
                                              fontSize: 13.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  26.0, 16.0, 18.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: RichText(
                                      textScaleFactor: MediaQuery.of(context)
                                          .textScaleFactor,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'CAUTION: ',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Oxygen',
                                                  color: Color(0xFFFFAA2E),
                                                  fontSize: 13.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                          TextSpan(
                                            text:
                                                'Pay with your own payment account that matches your Resma Exchange verified name. Else your order will be canceled and your account suspended.',
                                            style: TextStyle(
                                              color: Color(0xFF8D8B92),
                                            ),
                                          )
                                        ],
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Oxygen',
                                              fontSize: 13.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  22.0, 25.0, 22.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: AuthUserStreamWidget(
                                      builder: (context) => FutureBuilder<
                                          List<AdminBankAcctRecord>>(
                                        future: queryAdminBankAcctRecordOnce(
                                          queryBuilder: (adminBankAcctRecord) =>
                                              adminBankAcctRecord
                                                  .where(
                                                    'currencyCode',
                                                    isEqualTo:
                                                        currentUserDocument
                                                            ?.countryCurrency
                                                            ?.currencyCode,
                                                  )
                                                  .orderBy('createdDate',
                                                      descending: true),
                                          limit: 1,
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: Container(
                                                width: double.infinity,
                                                height: double.infinity,
                                                child: SkeletonLoaderWidget(
                                                  borderon: true,
                                                ),
                                              ),
                                            );
                                          }
                                          List<AdminBankAcctRecord>
                                              containerAdminBankAcctRecordList =
                                              snapshot.data!;
                                          return Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      15.0, 0.0, 15.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Name',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Oxygen',
                                                              fontSize: 13.0,
                                                            ),
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        5.0,
                                                                        0.0),
                                                            child: Text(
                                                              () {
                                                                if (currentUserDocument
                                                                        ?.countryCurrency
                                                                        ?.currencyCode ==
                                                                    'NGN') {
                                                                  return containerAdminBankAcctRecordList
                                                                      .first
                                                                      .adminNigerianAccount
                                                                      .accountName;
                                                                } else if (currentUserDocument
                                                                        ?.countryCurrency
                                                                        ?.currencyCode ==
                                                                    'ZAR') {
                                                                  return containerAdminBankAcctRecordList
                                                                      .first
                                                                      .adminSAfricanAccount
                                                                      .accountName;
                                                                } else {
                                                                  return containerAdminBankAcctRecordList
                                                                      .first
                                                                      .adminNigerianAccount
                                                                      .accountName;
                                                                }
                                                              }()
                                                                  .maybeHandleOverflow(
                                                                maxChars: 30,
                                                                replacement:
                                                                    '…',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Oxygen',
                                                                    fontSize:
                                                                        13.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                          ),
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              await _model
                                                                  .copyText(
                                                                context,
                                                                textToCopy: () {
                                                                  if (currentUserDocument
                                                                          ?.countryCurrency
                                                                          ?.currencyCode ==
                                                                      'NGN') {
                                                                    return containerAdminBankAcctRecordList
                                                                        .first
                                                                        .adminNigerianAccount
                                                                        .accountName;
                                                                  } else if (currentUserDocument
                                                                          ?.countryCurrency
                                                                          ?.currencyCode ==
                                                                      'ZAR') {
                                                                    return containerAdminBankAcctRecordList
                                                                        .first
                                                                        .adminSAfricanAccount
                                                                        .accountName;
                                                                  } else {
                                                                    return containerAdminBankAcctRecordList
                                                                        .first
                                                                        .adminNigerianAccount
                                                                        .accountName;
                                                                  }
                                                                }(),
                                                              );
                                                              setState(() {});
                                                            },
                                                            child: Container(
                                                              width: 20.0,
                                                              height: 20.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                image:
                                                                    DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  image: Image
                                                                      .asset(
                                                                    'assets/images/solar_copy-bold.png',
                                                                  ).image,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Account Number ',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Oxygen',
                                                              fontSize: 13.0,
                                                            ),
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            () {
                                                              if (currentUserDocument
                                                                      ?.countryCurrency
                                                                      ?.currencyCode ==
                                                                  'NGN') {
                                                                return containerAdminBankAcctRecordList
                                                                    .first
                                                                    .adminNigerianAccount
                                                                    .accountNumber;
                                                              } else if (currentUserDocument
                                                                      ?.countryCurrency
                                                                      ?.currencyCode ==
                                                                  'ZAR') {
                                                                return containerAdminBankAcctRecordList
                                                                    .first
                                                                    .adminSAfricanAccount
                                                                    .accountNumber;
                                                              } else {
                                                                return containerAdminBankAcctRecordList
                                                                    .first
                                                                    .adminNigerianAccount
                                                                    .accountNumber;
                                                              }
                                                            }()
                                                                .maybeHandleOverflow(
                                                              maxChars: 30,
                                                              replacement: '…',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Oxygen',
                                                                  fontSize:
                                                                      13.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          ),
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              await _model
                                                                  .copyText(
                                                                context,
                                                                textToCopy: () {
                                                                  if (currentUserDocument
                                                                          ?.countryCurrency
                                                                          ?.currencyCode ==
                                                                      'NGN') {
                                                                    return containerAdminBankAcctRecordList
                                                                        .first
                                                                        .adminNigerianAccount
                                                                        .accountNumber;
                                                                  } else if (currentUserDocument
                                                                          ?.countryCurrency
                                                                          ?.currencyCode ==
                                                                      'ZAR') {
                                                                    return containerAdminBankAcctRecordList
                                                                        .first
                                                                        .adminSAfricanAccount
                                                                        .accountNumber;
                                                                  } else {
                                                                    return containerAdminBankAcctRecordList
                                                                        .first
                                                                        .adminNigerianAccount
                                                                        .accountNumber;
                                                                  }
                                                                }(),
                                                              );
                                                            },
                                                            child: Container(
                                                              width: 20.0,
                                                              height: 20.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                image:
                                                                    DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  image: Image
                                                                      .asset(
                                                                    'assets/images/solar_copy-bold.png',
                                                                  ).image,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 8.0)),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Bank Name',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Oxygen',
                                                              fontSize: 13.0,
                                                            ),
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            () {
                                                              if (currentUserDocument
                                                                      ?.countryCurrency
                                                                      ?.currencyCode ==
                                                                  'NGN') {
                                                                return containerAdminBankAcctRecordList
                                                                    .first
                                                                    .adminNigerianAccount
                                                                    .bankName;
                                                              } else if (currentUserDocument
                                                                      ?.countryCurrency
                                                                      ?.currencyCode ==
                                                                  'ZAR') {
                                                                return containerAdminBankAcctRecordList
                                                                    .first
                                                                    .adminSAfricanAccount
                                                                    .bankName;
                                                              } else {
                                                                return containerAdminBankAcctRecordList
                                                                    .first
                                                                    .adminNigerianAccount
                                                                    .bankName;
                                                              }
                                                            }()
                                                                .maybeHandleOverflow(
                                                              maxChars: 30,
                                                              replacement: '…',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Oxygen',
                                                                  fontSize:
                                                                      13.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          ),
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              await _model
                                                                  .copyText(
                                                                context,
                                                                textToCopy: () {
                                                                  if (currentUserDocument
                                                                          ?.countryCurrency
                                                                          ?.currencyCode ==
                                                                      'NGN') {
                                                                    return containerAdminBankAcctRecordList
                                                                        .first
                                                                        .adminNigerianAccount
                                                                        .bankName;
                                                                  } else if (currentUserDocument
                                                                          ?.countryCurrency
                                                                          ?.currencyCode ==
                                                                      'ZAR') {
                                                                    return containerAdminBankAcctRecordList
                                                                        .first
                                                                        .adminSAfricanAccount
                                                                        .bankName;
                                                                  } else {
                                                                    return containerAdminBankAcctRecordList
                                                                        .first
                                                                        .adminNigerianAccount
                                                                        .bankName;
                                                                  }
                                                                }(),
                                                              );
                                                            },
                                                            child: Container(
                                                              width: 20.0,
                                                              height: 20.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                image:
                                                                    DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  image: Image
                                                                      .asset(
                                                                    'assets/images/solar_copy-bold.png',
                                                                  ).image,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 8.0)),
                                                      ),
                                                    ],
                                                  ),
                                                  if (currentUserDocument
                                                          ?.countryCurrency
                                                          ?.currencyCode ==
                                                      'ZAR')
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Branch Code',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Oxygen',
                                                                fontSize: 13.0,
                                                              ),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              containerAdminBankAcctRecordList
                                                                  .first
                                                                  .adminSAfricanAccount
                                                                  .bankCode
                                                                  .maybeHandleOverflow(
                                                                maxChars: 30,
                                                                replacement:
                                                                    '…',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Oxygen',
                                                                    fontSize:
                                                                        13.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                await _model
                                                                    .copyText(
                                                                  context,
                                                                  textToCopy: containerAdminBankAcctRecordList
                                                                      .first
                                                                      .adminSAfricanAccount
                                                                      .bankCode,
                                                                );
                                                              },
                                                              child: Container(
                                                                width: 20.0,
                                                                height: 20.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  image:
                                                                      DecorationImage(
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    image: Image
                                                                        .asset(
                                                                      'assets/images/solar_copy-bold.png',
                                                                    ).image,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 8.0)),
                                                        ),
                                                      ],
                                                    ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Ref Message',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Oxygen',
                                                              fontSize: 13.0,
                                                            ),
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            functions
                                                                .removeUserTransactionsREF(
                                                                    widget
                                                                        .transactionRef!
                                                                        .id),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Oxygen',
                                                                  fontSize:
                                                                      13.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          ),
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              await _model
                                                                  .copyText(
                                                                context,
                                                                textToCopy: functions
                                                                    .removeUserTransactionsREF(
                                                                        widget
                                                                            .transactionRef!
                                                                            .id),
                                                              );
                                                              setState(() {});
                                                            },
                                                            child: Container(
                                                              width: 20.0,
                                                              height: 20.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                image:
                                                                    DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  image: Image
                                                                      .asset(
                                                                    'assets/images/solar_copy-bold.png',
                                                                  ).image,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 8.0)),
                                                      ),
                                                    ],
                                                  ),
                                                ]
                                                    .divide(
                                                        SizedBox(height: 16.0))
                                                    .addToStart(
                                                        SizedBox(height: 16.0))
                                                    .addToEnd(
                                                        SizedBox(height: 20.0)),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  26.0, 16.0, 18.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: RichText(
                                      textScaleFactor: MediaQuery.of(context)
                                          .textScaleFactor,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'Ref Message! ',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Oxygen',
                                                  color: Color(0xFFFFAA2E),
                                                  fontSize: 13.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                          TextSpan(
                                            text:
                                                'Use the ref message tag in your transfer description for quick identification .',
                                            style: TextStyle(
                                              color: Color(0xFF8D8B92),
                                            ),
                                          )
                                        ],
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Oxygen',
                                              fontSize: 13.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ].addToEnd(SizedBox(height: 40.0)),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              22.0, 0.0, 22.0, 12.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                flex: 4,
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await widget.transactionRef!.update(
                                        createUserTransactionsRecordData(
                                      transactionStatus: 'failed',
                                    ));

                                    context.goNamed(
                                      'HomePage',
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.fade,
                                          duration: Duration(milliseconds: 0),
                                        ),
                                      },
                                    );
                                  },
                                  child: Container(
                                    width: 100.0,
                                    height: 54.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            makePaymentUserTransactionsRecord
                                                        .expiredDate! <
                                                    getCurrentTimestamp
                                                ? 'Order cancelled, Back to home.'
                                                : 'Cancel Order',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Oxygen',
                                                  fontSize: 13.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              if (getCurrentTimestamp <
                                  makePaymentUserTransactionsRecord
                                      .expiredDate!)
                                Expanded(
                                  flex: 7,
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await widget.transactionRef!.update(
                                          createUserTransactionsRecordData(
                                        chatStatus: 'open',
                                        createdDate: getCurrentTimestamp,
                                      ));
                                      await action_blocks.notifyAmin(
                                        context,
                                        buyOrder: true,
                                        coinImage:
                                            makePaymentUserTransactionsRecord
                                                .cryptoChoice.imageCoin,
                                        transactionsRef:
                                            makePaymentUserTransactionsRecord
                                                .reference,
                                      );
                                      setState(() {});

                                      context.goNamed(
                                        'ChatTransactionsChat',
                                        queryParameters: {
                                          'transactionRef': serializeParam(
                                            widget.transactionRef,
                                            ParamType.DocumentReference,
                                          ),
                                          'buyOrder': serializeParam(
                                            makePaymentUserTransactionsRecord
                                                    .transactionType ==
                                                'bought',
                                            ParamType.bool,
                                          ),
                                          'chatON': serializeParam(
                                            makePaymentUserTransactionsRecord
                                                    .chatStatus ==
                                                'open',
                                            ParamType.bool,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.fade,
                                            duration: Duration(milliseconds: 0),
                                          ),
                                        },
                                      );
                                    },
                                    child: Container(
                                      width: 100.0,
                                      height: 54.0,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                            FlutterFlowTheme.of(context)
                                                .secondary
                                          ],
                                          stops: [0.0, 1.0],
                                          begin:
                                              AlignmentDirectional(0.0, -1.0),
                                          end: AlignmentDirectional(0, 1.0),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'I have made payment',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Oxygen',
                                                  color: Colors.white,
                                                  fontSize: 13.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                            ].divide(SizedBox(width: 12.0)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
