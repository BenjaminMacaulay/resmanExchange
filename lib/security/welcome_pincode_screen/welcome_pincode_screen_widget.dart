import '/auth/firebase_auth/auth_util.dart';
import '/components/button_numberfor_pin_widget.dart';
import '/components/error_screen_widget.dart';
import '/components/single_pin_field_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'welcome_pincode_screen_model.dart';
export 'welcome_pincode_screen_model.dart';

class WelcomePincodeScreenWidget extends StatefulWidget {
  const WelcomePincodeScreenWidget({Key? key}) : super(key: key);

  @override
  _WelcomePincodeScreenWidgetState createState() =>
      _WelcomePincodeScreenWidgetState();
}

class _WelcomePincodeScreenWidgetState
    extends State<WelcomePincodeScreenWidget> {
  late WelcomePincodeScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WelcomePincodeScreenModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 1000),
        callback: (timer) async {
          if ((FFAppState().pincodeFieldOne != null &&
                  FFAppState().pincodeFieldOne != '') &&
              (FFAppState().pincodeFieldTwo != null &&
                  FFAppState().pincodeFieldTwo != '') &&
              (FFAppState().pincodeFieldThree != null &&
                  FFAppState().pincodeFieldThree != '') &&
              (FFAppState().pincodeFieldFour != null &&
                  FFAppState().pincodeFieldFour != '') &&
              (FFAppState().pincodeFieldFive != null &&
                  FFAppState().pincodeFieldFive != '')) {
            if (valueOrDefault(currentUserDocument?.pinCode, '') ==
                functions.combinePinText(
                    FFAppState().pincodeFieldOne,
                    FFAppState().pincodeFieldTwo,
                    FFAppState().pincodeFieldThree,
                    FFAppState().pincodeFieldFour,
                    FFAppState().pincodeFieldFive)) {
              setState(() {
                FFAppState().lastActiveTime = getCurrentTimestamp;
              });

              context.goNamed(
                'HomePage',
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
                    onTap: () => _model.unfocusNode.canRequestFocus
                        ? FocusScope.of(context)
                            .requestFocus(_model.unfocusNode)
                        : FocusScope.of(context).unfocus(),
                    child: Padding(
                      padding: MediaQuery.viewInsetsOf(context),
                      child: Container(
                        height: double.infinity,
                        child: ErrorScreenWidget(
                          errorMessage: 'Pin codes do not match',
                        ),
                      ),
                    ),
                  ));
                },
              ).then((value) => safeSetState(() {}));
            }
          }
        },
        startImmediately: true,
      );
    });

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
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 90.0,
                            height: 90.0,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.network(
                              'https://th.bing.com/th/id/R.74d7ee66365e654998c6ca8746162d49?rik=86QXVSs9lNB%2f3A&pid=ImgRaw&r=0',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              'Welcome Back',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Oxygen',
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: AuthUserStreamWidget(
                                builder: (context) => Text(
                                  '@${valueOrDefault(currentUserDocument?.username, '')}',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Oxygen',
                                        color: Color(0xFF8D8B92),
                                        fontSize: 16.0,
                                      ),
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
                          Text(
                            'Enter your Pincode',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Oxygen',
                                  color: Colors.white,
                                  fontSize: 14.0,
                                ),
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            wrapWithModel(
                              model: _model.singlePinFieldModel1,
                              updateCallback: () => setState(() {}),
                              updateOnChange: true,
                              child: SinglePinFieldWidget(
                                pinString: FFAppState().pincodeFieldOne,
                              ),
                            ),
                            wrapWithModel(
                              model: _model.singlePinFieldModel2,
                              updateCallback: () => setState(() {}),
                              updateOnChange: true,
                              child: SinglePinFieldWidget(
                                pinString: FFAppState().pincodeFieldTwo,
                              ),
                            ),
                            wrapWithModel(
                              model: _model.singlePinFieldModel3,
                              updateCallback: () => setState(() {}),
                              updateOnChange: true,
                              child: SinglePinFieldWidget(
                                pinString: FFAppState().pincodeFieldThree,
                              ),
                            ),
                            wrapWithModel(
                              model: _model.singlePinFieldModel4,
                              updateCallback: () => setState(() {}),
                              updateOnChange: true,
                              child: SinglePinFieldWidget(
                                pinString: FFAppState().pincodeFieldFour,
                              ),
                            ),
                            wrapWithModel(
                              model: _model.singlePinFieldModel5,
                              updateCallback: () => setState(() {}),
                              updateOnChange: true,
                              child: SinglePinFieldWidget(
                                pinString: FFAppState().pincodeFieldFive,
                              ),
                            ),
                          ].divide(SizedBox(width: 12.0)),
                        ),
                      ),
                    ].divide(SizedBox(height: 8.0)),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Align(
                    alignment: AlignmentDirectional(0.00, 0.00),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(22.0, 0.0, 22.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              wrapWithModel(
                                model: _model.buttonNumberforPinModel1,
                                updateCallback: () => setState(() {}),
                                updateOnChange: true,
                                child: ButtonNumberforPinWidget(
                                  number: '1',
                                ),
                              ),
                              wrapWithModel(
                                model: _model.buttonNumberforPinModel2,
                                updateCallback: () => setState(() {}),
                                child: ButtonNumberforPinWidget(
                                  number: '2',
                                ),
                              ),
                              wrapWithModel(
                                model: _model.buttonNumberforPinModel3,
                                updateCallback: () => setState(() {}),
                                child: ButtonNumberforPinWidget(
                                  number: '3',
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              wrapWithModel(
                                model: _model.buttonNumberforPinModel4,
                                updateCallback: () => setState(() {}),
                                child: ButtonNumberforPinWidget(
                                  number: '4',
                                ),
                              ),
                              wrapWithModel(
                                model: _model.buttonNumberforPinModel5,
                                updateCallback: () => setState(() {}),
                                child: ButtonNumberforPinWidget(
                                  number: '5',
                                ),
                              ),
                              wrapWithModel(
                                model: _model.buttonNumberforPinModel6,
                                updateCallback: () => setState(() {}),
                                child: ButtonNumberforPinWidget(
                                  number: '6',
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              wrapWithModel(
                                model: _model.buttonNumberforPinModel7,
                                updateCallback: () => setState(() {}),
                                child: ButtonNumberforPinWidget(
                                  number: '7',
                                ),
                              ),
                              wrapWithModel(
                                model: _model.buttonNumberforPinModel8,
                                updateCallback: () => setState(() {}),
                                child: ButtonNumberforPinWidget(
                                  number: '8',
                                ),
                              ),
                              wrapWithModel(
                                model: _model.buttonNumberforPinModel9,
                                updateCallback: () => setState(() {}),
                                child: ButtonNumberforPinWidget(
                                  number: '9',
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  GoRouter.of(context).prepareAuthEvent();
                                  await authManager.signOut();
                                  GoRouter.of(context).clearRedirectLocation();

                                  context.goNamedAuth(
                                    'Onboarding2',
                                    context.mounted,
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 0),
                                      ),
                                    },
                                  );
                                },
                                child: Text(
                                  'Sign Out',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Oxygen',
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 16.0, 0.0),
                                child: wrapWithModel(
                                  model: _model.buttonNumberforPinModel10,
                                  updateCallback: () => setState(() {}),
                                  child: ButtonNumberforPinWidget(
                                    number: '0',
                                  ),
                                ),
                              ),
                              if ((FFAppState().pincodeFieldOne != null &&
                                      FFAppState().pincodeFieldOne != '') ||
                                  (FFAppState().pincodeFieldTwo != null &&
                                      FFAppState().pincodeFieldTwo != '') ||
                                  (FFAppState().pincodeFieldThree != null &&
                                      FFAppState().pincodeFieldThree != '') ||
                                  (FFAppState().pincodeFieldFour != null &&
                                      FFAppState().pincodeFieldFour != '') ||
                                  (FFAppState().pincodeFieldFive != null &&
                                      FFAppState().pincodeFieldFive != ''))
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    HapticFeedback.lightImpact();
                                    if ((FFAppState().pincodeFieldOne != null && FFAppState().pincodeFieldOne != '') &&
                                        (FFAppState().pincodeFieldTwo == null ||
                                            FFAppState().pincodeFieldTwo ==
                                                '') &&
                                        (FFAppState().pincodeFieldThree == null ||
                                            FFAppState().pincodeFieldThree ==
                                                '') &&
                                        (FFAppState().pincodeFieldFour == null ||
                                            FFAppState().pincodeFieldFour ==
                                                '') &&
                                        (FFAppState().pincodeFieldFive == null ||
                                            FFAppState().pincodeFieldFive ==
                                                '')) {
                                      setState(() {
                                        FFAppState().pincodeFieldOne = '';
                                      });
                                    } else if ((FFAppState().pincodeFieldOne != null && FFAppState().pincodeFieldOne != '') &&
                                        (FFAppState().pincodeFieldTwo != null &&
                                            FFAppState().pincodeFieldTwo !=
                                                '') &&
                                        (FFAppState().pincodeFieldThree == null ||
                                            FFAppState().pincodeFieldThree ==
                                                '') &&
                                        (FFAppState().pincodeFieldFour == null ||
                                            FFAppState().pincodeFieldFour ==
                                                '') &&
                                        (FFAppState().pincodeFieldFive == null ||
                                            FFAppState().pincodeFieldFive ==
                                                '')) {
                                      setState(() {
                                        FFAppState().pincodeFieldTwo = '';
                                      });
                                    } else if ((FFAppState().pincodeFieldOne != null && FFAppState().pincodeFieldOne != '') &&
                                        (FFAppState().pincodeFieldTwo != null &&
                                            FFAppState().pincodeFieldTwo !=
                                                '') &&
                                        (FFAppState().pincodeFieldThree != null &&
                                            FFAppState().pincodeFieldThree !=
                                                '') &&
                                        (FFAppState().pincodeFieldFour == null ||
                                            FFAppState().pincodeFieldFour ==
                                                '') &&
                                        (FFAppState().pincodeFieldFive == null ||
                                            FFAppState().pincodeFieldFive ==
                                                '')) {
                                      setState(() {
                                        FFAppState().pincodeFieldThree = '';
                                      });
                                    } else if ((FFAppState().pincodeFieldOne != null && FFAppState().pincodeFieldOne != '') &&
                                        (FFAppState().pincodeFieldTwo != null &&
                                            FFAppState().pincodeFieldTwo !=
                                                '') &&
                                        (FFAppState().pincodeFieldThree != null &&
                                            FFAppState().pincodeFieldThree !=
                                                '') &&
                                        (FFAppState().pincodeFieldFour != null &&
                                            FFAppState().pincodeFieldFour !=
                                                '') &&
                                        (FFAppState().pincodeFieldFive == null ||
                                            FFAppState().pincodeFieldFive ==
                                                '')) {
                                      setState(() {
                                        FFAppState().pincodeFieldFour = '';
                                      });
                                    } else if ((FFAppState().pincodeFieldOne != null && FFAppState().pincodeFieldOne != '') &&
                                        (FFAppState().pincodeFieldTwo != null &&
                                            FFAppState().pincodeFieldTwo != '') &&
                                        (FFAppState().pincodeFieldThree != null && FFAppState().pincodeFieldThree != '') &&
                                        (FFAppState().pincodeFieldFour != null && FFAppState().pincodeFieldFour != '') &&
                                        (FFAppState().pincodeFieldFive != null && FFAppState().pincodeFieldFive != '')) {
                                      setState(() {
                                        FFAppState().pincodeFieldFive = '';
                                      });
                                    }
                                  },
                                  child: Text(
                                    'Delete',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Oxygen',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                            ],
                          ),
                        ].divide(SizedBox(height: 20.0)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
