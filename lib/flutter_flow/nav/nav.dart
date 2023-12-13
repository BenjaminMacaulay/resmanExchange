import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) => RootPageContext.wrap(
        appStateNotifier.loggedIn ? HomePageWidget() : Onboarding2Widget(),
        errorRoute: state.location,
      ),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => RootPageContext.wrap(
            appStateNotifier.loggedIn ? HomePageWidget() : Onboarding2Widget(),
          ),
        ),
        FFRoute(
          name: 'HomePage',
          path: '/homePage',
          requireAuth: true,
          builder: (context, params) => HomePageWidget(),
        ),
        FFRoute(
          name: 'Transactions',
          path: '/transactions',
          requireAuth: true,
          builder: (context, params) => TransactionsWidget(),
        ),
        FFRoute(
          name: 'SupportPage',
          path: '/supportPage',
          builder: (context, params) => SupportPageWidget(),
        ),
        FFRoute(
          name: 'profileDetails',
          path: '/profileDetails',
          requireAuth: true,
          builder: (context, params) => ProfileDetailsWidget(),
        ),
        FFRoute(
          name: 'profile',
          path: '/profile',
          builder: (context, params) => ProfileWidget(),
        ),
        FFRoute(
          name: 'security',
          path: '/security',
          requireAuth: true,
          builder: (context, params) => SecurityWidget(),
        ),
        FFRoute(
          name: 'login',
          path: '/login',
          builder: (context, params) => LoginWidget(),
        ),
        FFRoute(
          name: 'signup',
          path: '/signup',
          builder: (context, params) => SignupWidget(),
        ),
        FFRoute(
          name: 'Verifyemail',
          path: '/verifyemail',
          builder: (context, params) => VerifyemailWidget(
            disableBack: params.getParam('disableBack', ParamType.bool),
            verifyEmail: params.getParam('verifyEmail',
                ParamType.DocumentReference, false, ['VerificationCodes']),
          ),
        ),
        FFRoute(
          name: 'ConfirmPIN',
          path: '/confirmPIN',
          builder: (context, params) => ConfirmPINWidget(),
        ),
        FFRoute(
          name: 'SetPin',
          path: '/setPin',
          requireAuth: true,
          builder: (context, params) => SetPinWidget(
            disableBack: params.getParam('disableBack', ParamType.bool),
          ),
        ),
        FFRoute(
          name: 'ChangeName',
          path: '/changeName',
          requireAuth: true,
          builder: (context, params) => ChangeNameWidget(),
        ),
        FFRoute(
          name: 'OTPVerificationForgotPassword',
          path: '/oTPVerificationForgotPassword',
          builder: (context, params) => OTPVerificationForgotPasswordWidget(),
        ),
        FFRoute(
          name: 'legal',
          path: '/legal',
          builder: (context, params) => LegalWidget(),
        ),
        FFRoute(
          name: 'TermsOfServices',
          path: '/termsOfServices',
          builder: (context, params) => TermsOfServicesWidget(),
        ),
        FFRoute(
          name: 'PrivacyPolicy',
          path: '/privacyPolicy',
          builder: (context, params) => PrivacyPolicyWidget(),
        ),
        FFRoute(
          name: 'Changeemail',
          path: '/changeemail',
          builder: (context, params) => ChangeemailWidget(),
        ),
        FFRoute(
          name: 'ChangeAddress',
          path: '/changeAddress',
          builder: (context, params) => ChangeAddressWidget(),
        ),
        FFRoute(
          name: 'ChangeTelephone',
          path: '/changeTelephone',
          requireAuth: true,
          builder: (context, params) => ChangeTelephoneWidget(),
        ),
        FFRoute(
          name: 'Onboarding2',
          path: '/onboarding2',
          builder: (context, params) => Onboarding2Widget(),
        ),
        FFRoute(
          name: 'WelcomePincodeScreen',
          path: '/welcomePincodeScreen',
          requireAuth: true,
          builder: (context, params) => WelcomePincodeScreenWidget(),
        ),
        FFRoute(
          name: 'VerifySms2FA',
          path: '/verifySms2FA',
          builder: (context, params) => VerifySms2FAWidget(),
        ),
        FFRoute(
          name: 'emailForPassword',
          path: '/emailForPassword',
          builder: (context, params) => EmailForPasswordWidget(),
        ),
        FFRoute(
          name: 'OperationalCountries',
          path: '/operationalCountries',
          builder: (context, params) => OperationalCountriesWidget(),
        ),
        FFRoute(
          name: 'Bankdetails',
          path: '/bankdetails',
          builder: (context, params) => BankdetailsWidget(),
        ),
        FFRoute(
          name: 'addANewBank_NGN',
          path: '/addANewBankNGN',
          requireAuth: true,
          builder: (context, params) => AddANewBankNGNWidget(),
        ),
        FFRoute(
          name: 'deleteaccountReason',
          path: '/deleteaccountReason',
          requireAuth: true,
          builder: (context, params) => DeleteaccountReasonWidget(),
        ),
        FFRoute(
          name: 'phoneCode',
          path: '/phoneCode',
          requireAuth: true,
          builder: (context, params) => PhoneCodeWidget(
            disableBack: params.getParam('disableBack', ParamType.bool),
            phoneContact: params.getParam('phoneContact', ParamType.String),
            verificationCode: params.getParam('verificationCode',
                ParamType.DocumentReference, false, ['VerificationCodes']),
          ),
        ),
        FFRoute(
          name: 'deleteaccount',
          path: '/deleteaccount',
          builder: (context, params) => DeleteaccountWidget(),
        ),
        FFRoute(
          name: 'ResetPin',
          path: '/resetPin',
          requireAuth: true,
          builder: (context, params) => ResetPinWidget(),
        ),
        FFRoute(
          name: 'verifyPinOTp',
          path: '/verifyPinOTp',
          builder: (context, params) => VerifyPinOTpWidget(
            emailORPhone: params.getParam('emailORPhone', ParamType.String),
            verifyDocument: params.getParam('verifyDocument',
                ParamType.DocumentReference, false, ['VerificationCodes']),
            pageFrom: params.getParam('pageFrom', ParamType.String),
            newPincodeORPassword:
                params.getParam('newPincodeORPassword', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'addANewBank_SA',
          path: '/addANewBankSA',
          requireAuth: true,
          builder: (context, params) => AddANewBankSAWidget(),
        ),
        FFRoute(
          name: 'KycDetails',
          path: '/kycDetails',
          requireAuth: true,
          builder: (context, params) => KycDetailsWidget(),
        ),
        FFRoute(
          name: 'documentsSubmitted',
          path: '/documentsSubmitted',
          requireAuth: true,
          asyncParams: {
            'kycDOCS': getDoc(['verificationUserSession'],
                VerificationUserSessionRecord.fromSnapshot),
          },
          builder: (context, params) => DocumentsSubmittedWidget(
            accepted: params.getParam('accepted', ParamType.bool),
            kycDOCS: params.getParam('kycDOCS', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'buyCrypto',
          path: '/buyCrypto',
          builder: (context, params) => BuyCryptoWidget(
            price: params.getParam('price', ParamType.double),
            currentRateBuy: params.getParam('currentRateBuy', ParamType.double),
          ),
        ),
        FFRoute(
          name: 'selectCoin',
          path: '/selectCoin',
          requireAuth: true,
          builder: (context, params) => SelectCoinWidget(),
        ),
        FFRoute(
          name: 'coinAddress',
          path: '/coinAddress',
          builder: (context, params) => CoinAddressWidget(
            coinImage: params.getParam('coinImage', ParamType.String),
            rateBuy: params.getParam('rateBuy', ParamType.double),
          ),
        ),
        FFRoute(
          name: 'makePayment',
          path: '/makePayment',
          requireAuth: true,
          builder: (context, params) => MakePaymentWidget(
            transactionRef: params.getParam('transactionRef',
                ParamType.DocumentReference, false, ['User_Transactions']),
          ),
        ),
        FFRoute(
          name: 'ChatTransactionsChat',
          path: '/chatTransactionsChat',
          requireAuth: true,
          builder: (context, params) => ChatTransactionsChatWidget(
            transactionRef: params.getParam('transactionRef',
                ParamType.DocumentReference, false, ['User_Transactions']),
            buyOrder: params.getParam('buyOrder', ParamType.bool),
            chatON: params.getParam('chatON', ParamType.bool),
            sellTradeOn: params.getParam('sellTradeOn', ParamType.bool),
            cryptoAmount: params.getParam('cryptoAmount', ParamType.String),
            cryptoChosen: params.getParam('cryptoChosen', ParamType.String),
            localAmountPayout:
                params.getParam('localAmountPayout', ParamType.String),
            transactionCurrency:
                params.getParam('transactionCurrency', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'notificationComponent',
          path: '/notificationComponent',
          requireAuth: true,
          builder: (context, params) => NotificationComponentWidget(),
        ),
        FFRoute(
          name: 'Transactiontracking',
          path: '/transactiontracking',
          requireAuth: true,
          builder: (context, params) => TransactiontrackingWidget(
            transactionId: params.getParam('transactionId',
                ParamType.DocumentReference, false, ['User_Transactions']),
          ),
        ),
        FFRoute(
          name: 'supportChatsOpened',
          path: '/supportChatsOpened',
          requireAuth: true,
          builder: (context, params) => SupportChatsOpenedWidget(),
        ),
        FFRoute(
          name: 'LiveChat',
          path: '/liveChat',
          requireAuth: true,
          builder: (context, params) => LiveChatWidget(
            link: params.getParam('link', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'selectCoinSold',
          path: '/selectCoinSold',
          requireAuth: true,
          builder: (context, params) => SelectCoinSoldWidget(),
        ),
        FFRoute(
          name: 'Walletaddress',
          path: '/walletaddress',
          requireAuth: true,
          builder: (context, params) => WalletaddressWidget(
            sellPrice: params.getParam('sellPrice', ParamType.double),
            cryptoRateCurrentPrice:
                params.getParam('cryptoRateCurrentPrice', ParamType.double),
          ),
        ),
        FFRoute(
          name: 'UploadSelltransaction',
          path: '/uploadSelltransaction',
          requireAuth: true,
          builder: (context, params) => UploadSelltransactionWidget(
            transactionRef: params.getParam('transactionRef',
                ParamType.DocumentReference, false, ['User_Transactions']),
            amountToSendCrypto:
                params.getParam('amountToSendCrypto', ParamType.double),
            walletNumber: params.getParam('walletNumber', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'BankdetailsSell',
          path: '/bankdetailsSell',
          builder: (context, params) => BankdetailsSellWidget(),
        ),
        FFRoute(
          name: 'updateRate',
          path: '/updateRate',
          builder: (context, params) => UpdateRateWidget(
            country: params.getParam('country', ParamType.String),
            countyToUpdate: params.getParam('countyToUpdate',
                ParamType.DocumentReference, false, ['Countries_Currency']),
          ),
        ),
        FFRoute(
          name: 'UpdateGlobalRates',
          path: '/updateGlobalRates',
          builder: (context, params) => UpdateGlobalRatesWidget(),
        ),
        FFRoute(
          name: 'BankdetailsCompany',
          path: '/bankdetailsCompany',
          builder: (context, params) => BankdetailsCompanyWidget(),
        ),
        FFRoute(
          name: 'addANewBank_SACopy',
          path: '/addANewBankSACopy',
          requireAuth: true,
          builder: (context, params) => AddANewBankSACopyWidget(
            adminBankEdit: params.getParam('adminBankEdit',
                ParamType.DocumentReference, false, ['AdminBankAcct']),
          ),
        ),
        FFRoute(
          name: 'addANewBank_NGNCopy',
          path: '/addANewBankNGNCopy',
          requireAuth: true,
          builder: (context, params) => AddANewBankNGNCopyWidget(
            adminBankRef: params.getParam('adminBankRef',
                ParamType.DocumentReference, false, ['AdminBankAcct']),
          ),
        ),
        FFRoute(
          name: 'TransactionsAdmin',
          path: '/transactionsAdmin',
          requireAuth: true,
          builder: (context, params) => TransactionsAdminWidget(),
        ),
        FFRoute(
          name: 'TransactiontrackingADMIN',
          path: '/transactiontrackingADMIN',
          requireAuth: true,
          builder: (context, params) => TransactiontrackingADMINWidget(
            transactionId: params.getParam('transactionId',
                ParamType.DocumentReference, false, ['User_Transactions']),
            chatOn: params.getParam('chatOn', ParamType.bool),
            boughtOn: params.getParam('boughtOn', ParamType.bool),
            transactionStatus:
                params.getParam('transactionStatus', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'SendNotificationADMIN',
          path: '/sendNotificationADMIN',
          builder: (context, params) => SendNotificationADMINWidget(),
        ),
        FFRoute(
          name: 'supportChatsOpenedAdmin',
          path: '/supportChatsOpenedAdmin',
          requireAuth: true,
          builder: (context, params) => SupportChatsOpenedAdminWidget(),
        ),
        FFRoute(
          name: 'CurrenciesAvailableForTrade',
          path: '/currenciesAvailableForTrade',
          builder: (context, params) => CurrenciesAvailableForTradeWidget(),
        ),
        FFRoute(
          name: 'KYCprofile',
          path: '/kYCprofile',
          asyncParams: {
            'kycDocument': getDoc(['verificationUserSession'],
                VerificationUserSessionRecord.fromSnapshot),
          },
          builder: (context, params) => KYCprofileWidget(
            kycDocument: params.getParam('kycDocument', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'KyCLISTS',
          path: '/kyCLISTS',
          builder: (context, params) => KyCLISTSWidget(),
        ),
        FFRoute(
          name: 'midProfileSet',
          path: '/midProfileSet',
          requireAuth: true,
          builder: (context, params) => MidProfileSetWidget(),
        ),
        FFRoute(
          name: 'ChangeUsername',
          path: '/changeUsername',
          requireAuth: true,
          builder: (context, params) => ChangeUsernameWidget(),
        ),
        FFRoute(
          name: 'buyCryptoPage',
          path: '/buyCryptoPage',
          builder: (context, params) => BuyCryptoPageWidget(
            price: params.getParam('price', ParamType.double),
            currentRateBuy: params.getParam('currentRateBuy', ParamType.double),
            currencyCode: params.getParam('currencyCode', ParamType.String),
          ),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(param, type, isList,
        collectionNamePath: collectionNamePath);
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/onboarding2';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
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
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouter.of(context).location;
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}
