import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_list_all_model.dart';
export 'empty_list_all_model.dart';

class EmptyListAllWidget extends StatefulWidget {
  const EmptyListAllWidget({
    Key? key,
    this.notificationNote,
  }) : super(key: key);

  final String? notificationNote;

  @override
  _EmptyListAllWidgetState createState() => _EmptyListAllWidgetState();
}

class _EmptyListAllWidgetState extends State<EmptyListAllWidget> {
  late EmptyListAllModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyListAllModel());

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

    return Align(
      alignment: AlignmentDirectional(0.00, 0.00),
      child: Container(
        width: 300.0,
        height: 300.0,
        decoration: BoxDecoration(
          color: Color(0x002D2D2D),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              valueOrDefault<String>(
                widget.notificationNote,
                'This list is empty',
              ),
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Oxygen',
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ].divide(SizedBox(height: 23.0)),
        ),
      ),
    );
  }
}
