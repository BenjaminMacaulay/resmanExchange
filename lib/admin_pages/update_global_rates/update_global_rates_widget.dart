import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'update_global_rates_model.dart';
export 'update_global_rates_model.dart';

class UpdateGlobalRatesWidget extends StatefulWidget {
  const UpdateGlobalRatesWidget({Key? key}) : super(key: key);

  @override
  _UpdateGlobalRatesWidgetState createState() =>
      _UpdateGlobalRatesWidgetState();
}

class _UpdateGlobalRatesWidgetState extends State<UpdateGlobalRatesWidget> {
  late UpdateGlobalRatesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UpdateGlobalRatesModel());

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
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Update global rates',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Oxygen',
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ].divide(SizedBox(width: 11.0)),
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 25.0, 0.0, 0.0),
                          child: StreamBuilder<List<CountriesCurrencyRecord>>(
                            stream: queryCountriesCurrencyRecord(
                              queryBuilder: (countriesCurrencyRecord) =>
                                  countriesCurrencyRecord.orderBy('CreatedDate',
                                      descending: true),
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
                                            context.pushNamed(
                                              'updateRate',
                                              queryParameters: {
                                                'country': serializeParam(
                                                  countriesCountriesCurrencyRecord
                                                      .countryCurrency
                                                      .currencyCode,
                                                  ParamType.String,
                                                ),
                                                'countyToUpdate':
                                                    serializeParam(
                                                  countriesCountriesCurrencyRecord
                                                      .reference,
                                                  ParamType.DocumentReference,
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
            ],
          ),
        ),
      ),
    );
  }
}
