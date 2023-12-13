import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'reset_pin_time_for_spam_model.dart';
export 'reset_pin_time_for_spam_model.dart';

class ResetPinTimeForSpamWidget extends StatefulWidget {
  const ResetPinTimeForSpamWidget({
    Key? key,
    String? forgotpin,
    String? pInAction,
    required this.action,
  })  : this.forgotpin = forgotpin ?? 'Did not get the CODE?',
        this.pInAction = pInAction ?? 'RESEND CODE',
        super(key: key);

  final String forgotpin;
  final String pInAction;
  final Future<dynamic> Function()? action;

  @override
  _ResetPinTimeForSpamWidgetState createState() =>
      _ResetPinTimeForSpamWidgetState();
}

class _ResetPinTimeForSpamWidgetState extends State<ResetPinTimeForSpamWidget> {
  late ResetPinTimeForSpamModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ResetPinTimeForSpamModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.timerController.onStartTimer();
      _model.instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 10),
        callback: (timer) async {
          setState(() {
            _model.timer = _model.timerMilliseconds;
          });
        },
        startImmediately: true,
      );
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

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.forgotpin,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Oxygen',
                  color: Color(0xFF8D8B92),
                  fontSize: 13.0,
                  fontWeight: FontWeight.w500,
                ),
          ),
          if (_model.timer! <= 0)
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                _model.timerController.onResetTimer();

                _model.timerController.onStartTimer();
                await widget.action?.call();
              },
              child: Text(
                widget.pInAction,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Oxygen',
                      color: Color(0xFFFFAA2E),
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          if (_model.timer! > 0)
            FlutterFlowTimer(
              initialTime: _model.timerMilliseconds,
              getDisplayTime: (value) => StopWatchTimer.getDisplayTime(
                value,
                hours: false,
                milliSecond: false,
              ),
              controller: _model.timerController,
              updateStateInterval: Duration(milliseconds: 1000),
              onChanged: (value, displayTime, shouldUpdate) {
                _model.timerMilliseconds = value;
                _model.timerValue = displayTime;
                if (shouldUpdate) setState(() {});
              },
              textAlign: TextAlign.start,
              style: FlutterFlowTheme.of(context).headlineSmall.override(
                    fontFamily: 'Oxygen',
                    color: Color(0xFFFFAA2E),
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                  ),
            ),
        ].divide(SizedBox(width: 10.0)),
      ),
    );
  }
}
