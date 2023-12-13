import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../auth/firebase_auth/auth_util.dart';

import '../flutter_flow/flutter_flow_util.dart';
import 'schema/util/firestore_util.dart';

import 'schema/user_collection_record.dart';
import 'schema/admin_collection_record.dart';
import 'schema/cryptocurrencies_collection_record.dart';
import 'schema/user_transactions_record.dart';
import 'schema/countries_currency_record.dart';
import 'schema/notifications_record.dart';
import 'schema/admin_anouncements_record.dart';
import 'schema/admin_social_pages_record.dart';
import 'schema/user_names_record.dart';
import 'schema/admin_about_us_record.dart';
import 'schema/admin_privacy_policy_record.dart';
import 'schema/admin_terms_of_service_record.dart';
import 'schema/verification_codes_record.dart';
import 'schema/bank_details_record.dart';
import 'schema/reasonsfor_deleting_account_record.dart';
import 'schema/updated_profile_record.dart';
import 'schema/govt_issued_i_d_s_record.dart';
import 'schema/verification_user_session_record.dart';
import 'schema/admin_bank_acct_record.dart';
import 'schema/chats_support_record.dart';
import 'schema/admin_crypto_address_record.dart';
import 'schema/app_version_number_record.dart';
import 'schema/api_keys_record.dart';

export 'dart:async' show StreamSubscription;
export 'package:cloud_firestore/cloud_firestore.dart';
export 'schema/index.dart';
export 'schema/util/firestore_util.dart';
export 'schema/util/schema_util.dart';

export 'schema/user_collection_record.dart';
export 'schema/admin_collection_record.dart';
export 'schema/cryptocurrencies_collection_record.dart';
export 'schema/user_transactions_record.dart';
export 'schema/countries_currency_record.dart';
export 'schema/notifications_record.dart';
export 'schema/admin_anouncements_record.dart';
export 'schema/admin_social_pages_record.dart';
export 'schema/user_names_record.dart';
export 'schema/admin_about_us_record.dart';
export 'schema/admin_privacy_policy_record.dart';
export 'schema/admin_terms_of_service_record.dart';
export 'schema/verification_codes_record.dart';
export 'schema/bank_details_record.dart';
export 'schema/reasonsfor_deleting_account_record.dart';
export 'schema/updated_profile_record.dart';
export 'schema/govt_issued_i_d_s_record.dart';
export 'schema/verification_user_session_record.dart';
export 'schema/admin_bank_acct_record.dart';
export 'schema/chats_support_record.dart';
export 'schema/admin_crypto_address_record.dart';
export 'schema/app_version_number_record.dart';
export 'schema/api_keys_record.dart';

/// Functions to query UserCollectionRecords (as a Stream and as a Future).
Future<int> queryUserCollectionRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      UserCollectionRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<UserCollectionRecord>> queryUserCollectionRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      UserCollectionRecord.collection,
      UserCollectionRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<UserCollectionRecord>> queryUserCollectionRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      UserCollectionRecord.collection,
      UserCollectionRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query AdminCollectionRecords (as a Stream and as a Future).
Future<int> queryAdminCollectionRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      AdminCollectionRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<AdminCollectionRecord>> queryAdminCollectionRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      AdminCollectionRecord.collection,
      AdminCollectionRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<AdminCollectionRecord>> queryAdminCollectionRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      AdminCollectionRecord.collection,
      AdminCollectionRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query CryptocurrenciesCollectionRecords (as a Stream and as a Future).
Future<int> queryCryptocurrenciesCollectionRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      CryptocurrenciesCollectionRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<CryptocurrenciesCollectionRecord>>
    queryCryptocurrenciesCollectionRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
        queryCollection(
          CryptocurrenciesCollectionRecord.collection,
          CryptocurrenciesCollectionRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          limit: limit,
          singleRecord: singleRecord,
        );

Future<List<CryptocurrenciesCollectionRecord>>
    queryCryptocurrenciesCollectionRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
        queryCollectionOnce(
          CryptocurrenciesCollectionRecord.collection,
          CryptocurrenciesCollectionRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          limit: limit,
          singleRecord: singleRecord,
        );

/// Functions to query UserTransactionsRecords (as a Stream and as a Future).
Future<int> queryUserTransactionsRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      UserTransactionsRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<UserTransactionsRecord>> queryUserTransactionsRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      UserTransactionsRecord.collection,
      UserTransactionsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<UserTransactionsRecord>> queryUserTransactionsRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      UserTransactionsRecord.collection,
      UserTransactionsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query CountriesCurrencyRecords (as a Stream and as a Future).
Future<int> queryCountriesCurrencyRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      CountriesCurrencyRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<CountriesCurrencyRecord>> queryCountriesCurrencyRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      CountriesCurrencyRecord.collection,
      CountriesCurrencyRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<CountriesCurrencyRecord>> queryCountriesCurrencyRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      CountriesCurrencyRecord.collection,
      CountriesCurrencyRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query NotificationsRecords (as a Stream and as a Future).
Future<int> queryNotificationsRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      NotificationsRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<NotificationsRecord>> queryNotificationsRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      NotificationsRecord.collection,
      NotificationsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<NotificationsRecord>> queryNotificationsRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      NotificationsRecord.collection,
      NotificationsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query AdminAnouncementsRecords (as a Stream and as a Future).
Future<int> queryAdminAnouncementsRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      AdminAnouncementsRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<AdminAnouncementsRecord>> queryAdminAnouncementsRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      AdminAnouncementsRecord.collection,
      AdminAnouncementsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<AdminAnouncementsRecord>> queryAdminAnouncementsRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      AdminAnouncementsRecord.collection,
      AdminAnouncementsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query AdminSocialPagesRecords (as a Stream and as a Future).
Future<int> queryAdminSocialPagesRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      AdminSocialPagesRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<AdminSocialPagesRecord>> queryAdminSocialPagesRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      AdminSocialPagesRecord.collection,
      AdminSocialPagesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<AdminSocialPagesRecord>> queryAdminSocialPagesRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      AdminSocialPagesRecord.collection,
      AdminSocialPagesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query UserNamesRecords (as a Stream and as a Future).
Future<int> queryUserNamesRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      UserNamesRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<UserNamesRecord>> queryUserNamesRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      UserNamesRecord.collection,
      UserNamesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<UserNamesRecord>> queryUserNamesRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      UserNamesRecord.collection,
      UserNamesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query AdminAboutUsRecords (as a Stream and as a Future).
Future<int> queryAdminAboutUsRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      AdminAboutUsRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<AdminAboutUsRecord>> queryAdminAboutUsRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      AdminAboutUsRecord.collection,
      AdminAboutUsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<AdminAboutUsRecord>> queryAdminAboutUsRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      AdminAboutUsRecord.collection,
      AdminAboutUsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query AdminPrivacyPolicyRecords (as a Stream and as a Future).
Future<int> queryAdminPrivacyPolicyRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      AdminPrivacyPolicyRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<AdminPrivacyPolicyRecord>> queryAdminPrivacyPolicyRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      AdminPrivacyPolicyRecord.collection,
      AdminPrivacyPolicyRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<AdminPrivacyPolicyRecord>> queryAdminPrivacyPolicyRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      AdminPrivacyPolicyRecord.collection,
      AdminPrivacyPolicyRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query AdminTermsOfServiceRecords (as a Stream and as a Future).
Future<int> queryAdminTermsOfServiceRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      AdminTermsOfServiceRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<AdminTermsOfServiceRecord>> queryAdminTermsOfServiceRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      AdminTermsOfServiceRecord.collection,
      AdminTermsOfServiceRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<AdminTermsOfServiceRecord>> queryAdminTermsOfServiceRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      AdminTermsOfServiceRecord.collection,
      AdminTermsOfServiceRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query VerificationCodesRecords (as a Stream and as a Future).
Future<int> queryVerificationCodesRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      VerificationCodesRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<VerificationCodesRecord>> queryVerificationCodesRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      VerificationCodesRecord.collection,
      VerificationCodesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<VerificationCodesRecord>> queryVerificationCodesRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      VerificationCodesRecord.collection,
      VerificationCodesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query BankDetailsRecords (as a Stream and as a Future).
Future<int> queryBankDetailsRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      BankDetailsRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<BankDetailsRecord>> queryBankDetailsRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      BankDetailsRecord.collection,
      BankDetailsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<BankDetailsRecord>> queryBankDetailsRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      BankDetailsRecord.collection,
      BankDetailsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query ReasonsforDeletingAccountRecords (as a Stream and as a Future).
Future<int> queryReasonsforDeletingAccountRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      ReasonsforDeletingAccountRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<ReasonsforDeletingAccountRecord>>
    queryReasonsforDeletingAccountRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
        queryCollection(
          ReasonsforDeletingAccountRecord.collection,
          ReasonsforDeletingAccountRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          limit: limit,
          singleRecord: singleRecord,
        );

Future<List<ReasonsforDeletingAccountRecord>>
    queryReasonsforDeletingAccountRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
        queryCollectionOnce(
          ReasonsforDeletingAccountRecord.collection,
          ReasonsforDeletingAccountRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          limit: limit,
          singleRecord: singleRecord,
        );

/// Functions to query UpdatedProfileRecords (as a Stream and as a Future).
Future<int> queryUpdatedProfileRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      UpdatedProfileRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<UpdatedProfileRecord>> queryUpdatedProfileRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      UpdatedProfileRecord.collection,
      UpdatedProfileRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<UpdatedProfileRecord>> queryUpdatedProfileRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      UpdatedProfileRecord.collection,
      UpdatedProfileRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query GovtIssuedIDSRecords (as a Stream and as a Future).
Future<int> queryGovtIssuedIDSRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      GovtIssuedIDSRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<GovtIssuedIDSRecord>> queryGovtIssuedIDSRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      GovtIssuedIDSRecord.collection,
      GovtIssuedIDSRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<GovtIssuedIDSRecord>> queryGovtIssuedIDSRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      GovtIssuedIDSRecord.collection,
      GovtIssuedIDSRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query VerificationUserSessionRecords (as a Stream and as a Future).
Future<int> queryVerificationUserSessionRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      VerificationUserSessionRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<VerificationUserSessionRecord>> queryVerificationUserSessionRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      VerificationUserSessionRecord.collection,
      VerificationUserSessionRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<VerificationUserSessionRecord>>
    queryVerificationUserSessionRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
        queryCollectionOnce(
          VerificationUserSessionRecord.collection,
          VerificationUserSessionRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          limit: limit,
          singleRecord: singleRecord,
        );

/// Functions to query AdminBankAcctRecords (as a Stream and as a Future).
Future<int> queryAdminBankAcctRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      AdminBankAcctRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<AdminBankAcctRecord>> queryAdminBankAcctRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      AdminBankAcctRecord.collection,
      AdminBankAcctRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<AdminBankAcctRecord>> queryAdminBankAcctRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      AdminBankAcctRecord.collection,
      AdminBankAcctRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query ChatsSupportRecords (as a Stream and as a Future).
Future<int> queryChatsSupportRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      ChatsSupportRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<ChatsSupportRecord>> queryChatsSupportRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      ChatsSupportRecord.collection(parent),
      ChatsSupportRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<ChatsSupportRecord>> queryChatsSupportRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      ChatsSupportRecord.collection(parent),
      ChatsSupportRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query AdminCryptoAddressRecords (as a Stream and as a Future).
Future<int> queryAdminCryptoAddressRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      AdminCryptoAddressRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<AdminCryptoAddressRecord>> queryAdminCryptoAddressRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      AdminCryptoAddressRecord.collection,
      AdminCryptoAddressRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<AdminCryptoAddressRecord>> queryAdminCryptoAddressRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      AdminCryptoAddressRecord.collection,
      AdminCryptoAddressRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query AppVersionNumberRecords (as a Stream and as a Future).
Future<int> queryAppVersionNumberRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      AppVersionNumberRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<AppVersionNumberRecord>> queryAppVersionNumberRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      AppVersionNumberRecord.collection,
      AppVersionNumberRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<AppVersionNumberRecord>> queryAppVersionNumberRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      AppVersionNumberRecord.collection,
      AppVersionNumberRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query ApiKeysRecords (as a Stream and as a Future).
Future<int> queryApiKeysRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      ApiKeysRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<ApiKeysRecord>> queryApiKeysRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      ApiKeysRecord.collection,
      ApiKeysRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<ApiKeysRecord>> queryApiKeysRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      ApiKeysRecord.collection,
      ApiKeysRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<int> queryCollectionCount(
  Query collection, {
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection);
  if (limit > 0) {
    query = query.limit(limit);
  }

  return query.count().get().catchError((err) {
    print('Error querying $collection: $err');
  }).then((value) => value.count);
}

Stream<List<T>> queryCollection<T>(
  Query collection,
  RecordBuilder<T> recordBuilder, {
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection);
  if (limit > 0 || singleRecord) {
    query = query.limit(singleRecord ? 1 : limit);
  }
  return query.snapshots().handleError((err) {
    print('Error querying $collection: $err');
  }).map((s) => s.docs
      .map(
        (d) => safeGet(
          () => recordBuilder(d),
          (e) => print('Error serializing doc ${d.reference.path}:\n$e'),
        ),
      )
      .where((d) => d != null)
      .map((d) => d!)
      .toList());
}

Future<List<T>> queryCollectionOnce<T>(
  Query collection,
  RecordBuilder<T> recordBuilder, {
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection);
  if (limit > 0 || singleRecord) {
    query = query.limit(singleRecord ? 1 : limit);
  }
  return query.get().then((s) => s.docs
      .map(
        (d) => safeGet(
          () => recordBuilder(d),
          (e) => print('Error serializing doc ${d.reference.path}:\n$e'),
        ),
      )
      .where((d) => d != null)
      .map((d) => d!)
      .toList());
}

extension QueryExtension on Query {
  Query whereIn(String field, List? list) => (list?.isEmpty ?? true)
      ? where(field, whereIn: null)
      : where(field, whereIn: list);

  Query whereNotIn(String field, List? list) => (list?.isEmpty ?? true)
      ? where(field, whereNotIn: null)
      : where(field, whereNotIn: list);

  Query whereArrayContainsAny(String field, List? list) =>
      (list?.isEmpty ?? true)
          ? where(field, arrayContainsAny: null)
          : where(field, arrayContainsAny: list);
}

class FFFirestorePage<T> {
  final List<T> data;
  final Stream<List<T>>? dataStream;
  final QueryDocumentSnapshot? nextPageMarker;

  FFFirestorePage(this.data, this.dataStream, this.nextPageMarker);
}

Future<FFFirestorePage<T>> queryCollectionPage<T>(
  Query collection,
  RecordBuilder<T> recordBuilder, {
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
}) async {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection).limit(pageSize);
  if (nextPageMarker != null) {
    query = query.startAfterDocument(nextPageMarker);
  }
  Stream<QuerySnapshot>? docSnapshotStream;
  QuerySnapshot docSnapshot;
  if (isStream) {
    docSnapshotStream = query.snapshots();
    docSnapshot = await docSnapshotStream.first;
  } else {
    docSnapshot = await query.get();
  }
  final getDocs = (QuerySnapshot s) => s.docs
      .map(
        (d) => safeGet(
          () => recordBuilder(d),
          (e) => print('Error serializing doc ${d.reference.path}:\n$e'),
        ),
      )
      .where((d) => d != null)
      .map((d) => d!)
      .toList();
  final data = getDocs(docSnapshot);
  final dataStream = docSnapshotStream?.map(getDocs);
  final nextPageToken = docSnapshot.docs.isEmpty ? null : docSnapshot.docs.last;
  return FFFirestorePage(data, dataStream, nextPageToken);
}

// Creates a Firestore document representing the logged in user if it doesn't yet exist
Future maybeCreateUser(User user) async {
  final userRecord = UserCollectionRecord.collection.doc(user.uid);
  final userExists = await userRecord.get().then((u) => u.exists);
  if (userExists) {
    currentUserDocument =
        await UserCollectionRecord.getDocumentOnce(userRecord);
    return;
  }

  final userData = createUserCollectionRecordData(
    email: user.email ??
        FirebaseAuth.instance.currentUser?.email ??
        user.providerData.firstOrNull?.email,
    displayName:
        user.displayName ?? FirebaseAuth.instance.currentUser?.displayName,
    photoUrl: user.photoURL,
    uid: user.uid,
    phoneNumber: user.phoneNumber,
    createdTime: getCurrentTimestamp,
  );

  await userRecord.set(userData);
  currentUserDocument =
      UserCollectionRecord.getDocumentFromData(userData, userRecord);
}

Future updateUserDocument({String? email}) async {
  await currentUserDocument?.reference
      .update(createUserCollectionRecordData(email: email));
}
