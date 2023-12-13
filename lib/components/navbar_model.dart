import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/update_app_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'navbar_widget.dart' show NavbarWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class NavbarModel extends FlutterFlowModel<NavbarWidget> {
  ///  Local state fields for this component.

  int? intrgerPage = 1;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - checkInternetConnection] action in NAVBAR widget.
  bool? internetCheck;
  // Stores action output result for [Firestore Query - Query a collection] action in NAVBAR widget.
  AppVersionNumberRecord? appVersionNumber;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
