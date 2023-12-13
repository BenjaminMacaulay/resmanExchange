import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/back_component_widget.dart';
import '/components/dropdown_bank_select_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'add_a_new_bank_n_g_n_copy_widget.dart' show AddANewBankNGNCopyWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AddANewBankNGNCopyModel
    extends FlutterFlowModel<AddANewBankNGNCopyWidget> {
  ///  Local state fields for this page.

  String accountName = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for AccountNumber widget.
  FocusNode? accountNumberFocusNode;
  TextEditingController? accountNumberController;
  String? Function(BuildContext, String?)? accountNumberControllerValidator;
  // State field(s) for EnterAccountName widget.
  FocusNode? enterAccountNameFocusNode;
  TextEditingController? enterAccountNameController;
  String? Function(BuildContext, String?)? enterAccountNameControllerValidator;
  // Model for backComponent component.
  late BackComponentModel backComponentModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    backComponentModel = createModel(context, () => BackComponentModel());
  }

  void dispose() {
    unfocusNode.dispose();
    accountNumberFocusNode?.dispose();
    accountNumberController?.dispose();

    enterAccountNameFocusNode?.dispose();
    enterAccountNameController?.dispose();

    backComponentModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
