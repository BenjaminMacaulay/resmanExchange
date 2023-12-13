import 'dart:convert';
import 'dart:typed_data';
import '../cloud_functions/cloud_functions.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ApiCalls';

/// Start paystackTransactions Group Code

class PaystackTransactionsGroup {
  static GetBankCodeCall getBankCodeCall = GetBankCodeCall();
  static VerifyAccountNumberCall verifyAccountNumberCall =
      VerifyAccountNumberCall();
}

class GetBankCodeCall {
  Future<ApiCallResponse> call({
    String? country = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'GetBankCodeCall',
        'variables': {
          'country': country,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class VerifyAccountNumberCall {
  Future<ApiCallResponse> call({
    String? bankCode = '',
    String? accountNumber = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'VerifyAccountNumberCall',
        'variables': {
          'bankCode': bankCode,
          'accountNumber': accountNumber,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  dynamic nameVerify(dynamic response) => getJsonField(
        response,
        r'''$.data.account_name''',
      );
  dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
}

/// End paystackTransactions Group Code

class NotificationEmailWithBREVOCall {
  static Future<ApiCallResponse> call({
    String? usersEmail = '',
    String? usersName = '',
    String? subject = '',
    String? body = '',
    String? apiKey = '',
    String? companyEmail = '',
  }) async {
    final ffApiRequestBody = '''
{
  "sender": {
    "name": "Notification from Rexman Exchange",
    "email": "${companyEmail}"
  },
  "to": [
    {
      "email": "${usersEmail}",
      "name": "${usersName}"
    }
  ],
  "subject": "${subject}",
  "htmlContent": "${body}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Notification Email with BREVO ',
      apiUrl: 'https://api.brevo.com/v3/smtp/email',
      callType: ApiCallType.POST,
      headers: {
        'accept': 'application/json',
        'api-key': '${apiKey}',
        'content-type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class SmsWithBulkSMSCall {
  static Future<ApiCallResponse> call({
    String? body = '',
    String? phoneNumber = '',
  }) async {
    final ffApiRequestBody = '''
{
  "from": "AirtimeNG",
  "to": "${phoneNumber}",
  "body": "${body}.",
  "api_token": "fGzf7fAxWexd5cWiWvzp8Ja4suFoohfga1yIGQBwUWSCwfYl3eGCf8VXmAPN",
  "gateway": "otp"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'smsWithBulkSMS',
      apiUrl: 'https://www.bulksmsnigeria.com/api/v2/sms',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetCryptoPricesCall {
  static Future<ApiCallResponse> call({
    String? assestId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getCryptoPrices',
      apiUrl: 'api.coincap.io/v2/assets/${assestId}',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'assestId': assestId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic priceUsd(dynamic response) => getJsonField(
        response,
        r'''$.data.priceUsd''',
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
