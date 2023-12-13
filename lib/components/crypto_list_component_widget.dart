import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'crypto_list_component_model.dart';
export 'crypto_list_component_model.dart';

class CryptoListComponentWidget extends StatefulWidget {
  const CryptoListComponentWidget({
    Key? key,
    this.cryptoDocument,
    required this.navigatingWhere,
  }) : super(key: key);

  final CryptocurrenciesCollectionRecord? cryptoDocument;
  final Future<dynamic> Function()? navigatingWhere;

  @override
  _CryptoListComponentWidgetState createState() =>
      _CryptoListComponentWidgetState();
}

class _CryptoListComponentWidgetState extends State<CryptoListComponentWidget> {
  late CryptoListComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CryptoListComponentModel());

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
        setState(() {
          FFAppState().cryptoChosen = CryptoNameStruct(
            name: widget.cryptoDocument?.name,
            cryptoChosenRef: widget.cryptoDocument?.reference,
            imageCoin: widget.cryptoDocument?.imageCoin,
            symbol: widget.cryptoDocument?.symbol,
          );
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              '1',
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
                fontSize: 14.0,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).secondary,
          ),
        );
        await widget.navigatingWhere?.call();
      },
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
                    widget.cryptoDocument?.imageCoin,
                    'https://firebasestorage.googleapis.com/v0/b/rexmanexchange-204ac.appspot.com/o/coins%2FCoin.png?alt=media&token=52e60049-496a-4eee-adc5-3419e1a4230a&_gl=1*16m65j0*_ga*MTc4NDAwMTYwMy4xNjgzMDU3MjU1*_ga_CW55HF8NVT*MTY5NzQ0MTkzNi4yMDEuMS4xNjk3NDQyMzc2LjE1LjAuMA..',
                  ),
                ).image,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  valueOrDefault<String>(
                    widget.cryptoDocument?.symbol,
                    'symbol',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Oxygen',
                        color: Color(0xFF8D8B92),
                        fontSize: 12.0,
                      ),
                ),
                Text(
                  valueOrDefault<String>(
                    widget.cryptoDocument?.name,
                    'name',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Oxygen',
                        color: Colors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
