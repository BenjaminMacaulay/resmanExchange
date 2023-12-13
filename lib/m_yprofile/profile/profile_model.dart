import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/dark_light_switch_small_widget.dart';
import '/components/log_out_widget.dart';
import '/components/navbar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'profile_widget.dart' show ProfileWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ProfileModel extends FlutterFlowModel<ProfileWidget> {
  ///  Local state fields for this page.

  VerificationUserSessionRecord? verificationDocumment;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for DarkLightSwitchSmall component.
  late DarkLightSwitchSmallModel darkLightSwitchSmallModel;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  VerificationUserSessionRecord? verificationUserSession;
  // Model for NAVBAR component.
  late NavbarModel navbarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    darkLightSwitchSmallModel =
        createModel(context, () => DarkLightSwitchSmallModel());
    navbarModel = createModel(context, () => NavbarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    darkLightSwitchSmallModel.dispose();
    navbarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
