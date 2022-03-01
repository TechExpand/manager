import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../gigs/gigs_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class Payment1Widget extends StatefulWidget {
  const Payment1Widget({Key key}) : super(key: key);

  @override
  _Payment1WidgetState createState() => _Payment1WidgetState();
}

class _Payment1WidgetState extends State<Payment1Widget> {
  TextEditingController textController1;
  TextEditingController textController2;
  TextEditingController textController3;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1,
        decoration: BoxDecoration(
          color: Color(0xFFF1F5F8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  decoration: BoxDecoration(),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: textController1,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelStyle: GoogleFonts.getFont(
                              'DM Sans',
                              color: Color(0xFF82878C),
                              fontSize: 42,
                            ),
                            hintText: '\$ Amount',
                            hintStyle: GoogleFonts.getFont(
                              'DM Sans',
                              color: Color(0xFF8B97A2),
                              fontSize: 42,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            filled: true,
                            fillColor: Color(0x15000000),
                          ),
                          style: GoogleFonts.getFont(
                            'DM Sans',
                            color: Color(0xFF4B39EF),
                            fontSize: 42,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 70,
                  decoration: BoxDecoration(),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(24, 16, 24, 8),
                          child: TextFormField(
                            controller: textController2,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Businesss Name',
                              labelStyle: FlutterFlowTheme.of(context)
                                  .bodyText2
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF8B97A2),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                              hintText: 'Where did you spend the money?',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .bodyText2
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              filled: true,
                              fillColor: Color(0x15000000),
                              contentPadding:
                                  EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodyText2.override(
                                      fontFamily: 'Lexend Deca',
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 80,
                    decoration: BoxDecoration(),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(24, 2, 24, 24),
                            child: TextFormField(
                              controller: textController3,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Date',
                                labelStyle: FlutterFlowTheme.of(context)
                                    .bodyText2
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                hintText: 'When did you spend this?',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .bodyText2
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xA7000000),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                filled: true,
                                fillColor: Color(0x14000000),
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    20, 10, 0, 0),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText2
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xA7000000),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GigsWidget(),
                        ),
                      );
                    },
                    text: 'Complete Transaction',
                    options: FFButtonOptions(
                      width: 230,
                      height: 50,
                      color: Color(0xFF4B39EF),
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Lexend Deca',
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: 30,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
