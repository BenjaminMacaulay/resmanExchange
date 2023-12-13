import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/back_component_widget.dart';
import '/components/message_box_widget.dart';
import '/components/picture_message_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'chat_transactions_chat_widget.dart' show ChatTransactionsChatWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChatTransactionsChatModel
    extends FlutterFlowModel<ChatTransactionsChatWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Read Document] action in ChatTransactionsChat widget.
  UserTransactionsRecord? transactionRef;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Stores action output result for [Backend Call - Create Document] action in Icon widget.
  ChatsSupportRecord? messageCreated34;
  // Stores action output result for [Backend Call - Create Document] action in Icon widget.
  ChatsSupportRecord? messageCreated24;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Icon widget.
  ChatsSupportRecord? messageCreated;
  // Stores action output result for [Firestore Query - Query a collection] action in Icon widget.
  UserCollectionRecord? singleUser;
  // Stores action output result for [Backend Call - Create Document] action in Icon widget.
  ChatsSupportRecord? messageCreated2;
  // Stores action output result for [Firestore Query - Query a collection] action in Icon widget.
  List<UserCollectionRecord>? adminFound;
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
