import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'message_box_model.dart';
export 'message_box_model.dart';

class MessageBoxWidget extends StatefulWidget {
  const MessageBoxWidget({
    Key? key,
    required this.messageDoc,
  }) : super(key: key);

  final ChatsSupportRecord? messageDoc;

  @override
  _MessageBoxWidgetState createState() => _MessageBoxWidgetState();
}

class _MessageBoxWidgetState extends State<MessageBoxWidget> {
  late MessageBoxModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MessageBoxModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.messageDoc?.createdBy != currentUserUid) {
        await widget.messageDoc!.reference.update(createChatsSupportRecordData(
          read: true,
        ));
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

    return Stack(
      children: [
        Container(
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
            padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                if (widget.messageDoc!.transactionActionEnabled &&
                    valueOrDefault<bool>(currentUserDocument?.admin, false)) {
                  context.pushNamed(
                    'Transactiontracking',
                    queryParameters: {
                      'transactionId': serializeParam(
                        widget.messageDoc?.parentReference,
                        ParamType.DocumentReference,
                      ),
                    }.withoutNulls,
                    extra: <String, dynamic>{
                      kTransitionInfoKey: TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                        duration: Duration(milliseconds: 0),
                      ),
                    },
                  );
                } else {
                  return;
                }
              },
              child: Text(
                valueOrDefault<String>(
                  widget.messageDoc?.message,
                  'Message',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Oxygen',
                      color: widget.messageDoc?.createdBy == 'Admin'
                          ? Colors.black
                          : Colors.white,
                      fontSize: 15.0,
                    ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
