import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/scheduler.dart';
import 'package:manager/AdminGid/GidList.dart';
import 'package:manager/Provider/utils.dart';
import 'package:manager/Service/Firebase_service.dart';
import 'package:manager/components/cancel_widget.dart';
import 'package:manager/components/process_payment_widget.dart';
import 'package:manager/intro/intro_widget.dart';
import 'package:manager/profile_detail/profile_detail_widget.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({Key key}) : super(key: key);

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController textController1;
  TextEditingController textController2;
String id = "";



  var profile;

  @override
  void initState(){
    super.initState();
   profile =  FirebaseApi.getUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    FirebaseAuth user = FirebaseAuth.instance;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF1F4F8),
      drawer: Drawer(
        elevation: 16,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 304,
                  height: 180,
                  decoration: BoxDecoration(
                    color: Color(0xFF4B39EF),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-0.7, 0),
                                child: Container(
                                  width: 80,
                                  height: 80,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(
                                    'assets/images/UI_avatar@2x.png',
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(0.7, 0),
                                  child: InkWell(
                                    onTap: () async {
                                      if (scaffoldKey
                                          .currentState.isDrawerOpen ||
                                          scaffoldKey
                                              .currentState.isEndDrawerOpen) {
                                        Navigator.pop(context);
                                          FirebaseApi.updateUserProfile(
                                                            id: id.toString(),
                                                            name:  textController1.text==null?"":textController1.text,
                                            urlAvatar: '',
                                            email:  textController2.text==null?"":textController2.text,
                                                          );
                                      }
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Settings Saved',
                                            style: TextStyle(),
                                          ),
                                          duration: Duration(milliseconds: 850),
                                          backgroundColor: Color(0xFF1FBA00),
                                        ),
                                      );
                                    },
                                    child: Icon(
                                      Icons.check_circle,
                                      color: Colors.white,
                                      size: 24,
                                    ),
                                  ),
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
                                textController1==null?"":textController1.text,
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
                                textController2==null?"":textController2.text,
                                style: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xFFEE8B60),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
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
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(),
                        child: Text(
                          'User Name',
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: TextFormField(
                        controller: textController1,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: 'UserName',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          filled: true,
                          fillColor: Color(0xFFEEEEEE),
                        ),
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(),
                        child: Text(
                          'Email Address',
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: TextFormField(
                        enabled: false,
                        controller: textController2,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: 'User@blah.com',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          filled: true,
                          fillColor: Color(0xFFEEEEEE),
                        ),
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF4B39EF), Color(0xFFEE8B60)],
            stops: [0, 1],
            begin: AlignmentDirectional(1, -0.87),
            end: AlignmentDirectional(-1, 0.87),
          ),
        ),
        child: StreamBuilder(
            stream: profile,
            builder: (context,AsyncSnapshot<QuerySnapshot> snapshot) {
              return   snapshot.connectionState==ConnectionState.waiting?
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Container(
                    width: 23,
                    height: 23,
                    child: const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.white,
                      ),
                    ),
                  ),
                ),
              ): snapshot.hasData?Builder(
                builder: (context) {
                  var utils = Provider.of<Utils>(context, listen: true);
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 380,
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Stack(
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(0, 0),
                                              child: Image.asset(
                                                'assets/images/logo.png',
                                                width:
                                                MediaQuery.of(context).size.width * 2,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(0, 0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(
                                                    0, 105, 0, 0),
                                                child: Container(
                                                  width: 80,
                                                  height: 80,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Image.asset(
                                                    'assets/images/UI_avatar@2x.png',
                                                  ),
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding:
                                        EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                        child: Text(
                                          snapshot.data.docs[0]['name'],
                                          style: FlutterFlowTheme.of(context)
                                              .title1
                                              .override(
                                            fontFamily: 'Lexend Deca',
                                            color: Colors.white,
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding:
                                        EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                                        child: Text(
                                          snapshot.data.docs[0]['email'],
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

                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(24, 12, 0, 12),
                              child: Text(
                                'Account Settings',
                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                  fontFamily: 'Lexend Deca',
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ],
                        ),
                        ListView(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          children: [

                            InkWell(
                              onTap: (){
                                // Navigator.push(context, MaterialPageRoute(
                                //     builder: (context) {
                                //       return ProfileDetailWidget(
                                //           data:snapshot.data.docs[0]);
                                //     }));
                                setState(() {
                                  id = snapshot.data.docs[0]['id'];
                                  textController1 = TextEditingController(text: snapshot.data.docs[0]['name']);
                                  textController2 = TextEditingController(text: snapshot.data.docs[0]['email']);
                                });


                                scaffoldKey.currentState.openDrawer();
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Color(0x1CFFFFFF),
                                      shape: BoxShape.rectangle,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                          child: Icon(
                                            Icons.settings_rounded,
                                            color: Colors.white,
                                            size: 24,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                          child: Text(
                                            'My Profile Settings',
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
                                        Expanded(
                                          child: Align(
                                            alignment: AlignmentDirectional(0.9, 0),
                                            child: Icon(
                                              Icons.arrow_forward_ios,
                                              color: Colors.white,
                                              size: 18,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () async{
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (context) {
                                    return Padding(
                                      padding: MediaQuery.of(context).viewInsets,
                                      child: CancelWidget(utils.status, snapshot.data.docs[0]['subID']),
                                    );
                                  },
                                );
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Color(0x1CFFFFFF),
                                      shape: BoxShape.rectangle,
                                      border: Border.all(
                                        width: 2,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                          child: Icon(
                                            Icons.attach_money_outlined,
                                            color: Colors.white,
                                            size: 24,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                          child: Text(
                                            'Subscription',
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
                                        Expanded(
                                          child: Align(
                                            alignment: AlignmentDirectional(0.9, 0),
                                            child: Icon(
                                              Icons.arrow_forward_ios,
                                              color: Colors.white,
                                              size: 18,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return GigList();
                                    }));
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Color(0x1CFFFFFF),
                                      shape: BoxShape.rectangle,
                                      border: Border.all(
                                        width: 1,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                          child: FaIcon(
                                            Icons.admin_panel_settings_outlined,
                                            color: Colors.white,
                                            size: 24,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                          child: Text(
                                            'Admin',
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
                                        Expanded(
                                          child: Align(
                                            alignment: AlignmentDirectional(0.9, 0),
                                            child: Icon(
                                              Icons.arrow_forward_ios,
                                              color: Colors.white,
                                              size: 18,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            InkWell(
                              onTap: (){
                                FirebaseAuth user = FirebaseAuth.instance;
                                user.signOut();
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return IntroWidget();
                                    }));
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Color(0x1CFFFFFF),
                                      shape: BoxShape.rectangle,
                                      border: Border.all(
                                        width: 1,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                          child: FaIcon(
                                            Icons.logout,
                                            color: Colors.white,
                                            size: 24,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                          child: Text(
                                            'Logout',
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
                                        Expanded(
                                          child: Align(
                                            alignment: AlignmentDirectional(0.9, 0),
                                            child: Icon(
                                              Icons.arrow_forward_ios,
                                              color: Colors.white,
                                              size: 18,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),


                            // Row(
                            //   mainAxisSize: MainAxisSize.max,
                            //   children: [
                            //     Container(
                            //       width: MediaQuery.of(context).size.width,
                            //       height: 50,
                            //       decoration: BoxDecoration(
                            //         color: Colors.white,
                            //         shape: BoxShape.rectangle,
                            //         border: Border.all(
                            //           color: Color(0xFFEFEFEF),
                            //           width: 1,
                            //         ),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                          ],
                        ),
                      ],
                    ),
                  );
                }
              ):Center(child: Text('No Data'));
            }
        )
      ),
    );
  }
}