import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/back_component_widget.dart';
import '/components/currency_switch_trades_widget.dart';
import '/components/loading_screen_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/sold_page/popup/popup_widget.dart';
import '/sold_page/transactionreviewbuttomsheet/transactionreviewbuttomsheet_widget.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:barcode_widget/barcode_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'walletaddress_model.dart';
export 'walletaddress_model.dart';

class WalletaddressWidget extends StatefulWidget {
  const WalletaddressWidget({
    Key? key,
    required this.sellPrice,
    required this.cryptoRateCurrentPrice,
  }) : super(key: key);

  final double? sellPrice;
  final double? cryptoRateCurrentPrice;

  @override
  _WalletaddressWidgetState createState() => _WalletaddressWidgetState();
}

class _WalletaddressWidgetState extends State<WalletaddressWidget> {
  late WalletaddressModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WalletaddressModel());

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        setState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    _model.textFieldFocusNode ??= FocusNode();

    _model.amountSentInDollarsController ??= TextEditingController(text: '0');
    _model.amountSentInDollarsFocusNode ??= FocusNode();

    _model.amountToSellInCryptoController ??= TextEditingController();
    _model.amountToSellInCryptoFocusNode ??= FocusNode();

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

    return FutureBuilder<List<AdminCryptoAddressRecord>>(
      future: queryAdminCryptoAddressRecordOnce(
        queryBuilder: (adminCryptoAddressRecord) => adminCryptoAddressRecord
            .where(
              'CryptoChosen.symbol',
              isEqualTo: FFAppState().cryptoChosen.symbol,
            )
            .orderBy('createdDate', descending: true),
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
        List<AdminCryptoAddressRecord>
            walletaddressAdminCryptoAddressRecordList = snapshot.data!;
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
                        pageName: 'Wallet address',
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
                    child: Align(
                      alignment: AlignmentDirectional(0.00, -1.00),
                      child: Form(
                        key: _model.formKey,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              22.0, 0.0, 22.0, 0.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: RichText(
                                        textScaleFactor: MediaQuery.of(context)
                                            .textScaleFactor,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text:
                                                  'Please use the following wallet address for this transaction. ',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Work Sans',
                                                    color: Color(0xFF8D8B92),
                                                    fontSize: 13.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                            TextSpan(
                                              text: 'Send only ',
                                              style: TextStyle(
                                                color: Color(0xFFFFAA2E),
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13.0,
                                              ),
                                            ),
                                            TextSpan(
                                              text: valueOrDefault<String>(
                                                FFAppState()
                                                    .cryptoChosen
                                                    .symbol,
                                                'ETH',
                                              ),
                                              style: TextStyle(
                                                color: Color(0xFFFFAA2E),
                                                fontWeight: FontWeight.w600,
                                                fontSize: 13.0,
                                              ),
                                            ),
                                            TextSpan(
                                              text: ' to the address below.',
                                              style: TextStyle(
                                                color: Color(0xFFFFAA2E),
                                                fontSize: 13.0,
                                              ),
                                            )
                                          ],
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Work Sans',
                                                fontSize: 13.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'QR code',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Oxygen',
                                            fontSize: 13.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ClipRRect(
                                      child: Container(
                                        width: 100.0,
                                        height: 100.0,
                                        decoration: BoxDecoration(
                                          color: Color(0x002D2D2D),
                                        ),
                                        child: BarcodeWidget(
                                          data:
                                              walletaddressAdminCryptoAddressRecordList
                                                  .first.walletAddress,
                                          barcode: Barcode.qrCode(),
                                          width: 300.0,
                                          height: 90.0,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          backgroundColor: Colors.transparent,
                                          errorBuilder: (_context, _error) =>
                                              SizedBox(
                                            width: 300.0,
                                            height: 90.0,
                                          ),
                                          drawText: false,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                flex: 8,
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 7.0, 0.0),
                                                  child: TextFormField(
                                                    controller: _model
                                                            .textController1 ??=
                                                        TextEditingController(
                                                      text:
                                                          walletaddressAdminCryptoAddressRecordList
                                                              .first
                                                              .walletAddress,
                                                    ),
                                                    focusNode: _model
                                                        .textFieldFocusNode,
                                                    onChanged: (_) =>
                                                        EasyDebounce.debounce(
                                                      '_model.textController1',
                                                      Duration(
                                                          milliseconds: 10),
                                                      () => setState(() {}),
                                                    ),
                                                    readOnly: true,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      labelText: ' ',
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
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  18.0),
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Work Sans',
                                                          color:
                                                              Color(0xFF8D8B92),
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                    validator: _model
                                                        .textController1Validator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      width: 1.0,
                                                      height: double.infinity,
                                                      decoration: BoxDecoration(
                                                        gradient:
                                                            LinearGradient(
                                                          colors: [
                                                            Color(0xFF8D8B92),
                                                            Color(0x418D8B92)
                                                          ],
                                                          stops: [0.0, 1.0],
                                                          begin:
                                                              AlignmentDirectional(
                                                                  0.0, -1.0),
                                                          end:
                                                              AlignmentDirectional(
                                                                  0, 1.0),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  17.0,
                                                                  0.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          await action_blocks
                                                              .copyText(
                                                            context,
                                                            textToCopy:
                                                                walletaddressAdminCryptoAddressRecordList
                                                                    .first
                                                                    .walletAddress,
                                                          );
                                                          setState(() {});
                                                        },
                                                        child: Text(
                                                          'Copy',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Oxygen',
                                                                color: Color(
                                                                    0xFFFFAA2E),
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
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Amount to Send in Dollars',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Oxygen',
                                                fontSize: 13.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                        AuthUserStreamWidget(
                                          builder: (context) => Text(
                                            '${(valueOrDefault<bool>(currentUserDocument?.setCurrencyToTrade, false) != null) && valueOrDefault<bool>(currentUserDocument?.setCurrencyToTrade, false) && (currentUserDocument?.countryCurrency?.currencyCode != FFAppState().countryCurrencyTradeSell.currencyCode) ? FFAppState().countryCurrencyTradeSell.currencyCode : valueOrDefault<String>(
                                                currentUserDocument
                                                    ?.countryCurrency
                                                    ?.currencyCode,
                                                'NGN',
                                              )}${formatNumber(
                                              (valueOrDefault<bool>(
                                                              currentUserDocument
                                                                  ?.setCurrencyToTrade,
                                                              false) !=
                                                          null) &&
                                                      valueOrDefault<bool>(
                                                          currentUserDocument
                                                              ?.setCurrencyToTrade,
                                                          false) &&
                                                      (currentUserDocument
                                                              ?.countryCurrency
                                                              ?.currencyCode !=
                                                          FFAppState()
                                                              .countryCurrencyTradeSell
                                                              .currencyCode)
                                                  ? FFAppState()
                                                      .countryCurrencyTradeSell
                                                      .rateSell
                                                  : widget.sellPrice,
                                              formatType: FormatType.decimal,
                                              decimalType:
                                                  DecimalType.periodDecimal,
                                            )}/\$',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Work Sans',
                                                  color: Color(0xFF8D8B92),
                                                  fontSize: 13.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            height: 50.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  flex: 8,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                7.0, 0.0),
                                                    child: TextFormField(
                                                      controller: _model
                                                          .amountSentInDollarsController,
                                                      focusNode: _model
                                                          .amountSentInDollarsFocusNode,
                                                      onChanged: (_) =>
                                                          EasyDebounce.debounce(
                                                        '_model.amountSentInDollarsController',
                                                        Duration(
                                                            milliseconds: 100),
                                                        () async {
                                                          setState(() {
                                                            _model.amountToSellInCryptoController?.text = functions
                                                                .customRoundupValue(
                                                                    double.parse(_model
                                                                            .amountSentInDollarsController
                                                                            .text) /
                                                                        widget
                                                                            .cryptoRateCurrentPrice!,
                                                                    8)
                                                                .toString();
                                                          });
                                                        },
                                                      ),
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelText: ' ',
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
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    18.0),
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Work Sans',
                                                                color: Color(
                                                                    0xFF8D8B92),
                                                                fontSize: 14.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                      keyboardType:
                                                          const TextInputType
                                                              .numberWithOptions(
                                                              decimal: true),
                                                      validator: _model
                                                          .amountSentInDollarsControllerValidator
                                                          .asValidator(context),
                                                      inputFormatters: [
                                                        FilteringTextInputFormatter
                                                            .allow(
                                                                RegExp('[0-9]'))
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Container(
                                                        width: 1.0,
                                                        height: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          gradient:
                                                              LinearGradient(
                                                            colors: [
                                                              Color(0xFF8D8B92),
                                                              Color(0x418D8B92)
                                                            ],
                                                            stops: [0.0, 1.0],
                                                            begin:
                                                                AlignmentDirectional(
                                                                    0.0, -1.0),
                                                            end:
                                                                AlignmentDirectional(
                                                                    0, 1.0),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    27.0,
                                                                    0.0),
                                                        child: Text(
                                                          '\$',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Oxygen',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
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
                                      ],
                                    ),
                                  ].divide(SizedBox(height: 4.0)),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'Amount to Send in ${valueOrDefault<String>(
                                            FFAppState().cryptoChosen.name,
                                            'Name',
                                          )}',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Oxygen',
                                                fontSize: 13.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            height: 50.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  flex: 8,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                7.0, 0.0),
                                                    child: TextFormField(
                                                      controller: _model
                                                          .amountToSellInCryptoController,
                                                      focusNode: _model
                                                          .amountToSellInCryptoFocusNode,
                                                      onChanged: (_) =>
                                                          EasyDebounce.debounce(
                                                        '_model.amountToSellInCryptoController',
                                                        Duration(
                                                            milliseconds: 10),
                                                        () => setState(() {}),
                                                      ),
                                                      readOnly: true,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelText: ' ',
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
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    18.0),
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Work Sans',
                                                                color: Color(
                                                                    0xFF8D8B92),
                                                                fontSize: 13.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                      validator: _model
                                                          .amountToSellInCryptoControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Container(
                                                        width: 1.0,
                                                        height: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          gradient:
                                                              LinearGradient(
                                                            colors: [
                                                              Color(0xFF8D8B92),
                                                              Color(0x418D8B92)
                                                            ],
                                                            stops: [0.0, 1.0],
                                                            begin:
                                                                AlignmentDirectional(
                                                                    0.0, -1.0),
                                                            end:
                                                                AlignmentDirectional(
                                                                    0, 1.0),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    0.0,
                                                                    17.0,
                                                                    0.0),
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            FFAppState()
                                                                .cryptoChosen
                                                                .symbol,
                                                            'ETH',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Oxygen',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
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
                                      ],
                                    ),
                                  ].divide(SizedBox(height: 4.0)),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 4.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          AuthUserStreamWidget(
                                            builder: (context) => Text(
                                              'Trade in ${(valueOrDefault<bool>(currentUserDocument?.setCurrencyToTrade, false) != null) && valueOrDefault<bool>(currentUserDocument?.setCurrencyToTrade, false) && (currentUserDocument?.countryCurrency?.currencyCode != FFAppState().countryCurrencyTradeSell.currencyCode) ? FFAppState().countryCurrencyTradeSell.currencyCode : valueOrDefault<String>(
                                                  currentUserDocument
                                                      ?.countryCurrency
                                                      ?.currencyCode,
                                                  'NGN',
                                                )}',
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
                                          ),
                                          wrapWithModel(
                                            model: _model
                                                .currencySwitchTradesModel,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: CurrencySwitchTradesWidget(),
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
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 7.0, 12.0, 7.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        'Approximately you’ll receive',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Work Sans',
                                                              color: Color(
                                                                  0xFF8D8B92),
                                                              fontSize: 13.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      AuthUserStreamWidget(
                                                        builder: (context) =>
                                                            Text(
                                                          '${(valueOrDefault<bool>(currentUserDocument?.setCurrencyToTrade, false) != null) && valueOrDefault<bool>(currentUserDocument?.setCurrencyToTrade, false) && (currentUserDocument?.countryCurrency?.currencyCode != FFAppState().countryCurrencyTradeSell.currencyCode) ? FFAppState().countryCurrencyTradeSell.currencyCode : valueOrDefault<String>(
                                                              currentUserDocument
                                                                  ?.countryCurrency
                                                                  ?.currencyCode,
                                                              'NGN',
                                                            )}${formatNumber(
                                                            valueOrDefault<
                                                                    double>(
                                                                  double.tryParse(
                                                                      _model
                                                                          .amountSentInDollarsController
                                                                          .text),
                                                                  0.0,
                                                                ) *
                                                                valueOrDefault<
                                                                    double>(
                                                                  (valueOrDefault<bool>(currentUserDocument?.setCurrencyToTrade, false) !=
                                                                              null) &&
                                                                          valueOrDefault<bool>(
                                                                              currentUserDocument
                                                                                  ?.setCurrencyToTrade,
                                                                              false)
                                                                      ? FFAppState()
                                                                          .countryCurrencyTradeSell
                                                                          .rateSell
                                                                      : widget
                                                                          .sellPrice,
                                                                  0.0,
                                                                ),
                                                            formatType:
                                                                FormatType
                                                                    .decimal,
                                                            decimalType:
                                                                DecimalType
                                                                    .periodDecimal,
                                                          )}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Work Sans',
                                                                color: Color(
                                                                    0xFF8D8B92),
                                                                fontSize: 13.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ].divide(SizedBox(height: 4.0)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ].divide(SizedBox(height: 4.0)),
                                ),
                              ]
                                  .divide(SizedBox(height: 16.0))
                                  .addToEnd(SizedBox(height: 100.0)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (!(isWeb
                      ? MediaQuery.viewInsetsOf(context).bottom > 0
                      : _isKeyboardVisible))
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(22.0, 0.0, 22.0, 12.0),
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
                                    FFAppState().updateAmountToSellStruct(
                                      (e) => e
                                        ..amountToSellInDollars =
                                            double.tryParse(_model
                                                .amountSentInDollarsController
                                                .text)
                                        ..amountToSellInCrypto =
                                            double.tryParse(_model
                                                .amountToSellInCryptoController
                                                .text)
                                        ..amountToRecieveInLocalCurrency =
                                            valueOrDefault<double>(
                                          valueOrDefault<double>(
                                                double.tryParse(_model
                                                    .amountSentInDollarsController
                                                    .text),
                                                0.0,
                                              ) *
                                              valueOrDefault<double>(
                                                (valueOrDefault<bool>(
                                                                currentUserDocument
                                                                    ?.setCurrencyToTrade,
                                                                false) !=
                                                            null) &&
                                                        valueOrDefault<bool>(
                                                            currentUserDocument
                                                                ?.setCurrencyToTrade,
                                                            false)
                                                    ? FFAppState()
                                                        .countryCurrencyTradeSell
                                                        .rateSell
                                                    : widget.sellPrice,
                                                0.0,
                                              ),
                                          0.0,
                                        )
                                        ..walletAddressSentTo =
                                            walletaddressAdminCryptoAddressRecordList
                                                .first.walletAddress,
                                    );
                                  });

                                  var userTransactionsRecordReference =
                                      UserTransactionsRecord.collection.doc();
                                  firestoreBatch.set(
                                      userTransactionsRecordReference,
                                      createUserTransactionsRecordData(
                                        userID: currentUserUid,
                                        transactionType: 'sold',
                                        countryCurrency:
                                            createCountryCurrencyDataTypeStruct(
                                          countryName: (valueOrDefault<bool>(
                                                          currentUserDocument
                                                              ?.setCurrencyToTrade,
                                                          false) !=
                                                      null) &&
                                                  valueOrDefault<bool>(
                                                      currentUserDocument
                                                          ?.setCurrencyToTrade,
                                                      false) &&
                                                  (currentUserDocument
                                                          ?.countryCurrency
                                                          ?.currencyCode !=
                                                      FFAppState()
                                                          .countryCurrencyTradeSell
                                                          .currencyCode)
                                              ? FFAppState()
                                                  .countryCurrencyTradeSell
                                                  .countryName
                                              : valueOrDefault<String>(
                                                  currentUserDocument
                                                      ?.countryCurrency
                                                      ?.countryName,
                                                  'NGN',
                                                ),
                                          currencyCode: (valueOrDefault<bool>(
                                                          currentUserDocument
                                                              ?.setCurrencyToTrade,
                                                          false) !=
                                                      null) &&
                                                  valueOrDefault<bool>(
                                                      currentUserDocument
                                                          ?.setCurrencyToTrade,
                                                      false) &&
                                                  (currentUserDocument
                                                          ?.countryCurrency
                                                          ?.currencyCode !=
                                                      FFAppState()
                                                          .countryCurrencyTradeSell
                                                          .currencyCode)
                                              ? FFAppState()
                                                  .countryCurrencyTradeSell
                                                  .currencyCode
                                              : valueOrDefault<String>(
                                                  currentUserDocument
                                                      ?.countryCurrency
                                                      ?.currencyCode,
                                                  'NGN',
                                                ),
                                          countryFlag: (valueOrDefault<bool>(
                                                          currentUserDocument
                                                              ?.setCurrencyToTrade,
                                                          false) !=
                                                      null) &&
                                                  valueOrDefault<bool>(
                                                      currentUserDocument
                                                          ?.setCurrencyToTrade,
                                                      false) &&
                                                  (currentUserDocument
                                                          ?.countryCurrency
                                                          ?.currencyCode !=
                                                      FFAppState()
                                                          .countryCurrencyTradeSell
                                                          .currencyCode)
                                              ? FFAppState()
                                                  .countryCurrencyTradeSell
                                                  .countryFlag
                                              : valueOrDefault<String>(
                                                  currentUserDocument
                                                      ?.countryCurrency
                                                      ?.countryFlag,
                                                  'NGN',
                                                ),
                                          currencyRef: (valueOrDefault<bool>(
                                                          currentUserDocument
                                                              ?.setCurrencyToTrade,
                                                          false) !=
                                                      null) &&
                                                  valueOrDefault<bool>(
                                                      currentUserDocument
                                                          ?.setCurrencyToTrade,
                                                      false) &&
                                                  (currentUserDocument
                                                          ?.countryCurrency
                                                          ?.currencyCode !=
                                                      FFAppState()
                                                          .countryCurrencyTradeSell
                                                          .currencyCode)
                                              ? FFAppState()
                                                  .countryCurrencyTradeSell
                                                  .currencyRef
                                              : currentUserDocument
                                                  ?.countryCurrency
                                                  ?.currencyRef,
                                          clearUnsetFields: false,
                                          create: true,
                                        ),
                                        createdDate: getCurrentTimestamp,
                                        cryptoChoice: createCryptoNameStruct(
                                          name: FFAppState().cryptoChosen.name,
                                          cryptoChosenRef: FFAppState()
                                              .cryptoChosen
                                              .cryptoChosenRef,
                                          imageCoin: FFAppState()
                                              .cryptoChosen
                                              .imageCoin,
                                          symbol:
                                              FFAppState().cryptoChosen.symbol,
                                          clearUnsetFields: false,
                                          create: true,
                                        ),
                                        transactionStatus: 'pending',
                                        expiredDate: functions
                                            .futureMINUTESGenerated(20),
                                        expired: true,
                                        ratePerDollar: (valueOrDefault<bool>(
                                                        currentUserDocument
                                                            ?.setCurrencyToTrade,
                                                        false) !=
                                                    null) &&
                                                valueOrDefault<bool>(
                                                    currentUserDocument
                                                        ?.setCurrencyToTrade,
                                                    false) &&
                                                (currentUserDocument
                                                        ?.countryCurrency
                                                        ?.currencyCode !=
                                                    FFAppState()
                                                        .countryCurrencyTradeSell
                                                        .currencyCode)
                                            ? FFAppState()
                                                .countryCurrencyTradeSell
                                                .rateSell
                                            : widget.sellPrice,
                                        sellOrderTransaction:
                                            createSellOrderInitiatedStruct(
                                          amountToSellInDollars:
                                              double.tryParse(_model
                                                  .amountSentInDollarsController
                                                  .text),
                                          amountToSellInCrypto: double.tryParse(
                                              _model
                                                  .amountToSellInCryptoController
                                                  .text),
                                          amountToRecieveInLocalCurrency:
                                              valueOrDefault<double>(
                                            valueOrDefault<double>(
                                                  double.tryParse(_model
                                                      .amountSentInDollarsController
                                                      .text),
                                                  0.0,
                                                ) *
                                                valueOrDefault<double>(
                                                  (valueOrDefault<bool>(
                                                                  currentUserDocument
                                                                      ?.setCurrencyToTrade,
                                                                  false) !=
                                                              null) &&
                                                          valueOrDefault<bool>(
                                                              currentUserDocument
                                                                  ?.setCurrencyToTrade,
                                                              false)
                                                      ? FFAppState()
                                                          .countryCurrencyTradeSell
                                                          .rateSell
                                                      : widget.sellPrice,
                                                  0.0,
                                                ),
                                            0.0,
                                          ),
                                          walletAddressSentTo:
                                              walletaddressAdminCryptoAddressRecordList
                                                  .first.walletAddress,
                                          clearUnsetFields: false,
                                          create: true,
                                        ),
                                      ));
                                  _model.createdTransaction =
                                      UserTransactionsRecord
                                          .getDocumentFromData(
                                              createUserTransactionsRecordData(
                                                userID: currentUserUid,
                                                transactionType: 'sold',
                                                countryCurrency:
                                                    createCountryCurrencyDataTypeStruct(
                                                  countryName: (valueOrDefault<
                                                                      bool>(
                                                                  currentUserDocument
                                                                      ?.setCurrencyToTrade,
                                                                  false) !=
                                                              null) &&
                                                          valueOrDefault<bool>(
                                                              currentUserDocument
                                                                  ?.setCurrencyToTrade,
                                                              false) &&
                                                          (currentUserDocument
                                                                  ?.countryCurrency
                                                                  ?.currencyCode !=
                                                              FFAppState()
                                                                  .countryCurrencyTradeSell
                                                                  .currencyCode)
                                                      ? FFAppState()
                                                          .countryCurrencyTradeSell
                                                          .countryName
                                                      : valueOrDefault<String>(
                                                          currentUserDocument
                                                              ?.countryCurrency
                                                              ?.countryName,
                                                          'NGN',
                                                        ),
                                                  currencyCode: (valueOrDefault<
                                                                      bool>(
                                                                  currentUserDocument
                                                                      ?.setCurrencyToTrade,
                                                                  false) !=
                                                              null) &&
                                                          valueOrDefault<bool>(
                                                              currentUserDocument
                                                                  ?.setCurrencyToTrade,
                                                              false) &&
                                                          (currentUserDocument
                                                                  ?.countryCurrency
                                                                  ?.currencyCode !=
                                                              FFAppState()
                                                                  .countryCurrencyTradeSell
                                                                  .currencyCode)
                                                      ? FFAppState()
                                                          .countryCurrencyTradeSell
                                                          .currencyCode
                                                      : valueOrDefault<String>(
                                                          currentUserDocument
                                                              ?.countryCurrency
                                                              ?.currencyCode,
                                                          'NGN',
                                                        ),
                                                  countryFlag: (valueOrDefault<
                                                                      bool>(
                                                                  currentUserDocument
                                                                      ?.setCurrencyToTrade,
                                                                  false) !=
                                                              null) &&
                                                          valueOrDefault<bool>(
                                                              currentUserDocument
                                                                  ?.setCurrencyToTrade,
                                                              false) &&
                                                          (currentUserDocument
                                                                  ?.countryCurrency
                                                                  ?.currencyCode !=
                                                              FFAppState()
                                                                  .countryCurrencyTradeSell
                                                                  .currencyCode)
                                                      ? FFAppState()
                                                          .countryCurrencyTradeSell
                                                          .countryFlag
                                                      : valueOrDefault<String>(
                                                          currentUserDocument
                                                              ?.countryCurrency
                                                              ?.countryFlag,
                                                          'NGN',
                                                        ),
                                                  currencyRef: (valueOrDefault<
                                                                      bool>(
                                                                  currentUserDocument
                                                                      ?.setCurrencyToTrade,
                                                                  false) !=
                                                              null) &&
                                                          valueOrDefault<bool>(
                                                              currentUserDocument
                                                                  ?.setCurrencyToTrade,
                                                              false) &&
                                                          (currentUserDocument
                                                                  ?.countryCurrency
                                                                  ?.currencyCode !=
                                                              FFAppState()
                                                                  .countryCurrencyTradeSell
                                                                  .currencyCode)
                                                      ? FFAppState()
                                                          .countryCurrencyTradeSell
                                                          .currencyRef
                                                      : currentUserDocument
                                                          ?.countryCurrency
                                                          ?.currencyRef,
                                                  clearUnsetFields: false,
                                                  create: true,
                                                ),
                                                createdDate:
                                                    getCurrentTimestamp,
                                                cryptoChoice:
                                                    createCryptoNameStruct(
                                                  name: FFAppState()
                                                      .cryptoChosen
                                                      .name,
                                                  cryptoChosenRef: FFAppState()
                                                      .cryptoChosen
                                                      .cryptoChosenRef,
                                                  imageCoin: FFAppState()
                                                      .cryptoChosen
                                                      .imageCoin,
                                                  symbol: FFAppState()
                                                      .cryptoChosen
                                                      .symbol,
                                                  clearUnsetFields: false,
                                                  create: true,
                                                ),
                                                transactionStatus: 'pending',
                                                expiredDate: functions
                                                    .futureMINUTESGenerated(20),
                                                expired: true,
                                                ratePerDollar: (valueOrDefault<
                                                                    bool>(
                                                                currentUserDocument
                                                                    ?.setCurrencyToTrade,
                                                                false) !=
                                                            null) &&
                                                        valueOrDefault<bool>(
                                                            currentUserDocument
                                                                ?.setCurrencyToTrade,
                                                            false) &&
                                                        (currentUserDocument
                                                                ?.countryCurrency
                                                                ?.currencyCode !=
                                                            FFAppState()
                                                                .countryCurrencyTradeSell
                                                                .currencyCode)
                                                    ? FFAppState()
                                                        .countryCurrencyTradeSell
                                                        .rateSell
                                                    : widget.sellPrice,
                                                sellOrderTransaction:
                                                    createSellOrderInitiatedStruct(
                                                  amountToSellInDollars:
                                                      double.tryParse(_model
                                                          .amountSentInDollarsController
                                                          .text),
                                                  amountToSellInCrypto:
                                                      double.tryParse(_model
                                                          .amountToSellInCryptoController
                                                          .text),
                                                  amountToRecieveInLocalCurrency:
                                                      valueOrDefault<double>(
                                                    valueOrDefault<double>(
                                                          double.tryParse(_model
                                                              .amountSentInDollarsController
                                                              .text),
                                                          0.0,
                                                        ) *
                                                        valueOrDefault<double>(
                                                          (valueOrDefault<bool>(
                                                                          currentUserDocument
                                                                              ?.setCurrencyToTrade,
                                                                          false) !=
                                                                      null) &&
                                                                  valueOrDefault<
                                                                          bool>(
                                                                      currentUserDocument
                                                                          ?.setCurrencyToTrade,
                                                                      false)
                                                              ? FFAppState()
                                                                  .countryCurrencyTradeSell
                                                                  .rateSell
                                                              : widget
                                                                  .sellPrice,
                                                          0.0,
                                                        ),
                                                    0.0,
                                                  ),
                                                  walletAddressSentTo:
                                                      walletaddressAdminCryptoAddressRecordList
                                                          .first.walletAddress,
                                                  clearUnsetFields: false,
                                                  create: true,
                                                ),
                                              ),
                                              userTransactionsRecordReference);

                                  firestoreBatch.update(currentUserReference!, {
                                    ...mapToFirestore(
                                      {
                                        'noOfTransactions':
                                            FieldValue.increment(1),
                                      },
                                    ),
                                  });

                                  firestoreBatch.update(
                                      _model.createdTransaction!.reference,
                                      createUserTransactionsRecordData(
                                        transactionID: _model
                                            .createdTransaction?.reference,
                                        transactionsCodeRef: functions
                                            .removeUserTransactionsREF(_model
                                                .createdTransaction!
                                                .reference
                                                .id),
                                      ));
                                  Navigator.pop(context);
                                  if ((valueOrDefault<bool>(
                                              currentUserDocument
                                                  ?.setCurrencyToTrade,
                                              false) !=
                                          null) &&
                                      valueOrDefault<bool>(
                                          currentUserDocument
                                              ?.setCurrencyToTrade,
                                          false) &&
                                      (currentUserDocument
                                              ?.countryCurrency?.currencyCode !=
                                          FFAppState()
                                              .countryCurrencyTradeSell
                                              .currencyCode)) {
                                    showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
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
                                              child: PopupWidget(
                                                walletAddress:
                                                    walletaddressAdminCryptoAddressRecordList
                                                        .first.walletAddress,
                                                currencyCode: (valueOrDefault<bool>(
                                                                currentUserDocument
                                                                    ?.setCurrencyToTrade,
                                                                false) !=
                                                            null) &&
                                                        valueOrDefault<bool>(
                                                            currentUserDocument
                                                                ?.setCurrencyToTrade,
                                                            false) &&
                                                        (currentUserDocument
                                                                ?.countryCurrency
                                                                ?.currencyCode !=
                                                            FFAppState()
                                                                .countryCurrencyTradeSell
                                                                .currencyCode)
                                                    ? FFAppState()
                                                        .countryCurrencyTradeSell
                                                        .currencyCode
                                                    : valueOrDefault<String>(
                                                        currentUserDocument
                                                            ?.countryCurrency
                                                            ?.currencyCode,
                                                        'NGN',
                                                      ),
                                                cryptoAmount: _model
                                                    .amountToSellInCryptoController
                                                    .text,
                                                cryptoType:
                                                    valueOrDefault<String>(
                                                  FFAppState()
                                                      .cryptoChosen
                                                      .symbol,
                                                  'ETH',
                                                ),
                                                action: () async {
                                                  await _model
                                                      .createdTransaction!
                                                      .reference
                                                      .update(
                                                          createUserTransactionsRecordData(
                                                    chatStatus: 'open',
                                                  ));

                                                  context.goNamed(
                                                    'ChatTransactionsChat',
                                                    queryParameters: {
                                                      'transactionRef':
                                                          serializeParam(
                                                        _model
                                                            .createdTransaction
                                                            ?.reference,
                                                        ParamType
                                                            .DocumentReference,
                                                      ),
                                                      'buyOrder':
                                                          serializeParam(
                                                        _model.createdTransaction
                                                                ?.transactionType ==
                                                            'bought',
                                                        ParamType.bool,
                                                      ),
                                                      'chatON': serializeParam(
                                                        _model.createdTransaction
                                                                ?.chatStatus ==
                                                            'open',
                                                        ParamType.bool,
                                                      ),
                                                      'sellTradeOn':
                                                          serializeParam(
                                                        true,
                                                        ParamType.bool,
                                                      ),
                                                      'cryptoAmount':
                                                          serializeParam(
                                                        _model
                                                            .amountToSellInCryptoController
                                                            .text,
                                                        ParamType.String,
                                                      ),
                                                      'cryptoChosen':
                                                          serializeParam(
                                                        valueOrDefault<String>(
                                                          FFAppState()
                                                              .cryptoChosen
                                                              .symbol,
                                                          'ETH',
                                                        ),
                                                        ParamType.String,
                                                      ),
                                                      'localAmountPayout':
                                                          serializeParam(
                                                        formatNumber(
                                                          valueOrDefault<
                                                                  double>(
                                                                double.tryParse(
                                                                    _model
                                                                        .amountSentInDollarsController
                                                                        .text),
                                                                0.0,
                                                              ) *
                                                              valueOrDefault<
                                                                  double>(
                                                                (valueOrDefault<bool>(currentUserDocument?.setCurrencyToTrade, false) !=
                                                                            null) &&
                                                                        valueOrDefault<bool>(
                                                                            currentUserDocument
                                                                                ?.setCurrencyToTrade,
                                                                            false)
                                                                    ? FFAppState()
                                                                        .countryCurrencyTradeSell
                                                                        .rateSell
                                                                    : widget
                                                                        .sellPrice,
                                                                0.0,
                                                              ),
                                                          formatType: FormatType
                                                              .decimal,
                                                          decimalType:
                                                              DecimalType
                                                                  .periodDecimal,
                                                        ),
                                                        ParamType.String,
                                                      ),
                                                      'transactionCurrency':
                                                          serializeParam(
                                                        (valueOrDefault<bool>(
                                                                        currentUserDocument
                                                                            ?.setCurrencyToTrade,
                                                                        false) !=
                                                                    null) &&
                                                                valueOrDefault<
                                                                        bool>(
                                                                    currentUserDocument
                                                                        ?.setCurrencyToTrade,
                                                                    false) &&
                                                                (currentUserDocument
                                                                        ?.countryCurrency
                                                                        ?.currencyCode !=
                                                                    FFAppState()
                                                                        .countryCurrencyTradeSell
                                                                        .currencyCode)
                                                            ? FFAppState()
                                                                .countryCurrencyTradeSell
                                                                .currencyCode
                                                            : valueOrDefault<
                                                                String>(
                                                                currentUserDocument
                                                                    ?.countryCurrency
                                                                    ?.currencyCode,
                                                                'NGN',
                                                              ),
                                                        ParamType.String,
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
                                    showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
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
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.98,
                                              child:
                                                  TransactionreviewbuttomsheetWidget(
                                                transactionCryptoValue:
                                                    double.parse(_model
                                                        .amountToSellInCryptoController
                                                        .text),
                                                amountInDollars:
                                                    double.tryParse(_model
                                                        .amountSentInDollarsController
                                                        .text),
                                                currentRatePerDollar:
                                                    widget.sellPrice,
                                                totalTransactionValue:
                                                    double.parse(_model
                                                            .amountSentInDollarsController
                                                            .text) *
                                                        widget.sellPrice!,
                                                transactionRef: _model
                                                    .createdTransaction!
                                                    .reference,
                                                walletNumber:
                                                    walletaddressAdminCryptoAddressRecordList
                                                        .first.walletAddress,
                                              ),
                                            ),
                                          ),
                                        ));
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  }
                                } finally {
                                  await firestoreBatch.commit();
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
