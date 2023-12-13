import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/back_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'change_address_widget.dart' show ChangeAddressWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChangeAddressModel extends FlutterFlowModel<ChangeAddressWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for address widget.
  FocusNode? addressFocusNode;
  TextEditingController? addressController;
  String? Function(BuildContext, String?)? addressControllerValidator;
  String? _addressControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // Model for backComponent component.
  late BackComponentModel backComponentModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    addressControllerValidator = _addressControllerValidator;
    backComponentModel = createModel(context, () => BackComponentModel());
  }

  void dispose() {
    unfocusNode.dispose();
    addressFocusNode?.dispose();
    addressController?.dispose();

    backComponentModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
