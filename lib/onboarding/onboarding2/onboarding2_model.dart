import '/components/not_available_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'onboarding2_widget.dart' show Onboarding2Widget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Onboarding2Model extends FlutterFlowModel<Onboarding2Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for NotAvailable component.
  late NotAvailableModel notAvailableModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    notAvailableModel = createModel(context, () => NotAvailableModel());
  }

  void dispose() {
    unfocusNode.dispose();
    notAvailableModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
