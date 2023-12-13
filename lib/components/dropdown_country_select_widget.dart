import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dropdown_country_select_model.dart';
export 'dropdown_country_select_model.dart';

class DropdownCountrySelectWidget extends StatefulWidget {
  const DropdownCountrySelectWidget({Key? key}) : super(key: key);

  @override
  _DropdownCountrySelectWidgetState createState() =>
      _DropdownCountrySelectWidgetState();
}

class _DropdownCountrySelectWidgetState
    extends State<DropdownCountrySelectWidget> {
  late DropdownCountrySelectModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DropdownCountrySelectModel());

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
      children: [
        Expanded(
          child: Container(
            width: 100.0,
            height: 45.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(13.0, 0.0, 13.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      AuthUserStreamWidget(
                        builder: (context) => Image.network(
                          valueOrDefault<String>(
                            currentUserDocument?.countryCurrency?.countryFlag,
                            'https://wallpaperaccess.com/full/1843653.jpg',
                          ),
                          width: 23.0,
                          height: 16.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      AuthUserStreamWidget(
                        builder: (context) => Text(
                          valueOrDefault<String>(
                            currentUserDocument?.countryCurrency?.countryName,
                            'Nigeria',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Oxygen',
                                    fontSize: 13.0,
                                  ),
                        ),
                      ),
                    ].divide(SizedBox(width: 15.0)),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                        size: 16.0,
                      ),
                    ].divide(SizedBox(width: 15.0)),
                  ),
                ].divide(SizedBox(width: 15.0)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
