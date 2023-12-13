import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'back_component_model.dart';
export 'back_component_model.dart';

class BackComponentWidget extends StatefulWidget {
  const BackComponentWidget({
    Key? key,
    required this.pageName,
    required this.action,
    bool? actionSet,
  })  : this.actionSet = actionSet ?? false,
        super(key: key);

  final String? pageName;
  final Future<dynamic> Function()? action;
  final bool actionSet;

  @override
  _BackComponentWidgetState createState() => _BackComponentWidgetState();
}

class _BackComponentWidgetState extends State<BackComponentWidget> {
  late BackComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BackComponentModel());

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
            if (widget.actionSet) {
              await widget.action?.call();
            } else {
              context.safePop();
            }
          },
        ),
        Text(
          widget.pageName!,
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Work Sans',
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
              ),
        ),
      ].divide(SizedBox(width: 20.0)),
    );
  }
}
