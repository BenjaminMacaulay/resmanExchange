import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/back_component_widget.dart';
import '/components/loading_screen_widget.dart';
import '/components/reset_pin_time_for_spam_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'phone_code_model.dart';
export 'phone_code_model.dart';

class PhoneCodeWidget extends StatefulWidget {
  const PhoneCodeWidget({
    Key? key,
    bool? disableBack,
    required this.phoneContact,
    required this.verificationCode,
  })  : this.disableBack = disableBack ?? false,
        super(key: key);

  final bool disableBack;
  final String? phoneContact;
  final DocumentReference? verificationCode;

  @override
  _PhoneCodeWidgetState createState() => _PhoneCodeWidgetState();
}

class _PhoneCodeWidgetState extends State<PhoneCodeWidget> {
  late PhoneCodeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PhoneCodeModel());

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        setState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
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
      stream: VerificationCodesRecord.getDocument(widget.verificationCode!),
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
        final phoneCodeVerificationCodesRecord = snapshot.data!;
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
                  children: [
                    Expanded(
                      child: wrapWithModel(
                        model: _model.backComponentModel,
                        updateCallback: () => setState(() {}),
                        child: BackComponentWidget(
                          pageName: 'SMS Verification  ',
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
                              Column(
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
                                            'assets/images/image_29.png',
                                            width: 112.0,
                                            height: 110.0,
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
                                                text: ' CODE ',
                                                style: TextStyle(),
                                              ),
                                              TextSpan(
                                                text: 'sent to ',
                                                style: TextStyle(
                                                  color: Color(0xFF8D8B92),
                                                  fontSize: 12.0,
                                                ),
                                              ),
                                              TextSpan(
                                                text: widget.phoneContact!,
                                                style: TextStyle(),
                                              )
                                            ],
                                            style: FlutterFlowTheme.of(context)
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    30.0, 0.0, 30.0, 0.0),
                                            child: Container(
                                              width: 100.0,
                                              height: 44.0,
                                              decoration: BoxDecoration(
                                                color: Color(0x002D2D2D),
                                              ),
                                              child: Form(
                                                key: _model.formKey,
                                                autovalidateMode:
                                                    AutovalidateMode.disabled,
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
                                                      AutovalidateMode.disabled,
                                                  validator: _model
                                                      .pinCodeControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
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
                                        forgotpin: 'Did not get the CODE?',
                                        pInAction: 'RESEND CODE',
                                        action: () async {
                                          showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            isDismissible: false,
                                            enableDrag: false,
                                            useSafeArea: true,
                                            context: context,
                                            builder: (context) {
                                              return WebViewAware(
                                                  child: GestureDetector(
                                                onTap: () => _model.unfocusNode
                                                        .canRequestFocus
                                                    ? FocusScope.of(context)
                                                        .requestFocus(
                                                            _model.unfocusNode)
                                                    : FocusScope.of(context)
                                                        .unfocus(),
                                                child: Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child: Container(
                                                    height: double.infinity,
                                                    child: LoadingScreenWidget(
                                                      action: () async {},
                                                    ),
                                                  ),
                                                ),
                                              ));
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));

                                          setState(() {
                                            _model.code3 = functions
                                                .randomFiveDigitCode()
                                                .toString();
                                          });

                                          await phoneCodeVerificationCodesRecord
                                              .reference
                                              .update(
                                                  createVerificationCodesRecordData(
                                            token: _model.code3,
                                            createdDate: getCurrentTimestamp,
                                          ));
                                          setState(() {
                                            _model.pinCodeController?.clear();
                                          });
                                          await action_blocks.brevoEmail(
                                            context,
                                            emailUser: currentUserEmail,
                                            usersName: valueOrDefault(
                                                currentUserDocument?.username,
                                                ''),
                                            subject: 'Email verification code',
                                            body:
                                                'Your verification code is ${_model.code3}',
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
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
                                          Navigator.pop(context);
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
                    if (!(isWeb
                        ? MediaQuery.viewInsetsOf(context).bottom > 0
                        : _isKeyboardVisible))
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            23.0, 0.0, 23.0, 60.0),
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
                                  final firestoreBatch =
                                      FirebaseFirestore.instance.batch();
                                  try {
                                    if (_model.formKey.currentState == null ||
                                        !_model.formKey.currentState!
                                            .validate()) {
                                      return;
                                    }
                                    if (phoneCodeVerificationCodesRecord
                                            .token ==
                                        _model.pinCodeController!.text) {
                                      firestoreBatch.update(
                                          currentUserReference!,
                                          createUserCollectionRecordData(
                                            phoneNumber: widget.phoneContact,
                                          ));

                                      firestoreBatch.set(
                                          UpdatedProfileRecord.collection.doc(),
                                          createUpdatedProfileRecordData(
                                            userRef: currentUserReference,
                                            propertyToChange: 'phone',
                                            dateCreated: getCurrentTimestamp,
                                          ));
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'updated successfully ',
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

                                      context.goNamed('profileDetails');
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Pin does not match',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 14.0,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 2000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                        ),
                                      );
                                    }
                                  } finally {
                                    await firestoreBatch.commit();
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
                                              fontSize: 14.0,
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
          ),
        );
      },
    );
  }
}
