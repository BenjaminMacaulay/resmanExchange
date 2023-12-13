import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/back_component_widget.dart';
import '/components/loading_screen_widget.dart';
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
import 'confirm_p_i_n_model.dart';
export 'confirm_p_i_n_model.dart';

class ConfirmPINWidget extends StatefulWidget {
  const ConfirmPINWidget({Key? key}) : super(key: key);

  @override
  _ConfirmPINWidgetState createState() => _ConfirmPINWidgetState();
}

class _ConfirmPINWidgetState extends State<ConfirmPINWidget> {
  late ConfirmPINModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConfirmPINModel());

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
                updateOnChange: true,
                child: BackComponentWidget(
                  pageName: 'Confirm your Transaction Pin',
                  actionSet: false,
                  action: () async {
                    context.safePop();
                  },
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
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
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
                                  if (((functions.countNumberOfStrings(_model
                                                  .pinCodeController!.text) ==
                                              4) &&
                                          (valueOrDefault(
                                                  currentUserDocument?.pinCode,
                                                  '') ==
                                              _model
                                                  .pinCodeController!.text)) ||
                                      (functions.countNumberOfStrings(
                                              _model.pinCodeController!.text)! <
                                          4))
                                    AuthUserStreamWidget(
                                      builder: (context) => ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          'assets/images/confirm_pin_icon.png',
                                          width: 112.0,
                                          height: 110.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  if ((functions.countNumberOfStrings(
                                              _model.pinCodeController!.text) ==
                                          4) &&
                                      (valueOrDefault(
                                              currentUserDocument?.pinCode,
                                              '') !=
                                          _model.pinCodeController!.text))
                                    AuthUserStreamWidget(
                                      builder: (context) => ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          'assets/images/confirm_pin_icon_(1).png',
                                          width: 112.0,
                                          height: 110.0,
                                          fit: BoxFit.cover,
                                        ),
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
                                        MediaQuery.of(context).textScaleFactor,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Confirm your pin to continue.',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Oxygen',
                                                color: Color(0xFF8D8B92),
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        )
                                      ],
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Work Sans',
                                            color: Color(0xFFFFAA2E),
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
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
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      30.0, 0.0, 30.0, 0.0),
                                  child: Container(
                                    width: 100.0,
                                    height: 44.0,
                                    decoration: BoxDecoration(
                                      color: Color(0x002D2D2D),
                                    ),
                                    child: AuthUserStreamWidget(
                                      builder: (context) => PinCodeTextField(
                                        autoDisposeControllers: false,
                                        appContext: context,
                                        length: 4,
                                        textStyle: FlutterFlowTheme.of(context)
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
                                        obscureText: true,
                                        obscuringCharacter: '●',
                                        hintCharacter: '-',
                                        keyboardType: TextInputType.number,
                                        pinTheme: PinTheme(
                                          fieldHeight: 40.0,
                                          fieldWidth: 40.0,
                                          borderWidth: 2.0,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          shape: PinCodeFieldShape.box,
                                          activeColor: (functions
                                                          .countNumberOfStrings(
                                                              _model
                                                                  .pinCodeController!
                                                                  .text)! >=
                                                      4) &&
                                                  (valueOrDefault(
                                                          currentUserDocument
                                                              ?.pinCode,
                                                          '') !=
                                                      _model.pinCodeController!
                                                          .text)
                                              ? Color(0xFFB41F1F)
                                              : Color(0xFFFFAA2E),
                                          inactiveColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          selectedColor: Color(0xFF2D2D2D),
                                          activeFillColor: (functions
                                                          .countNumberOfStrings(
                                                              _model
                                                                  .pinCodeController!
                                                                  .text)! >=
                                                      4) &&
                                                  (valueOrDefault(
                                                          currentUserDocument
                                                              ?.pinCode,
                                                          '') !=
                                                      _model.pinCodeController!
                                                          .text)
                                              ? Color(0xFFB41F1F)
                                              : Color(0xFFFFAA2E),
                                          inactiveFillColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          selectedFillColor: Color(0xFF2D2D2D),
                                        ),
                                        controller: _model.pinCodeController,
                                        onChanged: (_) {},
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
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
                      ].addToEnd(SizedBox(height: 120.0)),
                    ),
                  ),
                ),
              ),
              if (!(isWeb
                  ? MediaQuery.viewInsetsOf(context).bottom > 0
                  : _isKeyboardVisible))
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(23.0, 0.0, 23.0, 60.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (valueOrDefault(currentUserDocument?.pinCode, '') ==
                          _model.pinCodeController!.text)
                        Expanded(
                          child: AuthUserStreamWidget(
                            builder: (context) => Container(
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
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  final firestoreBatch =
                                      FirebaseFirestore.instance.batch();
                                  try {
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
                                              : FocusScope.of(context)
                                                  .unfocus(),
                                          child: Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: LoadingScreenWidget(
                                              action: () async {
                                                var _shouldSetState = false;
                                                await Future.delayed(
                                                    const Duration(
                                                        milliseconds: 10000));
                                                if (FFAppState()
                                                            .pinValueForTransactions !=
                                                        null &&
                                                    FFAppState()
                                                            .pinValueForTransactions !=
                                                        '') {
                                                  return;
                                                }

                                                _model.internetiy7889 =
                                                    await actions
                                                        .checkInternetConnection();
                                                _shouldSetState = true;
                                                if (_model.internetiy7889!) {
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
                                                        'Pin not set. Try again!',
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
                                        ));
                                      },
                                    ).then((value) => safeSetState(() {}));

                                    if (valueOrDefault<bool>(
                                            currentUserDocument
                                                ?.userEmailVerified,
                                            false) &&
                                        (valueOrDefault<bool>(
                                                currentUserDocument
                                                    ?.userEmailVerified,
                                                false) !=
                                            null)) {
                                      setState(() {
                                        FFAppState().pinValueForTransactions =
                                            _model.pinCodeController!.text;
                                      });

                                      firestoreBatch.update(
                                          currentUserReference!,
                                          createUserCollectionRecordData(
                                            pinSet: true,
                                          ));
                                      await action_blocks.brevoEmail(
                                        context,
                                        emailUser: currentUserEmail,
                                        usersName: valueOrDefault(
                                            currentUserDocument?.username, ''),
                                        subject:
                                            'Welcome to Resman Exchange! 🚀',
                                        body:
                                            'Dear ${valueOrDefault(currentUserDocument?.username, '')}, Welcome to Resman Exchange – your go-to platform for buying and selling crypto assets!🌍 About Us:We\'re Resman Investment Ltd, a registered limited liability company in Nigeria (RC Number: 6931478). Since 2019, we\'ve been trading globally and launched our open-source P2P exchange in 2022.🔒 Trust and Integrity:At Resman Exchange, trust and integrity are at our core. We\'re proud to be the most trusted exchange in Nigeria and South Africa.🚀 Start Trading Now:Your crypto journey begins here! Dive into the markets, explore opportunities, and make your trades. We\'re here to support you every step of the way.📚 Learn and Grow:Stay tuned for educational content and market insights. We\'re committed to your growth and success in the crypto space.👉 Need Help?If you have any questions, our support team is ready to assist. Just reply to this email, and we\'ll be in touch.Happy trading!Best regards,The Resman Exchange Team',
                                      );

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
                                    } else {
                                      firestoreBatch.update(
                                          currentUserReference!,
                                          createUserCollectionRecordData(
                                            photoUrl:
                                                'https://firebasestorage.googleapis.com/v0/b/rexmanexchange.appspot.com/o/Project%20assets%2Fblank-profile-picture-973460_1280-705x705.png?alt=media&token=2c1af15f-2406-443e-9517-b031a091015d&_gl=1*1lbwsgm*_ga*MTc4NDAwMTYwMy4xNjgzMDU3MjU1*_ga_CW55HF8NVT*MTY5NjIzMjQwMC4xNzUuMS4xNjk2MjMyNTY5LjMuMC4w',
                                            admin: false,
                                            createdTime: getCurrentTimestamp,
                                            kycVerified: false,
                                            newTransactionCache: false,
                                            username: 'user ${currentUserUid}',
                                            userEmailVerified: true,
                                            pinSet: true,
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
                                            ),
                                          ));

                                      firestoreBatch.set(
                                          UserNamesRecord.collection.doc(),
                                          createUserNamesRecordData(
                                            userNameString:
                                                FFAppState().appleORGoogle
                                                    ? 'user ${currentUserUid}'
                                                    : FFAppState()
                                                        .signUpDetails
                                                        .username,
                                          ));
                                      setState(() {
                                        FFAppState().lastActiveTime =
                                            getCurrentTimestamp;
                                        FFAppState().appleORGoogle = false;
                                      });
                                      setState(() {
                                        FFAppState().pinValueForTransactions =
                                            _model.pinCodeController!.text;
                                      });
                                      await action_blocks.brevoEmail(
                                        context,
                                        emailUser: currentUserEmail,
                                        usersName: valueOrDefault(
                                            currentUserDocument?.username, ''),
                                        subject:
                                            'Welcome to Resman Exchange! 🚀',
                                        body:
                                            'Dear ${valueOrDefault(currentUserDocument?.username, '')}, Welcome to Resman Exchange – your go-to platform for buying and selling crypto assets!🌍 About Us:We\'re Resman Investment Ltd, a registered limited liability company in Nigeria (RC Number: 6931478). Since 2019, we\'ve been trading globally and launched our open-source P2P exchange in 2022.🔒 Trust and Integrity:At Resman Exchange, trust and integrity are at our core. We\'re proud to be the most trusted exchange in Nigeria and South Africa.🚀 Start Trading Now:Your crypto journey begins here! Dive into the markets, explore opportunities, and make your trades. We\'re here to support you every step of the way.📚 Learn and Grow:Stay tuned for educational content and market insights. We\'re committed to your growth and success in the crypto space.👉 Need Help?If you have any questions, our support team is ready to assist. Just reply to this email, and we\'ll be in touch.Happy trading!Best regards,The Resman Exchange Team',
                                      );

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
                                    }
                                  } finally {
                                    await firestoreBatch.commit();
                                  }

                                  setState(() {});
                                },
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
                        ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
