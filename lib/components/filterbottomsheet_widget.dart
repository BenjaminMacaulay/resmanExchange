import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'filterbottomsheet_model.dart';
export 'filterbottomsheet_model.dart';

class FilterbottomsheetWidget extends StatefulWidget {
  const FilterbottomsheetWidget({
    Key? key,
    required this.closeAction,
  }) : super(key: key);

  final Future<dynamic> Function()? closeAction;

  @override
  _FilterbottomsheetWidgetState createState() =>
      _FilterbottomsheetWidgetState();
}

class _FilterbottomsheetWidgetState extends State<FilterbottomsheetWidget> {
  late FilterbottomsheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FilterbottomsheetModel());

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
      width: double.infinity,
      height: 200.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 4.0,
            color: Color(0x33000000),
            offset: Offset(0.0, 2.0),
          )
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(12.0),
          topRight: Radius.circular(12.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 10.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    await widget.closeAction?.call();
                  },
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 18.0,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Filter by :',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Oxygen',
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 31.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Wrap(
                      spacing: 0.0,
                      runSpacing: 0.0,
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      direction: Axis.horizontal,
                      runAlignment: WrapAlignment.start,
                      verticalDirection: VerticalDirection.down,
                      clipBehavior: Clip.none,
                      children: [
                        FlutterFlowChoiceChips(
                          options: [
                            ChipData('All time'),
                            ChipData('This week'),
                            ChipData('Last week'),
                            ChipData('This month'),
                            ChipData('Last month')
                          ],
                          onChanged: (val) async {
                            setState(
                                () => _model.choiceChipsValue = val?.first);
                            setState(() {
                              FFAppState().FilterTransactions =
                                  _model.choiceChipsValue!;
                            });
                            Navigator.pop(context);
                          },
                          selectedChipStyle: ChipStyle(
                            backgroundColor:
                                FlutterFlowTheme.of(context).secondary,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Oxygen',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.normal,
                                ),
                            iconColor: FlutterFlowTheme.of(context).primaryText,
                            iconSize: 0.0,
                            elevation: 4.0,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          unselectedChipStyle: ChipStyle(
                            backgroundColor: Color(0xFF2D2D2D),
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Oxygen',
                                  color: Colors.white,
                                  fontSize: 12.0,
                                ),
                            iconColor: Color(0x00000000),
                            iconSize: 18.0,
                            elevation: 0.0,
                            borderColor: FlutterFlowTheme.of(context).secondary,
                            borderWidth: 2.0,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          chipSpacing: 12.0,
                          rowSpacing: 12.0,
                          multiselect: false,
                          initialized: _model.choiceChipsValue != null,
                          alignment: WrapAlignment.start,
                          controller: _model.choiceChipsValueController ??=
                              FormFieldController<List<String>>(
                            [FFAppState().FilterTransactions],
                          ),
                          wrapped: true,
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
    );
  }
}
