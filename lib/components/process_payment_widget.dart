import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:manager/Service/Firebase_service.dart';
import 'package:manager/Widget/CustomCircular.dart';
import 'package:http/http.dart' as http;
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../subscribed/subscribed_widget.dart';
import 'package:flutter/material.dart';

class ProcessPaymentWidget extends StatefulWidget {
  String cardYear;
  String cardMonth;
  String cardNumber;
  String cvc;

  ProcessPaymentWidget(
      {this.cardYear, this.cardMonth, this.cardNumber, this.cvc});

  @override
  _ProcessPaymentWidgetState createState() => _ProcessPaymentWidgetState();
}

class _ProcessPaymentWidgetState extends State<ProcessPaymentWidget> {


  Future<dynamic> subscribe() async {
    var response = await http
        .post(Uri.parse('https://manger126.herokuapp.com/api/subscribe'), body: {
      'cardNumber': widget.cardNumber,
      'cardMonth': widget.cardMonth,
      'cardYear': widget.cardYear,
      'cvc': widget.cvc,
    }, headers: {
      // "Content-type": "application/json",
    });
    var body = json.decode(response.body);
    if(response.statusCode <= 300){
      print(body);
      print(body);
      if(body['message'] == "success"){
        FirebaseAuth user = FirebaseAuth.instance;
        String userid = user.currentUser==null?'':user.currentUser.uid;
        FirebaseApi.updateUserProfileSub(
          id: userid,
          subID: body['subID'],
          cusID: body['cusID'] ,
          cardID: body['cardID'],
        );
        Navigator.pop(context);
        await Navigator.pushAndRemoveUntil(
          context,
          PageTransition(
            type: PageTransitionType.fade,
            duration: Duration(milliseconds: 250),
            reverseDuration:
            Duration(milliseconds: 250),
            child: SubscribedWidget(widget.cardNumber),
          ),
              (r) => false,
        );
      }
    }else{
      Navigator.pop(context);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 300,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 6,
              color: Color(0x4B1A1F24),
              offset: Offset(0, 2),
            )
          ],
          gradient: LinearGradient(
            colors: [Color(0xFF00968A), Color(0xFFF2A384)],
            stops: [0, 1],
            begin: AlignmentDirectional(0.94, -1),
            end: AlignmentDirectional(-0.94, 1),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      Icons.credit_card_sharp,
                      color: Colors.white,
                      size: 30,
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                      child: Text(
                        'PAYMENT PROCESSING ${widget.cardYear}',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 24, 20, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Balance',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Lexend Deca',
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
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
                      '\$10.22',
                      style: FlutterFlowTheme.of(context).title1.override(
                            fontFamily: 'Lexend Deca',
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 30, 20, 20),
                child: Text(
                  'Monthly subscription payment notification will follow from Wingu Digtal  LLC',
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 2, 2, 2),
                child: FFButtonWidget(
                  onPressed: () async {
                    await showDialog(
                      context: context,
                      builder: (alertDialogContext) {
                        return AlertDialog(
                          content: Text('Confirm your subscription'),
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(alertDialogContext),
                              child: Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () async {
                                Navigator.pop(context);
                                circularCustom(context);
                                subscribe();
                                // Navigator.pop(alertDialogContext);
                                // await Navigator.pushAndRemoveUntil(
                                //   context,
                                //   PageTransition(
                                //     type: PageTransitionType.fade,
                                //     duration: Duration(milliseconds: 250),
                                //     reverseDuration:
                                //         Duration(milliseconds: 250),
                                //     child: SubscribedWidget(),
                                //   ),
                                //   (r) => false,
                                // );
                              },
                              child: Text('Confirm'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  text: 'SUBSCRIBE',
                  options: FFButtonOptions(
                    width: 130,
                    height: 40,
                    color: FlutterFlowTheme.of(context).primaryColor,
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                        ),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: 20,
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
