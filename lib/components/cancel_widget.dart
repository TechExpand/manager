import 'dart:convert';

import 'package:manager/Provider/utils.dart';
import 'package:manager/Widget/CustomCircular.dart';
import 'package:manager/payment_2/payment2_widget.dart';
import 'package:manager/profile/profile_widget.dart';
import 'package:provider/provider.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CancelWidget extends StatefulWidget {
  var data;
  var subID;
   CancelWidget(this.data, this.subID);

  @override
  _CancelWidgetState createState() => _CancelWidgetState();
}

class _CancelWidgetState extends State<CancelWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 40),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 340,
        decoration: BoxDecoration(
          color: Color(0xFFF1F5F8),
          boxShadow: [
            BoxShadow(
              blurRadius: 6,
              color: Color(0x4B1A1F24),
              offset: Offset(0, 2),
            )
          ],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  shape: BoxShape.rectangle,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              'assets/images/logo.png',
                              width: 74,
                              height: 74,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Managr Subscription',
                              style: FlutterFlowTheme.of(context)
                                  .subtitle1
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF111417),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                              child: Text(
                                ' Monthly',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF090F13),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 16, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            '9.99\$',
                                            style: FlutterFlowTheme.of(context)
                                                .subtitle1
                                                .override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: Color(0xFF151B1E),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      Icons.credit_card_sharp,
                      color: Color(0xFF232323),
                      size: 30,
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                      child: Text(
                        'SUBSCRIPTION STATUS',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              color: Color(0xFF232323),
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 8, 20, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      widget.data=="active"?'SUBSCRIBED':"UNSUBSCRIBED",
                      style: FlutterFlowTheme.of(context).title1.override(
                            fontFamily: 'Lexend Deca',
                            color: Color(0xFF1FBA00),
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ],
                ),
              ),
              // Padding(
              //   padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
              //   child: Row(
              //     mainAxisSize: MainAxisSize.max,
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Text(
              //         '**** 0149',
              //         style: FlutterFlowTheme.of(context).bodyText1.override(
              //               fontFamily: 'Roboto Mono',
              //               color: Color(0xFF232323),
              //               fontSize: 14,
              //               fontWeight: FontWeight.normal,
              //             ),
              //       ),
              //       Text(
              //         '05/25',
              //         style: FlutterFlowTheme.of(context).bodyText1.override(
              //               fontFamily: 'Roboto Mono',
              //               color: Color(0xFF232323),
              //               fontSize: 14,
              //               fontWeight: FontWeight.normal,
              //             ),
              //       ),
              //       Column(
              //         mainAxisSize: MainAxisSize.max,
              //         children: [
              //           Padding(
              //             padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
              //             child: Row(
              //               mainAxisSize: MainAxisSize.max,
              //               mainAxisAlignment: MainAxisAlignment.center,
              //               children: [
              //                 Container(
              //                   width: 200,
              //                   height: 120,
              //                   decoration: BoxDecoration(
              //                     borderRadius: BorderRadius.circular(12),
              //                   ),
              //                   child: Card(
              //                     clipBehavior: Clip.antiAliasWithSaveLayer,
              //                     color: Color(0xFF4B39EF),
              //                     elevation: 6,
              //                     shape: RoundedRectangleBorder(
              //                       borderRadius: BorderRadius.circular(8),
              //                     ),
              //                     child: Stack(
              //                       children: [
              //                         Align(
              //                           alignment:
              //                               AlignmentDirectional(-0.8, -0.65),
              //                           child: SvgPicture.asset(
              //                             'assets/images/AmosBank.svg',
              //                             width: 170,
              //                             height: 24,
              //                             fit: BoxFit.fitHeight,
              //                           ),
              //                         ),
              //                         Align(
              //                           alignment:
              //                               AlignmentDirectional(-0.8, 0.55),
              //                           child: Text(
              //                             'Andrew Daniels',
              //                             textAlign: TextAlign.start,
              //                             style: FlutterFlowTheme.of(context)
              //                                 .bodyText1
              //                                 .override(
              //                                   fontFamily: 'Lexend Deca',
              //                                   color: Colors.white,
              //                                   fontSize: 14,
              //                                   fontWeight: FontWeight.w600,
              //                                 ),
              //                           ),
              //                         ),
              //                         Align(
              //                           alignment:
              //                               AlignmentDirectional(-0.8, 0.8),
              //                           child: Text(
              //                             '•••• •••• •••• 0149',
              //                             style: FlutterFlowTheme.of(context)
              //                                 .bodyText1
              //                                 .override(
              //                                   fontFamily: 'Lexend Deca',
              //                                   color: Color(0x7EFFFFFF),
              //                                   fontSize: 14,
              //                                   fontWeight: FontWeight.normal,
              //                                 ),
              //                           ),
              //                         ),
              //                         Align(
              //                           alignment:
              //                               AlignmentDirectional(0.8, 0.65),
              //                           child: SvgPicture.asset(
              //                             'assets/images/masterCard.svg',
              //                             width: 60,
              //                             height: 30,
              //                             fit: BoxFit.fitHeight,
              //                           ),
              //                         ),
              //                       ],
              //                     ),
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ),
              //           Padding(
              //             padding: EdgeInsetsDirectional.fromSTEB(16, 4, 0, 0),
              //             child: Row(
              //               mainAxisSize: MainAxisSize.max,
              //               children: [
              //                 Text(
              //                   'May 4th, 4:49pm - 2021',
              //                   style: FlutterFlowTheme.of(context)
              //                       .subtitle1
              //                       .override(
              //                         fontFamily: 'Lexend Deca',
              //                         color: Color(0xFF232323),
              //                         fontSize: 15,
              //                         fontWeight: FontWeight.w500,
              //                       ),
              //                 ),
              //               ],
              //             ),
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 100, 0, 0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 40, 0),
                    child: InkWell(
                      onTap:  widget.data=="active"?() async {
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: Text('Cancel my subscription'),
                              content: Text('Are you sure?'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: Text('No'),
                                ),
                                TextButton(
                                  onPressed: () async {
                                    // Navigator.pop(alertDialogContext);
                                    // await Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) => LoginWidget(),
                                    //   ),
                                    // );
                                    Future<dynamic> deleteSubScription() async {
                                      var response = await http
                                          .delete(Uri.parse('https://manger126.herokuapp.com/api/subscribe/${widget.subID}'), headers: {
                                        // "Content-type": "application/json",
                                        // 'Authorization': 'Bearer $bearer',
                                      });
                                      var body = json.decode(response.body);
                                      if(response.statusCode >= 400){
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                        Navigator.pushReplacement(context, SlideRightRoute(page: ProfileWidget()));
                                      }else{
                                        var utils = Provider.of<Utils>(context, listen: false);
                                        utils.setStatus('canceled');
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                        Navigator.pushReplacement(context, SlideRightRoute(page: ProfileWidget()));
                                      }
                                    }
                                    Navigator.pop(context);
                                    circularCustom(context);
                                    deleteSubScription();
                                  },
                                  child: Text('Yes , Cancel the subscription'),
                                ),
                              ],
                            );
                          },
                        );
                      }:(){
                        Navigator.push(context, SlideRightRoute(page: Payment2Widget()));
                      },
                      child: Text(
                        widget.data=="active"?'Cancel':"Activate",
                        textAlign: TextAlign.end,
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class SlideRightRoute extends PageRouteBuilder {
  final Widget page;
  SlideRightRoute({this.page})
      : super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    page,
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(-1, 0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        ),
  );
}