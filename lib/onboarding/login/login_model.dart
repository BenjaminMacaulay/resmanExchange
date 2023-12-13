import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/components/customized_button_for_app_widget.dart';
import '/components/loading_screen_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
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

  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordControllerValidator;
  String? _passwordControllerValidator(BuildContext context, String? val) {
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

  // Model for customizedButtonForApp component.
  late CustomizedButtonForAppModel customizedButtonForAppModel;
  // Stores action output result for [Custom Action - checkInternetConnection] action in customizedButtonForApp widget.
  bool? internet11;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    emailControllerValidator = _emailControllerValidator;
    passwordVisibility = false;
    passwordControllerValidator = _passwordControllerValidator;
    customizedButtonForAppModel =
        createModel(context, () => CustomizedButtonForAppModel());
  }

  void dispose() {
    unfocusNode.dispose();
    emailFocusNode?.dispose();
    emailController?.dispose();

    passwordFocusNode?.dispose();
    passwordController?.dispose();

    customizedButtonForAppModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
