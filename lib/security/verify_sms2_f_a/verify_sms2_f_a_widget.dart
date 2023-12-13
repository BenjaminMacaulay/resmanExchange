import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/back_component_widget.dart';
import '/components/error_screen_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'verify_sms2_f_a_model.dart';
export 'verify_sms2_f_a_model.dart';

class VerifySms2FAWidget extends StatefulWidget {
  const VerifySms2FAWidget({Key? key}) : super(key: key);

  @override
  _VerifySms2FAWidgetState createState() => _VerifySms2FAWidgetState();
}

class _VerifySms2FAWidgetState extends State<VerifySms2FAWidget> {
  late VerifySms2FAModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VerifySms2FAModel());

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
      builder: (context) => StreamBuilder<List<VerificationCodesRecord>>(
        stream: queryVerificationCodesRecord(
          queryBuilder: (verificationCodesRecord) => verificationCodesRecord
              .where(
                'EmailOrPhone',
                isEqualTo: currentPhoneNumber,
                isNull: (currentPhoneNumber) == null,
              )
              .where(
                'UserUID',
                isEqualTo: currentUserUid,
                isNull: (currentUserUid) == null,
              )
              .orderBy('CreatedDate', descending: true),
          limit: 2,
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
          List<VerificationCodesRecord>
              verifySms2FAVerificationCodesRecordList = snapshot.data!;
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
                          pageName: 'SMS',
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
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 25.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 14.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              'assets/images/Sms_icons.png',
                                              width: 112.0,
                                              height: 92.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: RichText(
                                            textScaleFactor:
                                                MediaQuery.of(context)
                                                    .textScaleFactor,
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: 'Enter the ',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Oxygen',
                                                        color:
                                                            Color(0xFF8D8B92),
                                                        fontSize: 12.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                                TextSpan(
                                                  text: 'CODE',
                                                  style: TextStyle(),
                                                ),
                                                TextSpan(
                                                  text: ' sent to ',
                                                  style: TextStyle(
                                                    color: Color(0xFF8D8B92),
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: currentPhoneNumber,
                                                  style: TextStyle(),
                                                )
                                              ],
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Oxygen',
                                                    color: Color(0xFFFFAA2E),
                                                    fontSize: 12.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 25.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      30.0, 0.0, 30.0, 0.0),
                                              child: Container(
                                                width: 100.0,
                                                height: 44.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0x002D2D2D),
                                                ),
                                                child: PinCodeTextField(
                                                  autoDisposeControllers: false,
                                                  appContext: context,
                                                  length: 5,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily: 'Oxygen',
                                                        fontSize: 13.0,
                                                      ),
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  enableActiveFill: true,
                                                  autoFocus: true,
                                                  enablePinAutofill: true,
                                                  errorTextSpace: 16.0,
                                                  showCursor: true,
                                                  cursorColor: Colors.white,
                                                  obscureText: true,
                                                  obscuringCharacter: '●',
                                                  hintCharacter: '-',
                                                  keyboardType:
                                                      TextInputType.number,
                                                  pinTheme: PinTheme(
                                                    fieldHeight: 40.0,
                                                    fieldWidth: 40.0,
                                                    borderWidth: 2.0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                    shape:
                                                        PinCodeFieldShape.box,
                                                    activeColor:
                                                        Color(0xFFFFAA2E),
                                                    inactiveColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .alternate,
                                                    selectedColor:
                                                        Color(0xFFFFAA2E),
                                                    activeFillColor:
                                                        Color(0xFFFFAA2E),
                                                    inactiveFillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .alternate,
                                                    selectedFillColor:
                                                        Color(0xFFFFAA2E),
                                                  ),
                                                  controller:
                                                      _model.pinCodeController,
                                                  onChanged: (_) {},
                                                  autovalidateMode:
                                                      AutovalidateMode
                                                          .onUserInteraction,
                                                  validator: _model
                                                      .pinCodeControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 25.0, 0.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.timerController.onStartTimer();
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Didn\'t receive the OTP?',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Oxygen',
                                                    color: Color(0xFF8D8B92),
                                                    fontSize: 13.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                            Text(
                                              'Resend CODE?',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Oxygen',
                                                        color:
                                                            Color(0xFFFFAA2E),
                                                        fontSize: 13.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                            FlutterFlowTimer(
                                              initialTime:
                                                  _model.timerMilliseconds,
                                              getDisplayTime: (value) =>
                                                  StopWatchTimer.getDisplayTime(
                                                value,
                                                hours: false,
                                                milliSecond: false,
                                              ),
                                              controller:
                                                  _model.timerController,
                                              updateStateInterval:
                                                  Duration(milliseconds: 10),
                                              onChanged: (value, displayTime,
                                                  shouldUpdate) {
                                                _model.timerMilliseconds =
                                                    value;
                                                _model.timerValue = displayTime;
                                                if (shouldUpdate)
                                                  setState(() {});
                                              },
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily: 'Oxygen',
                                                        color:
                                                            Color(0x00FFFFFF),
                                                        fontSize: 0.0,
                                                      ),
                                            ),
                                          ].divide(SizedBox(width: 8.0)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ].addToEnd(SizedBox(height: 120.0)),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(23.0, 0.0, 23.0, 60.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                if (_model.pinCodeController!.text ==
                                    verifySms2FAVerificationCodesRecordList
                                        .first.token) {
                                  ScaffoldMessenger.of(context)
                                      .clearSnackBars();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Sms verification successfully added',
                                        style: GoogleFonts.getFont(
                                          'Work Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 14.0,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 2000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                    ),
                                  );

                                  await currentUserReference!
                                      .update(createUserCollectionRecordData(
                                    twofADetails:
                                        createVerificationChoiceStruct(
                                      phoneVerification: true,
                                      clearUnsetFields: false,
                                    ),
                                  ));
                                  context.safePop();
                                } else {
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    enableDrag: false,
                                    context: context,
                                    builder: (context) {
                                      return WebViewAware(
                                          child: GestureDetector(
                                        onTap: () => _model
                                                .unfocusNode.canRequestFocus
                                            ? FocusScope.of(context)
                                                .requestFocus(
                                                    _model.unfocusNode)
                                            : FocusScope.of(context).unfocus(),
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: ErrorScreenWidget(
                                            errorMessage: 'Codes do not match',
                                          ),
                                        ),
                                      ));
                                    },
                                  ).then((value) => safeSetState(() {}));
                                }
                              },
                              child: Container(
                                width: 100.0,
                                height: 54.0,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      FlutterFlowTheme.of(context).primary,
                                      FlutterFlowTheme.of(context).secondary
                                    ],
                                    stops: [0.0, 1.0],
                                    begin: AlignmentDirectional(0.0, -1.0),
                                    end: AlignmentDirectional(0, 1.0),
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Continue',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Oxygen',
                                            fontSize: 13.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
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
