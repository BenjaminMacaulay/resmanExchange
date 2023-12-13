import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/back_component_widget.dart';
import '/components/loading_screen_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'coin_address_model.dart';
export 'coin_address_model.dart';

class CoinAddressWidget extends StatefulWidget {
  const CoinAddressWidget({
    Key? key,
    String? coinImage,
    this.rateBuy,
  })  : this.coinImage = coinImage ??
            'https://firebasestorage.googleapis.com/v0/b/rexmanexchange-204ac.appspot.com/o/coins%2FBitcoinPic.jpeg?alt=media&token=b26c16bf-956d-4688-a61c-44f13f07823f&_gl=1*uehoon*_ga*MTc4NDAwMTYwMy4xNjgzMDU3MjU1*_ga_CW55HF8NVT*MTY5NzQ2OTc2NS4yMDYuMS4xNjk3NDY5Nzc2LjQ5LjAuMA..',
        super(key: key);

  final String coinImage;
  final double? rateBuy;

  @override
  _CoinAddressWidgetState createState() => _CoinAddressWidgetState();
}

class _CoinAddressWidgetState extends State<CoinAddressWidget> {
  late CoinAddressModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CoinAddressModel());

    _model.btcController ??= TextEditingController();
    _model.btcFocusNode ??= FocusNode();

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
          title: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: wrapWithModel(
                  model: _model.backComponentModel,
                  updateCallback: () => setState(() {}),
                  child: BackComponentWidget(
                    pageName: 'Enter your address',
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 25.0, 32.0, 0.0),
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
                                  15.0, 0.0, 15.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 30.0,
                                    height: 30.0,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: Image.network(
                                          valueOrDefault<String>(
                                            FFAppState().cryptoChosen.imageCoin,
                                            'https://firebasestorage.googleapis.com/v0/b/rexmanexchange-204ac.appspot.com/o/coins%2FBitcoinPic.jpeg?alt=media&token=b26c16bf-956d-4688-a61c-44f13f07823f&_gl=1*uehoon*_ga*MTc4NDAwMTYwMy4xNjgzMDU3MjU1*_ga_CW55HF8NVT*MTY5NzQ2OTc2NS4yMDYuMS4xNjk3NDY5Nzc2LjQ5LjAuMA..',
                                          ),
                                        ).image,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Form(
                                      key: _model.formKey,
                                      autovalidateMode:
                                          AutovalidateMode.disabled,
                                      child: Container(
                                        width: double.infinity,
                                        child: TextFormField(
                                          controller: _model.btcController,
                                          focusNode: _model.btcFocusNode,
                                          autofocus: true,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: ' ',
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium,
                                            hintText: 'Address',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Oxygen',
                                                      fontSize: 12.0,
                                                    ),
                                            enabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            focusedErrorBorder:
                                                InputBorder.none,
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 18.0),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                          validator: _model
                                              .btcControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(width: 12.0)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(25.0, 12.0, 22.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Theme(
                                data: ThemeData(
                                  checkboxTheme: CheckboxThemeData(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                  ),
                                  unselectedWidgetColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryText,
                                ),
                                child: Checkbox(
                                  value: _model.checkboxValue ??= false,
                                  onChanged: (newValue) async {
                                    setState(
                                        () => _model.checkboxValue = newValue!);
                                  },
                                  activeColor:
                                      FlutterFlowTheme.of(context).primary,
                                  checkColor: FlutterFlowTheme.of(context).info,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'I confirm that I am using  ${FFAppState().cryptoChosen.symbol == 'ETH' ? 'an ' : 'a '}${FFAppState().cryptoChosen.name} address that supports  ${FFAppState().cryptoChosen.symbol}. I understand that any potential loss resulting from an incorrect address will be my responsibility and not the fault of Resman Exchange.',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Oxygen',
                                        color: Color(0xFF8D8B92),
                                        fontSize: 12.0,
                                      ),
                                ),
                              ),
                            ].divide(SizedBox(width: 2.0)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if ((_model.btcController.text != null &&
                          _model.btcController.text != '') &&
                      _model.checkboxValue!)
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
                                final firestoreBatch =
                                    FirebaseFirestore.instance.batch();
                                try {
                                  setState(() {
                                    FFAppState()
                                        .updateBuyTransactionInitializedStruct(
                                      (e) => e
                                        ..cryptoAddress = double.tryParse(
                                            _model.btcController.text),
                                    );
                                  });
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
                                                await Future.delayed(
                                                    const Duration(
                                                        milliseconds: 15000));
                                                if (!_model.actionDone) {
                                                  Navigator.pop(context);
                                                }
                                              },
                                            ),
                                          ),
                                        ),
                                      ));
                                    },
                                  ).then((value) => safeSetState(() {}));

                                  _model.countryCurrencyRead =
                                      await CountriesCurrencyRecord
                                          .getDocumentOnce(currentUserDocument!
                                              .countryCurrency.currencyRef!);

                                  var userTransactionsRecordReference =
                                      UserTransactionsRecord.collection.doc();
                                  firestoreBatch.set(
                                      userTransactionsRecordReference,
                                      createUserTransactionsRecordData(
                                        userID: currentUserUid,
                                        transactionType: 'bought',
                                        countryCurrency:
                                            createCountryCurrencyDataTypeStruct(
                                          countryName: currentUserDocument
                                              ?.countryCurrency?.countryName,
                                          currencyCode: currentUserDocument
                                              ?.countryCurrency?.currencyCode,
                                          countryFlag: currentUserDocument
                                              ?.countryCurrency?.countryFlag,
                                          currencyRef: currentUserDocument
                                              ?.countryCurrency?.currencyRef,
                                          rateBuy: _model.countryCurrencyRead
                                              ?.countryCurrency?.rateBuy,
                                          rateSell: _model.countryCurrencyRead
                                              ?.countryCurrency?.rateSell,
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
                                        buyTransaction:
                                            createBuyTransactionInitiatedStruct(
                                          amountToBuyCurrency: FFAppState()
                                              .BuyTransactionInitialized
                                              .amountToBuyCurrency,
                                          amountToBuyinDollars: FFAppState()
                                              .BuyTransactionInitialized
                                              .amountToBuyinDollars,
                                          amountToBuyInCrypto: FFAppState()
                                              .BuyTransactionInitialized
                                              .amountToBuyInCrypto,
                                          cryptoAddress: FFAppState()
                                              .BuyTransactionInitialized
                                              .cryptoAddress,
                                          clearUnsetFields: false,
                                          create: true,
                                        ),
                                        transactionStatus: 'pending',
                                        expiredDate: functions
                                            .futureMINUTESGenerated(20),
                                        expired: true,
                                        ratePerDollar: widget.rateBuy,
                                      ));
                                  _model.transactionCreated =
                                      UserTransactionsRecord
                                          .getDocumentFromData(
                                              createUserTransactionsRecordData(
                                                userID: currentUserUid,
                                                transactionType: 'bought',
                                                countryCurrency:
                                                    createCountryCurrencyDataTypeStruct(
                                                  countryName:
                                                      currentUserDocument
                                                          ?.countryCurrency
                                                          ?.countryName,
                                                  currencyCode:
                                                      currentUserDocument
                                                          ?.countryCurrency
                                                          ?.currencyCode,
                                                  countryFlag:
                                                      currentUserDocument
                                                          ?.countryCurrency
                                                          ?.countryFlag,
                                                  currencyRef:
                                                      currentUserDocument
                                                          ?.countryCurrency
                                                          ?.currencyRef,
                                                  rateBuy: _model
                                                      .countryCurrencyRead
                                                      ?.countryCurrency
                                                      ?.rateBuy,
                                                  rateSell: _model
                                                      .countryCurrencyRead
                                                      ?.countryCurrency
                                                      ?.rateSell,
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
                                                buyTransaction:
                                                    createBuyTransactionInitiatedStruct(
                                                  amountToBuyCurrency: FFAppState()
                                                      .BuyTransactionInitialized
                                                      .amountToBuyCurrency,
                                                  amountToBuyinDollars: FFAppState()
                                                      .BuyTransactionInitialized
                                                      .amountToBuyinDollars,
                                                  amountToBuyInCrypto: FFAppState()
                                                      .BuyTransactionInitialized
                                                      .amountToBuyInCrypto,
                                                  cryptoAddress: FFAppState()
                                                      .BuyTransactionInitialized
                                                      .cryptoAddress,
                                                  clearUnsetFields: false,
                                                  create: true,
                                                ),
                                                transactionStatus: 'pending',
                                                expiredDate: functions
                                                    .futureMINUTESGenerated(20),
                                                expired: true,
                                                ratePerDollar: widget.rateBuy,
                                              ),
                                              userTransactionsRecordReference);

                                  firestoreBatch.update(
                                      _model.transactionCreated!.reference,
                                      createUserTransactionsRecordData(
                                        transactionsCodeRef: functions
                                            .removeUserTransactionsREF(_model
                                                .transactionCreated!
                                                .reference
                                                .id),
                                        transactionID: _model
                                            .transactionCreated?.reference,
                                      ));

                                  firestoreBatch.update(
                                      _model.transactionCreated!.reference,
                                      createUserTransactionsRecordData(
                                        transactionID: _model
                                            .transactionCreated?.reference,
                                      ));
                                  Navigator.pop(context);

                                  context.goNamed(
                                    'makePayment',
                                    queryParameters: {
                                      'transactionRef': serializeParam(
                                        _model.transactionCreated?.reference,
                                        ParamType.DocumentReference,
                                      ),
                                    }.withoutNulls,
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 0),
                                      ),
                                    },
                                  );
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
                ].addToEnd(SizedBox(height: 80.0)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
