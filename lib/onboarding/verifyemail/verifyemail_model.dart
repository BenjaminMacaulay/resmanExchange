import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/back_component_widget.dart';
import '/components/error_screen_widget.dart';
import '/components/loading_screen_widget.dart';
import '/components/reset_pin_time_for_spam_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:pin_code_fields/pin_code_fields.dart';
import 'verifyemail_widget.dart' show VerifyemailWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class VerifyemailModel extends FlutterFlowModel<VerifyemailWidget> {
  ///  Local state fields for this page.

  bool active = false;

  String? code = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;
  // Model for ResetPinTimeForSpam component.
  late ResetPinTimeForSpamModel resetPinTimeForSpamModel;
  // Stores action output result for [Custom Action - checkInternetConnection] action in buy widget.
  bool? internet11Copy3455;
  // Model for backComponent component.
  late BackComponentModel backComponentModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
    resetPinTimeForSpamModel =
        createModel(context, () => ResetPinTimeForSpamModel());
    backComponentModel = createModel(context, () => BackComponentModel());
  }

  void dispose() {
    unfocusNode.dispose();
    pinCodeController?.dispose();
    resetPinTimeForSpamModel.dispose();
    backComponentModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
