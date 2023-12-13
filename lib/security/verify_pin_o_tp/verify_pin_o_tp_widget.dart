import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/back_component_widget.dart';
import '/components/dynamic_verify_button_widget.dart';
import '/components/reset_pin_time_for_spam_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/success/success_component/success_component_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'verify_pin_o_tp_model.dart';
export 'verify_pin_o_tp_model.dart';

class VerifyPinOTpWidget extends StatefulWidget {
  const VerifyPinOTpWidget({
    Key? key,
    required this.emailORPhone,
    required this.verifyDocument,
    required this.pageFrom,
    this.newPincodeORPassword,
  }) : super(key: key);

  final String? emailORPhone;
  final DocumentReference? verifyDocument;
  final String? pageFrom;
  final String? newPincodeORPassword;

  @override
  _VerifyPinOTpWidgetState createState() => _VerifyPinOTpWidgetState();
}

class _VerifyPinOTpWidgetState extends State<VerifyPinOTpWidget> {
  late VerifyPinOTpModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VerifyPinOTpModel());

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

    return StreamBuilder<VerificationCodesRecord>(
      stream: VerificationCodesRecord.getDocument(widget.verifyDocument!),
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
        final verifyPinOTpVerificationCodesRecord = snapshot.data!;
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
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
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              TextSpan(
                                                text: ' sent to ',
                                                style: TextStyle(
                                                  color: Color(0xFF8D8B92),
                                                ),
                                              ),
                                              TextSpan(
                                                text: valueOrDefault<String>(
                                                  widget.emailORPhone,
                                                  'emailORPhone',
                                                ),
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              )
                                            ],
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Oxygen',
                                                  color: Color(0xFFFFAA2E),
                                                  fontSize: 13.0,
                                                  fontWeight: FontWeight.w500,
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
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
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
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
                                                  shape: PinCodeFieldShape.box,
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
                                ],
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: wrapWithModel(
                                    model: _model.resetPinTimeForSpamModel,
                                    updateCallback: () => setState(() {}),
                                    updateOnChange: true,
                                    child: ResetPinTimeForSpamWidget(
                                      forgotpin: 'Forgot pin?',
                                      pInAction: 'RESET PIN',
                                      action: () async {
                                        setState(() {
                                          _model.code = functions
                                              .randomFiveDigitCode()
                                              .toString();
                                        });

                                        await widget.verifyDocument!.update(
                                            createVerificationCodesRecordData(
                                          token: _model.code,
                                          createdDate: getCurrentTimestamp,
                                        ));
                                        await action_blocks.brevoEmail(
                                          context,
                                          emailUser: currentUserEmail,
                                          usersName: valueOrDefault(
                                              currentUserDocument?.username,
                                              ''),
                                          subject: 'Email verification code',
                                          body:
                                              'Your verification code is ${valueOrDefault(currentUserDocument?.pinCode, '')}',
                                        );
                                        setState(() {});
                                        ScaffoldMessenger.of(context)
                                            .clearSnackBars();
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Verification code sent',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 14.0,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 1000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
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
                          child: wrapWithModel(
                            model: _model.dynamicVerifyButtonModel,
                            updateCallback: () => setState(() {}),
                            child: DynamicVerifyButtonWidget(
                              action: () async {
                                if (verifyPinOTpVerificationCodesRecord.token ==
                                    _model.pinCodeController!.text) {
                                  if (widget.pageFrom == 'pinchange') {
                                    await currentUserReference!
                                        .update(createUserCollectionRecordData(
                                      pinCode: widget.newPincodeORPassword,
                                    ));
                                    setState(() {
                                      FFAppState().pinValueForTransactions =
                                          widget.newPincodeORPassword!;
                                    });
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Pin code updated',
                                          style: TextStyle(
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
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      isDismissible: false,
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
                                              : FocusScope.of(context)
                                                  .unfocus(),
                                          child: Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: SuccessComponentWidget(
                                              successMessage:
                                                  'Your old pin has been changed. You can now authorize transactions with your new pin.',
                                              buttonContinue: 'Back home',
                                              action: () async {
                                                context.pushNamed(
                                                  'HomePage',
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
                                              },
                                            ),
                                          ),
                                        ));
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  }
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Pin codes do not match',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 14.0,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 2000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).error,
                                    ),
                                  );
                                }
                              },
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
    );
  }
}
