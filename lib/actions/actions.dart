import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_manager.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

Future internetChecker(
  BuildContext context, {
  required String? message,
}) async {
  bool? internet;

  internet = await actions.checkInternetConnection();
  if (internet!) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'No internet connection!',
          style: TextStyle(
            color: FlutterFlowTheme.of(context).primaryText,
            fontSize: 14.0,
          ),
        ),
        duration: Duration(milliseconds: 2000),
        backgroundColor: Color(0xFFEF3333),
      ),
    );
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          valueOrDefault<String>(
            message,
            'Error, please try again.',
          ),
          style: TextStyle(
            fontSize: 14.0,
          ),
        ),
        duration: Duration(milliseconds: 2000),
        backgroundColor: Color(0xFFEF3333),
      ),
    );
  }
}

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
          color: Colors.white,
          fontSize: 14.0,
        ),
      ),
      duration: Duration(milliseconds: 2000),
      backgroundColor: FlutterFlowTheme.of(context).success,
    ),
  );
}

Future notifyAmin(
  BuildContext context, {
  required bool? buyOrder,
  required String? coinImage,
  required DocumentReference? transactionsRef,
}) async {
  List<UserCollectionRecord>? userAdmin;

  userAdmin = await queryUserCollectionRecordOnce(
    queryBuilder: (userCollectionRecord) => userCollectionRecord.where(
      'Admin',
      isEqualTo: true,
    ),
  );
  triggerPushNotification(
    notificationTitle: 'New Transaction Alert',
    notificationText:
        'A user has created a new ${buyOrder! ? 'buy' : 'sell'} order, check it out.',
    notificationImageUrl: coinImage,
    notificationSound: 'default',
    userRefs: userAdmin!.map((e) => e.reference).toList().toList(),
    initialPageName: 'Transactiontracking',
    parameterData: {
      'transactionId': transactionsRef,
    },
  );
}

Future brevoEmail(
  BuildContext context, {
  required String? emailUser,
  required String? usersName,
  required String? subject,
  required String? body,
}) async {
  ApiKeysRecord? brevoKeys;

  brevoKeys = await queryApiKeysRecordOnce(
    queryBuilder: (apiKeysRecord) => apiKeysRecord.where(
      'type',
      isEqualTo: 'brevo',
    ),
    singleRecord: true,
  ).then((s) => s.firstOrNull);
  await NotificationEmailWithBREVOCall.call(
    apiKey: brevoKeys?.key,
    usersEmail: emailUser,
    usersName: usersName,
    subject: subject,
    body: body,
    companyEmail: 'support@rexmanexchange.com',
  );
}
