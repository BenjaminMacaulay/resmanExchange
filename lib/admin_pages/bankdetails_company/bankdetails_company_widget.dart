import '/backend/backend.dart';
import '/components/back_component_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'bankdetails_company_model.dart';
export 'bankdetails_company_model.dart';

class BankdetailsCompanyWidget extends StatefulWidget {
  const BankdetailsCompanyWidget({Key? key}) : super(key: key);

  @override
  _BankdetailsCompanyWidgetState createState() =>
      _BankdetailsCompanyWidgetState();
}

class _BankdetailsCompanyWidgetState extends State<BankdetailsCompanyWidget> {
  late BankdetailsCompanyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BankdetailsCompanyModel());

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

    return FutureBuilder<List<AdminBankAcctRecord>>(
      future: queryAdminBankAcctRecordOnce(
        queryBuilder: (adminBankAcctRecord) =>
            adminBankAcctRecord.orderBy('createdDate', descending: true),
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
        List<AdminBankAcctRecord> bankdetailsCompanyAdminBankAcctRecordList =
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
                children: [
                  wrapWithModel(
                    model: _model.backComponentModel,
                    updateCallback: () => setState(() {}),
                    child: BackComponentWidget(
                      pageName: 'Company Bank Account',
                      actionSet: false,
                      action: () async {},
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
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(22.0, 0.0, 22.0, 0.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SingleChildScrollView(
                        primary: false,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FlutterFlowDropDown<String>(
                              controller: _model.dropDownValueController ??=
                                  FormFieldController<String>(null),
                              options: ['NGN', 'ZAR'],
                              onChanged: (val) =>
                                  setState(() => _model.dropDownValue = val),
                              width: 150.0,
                              height: 50.0,
                              textStyle:
                                  FlutterFlowTheme.of(context).bodyMedium,
                              hintText: 'NGN',
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              elevation: 2.0,
                              borderColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderWidth: 2.0,
                              borderRadius: 8.0,
                              margin: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 4.0, 16.0, 4.0),
                              hidesUnderline: true,
                              isSearchable: false,
                              isMultiSelect: false,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 0.0),
                              child: Builder(
                                builder: (context) {
                                  final adminBankAccount = (_model
                                                      .dropDownValue !=
                                                  null &&
                                              _model.dropDownValue != ''
                                          ? bankdetailsCompanyAdminBankAcctRecordList
                                              .where((e) =>
                                                  e.currencyCode ==
                                                  _model.dropDownValue)
                                              .toList()
                                          : bankdetailsCompanyAdminBankAcctRecordList)
                                      .toList();
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: adminBankAccount.length,
                                    itemBuilder:
                                        (context, adminBankAccountIndex) {
                                      final adminBankAccountItem =
                                          adminBankAccount[
                                              adminBankAccountIndex];
                                      return Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 12.0, 0.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  if (adminBankAccountItem
                                                          .currencyCode ==
                                                      'NGN') {
                                                    context.pushNamed(
                                                      'addANewBank_NGNCopy',
                                                      queryParameters: {
                                                        'adminBankRef':
                                                            serializeParam(
                                                          adminBankAccountItem
                                                              .reference,
                                                          ParamType
                                                              .DocumentReference,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        kTransitionInfoKey:
                                                            TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .fade,
                                                          duration: Duration(
                                                              milliseconds: 0),
                                                        ),
                                                      },
                                                    );
                                                  } else {
                                                    context.pushNamed(
                                                      'addANewBank_SACopy',
                                                      queryParameters: {
                                                        'adminBankEdit':
                                                            serializeParam(
                                                          adminBankAccountItem
                                                              .reference,
                                                          ParamType
                                                              .DocumentReference,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        kTransitionInfoKey:
                                                            TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .fade,
                                                          duration: Duration(
                                                              milliseconds: 0),
                                                        ),
                                                      },
                                                    );
                                                  }
                                                },
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  child: Container(
                                                    width: 60.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  18.0,
                                                                  12.0,
                                                                  21.0,
                                                                  12.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Expanded(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      () {
                                                                        if (adminBankAccountItem.currencyCode ==
                                                                            'NGN') {
                                                                          return adminBankAccountItem
                                                                              .adminNigerianAccount
                                                                              .accountName;
                                                                        } else if (adminBankAccountItem.currencyCode ==
                                                                            'ZAR') {
                                                                          return adminBankAccountItem
                                                                              .adminSAfricanAccount
                                                                              .accountName;
                                                                        } else {
                                                                          return adminBankAccountItem
                                                                              .adminNigerianAccount
                                                                              .accountName;
                                                                        }
                                                                      }(),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Oxygen',
                                                                            fontSize:
                                                                                13.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      () {
                                                                        if (adminBankAccountItem.currencyCode ==
                                                                            'NGN') {
                                                                          return adminBankAccountItem
                                                                              .adminNigerianAccount
                                                                              .accountNumber;
                                                                        } else if (adminBankAccountItem.currencyCode ==
                                                                            'ZAR') {
                                                                          return adminBankAccountItem
                                                                              .adminSAfricanAccount
                                                                              .accountNumber;
                                                                        } else {
                                                                          return adminBankAccountItem
                                                                              .adminNigerianAccount
                                                                              .accountNumber;
                                                                        }
                                                                      }(),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Oxygen',
                                                                            color:
                                                                                Color(0xFF8D8B92),
                                                                            fontSize:
                                                                                12.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      () {
                                                                        if (adminBankAccountItem.currencyCode ==
                                                                            'NGN') {
                                                                          return adminBankAccountItem
                                                                              .adminNigerianAccount
                                                                              .bankName;
                                                                        } else if (adminBankAccountItem.currencyCode ==
                                                                            'ZAR') {
                                                                          return adminBankAccountItem
                                                                              .adminSAfricanAccount
                                                                              .bankName;
                                                                        } else {
                                                                          return adminBankAccountItem
                                                                              .adminNigerianAccount
                                                                              .bankName;
                                                                        }
                                                                      }(),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Oxygen',
                                                                            color:
                                                                                Color(0xFF8D8B92),
                                                                            fontSize:
                                                                                12.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      height:
                                                                          3.0)),
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      adminBankAccountItem
                                                                          .currencyCode,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Oxygen',
                                                                            color:
                                                                                Color(0xFFFFAA2E),
                                                                            fontSize:
                                                                                13.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                          ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      height:
                                                                          3.0)),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  height:
                                                                      12.0)),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ].divide(SizedBox(width: 8.0)),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ].divide(SizedBox(height: 12.0)),
                        ),
                      ),
                    ].divide(SizedBox(height: 25.0)),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
