import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'single_pin_field_model.dart';
export 'single_pin_field_model.dart';

class SinglePinFieldWidget extends StatefulWidget {
  const SinglePinFieldWidget({
    Key? key,
    required this.pinString,
  }) : super(key: key);

  final String? pinString;

  @override
  _SinglePinFieldWidgetState createState() => _SinglePinFieldWidgetState();
}

class _SinglePinFieldWidgetState extends State<SinglePinFieldWidget> {
  late SinglePinFieldModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SinglePinFieldModel());

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
      width: 15.0,
      height: 15.0,
      decoration: BoxDecoration(
        color: widget.pinString != null && widget.pinString != ''
            ? FlutterFlowTheme.of(context).primary
            : Colors.white,
        shape: BoxShape.circle,
      ),
    );
  }
}
