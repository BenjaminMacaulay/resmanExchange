import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'coun_tries_select_model.dart';
export 'coun_tries_select_model.dart';

class CounTriesSelectWidget extends StatefulWidget {
  const CounTriesSelectWidget({Key? key}) : super(key: key);

  @override
  _CounTriesSelectWidgetState createState() => _CounTriesSelectWidgetState();
}

class _CounTriesSelectWidgetState extends State<CounTriesSelectWidget> {
  late CounTriesSelectModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CounTriesSelectModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: 300.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 4.0,
            color: Color(0x33000000),
            offset: Offset(0.0, 2.0),
          )
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(12.0),
          topRight: Radius.circular(12.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                  child: Text(
                    'Select your bank account',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Oxygen',
                          fontSize: 13.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ],
            ),
            Divider(
              height: 1.0,
              thickness: 1.0,
              color: FlutterFlowTheme.of(context).alternate,
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
              child: FutureBuilder<ApiCallResponse>(
                future: FFAppState()
                    .banks(
                  requestFn: () =>
                      PaystackTransactionsGroup.getBankCodeCall.call(
                    country: 'nigeria',
                  ),
                )
                    .then((result) {
                  _model.apiRequestCompleted = true;
                  return result;
                }),
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
                  final listViewGetBankCodeResponse = snapshot.data!;
                  return Builder(
                    builder: (context) {
                      final banksFound = getJsonField(
                        listViewGetBankCodeResponse.jsonBody,
                        r'''$.data''',
                      ).toList();
                      return RefreshIndicator(
                        color: FlutterFlowTheme.of(context).primary,
                        strokeWidth: 1.0,
                        onRefresh: () async {
                          setState(() {
                            FFAppState().clearBanksCache();
                            _model.apiRequestCompleted = false;
                          });
                          await _model.waitForApiRequestCompleted();
                        },
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: banksFound.length,
                          itemBuilder: (context, banksFoundIndex) {
                            final banksFoundItem = banksFound[banksFoundIndex];
                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                setState(() {
                                  FFAppState().updateUserBankSelectionStruct(
                                    (e) => e
                                      ..bankCode = getJsonField(
                                        banksFoundItem,
                                        r'''$.code''',
                                      ).toString()
                                      ..bankName = getJsonField(
                                        banksFoundItem,
                                        r'''$.name''',
                                      ).toString(),
                                  );
                                });
                                Navigator.pop(context);
                              },
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 150),
                                curve: Curves.easeInOut,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4.0, 0.0, 0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                getJsonField(
                                                  banksFoundItem,
                                                  r'''$.name''',
                                                ).toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Oxygen',
                                                          fontSize: 13.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          setState(() {
                                            FFAppState()
                                                .updateUserBankSelectionStruct(
                                              (e) => e
                                                ..bankCode = getJsonField(
                                                  banksFoundItem,
                                                  r'''$.code''',
                                                ).toString()
                                                ..bankName = getJsonField(
                                                  banksFoundItem,
                                                  r'''$.name''',
                                                ).toString(),
                                            );
                                          });
                                          Navigator.pop(context);
                                        },
                                        child: Icon(
                                          Icons.add_circle_outline_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 24.0,
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
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
