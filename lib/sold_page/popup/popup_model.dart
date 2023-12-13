import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/skeleton_loader_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'popup_widget.dart' show PopupWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PopupModel extends FlutterFlowModel<PopupWidget> {
  ///  Local state fields for this component.

  bool pinTime = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for pinCode widget.
  FocusNode? pinCodeFocusNode;
  TextEditingController? pinCodeController;
  late bool pinCodeVisibility;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    pinCodeVisibility = false;
  }

  void dispose() {
    pinCodeFocusNode?.dispose();
    pinCodeController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
