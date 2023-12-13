import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'not_available_model.dart';
export 'not_available_model.dart';

class NotAvailableWidget extends StatefulWidget {
  const NotAvailableWidget({Key? key}) : super(key: key);

  @override
  _NotAvailableWidgetState createState() => _NotAvailableWidgetState();
}

class _NotAvailableWidgetState extends State<NotAvailableWidget> {
  late NotAvailableModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotAvailableModel());

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

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.desktop_access_disabled_sharp,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 350.0,
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Linkup.ng is not available on desktop devices',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Oxygen',
                      color: Colors.black,
                      fontSize: 24.0,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
