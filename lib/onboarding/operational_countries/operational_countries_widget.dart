import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/back_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'operational_countries_model.dart';
export 'operational_countries_model.dart';

class OperationalCountriesWidget extends StatefulWidget {
  const OperationalCountriesWidget({Key? key}) : super(key: key);

  @override
  _OperationalCountriesWidgetState createState() =>
      _OperationalCountriesWidgetState();
}

class _OperationalCountriesWidgetState
    extends State<OperationalCountriesWidget> {
  late OperationalCountriesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OperationalCountriesModel());

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
                    pageName: 'Choose your country',
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
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 12.0, 0.0),
                                    child: RichText(
                                      textScaleFactor: MediaQuery.of(context)
                                          .textScaleFactor,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text:
                                                'We are fully operational in the following countries.',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Oxygen',
                                                  color: Color(0xFF8D8B92),
                                                  fontSize: 13.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          )
                                        ],
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Oxygen',
                                              fontSize: 13.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ].divide(SizedBox(height: 12.0)),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 25.0, 0.0, 0.0),
                          child: FutureBuilder<List<CountriesCurrencyRecord>>(
                            future: queryCountriesCurrencyRecordOnce(
                              queryBuilder: (countriesCurrencyRecord) =>
                                  countriesCurrencyRecord
                                      .where(
                                        'accepted',
                                        isEqualTo: true,
                                      )
                                      .orderBy('CreatedDate', descending: true),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 40.0,
                                    height: 40.0,
                                    child: SpinKitDoubleBounce(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 40.0,
                                    ),
                                  ),
                                );
                              }
                              List<CountriesCurrencyRecord>
                                  countriesCountriesCurrencyRecordList =
                                  snapshot.data!;
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                children: List.generate(
                                    countriesCountriesCurrencyRecordList.length,
                                    (countriesIndex) {
                                  final countriesCountriesCurrencyRecord =
                                      countriesCountriesCurrencyRecordList[
                                          countriesIndex];
                                  return Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            setState(() {
                                              FFAppState()
                                                  .updateCountrySelectedStruct(
                                                (e) => e
                                                  ..countryName =
                                                      countriesCountriesCurrencyRecord
                                                          .countryCurrency
                                                          .countryName
                                                  ..currencyCode =
                                                      countriesCountriesCurrencyRecord
                                                          .countryCurrency
                                                          .currencyCode
                                                  ..countryFlag =
                                                      countriesCountriesCurrencyRecord
                                                          .countryCurrency
                                                          .countryFlag
                                                  ..blurHash =
                                                      countriesCountriesCurrencyRecord
                                                          .countryCurrency
                                                          .blurHash
                                                  ..currencyRef =
                                                      countriesCountriesCurrencyRecord
                                                          .reference
                                                  ..rateBuy = FFAppState()
                                                      .countrySelected
                                                      .rateBuy
                                                  ..rateSell = FFAppState()
                                                      .countrySelected
                                                      .rateBuy,
                                              );
                                              FFAppState()
                                                  .updateCountryCurrencyTradeSellStruct(
                                                (e) => e
                                                  ..countryName =
                                                      countriesCountriesCurrencyRecord
                                                          .countryCurrency
                                                          .countryName
                                                  ..currencyCode =
                                                      countriesCountriesCurrencyRecord
                                                          .countryCurrency
                                                          .currencyCode
                                                  ..countryFlag =
                                                      countriesCountriesCurrencyRecord
                                                          .countryCurrency
                                                          .countryFlag
                                                  ..blurHash =
                                                      countriesCountriesCurrencyRecord
                                                          .countryCurrency
                                                          .blurHash
                                                  ..currencyRef =
                                                      countriesCountriesCurrencyRecord
                                                          .reference
                                                  ..rateBuy = FFAppState()
                                                      .countrySelected
                                                      .rateBuy
                                                  ..rateSell = FFAppState()
                                                      .countrySelected
                                                      .rateSell,
                                              );
                                            });
                                          },
                                          child: Container(
                                            width: 100.0,
                                            height: 45.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              border: Border.all(
                                                color: FFAppState()
                                                            .countrySelected
                                                            .currencyRef ==
                                                        countriesCountriesCurrencyRecord
                                                            .reference
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .secondary
                                                    : Colors.transparent,
                                                width: 1.0,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      13.0, 0.0, 13.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Image.network(
                                                        valueOrDefault<String>(
                                                          countriesCountriesCurrencyRecord
                                                              .countryCurrency
                                                              .countryFlag,
                                                          'https://th.bing.com/th/id/R.c000a1bab050a3b54c43336bf761414c?rik=IToiarYHoKjNiQ&pid=ImgRaw&r=0',
                                                        ),
                                                        width: 18.0,
                                                        height: 12.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 12.0)),
                                                  ),
                                                  Text(
                                                    countriesCountriesCurrencyRecord
                                                        .countryCurrency
                                                        .countryName,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Oxygen',
                                                          fontSize: 14.0,
                                                        ),
                                                  ),
                                                ].divide(SizedBox(width: 8.0)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                }).divide(SizedBox(height: 12.0)),
                              );
                            },
                          ),
                        ),
                      ].addToEnd(SizedBox(height: 120.0)),
                    ),
                  ),
                ),
              ),
              if (FFAppState().countrySelected.countryName != null &&
                  FFAppState().countrySelected.countryName != '')
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(22.0, 0.0, 22.0, 70.0),
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
                            context.pushNamed(
                              'signup',
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
                                        color: Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Colors.white
                                            : Colors.white,
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
  }
}
