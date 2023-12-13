import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/animation_loader_skeleton_widget.dart';
import '/components/error_screen_widget.dart';
import '/components/loading_screen_widget.dart';
import '/components/rules_sign_up_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'signup_widget.dart' show SignupWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class SignupModel extends FlutterFlowModel<SignupWidget> {
  ///  Local state fields for this page.

  String code = '';

  bool? verificationSent = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for userName widget.
  FocusNode? userNameFocusNode;
  TextEditingController? userNameController;
  String? Function(BuildContext, String?)? userNameControllerValidator;
  String? _userNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'A username is required';
    }

    if (!RegExp('').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  String? _emailControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'An email is required';
    }

    if (!RegExp('^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}\$')
        .hasMatch(val)) {
      return 'invalid email format';
    }
    return null;
  }

  // State field(s) for password1 widget.
  FocusNode? password1FocusNode;
  TextEditingController? password1Controller;
  late bool password1Visibility;
  String? Function(BuildContext, String?)? password1ControllerValidator;
  String? _password1ControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'A password is required';
    }

    if (!RegExp(
            '^(?=.*[!@#\$%^&*()_+[\\]{};\':\"\\\\|,.<>/?])(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{5,}\$')
        .hasMatch(val)) {
      return 'Password must be at least 5 characters.\nInclude 1 uppercase letter (A-Z).\nAdd 1 lowercase letter (a-z).\nUse 1 number (0-9).\nInclude 1 special character ';
    }
    return null;
  }

  // Stores action output result for [Custom Action - checkInternetConnection] action in buy widget.
  bool? internet11ghhj;
  // Stores action output result for [Backend Call - Create Document] action in buy widget.
  VerificationCodesRecord? verificationCodeCopy;
  // Model for rulesSignUp component.
  late RulesSignUpModel rulesSignUpModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    userNameControllerValidator = _userNameControllerValidator;
    emailControllerValidator = _emailControllerValidator;
    password1Visibility = false;
    password1ControllerValidator = _password1ControllerValidator;
    rulesSignUpModel = createModel(context, () => RulesSignUpModel());
  }

  void dispose() {
    unfocusNode.dispose();
    userNameFocusNode?.dispose();
    userNameController?.dispose();

    emailFocusNode?.dispose();
    emailController?.dispose();

    password1FocusNode?.dispose();
    password1Controller?.dispose();

    rulesSignUpModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
