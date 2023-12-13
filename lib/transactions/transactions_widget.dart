import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/filterbottomsheet_widget.dart';
import '/components/navbar_widget.dart';
import '/components/no_transactions_empty_list_widget.dart';
import '/components/transaction_component_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
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
import 'transactions_model.dart';
export 'transactions_model.dart';

class TransactionsWidget extends StatefulWidget {
  const TransactionsWidget({Key? key}) : super(key: key);

  @override
  _TransactionsWidgetState createState() => _TransactionsWidgetState();
}

class _TransactionsWidgetState extends State<TransactionsWidget>
    with TickerProviderStateMixin {
  late TransactionsModel _model;

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
    _model = createModel(context, () => TransactionsModel());

    _model.noFilterController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
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
      builder: (context) => FutureBuilder<List<UserTransactionsRecord>>(
        future: queryUserTransactionsRecordOnce(
          queryBuilder: (userTransactionsRecord) => userTransactionsRecord
              .where(
                'userID',
                isEqualTo: currentUserUid,
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
          List<UserTransactionsRecord> transactionsUserTransactionsRecordList =
              snapshot.data!;
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Transaction history',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Oxygen',
                            fontSize: 13.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        FFAppState().update(() {
                          FFAppState().filterOn = 'on';
                        });
                      },
                      child: Container(
                        width: 30.0,
                        height: 30.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.asset(
                              'assets/images/Fliter_icon.png',
                            ).image,
                          ),
                          shape: BoxShape.circle,
                        ),
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
                child: Stack(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (FFAppState().filterOn == 'on')
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
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
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
                                                setState(() =>
                                                    _model.choiceChipsValue =
                                                        val?.first);
                                                _model.updatePage(() {
                                                  FFAppState()
                                                          .FilterTransactions =
                                                      _model.choiceChipsValue!;
                                                });
                                              },
                                              selectedChipStyle: ChipStyle(
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Oxygen',
                                                      color: Theme.of(context)
                                                                  .brightness ==
                                                              Brightness.dark
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText
                                                          : Colors.white,
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                                  _model.choiceChipsValue !=
                                                      null,
                                              alignment: WrapAlignment.start,
                                              controller: _model
                                                      .choiceChipsValueController ??=
                                                  FormFieldController<
                                                      List<String>>(
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
                            height: 200.0,
                            decoration: BoxDecoration(),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment(0.0, 0),
                                  child: FlutterFlowButtonTabBar(
                                    useToggleButtonStyle: false,
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily: 'Oxygen',
                                          fontSize: 13.0,
                                        ),
                                    unselectedLabelStyle: TextStyle(),
                                    labelColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    unselectedLabelColor:
                                        FlutterFlowTheme.of(context)
                                            .primaryText,
                                    backgroundColor: Color(0x004B39EF),
                                    borderColor:
                                        FlutterFlowTheme.of(context).primary,
                                    borderWidth: 2.0,
                                    borderRadius: 8.0,
                                    elevation: 0.0,
                                    buttonMargin:
                                        EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 8.0, 0.0),
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4.0, 4.0, 4.0, 4.0),
                                    tabs: [
                                      Tab(
                                        text: 'All',
                                      ),
                                      Tab(
                                        text: 'Bought',
                                      ),
                                      Tab(
                                        text: 'Sold',
                                      ),
                                    ],
                                    controller: _model.noFilterController,
                                  ),
                                ),
                                Expanded(
                                  child: TabBarView(
                                    controller: _model.noFilterController,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 16.0, 16.0, 0.0),
                                        child: Builder(
                                          builder: (context) {
                                            final all = () {
                                              if (FFAppState()
                                                      .FilterTransactions ==
                                                  'This week') {
                                                return transactionsUserTransactionsRecordList
                                                    .where((e) => functions
                                                        .filterDocumentsbyCurrentweek(
                                                            e.createdDate!))
                                                    .toList();
                                              } else if (FFAppState()
                                                      .FilterTransactions ==
                                                  'Last week') {
                                                return transactionsUserTransactionsRecordList
                                                    .where((e) => functions
                                                        .filterDocumentsbylastweek(
                                                            e.createdDate!))
                                                    .toList();
                                              } else if (FFAppState()
                                                      .FilterTransactions ==
                                                  'This month') {
                                                return transactionsUserTransactionsRecordList
                                                    .where((e) => functions
                                                        .filterDocumentsBycurrentMonth(
                                                            e.createdDate!))
                                                    .toList();
                                              } else if (FFAppState()
                                                      .FilterTransactions ==
                                                  'Last month') {
                                                return transactionsUserTransactionsRecordList
                                                    .where((e) => functions
                                                        .filterDocumentsbylastmonth(
                                                            e.createdDate!))
                                                    .toList();
                                              } else {
                                                return transactionsUserTransactionsRecordList;
                                              }
                                            }()
                                                .toList();
                                            if (all.isEmpty) {
                                              return Container(
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.7,
                                                child:
                                                    NoTransactionsEmptyListWidget(),
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
                                                return TransactionComponentWidget(
                                                  key: Key(
                                                      'Key5c2_${allIndex}_of_${all.length}'),
                                                  transactionDoc: allItem,
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 16.0, 16.0, 0.0),
                                        child: Builder(
                                          builder: (context) {
                                            final all = () {
                                              if (FFAppState()
                                                      .FilterTransactions ==
                                                  'This week') {
                                                return transactionsUserTransactionsRecordList
                                                    .where((e) =>
                                                        functions
                                                            .filterDocumentsbyCurrentweek(e
                                                                .createdDate!) &&
                                                        (e.transactionType ==
                                                            'bought'))
                                                    .toList();
                                              } else if (FFAppState()
                                                      .FilterTransactions ==
                                                  'Last week') {
                                                return transactionsUserTransactionsRecordList
                                                    .where((e) =>
                                                        functions
                                                            .filterDocumentsbylastweek(e
                                                                .createdDate!) &&
                                                        (e.transactionType ==
                                                            'bought'))
                                                    .toList();
                                              } else if (FFAppState()
                                                      .FilterTransactions ==
                                                  'This month') {
                                                return transactionsUserTransactionsRecordList
                                                    .where((e) =>
                                                        functions
                                                            .filterDocumentsBycurrentMonth(e
                                                                .createdDate!) &&
                                                        (e.transactionType ==
                                                            'bought'))
                                                    .toList();
                                              } else if (FFAppState()
                                                      .FilterTransactions ==
                                                  'Last month') {
                                                return transactionsUserTransactionsRecordList
                                                    .where((e) =>
                                                        functions
                                                            .filterDocumentsbylastmonth(e
                                                                .createdDate!) &&
                                                        (e.transactionType ==
                                                            'bought'))
                                                    .toList();
                                              } else {
                                                return transactionsUserTransactionsRecordList
                                                    .where((e) =>
                                                        e.transactionType ==
                                                        'bought')
                                                    .toList();
                                              }
                                            }()
                                                .toList();
                                            if (all.isEmpty) {
                                              return Container(
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.7,
                                                child:
                                                    NoTransactionsEmptyListWidget(),
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
                                                return TransactionComponentWidget(
                                                  key: Key(
                                                      'Keyma4_${allIndex}_of_${all.length}'),
                                                  transactionDoc: allItem,
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 16.0, 16.0, 0.0),
                                        child: Builder(
                                          builder: (context) {
                                            final all = () {
                                              if (FFAppState()
                                                      .FilterTransactions ==
                                                  'This week') {
                                                return transactionsUserTransactionsRecordList
                                                    .where((e) =>
                                                        functions
                                                            .filterDocumentsbyCurrentweek(e
                                                                .createdDate!) &&
                                                        (e.transactionType ==
                                                            'sold'))
                                                    .toList();
                                              } else if (FFAppState()
                                                      .FilterTransactions ==
                                                  'Last week') {
                                                return transactionsUserTransactionsRecordList
                                                    .where((e) =>
                                                        functions
                                                            .filterDocumentsbylastweek(e
                                                                .createdDate!) &&
                                                        (e.transactionType ==
                                                            'sold'))
                                                    .toList();
                                              } else if (FFAppState()
                                                      .FilterTransactions ==
                                                  'This month') {
                                                return transactionsUserTransactionsRecordList
                                                    .where((e) =>
                                                        functions
                                                            .filterDocumentsBycurrentMonth(e
                                                                .createdDate!) &&
                                                        (e.transactionType ==
                                                            'sold'))
                                                    .toList();
                                              } else if (FFAppState()
                                                      .FilterTransactions ==
                                                  'Last month') {
                                                return transactionsUserTransactionsRecordList
                                                    .where((e) =>
                                                        functions
                                                            .filterDocumentsbylastmonth(e
                                                                .createdDate!) &&
                                                        (e.transactionType ==
                                                            'sold'))
                                                    .toList();
                                              } else {
                                                return transactionsUserTransactionsRecordList
                                                    .where((e) =>
                                                        e.transactionType ==
                                                        'sold')
                                                    .toList();
                                              }
                                            }()
                                                .toList();
                                            if (all.isEmpty) {
                                              return Container(
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.7,
                                                child:
                                                    NoTransactionsEmptyListWidget(),
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
                                                return TransactionComponentWidget(
                                                  key: Key(
                                                      'Key82t_${allIndex}_of_${all.length}'),
                                                  transactionDoc: allItem,
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 12.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: wrapWithModel(
                                  model: _model.navbarModel,
                                  updateCallback: () => setState(() {}),
                                  child: NavbarWidget(
                                    pageNumber: 2,
                                  ),
                                ),
                              ),
                            ],
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
            ),
          );
        },
      ),
    );
  }
}
