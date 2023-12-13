import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _BiometricsEnabled =
          await secureStorage.getBool('ff_BiometricsEnabled') ??
              _BiometricsEnabled;
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_countrySelected') != null) {
        try {
          final serializedData =
              await secureStorage.getString('ff_countrySelected') ?? '{}';
          _countrySelected = CountryCurrencyDataTypeStruct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_UserBankSelection') != null) {
        try {
          final serializedData =
              await secureStorage.getString('ff_UserBankSelection') ?? '{}';
          _UserBankSelection = BankVerificationStruct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_countryCurrencyTradeSell') !=
          null) {
        try {
          final serializedData =
              await secureStorage.getString('ff_countryCurrencyTradeSell') ??
                  '{}';
          _countryCurrencyTradeSell =
              CountryCurrencyDataTypeStruct.fromSerializableMap(
                  jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      _appleORGoogle =
          await secureStorage.getBool('ff_appleORGoogle') ?? _appleORGoogle;
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_signUpDetails') != null) {
        try {
          final serializedData =
              await secureStorage.getString('ff_signUpDetails') ?? '{}';
          _signUpDetails = SignUpDetailsStruct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      _pinValueForTransactions =
          await secureStorage.getString('ff_pinValueForTransactions') ??
              _pinValueForTransactions;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  int _pageViewRates = 0;
  int get pageViewRates => _pageViewRates;
  set pageViewRates(int _value) {
    _pageViewRates = _value;
  }

  int _navBarPageview = 1;
  int get navBarPageview => _navBarPageview;
  set navBarPageview(int _value) {
    _navBarPageview = _value;
  }

  String _FilterTransactions = 'All time';
  String get FilterTransactions => _FilterTransactions;
  set FilterTransactions(String _value) {
    _FilterTransactions = _value;
  }

  CountryCurrencyDataTypeStruct _currentCurrencyAppState =
      CountryCurrencyDataTypeStruct();
  CountryCurrencyDataTypeStruct get currentCurrencyAppState =>
      _currentCurrencyAppState;
  set currentCurrencyAppState(CountryCurrencyDataTypeStruct _value) {
    _currentCurrencyAppState = _value;
  }

  void updateCurrentCurrencyAppStateStruct(
      Function(CountryCurrencyDataTypeStruct) updateFn) {
    updateFn(_currentCurrencyAppState);
  }

  bool _BiometricsEnabled = false;
  bool get BiometricsEnabled => _BiometricsEnabled;
  set BiometricsEnabled(bool _value) {
    _BiometricsEnabled = _value;
    secureStorage.setBool('ff_BiometricsEnabled', _value);
  }

  void deleteBiometricsEnabled() {
    secureStorage.delete(key: 'ff_BiometricsEnabled');
  }

  DateTime? _lastActiveTime;
  DateTime? get lastActiveTime => _lastActiveTime;
  set lastActiveTime(DateTime? _value) {
    _lastActiveTime = _value;
  }

  String _pincodeFieldOne = '';
  String get pincodeFieldOne => _pincodeFieldOne;
  set pincodeFieldOne(String _value) {
    _pincodeFieldOne = _value;
  }

  String _pincodeFieldTwo = '';
  String get pincodeFieldTwo => _pincodeFieldTwo;
  set pincodeFieldTwo(String _value) {
    _pincodeFieldTwo = _value;
  }

  String _pincodeFieldThree = '';
  String get pincodeFieldThree => _pincodeFieldThree;
  set pincodeFieldThree(String _value) {
    _pincodeFieldThree = _value;
  }

  String _pincodeFieldFour = '';
  String get pincodeFieldFour => _pincodeFieldFour;
  set pincodeFieldFour(String _value) {
    _pincodeFieldFour = _value;
  }

  String _pincodeFieldFive = '';
  String get pincodeFieldFive => _pincodeFieldFive;
  set pincodeFieldFive(String _value) {
    _pincodeFieldFive = _value;
  }

  CountryCurrencyDataTypeStruct _countrySelected =
      CountryCurrencyDataTypeStruct();
  CountryCurrencyDataTypeStruct get countrySelected => _countrySelected;
  set countrySelected(CountryCurrencyDataTypeStruct _value) {
    _countrySelected = _value;
    secureStorage.setString('ff_countrySelected', _value.serialize());
  }

  void deleteCountrySelected() {
    secureStorage.delete(key: 'ff_countrySelected');
  }

  void updateCountrySelectedStruct(
      Function(CountryCurrencyDataTypeStruct) updateFn) {
    updateFn(_countrySelected);
    secureStorage.setString('ff_countrySelected', _countrySelected.serialize());
  }

  BankVerificationStruct _UserBankSelection = BankVerificationStruct();
  BankVerificationStruct get UserBankSelection => _UserBankSelection;
  set UserBankSelection(BankVerificationStruct _value) {
    _UserBankSelection = _value;
    secureStorage.setString('ff_UserBankSelection', _value.serialize());
  }

  void deleteUserBankSelection() {
    secureStorage.delete(key: 'ff_UserBankSelection');
  }

  void updateUserBankSelectionStruct(
      Function(BankVerificationStruct) updateFn) {
    updateFn(_UserBankSelection);
    secureStorage.setString(
        'ff_UserBankSelection', _UserBankSelection.serialize());
  }

  String _filterOn = 'off';
  String get filterOn => _filterOn;
  set filterOn(String _value) {
    _filterOn = _value;
  }

  CryptoNameStruct _cryptoChosen = CryptoNameStruct.fromSerializableMap(jsonDecode(
      '{\"Name\":\"kljhgfdx\",\"cryptoChosenRef\":\"\",\"ImageCoin\":\"https://firebasestorage.googleapis.com/v0/b/rexmanexchange-204ac.appspot.com/o/OIP%20(4).jpeg?alt=media&token=a8f586ae-9240-4d80-94a3-d0accbbdd409&_gl=1*1rbrr4f*_ga*MTc4NDAwMTYwMy4xNjgzMDU3MjU1*_ga_CW55HF8NVT*MTY5NjgwNjg4OC4xODUuMS4xNjk2ODA3ODE1LjIxLjAuMA..\",\"symbol\":\"ouiygfdsghjkl\"}'));
  CryptoNameStruct get cryptoChosen => _cryptoChosen;
  set cryptoChosen(CryptoNameStruct _value) {
    _cryptoChosen = _value;
  }

  void updateCryptoChosenStruct(Function(CryptoNameStruct) updateFn) {
    updateFn(_cryptoChosen);
  }

  BuyTransactionInitiatedStruct _BuyTransactionInitialized =
      BuyTransactionInitiatedStruct.fromSerializableMap(jsonDecode(
          '{\"amountToBuyCurrency\":\"0\",\"amountToBuyinDollars\":\"0\",\"amountToBuyInCrypto\":\"0\"}'));
  BuyTransactionInitiatedStruct get BuyTransactionInitialized =>
      _BuyTransactionInitialized;
  set BuyTransactionInitialized(BuyTransactionInitiatedStruct _value) {
    _BuyTransactionInitialized = _value;
  }

  void updateBuyTransactionInitializedStruct(
      Function(BuyTransactionInitiatedStruct) updateFn) {
    updateFn(_BuyTransactionInitialized);
  }

  SellOrderInitiatedStruct _AmountToSell =
      SellOrderInitiatedStruct.fromSerializableMap(jsonDecode(
          '{\"AmountToSellInDollars\":\"100\",\"AmountToSellInCrypto\":\"100\",\"AmountToRecieveInLocalCurrency\":\"100\",\"walletAddressSentTo\":\"100\"}'));
  SellOrderInitiatedStruct get AmountToSell => _AmountToSell;
  set AmountToSell(SellOrderInitiatedStruct _value) {
    _AmountToSell = _value;
  }

  void updateAmountToSellStruct(Function(SellOrderInitiatedStruct) updateFn) {
    updateFn(_AmountToSell);
  }

  double _appVersionNumber = 1;
  double get appVersionNumber => _appVersionNumber;
  set appVersionNumber(double _value) {
    _appVersionNumber = _value;
  }

  CountryCurrencyDataTypeStruct _countryCurrencyTradeSell =
      CountryCurrencyDataTypeStruct.fromSerializableMap(jsonDecode(
          '{\"CountryName\":\"Nigeria\",\"CurrencyCode\":\"NGN\",\"countryFlag\":\"https://firebasestorage.googleapis.com/v0/b/rexmanexchange-204ac.appspot.com/o/OIP%20(4).jpeg?alt=media&token=a8f586ae-9240-4d80-94a3-d0accbbdd409&_gl=1*1rbrr4f*_ga*MTc4NDAwMTYwMy4xNjgzMDU3MjU1*_ga_CW55HF8NVT*MTY5NjgwNjg4OC4xODUuMS4xNjk2ODA3ODE1LjIxLjAuMA..\",\"CurrencyRef\":\"/Countries_Currency/OuwMBvlZVhDQJcCBJHoS\",\"rate_buy\":\"0.0\",\"rate_sell\":\"0.0\"}'));
  CountryCurrencyDataTypeStruct get countryCurrencyTradeSell =>
      _countryCurrencyTradeSell;
  set countryCurrencyTradeSell(CountryCurrencyDataTypeStruct _value) {
    _countryCurrencyTradeSell = _value;
    secureStorage.setString('ff_countryCurrencyTradeSell', _value.serialize());
  }

  void deleteCountryCurrencyTradeSell() {
    secureStorage.delete(key: 'ff_countryCurrencyTradeSell');
  }

  void updateCountryCurrencyTradeSellStruct(
      Function(CountryCurrencyDataTypeStruct) updateFn) {
    updateFn(_countryCurrencyTradeSell);
    secureStorage.setString(
        'ff_countryCurrencyTradeSell', _countryCurrencyTradeSell.serialize());
  }

  bool _appleORGoogle = false;
  bool get appleORGoogle => _appleORGoogle;
  set appleORGoogle(bool _value) {
    _appleORGoogle = _value;
    secureStorage.setBool('ff_appleORGoogle', _value);
  }

  void deleteAppleORGoogle() {
    secureStorage.delete(key: 'ff_appleORGoogle');
  }

  SignUpDetailsStruct _signUpDetails = SignUpDetailsStruct.fromSerializableMap(
      jsonDecode(
          '{\"username\":\"username\",\"Email\":\"email\",\"password\":\"password\"}'));
  SignUpDetailsStruct get signUpDetails => _signUpDetails;
  set signUpDetails(SignUpDetailsStruct _value) {
    _signUpDetails = _value;
    secureStorage.setString('ff_signUpDetails', _value.serialize());
  }

  void deleteSignUpDetails() {
    secureStorage.delete(key: 'ff_signUpDetails');
  }

  void updateSignUpDetailsStruct(Function(SignUpDetailsStruct) updateFn) {
    updateFn(_signUpDetails);
    secureStorage.setString('ff_signUpDetails', _signUpDetails.serialize());
  }

  String _pinValueForTransactions = '';
  String get pinValueForTransactions => _pinValueForTransactions;
  set pinValueForTransactions(String _value) {
    _pinValueForTransactions = _value;
    secureStorage.setString('ff_pinValueForTransactions', _value);
  }

  void deletePinValueForTransactions() {
    secureStorage.delete(key: 'ff_pinValueForTransactions');
  }

  final _banksManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> banks({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _banksManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearBanksCache() => _banksManager.clear();
  void clearBanksCacheKey(String? uniqueKey) =>
      _banksManager.clearRequest(uniqueKey);
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
