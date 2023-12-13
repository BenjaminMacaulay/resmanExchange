import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/individual_crypto_buy_or_sell_widget.dart';
import '/components/loading_screen_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'select_coin_model.dart';
export 'select_coin_model.dart';

class SelectCoinWidget extends StatefulWidget {
  const SelectCoinWidget({Key? key}) : super(key: key);

  @override
  _SelectCoinWidgetState createState() => _SelectCoinWidgetState();
}

class _SelectCoinWidgetState extends State<SelectCoinWidget> {
  late SelectCoinModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectCoinModel());

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
            selectCoinCryptocurrenciesCollectionRecordList = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FlutterFlowIconButton(
                          borderColor: Color(0x00FC561C),
                          borderRadius: 8.0,
                          borderWidth: 1.0,
                          buttonSize: 40.0,
                          fillColor: Color(0x004B39EF),
                          icon: Icon(
                            FFIcons.kcombinedShape,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 15.0,
                          ),
                          onPressed: () async {
                            context.safePop();
                          },
                        ),
                        Text(
                          'Select prefered coin',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Oxygen',
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ].divide(SizedBox(width: 20.0)),
                    ),
                  ),
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
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.textController',
                                      Duration(milliseconds: 10),
                                      () => setState(() {}),
                                    ),
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: ' ',
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
                                  ? selectCoinCryptocurrenciesCollectionRecordList
                                      .where((e) =>
                                          functions.fuzzySearchFunction(
                                              _model.textController.text,
                                              e.name) ||
                                          functions.fuzzySearchFunction(
                                              e.symbol,
                                              _model.textController.text))
                                      .toList()
                                  : selectCoinCryptocurrenciesCollectionRecordList)
                              .toList();
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate(cryptoCurrencyLists.length,
                                (cryptoCurrencyListsIndex) {
                              final cryptoCurrencyListsItem =
                                  cryptoCurrencyLists[cryptoCurrencyListsIndex];
                              return IndividualCryptoBuyOrSellWidget(
                                key: Key(
                                    'Key9xh_${cryptoCurrencyListsIndex}_of_${cryptoCurrencyLists.length}'),
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
                                        onTap: () => _model
                                                .unfocusNode.canRequestFocus
                                            ? FocusScope.of(context)
                                                .requestFocus(
                                                    _model.unfocusNode)
                                            : FocusScope.of(context).unfocus(),
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: LoadingScreenWidget(
                                            action: () async {
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 15000));
                                              if (!_model.done) {
                                                Navigator.pop(context);
                                              }
                                            },
                                          ),
                                        ),
                                      ));
                                    },
                                  ).then((value) => safeSetState(() {}));

                                  _model.apiResultfba =
                                      await GetCryptoPricesCall.call(
                                    assestId: cryptoCurrencyListsItem.apiSymbol,
                                  );
                                  if ((_model.apiResultfba?.succeeded ??
                                      true)) {
                                    setState(() {
                                      FFAppState().cryptoChosen =
                                          CryptoNameStruct(
                                        name: cryptoCurrencyListsItem.name,
                                        cryptoChosenRef:
                                            cryptoCurrencyListsItem.reference,
                                        imageCoin:
                                            cryptoCurrencyListsItem.imageCoin,
                                        symbol: cryptoCurrencyListsItem.symbol,
                                      );
                                    });
                                    _model.currencies =
                                        await queryCountriesCurrencyRecordOnce();
                                    if (Navigator.of(context).canPop()) {
                                      context.pop();
                                    }
                                    context.pushNamed(
                                      'buyCryptoPage',
                                      queryParameters: {
                                        'price': serializeParam(
                                          functions.stringToDouble(
                                              GetCryptoPricesCall.priceUsd(
                                            (_model.apiResultfba?.jsonBody ??
                                                ''),
                                          ).toString()),
                                          ParamType.double,
                                        ),
                                        'currentRateBuy': serializeParam(
                                          valueOrDefault<double>(
                                            _model.currencies
                                                ?.where((e) =>
                                                    e.countryCurrency
                                                        .currencyCode ==
                                                    currentUserDocument
                                                        ?.countryCurrency
                                                        ?.currencyCode)
                                                .toList()
                                                ?.first
                                                ?.countryCurrency
                                                ?.rateBuy,
                                            0.0,
                                          ),
                                          ParamType.double,
                                        ),
                                        'currencyCode': serializeParam(
                                          currentUserDocument
                                              ?.countryCurrency?.currencyCode,
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
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
                                    await action_blocks.internetChecker(
                                      context,
                                      message:
                                          'Error fetching market prices, please try again.',
                                    );
                                    setState(() {});
                                  }

                                  setState(() {});
                                },
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
