import '/components/back_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'privacy_policy_model.dart';
export 'privacy_policy_model.dart';

class PrivacyPolicyWidget extends StatefulWidget {
  const PrivacyPolicyWidget({Key? key}) : super(key: key);

  @override
  _PrivacyPolicyWidgetState createState() => _PrivacyPolicyWidgetState();
}

class _PrivacyPolicyWidgetState extends State<PrivacyPolicyWidget> {
  late PrivacyPolicyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PrivacyPolicyModel());

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
                  child: BackComponentWidget(
                    pageName: 'Privacy Policy',
                    actionSet: false,
                    action: () async {},
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
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(22.0, 0.0, 22.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Privacy Policy for Resman Exchange',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Work Sans',
                              color: Color(0xFFFFAA2E),
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                            ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Effective Date:',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Oxygen',
                                  fontSize: 14.0,
                                ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                4.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Wednesday, October, 18th',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Work Sans',
                                    color: Color(0xFFFFAA2E),
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.underline,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ].divide(SizedBox(height: 12.0)),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: RichText(
                              textScaleFactor:
                                  MediaQuery.of(context).textScaleFactor,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Welcome to ',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Work Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 13.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                  TextSpan(
                                    text: 'Resman Exchange ',
                                    style: GoogleFonts.getFont(
                                      'Work Sans',
                                      color:
                                          FlutterFlowTheme.of(context).warning,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        'At Resman Exchange, we recognize the importance of privacy and the sensitivity of personal information. As we are entrusted with your data in the rapidly evolving world of cryptocurrency and fintech, we take our responsibility seriously. Upholding the principles of transparency, integrity, and accountability, we are committed not only to providing you with a secure and seamless exchange experience but also to ensuring that your personal data is collected, used, and protected in full compliance with the data protection laws of Nigeria, including the Nigeria Data Protection Regulation (NDPR) and the Nigerian Data protection Act 2023. This Privacy Policy serves as our pledge to you, detailing our practices and your rights concerning your data. We encourage you to read it thoroughly to understand how we manage your personal information.',
                                    style: TextStyle(),
                                  )
                                ],
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Work Sans',
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ],
                      ),
                    ].divide(SizedBox(height: 12.0)),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Consent to Collection and Use of Data',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Work Sans',
                              color: Color(0xFFFFAA2E),
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                            ),
                      ),
                    ].divide(SizedBox(height: 12.0)),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        textScaleFactor: MediaQuery.of(context).textScaleFactor,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'By accessing, registering, or using ',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Work Sans',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                            TextSpan(
                              text: 'Resman Exchange',
                              style: GoogleFonts.getFont(
                                'Work Sans',
                                color: FlutterFlowTheme.of(context).warning,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text:
                                  ',  its online platform, or official website, you explicitly consent to the collection, use, storage, and disclosure of your personal information as described in this Privacy Policy. When you access or use our mobile application, online platform, or website, you agree to the terms outlined in this Privacy Policy. This includes any information you provide to us directly or indirectly, and any information we might collect from your usage patterns, device information, or through cookies and similar technologies.',
                              style: TextStyle(),
                            ),
                            TextSpan(
                              text:
                                  'If at any point you wish to withdraw your consent, you may do so by contacting our Data Protection Officer at ',
                              style: TextStyle(),
                            ),
                            TextSpan(
                              text: 'info@resmanexchange.com ',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).warning,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text:
                                  'However, please note that withdrawing your consent may affect our ability to provide you with certain services or features. ',
                              style: TextStyle(),
                            )
                          ],
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Work Sans',
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ].divide(SizedBox(height: 12.0)),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Data Collection',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Work Sans',
                              color: Color(0xFFFFAA2E),
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                            ),
                      ),
                    ].divide(SizedBox(height: 12.0)),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        textScaleFactor: MediaQuery.of(context).textScaleFactor,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  'We may collect the following types of personal data: ',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Work Sans',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                            TextSpan(
                              text:
                                  'Full name, Email address, Phone number,  Residential address, Bank account details, Cryptocurrency wallet addresses, Transaction history, IP address, Nationally acceptable means of identification and device information.',
                              style: GoogleFonts.getFont(
                                'Work Sans',
                                color: FlutterFlowTheme.of(context).warning,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Work Sans',
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ].divide(SizedBox(height: 12.0)),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Purpose of Data Collection',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Work Sans',
                              color: Color(0xFFFFAA2E),
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                            ),
                      ),
                    ].divide(SizedBox(height: 12.0)),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        textScaleFactor: MediaQuery.of(context).textScaleFactor,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  'Your data is collected for the following purposes:\n\n- To facilitate cryptocurrency transactions.\n- To verify your identity and prevent fraud.\n- To communicate with you about our services.\n- To comply with legal and regulatory requirements.\n- To Provide, operate, and maintain our applications and website..\n- To Improve, personalize, analyze and expand your user experience\n- To Develop new products, services, features, and functionality Communicate with you, either directly or through one of our partners, including for customer service, to provide you with updates and other information relating to the application, and for marketing and promotional purposes.\n',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Work Sans',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            )
                          ],
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Work Sans',
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ].divide(SizedBox(height: 12.0)),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Data Storage',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Work Sans',
                              color: Color(0xFFFFAA2E),
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                            ),
                      ),
                    ].divide(SizedBox(height: 12.0)),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        textScaleFactor: MediaQuery.of(context).textScaleFactor,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  'Your personal data is stored on secure servers and encrypted using state-of-the-art encryption technologies. We have implemented appropriate technical and organizational measures to ensure the security of your data.\n',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Work Sans',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            )
                          ],
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Work Sans',
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ].divide(SizedBox(height: 12.0)),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Data Sharing',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Work Sans',
                                  color: Color(0xFFFFAA2E),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.underline,
                                ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              'We may share your data with:\n\n- Regulatory authorities, law enforcement agencies, and courts when required by law.\n- Third-party service providers who assist us in our operations.\n- Any other party, with your explicit consent.\n',
                              textAlign: TextAlign.justify,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Oxygen',
                                    fontSize: 13.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ].divide(SizedBox(height: 12.0)),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Data Retention',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Work Sans',
                                  color: Color(0xFFFFAA2E),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.underline,
                                ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              'We will retain your personal data for as long as necessary to fulfill the purposes for which it was collected or to comply with legal, regulatory, or internal policy requirements.',
                              textAlign: TextAlign.justify,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Oxygen',
                                    fontSize: 13.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ].divide(SizedBox(height: 12.0)),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Your Rights',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Work Sans',
                                  color: Color(0xFFFFAA2E),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.underline,
                                ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              'Under the NDPR and the NDPA 2023, you have the right to:\n\n\t•\tThe right to access information concerning the personal data they have provided to a data controller or processor, without cost, unless public policy or other regulations require otherwise..\n\t•\tRectify inaccurate data.\n\t•\tErase your data.\n\t•\tRestrict or object to processing.\n\t•\tData portability.\n\t•\tWithdraw consent.\n\n•\tThe right to be informed about the collection and processing of their personal data.\n\t•\tThe right to raise a complaint or submit a request to a data controller or processor in order to exercise their legal rights.\n\t•\t The right to know the specifics of a data controller or processor.\n\t•\tThe right to access your personal data.\n\t•\tThe right to data portability.\n\t•\t The right to remediation of breach of your privacy rights.\n\t•\t The right to object to or limit the processing of their personal data.\n\t•\tThe right to be informed if your personal data is being processed for additional purposes beyond what was originally stated at the time of collection.\n\t•\t The right to be informed about the transfer of your personal data to another country.\n\t•\t The right to request deletion of your personal.\n\t•\t The right to submit a complaint to relevant authorities.',
                              textAlign: TextAlign.justify,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Oxygen',
                                    fontSize: 13.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ].divide(SizedBox(height: 12.0)),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Cookies',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Work Sans',
                                  color: Color(0xFFFFAA2E),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.underline,
                                ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              'Our app may use cookies to enhance user experience. You can choose to disable cookies through your device settings.',
                              textAlign: TextAlign.justify,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Oxygen',
                                    fontSize: 13.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ].divide(SizedBox(height: 12.0)),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Log Files and Data Collection',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Work Sans',
                                  color: Color(0xFFFFAA2E),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.underline,
                                ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              'Like many other online platforms, Resman Exchange utilizes log files. These files merely log visitors to the site or app – a standard procedure for hosting companies and a part of hosting services\' analytics.\n\nThe information inside the log files includes:\n\n- Internet Protocol (IP) addresses\n- Browser type and version\n- Internet Service Provider (ISP)\n- Date and time stamp\n- Referring and exit pages\n- Number of clicks\n- Device type and identification\n\nThis information is used to analyze trends, administer the site, track user\'s movement around the site, and gather demographic information. IP addresses and other such information are not linked to any personally identifiable information.',
                              textAlign: TextAlign.justify,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Oxygen',
                                    fontSize: 13.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ].divide(SizedBox(height: 12.0)),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Purpose of Log Files',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Work Sans',
                                  color: Color(0xFFFFAA2E),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.underline,
                                ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              'The data collected from log files is used for the following purposes:\n\n1. System Administration: To ensure that our platform functions optimally and to address any technical challenges.\n2. User Analysis: To understand user behavior and preferences, which aids in enhancing user experience.\n3. Security: To detect and prevent unauthorized access, breaches, or potential threats.\n4. Compliance: To adhere to regulatory requirements and assist in any legal investigations if necessary.\n',
                              textAlign: TextAlign.justify,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Oxygen',
                                    fontSize: 13.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ].divide(SizedBox(height: 12.0)),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Protection of Log Files',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Work Sans',
                                  color: Color(0xFFFFAA2E),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.underline,
                                ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              'All log file information is stored securely, and access is limited to authorized personnel only. We employ strict security measures to prevent unauthorized access, alteration, or disclosure of log file data.',
                              textAlign: TextAlign.justify,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Oxygen',
                                    fontSize: 13.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ].divide(SizedBox(height: 12.0)),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Third-Party Advertising Partners',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Work Sans',
                                  color: Color(0xFFFFAA2E),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.underline,
                                ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              'Resman Exchange may partner with third-party advertising companies to serve ads and/or collect certain information when you visit our platform. These companies may use cookies, web beacons, or other technologies to collect non-personally identifiable information (e.g., click stream information, browser type, time and date, subject of advertisements clicked or scrolled over) during your visits to our platform and other websites in order to provide advertisements about goods and services likely to be of greater interest to you.\n',
                              textAlign: TextAlign.justify,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Oxygen',
                                    fontSize: 13.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ].divide(SizedBox(height: 12.0)),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Understanding Third-Party Privacy Policies',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Work Sans',
                                  color: Color(0xFFFFAA2E),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.underline,
                                ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              'Our advertising partners have their own privacy policies that detail their practices and data collection methods. While we strive to partner with reputable companies, [Your Cryptocurrency Exchange App Name] does not have control over, nor are we responsible for, the privacy practices of our third-party advertisers or the content of their privacy policies.\n\nWe strongly encourage you to review the privacy policies of any third-party advertisers or ad networks partnered with Resman Exchange to understand their data collection and usage practices.\n',
                              textAlign: TextAlign.justify,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Oxygen',
                                    fontSize: 13.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ].divide(SizedBox(height: 12.0)),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Changes to Our Advertising Partners',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Work Sans',
                                  color: Color(0xFFFFAA2E),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.underline,
                                ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              'We may update our list of advertising partners from time to time. Any changes will be communicated to you via email or through our platform. We recommend checking this section periodically to stay informed about our current advertising partners and their practices.\n',
                              textAlign: TextAlign.justify,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Oxygen',
                                    fontSize: 13.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ].divide(SizedBox(height: 12.0)),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              'CCPA Privacy Rights (California Consumer Privacy Act)',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Work Sans',
                                    color: Color(0xFFFFAA2E),
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.underline,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              'If you are a resident of California, you have the following rights under the CCPA:\n\n1. Right to Know: You have the right to request that we disclose the categories and specific pieces of personal information we have collected about you, the sources of that information, our purposes for collecting it, and the categories of third parties with whom we have shared it.\n\n2. Right to Delete: You can request the deletion of personal information we have collected from you, subject to certain exceptions.\n\n3. Right to Opt-Out: You have the right to opt-out of the sale of your personal information to third parties.\n\n4. Right to Non-Discrimination: We will not discriminate against you for exercising any of your CCPA rights, such as by denying services, charging different prices or rates, or providing a different level or quality of services.\n\n5. Right to Designated Methods for Submitting Requests:You can exercise your rights through specifically provided methods such as a toll-free telephone number or a designated website.\n',
                              textAlign: TextAlign.justify,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Oxygen',
                                    fontSize: 13.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ].divide(SizedBox(height: 12.0)),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              'GDPR Data Protection Rights (General Data Protection Regulation)',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Work Sans',
                                    color: Color(0xFFFFAA2E),
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.underline,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              'If you are a resident of the European Economic Area (EEA), you have the following rights under the GDPR:\n\n1. Right to Access: You have the right to request copies of your personal data. We may charge you a small fee for this service.\n\n2. Right to Rectification: You have the right to request that we correct any information you believe is inaccurate. You also have the right to request that we complete information you believe is incomplete.\n\n3. Right to Erasure (\"Right to be Forgotten\"): You have the right to request that we erase your personal data, under certain conditions.\n\n4. Right to Restrict Processing: You have the right to request that we restrict the processing of your personal data, under certain conditions.\n\n5. Right to Data Portability: You have the right to request that we transfer the data that we have collected to another organization, or directly to you, under certain conditions.\n\n6. Right to Object: You have the right to object to our processing of your personal data, under certain conditions.\n\n7. Right to Lodge a Complaint: You have the right to lodge a complaint with a supervisory authority if you believe that our processing of your personal data infringes the GDPR.\n\n8. Right to Know about Automated Decision-making and Profiling: You have rights concerning automated decision-making and profiling, ensuring that decisions made without human intervention are fair, transparent, and comply with rights to data protection.\n',
                              textAlign: TextAlign.justify,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Oxygen',
                                    fontSize: 13.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ].divide(SizedBox(height: 12.0)),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              'Age Restriction',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Work Sans',
                                    color: Color(0xFFFFAA2E),
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.underline,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              'Resman Exchange is intended for use by individuals who are at least 18 years of age or older. We do not knowingly solicit or collect personal information from anyone under the age of 18 and no part of our platform is designed to attract anyone under the age of 18 years. If you are under the age of  18 years, please do not use or register on our platform.',
                              textAlign: TextAlign.justify,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Oxygen',
                                    fontSize: 13.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ].divide(SizedBox(height: 12.0)),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              'Changes to this Privacy Policy',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Work Sans',
                                    color: Color(0xFFFFAA2E),
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.underline,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              'We may update this Privacy Policy from time to time. Any changes will be communicated to you via email or through our app.',
                              textAlign: TextAlign.justify,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Oxygen',
                                    fontSize: 13.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ].divide(SizedBox(height: 12.0)),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              'Contact Us',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Work Sans',
                                    color: Color(0xFFFFAA2E),
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.underline,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              'For any questions or concerns regarding this Privacy Policy, please contact:\n\nOffice Address: Plot 250A, River Park Estate, Lugbe,Federal Capital Territory,Abuja.\nEmail: info@resmanexchange.com\nPhone: +2347025092488\n',
                              textAlign: TextAlign.justify,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Oxygen',
                                    fontSize: 13.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ].divide(SizedBox(height: 12.0)),
                  ),
                ].divide(SizedBox(height: 12.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
