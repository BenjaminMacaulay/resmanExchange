import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/filterbottomsheet_widget.dart';
import '/components/navbar_widget.dart';
import '/components/no_transactions_empty_list_widget.dart';
import '/components/transaction_component_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'transactions_widget.dart' show TransactionsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TransactionsModel extends FlutterFlowModel<TransactionsWidget> {
  ///  Local state fields for this page.

  bool? filterON = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for ChoiceChips widget.
  String? choiceChipsValue;
  FormFieldController<List<String>>? choiceChipsValueController;
  // State field(s) for NoFilter widget.
  TabController? noFilterController;
  int get noFilterCurrentIndex =>
      noFilterController != null ? noFilterController!.index : 0;

  // Model for NAVBAR component.
  late NavbarModel navbarModel;
  // Model for Filterbottomsheet component.
  late FilterbottomsheetModel filterbottomsheetModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    navbarModel = createModel(context, () => NavbarModel());
    filterbottomsheetModel =
        createModel(context, () => FilterbottomsheetModel());
  }

  void dispose() {
    unfocusNode.dispose();
    noFilterController?.dispose();
    navbarModel.dispose();
    filterbottomsheetModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
