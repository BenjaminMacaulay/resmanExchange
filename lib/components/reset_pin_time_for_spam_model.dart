import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'reset_pin_time_for_spam_widget.dart' show ResetPinTimeForSpamWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ResetPinTimeForSpamModel
    extends FlutterFlowModel<ResetPinTimeForSpamWidget> {
  ///  Local state fields for this component.

  int? timer = 50000;

  ///  State fields for stateful widgets in this component.

  InstantTimer? instantTimer;
  // State field(s) for Timer widget.
  int timerMilliseconds = 50000;
  String timerValue = StopWatchTimer.getDisplayTime(
    50000,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    instantTimer?.cancel();
    timerController.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
