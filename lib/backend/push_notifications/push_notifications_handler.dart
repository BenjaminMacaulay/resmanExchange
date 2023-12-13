import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: FlutterFlowTheme.of(context).primaryBackground,
          child: Center(
            child: Image.asset(
              'assets/images/IMG_0001_(1).JPG',
              width: 200.0,
              height: 150.0,
              fit: BoxFit.contain,
            ),
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'HomePage': ParameterData.none(),
  'Transactions': ParameterData.none(),
  'SupportPage': ParameterData.none(),
  'profileDetails': ParameterData.none(),
  'profile': ParameterData.none(),
  'security': ParameterData.none(),
  'login': ParameterData.none(),
  'signup': ParameterData.none(),
  'Verifyemail': (data) async => ParameterData(
        allParams: {
          'disableBack': getParameter<bool>(data, 'disableBack'),
          'verifyEmail': getParameter<DocumentReference>(data, 'verifyEmail'),
        },
      ),
  'ConfirmPIN': ParameterData.none(),
  'SetPin': (data) async => ParameterData(
        allParams: {
          'disableBack': getParameter<bool>(data, 'disableBack'),
        },
      ),
  'ChangeName': ParameterData.none(),
  'OTPVerificationForgotPassword': ParameterData.none(),
  'legal': ParameterData.none(),
  'TermsOfServices': ParameterData.none(),
  'PrivacyPolicy': ParameterData.none(),
  'Changeemail': ParameterData.none(),
  'ChangeAddress': ParameterData.none(),
  'ChangeTelephone': ParameterData.none(),
  'Onboarding2': ParameterData.none(),
  'WelcomePincodeScreen': ParameterData.none(),
  'VerifySms2FA': ParameterData.none(),
  'emailForPassword': ParameterData.none(),
  'OperationalCountries': ParameterData.none(),
  'Bankdetails': ParameterData.none(),
  'addANewBank_NGN': ParameterData.none(),
  'deleteaccountReason': ParameterData.none(),
  'phoneCode': (data) async => ParameterData(
        allParams: {
          'disableBack': getParameter<bool>(data, 'disableBack'),
          'phoneContact': getParameter<String>(data, 'phoneContact'),
          'verificationCode':
              getParameter<DocumentReference>(data, 'verificationCode'),
        },
      ),
  'deleteaccount': ParameterData.none(),
  'ResetPin': ParameterData.none(),
  'verifyPinOTp': (data) async => ParameterData(
        allParams: {
          'emailORPhone': getParameter<String>(data, 'emailORPhone'),
          'verifyDocument':
              getParameter<DocumentReference>(data, 'verifyDocument'),
          'pageFrom': getParameter<String>(data, 'pageFrom'),
          'newPincodeORPassword':
              getParameter<String>(data, 'newPincodeORPassword'),
        },
      ),
  'addANewBank_SA': ParameterData.none(),
  'KycDetails': ParameterData.none(),
  'documentsSubmitted': (data) async => ParameterData(
        allParams: {
          'accepted': getParameter<bool>(data, 'accepted'),
          'kycDOCS': await getDocumentParameter<VerificationUserSessionRecord>(
              data, 'kycDOCS', VerificationUserSessionRecord.fromSnapshot),
        },
      ),
  'buyCrypto': (data) async => ParameterData(
        allParams: {
          'price': getParameter<double>(data, 'price'),
          'currentRateBuy': getParameter<double>(data, 'currentRateBuy'),
        },
      ),
  'selectCoin': ParameterData.none(),
  'coinAddress': (data) async => ParameterData(
        allParams: {
          'coinImage': getParameter<String>(data, 'coinImage'),
          'rateBuy': getParameter<double>(data, 'rateBuy'),
        },
      ),
  'makePayment': (data) async => ParameterData(
        allParams: {
          'transactionRef':
              getParameter<DocumentReference>(data, 'transactionRef'),
        },
      ),
  'ChatTransactionsChat': (data) async => ParameterData(
        allParams: {
          'transactionRef':
              getParameter<DocumentReference>(data, 'transactionRef'),
          'buyOrder': getParameter<bool>(data, 'buyOrder'),
          'chatON': getParameter<bool>(data, 'chatON'),
          'sellTradeOn': getParameter<bool>(data, 'sellTradeOn'),
          'cryptoAmount': getParameter<String>(data, 'cryptoAmount'),
          'cryptoChosen': getParameter<String>(data, 'cryptoChosen'),
          'localAmountPayout': getParameter<String>(data, 'localAmountPayout'),
          'transactionCurrency':
              getParameter<String>(data, 'transactionCurrency'),
        },
      ),
  'notificationComponent': ParameterData.none(),
  'Transactiontracking': (data) async => ParameterData(
        allParams: {
          'transactionId':
              getParameter<DocumentReference>(data, 'transactionId'),
        },
      ),
  'supportChatsOpened': ParameterData.none(),
  'LiveChat': (data) async => ParameterData(
        allParams: {
          'link': getParameter<String>(data, 'link'),
        },
      ),
  'selectCoinSold': ParameterData.none(),
  'Walletaddress': (data) async => ParameterData(
        allParams: {
          'sellPrice': getParameter<double>(data, 'sellPrice'),
          'cryptoRateCurrentPrice':
              getParameter<double>(data, 'cryptoRateCurrentPrice'),
        },
      ),
  'UploadSelltransaction': (data) async => ParameterData(
        allParams: {
          'transactionRef':
              getParameter<DocumentReference>(data, 'transactionRef'),
          'amountToSendCrypto':
              getParameter<double>(data, 'amountToSendCrypto'),
          'walletNumber': getParameter<String>(data, 'walletNumber'),
        },
      ),
  'BankdetailsSell': ParameterData.none(),
  'updateRate': (data) async => ParameterData(
        allParams: {
          'country': getParameter<String>(data, 'country'),
          'countyToUpdate':
              getParameter<DocumentReference>(data, 'countyToUpdate'),
        },
      ),
  'UpdateGlobalRates': ParameterData.none(),
  'BankdetailsCompany': ParameterData.none(),
  'addANewBank_SACopy': (data) async => ParameterData(
        allParams: {
          'adminBankEdit':
              getParameter<DocumentReference>(data, 'adminBankEdit'),
        },
      ),
  'addANewBank_NGNCopy': (data) async => ParameterData(
        allParams: {
          'adminBankRef': getParameter<DocumentReference>(data, 'adminBankRef'),
        },
      ),
  'TransactionsAdmin': ParameterData.none(),
  'TransactiontrackingADMIN': (data) async => ParameterData(
        allParams: {
          'transactionId':
              getParameter<DocumentReference>(data, 'transactionId'),
          'chatOn': getParameter<bool>(data, 'chatOn'),
          'boughtOn': getParameter<bool>(data, 'boughtOn'),
          'transactionStatus': getParameter<String>(data, 'transactionStatus'),
        },
      ),
  'SendNotificationADMIN': ParameterData.none(),
  'supportChatsOpenedAdmin': ParameterData.none(),
  'CurrenciesAvailableForTrade': ParameterData.none(),
  'KYCprofile': (data) async => ParameterData(
        allParams: {
          'kycDocument':
              await getDocumentParameter<VerificationUserSessionRecord>(data,
                  'kycDocument', VerificationUserSessionRecord.fromSnapshot),
        },
      ),
  'KyCLISTS': ParameterData.none(),
  'midProfileSet': ParameterData.none(),
  'ChangeUsername': ParameterData.none(),
  'buyCryptoPage': (data) async => ParameterData(
        allParams: {
          'price': getParameter<double>(data, 'price'),
          'currentRateBuy': getParameter<double>(data, 'currentRateBuy'),
          'currencyCode': getParameter<String>(data, 'currencyCode'),
        },
      ),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
