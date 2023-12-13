import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'individual_crypto_buy_or_sell_model.dart';
export 'individual_crypto_buy_or_sell_model.dart';

class IndividualCryptoBuyOrSellWidget extends StatefulWidget {
  const IndividualCryptoBuyOrSellWidget({
    Key? key,
    required this.crypto,
    required this.action,
  }) : super(key: key);

  final CryptocurrenciesCollectionRecord? crypto;
  final Future<dynamic> Function()? action;

  @override
  _IndividualCryptoBuyOrSellWidgetState createState() =>
      _IndividualCryptoBuyOrSellWidgetState();
}

class _IndividualCryptoBuyOrSellWidgetState
    extends State<IndividualCryptoBuyOrSellWidget> {
  late IndividualCryptoBuyOrSellModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IndividualCryptoBuyOrSellModel());

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
                _model.showColor = true;
              });
              await widget.action?.call();
            },
            child: Container(
              width: 100.0,
              decoration: BoxDecoration(
                color: _model.showColor
                    ? FlutterFlowTheme.of(context).secondaryBackground
                    : Colors.transparent,
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(23.0, 8.0, 23.0, 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 35.0,
                      height: 35.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.network(
                            widget.crypto!.imageCoin,
                          ).image,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            valueOrDefault<String>(
                              widget.crypto?.symbol,
                              'BTC',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Oxygen',
                                  color: Color(0xFF8D8B92),
                                  fontSize: 12.0,
                                ),
                          ),
                          Text(
                            valueOrDefault<String>(
                              widget.crypto?.name,
                              'BItcoin',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Oxygen',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
