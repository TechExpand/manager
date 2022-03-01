import 'package:manager/model/Gigs.dart';

import '../components/questions_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_radio_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class GigPageWidget extends StatefulWidget {
  GigsModel data;
   GigPageWidget({
    Key key,
    this.question1ansswer,
    this.data
  }) : super(key: key);

  final String question1ansswer;

  @override
  _GigPageWidgetState createState() => _GigPageWidgetState();
}

class _GigPageWidgetState extends State<GigPageWidget> {
  String radioButtonValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              FlutterFlowTheme.of(context).primaryColor,
              Color(0xFFF08A1F)
            ],
            stops: [0, 1],
            begin: AlignmentDirectional(0, -1),
            end: AlignmentDirectional(0, 1),
          ),
        ),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 220,
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 50, 20, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: Color(0x1CFFFFFF),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      2, 2, 2, 2),
                                  child: FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30,
                                    buttonSize: 46,
                                    icon: Icon(
                                      Icons.arrow_back_ios_rounded,
                                      color: Color(0xFF4B39EF),
                                      size: 16,
                                    ),
                                    onPressed: () async {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                child: Text(
                                  'Gig Detail',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  widget.data.gigTitle,
                                  style: FlutterFlowTheme.of(context)
                                      .title3
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  '${widget.data.shortlocation} | ${DateTime.parse(widget.data.postTime).day.toString()+"/"+DateTime.parse(widget.data.postTime).month.toString()+"/"+DateTime.parse(widget.data.postTime).year.toString()}',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 190, 0, 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height*0.8,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4,
                            color: Color(0x5B000000),
                            offset: Offset(0, -2),
                          )
                        ],
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width:50,
                                  height: 50,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.network(
                                    widget.data.managerPicture,
                                    fit: BoxFit.cover,
                                  ),
                                ),

                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12, 0, 0, 0),
                                    child: Text(
                                      widget.data.managerName,
                                      textAlign: TextAlign.end,
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle1
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: Color(0xFF151B1E),
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Color(0xFFDBE2E7),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 12, 20, 12),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 90,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFDBE2E7),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 0, 12),
                                                child: Text(
                                                  'Salary',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText2
                                                      .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color:
                                                            Color(0xFF8B97A2),
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 0, 12),
                                                child: Text(
                                                  'Date',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText2
                                                      .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color:
                                                            Color(0xFF8B97A2),
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                ),
                                              ),
                                              Text(
                                                'Location',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText2
                                                    .override(
                                                      fontFamily: 'Lexend Deca',
                                                      color: Color(0xFF8B97A2),
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(8, 0, 0, 12),
                                                child: Text(
                                                  '\$${widget.data.salary}',
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color:
                                                            Color(0xFF090F13),
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(8, 0, 0, 12),
                                                child: Text(
                                                  widget.data.date,
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color:
                                                            Color(0xFF090F13),
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(8, 0, 0, 0),
                                                child: Text(
                                                  widget.data.location,
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color:
                                                            Color(0xFF090F13),
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
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
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Color(0xFFDBE2E7),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 12, 20, 12),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 90,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFDBE2E7),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 0, 12),
                                                child: Text(
                                                  'Details',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText2
                                                      .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color:
                                                            Color(0xFF8B97A2),
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(8, 0, 0, 0),
                                                child: Text(
                                                  widget.data.gigDescription,
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color:
                                                            Color(0xFF090F13),
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
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
                          Padding(
                            padding: const EdgeInsets.all(17.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text('Contact:',  style: FlutterFlowTheme.of(
                                  context)
                                  .bodyText2
                                  .override(
                                fontFamily:
                                'Lexend Deca',
                                color:
                                Colors.black,
                                fontSize: 16,
                                fontWeight:
                                FontWeight.bold,
                              ),),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(20, 5, 20, 4),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Color(0xFFDBE2E7),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 12, 20, 12),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Color(0xFFDBE2E7),
                                          ),
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding:
                                                EdgeInsets.only(left:12.0, right: 8),
                                                child: Icon(Icons.account_box_outlined,
                                                  color: Colors.black, size: 37,),
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsetsDirectional
                                                        .fromSTEB(0, 0, 0, 0),
                                                    child: Text(
                                                        widget.data.contactName,
                                                      style: FlutterFlowTheme.of(
                                                          context)
                                                          .bodyText2
                                                          .override(
                                                        fontFamily:
                                                        'Lexend Deca',
                                                        color:
                                                        Color(0xFF8B97A2),
                                                        fontSize: 16,
                                                        fontWeight:
                                                        FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsetsDirectional
                                                        .fromSTEB(0, 0, 0, 0),
                                                    child: Text(
                                                        widget.data.contactCompany,
                                                      style: FlutterFlowTheme.of(
                                                          context)
                                                          .bodyText2
                                                          .override(
                                                        fontFamily:
                                                        'Lexend Deca',
                                                        color:
                                                        Color(0xFF8B97A2),
                                                        fontSize: 16,
                                                        fontWeight:
                                                        FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsetsDirectional
                                                        .fromSTEB(0, 0, 0, 0),
                                                    child: Text(
                                                        widget.data.contactMail,
                                                      style: FlutterFlowTheme.of(
                                                          context)
                                                          .bodyText2
                                                          .override(
                                                        fontFamily:
                                                        'Lexend Deca',
                                                        color:
                                                        Color(0xFF8B97A2),
                                                        fontSize: 16,
                                                        fontWeight:
                                                        FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ],
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
                          // Padding(
                          //   padding:
                          //       EdgeInsetsDirectional.fromSTEB(20, 12, 20, 12),
                          //   child: Row(
                          //     mainAxisSize: MainAxisSize.max,
                          //     mainAxisAlignment: MainAxisAlignment.start,
                          //     children: [
                          //       Expanded(
                          //         child: Text(
                          //           'Employer Specific Questions',
                          //           textAlign: TextAlign.start,
                          //           style: FlutterFlowTheme.of(context)
                          //               .bodyText1
                          //               .override(
                          //                 fontFamily: 'Lexend Deca',
                          //                 color: Color(0xFF090F13),
                          //                 fontSize: 14,
                          //                 fontWeight: FontWeight.normal,
                          //               ),
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),


                         // Column(
                         //   children: [
                         //     Builder(builder: (context){
                         //       List<Widget> newQuestion = [];
                         //       for(var value in widget.data.question){
                         //         newQuestion.add(
                         //           Padding(
                         //             padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                         //             child: Container(
                         //               width: MediaQuery.of(context).size.width * 0.9,
                         //               decoration: BoxDecoration(
                         //                 color: Color(0xFFDBE2E7),
                         //                 borderRadius: BorderRadius.circular(8),
                         //               ),
                         //               child: Column(
                         //                 mainAxisSize: MainAxisSize.max,
                         //                 children: [
                         //                   Padding(
                         //                     padding: EdgeInsetsDirectional.fromSTEB(
                         //                         0, 8, 20, 8),
                         //                     child: Row(
                         //                       mainAxisSize: MainAxisSize.max,
                         //                       mainAxisAlignment:
                         //                       MainAxisAlignment.center,
                         //                       children: [
                         //                         Container(
                         //                           width: 40,
                         //                           decoration: BoxDecoration(
                         //                             color: Color(0xFFDBE2E7),
                         //                           ),
                         //                           child: Column(
                         //                             mainAxisSize: MainAxisSize.max,
                         //                             mainAxisAlignment:
                         //                             MainAxisAlignment.center,
                         //                             crossAxisAlignment:
                         //                             CrossAxisAlignment.end,
                         //                             children: [
                         //                               Padding(
                         //                                 padding: EdgeInsetsDirectional
                         //                                     .fromSTEB(0, 12, 0, 12),
                         //                                 child: Text(
                         //                                   'Q.',
                         //                                   style: FlutterFlowTheme.of(
                         //                                       context)
                         //                                       .title1
                         //                                       .override(
                         //                                     fontFamily:
                         //                                     'Lexend Deca',
                         //                                     color:
                         //                                     Color(0xFF090F13),
                         //                                     fontSize: 24,
                         //                                     fontWeight:
                         //                                     FontWeight.bold,
                         //                                   ),
                         //                                 ),
                         //                               ),
                         //                             ],
                         //                           ),
                         //                         ),
                         //                         Expanded(
                         //                           child: Column(
                         //                             mainAxisSize: MainAxisSize.max,
                         //                             mainAxisAlignment:
                         //                             MainAxisAlignment.center,
                         //                             crossAxisAlignment:
                         //                             CrossAxisAlignment.start,
                         //                             children: [
                         //                               Padding(
                         //                                 padding: EdgeInsetsDirectional
                         //                                     .fromSTEB(8, 0, 0, 0),
                         //                                 child: Text(
                         //                                   value,
                         //                                   textAlign: TextAlign.start,
                         //                                   style: FlutterFlowTheme.of(
                         //                                       context)
                         //                                       .bodyText2
                         //                                       .override(
                         //                                     fontFamily:
                         //                                     'Lexend Deca',
                         //                                     color:
                         //                                     Color(0xFF8B97A2),
                         //                                     fontSize: 14,
                         //                                     fontWeight:
                         //                                     FontWeight.w300,
                         //                                   ),
                         //                                 ),
                         //                               ),
                         //                               Padding(
                         //                                 padding: EdgeInsetsDirectional
                         //                                     .fromSTEB(8, 0, 0, 0),
                         //                                 child: Text(
                         //                                   FFAppState().question1answer,
                         //                                   textAlign: TextAlign.start,
                         //                                   style: FlutterFlowTheme.of(
                         //                                       context)
                         //                                       .bodyText2
                         //                                       .override(
                         //                                     fontFamily:
                         //                                     'Lexend Deca',
                         //                                     color: const Color(0xFF05A67E),
                         //                                     fontSize: 14,
                         //                                     fontWeight:
                         //                                     FontWeight.w300,
                         //                                   ),
                         //                                 ),
                         //                               ),
                         //                             ],
                         //                           ),
                         //                         ),
                         //                       ],
                         //                     ),
                         //                   ),
                         //                 ],
                         //               ),
                         //             ),
                         //           ),
                         //         );
                         //       }
                         //  return Wrap(
                         //    direction: Axis.vertical,
                         //    children:  newQuestion.map<Widget>((e) => e).toSet().toList(),
                         //  );
                         //     })
                         //   ],
                         // ),

                          // Padding(
                          //   padding:
                          //       EdgeInsetsDirectional.fromSTEB(0, 4, 0, 12),
                          //   child: Container(
                          //     width: MediaQuery.of(context).size.width * 0.9,
                          //     height: 40,
                          //     decoration: BoxDecoration(
                          //       color: Color(0xFFEEEEEE),
                          //     ),
                          //     child: FFButtonWidget(
                          //       onPressed: () {
                          //         print('Button pressed ...');
                          //       },
                          //       text: 'Upload Answer',
                          //       options: FFButtonOptions(
                          //         width: double.infinity,
                          //         height: 40,
                          //         color: Color(0xFF4B39EF),
                          //         textStyle: FlutterFlowTheme.of(context)
                          //             .subtitle2
                          //             .override(
                          //               fontFamily: 'Lexend Deca',
                          //               color: Colors.white,
                          //               fontSize: 16,
                          //               fontWeight: FontWeight.w500,
                          //             ),
                          //         borderSide: BorderSide(
                          //           color: Colors.transparent,
                          //           width: 1,
                          //         ),
                          //         borderRadius: 8,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // FlutterFlowRadioButton(
                          //   options: [
                          //     'Send Pitch Video Along with Application'
                          //   ],
                          //   onChanged: (value) {
                          //     setState(() => radioButtonValue = value);
                          //   },
                          //   optionHeight: 25,
                          //   textStyle:
                          //       FlutterFlowTheme.of(context).bodyText1.override(
                          //             fontFamily: 'Lexend Deca',
                          //             color: Color(0xFF4B39EF),
                          //             fontSize: 14,
                          //             fontWeight: FontWeight.normal,
                          //           ),
                          //   selectedTextStyle:
                          //       FlutterFlowTheme.of(context).subtitle2.override(
                          //             fontFamily: 'Lexend Deca',
                          //             color: Color(0xFF151B1E),
                          //             fontSize: 13,
                          //             fontWeight: FontWeight.w500,
                          //           ),
                          //   buttonPosition: RadioButtonPosition.left,
                          //   direction: Axis.vertical,
                          //   radioButtonColor: Color(0xFF4B39EF),
                          //   inactiveRadioButtonColor: Color(0xFF95A1AC),
                          //   toggleable: false,
                          //   horizontalAlignment: WrapAlignment.start,
                          //   verticalAlignment: WrapCrossAlignment.start,
                          // ),
                          // Padding(
                          //   padding:
                          //       EdgeInsetsDirectional.fromSTEB(0, 24, 0, 36),
                          //   child: Container(
                          //     width: MediaQuery.of(context).size.width * 0.9,
                          //     height: 60,
                          //     decoration: BoxDecoration(
                          //       color: Color(0xFFEEEEEE),
                          //     ),
                          //     child: FFButtonWidget(
                          //       onPressed: () async {
                          //         await showDialog(
                          //           context: context,
                          //           builder: (alertDialogContext) {
                          //             return AlertDialog(
                          //               content: Text('SENT!'),
                          //               actions: [
                          //                 TextButton(
                          //                   onPressed: () => Navigator.pop(
                          //                       alertDialogContext),
                          //                   child: Text('Ok'),
                          //                 ),
                          //               ],
                          //             );
                          //           },
                          //         );
                          //       },
                          //       text: 'Apply Now',
                          //       options: FFButtonOptions(
                          //         width: double.infinity,
                          //         height: 40,
                          //         color: Color(0xFF4B39EF),
                          //         textStyle: FlutterFlowTheme.of(context)
                          //             .subtitle2
                          //             .override(
                          //               fontFamily: 'Lexend Deca',
                          //               color: Colors.white,
                          //               fontSize: 16,
                          //               fontWeight: FontWeight.w500,
                          //             ),
                          //         elevation: 3,
                          //         borderSide: BorderSide(
                          //           color: Colors.transparent,
                          //           width: 1,
                          //         ),
                          //         borderRadius: 8,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
