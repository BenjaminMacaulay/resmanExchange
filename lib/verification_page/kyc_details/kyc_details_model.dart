import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/back_component_widget.dart';
import '/components/loading_screen_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'kyc_details_widget.dart' show KycDetailsWidget;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class KycDetailsModel extends FlutterFlowModel<KycDetailsWidget> {
  ///  Local state fields for this page.

  String? iDType = '';

  String idUpload = 'false';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for backComponent component.
  late BackComponentModel backComponentModel;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for firstName widget.
  FocusNode? firstNameFocusNode;
  TextEditingController? firstNameController;
  String? Function(BuildContext, String?)? firstNameControllerValidator;
  String? _firstNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for middleName widget.
  FocusNode? middleNameFocusNode;
  TextEditingController? middleNameController;
  String? Function(BuildContext, String?)? middleNameControllerValidator;
  // State field(s) for LAstname widget.
  FocusNode? lAstnameFocusNode;
  TextEditingController? lAstnameController;
  String? Function(BuildContext, String?)? lAstnameControllerValidator;
  String? _lAstnameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // Stores action output result for [Backend Call - Create Document] action in buy widget.
  VerificationUserSessionRecord? createdKYCDOC;
  // Stores action output result for [Firestore Query - Query a collection] action in buy widget.
  List<UserCollectionRecord>? userAdminFounded;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    backComponentModel = createModel(context, () => BackComponentModel());
    firstNameControllerValidator = _firstNameControllerValidator;
    lAstnameControllerValidator = _lAstnameControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    backComponentModel.dispose();
    firstNameFocusNode?.dispose();
    firstNameController?.dispose();

    middleNameFocusNode?.dispose();
    middleNameController?.dispose();

    lAstnameFocusNode?.dispose();
    lAstnameController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
