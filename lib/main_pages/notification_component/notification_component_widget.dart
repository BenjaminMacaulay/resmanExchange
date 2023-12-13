import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/back_component_widget.dart';
import '/components/empty_list_all_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'notification_component_model.dart';
export 'notification_component_model.dart';

class NotificationComponentWidget extends StatefulWidget {
  const NotificationComponentWidget({Key? key}) : super(key: key);

  @override
  _NotificationComponentWidgetState createState() =>
      _NotificationComponentWidgetState();
}

class _NotificationComponentWidgetState
    extends State<NotificationComponentWidget> {
  late NotificationComponentModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return FutureBuilder<List<NotificationsRecord>>(
      future: queryNotificationsRecordOnce(
        queryBuilder: (notificationsRecord) =>
            notificationsRecord.orderBy('CreatedDate', descending: true),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 40.0,
                height: 40.0,
                child: SpinKitDoubleBounce(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 40.0,
                ),
              ),
            ),
          );
        }
        List<NotificationsRecord> notificationComponentNotificationsRecordList =
            snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: wrapWithModel(
                      model: _model.backComponentModel,
                      updateCallback: () => setState(() {}),
                      updateOnChange: true,
                      child: BackComponentWidget(
                        pageName: 'Admin Notifications',
                        action: () async {
                          context.safePop();
                        },
                      ),
                    ),
                  ),
                ],
              ),
              actions: [],
              centerTitle: false,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: Stack(
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(22.0, 15.0, 22.0, 0.0),
                    child: Builder(
                      builder: (context) {
                        final notifications =
                            notificationComponentNotificationsRecordList
                                .toList();
                        return SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: List.generate(notifications.length,
                                (notificationsIndex) {
                              final notificationsItem =
                                  notifications[notificationsIndex];
                              return Container(
                                width: 100.0,
                                decoration: BoxDecoration(
                                  color: !notificationsItem.readList
                                          .contains(currentUserReference)
                                      ? FlutterFlowTheme.of(context)
                                          .secondaryBackground
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 8.0, 8.0, 8.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await notificationsItem.reference.update({
                                        ...mapToFirestore(
                                          {
                                            'readList': FieldValue.arrayUnion(
                                                [currentUserReference]),
                                          },
                                        ),
                                      });
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  if (!notificationsItem
                                                      .readList
                                                      .contains(
                                                          currentUserReference))
                                                    Container(
                                                      width: 10.0,
                                                      height: 10.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFFFAA2E),
                                                        shape: BoxShape.circle,
                                                      ),
                                                    ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  4.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        notificationsItem.title,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Work Sans',
                                                              fontSize: 14.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 4.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        notificationsItem.body,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Work Sans',
                                                              color: Color(
                                                                  0xFF8D8B92),
                                                              fontSize: 13.0,
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 4.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      '${dateTimeFormat('yMMMd', notificationsItem.createdDate)} ${dateTimeFormat('Hm', notificationsItem.createdDate)}',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Work Sans',
                                                                color: Color(
                                                                    0xFF8D8B92),
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
                                    ),
                                  ),
                                ),
                              );
                            }).divide(SizedBox(height: 16.0)),
                          ),
                        );
                      },
                    ),
                  ),
                  if (notificationComponentNotificationsRecordList.length <= 0)
                    wrapWithModel(
                      model: _model.emptyListAllModel,
                      updateCallback: () => setState(() {}),
                      updateOnChange: true,
                      child: EmptyListAllWidget(
                        notificationNote: 'No new Notifications',
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
