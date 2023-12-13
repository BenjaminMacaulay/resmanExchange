import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/back_component_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/sold_page/authorize_pin/authorize_pin_widget.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import 'buy_crypto_page_widget.dart' show BuyCryptoPageWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class BuyCryptoPageModel extends FlutterFlowModel<BuyCryptoPageWidget> {
  ///  Local state fields for this page.

  String textValue = '';

  CountryCurrencyDataTypeStruct? currencyChosen;
  void updateCurrencyChosenStruct(
          Function(CountryCurrencyDataTypeStruct) updateFn) =>
      updateFn(currencyChosen ??= CountryCurrencyDataTypeStruct());

  List<String> currencyList = [];
  void addToCurrencyList(String item) => currencyList.add(item);
  void removeFromCurrencyList(String item) => currencyList.remove(item);
  void removeAtIndexFromCurrencyList(int index) => currencyList.removeAt(index);
  void insertAtIndexInCurrencyList(int index, String item) =>
      currencyList.insert(index, item);
  void updateCurrencyListAtIndex(int index, Function(String) updateFn) =>
      currencyList[index] = updateFn(currencyList[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for DropDownCurrency widget.
  String? dropDownCurrencyValue;
  FormFieldController<String>? dropDownCurrencyValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
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
