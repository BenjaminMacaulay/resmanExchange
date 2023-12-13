import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/skeleton_loader_widget.dart';
import '/components/transaction_timer_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'make_payment_widget.dart' show MakePaymentWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MakePaymentModel extends FlutterFlowModel<MakePaymentWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for TransactionTimer component.
  late TransactionTimerModel transactionTimerModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    transactionTimerModel = createModel(context, () => TransactionTimerModel());
  }

  void dispose() {
    unfocusNode.dispose();
    transactionTimerModel.dispose();
  }

  /// Action blocks are added here.

  Future copyText(
    BuildContext context, {
    required String? textToCopy,
  }) async {
    await Clipboard.setData(ClipboardData(text: textToCopy!));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Copied',
          style: TextStyle(
            color: FlutterFlowTheme.of(context).primaryText,
            fontSize: 14.0,
          ),
        ),
        duration: Duration(milliseconds: 2000),
        backgroundColor: FlutterFlowTheme.of(context).success,
      ),
    );
  }

  /// Additional helper methods are added here.
}
