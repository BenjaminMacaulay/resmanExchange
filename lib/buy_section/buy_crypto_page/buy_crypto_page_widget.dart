import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/back_component_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/sold_page/authorize_pin/authorize_pin_widget.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'buy_crypto_page_model.dart';
export 'buy_crypto_page_model.dart';

class BuyCryptoPageWidget extends StatefulWidget {
  const BuyCryptoPageWidget({
    Key? key,
    required this.price,
    required this.currentRateBuy,
    required this.currencyCode,
  }) : super(key: key);

  final double? price;
  final double? currentRateBuy;
  final String? currencyCode;

  @override
  _BuyCryptoPageWidgetState createState() => _BuyCryptoPageWidgetState();
}

class _BuyCryptoPageWidgetState extends State<BuyCryptoPageWidget> {
  late BuyCryptoPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BuyCryptoPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.addToCurrencyList('USD');
      });
      setState(() {
        _model.addToCurrencyList(widget.currencyCode!);
      });
    });

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        setState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 7,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(22.0, 0.0, 22.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            RichText(
                              textScaleFactor:
                                  MediaQuery.of(context).textScaleFactor,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Price  ',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Oxygen',
                                          color: Color(0xFF8D8B92),
                                          fontSize: 13.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                  TextSpan(
                                    text: valueOrDefault<String>(
                                      currentUserDocument
                                          ?.countryCurrency?.currencyCode,
                                      'NGN',
                                    ),
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13.0,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' ${formatNumber(
                                      widget.currentRateBuy,
                                      formatType: FormatType.decimal,
                                      decimalType: DecimalType.periodDecimal,
                                    )}/\$',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
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
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 35.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Enter amount',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Oxygen',
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: 100.0,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: Color(0x002D2D2D),
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          width: 2.0,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: 110.0,
                                                height: 100.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: AuthUserStreamWidget(
                                                  builder: (context) =>
                                                      FlutterFlowDropDown<
                                                          String>(
                                                    controller: _model
                                                            .dropDownCurrencyValueController ??=
                                                        FormFieldController<
                                                            String>(
                                                      _model.dropDownCurrencyValue ??=
                                                          currentUserDocument
                                                              ?.countryCurrency
                                                              ?.currencyCode,
                                                    ),
                                                    options:
                                                        _model.currencyList,
                                                    onChanged: (val) =>
                                                        setState(() => _model
                                                                .dropDownCurrencyValue =
                                                            val),
                                                    width: double.infinity,
                                                    height: 50.0,
                                                    textStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium,
                                                    hintText: _model
                                                        .currencyList.first,
                                                    icon: Icon(
                                                      Icons
                                                          .keyboard_arrow_down_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 18.0,
                                                    ),
                                                    fillColor: FlutterFlowTheme
                                                            .of(context)
                                                        .secondaryBackground,
                                                    elevation: 1.5,
                                                    borderColor:
                                                        Color(0x00E0E3E7),
                                                    borderWidth: 2.0,
                                                    borderRadius: 0.0,
                                                    margin:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 4.0,
                                                                16.0, 4.0),
                                                    hidesUnderline: true,
                                                    isSearchable: false,
                                                    isMultiSelect: false,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Expanded(
                                            flex: 8,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: TextFormField(
                                                    controller:
                                                        _model.textController,
                                                    focusNode: _model
                                                        .textFieldFocusNode,
                                                    onChanged: (_) =>
                                                        EasyDebounce.debounce(
                                                      '_model.textController',
                                                      Duration(
                                                          milliseconds: 10),
                                                      () => setState(() {}),
                                                    ),
                                                    autofocus: true,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium,
                                                      hintText:
                                                          'Enter amount in ${_model.dropDownCurrencyValue}',
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium,
                                                      enabledBorder:
                                                          InputBorder.none,
                                                      focusedBorder:
                                                          InputBorder.none,
                                                      errorBorder:
                                                          InputBorder.none,
                                                      focusedErrorBorder:
                                                          InputBorder.none,
                                                      contentPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  8.0,
                                                                  0.0),
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                    keyboardType:
                                                        const TextInputType
                                                            .numberWithOptions(
                                                            decimal: true),
                                                    validator: _model
                                                        .textControllerValidator
                                                        .asValidator(context),
                                                    inputFormatters: [
                                                      FilteringTextInputFormatter
                                                          .allow(RegExp(
                                                              '^-?[0-9.]+\$'))
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      if ((_model.textFieldFocusNode?.hasFocus ?? false))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 18.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              RichText(
                                textScaleFactor:
                                    MediaQuery.of(context).textScaleFactor,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Minimum price: ',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Oxygen',
                                            color: Color(0xFF8D8B92),
                                            fontSize: 13.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                    TextSpan(
                                      text:
                                          '${_model.dropDownCurrencyValue == currentUserDocument?.countryCurrency?.currencyCode ? currentUserDocument?.countryCurrency?.currencyCode : '\$'}${_model.dropDownCurrencyValue == currentUserDocument?.countryCurrency?.currencyCode ? (widget.currentRateBuy! * 5).toString() : '5'}',
                                      style: TextStyle(
                                        color: (functions.ratePerDollar(
                                                        _model.textController
                                                                        .text !=
                                                                    null &&
                                                                _model.textController
                                                                        .text !=
                                                                    ''
                                                            ? functions
                                                                .stringToDouble(
                                                                    _model
                                                                        .textController
                                                                        .text)
                                                            : 0.0,
                                                        widget
                                                            .currentRateBuy!) <
                                                    4.0) &&
                                                (_model.textController.text !=
                                                        null &&
                                                    _model.textController.text !=
                                                        '')
                                            ? Color(0xFFFF0000)
                                            : FlutterFlowTheme.of(context)
                                                .primaryText,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Oxygen',
                                        color: Color(0xFFFFAA2E),
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                        ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RichText(
                                  textScaleFactor:
                                      MediaQuery.of(context).textScaleFactor,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Recieve Quantity ',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Oxygen',
                                              color: Color(0xFF8D8B92),
                                              fontSize: 13.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      )
                                    ],
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Oxygen',
                                          color: Color(0xFFFFAA2E),
                                          fontSize: 13.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                                RichText(
                                  textScaleFactor:
                                      MediaQuery.of(context).textScaleFactor,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: (_model.textController.text != null &&
                                                    _model.textController.text !=
                                                        '') &&
                                                ((_model.dropDownCurrencyValue == 'USD'
                                                        ? double.parse(_model
                                                            .textController
                                                            .text)
                                                        : functions.ratePerDollar(
                                                            _model.textController.text !=
                                                                        null &&
                                                                    _model.textController.text !=
                                                                        ''
                                                                ? functions
                                                                    .stringToDouble(_model.textController.text)
                                                                : 0.0,
                                                            widget.currentRateBuy!)) >
                                                    4.0)
                                            ? functions
                                                .divideToGetCryptoValue(
                                                    _model.dropDownCurrencyValue == 'USD'
                                                        ? double.parse(_model.textController.text)
                                                        : valueOrDefault<double>(
                                                            functions.ratePerDollar(
                                                                functions.stringToDouble(
                                                                    _model
                                                                        .textController
                                                                        .text),
                                                                widget
                                                                    .currentRateBuy!),
                                                            0.0,
                                                          ),
                                                    widget.price!)
                                                .toString()
                                            : '- - -',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Oxygen',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 13.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                      TextSpan(
                                        text:
                                            ' ${FFAppState().cryptoChosen.symbol}',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
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
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 8.0, 8.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: 100.0,
                                      height: 1.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 14.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RichText(
                                    textScaleFactor:
                                        MediaQuery.of(context).textScaleFactor,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Amount To Pay',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Oxygen',
                                                color: Color(0xFF8D8B92),
                                                fontSize: 13.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        )
                                      ],
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Oxygen',
                                            color: Color(0xFFFFAA2E),
                                            fontSize: 13.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                  RichText(
                                    textScaleFactor:
                                        MediaQuery.of(context).textScaleFactor,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: (formatNumber(
                                                        _model.textController
                                                                        .text !=
                                                                    null &&
                                                                _model.textController
                                                                        .text !=
                                                                    ''
                                                            ? (_model.dropDownCurrencyValue ==
                                                                    'USD'
                                                                ? double.tryParse(
                                                                    _model
                                                                        .textController
                                                                        .text)
                                                                : double.tryParse(
                                                                    _model
                                                                        .textController
                                                                        .text))
                                                            : 0.0,
                                                        formatType:
                                                            FormatType.decimal,
                                                        decimalType: DecimalType
                                                            .periodDecimal,
                                                      ) ==
                                                      '0') &&
                                                  (_model.textController.text ==
                                                          null ||
                                                      _model.textController
                                                              .text ==
                                                          '')
                                              ? '- - -'
                                              : formatNumber(
                                                  _model.textController.text !=
                                                              null &&
                                                          _model.textController
                                                                  .text !=
                                                              ''
                                                      ? (_model.dropDownCurrencyValue ==
                                                              'USD'
                                                          ? valueOrDefault<
                                                              double>(
                                                              widget.currentRateBuy! *
                                                                  double.parse(_model
                                                                      .textController
                                                                      .text),
                                                              0.0,
                                                            )
                                                          : double.parse(_model
                                                              .textController
                                                              .text))
                                                      : 0.0,
                                                  formatType:
                                                      FormatType.decimal,
                                                  decimalType:
                                                      DecimalType.periodDecimal,
                                                ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Oxygen',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 13.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                        TextSpan(
                                          text:
                                              ' ${currentUserDocument?.countryCurrency?.currencyCode}',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
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
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 8.0, 8.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: 100.0,
                                      height: 1.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                RichText(
                                  textScaleFactor:
                                      MediaQuery.of(context).textScaleFactor,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Payment Method',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Oxygen',
                                              color: Color(0xFF8D8B92),
                                              fontSize: 13.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      )
                                    ],
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Oxygen',
                                          color: Color(0xFFFFAA2E),
                                          fontSize: 13.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                                RichText(
                                  textScaleFactor:
                                      MediaQuery.of(context).textScaleFactor,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text:
                                            'Bank Transfer ( ${currentUserDocument?.countryCurrency?.currencyCode} account )',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Oxygen',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 13.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      )
                                    ],
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Oxygen',
                                          color: Color(0xFFFFAA2E),
                                          fontSize: 13.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ].divide(SizedBox(width: 18.0)),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 8.0, 8.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: 100.0,
                                      height: 1.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (!(isWeb
                  ? MediaQuery.viewInsetsOf(context).bottom > 0
                  : _isKeyboardVisible))
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(22.0, 0.0, 22.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if ((_model.textController.text != null &&
                                _model.textController.text != '') &&
                            !(isWeb
                                ? MediaQuery.viewInsetsOf(context).bottom > 0
                                : _isKeyboardVisible) &&
                            ((_model.dropDownCurrencyValue == 'USD'
                                    ? double.parse(_model.textController.text)
                                    : functions.ratePerDollar(
                                        _model.textController.text != null &&
                                                _model.textController.text != ''
                                            ? functions.stringToDouble(
                                                _model.textController.text)
                                            : 0.0,
                                        widget.currentRateBuy!)) >
                                4.0))
                          Row(
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
                                        currentUserDocument?.kycVerified,
                                        false)) {
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
                                              child: Container(
                                                height: double.infinity,
                                                child: AuthorizePinWidget(
                                                  action: () async {
                                                    setState(() {
                                                      FFAppState()
                                                          .updateBuyTransactionInitializedStruct(
                                                        (e) => e
                                                          ..amountToBuyCurrency = _model
                                                                      .dropDownCurrencyValue ==
                                                                  'USD'
                                                              ? valueOrDefault<
                                                                  double>(
                                                                  widget.currentRateBuy! *
                                                                      double.parse(_model
                                                                          .textController
                                                                          .text),
                                                                  0.0,
                                                                )
                                                              : double.tryParse(
                                                                  _model
                                                                      .textController
                                                                      .text)
                                                          ..amountToBuyinDollars = _model
                                                                      .dropDownCurrencyValue ==
                                                                  'USD'
                                                              ? double.tryParse(
                                                                  _model
                                                                      .textController
                                                                      .text)
                                                              : functions.divideFigures(
                                                                  double.parse(_model
                                                                      .textController
                                                                      .text),
                                                                  widget
                                                                      .currentRateBuy!)
                                                          ..amountToBuyInCrypto = functions.divideToGetCryptoValue(
                                                              functions.ratePerDollar(
                                                                  functions.stringToDouble(
                                                                      _model
                                                                          .textController
                                                                          .text),
                                                                  widget
                                                                      .currentRateBuy!),
                                                              widget.price!),
                                                      );
                                                    });

                                                    context.pushNamed(
                                                      'coinAddress',
                                                      queryParameters: {
                                                        'rateBuy':
                                                            serializeParam(
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
                                            transitionType:
                                                PageTransitionType.fade,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
