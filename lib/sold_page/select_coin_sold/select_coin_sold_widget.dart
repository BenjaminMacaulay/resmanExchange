import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/back_component_widget.dart';
import '/components/individual_crypto_buy_or_sell_widget.dart';
import '/components/loading_screen_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'select_coin_sold_model.dart';
export 'select_coin_sold_model.dart';

class SelectCoinSoldWidget extends StatefulWidget {
  const SelectCoinSoldWidget({Key? key}) : super(key: key);

  @override
  _SelectCoinSoldWidgetState createState() => _SelectCoinSoldWidgetState();
}

class _SelectCoinSoldWidgetState extends State<SelectCoinSoldWidget> {
  late SelectCoinSoldModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectCoinSoldModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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

    return FutureBuilder<List<CryptocurrenciesCollectionRecord>>(
      future: queryCryptocurrenciesCollectionRecordOnce(
        queryBuilder: (cryptocurrenciesCollectionRecord) =>
            cryptocurrenciesCollectionRecord.orderBy('createdDate'),
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
        List<CryptocurrenciesCollectionRecord>
            selectCoinSoldCryptocurrenciesCollectionRecordList = snapshot.data!;
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
                        pageName: 'Which coin are you selling?',
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
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 25.0, 32.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Container(
                            height: 45.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      18.0, 0.0, 7.0, 0.0),
                                  child: FaIcon(
                                    FontAwesomeIcons.search,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 14.0,
                                  ),
                                ),
                                Expanded(
                                  child: TextFormField(
                                    controller: _model.textController,
                                    focusNode: _model.textFieldFocusNode,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: ' ',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium,
                                      hintText: 'search',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium,
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      focusedErrorBorder: InputBorder.none,
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 18.0),
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    validator: _model.textControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1.00, 0.00),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 28.0, 0.0, 0.0),
                      child: Builder(
                        builder: (context) {
                          final cryptoCurrencyLists = (_model
                                              .textController.text !=
                                          null &&
                                      _model.textController.text != ''
                                  ? selectCoinSoldCryptocurrenciesCollectionRecordList
                                      .where((e) =>
                                          (e.name ==
                                              _model.textController.text) ||
                                          (e.symbol ==
                                              _model.textController.text))
                                      .toList()
                                  : selectCoinSoldCryptocurrenciesCollectionRecordList)
                              .toList();
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate(cryptoCurrencyLists.length,
                                (cryptoCurrencyListsIndex) {
                              final cryptoCurrencyListsItem =
                                  cryptoCurrencyLists[cryptoCurrencyListsIndex];
                              return Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: IndividualCryptoBuyOrSellWidget(
                                      key: Key(
                                          'Key1ng_${cryptoCurrencyListsIndex}_of_${cryptoCurrencyLists.length}'),
                                      crypto: cryptoCurrencyListsItem,
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
                                                child: LoadingScreenWidget(
                                                  action: () async {
                                                    await Future.delayed(
                                                        const Duration(
                                                            milliseconds:
                                                                15000));
                                                    if (!_model.done) {
                                                      Navigator.pop(context);
                                                    }
                                                  },
                                                ),
                                              ),
                                            ));
                                          },
                                        ).then((value) => safeSetState(() {}));

                                        setState(() {
                                          FFAppState().cryptoChosen =
                                              CryptoNameStruct(
                                            name: cryptoCurrencyListsItem.name,
                                            cryptoChosenRef:
                                                cryptoCurrencyListsItem
                                                    .reference,
                                            imageCoin: cryptoCurrencyListsItem
                                                .imageCoin,
                                            symbol:
                                                cryptoCurrencyListsItem.symbol,
                                          );
                                        });
                                        _model.apiCryptoPrice =
                                            await GetCryptoPricesCall.call(
                                          assestId:
                                              cryptoCurrencyListsItem.apiSymbol,
                                        );
                                        if ((valueOrDefault<bool>(
                                                    currentUserDocument
                                                        ?.setCurrencyToTrade,
                                                    false) !=
                                                null) &&
                                            valueOrDefault<bool>(
                                                currentUserDocument
                                                    ?.setCurrencyToTrade,
                                                false)) {
                                          _model.queriedSell =
                                              await queryCountriesCurrencyRecordOnce(
                                            queryBuilder:
                                                (countriesCurrencyRecord) =>
                                                    countriesCurrencyRecord
                                                        .where(
                                              'countryCurrency.CurrencyCode',
                                              isEqualTo: FFAppState()
                                                  .countryCurrencyTradeSell
                                                  .currencyCode,
                                            ),
                                            singleRecord: true,
                                          ).then((s) => s.firstOrNull);
                                          setState(() {
                                            FFAppState()
                                                .updateCountryCurrencyTradeSellStruct(
                                              (e) => e
                                                ..rateBuy = _model.queriedSell
                                                    ?.countryCurrency?.rateBuy
                                                ..rateSell = _model.queriedSell
                                                    ?.countryCurrency?.rateSell,
                                            );
                                          });
                                          Navigator.pop(context);

                                          context.pushNamed(
                                            'Walletaddress',
                                            queryParameters: {
                                              'sellPrice': serializeParam(
                                                FFAppState()
                                                    .countryCurrencyTradeSell
                                                    .rateSell,
                                                ParamType.double,
                                              ),
                                              'cryptoRateCurrentPrice':
                                                  serializeParam(
                                                functions.stringToDouble(
                                                    GetCryptoPricesCall
                                                        .priceUsd(
                                                  (_model.apiCryptoPrice
                                                          ?.jsonBody ??
                                                      ''),
                                                ).toString()),
                                                ParamType.double,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType.fade,
                                                duration:
                                                    Duration(milliseconds: 0),
                                              ),
                                            },
                                          );
                                        } else {
                                          _model.readCurrentRate33 =
                                              await queryCountriesCurrencyRecordOnce(
                                            queryBuilder:
                                                (countriesCurrencyRecord) =>
                                                    countriesCurrencyRecord
                                                        .where(
                                              'countryCurrency.CurrencyCode',
                                              isEqualTo: currentUserDocument
                                                  ?.countryCurrency
                                                  ?.currencyCode,
                                            ),
                                            singleRecord: true,
                                          ).then((s) => s.firstOrNull);
                                          Navigator.pop(context);

                                          context.pushNamed(
                                            'Walletaddress',
                                            queryParameters: {
                                              'sellPrice': serializeParam(
                                                _model.readCurrentRate33
                                                    ?.countryCurrency?.rateSell,
                                                ParamType.double,
                                              ),
                                              'cryptoRateCurrentPrice':
                                                  serializeParam(
                                                functions.stringToDouble(
                                                    GetCryptoPricesCall
                                                        .priceUsd(
                                                  (_model.apiCryptoPrice
                                                          ?.jsonBody ??
                                                      ''),
                                                ).toString()),
                                                ParamType.double,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType.fade,
                                                duration:
                                                    Duration(milliseconds: 0),
                                              ),
                                            },
                                          );
                                        }

                                        setState(() {});
                                      },
                                    ),
                                  ),
                                ],
                              );
                            }).divide(SizedBox(height: 18.0)),
                          );
                        },
                      ),
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
