import 'package:flutter/scheduler.dart';
import 'package:manager/Provider/utils.dart';
import 'package:manager/Service/Firebase_service.dart';
import 'package:manager/Widget/CustomCircular.dart';
import 'package:manager/backend/firebase_storage/storage.dart';
import 'package:manager/flutter_flow/upload_media.dart';
import 'package:provider/provider.dart';

import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileDetailWidget extends StatefulWidget {
  var data;
  var id;
   ProfileDetailWidget({Key key, this.data,this.id}) : super(key: key);

  @override
  _ProfileDetailWidgetState createState() => _ProfileDetailWidgetState();
}

class _ProfileDetailWidgetState extends State<ProfileDetailWidget> {
  TextEditingController textController1;
  TextEditingController textController2;
  TextEditingController textController3;
  TextEditingController textController4;
  TextEditingController textController5;
  TextEditingController textController6;
  TextEditingController textController7;
  bool switchListTileValue;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController(text: widget.data['name']);
    textController2 = TextEditingController(text: widget.data['email']);
    textController3 = TextEditingController(text: '555');
    // textController4 = TextEditingController(text: widget.data2['height']);
    // textController5 = TextEditingController(text: widget.data2['weight']);
    // textController6 = TextEditingController(text: widget.data2['hair']);
    // textController7 = TextEditingController(text: widget.data2['eye']);

    // SchedulerBinding.instance.addPostFrameCallback((_) {
      var utils = Provider.of<Utils>(context, listen: false);
      utils.selectedImage1 = null;
    utils.selectedImage2 = null;
    utils.selectedImage3 = null;
    // });
  }


  @override
  Widget build(BuildContext context) {
    var utils = Provider.of<Utils>(context, listen: true);
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () async {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.chevron_left_rounded,
            color: Color(0xFF8B97A2),
            size: 24,
          ),
        ),
        title: Text(
          'Profile Details',
          style: FlutterFlowTheme.of(context).subtitle1.override(
                fontFamily: 'Lexend Deca',
                color: Color(0xFF8B97A2),
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: Color(0xFFF5F5F5),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: SafeArea(
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                physics: ScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 170,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(0),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Image.asset(
                                            'assets/images/card_header@2x.png',
                                            width:
                                                MediaQuery.of(context).size.width,
                                            height: 130,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Align(
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Container(
                                            width:
                                                MediaQuery.of(context).size.width,
                                            height: 130,
                                            decoration: BoxDecoration(
                                              color: Color(0x77090F13),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                FlutterFlowIconButton(
                                                  borderColor: Colors.transparent,
                                                  borderRadius: 30,
                                                  buttonSize: 48,
                                                  icon: Icon(
                                                    Icons.photo_camera,
                                                    color: Colors.white,
                                                    size: 30,
                                                  ),
                                                  onPressed: () {
                                                    print(
                                                        'IconButton pressed ...');
                                                  },
                                                ),
                                                Text(
                                                  'Change Cover Photo',
                                                  style: GoogleFonts.getFont(
                                                    'DM Sans',
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 10,
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
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                child: Text(
                                  'Edit Image',
                                  style: GoogleFonts.getFont(
                                    'DM Sans',
                                    color: Color(0xFF4B39EF),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: textController1,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Name',
                                hintText: 'What do people call you...?',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xFF8B97A2),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFDBE2E7),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFDBE2E7),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                fontFamily: 'Lexend Deca',
                                color: Color(0xFF090F13),
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                              validator: (val) {
                                if (val.isEmpty) {
                                  return 'error';
                                }

                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: TextFormField(
                              enabled: false,
                              controller: textController2,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Email Address',
                                hintText: 'Enter a new email',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xFF8B97A2),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFDBE2E7),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFDBE2E7),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFDBE2E7),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
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
                        ],
                      ),
                    ),
                    // Padding(
                    //   padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                    //   child: Row(
                    //     mainAxisSize: MainAxisSize.max,
                    //     children: [
                    //       Expanded(
                    //         child: TextFormField(
                    //           controller: textController3,
                    //           obscureText: false,
                    //           decoration: InputDecoration(
                    //             labelText: 'Phone\n',
                    //             hintStyle: FlutterFlowTheme.of(context)
                    //                 .bodyText1
                    //                 .override(
                    //               fontFamily: 'Lexend Deca',
                    //               color: Color(0xFF8B97A2),
                    //               fontSize: 14,
                    //               fontWeight: FontWeight.normal,
                    //             ),
                    //             enabledBorder: OutlineInputBorder(
                    //               borderSide: BorderSide(
                    //                 color: Color(0xFFDBE2E7),
                    //                 width: 1,
                    //               ),
                    //               borderRadius: BorderRadius.circular(8),
                    //             ),
                    //             focusedBorder: OutlineInputBorder(
                    //               borderSide: BorderSide(
                    //                 color: Color(0xFFDBE2E7),
                    //                 width: 1,
                    //               ),
                    //               borderRadius: BorderRadius.circular(8),
                    //             ),
                    //           ),
                    //           style: FlutterFlowTheme.of(context)
                    //               .bodyText1
                    //               .override(
                    //             fontFamily: 'Lexend Deca',
                    //             color: Color(0xFF090F13),
                    //             fontSize: 14,
                    //             fontWeight: FontWeight.normal,
                    //           ),
                    //           keyboardType: TextInputType.phone,
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // Padding(
                    //   padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                    //   child: Row(
                    //     mainAxisSize: MainAxisSize.max,
                    //     children: [
                    //       Expanded(
                    //         child: TextFormField(
                    //           controller: textController4,
                    //           obscureText: false,
                    //           decoration: InputDecoration(
                    //             labelText: 'Height',
                    //             hintText: 'Enter a new email',
                    //             hintStyle: FlutterFlowTheme.of(context)
                    //                 .bodyText1
                    //                 .override(
                    //               fontFamily: 'Lexend Deca',
                    //               color: Color(0xFF8B97A2),
                    //               fontSize: 14,
                    //               fontWeight: FontWeight.normal,
                    //             ),
                    //             enabledBorder: OutlineInputBorder(
                    //               borderSide: BorderSide(
                    //                 color: Color(0xFFDBE2E7),
                    //                 width: 1,
                    //               ),
                    //               borderRadius: BorderRadius.circular(8),
                    //             ),
                    //             focusedBorder: OutlineInputBorder(
                    //               borderSide: BorderSide(
                    //                 color: Color(0xFFDBE2E7),
                    //                 width: 1,
                    //               ),
                    //               borderRadius: BorderRadius.circular(8),
                    //             ),
                    //           ),
                    //           style: FlutterFlowTheme.of(context)
                    //               .bodyText1
                    //               .override(
                    //             fontFamily: 'Lexend Deca',
                    //             color: Color(0xFF090F13),
                    //             fontSize: 14,
                    //             fontWeight: FontWeight.normal,
                    //           ),
                    //         ),
                    //       ),
                    //       Expanded(
                    //         child: TextFormField(
                    //           controller: textController5,
                    //           obscureText: false,
                    //           decoration: InputDecoration(
                    //             labelText: 'Weight',
                    //             hintText: 'Enter a new email',
                    //             hintStyle: FlutterFlowTheme.of(context)
                    //                 .bodyText1
                    //                 .override(
                    //               fontFamily: 'Lexend Deca',
                    //               color: Color(0xFF8B97A2),
                    //               fontSize: 14,
                    //               fontWeight: FontWeight.normal,
                    //             ),
                    //             enabledBorder: OutlineInputBorder(
                    //               borderSide: BorderSide(
                    //                 color: Color(0xFFDBE2E7),
                    //                 width: 1,
                    //               ),
                    //               borderRadius: BorderRadius.circular(8),
                    //             ),
                    //             focusedBorder: OutlineInputBorder(
                    //               borderSide: BorderSide(
                    //                 color: Color(0xFFDBE2E7),
                    //                 width: 1,
                    //               ),
                    //               borderRadius: BorderRadius.circular(8),
                    //             ),
                    //           ),
                    //           style: FlutterFlowTheme.of(context)
                    //               .bodyText1
                    //               .override(
                    //             fontFamily: 'Lexend Deca',
                    //             color: Color(0xFF090F13),
                    //             fontSize: 14,
                    //             fontWeight: FontWeight.normal,
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // Padding(
                    //   padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                    //   child: Row(
                    //     mainAxisSize: MainAxisSize.max,
                    //     children: [
                    //       Expanded(
                    //         child: TextFormField(
                    //           controller: textController6,
                    //           obscureText: false,
                    //           decoration: InputDecoration(
                    //             labelText: 'Hair \n',
                    //             hintText: 'Enter a new email',
                    //             hintStyle: FlutterFlowTheme.of(context)
                    //                 .bodyText1
                    //                 .override(
                    //               fontFamily: 'Lexend Deca',
                    //               color: Color(0xFF8B97A2),
                    //               fontSize: 14,
                    //               fontWeight: FontWeight.normal,
                    //             ),
                    //             enabledBorder: OutlineInputBorder(
                    //               borderSide: BorderSide(
                    //                 color: Color(0xFFDBE2E7),
                    //                 width: 1,
                    //               ),
                    //               borderRadius: BorderRadius.circular(8),
                    //             ),
                    //             focusedBorder: OutlineInputBorder(
                    //               borderSide: BorderSide(
                    //                 color: Color(0xFFDBE2E7),
                    //                 width: 1,
                    //               ),
                    //               borderRadius: BorderRadius.circular(8),
                    //             ),
                    //           ),
                    //           style: FlutterFlowTheme.of(context)
                    //               .bodyText1
                    //               .override(
                    //             fontFamily: 'Lexend Deca',
                    //             color: Color(0xFF090F13),
                    //             fontSize: 14,
                    //             fontWeight: FontWeight.normal,
                    //           ),
                    //         ),
                    //       ),
                    //       Expanded(
                    //         child: TextFormField(
                    //           controller: textController7,
                    //           obscureText: false,
                    //           decoration: InputDecoration(
                    //             labelText: 'Eyes\n',
                    //             hintText: 'Enter a new email',
                    //             hintStyle: FlutterFlowTheme.of(context)
                    //                 .bodyText1
                    //                 .override(
                    //               fontFamily: 'Lexend Deca',
                    //               color: Color(0xFF8B97A2),
                    //               fontSize: 14,
                    //               fontWeight: FontWeight.normal,
                    //             ),
                    //             enabledBorder: OutlineInputBorder(
                    //               borderSide: BorderSide(
                    //                 color: Color(0xFFDBE2E7),
                    //                 width: 1,
                    //               ),
                    //               borderRadius: BorderRadius.circular(8),
                    //             ),
                    //             focusedBorder: OutlineInputBorder(
                    //               borderSide: BorderSide(
                    //                 color: Color(0xFFDBE2E7),
                    //                 width: 1,
                    //               ),
                    //               borderRadius: BorderRadius.circular(8),
                    //             ),
                    //           ),
                    //           style: FlutterFlowTheme.of(context)
                    //               .bodyText1
                    //               .override(
                    //             fontFamily: 'Lexend Deca',
                    //             color: Color(0xFF090F13),
                    //             fontSize: 14,
                    //             fontWeight: FontWeight.normal,
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // Align(
                    //   alignment: AlignmentDirectional(0, 0),
                    //   child: Padding(
                    //     padding:
                    //     EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    //     child: Row(
                    //       mainAxisSize: MainAxisSize.max,
                    //       mainAxisAlignment:
                    //       MainAxisAlignment.spaceEvenly,
                    //       crossAxisAlignment: CrossAxisAlignment.center,
                    //       children: [
                    //         utils.selectedImage1 == null? Image.network(
                    //       widget.data2['file1'],
                    //       width: 100,
                    //       height: 100,
                    //       fit: BoxFit.cover,
                    //     ):Image.memory(utils.selectedImage1.bytes??"",
                    //           fit: BoxFit.cover,
                    //           width: 97,
                    //           height: 130,
                    //         ),
                    //         Column(
                    //           mainAxisSize: MainAxisSize.min,
                    //           mainAxisAlignment: MainAxisAlignment.start,
                    //           children: [
                    //             Text(
                    //               'headshot (PDF)',
                    //               style: FlutterFlowTheme.of(context)
                    //                   .bodyText1,
                    //             ),
                    //             FlutterFlowIconButton(
                    //               borderColor: Colors.transparent,
                    //               borderRadius: 30,
                    //               borderWidth: 1,
                    //               buttonSize: 60,
                    //               icon: Icon(
                    //                 Icons.add_box_outlined,
                    //                 color: Colors.black,
                    //                 size: 30,
                    //               ),
                    //               onPressed: () {
                    //                 selectMediaWithSourceBottomSheet(
                    //                   context: context,
                    //                   allowPhoto: true,
                    //                 )
                    //
                    //                     .then((value){
                    //                   setState(() {
                    //                     utils.selectedImage1 = value;
                    //                   });
                    //
                    //                 });
                    //               },
                    //             ),
                    //           ],
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    // Align(
                    //   alignment: AlignmentDirectional(0, 0),
                    //   child: Padding(
                    //     padding:
                    //     EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    //     child: Row(
                    //       mainAxisSize: MainAxisSize.max,
                    //       mainAxisAlignment:
                    //       MainAxisAlignment.spaceEvenly,
                    //       crossAxisAlignment: CrossAxisAlignment.center,
                    //       children: [
                    //         utils.selectedImage2 == null? Image.network(
                    //           widget.data2['file2'],
                    //           width: 100,
                    //           height: 100,
                    //           fit: BoxFit.cover,
                    //         ):Image.memory(utils.selectedImage2.bytes??"",
                    //           fit: BoxFit.cover,
                    //           width: 97,
                    //           height: 130,
                    //         ),
                    //         Column(
                    //           mainAxisSize: MainAxisSize.min,
                    //           mainAxisAlignment: MainAxisAlignment.start,
                    //           children: [
                    //             Text(
                    //               'headshot (PDF)',
                    //               style: FlutterFlowTheme.of(context)
                    //                   .bodyText1,
                    //             ),
                    //             FlutterFlowIconButton(
                    //               borderColor: Colors.transparent,
                    //               borderRadius: 30,
                    //               borderWidth: 1,
                    //               buttonSize: 60,
                    //               icon: Icon(
                    //                 Icons.add_box_outlined,
                    //                 color: Colors.black,
                    //                 size: 30,
                    //               ),
                    //               onPressed: () {
                    //                 selectMediaWithSourceBottomSheet(
                    //                   context: context,
                    //                   allowPhoto: true,
                    //                 )
                    //
                    //                     .then((value){
                    //                   setState(() {
                    //                     utils.selectedImage2 = value;
                    //                   });
                    //
                    //                 });
                    //               },
                    //             ),
                    //           ],
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    // Align(
                    //   alignment: AlignmentDirectional(0, 0),
                    //   child: Padding(
                    //     padding:
                    //     EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    //     child: Row(
                    //       mainAxisSize: MainAxisSize.max,
                    //       mainAxisAlignment:
                    //       MainAxisAlignment.spaceEvenly,
                    //       crossAxisAlignment: CrossAxisAlignment.center,
                    //       children: [
                    //         utils.selectedImage3 == null? Image.network(
                    //           widget.data2['file3'],
                    //           width: 100,
                    //           height: 100,
                    //           fit: BoxFit.cover,
                    //         ):Image.memory(utils.selectedImage3.bytes??"",
                    //           fit: BoxFit.cover,
                    //           width: 97,
                    //           height: 130,
                    //         ),
                    //         Column(
                    //           mainAxisSize: MainAxisSize.min,
                    //           mainAxisAlignment: MainAxisAlignment.start,
                    //           children: [
                    //             Text(
                    //               'headshot (PDF)',
                    //               style: FlutterFlowTheme.of(context)
                    //                   .bodyText1,
                    //             ),
                    //             FlutterFlowIconButton(
                    //               borderColor: Colors.transparent,
                    //               borderRadius: 30,
                    //               borderWidth: 1,
                    //               buttonSize: 60,
                    //               icon: Icon(
                    //                 Icons.add_box_outlined,
                    //                 color: Colors.black,
                    //                 size: 30,
                    //               ),
                    //               onPressed: () {
                    //                 selectMediaWithSourceBottomSheet(
                    //                   context: context,
                    //                   allowPhoto: true,
                    //                 )
                    //
                    //                     .then((value){
                    //                   setState(() {
                    //                     utils.selectedImage3 = value;
                    //                   });
                    //
                    //                 });
                    //               },
                    //             ),
                    //           ],
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    // Row(
                    //   mainAxisSize: MainAxisSize.max,
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   children: [
                    //     Padding(
                    //       padding:
                    //       EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    //       child: Row(
                    //         mainAxisSize: MainAxisSize.min,
                    //         mainAxisAlignment: MainAxisAlignment.center,
                    //         children: [
                    //           FFButtonWidget(
                    //             onPressed: () {
                    //               circularCustom(context);
                    //               FirebaseApi.updateUserProfile(
                    //                 name: textController1.text,
                    //                 email: widget.data['email'],
                    //                 urlAvatar: "",
                    //                 id:   widget.data['id'],
                    //               ).then((value)async{
                    //                 final downloadUrl1 = utils.selectedImage1==null?null: await uploadData(
                    //                     utils.selectedImage1
                    //                         .storagePath,
                    //                     utils.selectedImage1
                    //                         .bytes);
                    //                 final downloadUrl2 =
                    //                 utils.selectedImage2==null?null: await uploadData(
                    //                     utils.selectedImage2
                    //                         .storagePath,
                    //                     utils.selectedImage2
                    //                         .bytes);
                    //                 final downloadUrl3 =
                    //                 utils.selectedImage3==null?null: await uploadData(
                    //                     utils.selectedImage3
                    //                         .storagePath,
                    //                     utils.selectedImage3
                    //                         .bytes);
                    //                 await  FirebaseApi.updateAccountTypeDetail(
                    //                   height: textController4.text,
                    //                   file1: utils.selectedImage1==null ?widget.data2['file1']:downloadUrl1,
                    //                   file2: utils.selectedImage2==null?widget.data2['file2']:downloadUrl2,
                    //                   file3: utils.selectedImage3==null?widget.data2['file3']:downloadUrl3,
                    //                   accountType: widget.data2['accountType'] ,
                    //                   user: widget.data['id'],
                    //                   eye: textController7.text,
                    //                   id: widget.data2['id'],
                    //                   weight: textController5.text,
                    //                   hair: textController6.text,
                    //                 ).then((value) {
                    //                   Navigator.pop(context);
                    //                 });
                    //               });
                    //             },
                    //             text: 'Save Changes',
                    //             options: FFButtonOptions(
                    //               width: 230,
                    //               height: 50,
                    //               color: Color(0xFF4B39EF),
                    //               textStyle: FlutterFlowTheme.of(context)
                    //                   .bodyText2
                    //                   .override(
                    //                 fontFamily: 'Lexend Deca',
                    //                 color: Colors.white,
                    //                 fontSize: 14,
                    //                 fontWeight: FontWeight.normal,
                    //               ),
                    //               elevation: 3,
                    //               borderSide: BorderSide(
                    //                 color: Colors.transparent,
                    //                 width: 1,
                    //               ),
                    //               borderRadius: 8,
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    Padding(
                      padding:
                      EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: SwitchListTile(
                        value: switchListTileValue ??= true,
                        onChanged: (newValue) => setState(
                                () => switchListTileValue = newValue),
                        title: Text(
                          'Recieve Notifications',
                          style: FlutterFlowTheme.of(context)
                              .subtitle2
                              .override(
                            fontFamily: 'Lexend Deca',
                            color: Color(0xFF151B1E),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        subtitle: Text(
                          'Turn on notifications.',
                          style: FlutterFlowTheme.of(context)
                              .bodyText2
                              .override(
                            fontFamily: 'Lexend Deca',
                            color: Color(0xFF8B97A2),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        tileColor: Colors.white,
                        activeColor: Color(0xFF4B39EF),
                        activeTrackColor: Color(0x8D4B39EF),
                        dense: false,
                        controlAffinity: ListTileControlAffinity.trailing,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
