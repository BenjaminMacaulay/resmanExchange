import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'transaction_component_model.dart';
export 'transaction_component_model.dart';

class TransactionComponentWidget extends StatefulWidget {
  const TransactionComponentWidget({
    Key? key,
    required this.transactionDoc,
  }) : super(key: key);

  final UserTransactionsRecord? transactionDoc;

  @override
  _TransactionComponentWidgetState createState() =>
      _TransactionComponentWidgetState();
}

class _TransactionComponentWidgetState
    extends State<TransactionComponentWidget> {
  late TransactionComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TransactionComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              if (!valueOrDefault<bool>(currentUserDocument?.admin, false)) {
                context.pushNamed(
                  'Transactiontracking',
                  queryParameters: {
                    'transactionId': serializeParam(
                      widget.transactionDoc?.reference,
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
              } else {
                context.pushNamed(
                  'TransactiontrackingADMIN',
                  queryParameters: {
                    'transactionId': serializeParam(
                      widget.transactionDoc?.reference,
                      ParamType.DocumentReference,
                    ),
                    'chatOn': serializeParam(
                      widget.transactionDoc?.chatStatus == 'open',
                      ParamType.bool,
                    ),
                    'boughtOn': serializeParam(
                      widget.transactionDoc?.transactionType == 'bought',
                      ParamType.bool,
                    ),
                    'transactionStatus': serializeParam(
                      widget.transactionDoc?.transactionType,
                      ParamType.String,
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
              }
            },
            child: Container(
              width: 100.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(17.0, 8.0, 17.0, 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.00, 0.00),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (widget.transactionDoc?.transactionType ==
                                    'sold')
                                  Container(
                                    width: 40.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF1F2123),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: Image.asset(
                                          'assets/images/sold.png',
                                        ).image,
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                if (widget.transactionDoc?.transactionType ==
                                    'bought')
                                  Container(
                                    width: 40.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF1F2123),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: Image.asset(
                                          'assets/images/bought.png',
                                        ).image,
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                () {
                                  if (widget.transactionDoc?.transactionType ==
                                      'sold') {
                                    return 'Sold';
                                  } else if (widget
                                          .transactionDoc?.transactionType ==
                                      'bought') {
                                    return 'Bought';
                                  } else {
                                    return '- - -';
                                  }
                                }(),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Work Sans',
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              Text(
                                () {
                                  if (widget.transactionDoc?.transactionType ==
                                      'sold') {
                                    return '${widget.transactionDoc?.cryptoChoice?.symbol} to cash';
                                  } else if (widget
                                          .transactionDoc?.transactionType ==
                                      'bought') {
                                    return valueOrDefault<String>(
                                      widget.transactionDoc?.cryptoChoice?.name,
                                      '- - -',
                                    );
                                  } else {
                                    return '- - -';
                                  }
                                }(),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Work Sans',
                                      fontSize: 13.0,
                                    ),
                              ),
                            ].divide(SizedBox(height: 3.0)),
                          ),
                        ].divide(SizedBox(width: 10.0)),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          () {
                            if (widget.transactionDoc?.transactionType ==
                                'bought') {
                              return '${widget.transactionDoc?.countryCurrency?.currencyCode} ${formatNumber(
                                widget.transactionDoc?.buyTransaction
                                    ?.amountToBuyCurrency,
                                formatType: FormatType.decimal,
                                decimalType: DecimalType.periodDecimal,
                              )}';
                            } else if (widget.transactionDoc?.transactionType ==
                                'sold') {
                              return '${widget.transactionDoc?.countryCurrency?.currencyCode} ${formatNumber(
                                widget.transactionDoc?.sellOrderTransaction
                                    ?.amountToRecieveInLocalCurrency,
                                formatType: FormatType.decimal,
                                decimalType: DecimalType.periodDecimal,
                              )}';
                            } else {
                              return '- - -';
                            }
                          }(),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Work Sans',
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                        Text(
                          () {
                            if (widget.transactionDoc?.transactionStatus ==
                                'failed') {
                              return 'Failed';
                            } else if ((widget
                                        .transactionDoc?.transactionStatus ==
                                    'pending') &&
                                !functions.diffBetweeenTimeAndCurrentTime24(
                                    widget.transactionDoc!.createdDate!)) {
                              return 'Pending';
                            } else if ((widget
                                        .transactionDoc?.transactionStatus ==
                                    'pending') &&
                                functions.diffBetweeenTimeAndCurrentTime24(
                                    widget.transactionDoc!.createdDate!)) {
                              return 'Failed';
                            } else if (widget
                                    .transactionDoc?.transactionStatus ==
                                'success') {
                              return dateTimeFormat(
                                  'yMMMd', widget.transactionDoc!.createdDate!);
                            } else {
                              return dateTimeFormat(
                                  'yMMMd', widget.transactionDoc!.createdDate!);
                            }
                          }(),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Work Sans',
                                color: valueOrDefault<Color>(
                                  () {
                                    if (widget.transactionDoc
                                            ?.transactionStatus ==
                                        'failed') {
                                      return FlutterFlowTheme.of(context).error;
                                    } else if ((widget.transactionDoc
                                                ?.transactionStatus ==
                                            'pending') &&
                                        !functions
                                            .diffBetweeenTimeAndCurrentTime24(
                                                widget.transactionDoc!
                                                    .createdDate!)) {
                                      return FlutterFlowTheme.of(context)
                                          .secondaryText;
                                    } else if ((widget.transactionDoc
                                                ?.transactionStatus ==
                                            'pending') &&
                                        functions
                                            .diffBetweeenTimeAndCurrentTime24(
                                                widget.transactionDoc!
                                                    .createdDate!)) {
                                      return FlutterFlowTheme.of(context).error;
                                    } else {
                                      return Colors.white;
                                    }
                                  }(),
                                  Colors.white,
                                ),
                                fontSize: 13.0,
                              ),
                        ),
                      ].divide(SizedBox(height: 3.0)),
                    ),
                  ].divide(SizedBox(width: 8.0)),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
