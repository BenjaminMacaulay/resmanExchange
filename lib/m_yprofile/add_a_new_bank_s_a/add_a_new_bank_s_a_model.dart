import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/back_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'add_a_new_bank_s_a_widget.dart' show AddANewBankSAWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddANewBankSAModel extends FlutterFlowModel<AddANewBankSAWidget> {
  ///  Local state fields for this page.

  String accountName = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for EnterBankName widget.
  FocusNode? enterBankNameFocusNode;
  TextEditingController? enterBankNameController;
  String? Function(BuildContext, String?)? enterBankNameControllerValidator;
  // State field(s) for EnterAccountNumber widget.
  FocusNode? enterAccountNumberFocusNode;
  TextEditingController? enterAccountNumberController;
  String? Function(BuildContext, String?)?
      enterAccountNumberControllerValidator;
  // State field(s) for EnterBranchCode widget.
  FocusNode? enterBranchCodeFocusNode;
  TextEditingController? enterBranchCodeController;
  String? Function(BuildContext, String?)? enterBranchCodeControllerValidator;
  // State field(s) for EnterAccountName widget.
  FocusNode? enterAccountNameFocusNode;
  TextEditingController? enterAccountNameController;
  String? Function(BuildContext, String?)? enterAccountNameControllerValidator;
  // State field(s) for pinCode widget.
  FocusNode? pinCodeFocusNode;
  TextEditingController? pinCodeController;
  late bool pinCodeVisibility;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // Stores action output result for [Backend Call - Create Document] action in buy widget.
  BankDetailsRecord? bankAdded;
  // Model for backComponent component.
  late BackComponentModel backComponentModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    pinCodeVisibility = false;
    backComponentModel = createModel(context, () => BackComponentModel());
  }

  void dispose() {
    unfocusNode.dispose();
    enterBankNameFocusNode?.dispose();
    enterBankNameController?.dispose();

    enterAccountNumberFocusNode?.dispose();
    enterAccountNumberController?.dispose();

    enterBranchCodeFocusNode?.dispose();
    enterBranchCodeController?.dispose();

    enterAccountNameFocusNode?.dispose();
    enterAccountNameController?.dispose();

    pinCodeFocusNode?.dispose();
    pinCodeController?.dispose();

    backComponentModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
