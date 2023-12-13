import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/back_component_widget.dart';
import '/components/loading_screen_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'coin_address_widget.dart' show CoinAddressWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CoinAddressModel extends FlutterFlowModel<CoinAddressWidget> {
  ///  Local state fields for this page.

  bool actionDone = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for Btc widget.
  FocusNode? btcFocusNode;
  TextEditingController? btcController;
  String? Function(BuildContext, String?)? btcControllerValidator;
  String? _btcControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp('').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // Stores action output result for [Backend Call - Read Document] action in buy widget.
  CountriesCurrencyRecord? countryCurrencyRead;
  // Stores action output result for [Backend Call - Create Document] action in buy widget.
  UserTransactionsRecord? transactionCreated;
  // Model for backComponent component.
  late BackComponentModel backComponentModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    btcControllerValidator = _btcControllerValidator;
    backComponentModel = createModel(context, () => BackComponentModel());
  }

  void dispose() {
    unfocusNode.dispose();
    btcFocusNode?.dispose();
    btcController?.dispose();

    backComponentModel.dispose();
  }

  /// Action blocks are added here.

  Future mainAction(BuildContext context) async {
    CountriesCurrencyRecord? countryCurrencyRead2345;
    UserTransactionsRecord? transactionCreated123;

    final firestoreBatch = FirebaseFirestore.instance.batch();
    try {
      FFAppState().updateBuyTransactionInitializedStruct(
        (e) => e..cryptoAddress = double.tryParse(btcController.text),
      );
      showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        isDismissible: false,
        enableDrag: false,
        useSafeArea: true,
        context: context,
        builder: (context) {
          return WebViewAware(
              child: GestureDetector(
            onTap: () => unfocusNode.canRequestFocus
                ? FocusScope.of(context).requestFocus(unfocusNode)
                : FocusScope.of(context).unfocus(),
            child: Padding(
              padding: MediaQuery.viewInsetsOf(context),
              child: Container(
                height: double.infinity,
                child: LoadingScreenWidget(
                  action: () async {},
                ),
              ),
            ),
          ));
        },
      );

      countryCurrencyRead2345 = await CountriesCurrencyRecord.getDocumentOnce(
          currentUserDocument!.countryCurrency.currencyRef!);

      var userTransactionsRecordReference =
          UserTransactionsRecord.collection.doc();
      firestoreBatch.set(
          userTransactionsRecordReference,
          createUserTransactionsRecordData(
            userID: currentUserUid,
            transactionType: 'bought',
            countryCurrency: createCountryCurrencyDataTypeStruct(
              countryName: currentUserDocument?.countryCurrency?.countryName,
              currencyCode: currentUserDocument?.countryCurrency?.currencyCode,
              countryFlag: currentUserDocument?.countryCurrency?.countryFlag,
              currencyRef: currentUserDocument?.countryCurrency?.currencyRef,
              rateBuy: countryCurrencyRead2345?.countryCurrency?.rateBuy,
              rateSell: countryCurrencyRead2345?.countryCurrency?.rateSell,
              clearUnsetFields: false,
              create: true,
            ),
            createdDate: getCurrentTimestamp,
            cryptoChoice: createCryptoNameStruct(
              name: FFAppState().cryptoChosen.name,
              cryptoChosenRef: FFAppState().cryptoChosen.cryptoChosenRef,
              imageCoin: FFAppState().cryptoChosen.imageCoin,
              symbol: FFAppState().cryptoChosen.symbol,
              clearUnsetFields: false,
              create: true,
            ),
            buyTransaction: createBuyTransactionInitiatedStruct(
              amountToBuyCurrency:
                  FFAppState().BuyTransactionInitialized.amountToBuyCurrency,
              amountToBuyinDollars:
                  FFAppState().BuyTransactionInitialized.amountToBuyinDollars,
              amountToBuyInCrypto:
                  FFAppState().BuyTransactionInitialized.amountToBuyInCrypto,
              cryptoAddress:
                  FFAppState().BuyTransactionInitialized.cryptoAddress,
              clearUnsetFields: false,
              create: true,
            ),
            transactionStatus: 'pending',
            expiredDate: functions.futureMINUTESGenerated(20),
            expired: true,
            ratePerDollar: widget.rateBuy,
            userWalletAddress: btcController.text,
          ));
      transactionCreated123 = UserTransactionsRecord.getDocumentFromData(
          createUserTransactionsRecordData(
            userID: currentUserUid,
            transactionType: 'bought',
            countryCurrency: createCountryCurrencyDataTypeStruct(
              countryName: currentUserDocument?.countryCurrency?.countryName,
              currencyCode: currentUserDocument?.countryCurrency?.currencyCode,
              countryFlag: currentUserDocument?.countryCurrency?.countryFlag,
              currencyRef: currentUserDocument?.countryCurrency?.currencyRef,
              rateBuy: countryCurrencyRead2345?.countryCurrency?.rateBuy,
              rateSell: countryCurrencyRead2345?.countryCurrency?.rateSell,
              clearUnsetFields: false,
              create: true,
            ),
            createdDate: getCurrentTimestamp,
            cryptoChoice: createCryptoNameStruct(
              name: FFAppState().cryptoChosen.name,
              cryptoChosenRef: FFAppState().cryptoChosen.cryptoChosenRef,
              imageCoin: FFAppState().cryptoChosen.imageCoin,
              symbol: FFAppState().cryptoChosen.symbol,
              clearUnsetFields: false,
              create: true,
            ),
            buyTransaction: createBuyTransactionInitiatedStruct(
              amountToBuyCurrency:
                  FFAppState().BuyTransactionInitialized.amountToBuyCurrency,
              amountToBuyinDollars:
                  FFAppState().BuyTransactionInitialized.amountToBuyinDollars,
              amountToBuyInCrypto:
                  FFAppState().BuyTransactionInitialized.amountToBuyInCrypto,
              cryptoAddress:
                  FFAppState().BuyTransactionInitialized.cryptoAddress,
              clearUnsetFields: false,
              create: true,
            ),
            transactionStatus: 'pending',
            expiredDate: functions.futureMINUTESGenerated(20),
            expired: true,
            ratePerDollar: widget.rateBuy,
            userWalletAddress: btcController.text,
          ),
          userTransactionsRecordReference);

      firestoreBatch.update(currentUserReference!, {
        ...mapToFirestore(
          {
            'noOfTransactions': FieldValue.increment(1),
          },
        ),
      });

      firestoreBatch.update(
          transactionCreated123!.reference,
          createUserTransactionsRecordData(
            transactionsCodeRef: functions
                .removeUserTransactionsREF(transactionCreated123!.reference.id),
            transactionID: transactionCreated123?.reference,
          ));
      Navigator.pop(context);

      context.goNamed(
        'makePayment',
        queryParameters: {
          'transactionRef': serializeParam(
            transactionCreated123?.reference,
            ParamType.DocumentReference,
          ),
        }.withoutNulls,
        extra: <String, dynamic>{
          kTransitionInfoKey: TransitionInfo(
            hasTransition: true,
            transitionType: PageTransitionType.fade,
            duration: Duration(milliseconds: 0),
          ),
        },
      );
    } finally {
      await firestoreBatch.commit();
    }
  }

  /// Additional helper methods are added here.
}
