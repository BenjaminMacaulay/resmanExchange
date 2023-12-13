import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/update_app_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'navbar_model.dart';
export 'navbar_model.dart';

class NavbarWidget extends StatefulWidget {
  const NavbarWidget({
    Key? key,
    int? pageNumber,
  })  : this.pageNumber = pageNumber ?? 1,
        super(key: key);

  final int pageNumber;

  @override
  _NavbarWidgetState createState() => _NavbarWidgetState();
}

class _NavbarWidgetState extends State<NavbarWidget> {
  late NavbarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavbarModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.intrgerPage = widget.pageNumber;
      });
      _model.internetCheck = await actions.checkInternetConnection();
      _model.appVersionNumber = await queryAppVersionNumberRecordOnce(
        queryBuilder: (appVersionNumberRecord) =>
            appVersionNumberRecord.orderBy('createdDate', descending: true),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      if (!_model.internetCheck!) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'No internet connection!',
              style: GoogleFonts.getFont(
                'Work Sans',
                color: FlutterFlowTheme.of(context).primaryText,
                fontSize: 14.0,
              ),
            ),
            duration: Duration(milliseconds: 2000),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
        if (_model.appVersionNumber!.appVersionNumber >
            FFAppState().appVersionNumber) {
          showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            enableDrag: false,
            useSafeArea: true,
            context: context,
            builder: (context) {
              return WebViewAware(
                  child: Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: Container(
                  height: double.infinity,
                  child: UpdateAppComponentWidget(),
                ),
              ));
            },
          ).then((value) => safeSetState(() {}));
        } else {
          return;
        }
      } else {
        if (_model.appVersionNumber!.appVersionNumber >
            FFAppState().appVersionNumber) {
          showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            enableDrag: false,
            useSafeArea: true,
            context: context,
            builder: (context) {
              return WebViewAware(
                  child: Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: Container(
                  height: double.infinity,
                  child: UpdateAppComponentWidget(),
                ),
              ));
            },
          ).then((value) => safeSetState(() {}));
        } else {
          return;
        }
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

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Container(
                width: 100.0,
                height: 58.0,
                constraints: BoxConstraints(
                  maxHeight: 68.0,
                ),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 9.0, 16.0, 9.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          if (widget.pageNumber != 1) {
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
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 4.0, 0.0),
                              child: Icon(
                                FFIcons.kvector2,
                                color: widget.pageNumber == 1
                                    ? (Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Colors.white
                                        : Color(0xE61F2123))
                                    : (Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Color(0xFF8D8B92)
                                        : Color(0xE58D8B92)),
                                size: 20.0,
                              ),
                            ),
                            Text(
                              'Home',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Work Sans',
                                    color: widget.pageNumber == 1
                                        ? (Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Colors.white
                                            : Color(0xE61F2123))
                                        : (Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Color(0xFF8D8B92)
                                            : Color(0xE58D8B92)),
                                    fontSize: 12.0,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          if (widget.pageNumber != 2) {
                            context.goNamed(
                              'Transactions',
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
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              FFIcons.khistoryIcon,
                              color: widget.pageNumber == 2
                                  ? (Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Color(0xE61F2123))
                                  : (Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Color(0xFF8D8B92)
                                      : Color(0xE58D8B92)),
                              size: 20.0,
                            ),
                            Text(
                              'Transactions',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Work Sans',
                                    color: widget.pageNumber == 2
                                        ? (Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Colors.white
                                            : Color(0xE61F2123))
                                        : (Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Color(0xFF8D8B92)
                                            : Color(0xE58D8B92)),
                                    fontSize: 12.0,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          if (widget.pageNumber != 3) {
                            context.goNamed(
                              'SupportPage',
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
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              FFIcons.kvector,
                              color: widget.pageNumber == 3
                                  ? (Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Color(0xE61F2123))
                                  : (Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Color(0xFF8D8B92)
                                      : Color(0xE58D8B92)),
                              size: 20.0,
                            ),
                            Text(
                              'Support',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Work Sans',
                                    color: widget.pageNumber == 3
                                        ? (Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Colors.white
                                            : Color(0xE61F2123))
                                        : (Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Color(0xFF8D8B92)
                                            : Color(0xE58D8B92)),
                                    fontSize: 12.0,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          if (widget.pageNumber != 4) {
                            context.goNamed(
                              'profile',
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
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              FFIcons.kvector1,
                              color: widget.pageNumber == 4
                                  ? (Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Color(0xE61F2123))
                                  : (Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Color(0xFF8D8B92)
                                      : Color(0xE58D8B92)),
                              size: 20.0,
                            ),
                            Text(
                              'My Profile',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Work Sans',
                                    color: widget.pageNumber == 4
                                        ? (Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Colors.white
                                            : Color(0xE61F2123))
                                        : (Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Color(0xFF8D8B92)
                                            : Color(0xE58D8B92)),
                                    fontSize: 12.0,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
