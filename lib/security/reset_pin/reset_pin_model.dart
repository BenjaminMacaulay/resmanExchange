import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/back_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'reset_pin_widget.dart' show ResetPinWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ResetPinModel extends FlutterFlowModel<ResetPinWidget> {
  ///  Local state fields for this page.

  String otpChoice = 'Email';

  String code = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for NewPin widget.
  FocusNode? newPinFocusNode;
  TextEditingController? newPinController;
  late bool newPinVisibility;
  String? Function(BuildContext, String?)? newPinControllerValidator;
  String? _newPinControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 4) {
      return 'Your Transaction pin requires 4 characters.';
    }

    return null;
  }

  // State field(s) for CurrentNewPin widget.
  FocusNode? currentNewPinFocusNode;
  TextEditingController? currentNewPinController;
  late bool currentNewPinVisibility;
  String? Function(BuildContext, String?)? currentNewPinControllerValidator;
  String? _currentNewPinControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 4) {
      return 'Your Transaction pin requires 4 characters.';
    }

    return null;
  }

  // Stores action output result for [Backend Call - Create Document] action in buy widget.
  VerificationCodesRecord? codeFound;
  // Model for backComponent component.
  late BackComponentModel backComponentModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    newPinVisibility = false;
    newPinControllerValidator = _newPinControllerValidator;
    currentNewPinVisibility = false;
    currentNewPinControllerValidator = _currentNewPinControllerValidator;
    backComponentModel = createModel(context, () => BackComponentModel());
  }

  void dispose() {
    unfocusNode.dispose();
    newPinFocusNode?.dispose();
    newPinController?.dispose();

    currentNewPinFocusNode?.dispose();
    currentNewPinController?.dispose();

    backComponentModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
