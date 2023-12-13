import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/no_transactions_empty_list_widget.dart';
import '/components/transaction_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'all_users_transactions_components_model.dart';
export 'all_users_transactions_components_model.dart';

class AllUsersTransactionsComponentsWidget extends StatefulWidget {
  const AllUsersTransactionsComponentsWidget({Key? key}) : super(key: key);

  @override
  _AllUsersTransactionsComponentsWidgetState createState() =>
      _AllUsersTransactionsComponentsWidgetState();
}

class _AllUsersTransactionsComponentsWidgetState
    extends State<AllUsersTransactionsComponentsWidget> {
  late AllUsersTransactionsComponentsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AllUsersTransactionsComponentsModel());

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

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
      child: AuthUserStreamWidget(
        builder: (context) => FutureBuilder<List<UserTransactionsRecord>>(
          future: queryUserTransactionsRecordOnce(
            queryBuilder: (userTransactionsRecord) => userTransactionsRecord
                .where(
                  'userID',
                  isEqualTo: currentUserUid != '' ? currentUserUid : null,
                )
                .orderBy('CreatedDate', descending: true),
            limit: 6,
          ),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Center(
                child: SizedBox(
                  width: 40.0,
                  height: 40.0,
                  child: SpinKitDoubleBounce(
                    color: FlutterFlowTheme.of(context).primary,
                    size: 40.0,
                  ),
                ),
              );
            }
            List<UserTransactionsRecord> listViewUserTransactionsRecordList =
                snapshot.data!;
            if (listViewUserTransactionsRecordList.isEmpty) {
              return Container(
                width: 200.0,
                height: 200.0,
                child: NoTransactionsEmptyListWidget(),
              );
            }
            return ListView.separated(
              padding: EdgeInsets.zero,
              primary: false,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: listViewUserTransactionsRecordList.length,
              separatorBuilder: (_, __) => SizedBox(height: 14.0),
              itemBuilder: (context, listViewIndex) {
                final listViewUserTransactionsRecord =
                    listViewUserTransactionsRecordList[listViewIndex];
                return TransactionComponentWidget(
                  key: Key(
                      'Keytgv_${listViewIndex}_of_${listViewUserTransactionsRecordList.length}'),
                  transactionDoc: listViewUserTransactionsRecord,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
