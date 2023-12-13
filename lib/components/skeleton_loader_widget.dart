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
import 'skeleton_loader_model.dart';
export 'skeleton_loader_model.dart';

class SkeletonLoaderWidget extends StatefulWidget {
  const SkeletonLoaderWidget({
    Key? key,
    bool? borderon,
  })  : this.borderon = borderon ?? false,
        super(key: key);

  final bool borderon;

  @override
  _SkeletonLoaderWidgetState createState() => _SkeletonLoaderWidgetState();
}

class _SkeletonLoaderWidgetState extends State<SkeletonLoaderWidget>
    with TickerProviderStateMixin {
  late SkeletonLoaderModel _model;

  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
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
    'containerOnPageLoadAnimation2': AnimationInfo(
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
    _model = createModel(context, () => SkeletonLoaderModel());

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

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        if (widget.borderon)
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  width: 100.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                    color: Color(0x762D2D2D),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: Image.asset(
                        'assets/images/Screen_Recording_2023-10-03_at_8.55.39_AM.gif',
                      ).image,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ).animateOnPageLoad(
                    animationsMap['containerOnPageLoadAnimation1']!),
              ),
            ],
          ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            if (!widget.borderon)
              Expanded(
                child: Container(
                  width: 100.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                    color: Color(0x762D2D2D),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: Image.asset(
                        'assets/images/Screen_Recording_2023-10-03_at_8.55.39_AM.gif',
                      ).image,
                    ),
                  ),
                ).animateOnPageLoad(
                    animationsMap['containerOnPageLoadAnimation2']!),
              ),
          ],
        ),
      ],
    );
  }
}
