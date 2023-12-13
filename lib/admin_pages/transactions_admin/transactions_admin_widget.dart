import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/back_component_widget.dart';
import '/components/filterbottomsheet_widget.dart';
import '/components/no_transactions_empty_list_widget.dart';
import '/components/transaction_component_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'transactions_admin_model.dart';
export 'transactions_admin_model.dart';

class TransactionsAdminWidget extends StatefulWidget {
  const TransactionsAdminWidget({Key? key}) : super(key: key);

  @override
  _TransactionsAdminWidgetState createState() =>
      _TransactionsAdminWidgetState();
}

class _TransactionsAdminWidgetState extends State<TransactionsAdminWidget>
    with TickerProviderStateMixin {
  late TransactionsAdminModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'filterbottomsheetOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 180.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TransactionsAdminModel());

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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

    return AuthUserStreamWidget(
      builder: (context) => StreamBuilder<List<UserTransactionsRecord>>(
        stream: queryUserTransactionsRecord(
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
              transactionsAdminUserTransactionsRecordList = snapshot.data!;
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: wrapWithModel(
                        model: _model.backComponentModel,
                        updateCallback: () => setState(() {}),
                        child: BackComponentWidget(
                          pageName: 'Transaction history',
                          actionSet: false,
                          action: () async {},
                        ),
                      ),
                    ),
                  ].divide(SizedBox(width: 20.0)),
                ),
                actions: [],
                centerTitle: false,
                elevation: 0.0,
              ),
              body: Stack(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 12.0, 16.0, 16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Filter by :',
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
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
                                                .choiceChipsValue = val?.first);
                                            _model.updatePage(() {
                                              FFAppState().FilterTransactions =
                                                  _model.choiceChipsValue!;
                                            });
                                          },
                                          selectedChipStyle: ChipStyle(
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Oxygen',
                                                      color: Colors.white,
                                                    ),
                                            iconColor:
                                                FlutterFlowTheme.of(context)
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
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Oxygen',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                            iconColor:
                                                FlutterFlowTheme.of(context)
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
                                              _model.choiceChipsValue != null,
                                          alignment: WrapAlignment.start,
                                          controller: _model
                                                  .choiceChipsValueController ??=
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
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: 200.0,
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 16.0, 16.0, 0.0),
                            child: Builder(
                              builder: (context) {
                                final all = () {
                                  if (FFAppState().FilterTransactions ==
                                      'This week') {
                                    return transactionsAdminUserTransactionsRecordList
                                        .where((e) => functions
                                            .filterDocumentsbyCurrentweek(
                                                e.createdDate!))
                                        .toList();
                                  } else if (FFAppState().FilterTransactions ==
                                      'Last week') {
                                    return transactionsAdminUserTransactionsRecordList
                                        .where((e) =>
                                            functions.filterDocumentsbylastweek(
                                                e.createdDate!))
                                        .toList();
                                  } else if (FFAppState().FilterTransactions ==
                                      'This month') {
                                    return transactionsAdminUserTransactionsRecordList
                                        .where((e) => functions
                                            .filterDocumentsBycurrentMonth(
                                                e.createdDate!))
                                        .toList();
                                  } else if (FFAppState().FilterTransactions ==
                                      'Last month') {
                                    return transactionsAdminUserTransactionsRecordList
                                        .where((e) => functions
                                            .filterDocumentsbylastmonth(
                                                e.createdDate!))
                                        .toList();
                                  } else {
                                    return transactionsAdminUserTransactionsRecordList;
                                  }
                                }()
                                    .toList();
                                if (all.isEmpty) {
                                  return Container(
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.7,
                                    child: NoTransactionsEmptyListWidget(),
                                  );
                                }
                                return ListView.separated(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: all.length,
                                  separatorBuilder: (_, __) =>
                                      SizedBox(height: 18.0),
                                  itemBuilder: (context, allIndex) {
                                    final allItem = all[allIndex];
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Created at ${dateTimeFormat('MMMMEEEEd', allItem.createdDate)}-- Time ${dateTimeFormat('jm', allItem.createdDate)}',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Oxygen',
                                                        color:
                                                            Color(0xFF8D8B92),
                                                        fontSize: 13.0,
                                                      ),
                                            ),
                                            Expanded(
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  if (allItem
                                                          .transactionStatus ==
                                                      'success')
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFF189B62),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        12.0,
                                                                        12.0,
                                                                        12.0),
                                                            child: Text(
                                                              'Successful',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Oxygen',
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        13.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  if ((allItem.transactionStatus ==
                                                          'pending') &&
                                                      !functions
                                                          .diffBetweeenTimeAndCurrentTime24(
                                                              allItem
                                                                  .createdDate!))
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .textBox,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        12.0,
                                                                        12.0,
                                                                        12.0),
                                                            child: Text(
                                                              'Pending',
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
                                                                            .w600,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  if ((allItem.transactionStatus ==
                                                          'failed') ||
                                                      ((allItem.transactionStatus ==
                                                              'pending') &&
                                                          functions
                                                              .diffBetweeenTimeAndCurrentTime24(
                                                                  allItem
                                                                      .createdDate!)))
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        12.0,
                                                                        12.0,
                                                                        12.0),
                                                            child: Text(
                                                              'Failed',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Oxygen',
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        13.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        TransactionComponentWidget(
                                          key: Key(
                                              'Key4ls_${allIndex}_of_${all.length}'),
                                          transactionDoc: allItem,
                                        ),
                                      ].divide(SizedBox(height: 12.0)),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (_model.filterON ?? true)
                    Align(
                      alignment: AlignmentDirectional(0.00, 1.00),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: wrapWithModel(
                              model: _model.filterbottomsheetModel,
                              updateCallback: () => setState(() {}),
                              child: FilterbottomsheetWidget(
                                closeAction: () async {
                                  setState(() {
                                    _model.filterON = false;
                                  });
                                },
                              ),
                            ).animateOnActionTrigger(
                              animationsMap[
                                  'filterbottomsheetOnActionTriggerAnimation']!,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
