import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/back_component_widget.dart';
import '/components/currency_switch_trades_widget.dart';
import '/components/loading_screen_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/sold_page/popup/popup_widget.dart';
import '/sold_page/transactionreviewbuttomsheet/transactionreviewbuttomsheet_widget.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'walletaddress_widget.dart' show WalletaddressWidget;
import 'package:barcode_widget/barcode_widget.dart';
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

class WalletaddressModel extends FlutterFlowModel<WalletaddressWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for AmountSentInDollars widget.
  FocusNode? amountSentInDollarsFocusNode;
  TextEditingController? amountSentInDollarsController;
  String? Function(BuildContext, String?)?
      amountSentInDollarsControllerValidator;
  String? _amountSentInDollarsControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for amountToSellInCrypto widget.
  FocusNode? amountToSellInCryptoFocusNode;
  TextEditingController? amountToSellInCryptoController;
  String? Function(BuildContext, String?)?
      amountToSellInCryptoControllerValidator;
  String? _amountToSellInCryptoControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // Model for currencySwitchTrades component.
  late CurrencySwitchTradesModel currencySwitchTradesModel;
  // Stores action output result for [Backend Call - Create Document] action in buy widget.
  UserTransactionsRecord? createdTransaction;
  // Model for backComponent component.
  late BackComponentModel backComponentModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    amountSentInDollarsControllerValidator =
        _amountSentInDollarsControllerValidator;
    amountToSellInCryptoControllerValidator =
        _amountToSellInCryptoControllerValidator;
    currencySwitchTradesModel =
        createModel(context, () => CurrencySwitchTradesModel());
    backComponentModel = createModel(context, () => BackComponentModel());
  }

  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    amountSentInDollarsFocusNode?.dispose();
    amountSentInDollarsController?.dispose();

    amountToSellInCryptoFocusNode?.dispose();
    amountToSellInCryptoController?.dispose();

    currencySwitchTradesModel.dispose();
    backComponentModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
