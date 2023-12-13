import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'currency_switch_trades_model.dart';
export 'currency_switch_trades_model.dart';

class CurrencySwitchTradesWidget extends StatefulWidget {
  const CurrencySwitchTradesWidget({Key? key}) : super(key: key);

  @override
  _CurrencySwitchTradesWidgetState createState() =>
      _CurrencySwitchTradesWidgetState();
}

class _CurrencySwitchTradesWidgetState
    extends State<CurrencySwitchTradesWidget> {
  late CurrencySwitchTradesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CurrencySwitchTradesModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        context.pushNamed(
          'CurrenciesAvailableForTrade',
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
        width: 80.0,
        height: 35.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).secondary,
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(9.0, 6.0, 9.0, 6.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AuthUserStreamWidget(
                builder: (context) => Text(
                  (valueOrDefault<bool>(currentUserDocument?.setCurrencyToTrade,
                                  false) !=
                              null) &&
                          valueOrDefault<bool>(
                              currentUserDocument?.setCurrencyToTrade, false) &&
                          (currentUserDocument?.countryCurrency?.currencyCode !=
                              FFAppState()
                                  .countryCurrencyTradeSell
                                  .currencyCode)
                      ? valueOrDefault<String>(
                          FFAppState().countryCurrencyTradeSell.currencyCode,
                          'NGN',
                        )
                      : valueOrDefault<String>(
                          currentUserDocument?.countryCurrency?.currencyCode,
                          'NGN',
                        ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Oxygen',
                        fontSize: 13.0,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
              Icon(
                Icons.compare_arrows_outlined,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
