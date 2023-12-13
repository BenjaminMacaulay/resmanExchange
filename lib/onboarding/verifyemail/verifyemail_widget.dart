import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/back_component_widget.dart';
import '/components/error_screen_widget.dart';
import '/components/loading_screen_widget.dart';
import '/components/reset_pin_time_for_spam_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
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
import 'verifyemail_model.dart';
export 'verifyemail_model.dart';

class VerifyemailWidget extends StatefulWidget {
  const VerifyemailWidget({
    Key? key,
    bool? disableBack,
    required this.verifyEmail,
  })  : this.disableBack = disableBack ?? false,
        super(key: key);

  final bool disableBack;
  final DocumentReference? verifyEmail;

  @override
  _VerifyemailWidgetState createState() => _VerifyemailWidgetState();
}

class _VerifyemailWidgetState extends State<VerifyemailWidget> {
  late VerifyemailModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VerifyemailModel());

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
      stream: VerificationCodesRecord.getDocument(widget.verifyEmail!),
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
        final verifyemailVerificationCodesRecord = snapshot.data!;
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
                        pageName: 'Verify email',
                        actionSet: false,
                        action: () async {
                          context.safePop();
                        },
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
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 14.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          'assets/images/image_13.png',
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
                                        textScaleFactor: MediaQuery.of(context)
                                            .textScaleFactor,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text:
                                                  'A verification code has been sent to your email. Please type in the code to verify ',
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
                                            TextSpan(
                                              text: FFAppState()
                                                  .signUpDetails
                                                  .email,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13.0,
                                              ),
                                            ),
                                            TextSpan(
                                              text: '.',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13.0,
                                              ),
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
                                                  10.0, 0.0, 10.0, 0.0),
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
                                                        color: Colors.white,
                                                        fontSize: 13.0,
                                                      ),
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              enableActiveFill: true,
                                              autoFocus: true,
                                              enablePinAutofill: true,
                                              errorTextSpace: 16.0,
                                              showCursor: true,
                                              cursorColor: Colors.white,
                                              obscureText: false,
                                              hintCharacter: '-',
                                              keyboardType:
                                                  TextInputType.number,
                                              pinTheme: PinTheme(
                                                fieldHeight: 40.0,
                                                fieldWidth: 40.0,
                                                borderWidth: 2.0,
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                shape: PinCodeFieldShape.box,
                                                activeColor: Color(0xFFFFAA2E),
                                                inactiveColor:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                selectedColor:
                                                    Color(0xFFFFAA2E),
                                                activeFillColor:
                                                    Color(0xFFFFAA2E),
                                                inactiveFillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                selectedFillColor:
                                                    Color(0xFFFFAA2E),
                                              ),
                                              controller:
                                                  _model.pinCodeController,
                                              onChanged: (_) {},
                                              autovalidateMode: AutovalidateMode
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
                            if (_model.active)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 41.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RichText(
                                      textScaleFactor: MediaQuery.of(context)
                                          .textScaleFactor,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'Did not get the CODE?',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Oxygen',
                                                  color: Color(0xFF8D8B92),
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
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
                                    ),
                                  ].divide(SizedBox(width: 3.0)),
                                ),
                              ),
                            if (_model.active)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 15.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RichText(
                                      textScaleFactor: MediaQuery.of(context)
                                          .textScaleFactor,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'RESEND CODE',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Oxygen',
                                                  color: Color(0xFFFFAA2E),
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
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
                                    ),
                                  ].divide(SizedBox(width: 3.0)),
                                ),
                              ),
                            wrapWithModel(
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
                                        onTap: () => _model
                                                .unfocusNode.canRequestFocus
                                            ? FocusScope.of(context)
                                                .requestFocus(
                                                    _model.unfocusNode)
                                            : FocusScope.of(context).unfocus(),
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: Container(
                                            height: double.infinity,
                                            child: LoadingScreenWidget(
                                              action: () async {},
                                            ),
                                          ),
                                        ),
                                      ));
                                    },
                                  ).then((value) => safeSetState(() {}));

                                  setState(() {
                                    _model.code = functions
                                        .randomFiveDigitCode()
                                        .toString();
                                  });

                                  await verifyemailVerificationCodesRecord
                                      .reference
                                      .update(createVerificationCodesRecordData(
                                    token: _model.code,
                                    createdDate: getCurrentTimestamp,
                                  ));
                                  setState(() {
                                    _model.pinCodeController?.clear();
                                  });
                                  await action_blocks.brevoEmail(
                                    context,
                                    emailUser: currentUserEmail,
                                    usersName: valueOrDefault(
                                        currentUserDocument?.username, ''),
                                    subject: 'Email verification code',
                                    body:
                                        'Your verification code is ${_model.code}',
                                  );
                                  setState(() {});
                                  ScaffoldMessenger.of(context)
                                      .clearSnackBars();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Verification code sent',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 14.0,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 1000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                    ),
                                  );
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ].addToEnd(SizedBox(height: 120.0)),
                        ),
                      ),
                    ),
                  ),
                  if ((_model.pinCodeController!.text != null &&
                          _model.pinCodeController!.text != '') &&
                      !(isWeb
                          ? MediaQuery.viewInsetsOf(context).bottom > 0
                          : _isKeyboardVisible))
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
                                    verifyemailVerificationCodesRecord.token) {
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
                                        onTap: () => _model
                                                .unfocusNode.canRequestFocus
                                            ? FocusScope.of(context)
                                                .requestFocus(
                                                    _model.unfocusNode)
                                            : FocusScope.of(context).unfocus(),
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: Container(
                                            height: double.infinity,
                                            child: LoadingScreenWidget(
                                              action: () async {
                                                var _shouldSetState = false;
                                                await Future.delayed(
                                                    const Duration(
                                                        milliseconds: 10000));
                                                if (loggedIn) {
                                                  return;
                                                }

                                                _model.internet11Copy3455 =
                                                    await actions
                                                        .checkInternetConnection();
                                                _shouldSetState = true;
                                                if (_model
                                                    .internet11Copy3455!) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'No internet connection!',
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 14.0,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 3000),
                                                      backgroundColor:
                                                          Color(0xFFEF3333),
                                                    ),
                                                  );
                                                  Navigator.pop(context);
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Invalid login details.',
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 14.0,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 2000),
                                                      backgroundColor:
                                                          Color(0xFFEF3333),
                                                    ),
                                                  );
                                                  Navigator.pop(context);
                                                }
                                              },
                                            ),
                                          ),
                                        ),
                                      ));
                                    },
                                  ).then((value) => safeSetState(() {}));

                                  ScaffoldMessenger.of(context)
                                      .clearSnackBars();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Email verified',
                                        style: GoogleFonts.getFont(
                                          'Work Sans',
                                          color: Colors.white,
                                          fontSize: 14.0,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 2000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).success,
                                    ),
                                  );
                                  GoRouter.of(context).prepareAuthEvent();

                                  final user =
                                      await authManager.createAccountWithEmail(
                                    context,
                                    functions.smallLetterChange(
                                        FFAppState().signUpDetails.email),
                                    FFAppState().signUpDetails.password,
                                  );
                                  if (user == null) {
                                    return;
                                  }

                                  await UserCollectionRecord.collection
                                      .doc(user.uid)
                                      .update(createUserCollectionRecordData(
                                        email: FFAppState().signUpDetails.email,
                                        createdTime: getCurrentTimestamp,
                                        admin: false,
                                        password:
                                            FFAppState().signUpDetails.password,
                                        kycVerified: false,
                                        newTransactionCache: false,
                                        userEmailVerified: true,
                                        pinSet: false,
                                        photoUrl:
                                            'https://firebasestorage.googleapis.com/v0/b/rexmanexchange.appspot.com/o/Project%20assets%2Fblank-profile-picture-973460_1280-705x705.png?alt=media&token=2c1af15f-2406-443e-9517-b031a091015d&_gl=1*1lbwsgm*_ga*MTc4NDAwMTYwMy4xNjgzMDU3MjU1*_ga_CW55HF8NVT*MTY5NjIzMjQwMC4xNzUuMS4xNjk2MjMyNTY5LjMuMC4w',
                                        countryCurrency:
                                            createCountryCurrencyDataTypeStruct(
                                          countryName: FFAppState()
                                              .countrySelected
                                              .countryName,
                                          currencyCode: FFAppState()
                                              .countrySelected
                                              .currencyCode,
                                          countryFlag: FFAppState()
                                              .countrySelected
                                              .countryFlag,
                                          blurHash: FFAppState()
                                              .countrySelected
                                              .blurHash,
                                          currencyRef: FFAppState()
                                              .countrySelected
                                              .currencyRef,
                                          rateBuy: FFAppState()
                                              .countrySelected
                                              .rateBuy,
                                          rateSell: FFAppState()
                                              .countrySelected
                                              .rateSell,
                                          clearUnsetFields: false,
                                          create: true,
                                        ),
                                      ));

                                  await currentUserReference!
                                      .update(createUserCollectionRecordData(
                                    userEmailVerified: true,
                                  ));

                                  context.goNamedAuth(
                                    'SetPin',
                                    context.mounted,
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 0),
                                      ),
                                    },
                                  );
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

                                setState(() {});
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
                                            color: Colors.white,
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
        );
      },
    );
  }
}
