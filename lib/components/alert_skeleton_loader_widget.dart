import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'alert_skeleton_loader_model.dart';
export 'alert_skeleton_loader_model.dart';

class AlertSkeletonLoaderWidget extends StatefulWidget {
  const AlertSkeletonLoaderWidget({Key? key}) : super(key: key);

  @override
  _AlertSkeletonLoaderWidgetState createState() =>
      _AlertSkeletonLoaderWidgetState();
}

class _AlertSkeletonLoaderWidgetState extends State<AlertSkeletonLoaderWidget>
    with TickerProviderStateMixin {
  late AlertSkeletonLoaderModel _model;

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      loop: true,
      reverse: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1200.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AlertSkeletonLoaderModel());

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

    return Container(
      width: 30.0,
      height: 30.0,
      decoration: BoxDecoration(
        color: Color(0x762D2D2D),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: Image.asset(
            'assets/images/Screen_Recording_2023-10-03_at_8.55.39_AM.gif',
          ).image,
        ),
        shape: BoxShape.circle,
      ),
    ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!);
  }
}
