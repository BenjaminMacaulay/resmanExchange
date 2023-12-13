import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'button_numberfor_pin_model.dart';
export 'button_numberfor_pin_model.dart';

class ButtonNumberforPinWidget extends StatefulWidget {
  const ButtonNumberforPinWidget({
    Key? key,
    String? number,
  })  : this.number = number ?? '0',
        super(key: key);

  final String number;

  @override
  _ButtonNumberforPinWidgetState createState() =>
      _ButtonNumberforPinWidgetState();
}

class _ButtonNumberforPinWidgetState extends State<ButtonNumberforPinWidget> {
  late ButtonNumberforPinModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ButtonNumberforPinModel());

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

    return FFButtonWidget(
      onPressed: () async {
        setState(() {
          _model.tapped = true;
        });
        HapticFeedback.lightImpact();
        await Future.delayed(const Duration(milliseconds: 500));
        setState(() {
          _model.tapped = false;
        });
        if ((FFAppState().pincodeFieldOne == null ||
                FFAppState().pincodeFieldOne == '') &&
            (FFAppState().pincodeFieldTwo == null ||
                FFAppState().pincodeFieldTwo == '') &&
            (FFAppState().pincodeFieldThree == null ||
                FFAppState().pincodeFieldThree == '') &&
            (FFAppState().pincodeFieldFour == null ||
                FFAppState().pincodeFieldFour == '') &&
            (FFAppState().pincodeFieldFive == null ||
                FFAppState().pincodeFieldFive == '')) {
          setState(() {
            FFAppState().pincodeFieldOne = widget.number;
          });
        } else if ((FFAppState().pincodeFieldOne != null &&
                FFAppState().pincodeFieldOne != '') &&
            (FFAppState().pincodeFieldTwo == null ||
                FFAppState().pincodeFieldTwo == '') &&
            (FFAppState().pincodeFieldThree == null ||
                FFAppState().pincodeFieldThree == '') &&
            (FFAppState().pincodeFieldFour == null ||
                FFAppState().pincodeFieldFour == '') &&
            (FFAppState().pincodeFieldFive == null ||
                FFAppState().pincodeFieldFive == '')) {
          setState(() {
            FFAppState().pincodeFieldTwo = widget.number;
          });
        } else if ((FFAppState().pincodeFieldOne != null &&
                FFAppState().pincodeFieldOne != '') &&
            (FFAppState().pincodeFieldTwo != null &&
                FFAppState().pincodeFieldTwo != '') &&
            (FFAppState().pincodeFieldThree == null ||
                FFAppState().pincodeFieldThree == '') &&
            (FFAppState().pincodeFieldFour == null ||
                FFAppState().pincodeFieldFour == '') &&
            (FFAppState().pincodeFieldFive == null ||
                FFAppState().pincodeFieldFive == '')) {
          setState(() {
            FFAppState().pincodeFieldThree = widget.number;
          });
        } else if ((FFAppState().pincodeFieldOne != null &&
                FFAppState().pincodeFieldOne != '') &&
            (FFAppState().pincodeFieldTwo != null &&
                FFAppState().pincodeFieldTwo != '') &&
            (FFAppState().pincodeFieldThree != null &&
                FFAppState().pincodeFieldThree != '') &&
            (FFAppState().pincodeFieldFour == null ||
                FFAppState().pincodeFieldFour == '') &&
            (FFAppState().pincodeFieldFive == null ||
                FFAppState().pincodeFieldFive == '')) {
          setState(() {
            FFAppState().pincodeFieldFour = widget.number;
          });
        } else if ((FFAppState().pincodeFieldOne != null &&
                FFAppState().pincodeFieldOne != '') &&
            (FFAppState().pincodeFieldTwo != null &&
                FFAppState().pincodeFieldTwo != '') &&
            (FFAppState().pincodeFieldThree != null &&
                FFAppState().pincodeFieldThree != '') &&
            (FFAppState().pincodeFieldFour != null &&
                FFAppState().pincodeFieldFour != '') &&
            (FFAppState().pincodeFieldFive == null ||
                FFAppState().pincodeFieldFive == '')) {
          setState(() {
            FFAppState().pincodeFieldFive = widget.number;
          });
        }
      },
      text: valueOrDefault<String>(
        widget.number,
        '0',
      ),
      options: FFButtonOptions(
        height: 50.0,
        padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        color: _model.tapped
            ? FlutterFlowTheme.of(context).primary
            : Colors.transparent,
        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
              fontFamily: 'Oxygen',
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.w900,
            ),
        elevation: 0.0,
        borderSide: BorderSide(
          color: Colors.transparent,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(8.0),
        hoverColor: FlutterFlowTheme.of(context).primary,
        hoverElevation: 1.0,
      ),
    );
  }
}
