import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'transaction_timer_model.dart';
export 'transaction_timer_model.dart';

class TransactionTimerWidget extends StatefulWidget {
  const TransactionTimerWidget({
    Key? key,
    bool? customTime,
    Color? colorPicked,
    required this.time,
  })  : this.customTime = customTime ?? false,
        this.colorPicked = colorPicked ?? Colors.white,
        super(key: key);

  final bool customTime;
  final Color colorPicked;
  final DateTime? time;

  @override
  _TransactionTimerWidgetState createState() => _TransactionTimerWidgetState();
}

class _TransactionTimerWidgetState extends State<TransactionTimerWidget> {
  late TransactionTimerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TransactionTimerModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.miliseconds = functions.converttomiliseconds(widget.time!);
      });
      if (widget.customTime) {
        while (_model.miliseconds! > 0) {
          await Future.delayed(const Duration(milliseconds: 100));
          _model.updatePage(() {
            _model.miliseconds = _model.miliseconds! + -100;
          });
        }
      } else {
        _model.timerController.onStartTimer();
      }
    });

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
        // The idea here is that we take the timestamp to expire and then we compare it with server time and convert the remaining time for the product expiry to milliseconds, it will always be a function done on pageload, then we will
        //
        //
        // -----then if the timer has passed (greater than ) then the timer disapper
        if (!widget.customTime)
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(4.0, 2.0, 2.0, 2.0),
            child: FlutterFlowTimer(
              initialTime: _model.miliseconds!,
              getDisplayTime: (value) =>
                  StopWatchTimer.getDisplayTime(value, milliSecond: false),
              controller: _model.timerController,
              updateStateInterval: Duration(milliseconds: 10),
              onChanged: (value, displayTime, shouldUpdate) {
                _model.timerMilliseconds = value;
                _model.timerValue = displayTime;
                if (shouldUpdate) setState(() {});
              },
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Oxygen',
                    color: widget.colorPicked,
                    fontSize: 12.0,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
        if (widget.customTime)
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (_model.showHours)
                Container(
                  height: 18.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).error,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (functions
                                .checkStringLenght(functions
                                    .hours(_model.miliseconds!)
                                    .toString())
                                .toString() ==
                            '1')
                          Align(
                            alignment: AlignmentDirectional(0.00, 0.00),
                            child: Text(
                              '0',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Oxygen',
                                    color: Color(0xFFFFEDD9),
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        Align(
                          alignment: AlignmentDirectional(0.00, 0.00),
                          child: Text(
                            functions.hours(_model.miliseconds!).toString(),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Oxygen',
                                  color: Color(0xFFFFEDD9),
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              if (_model.showHours)
                Text(
                  ':',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Oxygen',
                        color: FlutterFlowTheme.of(context).error,
                      ),
                ),
              Container(
                height: 18.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).error,
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (functions
                              .checkStringLenght(functions
                                  .minuites(_model.miliseconds!)
                                  .toString())
                              .toString() ==
                          '1')
                        Align(
                          alignment: AlignmentDirectional(0.00, 0.00),
                          child: Text(
                            '0',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Work Sans',
                                  color: Color(0xFFFFEDD9),
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                      Align(
                        alignment: AlignmentDirectional(0.00, 0.00),
                        child: Text(
                          functions.minuites(_model.miliseconds!).toString(),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Work Sans',
                                    color: Color(0xFFFFEDD9),
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                ':',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Oxygen',
                      color: FlutterFlowTheme.of(context).error,
                    ),
              ),
              Container(
                height: 18.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).error,
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (functions
                                  .checkStringLenght(functions
                                      .seconds(_model.miliseconds!)
                                      .toString())
                                  .toString() ==
                              '1')
                            Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: Text(
                                '0',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Work Sans',
                                      color: Color(0xFFFFEDD9),
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          Align(
                            alignment: AlignmentDirectional(0.00, 0.00),
                            child: Text(
                              functions.seconds(_model.miliseconds!).toString(),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Work Sans',
                                    color: Color(0xFFFFEDD9),
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ].divide(SizedBox(width: 4.0)),
          ),
      ],
    );
  }
}
