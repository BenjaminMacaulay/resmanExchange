import '/auth/firebase_auth/auth_util.dart';
import '/components/button_numberfor_pin_widget.dart';
import '/components/error_screen_widget.dart';
import '/components/single_pin_field_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'welcome_pincode_screen_widget.dart' show WelcomePincodeScreenWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class WelcomePincodeScreenModel
    extends FlutterFlowModel<WelcomePincodeScreenWidget> {
  ///  Local state fields for this page.

  bool oneClicked = false;

  bool twoClicked = false;

  bool threeClicked = false;

  bool fourClicked = false;

  bool fiveClicked = false;

  bool sixClicked = false;

  bool sevenClicked = false;

  bool eightClicked = false;

  bool nineClicked = false;

  bool zeroClicked = false;

  String valueOne = '';

  String valueTwo = '';

  String valueThree = '';

  String valueFour = '';

  String valueFive = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  InstantTimer? instantTimer;
  // Model for singlePinField component.
  late SinglePinFieldModel singlePinFieldModel1;
  // Model for singlePinField component.
  late SinglePinFieldModel singlePinFieldModel2;
  // Model for singlePinField component.
  late SinglePinFieldModel singlePinFieldModel3;
  // Model for singlePinField component.
  late SinglePinFieldModel singlePinFieldModel4;
  // Model for singlePinField component.
  late SinglePinFieldModel singlePinFieldModel5;
  // Model for buttonNumberforPin component.
  late ButtonNumberforPinModel buttonNumberforPinModel1;
  // Model for buttonNumberforPin component.
  late ButtonNumberforPinModel buttonNumberforPinModel2;
  // Model for buttonNumberforPin component.
  late ButtonNumberforPinModel buttonNumberforPinModel3;
  // Model for buttonNumberforPin component.
  late ButtonNumberforPinModel buttonNumberforPinModel4;
  // Model for buttonNumberforPin component.
  late ButtonNumberforPinModel buttonNumberforPinModel5;
  // Model for buttonNumberforPin component.
  late ButtonNumberforPinModel buttonNumberforPinModel6;
  // Model for buttonNumberforPin component.
  late ButtonNumberforPinModel buttonNumberforPinModel7;
  // Model for buttonNumberforPin component.
  late ButtonNumberforPinModel buttonNumberforPinModel8;
  // Model for buttonNumberforPin component.
  late ButtonNumberforPinModel buttonNumberforPinModel9;
  // Model for buttonNumberforPin component.
  late ButtonNumberforPinModel buttonNumberforPinModel10;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    singlePinFieldModel1 = createModel(context, () => SinglePinFieldModel());
    singlePinFieldModel2 = createModel(context, () => SinglePinFieldModel());
    singlePinFieldModel3 = createModel(context, () => SinglePinFieldModel());
    singlePinFieldModel4 = createModel(context, () => SinglePinFieldModel());
    singlePinFieldModel5 = createModel(context, () => SinglePinFieldModel());
    buttonNumberforPinModel1 =
        createModel(context, () => ButtonNumberforPinModel());
    buttonNumberforPinModel2 =
        createModel(context, () => ButtonNumberforPinModel());
    buttonNumberforPinModel3 =
        createModel(context, () => ButtonNumberforPinModel());
    buttonNumberforPinModel4 =
        createModel(context, () => ButtonNumberforPinModel());
    buttonNumberforPinModel5 =
        createModel(context, () => ButtonNumberforPinModel());
    buttonNumberforPinModel6 =
        createModel(context, () => ButtonNumberforPinModel());
    buttonNumberforPinModel7 =
        createModel(context, () => ButtonNumberforPinModel());
    buttonNumberforPinModel8 =
        createModel(context, () => ButtonNumberforPinModel());
    buttonNumberforPinModel9 =
        createModel(context, () => ButtonNumberforPinModel());
    buttonNumberforPinModel10 =
        createModel(context, () => ButtonNumberforPinModel());
  }

  void dispose() {
    unfocusNode.dispose();
    instantTimer?.cancel();
    singlePinFieldModel1.dispose();
    singlePinFieldModel2.dispose();
    singlePinFieldModel3.dispose();
    singlePinFieldModel4.dispose();
    singlePinFieldModel5.dispose();
    buttonNumberforPinModel1.dispose();
    buttonNumberforPinModel2.dispose();
    buttonNumberforPinModel3.dispose();
    buttonNumberforPinModel4.dispose();
    buttonNumberforPinModel5.dispose();
    buttonNumberforPinModel6.dispose();
    buttonNumberforPinModel7.dispose();
    buttonNumberforPinModel8.dispose();
    buttonNumberforPinModel9.dispose();
    buttonNumberforPinModel10.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
