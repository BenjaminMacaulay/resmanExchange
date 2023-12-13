import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'animation_loader_skeleton_model.dart';
export 'animation_loader_skeleton_model.dart';

class AnimationLoaderSkeletonWidget extends StatefulWidget {
  const AnimationLoaderSkeletonWidget({Key? key}) : super(key: key);

  @override
  _AnimationLoaderSkeletonWidgetState createState() =>
      _AnimationLoaderSkeletonWidgetState();
}

class _AnimationLoaderSkeletonWidgetState
    extends State<AnimationLoaderSkeletonWidget> {
  late AnimationLoaderSkeletonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AnimationLoaderSkeletonModel());

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
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        color: Color(0x00F4F4FC),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: Image.asset(
            'assets/images/Screen_Recording_2023-10-03_at_8.55.39_AM.gif',
          ).image,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }
}
