import 'package:fluttertoast/fluttertoast.dart';
import 'package:manager/Provider/utils.dart';
import 'package:manager/Service/Firebase_service.dart';
import 'package:manager/Widget/CustomCircular.dart';
import 'package:manager/backend/firebase_storage/storage.dart';
import 'package:manager/flutter_flow/flutter_flow_calendar.dart';
import 'package:manager/flutter_flow/flutter_flow_icon_button.dart';
import 'package:manager/flutter_flow/flutter_flow_theme.dart';
import 'package:manager/flutter_flow/flutter_flow_widgets.dart';
import 'package:manager/flutter_flow/upload_media.dart';
import 'package:manager/gigs/gigs_widget.dart';

// import 'flutter_flow/flutter_flow_calendar.dart';
// import 'flutter_flow/flutter_flow_theme.dart';
// import 'flutter_flow/flutter_flow_util.dart';
// import 'flutter_flow/flutter_flow_widgets.dart';
// import 'gigs/gigs_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../app_state.dart';

class AddGigWidget extends StatefulWidget {
  const AddGigWidget({Key key}) : super(key: key);

  @override
  _AddGigWidgetState createState() => _AddGigWidgetState();
}

class _AddGigWidgetState extends State<AddGigWidget> {
  DateTimeRange calendarSelectedDay;
  TextEditingController gigTitle;
  TextEditingController gigSalary;
  PageController pageViewController;
  TextEditingController gigDescription;
  TextEditingController gigConatctName;
  TextEditingController gigConatctEmail;
  TextEditingController gigConatctCompany;
  TextEditingController gigLocation;
  TextEditingController gigManagerName;
  TextEditingController gigShortLocation;
  final scaffoldKey = GlobalKey<ScaffoldState>();



  String dropdownvalue = 'music';

  var items = [
    'music',
    'model',
  ];
  @override
  void initState() {
    super.initState();
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
    gigTitle = TextEditingController();
    gigSalary = TextEditingController();
    gigDescription = TextEditingController();
     gigConatctName = TextEditingController();
     gigConatctEmail = TextEditingController();
     gigConatctCompany = TextEditingController();
    gigManagerName = TextEditingController();
     gigLocation = TextEditingController();
     gigShortLocation = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    var utils = Provider.of<Utils>(context, listen: true);
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
                child: PageView(
                  controller: pageViewController ??=
                      PageController(initialPage: 0),
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      // width: MediaQuery.of(context).size.width,
                      // height: MediaQuery.of(context).size.height * 1,
                      decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 100,
                              decoration: BoxDecoration(),
                              child: Image.asset(
                                'assets/images/logo.png',
                                width: 70,
                                height: 70,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 80, 0, 0),
                              child: Text(
                                'Enter title, salary and the date ',
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0),
                              child: Text(
                                'Title',
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                              child: TextFormField(
                                controller: gigTitle,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: 'Enter Gig Title',
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  filled: true,
                                  fillColor: Color(0x26303030),
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 0, 0),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xAE000000),
                                    ),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0),
                              child: Text(
                                'Short Location',
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ),
                            Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                              child: TextFormField(
                                controller: gigShortLocation,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: 'Enter Gig Short Loaction',
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  filled: true,
                                  fillColor: Color(0x26303030),
                                  contentPadding:
                                  EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 0, 0),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                  fontFamily: 'Poppins',
                                  color: Color(0xAE000000),
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0),
                              child: Text(
                                'Location',
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ),
                            Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                              child: TextFormField(
                                controller: gigLocation,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: 'Enter Gig Location',
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  filled: true,
                                  fillColor: Color(0x26303030),
                                  contentPadding:
                                  EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 0, 0),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                  fontFamily: 'Poppins',
                                  color: Color(0xAE000000),
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 10, 0, 0),
                              child: Text(
                                'Salary',
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                              child: TextFormField(
                                controller: gigSalary,
                                keyboardType: TextInputType.number,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: 'Enter Gig Salary',
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  filled: true,
                                  fillColor: Color(0x26303030),
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 0, 0),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xAE000000),
                                    ),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 40, 0, 0),
                              child: Text(
                                'Date',
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ),
                            FlutterFlowCalendar(
                              color: FlutterFlowTheme.of(context).primaryColor,
                              weekFormat: false,
                              weekStartsMonday: false,
                              onChange: (DateTimeRange newSelectedDate) {
                                setState(() =>
                                    calendarSelectedDay = newSelectedDate);
                              },
                              titleStyle: TextStyle(),
                              dayOfWeekStyle: TextStyle(),
                              dateStyle: TextStyle(),
                              selectedDateStyle: TextStyle(),
                              inactiveDateStyle: TextStyle(),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                width: 170,
                                height: 65,
                                margin: const EdgeInsets.only(bottom: 20),
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 20, 0, 0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      FocusScopeNode currentFocus = FocusScope.of(context);
                                      if (!currentFocus.hasPrimaryFocus) {
                                        currentFocus.unfocus();
                                      }
                                      if (gigTitle.text.isEmpty ||
                                          gigSalary.text.isEmpty || gigLocation.text.isEmpty || gigShortLocation.text.isEmpty||
                                          calendarSelectedDay == null) {
                                        Fluttertoast.showToast(
                                          msg: "Field is Required.",
                                          textColor: Colors.white,
                                        );
                                      } else {
                                        pageViewController.jumpToPage(1);
                                      }
                                    },
                                    text: 'Next',
                                    options: FFButtonOptions(
                                      width: 130,
                                      height: 40,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                            fontSize: 24,
                                          ),
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                      borderRadius: 30,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      // width: MediaQuery.of(context).size.width,
                      // height: MediaQuery.of(context).size.height * 1,
                      decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 100,
                              decoration: BoxDecoration(),
                              child: Image.asset(
                                'assets/images/logo.png',
                                width: 70,
                                height: 70,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20, 80, 20, 10),
                              child: Text(
                                'Enter the job details and any additional questions.',
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 15, 0, 10),
                              child: Text(
                                'Details',
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                              child: TextFormField(
                                controller: gigDescription,
                                obscureText: false,
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  filled: true,
                                  fillColor: Color(0x26303030),
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          10, 20, 0, 0),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xAE000000),
                                    ),
                                textAlign: TextAlign.start,
                                maxLines: 6,
                              ),
                            ),

                            Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(20, 10, 0, 0),
                              child: Text(
                                'Manager Name',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                  fontFamily: 'Poppins',
                                  color: Color(0x79303030),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                              child: TextFormField(
                                controller: gigManagerName,
                                obscureText: false,
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  filled: true,
                                  fillColor: Color(0x26303030),
                                  contentPadding:
                                  EdgeInsetsDirectional.fromSTEB(
                                      10, 10, 0, 0),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                  fontFamily: 'Poppins',
                                  color: Color(0xAE000000),
                                ),
                                textAlign: TextAlign.start,
                                maxLines: 2,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 10, 0, 0),
                              child: Text(
                                'Conatct Name',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Color(0x79303030),
                                    ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                              child: TextFormField(
                                controller: gigConatctName,
                                obscureText: false,
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  filled: true,
                                  fillColor: Color(0x26303030),
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          10, 10, 0, 0),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xAE000000),
                                    ),
                                textAlign: TextAlign.start,
                                maxLines: 2,
                              ),
                            ),
                            Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(20, 10, 0, 0),
                              child: Text(
                                'Conatct Company',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                  fontFamily: 'Poppins',
                                  color: Color(0x79303030),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                              child: TextFormField(
                                controller: gigConatctCompany,
                                obscureText: false,
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  filled: true,
                                  fillColor: Color(0x26303030),
                                  contentPadding:
                                  EdgeInsetsDirectional.fromSTEB(
                                      10, 10, 0, 0),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                  fontFamily: 'Poppins',
                                  color: Color(0xAE000000),
                                ),
                                textAlign: TextAlign.start,
                                maxLines: 2,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 10, 0, 0),
                              child: Text(
                                'Conatct Email',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Color(0x79303030),
                                    ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                              child: TextFormField(
                                controller: gigConatctEmail,
                                obscureText: false,
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  filled: true,
                                  fillColor: Color(0x26303030),
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          10, 10, 0, 0),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xAE000000),
                                    ),
                                textAlign: TextAlign.start,
                                maxLines: 2,
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                width: 170,
                                height: 65,
                                margin: const EdgeInsets.only(bottom: 20),
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 20, 0, 0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      FocusScopeNode currentFocus = FocusScope.of(context);
                                      if (!currentFocus.hasPrimaryFocus) {
                                        currentFocus.unfocus();
                                      }
                                      if (gigDescription.text.isEmpty ||
                                          gigConatctName.text.isEmpty ||
                                          gigConatctEmail.text.isEmpty||
                                          gigConatctCompany.text.isEmpty||
                                          gigManagerName.text.isEmpty
                                      ) {
                                        Fluttertoast.showToast(
                                          msg: "Field is Required.",
                                          textColor: Colors.white,
                                        );
                                      } else {
                                        pageViewController.jumpToPage(2);
                                      }
                                    },
                                    text: 'Next',
                                    options: FFButtonOptions(
                                      width: 130,
                                      height: 40,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                            fontSize: 24,
                                          ),
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                      borderRadius: 30,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      // width: MediaQuery.of(context).size.width,
                      // height: MediaQuery.of(context).size.height * 1,
                      decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 100,
                              decoration: BoxDecoration(),
                              child: Image.asset(
                                'assets/images/logo.png',
                                width: 70,
                                height: 70,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20, 80, 20, 10),
                              child: Row(
                                children: [
                                  Text(
                                    'Choose Category : ',
                                    style: FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                  DropdownButton(
                                    value: dropdownvalue,
                                    icon: const Icon(Icons.keyboard_arrow_down),
                                    items: items.map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Text(items),
                                      );
                                    }).toList(),
                                    onChanged: (String newValue) {
                                      setState(() {
                                        dropdownvalue = newValue;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20, 5, 20, 10),
                              child: Text(
                                'Choose Photos.',
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    utils.selectedImage1 == null
                                        ? Card(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                height: 100,
                                                child: Center(
                                                  child: Text(
                                                    'Select Image',
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        : Image.memory(
                                            utils.selectedImage1.bytes ?? "",
                                            fit: BoxFit.cover,
                                            width: 97,
                                            height: 130,
                                          ),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Gig/Job Image',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
                                        ),
                                        FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30,
                                          borderWidth: 1,
                                          buttonSize: 60,
                                          icon: Icon(
                                            Icons.add_box_outlined,
                                            color: Colors.black,
                                            size: 30,
                                          ),
                                          onPressed: () {
                                            selectMediaWithSourceBottomSheet(
                                              context: context,
                                              allowPhoto: true,
                                              allowDoc: false,
                                            ).then((value) {
                                              setState(() {
                                                utils.selectedImage1 = value;
                                              });
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    utils.selectedImage2 == null
                                        ? Card(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                height: 100,
                                                child: Center(
                                                  child: Text(
                                                    'Select Image',
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        : Image.memory(
                                            utils.selectedImage2.bytes ?? "",
                                            fit: BoxFit.cover,
                                            width: 97,
                                            height: 130,
                                          ),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Manager Image',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
                                        ),
                                        FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30,
                                          borderWidth: 1,
                                          buttonSize: 60,
                                          icon: Icon(
                                            Icons.add_box_outlined,
                                            color: Colors.black,
                                            size: 30,
                                          ),
                                          onPressed: () {
                                            selectMediaWithSourceBottomSheet(
                                              context: context,
                                              allowPhoto: true,
                                              allowDoc: false,
                                            ).then((value) {
                                              setState(() {
                                                utils.selectedImage2 = value;
                                              });
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                width: 170,
                                height: 65,
                                margin: const EdgeInsets.only(bottom: 20),
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 20, 0, 0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      if (utils.selectedImage1 == null ||
                                          utils.selectedImage2 == null) {
                                        Fluttertoast.showToast(
                                          msg: "Image is Required.",
                                          textColor: Colors.white,
                                        );
                                      } else {
                                        circularCustom(context);
                                        final downloadUrl1 = await uploadData(
                                            utils.selectedImage1.storagePath,
                                            utils.selectedImage1.bytes);
                                        final downloadUrl2 = await uploadData(
                                            utils.selectedImage2.storagePath,
                                            utils.selectedImage2.bytes);

                                        if (downloadUrl1 != null ||
                                            downloadUrl2 != null) {
                                          FocusScopeNode currentFocus = FocusScope.of(context);
                                          if (!currentFocus.hasPrimaryFocus) {
                                            currentFocus.unfocus();
                                          }
                                          FirebaseApi.createGig(
                                            contactCompany:   gigConatctCompany.text,
                                            contactEmail:   gigConatctEmail.text,
                                            contactName:   gigConatctName.text,
                                            gigTitle: gigTitle.text,
                                            salary: gigSalary.text,
                                            duration:
                                                calendarSelectedDay.duration.toString(),
                                            postTime: DateTime.now().toString(),
                                            date: '${calendarSelectedDay.start.day.toString()+"/"+calendarSelectedDay.start.month.toString()+"/"+calendarSelectedDay.start.year.toString()}-${calendarSelectedDay.end.day.toString()+"/"+calendarSelectedDay.end.month.toString()+"/"+calendarSelectedDay.end.year.toString()}',
                                            gigDescription:
                                            gigDescription.text,
                                            gigImage: downloadUrl1,
                                            managerPicture: downloadUrl2,
                                            shortlocation:   gigShortLocation.text,
                                            location:   gigLocation.text,
                                            managerName:   gigManagerName.text,
                                            gigType: dropdownvalue.toString(),
                                          ).then((value) {
                                            Navigator.pop(context);
                                            Navigator.pop(context);
                                          });
                                        }
                                      }
                                    },
                                    text: 'Next',
                                    options: FFButtonOptions(
                                      width: 130,
                                      height: 40,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                            fontSize: 24,
                                          ),
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                      borderRadius: 30,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.8, -0.7),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                  child: SmoothPageIndicator(
                    controller: pageViewController ??=
                        PageController(initialPage: 0),
                    count: 3,
                    axisDirection: Axis.horizontal,
                    onDotClicked: (i) {
                      pageViewController.animateToPage(
                        i,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    },
                    effect: ExpandingDotsEffect(
                      expansionFactor: 5,
                      spacing: 10,
                      radius: 3,
                      dotWidth: 16,
                      dotHeight: 16,
                      dotColor: Color(0xFF9E9E9E),
                      activeDotColor: FlutterFlowTheme.of(context).primaryColor,
                      paintStyle: PaintingStyle.fill,
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
