import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'no_transactions_empty_list_model.dart';
export 'no_transactions_empty_list_model.dart';

class NoTransactionsEmptyListWidget extends StatefulWidget {
  const NoTransactionsEmptyListWidget({Key? key}) : super(key: key);

  @override
  _NoTransactionsEmptyListWidgetState createState() =>
      _NoTransactionsEmptyListWidgetState();
}

class _NoTransactionsEmptyListWidgetState
    extends State<NoTransactionsEmptyListWidget> {
  late NoTransactionsEmptyListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoTransactionsEmptyListModel());

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

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          width: 56.0,
          height: 56.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            image: DecorationImage(
              fit: BoxFit.contain,
              image: Image.asset(
                'assets/images/No_transaction_icon.png',
              ).image,
            ),
            shape: BoxShape.circle,
          ),
        ),
        Text(
          'No transactions yet',
          textAlign: TextAlign.center,
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Oxygen',
                fontSize: 13.0,
                fontWeight: FontWeight.w500,
              ),
        ),
      ].divide(SizedBox(height: 23.0)),
    );
  }
}
