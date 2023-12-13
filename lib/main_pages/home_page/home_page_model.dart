import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/alert_skeleton_loader_widget.dart';
import '/components/all_users_transactions_components_widget.dart';
import '/components/chat_active_skeleton_loader_widget.dart';
import '/components/different_rates_widget.dart';
import '/components/navbar_widget.dart';
import '/components/skeleton_loader_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'home_page_widget.dart' show HomePageWidget;
import 'package:badges/badges.dart' as badges;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  bool notActive = false;

  String code = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for differentRates component.
  late DifferentRatesModel differentRatesModel;
  // Model for All_UsersTransactions_Components component.
  late AllUsersTransactionsComponentsModel allUsersTransactionsComponentsModel;
  // Model for NAVBAR component.
  late NavbarModel navbarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    differentRatesModel = createModel(context, () => DifferentRatesModel());
    allUsersTransactionsComponentsModel =
        createModel(context, () => AllUsersTransactionsComponentsModel());
    navbarModel = createModel(context, () => NavbarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    differentRatesModel.dispose();
    allUsersTransactionsComponentsModel.dispose();
    navbarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
