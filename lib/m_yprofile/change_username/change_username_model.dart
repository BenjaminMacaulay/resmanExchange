import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/animation_loader_skeleton_widget.dart';
import '/components/back_component_widget.dart';
import '/components/error_screen_widget.dart';
import '/components/loading_screen_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'change_username_widget.dart' show ChangeUsernameWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ChangeUsernameModel extends FlutterFlowModel<ChangeUsernameWidget> {
  ///  Local state fields for this page.

  bool updated = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Custom Action - checkInternetConnection] action in buy widget.
  bool? internet11ghhjcsfmkdvjkv;
  // Model for backComponent component.
  late BackComponentModel backComponentModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    backComponentModel = createModel(context, () => BackComponentModel());
  }

  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    backComponentModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
