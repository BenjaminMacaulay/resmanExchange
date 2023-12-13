import '/auth/firebase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/components/back_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/sold_page/authorize_pin/authorize_pin_widget.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'buy_crypto_model.dart';
export 'buy_crypto_model.dart';

class BuyCryptoWidget extends StatefulWidget {
  const BuyCryptoWidget({
    Key? key,
    required this.price,
    required this.currentRateBuy,
  }) : super(key: key);

  final double? price;
  final double? currentRateBuy;

  @override
  _BuyCryptoWidgetState createState() => _BuyCryptoWidgetState();
}

class _BuyCryptoWidgetState extends State<BuyCryptoWidget> {
  late BuyCryptoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BuyCryptoModel());

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        setState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    _model.amountController ??= TextEditingController();
    _model.amountFocusNode ??= FocusNode();

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: wrapWithModel(
                  model: _model.backComponentModel,
                  updateCallback: () => setState(() {}),
                  child: BackComponentWidget(
                    pageName: 'Buy crypto',
                    actionSet: false,
                    action: () async {},
                  ),
                ),
              ),
            ].divide(SizedBox(width: 4.0)),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: Form(
                                key: _model.formKey,
                                autovalidateMode: AutovalidateMode.disabled,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        width: 300.0,
                                        child: TextFormField(
                                          controller: _model.amountController,
                                          focusNode: _model.amountFocusNode,
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            '_model.amountController',
                                            Duration(milliseconds: 1),
                                            () => setState(() {}),
                                          ),
                                          autofocus: true,
                                          textInputAction: TextInputAction.done,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            hintText: '00.00',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Oxygen',
                                                      fontSize: 35.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                width: 1.5,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 1.5,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            errorBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.5,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedErrorBorder:
                                                UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.5,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Oxygen',
                                                fontSize: 35.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                          textAlign: TextAlign.center,
                                          minLines: 0,
                                          keyboardType: const TextInputType
                                              .numberWithOptions(decimal: true),
                                          validator: _model
                                              .amountControllerValidator
                                              .asValidator(context),
                                          inputFormatters: [
                                            FilteringTextInputFormatter.allow(
                                                RegExp('^-?[0-9.]+\$'))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 12.0, 20.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: AuthUserStreamWidget(
                            builder: (context) => Text(
                              (functions.ratePerDollar(
                                              _model.amountController.text !=
                                                          null &&
                                                      _model.amountController
                                                              .text !=
                                                          ''
                                                  ? double.parse(_model
                                                      .amountController.text)
                                                  : 0.0,
                                              widget.currentRateBuy!) <
                                          4.0) &&
                                      (_model.amountController.text != null &&
                                          _model.amountController.text != '')
                                  ? 'Please enter a minimum amount of ${currentUserDocument?.countryCurrency?.currencyCode}${(widget.currentRateBuy! * 5).toString()} or more.'
                                  : 'Enter Amount in ${valueOrDefault<String>(
                                      currentUserDocument
                                          ?.countryCurrency?.currencyCode,
                                      'NGN',
                                    )}',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Work Sans',
                                    color: (functions.ratePerDollar(
                                                    _model.amountController
                                                                    .text !=
                                                                null &&
                                                            _model.amountController
                                                                    .text !=
                                                                ''
                                                        ? functions
                                                            .stringToDouble(_model
                                                                .amountController
                                                                .text)
                                                        : 0.0,
                                                    widget.currentRateBuy!) <
                                                4.0) &&
                                            (_model.amountController.text !=
                                                    null &&
                                                _model.amountController.text !=
                                                    '')
                                        ? Color(0xFFFF0000)
                                        : Colors.white,
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(
                              'selectCoin',
                              extra: <String, dynamic>{
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );
                          },
                          child: Container(
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  11.0, 4.0, 11.0, 4.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 8.0, 0.0),
                                        child: Container(
                                          width: 25.0,
                                          height: 25.0,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: Image.network(
                                                FFAppState()
                                                    .cryptoChosen
                                                    .imageCoin,
                                              ).image,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        FFAppState()
                                            .cryptoChosen
                                            .name
                                            .maybeHandleOverflow(
                                              maxChars: 12,
                                              replacement: '…',
                                            ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Oxygen',
                                              fontSize: 13.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.angleDown,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 16.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ].divide(SizedBox(width: 20.0)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if ((_model.amountController.text != null &&
                          _model.amountController.text != '') &&
                      !(isWeb
                          ? MediaQuery.viewInsetsOf(context).bottom > 0
                          : _isKeyboardVisible) &&
                      (functions.ratePerDollar(
                              _model.amountController.text != null &&
                                      _model.amountController.text != ''
                                  ? functions.stringToDouble(
                                      _model.amountController.text)
                                  : 0.0,
                              widget.currentRateBuy!) >
                          4.0))
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 23.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    18.0, 11.0, 18.0, 11.0),
                                child: Row(
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
                                                  'You\'ll get approximately ',
                                              style: TextStyle(
                                                fontSize: 14.0,
                                              ),
                                            ),
                                            TextSpan(
                                              text: functions
                                                  .divideToGetCryptoValue(
                                                      functions.ratePerDollar(
                                                          functions.stringToDouble(
                                                              _model
                                                                  .amountController
                                                                  .text),
                                                          widget
                                                              .currentRateBuy!),
                                                      widget.price!)
                                                  .toString(),
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14.0,
                                              ),
                                            ),
                                            TextSpan(
                                              text: FFAppState()
                                                  .cryptoChosen
                                                  .symbol,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14.0,
                                              ),
                                            ),
                                            TextSpan(
                                              text: ' for ',
                                              style: TextStyle(
                                                fontSize: 14.0,
                                              ),
                                            ),
                                            TextSpan(
                                              text: valueOrDefault<String>(
                                                currentUserDocument
                                                    ?.countryCurrency
                                                    ?.currencyCode,
                                                'NGN',
                                              ),
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14.0,
                                              ),
                                            ),
                                            TextSpan(
                                              text: formatNumber(
                                                functions.stringToDouble(_model
                                                    .amountController.text),
                                                formatType: FormatType.decimal,
                                                decimalType:
                                                    DecimalType.periodDecimal,
                                              ),
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14.0,
                                              ),
                                            )
                                          ],
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Oxygen',
                                                fontSize: 14.0,
                                              ),
                                        ),
                                        textAlign: TextAlign.center,
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
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if ((_model.amountController.text != null &&
                          _model.amountController.text != '') &&
                      !(isWeb
                          ? MediaQuery.viewInsetsOf(context).bottom > 0
                          : _isKeyboardVisible) &&
                      (functions.ratePerDollar(
                              _model.amountController.text != null &&
                                      _model.amountController.text != ''
                                  ? functions.stringToDouble(
                                      _model.amountController.text)
                                  : 0.0,
                              widget.currentRateBuy!) >
                          4.0))
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(23.0, 0.0, 22.0, 0.0),
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
                                if (valueOrDefault<bool>(
                                    currentUserDocument?.kycVerified, false)) {
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
                                            child: AuthorizePinWidget(
                                              action: () async {
                                                setState(() {
                                                  FFAppState()
                                                      .updateBuyTransactionInitializedStruct(
                                                    (e) => e
                                                      ..amountToBuyCurrency =
                                                          functions.stringToDouble(
                                                              _model
                                                                  .amountController
                                                                  .text)
                                                      ..amountToBuyinDollars =
                                                          functions.ratePerDollar(
                                                              functions.stringToDouble(
                                                                  _model
                                                                      .amountController
                                                                      .text),
                                                              widget
                                                                  .currentRateBuy!)
                                                      ..amountToBuyInCrypto = functions
                                                          .divideToGetCryptoValue(
                                                              functions.ratePerDollar(
                                                                  functions.stringToDouble(
                                                                      _model
                                                                          .amountController
                                                                          .text),
                                                                  widget
                                                                      .currentRateBuy!),
                                                              widget.price!),
                                                  );
                                                });

                                                context.pushNamed(
                                                  'coinAddress',
                                                  queryParameters: {
                                                    'rateBuy': serializeParam(
                                                      widget.currentRateBuy,
                                                      ParamType.double,
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
                                              },
                                            ),
                                          ),
                                        ),
                                      ));
                                    },
                                  ).then((value) => safeSetState(() {}));
                                } else {
                                  context.goNamed(
                                    'KycDetails',
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 0),
                                      ),
                                    },
                                  );
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
                                    AuthUserStreamWidget(
                                      builder: (context) => Text(
                                        valueOrDefault<bool>(
                                                currentUserDocument
                                                    ?.kycVerified,
                                                false)
                                            ? 'Continue'
                                            : 'You need to complete your KYC',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Oxygen',
                                              color: Colors.white,
                                              fontSize: 13.0,
                                              fontWeight: FontWeight.bold,
                                            ),
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
                ].addToEnd(SizedBox(height: 80.0)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
