import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'picture_message_model.dart';
export 'picture_message_model.dart';

class PictureMessageWidget extends StatefulWidget {
  const PictureMessageWidget({
    Key? key,
    required this.messageDoc,
  }) : super(key: key);

  final ChatsSupportRecord? messageDoc;

  @override
  _PictureMessageWidgetState createState() => _PictureMessageWidgetState();
}

class _PictureMessageWidgetState extends State<PictureMessageWidget> {
  late PictureMessageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PictureMessageModel());

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

    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Container(
            width: 220.0,
            height: 220.0,
            constraints: BoxConstraints(
              maxWidth: 280.0,
            ),
            decoration: BoxDecoration(
              color: widget.messageDoc?.createdBy == 'Admin'
                  ? FlutterFlowTheme.of(context).alternate
                  : Color(0xFF2D2D2D),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  await Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.fade,
                      child: FlutterFlowExpandedImageView(
                        image: Image.network(
                          valueOrDefault<String>(
                            widget.messageDoc?.picture,
                            'https://firebasestorage.googleapis.com/v0/b/rexmanexchange-204ac.appspot.com/o/coins%2FBitcoinPic.jpeg?alt=media&token=b26c16bf-956d-4688-a61c-44f13f07823f&_gl=1*1uatbl7*_ga*MTc4NDAwMTYwMy4xNjgzMDU3MjU1*_ga_CW55HF8NVT*MTY5NzQ5ODY5OS4yMDguMS4xNjk3NDk4NzU3LjIuMC4w',
                          ),
                          fit: BoxFit.contain,
                        ),
                        allowRotation: false,
                        tag: valueOrDefault<String>(
                          widget.messageDoc?.picture,
                          'https://firebasestorage.googleapis.com/v0/b/rexmanexchange-204ac.appspot.com/o/coins%2FBitcoinPic.jpeg?alt=media&token=b26c16bf-956d-4688-a61c-44f13f07823f&_gl=1*1uatbl7*_ga*MTc4NDAwMTYwMy4xNjgzMDU3MjU1*_ga_CW55HF8NVT*MTY5NzQ5ODY5OS4yMDguMS4xNjk3NDk4NzU3LjIuMC4w',
                        ),
                        useHeroAnimation: true,
                      ),
                    ),
                  );
                },
                child: Hero(
                  tag: valueOrDefault<String>(
                    widget.messageDoc?.picture,
                    'https://firebasestorage.googleapis.com/v0/b/rexmanexchange-204ac.appspot.com/o/coins%2FBitcoinPic.jpeg?alt=media&token=b26c16bf-956d-4688-a61c-44f13f07823f&_gl=1*1uatbl7*_ga*MTc4NDAwMTYwMy4xNjgzMDU3MjU1*_ga_CW55HF8NVT*MTY5NzQ5ODY5OS4yMDguMS4xNjk3NDk4NzU3LjIuMC4w',
                  ),
                  transitionOnUserGestures: true,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      valueOrDefault<String>(
                        widget.messageDoc?.picture,
                        'https://firebasestorage.googleapis.com/v0/b/rexmanexchange-204ac.appspot.com/o/coins%2FBitcoinPic.jpeg?alt=media&token=b26c16bf-956d-4688-a61c-44f13f07823f&_gl=1*1uatbl7*_ga*MTc4NDAwMTYwMy4xNjgzMDU3MjU1*_ga_CW55HF8NVT*MTY5NzQ5ODY5OS4yMDguMS4xNjk3NDk4NzU3LjIuMC4w',
                      ),
                      width: 300.0,
                      height: 200.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
