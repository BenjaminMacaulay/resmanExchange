import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'admin_notifications_model.dart';
export 'admin_notifications_model.dart';

class AdminNotificationsWidget extends StatefulWidget {
  const AdminNotificationsWidget({
    Key? key,
    required this.notificatiomDocument,
  }) : super(key: key);

  final NotificationsRecord? notificatiomDocument;

  @override
  _AdminNotificationsWidgetState createState() =>
      _AdminNotificationsWidgetState();
}

class _AdminNotificationsWidgetState extends State<AdminNotificationsWidget> {
  late AdminNotificationsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminNotificationsModel());

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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 30.0,
              height: 30.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: Image.asset(
                    'assets/images/LOGO_(8).png',
                  ).image,
                ),
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (!widget.notificatiomDocument!.readList
                      .contains(currentUserReference))
                    Container(
                      width: 10.0,
                      height: 10.0,
                      decoration: BoxDecoration(
                        color: Color(0xFFFFAA2E),
                        shape: BoxShape.circle,
                      ),
                    ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                      child: Text(
                        valueOrDefault<String>(
                          widget.notificatiomDocument?.title,
                          'Title',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Oxygen',
                              fontSize: 13.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Text(
                        valueOrDefault<String>(
                          widget.notificatiomDocument?.body,
                          'Body',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Oxygen',
                              color: Color(0xFF8D8B92),
                              fontSize: 12.0,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      '${dateTimeFormat('yMMMd', widget.notificatiomDocument?.createdDate)} ${dateTimeFormat('Hm', widget.notificatiomDocument?.createdDate)}',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Oxygen',
                            color: Color(0xFF8D8B92),
                            fontSize: 12.0,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
