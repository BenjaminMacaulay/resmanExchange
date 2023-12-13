import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'rules_sign_up_model.dart';
export 'rules_sign_up_model.dart';

class RulesSignUpWidget extends StatefulWidget {
  const RulesSignUpWidget({Key? key}) : super(key: key);

  @override
  _RulesSignUpWidgetState createState() => _RulesSignUpWidgetState();
}

class _RulesSignUpWidgetState extends State<RulesSignUpWidget> {
  late RulesSignUpModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RulesSignUpModel());

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

    return Wrap(
      spacing: 0.0,
      runSpacing: 8.0,
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.start,
      direction: Axis.horizontal,
      runAlignment: WrapAlignment.start,
      verticalDirection: VerticalDirection.down,
      clipBehavior: Clip.none,
      children: [
        RichText(
          textScaleFactor: MediaQuery.of(context).textScaleFactor,
          text: TextSpan(
            children: [
              TextSpan(
                text: 'By signing up you automatically agree with our',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Work Sans',
                      color: Color(0xFF8D8B92),
                      fontSize: 13.0,
                      fontWeight: FontWeight.w600,
                    ),
              )
            ],
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Oxygen',
                  color: Color(0xFFFFAA2E),
                  fontSize: 13.0,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 0.0, 0.0),
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.pushNamed(
                'TermsOfServices',
                extra: <String, dynamic>{
                  kTransitionInfoKey: TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.fade,
                    duration: Duration(milliseconds: 0),
                  ),
                },
              );
            },
            child: RichText(
              textScaleFactor: MediaQuery.of(context).textScaleFactor,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Terms of service',
                    style: GoogleFonts.getFont(
                      'Work Sans',
                    ),
                  )
                ],
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Oxygen',
                      color: Color(0xFFFFAA2E),
                      fontSize: 13.0,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 0.0, 0.0),
          child: RichText(
            textScaleFactor: MediaQuery.of(context).textScaleFactor,
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'and',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Work Sans',
                        color: Color(0xFF8D8B92),
                        fontSize: 13.0,
                        fontWeight: FontWeight.w600,
                      ),
                )
              ],
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Oxygen',
                    color: Color(0xFFFFAA2E),
                    fontSize: 13.0,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 0.0, 0.0),
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.pushNamed(
                'PrivacyPolicy',
                extra: <String, dynamic>{
                  kTransitionInfoKey: TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.fade,
                    duration: Duration(milliseconds: 0),
                  ),
                },
              );
            },
            child: RichText(
              textScaleFactor: MediaQuery.of(context).textScaleFactor,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Privacy policy',
                    style: GoogleFonts.getFont(
                      'Work Sans',
                    ),
                  )
                ],
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Oxygen',
                      color: Color(0xFFFFAA2E),
                      fontSize: 13.0,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
