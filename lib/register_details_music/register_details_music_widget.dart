// import '../auth/auth_util.dart';
// import '../backend/backend.dart';
// import '../backend/firebase_storage/storage.dart';
// import '../flutter_flow/flutter_flow_icon_button.dart';
// import '../flutter_flow/flutter_flow_theme.dart';
// import '../flutter_flow/flutter_flow_util.dart';
// import '../flutter_flow/flutter_flow_widgets.dart';
// import '../flutter_flow/upload_media.dart';
// import '../payment_2/payment2_widget.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
//
// class RegisterDetailsMusicWidget extends StatefulWidget {
//   const RegisterDetailsMusicWidget({Key key}) : super(key: key);
//
//   @override
//   _RegisterDetailsMusicWidgetState createState() =>
//       _RegisterDetailsMusicWidgetState();
// }
//
// class _RegisterDetailsMusicWidgetState
//     extends State<RegisterDetailsMusicWidget> {
//   PageController pageViewController;
//   TextEditingController textController1;
//   TextEditingController textController2;
//   TextEditingController textController3;
//   TextEditingController textController4;
//   String uploadedFileUrl = '';
//   final scaffoldKey = GlobalKey<ScaffoldState>();
//
//   @override
//   void initState() {
//     super.initState();
//     textController1 = TextEditingController();
//     textController2 = TextEditingController();
//     textController3 = TextEditingController();
//     textController4 = TextEditingController();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: scaffoldKey,
//       backgroundColor: Colors.white,
//       body: WillPopScope(
//         onWillPop: (){
//         },
//         child: Container(
//           width: MediaQuery.of(context).size.width,
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Color(0xFF4B39EF), Color(0xFFEE8B60)],
//               stops: [0, 1],
//               begin: AlignmentDirectional(1, -0.77),
//               end: AlignmentDirectional(-1, 0.77),
//             ),
//           ),
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisSize: MainAxisSize.max,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Row(
//                   mainAxisSize: MainAxisSize.max,
//                   children: [
//                     Padding(
//                       padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
//                       child: Container(
//                         width: MediaQuery.of(context).size.width,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(0),
//                         ),
//                         child: Column(
//                           mainAxisSize: MainAxisSize.max,
//                           children: [
//                             Row(
//                               mainAxisSize: MainAxisSize.max,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Expanded(
//                                   child: Stack(
//                                     children: [
//                                       Align(
//                                         alignment: AlignmentDirectional(0, 0),
//                                         child: Image.asset(
//                                           'assets/images/card_header@2x.png',
//                                           width:
//                                               MediaQuery.of(context).size.width,
//                                           height: 230,
//                                           fit: BoxFit.cover,
//                                         ),
//                                       ),
//                                       Align(
//                                         alignment: AlignmentDirectional(0, 0),
//                                         child: Container(
//                                           width:
//                                               MediaQuery.of(context).size.width,
//                                           height: 230,
//                                           decoration: BoxDecoration(
//                                             color: Color(0x77090F13),
//                                           ),
//                                           child: Column(
//                                             mainAxisSize: MainAxisSize.max,
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.center,
//                                             children: [
//                                               FlutterFlowIconButton(
//                                                 borderColor: Colors.transparent,
//                                                 borderRadius: 30,
//                                                 buttonSize: 48,
//                                                 icon: Icon(
//                                                   Icons.photo_camera,
//                                                   color: Colors.white,
//                                                   size: 30,
//                                                 ),
//                                                 onPressed: () {
//                                                   print('IconButton pressed ...');
//                                                 },
//                                               ),
//                                               Text(
//                                                 'Change Cover Photo',
//                                                 style: GoogleFonts.getFont(
//                                                   'DM Sans',
//                                                   color: Colors.white,
//                                                   fontWeight: FontWeight.w500,
//                                                   fontSize: 10,
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             Padding(
//                               padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
//                               child: Text(
//                                 'Edit Image',
//                                 style: GoogleFonts.getFont(
//                                   'DM Sans',
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.w500,
//                                   fontSize: 10,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Padding(
//                   padding: EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
//                   child: Container(
//                     width: MediaQuery.of(context).size.width,
//                     height: MediaQuery.of(context).size.height * 0.7,
//                     decoration: BoxDecoration(),
//                     child: Container(
//                       width: MediaQuery.of(context).size.width,
//                       height: MediaQuery.of(context).size.height * 1,
//                       child: Stack(
//                         children: [
//                           Padding(
//                             padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
//                             child: PageView(
//                               controller: pageViewController ??=
//                                   PageController(initialPage: 0),
//                               scrollDirection: Axis.horizontal,
//                               children: [
//                                 Column(
//                                   mainAxisSize: MainAxisSize.max,
//                                   children: [
//                                     Align(
//                                       alignment: AlignmentDirectional(-0.85, 0),
//                                       child: Padding(
//                                         padding: EdgeInsetsDirectional.fromSTEB(
//                                             0, 0, 0, 10),
//                                         child: AuthUserStreamWidget(
//                                           child: Text(
//                                             currentUserDisplayName,
//                                             textAlign: TextAlign.start,
//                                             style: FlutterFlowTheme.of(context)
//                                                 .bodyText1
//                                                 .override(
//                                                   fontFamily: 'Poppins',
//                                                   color: Colors.white,
//                                                 ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     Align(
//                                       alignment: AlignmentDirectional(-0.9, 0),
//                                       child: Padding(
//                                         padding: EdgeInsetsDirectional.fromSTEB(
//                                             0, 0, 0, 10),
//                                         child: Text(
//                                           currentUserEmail,
//                                           textAlign: TextAlign.center,
//                                           style: FlutterFlowTheme.of(context)
//                                               .bodyText1
//                                               .override(
//                                                 fontFamily: 'Poppins',
//                                                 color: Colors.white,
//                                               ),
//                                         ),
//                                       ),
//                                     ),
//                                     Align(
//                                       alignment: AlignmentDirectional(-0.85, 0),
//                                       child: Padding(
//                                         padding: EdgeInsetsDirectional.fromSTEB(
//                                             0, 10, 0, 40),
//                                         child: Text(
//                                           'Personal Stats',
//                                           style: FlutterFlowTheme.of(context)
//                                               .title1
//                                               .override(
//                                                 fontFamily: 'Poppins',
//                                                 color: Colors.white,
//                                               ),
//                                         ),
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: EdgeInsetsDirectional.fromSTEB(
//                                           15, 0, 15, 0),
//                                       child: Container(
//                                         width: MediaQuery.of(context).size.width,
//                                         decoration: BoxDecoration(),
//                                         child: Column(
//                                           mainAxisSize: MainAxisSize.max,
//                                           children: [
//                                             Padding(
//                                               padding:
//                                                   EdgeInsetsDirectional.fromSTEB(
//                                                       0, 0, 0, 25),
//                                               child: Row(
//                                                 mainAxisSize: MainAxisSize.min,
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment.start,
//                                                 children: [
//                                                   Expanded(
//                                                     child: Padding(
//                                                       padding:
//                                                           EdgeInsetsDirectional
//                                                               .fromSTEB(
//                                                                   0, 0, 20, 0),
//                                                       child: Column(
//                                                         mainAxisSize:
//                                                             MainAxisSize.max,
//                                                         mainAxisAlignment:
//                                                             MainAxisAlignment
//                                                                 .spaceEvenly,
//                                                         crossAxisAlignment:
//                                                             CrossAxisAlignment
//                                                                 .start,
//                                                         children: [
//                                                           Padding(
//                                                             padding:
//                                                                 EdgeInsetsDirectional
//                                                                     .fromSTEB(10,
//                                                                         0, 0, 10),
//                                                             child: Text(
//                                                               'Height',
//                                                               style: FlutterFlowTheme
//                                                                       .of(context)
//                                                                   .bodyText1
//                                                                   .override(
//                                                                     fontFamily:
//                                                                         'Poppins',
//                                                                     color: Colors
//                                                                         .white,
//                                                                   ),
//                                                             ),
//                                                           ),
//                                                           Container(
//                                                             width: 200,
//                                                             decoration:
//                                                                 BoxDecoration(),
//                                                             child: TextFormField(
//                                                               controller:
//                                                                   textController1,
//                                                               obscureText: false,
//                                                               decoration:
//                                                                   InputDecoration(
//                                                                 hintText:
//                                                                     'your height',
//                                                                 enabledBorder:
//                                                                     UnderlineInputBorder(
//                                                                   borderSide:
//                                                                       BorderSide(
//                                                                     color: Color(
//                                                                         0x00000000),
//                                                                     width: 1,
//                                                                   ),
//                                                                   borderRadius:
//                                                                       BorderRadius
//                                                                           .circular(
//                                                                               30),
//                                                                 ),
//                                                                 focusedBorder:
//                                                                     UnderlineInputBorder(
//                                                                   borderSide:
//                                                                       BorderSide(
//                                                                     color: Color(
//                                                                         0x00000000),
//                                                                     width: 1,
//                                                                   ),
//                                                                   borderRadius:
//                                                                       BorderRadius
//                                                                           .circular(
//                                                                               30),
//                                                                 ),
//                                                                 filled: true,
//                                                                 fillColor: Color(
//                                                                     0x1BFFFFFF),
//                                                                 contentPadding:
//                                                                     EdgeInsetsDirectional
//                                                                         .fromSTEB(
//                                                                             10,
//                                                                             0,
//                                                                             10,
//                                                                             0),
//                                                               ),
//                                                               style: FlutterFlowTheme
//                                                                       .of(context)
//                                                                   .bodyText1
//                                                                   .override(
//                                                                     fontFamily:
//                                                                         'Poppins',
//                                                                     color: Colors
//                                                                         .white,
//                                                                     fontSize: 16,
//                                                                   ),
//                                                             ),
//                                                           ),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   ),
//                                                   Expanded(
//                                                     child: Column(
//                                                       mainAxisSize:
//                                                           MainAxisSize.max,
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .spaceEvenly,
//                                                       crossAxisAlignment:
//                                                           CrossAxisAlignment
//                                                               .start,
//                                                       children: [
//                                                         Padding(
//                                                           padding:
//                                                               EdgeInsetsDirectional
//                                                                   .fromSTEB(10, 0,
//                                                                       0, 10),
//                                                           child: Text(
//                                                             'Weight',
//                                                             style: FlutterFlowTheme
//                                                                     .of(context)
//                                                                 .bodyText1
//                                                                 .override(
//                                                                   fontFamily:
//                                                                       'Poppins',
//                                                                   color: Colors
//                                                                       .white,
//                                                                 ),
//                                                           ),
//                                                         ),
//                                                         Container(
//                                                           width: 200,
//                                                           child: TextFormField(
//                                                             controller:
//                                                                 textController2,
//                                                             obscureText: false,
//                                                             decoration:
//                                                                 InputDecoration(
//                                                               hintText:
//                                                                   'your weight',
//                                                               enabledBorder:
//                                                                   UnderlineInputBorder(
//                                                                 borderSide:
//                                                                     BorderSide(
//                                                                   color: Color(
//                                                                       0x00000000),
//                                                                   width: 1,
//                                                                 ),
//                                                                 borderRadius:
//                                                                     BorderRadius
//                                                                         .circular(
//                                                                             30),
//                                                               ),
//                                                               focusedBorder:
//                                                                   UnderlineInputBorder(
//                                                                 borderSide:
//                                                                     BorderSide(
//                                                                   color: Color(
//                                                                       0x00000000),
//                                                                   width: 1,
//                                                                 ),
//                                                                 borderRadius:
//                                                                     BorderRadius
//                                                                         .circular(
//                                                                             30),
//                                                               ),
//                                                               filled: true,
//                                                               fillColor: Color(
//                                                                   0x1BFFFFFF),
//                                                               contentPadding:
//                                                                   EdgeInsetsDirectional
//                                                                       .fromSTEB(
//                                                                           10,
//                                                                           0,
//                                                                           10,
//                                                                           0),
//                                                             ),
//                                                             style: FlutterFlowTheme
//                                                                     .of(context)
//                                                                 .bodyText1
//                                                                 .override(
//                                                                   fontFamily:
//                                                                       'Poppins',
//                                                                   color: Colors
//                                                                       .white,
//                                                                   fontSize: 16,
//                                                                 ),
//                                                           ),
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                             Row(
//                                               mainAxisSize: MainAxisSize.min,
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.start,
//                                               children: [
//                                                 Expanded(
//                                                   child: Padding(
//                                                     padding: EdgeInsetsDirectional
//                                                         .fromSTEB(0, 0, 20, 0),
//                                                     child: Column(
//                                                       mainAxisSize:
//                                                           MainAxisSize.max,
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .spaceEvenly,
//                                                       crossAxisAlignment:
//                                                           CrossAxisAlignment
//                                                               .start,
//                                                       children: [
//                                                         Padding(
//                                                           padding:
//                                                               EdgeInsetsDirectional
//                                                                   .fromSTEB(10, 0,
//                                                                       0, 10),
//                                                           child: Text(
//                                                             'Eye',
//                                                             style: FlutterFlowTheme
//                                                                     .of(context)
//                                                                 .bodyText1
//                                                                 .override(
//                                                                   fontFamily:
//                                                                       'Poppins',
//                                                                   color: Colors
//                                                                       .white,
//                                                                 ),
//                                                           ),
//                                                         ),
//                                                         Container(
//                                                           width: 200,
//                                                           decoration:
//                                                               BoxDecoration(),
//                                                           child: TextFormField(
//                                                             controller:
//                                                                 textController3,
//                                                             obscureText: false,
//                                                             decoration:
//                                                                 InputDecoration(
//                                                               hintText: 'color',
//                                                               enabledBorder:
//                                                                   UnderlineInputBorder(
//                                                                 borderSide:
//                                                                     BorderSide(
//                                                                   color: Color(
//                                                                       0x00000000),
//                                                                   width: 1,
//                                                                 ),
//                                                                 borderRadius:
//                                                                     BorderRadius
//                                                                         .circular(
//                                                                             30),
//                                                               ),
//                                                               focusedBorder:
//                                                                   UnderlineInputBorder(
//                                                                 borderSide:
//                                                                     BorderSide(
//                                                                   color: Color(
//                                                                       0x00000000),
//                                                                   width: 1,
//                                                                 ),
//                                                                 borderRadius:
//                                                                     BorderRadius
//                                                                         .circular(
//                                                                             30),
//                                                               ),
//                                                               filled: true,
//                                                               fillColor: Color(
//                                                                   0x1BFFFFFF),
//                                                               contentPadding:
//                                                                   EdgeInsetsDirectional
//                                                                       .fromSTEB(
//                                                                           10,
//                                                                           0,
//                                                                           10,
//                                                                           0),
//                                                             ),
//                                                             style: FlutterFlowTheme
//                                                                     .of(context)
//                                                                 .bodyText1
//                                                                 .override(
//                                                                   fontFamily:
//                                                                       'Poppins',
//                                                                   color: Colors
//                                                                       .white,
//                                                                   fontSize: 16,
//                                                                 ),
//                                                           ),
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ),
//                                                 Expanded(
//                                                   child: Column(
//                                                     mainAxisSize:
//                                                         MainAxisSize.max,
//                                                     mainAxisAlignment:
//                                                         MainAxisAlignment
//                                                             .spaceEvenly,
//                                                     crossAxisAlignment:
//                                                         CrossAxisAlignment.start,
//                                                     children: [
//                                                       Padding(
//                                                         padding:
//                                                             EdgeInsetsDirectional
//                                                                 .fromSTEB(
//                                                                     10, 0, 0, 10),
//                                                         child: Text(
//                                                           'Hair',
//                                                           style: FlutterFlowTheme
//                                                                   .of(context)
//                                                               .bodyText1
//                                                               .override(
//                                                                 fontFamily:
//                                                                     'Poppins',
//                                                                 color:
//                                                                     Colors.white,
//                                                               ),
//                                                         ),
//                                                       ),
//                                                       Container(
//                                                         width: 200,
//                                                         decoration:
//                                                             BoxDecoration(),
//                                                         child: TextFormField(
//                                                           controller:
//                                                               textController4,
//                                                           obscureText: false,
//                                                           decoration:
//                                                               InputDecoration(
//                                                             hintText: 'color',
//                                                             enabledBorder:
//                                                                 UnderlineInputBorder(
//                                                               borderSide:
//                                                                   BorderSide(
//                                                                 color: Color(
//                                                                     0x00000000),
//                                                                 width: 1,
//                                                               ),
//                                                               borderRadius:
//                                                                   BorderRadius
//                                                                       .circular(
//                                                                           30),
//                                                             ),
//                                                             focusedBorder:
//                                                                 UnderlineInputBorder(
//                                                               borderSide:
//                                                                   BorderSide(
//                                                                 color: Color(
//                                                                     0x00000000),
//                                                                 width: 1,
//                                                               ),
//                                                               borderRadius:
//                                                                   BorderRadius
//                                                                       .circular(
//                                                                           30),
//                                                             ),
//                                                             filled: true,
//                                                             fillColor:
//                                                                 Color(0x1BFFFFFF),
//                                                             contentPadding:
//                                                                 EdgeInsetsDirectional
//                                                                     .fromSTEB(10,
//                                                                         0, 10, 0),
//                                                           ),
//                                                           style: FlutterFlowTheme
//                                                                   .of(context)
//                                                               .bodyText1
//                                                               .override(
//                                                                 fontFamily:
//                                                                     'Poppins',
//                                                                 color:
//                                                                     Colors.white,
//                                                                 fontSize: 16,
//                                                               ),
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                             Padding(
//                                               padding:
//                                                   EdgeInsetsDirectional.fromSTEB(
//                                                       0, 30, 0, 0),
//                                               child: Row(
//                                                 mainAxisSize: MainAxisSize.min,
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment.start,
//                                                 children: [
//                                                   Expanded(
//                                                     child: Padding(
//                                                       padding:
//                                                           EdgeInsetsDirectional
//                                                               .fromSTEB(
//                                                                   0, 0, 20, 0),
//                                                       child: Column(
//                                                         mainAxisSize:
//                                                             MainAxisSize.max,
//                                                         mainAxisAlignment:
//                                                             MainAxisAlignment
//                                                                 .spaceEvenly,
//                                                         crossAxisAlignment:
//                                                             CrossAxisAlignment
//                                                                 .start,
//                                                         children: [
//                                                           Container(
//                                                             width: 200,
//                                                             decoration:
//                                                                 BoxDecoration(),
//                                                           ),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   ),
//                                                   Expanded(
//                                                     child: Column(
//                                                       mainAxisSize:
//                                                           MainAxisSize.max,
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .spaceEvenly,
//                                                       crossAxisAlignment:
//                                                           CrossAxisAlignment
//                                                               .start,
//                                                       children: [
//                                                         Container(
//                                                           width: 200,
//                                                           decoration:
//                                                               BoxDecoration(),
//                                                           child: Padding(
//                                                             padding:
//                                                                 EdgeInsetsDirectional
//                                                                     .fromSTEB(0,
//                                                                         20, 0, 0),
//                                                             child: FFButtonWidget(
//                                                               onPressed:
//                                                                   () async {
//                                                                 final usersUpdateData =
//                                                                     createUsersRecordData();
//                                                                 await currentUserReference
//                                                                     .update(
//                                                                         usersUpdateData);
//                                                               },
//                                                               text: 'Button',
//                                                               options:
//                                                                   FFButtonOptions(
//                                                                 width: 130,
//                                                                 height: 40,
//                                                                 color: FlutterFlowTheme
//                                                                         .of(context)
//                                                                     .primaryColor,
//                                                                 textStyle:
//                                                                     FlutterFlowTheme.of(
//                                                                             context)
//                                                                         .subtitle2
//                                                                         .override(
//                                                                           fontFamily:
//                                                                               'Poppins',
//                                                                           color: Colors
//                                                                               .white,
//                                                                         ),
//                                                                 borderSide:
//                                                                     BorderSide(
//                                                                   color: Colors
//                                                                       .transparent,
//                                                                   width: 1,
//                                                                 ),
//                                                                 borderRadius: 30,
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 Container(
//                                   width: MediaQuery.of(context).size.width,
//                                   height: double.infinity,
//                                   decoration: BoxDecoration(),
//                                   child: Padding(
//                                     padding: EdgeInsetsDirectional.fromSTEB(
//                                         15, 0, 15, 0),
//                                     child: Column(
//                                       mainAxisSize: MainAxisSize.max,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Padding(
//                                           padding: EdgeInsetsDirectional.fromSTEB(
//                                               0, 0, 0, 20),
//                                           child: Text(
//                                             'Headshots',
//                                             style: FlutterFlowTheme.of(context)
//                                                 .bodyText1
//                                                 .override(
//                                                   fontFamily: 'Poppins',
//                                                   color: Colors.white,
//                                                   fontSize: 24,
//                                                 ),
//                                           ),
//                                         ),
//                                         Align(
//                                           alignment: AlignmentDirectional(0, 0),
//                                           child: Padding(
//                                             padding:
//                                                 EdgeInsetsDirectional.fromSTEB(
//                                                     0, 10, 0, 15),
//                                             child: Row(
//                                               mainAxisSize: MainAxisSize.max,
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.spaceAround,
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.center,
//                                               children: [
//                                                 ClipRRect(
//                                                   borderRadius:
//                                                       BorderRadius.circular(8),
//                                                   child: Image.network(
//                                                     'https://picsum.photos/seed/840/600',
//                                                     width: 97,
//                                                     height: 130,
//                                                     fit: BoxFit.cover,
//                                                   ),
//                                                 ),
//                                                 Column(
//                                                   mainAxisSize: MainAxisSize.min,
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment.start,
//                                                   children: [
//                                                     Text(
//                                                       'Headshot',
//                                                       style: FlutterFlowTheme.of(
//                                                               context)
//                                                           .bodyText1
//                                                           .override(
//                                                             fontFamily: 'Poppins',
//                                                             color: Colors.white,
//                                                           ),
//                                                     ),
//                                                     Padding(
//                                                       padding:
//                                                           EdgeInsetsDirectional
//                                                               .fromSTEB(
//                                                                   0, 0, 0, 5),
//                                                       child: Text(
//                                                         '(PDF,JPG,GIF)',
//                                                         style: FlutterFlowTheme
//                                                                 .of(context)
//                                                             .bodyText1
//                                                             .override(
//                                                               fontFamily:
//                                                                   'Poppins',
//                                                               color: Colors.white,
//                                                             ),
//                                                       ),
//                                                     ),
//                                                     FlutterFlowIconButton(
//                                                       borderColor:
//                                                           Color(0x00CE2121),
//                                                       borderRadius: 30,
//                                                       borderWidth: 1,
//                                                       buttonSize: 60,
//                                                       fillColor:
//                                                           Color(0x0AFFFFFF),
//                                                       icon: Icon(
//                                                         Icons.upload_file,
//                                                         color: Colors.white,
//                                                         size: 30,
//                                                       ),
//                                                       onPressed: () async {
//                                                         final selectedMedia =
//                                                             await selectMediaWithSourceBottomSheet(
//                                                           context: context,
//                                                           allowPhoto: true,
//                                                         );
//                                                         if (selectedMedia !=
//                                                                 null &&
//                                                             validateFileFormat(
//                                                                 selectedMedia
//                                                                     .storagePath,
//                                                                 context)) {
//                                                           showUploadMessage(
//                                                             context,
//                                                             'Uploading file...',
//                                                             showLoading: true,
//                                                           );
//                                                           final downloadUrl =
//                                                               await uploadData(
//                                                                   selectedMedia
//                                                                       .storagePath,
//                                                                   selectedMedia
//                                                                       .bytes);
//                                                           ScaffoldMessenger.of(
//                                                                   context)
//                                                               .hideCurrentSnackBar();
//                                                           if (downloadUrl !=
//                                                               null) {
//                                                             setState(() =>
//                                                                 uploadedFileUrl =
//                                                                     downloadUrl);
//                                                             showUploadMessage(
//                                                               context,
//                                                               'Success!',
//                                                             );
//                                                           } else {
//                                                             showUploadMessage(
//                                                               context,
//                                                               'Failed to upload media',
//                                                             );
//                                                             return;
//                                                           }
//                                                         }
//                                                       },
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                         Align(
//                                           alignment: AlignmentDirectional(0, 0),
//                                           child: Padding(
//                                             padding:
//                                                 EdgeInsetsDirectional.fromSTEB(
//                                                     0, 0, 0, 15),
//                                             child: Row(
//                                               mainAxisSize: MainAxisSize.max,
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.spaceAround,
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.center,
//                                               children: [
//                                                 ClipRRect(
//                                                   borderRadius:
//                                                       BorderRadius.circular(8),
//                                                   child: Image.network(
//                                                     'https://picsum.photos/seed/840/600',
//                                                     width: 97,
//                                                     height: 130,
//                                                     fit: BoxFit.cover,
//                                                   ),
//                                                 ),
//                                                 Column(
//                                                   mainAxisSize: MainAxisSize.min,
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment.start,
//                                                   children: [
//                                                     Text(
//                                                       '3/4 Shot',
//                                                       style: FlutterFlowTheme.of(
//                                                               context)
//                                                           .bodyText1
//                                                           .override(
//                                                             fontFamily: 'Poppins',
//                                                             color: Colors.white,
//                                                           ),
//                                                     ),
//                                                     Padding(
//                                                       padding:
//                                                           EdgeInsetsDirectional
//                                                               .fromSTEB(
//                                                                   0, 0, 0, 5),
//                                                       child: Text(
//                                                         '(PDF,JPG,GIF)',
//                                                         style: FlutterFlowTheme
//                                                                 .of(context)
//                                                             .bodyText1
//                                                             .override(
//                                                               fontFamily:
//                                                                   'Poppins',
//                                                               color: Colors.white,
//                                                             ),
//                                                       ),
//                                                     ),
//                                                     FlutterFlowIconButton(
//                                                       borderColor:
//                                                           Colors.transparent,
//                                                       borderRadius: 30,
//                                                       borderWidth: 1,
//                                                       buttonSize: 60,
//                                                       fillColor:
//                                                           Color(0x0AFFFFFF),
//                                                       icon: Icon(
//                                                         Icons.upload_file,
//                                                         color: Colors.white,
//                                                         size: 30,
//                                                       ),
//                                                       onPressed: () {
//                                                         print(
//                                                             'IconButton pressed ...');
//                                                       },
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                         Align(
//                                           alignment: AlignmentDirectional(0, 0),
//                                           child: Padding(
//                                             padding:
//                                                 EdgeInsetsDirectional.fromSTEB(
//                                                     0, 0, 0, 20),
//                                             child: Row(
//                                               mainAxisSize: MainAxisSize.max,
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.spaceAround,
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.center,
//                                               children: [
//                                                 ClipRRect(
//                                                   borderRadius:
//                                                       BorderRadius.circular(8),
//                                                   child: Image.network(
//                                                     'https://picsum.photos/seed/840/600',
//                                                     width: 97,
//                                                     height: 130,
//                                                     fit: BoxFit.cover,
//                                                   ),
//                                                 ),
//                                                 Column(
//                                                   mainAxisSize: MainAxisSize.min,
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment.start,
//                                                   children: [
//                                                     Text(
//                                                       '1/4 shot',
//                                                       style: FlutterFlowTheme.of(
//                                                               context)
//                                                           .bodyText1
//                                                           .override(
//                                                             fontFamily: 'Poppins',
//                                                             color: Colors.white,
//                                                           ),
//                                                     ),
//                                                     Padding(
//                                                       padding:
//                                                           EdgeInsetsDirectional
//                                                               .fromSTEB(
//                                                                   0, 0, 0, 5),
//                                                       child: Text(
//                                                         '(PDF,JPG,GIF)',
//                                                         style: FlutterFlowTheme
//                                                                 .of(context)
//                                                             .bodyText1
//                                                             .override(
//                                                               fontFamily:
//                                                                   'Poppins',
//                                                               color: Colors.white,
//                                                             ),
//                                                       ),
//                                                     ),
//                                                     FlutterFlowIconButton(
//                                                       borderColor:
//                                                           Colors.transparent,
//                                                       borderRadius: 30,
//                                                       borderWidth: 1,
//                                                       buttonSize: 60,
//                                                       fillColor:
//                                                           Color(0x0AFFFFFF),
//                                                       icon: Icon(
//                                                         Icons.upload_file,
//                                                         color: Colors.white,
//                                                         size: 30,
//                                                       ),
//                                                       onPressed: () {
//                                                         print(
//                                                             'IconButton pressed ...');
//                                                       },
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 Column(
//                                   mainAxisSize: MainAxisSize.max,
//                                   children: [
//                                     Padding(
//                                       padding: EdgeInsetsDirectional.fromSTEB(
//                                           0, 50, 0, 0),
//                                       child: Text(
//                                         'You\'re all set!',
//                                         style: FlutterFlowTheme.of(context)
//                                             .bodyText1
//                                             .override(
//                                               fontFamily: 'Poppins',
//                                               color: Colors.white,
//                                               fontSize: 24,
//                                             ),
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: EdgeInsetsDirectional.fromSTEB(
//                                           0, 24, 0, 0),
//                                       child: InkWell(
//                                         onTap: () async {
//                                           await Navigator.push(
//                                             context,
//                                             MaterialPageRoute(
//                                               builder: (context) =>
//                                                   Payment2Widget(),
//                                             ),
//                                           );
//                                         },
//                                         child: Card(
//                                           clipBehavior:
//                                               Clip.antiAliasWithSaveLayer,
//                                           color: Color(0x9C30A205),
//                                           shape: RoundedRectangleBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(70),
//                                           ),
//                                           child: Padding(
//                                             padding:
//                                                 EdgeInsetsDirectional.fromSTEB(
//                                                     30, 30, 30, 30),
//                                             child: Icon(
//                                               Icons.check_rounded,
//                                               color: Colors.white,
//                                               size: 60,
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: EdgeInsetsDirectional.fromSTEB(
//                                           0, 20, 0, 0),
//                                       child: Text(
//                                         'Let\'s Go!',
//                                         style: FlutterFlowTheme.of(context)
//                                             .bodyText1
//                                             .override(
//                                               fontFamily: 'Poppins',
//                                               color: Colors.white,
//                                               fontSize: 24,
//                                             ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Align(
//                             alignment: AlignmentDirectional(0.85, -1),
//                             child: Padding(
//                               padding:
//                                   EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
//                               child: SmoothPageIndicator(
//                                 controller: pageViewController ??=
//                                     PageController(initialPage: 0),
//                                 count: 3,
//                                 axisDirection: Axis.horizontal,
//                                 onDotClicked: (i) {
//                                   pageViewController.animateToPage(
//                                     i,
//                                     duration: Duration(milliseconds: 500),
//                                     curve: Curves.ease,
//                                   );
//                                 },
//                                 effect: ExpandingDotsEffect(
//                                   expansionFactor: 2,
//                                   spacing: 8,
//                                   radius: 16,
//                                   dotWidth: 16,
//                                   dotHeight: 16,
//                                   dotColor: Color(0x2BFFFFFF),
//                                   activeDotColor: Colors.white,
//                                   paintStyle: PaintingStyle.fill,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
