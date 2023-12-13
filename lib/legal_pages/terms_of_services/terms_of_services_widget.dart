import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'terms_of_services_model.dart';
export 'terms_of_services_model.dart';

class TermsOfServicesWidget extends StatefulWidget {
  const TermsOfServicesWidget({Key? key}) : super(key: key);

  @override
  _TermsOfServicesWidgetState createState() => _TermsOfServicesWidgetState();
}

class _TermsOfServicesWidgetState extends State<TermsOfServicesWidget> {
  late TermsOfServicesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TermsOfServicesModel());

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
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.safePop();
                    },
                    child: Icon(
                      FFIcons.kcombinedShape,
                      color: Colors.white,
                      size: 15.0,
                    ),
                  ),
                  Text(
                    'Service agreement',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Oxygen',
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ].divide(SizedBox(width: 20.0)),
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
                        'Terms of Use for Resman Exchange',
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
                            child: Text(
                              'These Terms of Use (\"Terms\") govern the relationship between Resman Investment Limited  and you, the user (\"you\", \"your\", or \"user\"), in relation to your access to and use of the App and its associated services. ',
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
                              'Acceptance of Terms',
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
                              'By accessing or using Resman Exchange (\"the App\"), you agree to be bound by these Terms of Use (\"Terms\") and our privacy policy. If you disagree with any part of the Terms or privacy policy, then you may not access the App.',
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
                              'Registration',
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
                              'To use certain features of the App, you may be required to register for an account. You must provide accurate and complete information and keep your account information updated.',
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
                              'Use of Cookies',
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
                              'Resman Exchange uses cookies to enhance user experience, analyze platform usage, and support security features. Cookies are small text files stored on your device. By using our platform, you consent to our use of cookies. You can manage or disable cookies via your device or browser settings, but this may affect platform functionality. Changes to our cookie use will be communicated on our platform.\n',
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
                              'Privacy Policy',
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
                              'Your use of the App is also governed by our Privacy Policy, which can be found on our privacy policy page.',
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
                              'Transactions',
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
                              'The App allows you to buy, sell, and exchange cryptocurrencies. All transactions are final and cannot be reversed. Ensure you double-check all transaction details before confirming.',
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
                              'Fees',
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
                              'Resman Exchange may charge fees for using the App. These fees will be displayed prior to any transaction or service for which they apply.',
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
                              'Security',
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
                              'You are responsible for maintaining the confidentiality of your account and are fully responsible for all activities that occur under your account. Notify us immediately of any unauthorized use of your account\n',
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
                              'KYC Integration',
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
                              ' The app may integrate Know Your Customer (KYC) processes and procedures into the platform to enhance security and comply with regulatory requirements. Users acknowledge and agree to provide accurate and valid information during the KYC verification process. App name reserves the right to request additional documents or information to complete the KYC verification. Failure to comply with KYC requirements may result in account suspension or termination. Users understand that KYC integration is essential for ensuring the legitimacy and security of transactions on the platform, and they agree to cooperate fully with Resman Exchange during the KYC verification process.',
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
                              'No Financial Advice Provided',
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
                              'The content and services provided by Resman Exchange are for informational purposes only and do not constitute financial, investment, or other professional advice. Users should not rely on any information contained within the App to make investment or financial decisions. Before making any investment decision, it is recommended that you seek advice from a qualified financial or investment professional.\n\nResman Exchange does not endorse, recommend, or offer to buy or sell any specific securities or financial instruments. All transactions made based on information from the App are solely at your own risk.',
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
                              'Price Estimates',
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
                              'The prices of cryptocurrencies displayed on this app are provided for informational purposes only and may not reflect the actual market prices. Cryptocurrency prices are highly volatile and can change rapidly. Users should be aware that the displayed prices are estimates and should not be considered as real-time or accurate. Users are advised to conduct their own research and consult with financial professionals before making any trading decisions based on the price information provided on this app. Resman Investment Limited shall not be liable for any change in price or for any losses or damages incurred as a result of relying on the price estimates provided.',
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
                              'Customer Responsibility for Wallet Address',
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
                              'It is the customer’s responsibility to ensure the correct cryptocurrency wallet address has been used for transactions. Resman Investment Limited shall not be liable for any losses or damages incurred due to the use of incorrect or invalid wallet addresses. Users are strongly advised to double-check and verify the accuracy of the recipient wallet address before initiating any cryptocurrency transactions on this platform.\n',
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
                              'User Responsibility for Taxes',
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
                              'All financial transactions conducted through Resman Exchange may be subject to taxes in your jurisdiction. You are solely responsible for determining what, if any, taxes apply to the transactions you complete via the App, and for reporting and remitting the correct tax to the appropriate tax authority. Resman Exchange  is not responsible for determining the taxes that apply to your transactions.',
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
                              'Prohibited Activities On Resman Exchange',
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
                              'By using Resman Exchange, you agree not to engage in the following prohibited activities:\n\n1. Illegal Transactions: Using the App for transactions that are illegal under local, state, federal, or international law.\n \n2. Fraudulent Activities: Engaging in any deceptive practices, including providing false information, impersonating another user, or manipulating the App\'s functionalities for unfair gain.\n\n3. Market Manipulation: Engaging in any activities that artificially inflate or deflate the market, including pump-and-dump schemes, wash trading, or any other manipulative practices.\n\n4. Malicious Activities: Introducing viruses, worms, or other malicious software to the platform, or attempting to breach the platform\'s security measures.\n\n5. Unauthorized Access: Accessing another user\'s account without permission or attempting to gain unauthorized access to the App\'s backend systems.\n\n6. Harassment: Harassing, threatening, or causing distress or discomfort to any other user or the staff of Resman Exchange.\n\n7. Data Mining: Using automated systems or software to extract data from the App for commercial purposes, known as scraping, without prior consent.\n\n8. Reverse Engineering: Attempting to reverse engineer, decompile, or disassemble any part of the App.\n\n9. Reselling Services: Offering the services of [App Name] for resale without explicit permission.\n\n10. Violating Third-Party Rights:  Infringing upon the rights of third parties, including intellectual property rights, privacy rights, or any other rights.\n\nUsers found engaging in the above activities may have their accounts suspended or terminated, and may also be subject to legal action. \n',
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
                              'Limitation Of Liability',
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
                              'In no event shall Resman Exchange, its operating entities or any other affiliates (including their respective directors, members, employees or agents) be liable to you for any direct, indirect, special, consequential, exemplary or punitive damages or any other damages of any kind, including but not limited to loss of profit, loss of revenue, loss of business, loss of opportunity, loss of data, whether in contract, tort or otherwise, arising out of or in any way connected with your use of, inability to use, or unavailability of the Platform and/ or your Resman Exchange Account, including without limitation any damages caused by or resulting from any reliance upon any information received from Resman Exchange or that result from mistakes, omissions, interruptions, deletion of files or email, errors, defects, viruses, delays in operation or transmission or any failure of performance, whether or not resulting from a force majeure event, communications failure, theft, destruction or unauthorised access to Resman Exchange records, programmes or services.  THE foregoing does not affect any liability which cannot be excluded or limited under the applicable law.',
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
                              'Force Majeure',
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
                              'The Company will not be liable for any loss resulting from your use of the Platform, including, but not limited to, failure of electronic or mechanical equipment or communication lines, telephone or other interconnect problems, unauthorized access, the malfunction of electronic or mechanical equipment, personal computer and any lines thereto, theft, operator errors, or due to severe weather, earthquake, flood, fire or other acts of God, and strikes or other labour problems, or to any other cause beyond the reasonable control of the Company or the Platform.\n THE foregoing does not affect any liability which cannot be excluded or limited under the applicable law.',
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
                              'Anti-Money Laundering (AML) Policy for Resman Exchange',
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
                              'In compliance with the Nigerian Money Laundering (Prohibition) Act and the Central Bank of Nigeria\'s regulations on AML/CFT, Resman Exchange is committed to preventing money laundering and any activity that facilitates money laundering or the funding of terrorist or criminal activities.\n\n1. Customer Verification: We implement strict Know Your Customer (KYC) procedures to verify the identity of all users.\n \n2. Transaction Monitoring: All transactions are monitored for suspicious activities, and unusual or large transactions may be subject to further verification.\n\n3. Reporting: We are obligated to report suspicious transactions to the relevant Nigerian authorities without notifying the user involved.\n\n4. Record Keeping: Transaction records will be maintained for a minimum period as prescribed by Nigerian law to comply with any future investigations or audits.\n\n5. Training: Our staff undergo regular training to recognize signs of money laundering, terrorist financing, or other illicit activities.\n\nUsers found in violation of our AML policy may have their accounts suspended or terminated and may be reported to the relevant authorities.\n',
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
                              'Restriction',
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
                              'We reserve the right to restrict your access to certain features or parts of Resman Exchange if we believe you are misusing the platform or if we suspect any violation of these Terms of Use.\n',
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
                              'Suspension',
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
                              'Your access to Resman Exchange may be temporarily suspended if:\n\n- We detect suspicious or potentially harmful activity from your account.\n- You fail to respond to a critical communication or request from us.\n- You violate any of our policies or terms.\n\nDuring suspension, you may not be able to access your account, conduct transactions, or use other features of the App.',
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
                              'Termination',
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
                              'We reserve the right to terminate your account and access to Resman Exchange if:\n\n- You repeatedly violate these Terms of Use or any other policies.\n- We detect illegal, fraudulent, or malicious activity associated with your account.\n- We receive a valid legal request or order to do so.\n- You have been inactive for an extended period.\n\nUpon termination, you may lose access to all data, funds, and records associated with your account, and we may not be able to retrieve them.',
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
                              'Notice',
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
                              'We will make reasonable efforts to notify you before restricting, suspending, or terminating your account, unless we believe doing so may violate the law or create a risk of harm.',
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
                              'Appeals',
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
                              'If you believe your account has been unjustly restricted, suspended, or terminated, you can contact our support team to appeal the decision. We will review your appeal and provide a response within a reasonable timeframe.',
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
                              'Queries, Complaints, or Disputes',
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
                              'For any queries, complaints, or disputes, please contact our support team at info@resmanexchange.com. We aim to address and resolve issues promptly and fairly. Your satisfaction is our priority.',
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
                              'Severability',
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
                              'If any provision of these Terms is found to be invalid or unenforceable by a court, the remaining provisions will remain in full force and effect. The invalid provision will be deemed modified to the least extent necessary to make it valid and enforceable.\n',
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
                              'No Agency Relationship',
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
                              'Nothing in these Terms shall be construed to create an agency, partnership, joint venture, employee-employer, or franchisor-franchisee relationship between Resman Exchange and any user.',
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
                              'Waiver',
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
                              'Failure by Resman Exchange to enforce any provision of these Terms shall not be construed as a waiver of any provision or right. Any waiver of any term of these Terms must be in writing and signed by our authorized representative to be effective.',
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
                              'Changes',
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
                              'We reserve the right, at our sole discretion, to modify or replace these Terms at any time. We will try to provide at least 30 days notice prior to any new terms taking effect.\n',
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
                              'Governing Law',
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
                              'These Terms shall be governed by the laws of the Federal Republic of Nigeria, without regard to its conflict with laws of other states..',
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
                              'Mutual Representations and Warranties',
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
                              'Both Resman exchange and  Resman Investment Limited and the user represent and warrant that they have the full power and authority to enter into and perform under these Terms, and that their participation in the platform will not violate any agreement between them and any third party.\n',
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
                              'The Company\'s Representations and Warranties',
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
                              'The Company represents and warrants that it has the legal right and authority to operate the platform, and that its services, when used as intended, will not infringe upon the rights of any third party, including intellectual property rights.',
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
                              'Disclaimer',
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
                              'EXCEPT AS EXPRESSLY PROVIDED IN THESE TERMS, THE SERVICES OF RESMAN EXCHANGE ARE PROVIDED \"AS IS\" AND WITHOUT WARRANTIES OF ANY KIND, EITHER EXPRESS OR IMPLIED. TO THE FULLEST EXTENT PERMISSIBLE PURSUANT TO APPLICABLE LAW, THE COMPANY DISCLAIMS ALL WARRANTIES, EXPRESS OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.\n\nIF THE COMPANY IS PROVIDING PAYMENTS SERVICES PURSUANT TO THE AGREEMENT, THE COMPANY MAKES NO REPRESENTATIONS OR WARRANTIES REGARDING THE AMOUNT OF TIME NEEDED TO COMPLETE PAYMENT REQUESTS THROUGH THE PAYMENTS SERVICES, AS SUCH PAYMENTS ARE DEPENDENT UPON MANY FACTORS OUTSIDE OF THE COMPANY’S CONTROL, INCLUDING BUT NOT LIMITED TO PAYMENT SETTLEMENT TIMES, PAYMENT HOLDS, BANK INFRASTRUCTURE OUTAGES OR OTHER DELAYS IN THE BANKING SYSTEM AND BANK PAYMENT.',
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
                              'For any questions about these Terms, please contact us at info@resmanexchange.com',
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
