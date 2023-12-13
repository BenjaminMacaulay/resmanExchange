import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'mid_profile_set_model.dart';
export 'mid_profile_set_model.dart';

class MidProfileSetWidget extends StatefulWidget {
  const MidProfileSetWidget({Key? key}) : super(key: key);

  @override
  _MidProfileSetWidgetState createState() => _MidProfileSetWidgetState();
}

class _MidProfileSetWidgetState extends State<MidProfileSetWidget> {
  late MidProfileSetModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MidProfileSetModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      final firestoreBatch = FirebaseFirestore.instance.batch();
      try {
        while (FFAppState().appleORGoogle) {
          if ((valueOrDefault<bool>(currentUserDocument?.kycVerified, false) &&
                  (valueOrDefault<bool>(
                          currentUserDocument?.kycVerified, false) !=
                      null)) &&
              (valueOrDefault<bool>(currentUserDocument?.pinSet, false) &&
                  (valueOrDefault<bool>(currentUserDocument?.pinSet, false) !=
                      null)) &&
              !valueOrDefault<bool>(currentUserDocument?.admin, false)) {
            firestoreBatch.update(
                currentUserReference!,
                createUserCollectionRecordData(
                  admin: false,
                  createdTime: getCurrentTimestamp,
                  kycVerified: true,
                  newTransactionCache: false,
                  username: () {
                    if (currentUserDisplayName != null &&
                        currentUserDisplayName != '') {
                      return currentUserDisplayName;
                    } else if ((currentUserDisplayName == null ||
                            currentUserDisplayName == '') &&
                        (valueOrDefault(currentUserDocument?.username, '') !=
                                null &&
                            valueOrDefault(currentUserDocument?.username, '') !=
                                '')) {
                      return valueOrDefault(currentUserDocument?.username, '');
                    } else {
                      return 'user${functions.removeUserTransactionsREF(random_data.randomInteger(10, 19).toString())}';
                    }
                  }(),
                  userEmailVerified: true,
                  pinSet: true,
                ));
            setState(() {
              FFAppState().lastActiveTime = getCurrentTimestamp;
              FFAppState().appleORGoogle = false;
            });

            context.goNamed(
              'HomePage',
              extra: <String, dynamic>{
                kTransitionInfoKey: TransitionInfo(
                  hasTransition: true,
                  transitionType: PageTransitionType.fade,
                  duration: Duration(milliseconds: 0),
                ),
              },
            );
          } else if (valueOrDefault<bool>(currentUserDocument?.admin, false) &&
              (valueOrDefault<bool>(currentUserDocument?.admin, false) !=
                  null)) {
            firestoreBatch.update(
                currentUserReference!,
                createUserCollectionRecordData(
                  admin: true,
                  createdTime: getCurrentTimestamp,
                  kycVerified: true,
                  newTransactionCache: false,
                  username: () {
                    if (currentUserDisplayName != null &&
                        currentUserDisplayName != '') {
                      return currentUserDisplayName;
                    } else if ((currentUserDisplayName == null ||
                            currentUserDisplayName == '') &&
                        (valueOrDefault(currentUserDocument?.username, '') !=
                                null &&
                            valueOrDefault(currentUserDocument?.username, '') !=
                                '')) {
                      return valueOrDefault(currentUserDocument?.username, '');
                    } else {
                      return 'user${functions.removeUserTransactionsREF(random_data.randomInteger(10, 19).toString())}';
                    }
                  }(),
                  userEmailVerified: true,
                  pinSet: true,
                ));
            setState(() {
              FFAppState().lastActiveTime = getCurrentTimestamp;
              FFAppState().appleORGoogle = false;
            });

            context.goNamed(
              'HomePage',
              extra: <String, dynamic>{
                kTransitionInfoKey: TransitionInfo(
                  hasTransition: true,
                  transitionType: PageTransitionType.fade,
                  duration: Duration(milliseconds: 0),
                ),
              },
            );
          } else {
            if (valueOrDefault<bool>(currentUserDocument?.pinSet, false) &&
                (valueOrDefault<bool>(currentUserDocument?.pinSet, false) !=
                    null)) {
              firestoreBatch.update(
                  currentUserReference!,
                  createUserCollectionRecordData(
                    admin: false,
                    createdTime: getCurrentTimestamp,
                    kycVerified: true,
                    newTransactionCache: false,
                    username: () {
                      if (currentUserDisplayName != null &&
                          currentUserDisplayName != '') {
                        return currentUserDisplayName;
                      } else if ((currentUserDisplayName == null ||
                              currentUserDisplayName == '') &&
                          (valueOrDefault(currentUserDocument?.username, '') !=
                                  null &&
                              valueOrDefault(
                                      currentUserDocument?.username, '') !=
                                  '')) {
                        return valueOrDefault(
                            currentUserDocument?.username, '');
                      } else {
                        return 'user${functions.removeUserTransactionsREF(random_data.randomInteger(10, 19).toString())}';
                      }
                    }(),
                    userEmailVerified: true,
                    pinSet: true,
                  ));
              setState(() {
                FFAppState().lastActiveTime = getCurrentTimestamp;
                FFAppState().appleORGoogle = false;
              });

              context.goNamed(
                'HomePage',
                extra: <String, dynamic>{
                  kTransitionInfoKey: TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.fade,
                    duration: Duration(milliseconds: 0),
                  ),
                },
              );
            } else {
              firestoreBatch.update(
                  currentUserReference!,
                  createUserCollectionRecordData(
                    photoUrl:
                        'https://firebasestorage.googleapis.com/v0/b/rexmanexchange.appspot.com/o/Project%20assets%2Fblank-profile-picture-973460_1280-705x705.png?alt=media&token=2c1af15f-2406-443e-9517-b031a091015d&_gl=1*1lbwsgm*_ga*MTc4NDAwMTYwMy4xNjgzMDU3MjU1*_ga_CW55HF8NVT*MTY5NjIzMjQwMC4xNzUuMS4xNjk2MjMyNTY5LjMuMC4w',
                    admin: false,
                    createdTime: getCurrentTimestamp,
                    kycVerified: false,
                    newTransactionCache: false,
                    username:
                        'user${functions.removeUserTransactionsREF(random_data.randomInteger(10, 19).toString())}',
                    userEmailVerified: true,
                    pinSet: false,
                    countryCurrency: createCountryCurrencyDataTypeStruct(
                      countryName: FFAppState().countrySelected.countryName,
                      currencyCode: FFAppState().countrySelected.currencyCode,
                      countryFlag: FFAppState().countrySelected.countryFlag,
                      blurHash: FFAppState().countrySelected.blurHash,
                      currencyRef: FFAppState().countrySelected.currencyRef,
                      rateBuy: FFAppState().countrySelected.rateBuy,
                      rateSell: FFAppState().countrySelected.rateSell,
                      clearUnsetFields: false,
                    ),
                  ));
              setState(() {
                FFAppState().lastActiveTime = getCurrentTimestamp;
                FFAppState().appleORGoogle = false;
              });

              context.goNamed(
                'HomePage',
                extra: <String, dynamic>{
                  kTransitionInfoKey: TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.fade,
                    duration: Duration(milliseconds: 0),
                  ),
                },
              );
            }
          }
        }
      } finally {
        await firestoreBatch.commit();
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      ),
    );
  }
}
