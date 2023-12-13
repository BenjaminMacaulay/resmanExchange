import '/backend/backend.dart';
import '/components/back_component_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'support_chats_opened_admin_model.dart';
export 'support_chats_opened_admin_model.dart';

class SupportChatsOpenedAdminWidget extends StatefulWidget {
  const SupportChatsOpenedAdminWidget({Key? key}) : super(key: key);

  @override
  _SupportChatsOpenedAdminWidgetState createState() =>
      _SupportChatsOpenedAdminWidgetState();
}

class _SupportChatsOpenedAdminWidgetState
    extends State<SupportChatsOpenedAdminWidget> {
  late SupportChatsOpenedAdminModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SupportChatsOpenedAdminModel());

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

    return FutureBuilder<List<UserTransactionsRecord>>(
      future: queryUserTransactionsRecordOnce(
        queryBuilder: (userTransactionsRecord) => userTransactionsRecord
            .where(
              'CreatedDate',
              isGreaterThan: functions.generateTimeStampThreeMonthsAgo(),
            )
            .orderBy('CreatedDate', descending: true),
      ),
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
        List<UserTransactionsRecord>
            supportChatsOpenedAdminUserTransactionsRecordList = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: wrapWithModel(
                      model: _model.backComponentModel,
                      updateCallback: () => setState(() {}),
                      child: BackComponentWidget(
                        pageName: 'Support Chat',
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
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Container(
                          width: 100.0,
                          height: 1.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Filter by Period:',
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    FlutterFlowChoiceChips(
                                      options: [
                                        ChipData('All time'),
                                        ChipData('This week'),
                                        ChipData('Last week'),
                                        ChipData('This month'),
                                        ChipData('Last month')
                                      ],
                                      onChanged: (val) async {
                                        setState(() => _model
                                            .choiceChipsValue1 = val?.first);
                                        _model.updatePage(() {
                                          FFAppState().FilterTransactions =
                                              _model.choiceChipsValue1!;
                                        });
                                      },
                                      selectedChipStyle: ChipStyle(
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Oxygen',
                                              color: Colors.white,
                                            ),
                                        iconColor: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        iconSize: 18.0,
                                        elevation: 4.0,
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      unselectedChipStyle: ChipStyle(
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Oxygen',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                        iconColor: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        iconSize: 18.0,
                                        elevation: 0.0,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        borderWidth: 1.0,
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      chipSpacing: 12.0,
                                      rowSpacing: 12.0,
                                      multiselect: false,
                                      initialized:
                                          _model.choiceChipsValue1 != null,
                                      alignment: WrapAlignment.start,
                                      controller:
                                          _model.choiceChipsValueController1 ??=
                                              FormFieldController<List<String>>(
                                        ['All time'],
                                      ),
                                      wrapped: false,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ].divide(SizedBox(width: 11.0)),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Container(
                                width: 100.0,
                                height: 0.5,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                              ),
                            ),
                          ].divide(SizedBox(width: 11.0)),
                        ),
                      ].divide(SizedBox(height: 12.0)),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Filter by Status:',
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    FlutterFlowChoiceChips(
                                      options: [
                                        ChipData('open'),
                                        ChipData('failed')
                                      ],
                                      onChanged: (val) async {
                                        setState(() => _model
                                            .choiceChipsValue2 = val?.first);
                                        _model.updatePage(() {
                                          FFAppState().FilterTransactions =
                                              _model.choiceChipsValue2!;
                                        });
                                      },
                                      selectedChipStyle: ChipStyle(
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Oxygen',
                                              color: Colors.white,
                                            ),
                                        iconColor: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        iconSize: 18.0,
                                        elevation: 4.0,
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      unselectedChipStyle: ChipStyle(
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Oxygen',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                        iconColor: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        iconSize: 18.0,
                                        elevation: 0.0,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        borderWidth: 1.0,
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      chipSpacing: 12.0,
                                      rowSpacing: 12.0,
                                      multiselect: false,
                                      initialized:
                                          _model.choiceChipsValue2 != null,
                                      alignment: WrapAlignment.start,
                                      controller:
                                          _model.choiceChipsValueController2 ??=
                                              FormFieldController<List<String>>(
                                        ['open'],
                                      ),
                                      wrapped: false,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ].divide(SizedBox(width: 11.0)),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Container(
                                width: 100.0,
                                height: 0.5,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                              ),
                            ),
                          ].divide(SizedBox(width: 11.0)),
                        ),
                      ].divide(SizedBox(height: 12.0)),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(25.0, 0.0, 25.0, 0.0),
                      child: Builder(
                        builder: (context) {
                          final transactionChats = () {
                            if (FFAppState().FilterTransactions ==
                                'This week') {
                              return supportChatsOpenedAdminUserTransactionsRecordList
                                  .where((e) =>
                                      functions.filterDocumentsbyCurrentweek(
                                          e.createdDate!))
                                  .toList();
                            } else if (FFAppState().FilterTransactions ==
                                'Last week') {
                              return supportChatsOpenedAdminUserTransactionsRecordList
                                  .where((e) =>
                                      functions.filterDocumentsbylastweek(
                                          e.createdDate!))
                                  .toList();
                            } else if (FFAppState().FilterTransactions ==
                                'This month') {
                              return supportChatsOpenedAdminUserTransactionsRecordList
                                  .where((e) =>
                                      functions.filterDocumentsBycurrentMonth(
                                          e.createdDate!))
                                  .toList();
                            } else if (FFAppState().FilterTransactions ==
                                'Last month') {
                              return supportChatsOpenedAdminUserTransactionsRecordList
                                  .where((e) =>
                                      functions.filterDocumentsbylastmonth(
                                          e.createdDate!))
                                  .toList();
                            } else {
                              return supportChatsOpenedAdminUserTransactionsRecordList;
                            }
                          }()
                              .where((e) =>
                                  e.chatStatus == _model.choiceChipsValue2)
                              .toList();
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate(transactionChats.length,
                                (transactionChatsIndex) {
                              final transactionChatsItem =
                                  transactionChats[transactionChatsIndex];
                              return Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: 100.0,
                                      height: 70.0,
                                      decoration: BoxDecoration(
                                        color: Color(0x002D2D2D),
                                      ),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            'ChatTransactionsChat',
                                            queryParameters: {
                                              'transactionRef': serializeParam(
                                                transactionChatsItem.reference,
                                                ParamType.DocumentReference,
                                              ),
                                              'buyOrder': serializeParam(
                                                transactionChatsItem
                                                        .transactionType ==
                                                    'bought',
                                                ParamType.bool,
                                              ),
                                              'chatON': serializeParam(
                                                transactionChatsItem
                                                        .chatStatus ==
                                                    'open',
                                                ParamType.bool,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType.fade,
                                                duration:
                                                    Duration(milliseconds: 0),
                                              ),
                                            },
                                          );
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: 50.0,
                                              height: 50.0,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: Image.network(
                                                    transactionChatsItem
                                                        .cryptoChoice.imageCoin,
                                                  ).image,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 0.0, 0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            if (transactionChatsItem
                                                                    .transactionType ==
                                                                'bought')
                                                              GradientText(
                                                                'Buy order',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Work Sans',
                                                                      color: Color(
                                                                          0xFF8D8B92),
                                                                      fontSize:
                                                                          14.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                                colors: [
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary
                                                                ],
                                                                gradientDirection:
                                                                    GradientDirection
                                                                        .ltr,
                                                                gradientType:
                                                                    GradientType
                                                                        .linear,
                                                              ),
                                                            if (transactionChatsItem
                                                                    .transactionType ==
                                                                'sold')
                                                              Text(
                                                                'Sell order',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Work Sans',
                                                                      color: Color(
                                                                          0xFFFFD18D),
                                                                      fontSize:
                                                                          14.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                              ),
                                                          ].divide(SizedBox(
                                                              width: 8.0)),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              '${dateTimeFormat('yMMMd', transactionChatsItem.createdDate)} at ${dateTimeFormat('Hm', transactionChatsItem.createdDate)}'
                                                                  .maybeHandleOverflow(
                                                                maxChars: 54,
                                                                replacement:
                                                                    '…',
                                                              ),
                                                              maxLines: 1,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Work Sans',
                                                                    color: Color(
                                                                        0xFF8D8B92),
                                                                    fontSize:
                                                                        13.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    Text(
                                                      '#${transactionChatsItem.transactionsCodeRef}',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Work Sans',
                                                            color: Color(
                                                                0xFF8D8B92),
                                                            fontSize: 13.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                    ),
                                                    Text(
                                                      transactionChatsItem
                                                          .lastMessage
                                                          .maybeHandleOverflow(
                                                        maxChars: 54,
                                                        replacement: '…',
                                                      ),
                                                      maxLines: 1,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Work Sans',
                                                                color: Color(
                                                                    0xFF8D8B92),
                                                                fontSize: 13.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  3.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Container(
                                                              width: 100.0,
                                                              height: 0.5,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 5.0)),
                                                ),
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 10.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }).divide(SizedBox(height: 8.0)),
                          );
                        },
                      ),
                    ),
                  ),
                ].divide(SizedBox(height: 16.0)),
              ),
            ),
          ),
        );
      },
    );
  }
}
