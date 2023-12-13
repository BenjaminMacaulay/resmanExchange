import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'selectcurrency_bottom_sheet_model.dart';
export 'selectcurrency_bottom_sheet_model.dart';

class SelectcurrencyBottomSheetWidget extends StatefulWidget {
  const SelectcurrencyBottomSheetWidget({Key? key}) : super(key: key);

  @override
  _SelectcurrencyBottomSheetWidgetState createState() =>
      _SelectcurrencyBottomSheetWidgetState();
}

class _SelectcurrencyBottomSheetWidgetState
    extends State<SelectcurrencyBottomSheetWidget> {
  late SelectcurrencyBottomSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectcurrencyBottomSheetModel());

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

    return Container();
  }
}
