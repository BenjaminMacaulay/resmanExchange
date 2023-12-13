import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/back_component_widget.dart';
import '/components/loading_screen_widget.dart';
import '/components/reset_pin_time_for_spam_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:pin_code_fields/pin_code_fields.dart';
import 'phone_code_widget.dart' show PhoneCodeWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class PhoneCodeModel extends FlutterFlowModel<PhoneCodeWidget> {
  ///  Local state fields for this page.

  String code3 = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;
  String? _pinCodeControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }
    if (val.length < 5) {
      return 'Requires 5 characters.';
    }
    return null;
  }

  // Model for ResetPinTimeForSpam component.
  late ResetPinTimeForSpamModel resetPinTimeForSpamModel;
  // Model for backComponent component.
  late BackComponentModel backComponentModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
    pinCodeControllerValidator = _pinCodeControllerValidator;
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
