import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:manager/Provider/utils.dart';
import 'package:manager/Service/Firebase_service.dart';
import 'package:manager/Widget/CustomCircular.dart';
import 'package:manager/components/search.dart';
import 'package:manager/model/Gigs.dart';
import 'package:provider/provider.dart';
import 'package:search_page/search_page.dart';
import 'package:http/http.dart' as http;
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../gig_page/gig_page_widget.dart';
import '../gigs2/gigs2_widget.dart';
import '../profile/profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class GigsWidget extends StatefulWidget {
  const GigsWidget({Key key}) : super(key: key);

  @override
  _GigsWidgetState createState() => _GigsWidgetState();
}

class _GigsWidgetState extends State<GigsWidget> {
  TextEditingController searchFieldController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var profile;
  var gigstream;
  var modelstream;

  @override
  void initState() {
    super.initState();
    searchFieldController = TextEditingController();
    profile = FirebaseApi.getUserProfile();
    gigstream = FirebaseApi.getigStream();
    modelstream = FirebaseApi.getModelGigStream();
  }

  List<GigsModel> gigz;
  List<GigsModel> searchGig;



  Future<dynamic> getSubScription(id) async {
    var response = await http.get(
        Uri.parse('https://manger126.herokuapp.com/api/subscribe/${id}'),
        headers: {
          // "Content-type": "application/json",
          // 'Authorization': 'Bearer $bearer',
        });
    var body = json.decode(response.body);
    if (response.statusCode >= 300) {
      return "canceled";
    } else {
      return body['status'].toString();
    }
  }


  bool fired = false;

  @override
  Widget build(BuildContext context) {
    var utils = Provider.of<Utils>(context, listen: true);
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFC7C3FE),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              FlutterFlowTheme.of(context).primaryColor,
              Color(0xFFEE8B60)
            ],
            stops: [0, 1],
            begin: AlignmentDirectional(1, -1),
            end: AlignmentDirectional(-1, 1),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 60, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 4, 20, 0),
                        child: InkWell(
                          onTap: utils.status == "canceled"||utils.status ==null?(){
                            Fluttertoast.showToast(
                              msg: 'please subscribe',
                              textColor: Colors.white,
                            );
                          }:() {
                            showSearch(
                              context: context,
                              delegate: SearchPage<GigsModel>(
                                  barTheme: Theme.of(context).copyWith(
                                    textTheme: TextTheme(
                                      bodyText1: TextStyle(color: Colors.white),
                                      bodyText2: TextStyle(color: Colors.white),
                                      button: TextStyle(color: Colors.white),
                                      caption: TextStyle(color: Colors.white),
                                      subtitle1: TextStyle(color: Colors.white),
                                      // <-- that's the one
                                      headline1: TextStyle(color: Colors.white),
                                      headline2: TextStyle(color: Colors.white),
                                      headline3: TextStyle(color: Colors.white),
                                      headline4: TextStyle(color: Colors.white),
                                      headline5: TextStyle(color: Colors.white),
                                      headline6: TextStyle(color: Colors.white),
                                    ),
                                    inputDecorationTheme: InputDecorationTheme(
                                      hintStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                      focusedErrorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      border: InputBorder.none,
                                    ),
                                    appBarTheme: Theme.of(context)
                                        .appBarTheme
                                        .copyWith(
                                            backgroundColor: Color(0xFF4B39EF),
                                            elevation: 3,
                                            toolbarTextStyle:
                                                TextStyle(color: Colors.white)),
                                    scaffoldBackgroundColor: Colors.white,
                                  ),
                                  onQueryUpdate: (s) => print(s),
                                  items: searchGig,
                                  searchLabel: 'Search gig',
                                  suggestion: Center(
                                    child: Text(
                                        'Filter gigs by title, salary or city/country'),
                                  ),
                                  failure: Center(
                                    child: Text('No gig found'),
                                  ),
                                  filter: (gig) => [
                                        gig.gigTitle,
                                        gig.location,
                                        gig.salary.toString(),
                                        gig.shortlocation.toString(),
                                      ],
                                  builder: (gig) => Column(
                                        // mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 5, 0, 0),
                                            child: InkWell(
                                              onTap: () async {
                                                await Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        GigPageWidget(
                                                            data: gig),
                                                  ),
                                                );
                                              },
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                decoration: BoxDecoration(
                                                  color: Color(0xD0FFFFFF),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 3,
                                                      color: Color(0x41000000),
                                                      offset: Offset(0, 1),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(8, 12, 8, 12),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        width: 50,
                                                        height: 50,
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Image.network(
                                                          gig.gigImage,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(12,
                                                                      0, 0, 0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                gig.gigTitle,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .subtitle2
                                                                    .override(
                                                                      fontFamily:
                                                                          'Lexend Deca',
                                                                      color: Color(
                                                                          0xFF4B39EF),
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    gig.shortlocation,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1,
                                                                  ),
                                                                  Icon(
                                                                    Icons
                                                                        .navigate_next_sharp,
                                                                    color: Color(
                                                                        0xFF5E02D1),
                                                                    size: 20,
                                                                  ),
                                                                ],
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            4,
                                                                            0,
                                                                            0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              0,
                                                                              4,
                                                                              0),
                                                                      child:
                                                                          Text(
                                                                        'Posted',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
                                                                              fontFamily: 'Lexend Deca',
                                                                              color: Color(0xFF57636C),
                                                                              fontSize: 12,
                                                                              fontWeight: FontWeight.normal,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      compareDate(
                                                                          DateTime.parse(
                                                                              gig.postTime)),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText2
                                                                          .override(
                                                                            fontFamily:
                                                                                'Lexend Deca',
                                                                            color:
                                                                                Color(0xFF090F13),
                                                                            fontSize:
                                                                                12,
                                                                            fontWeight:
                                                                                FontWeight.normal,
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
                                              ),
                                            ),
                                          ),
                                        ],
                                      )),
                            );
                            // Navigator.push(
                            //   context,
                            //   PageRouteBuilder(
                            //     pageBuilder:
                            //         (context, animation, secondaryAnimation) {
                            //       return SearchMyHomePage();
                            //     },
                            //     transitionsBuilder: (context, animation,
                            //         secondaryAnimation, child) {
                            //       return FadeTransition(
                            //         opacity: animation,
                            //         child: child,
                            //       );
                            //     },
                            //   ),
                            // );
                          },
                          child: TextFormField(
                            controller: searchFieldController,
                            obscureText: false,
                            enabled: false,
                            decoration: InputDecoration(
                              isDense: true,
                              labelText: 'Search for gigs...',
                              hintText: 'Search by name, location etc...',
                              disabledBorder: OutlineInputBorder(
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
                              fillColor: Color(0x4DEFEFEF),
                              prefixIcon: Icon(
                                Icons.search_rounded,
                                color: Color(0xFF262D34),
                              ),
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF262D34),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 12, 1, 0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                            child: Text(
                              'MODELING',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    fontSize: 24,
                                  ),
                            ),
                          ),
                          Text(
                            '| ',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: Color(0x66FFFFFF),
                                      fontSize: 20,
                                    ),
                          ),
                          InkWell(
                            onTap: () async {
                              await Navigator.pushReplacement(
                                context,
                                PageRouteBuilder(
                                  pageBuilder:
                                      (context, animation, secondaryAnimation) {
                                    return Gigs2Widget();
                                  },
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    return FadeTransition(
                                      opacity: animation,
                                      child: child,
                                    );
                                  },
                                ),
                              );
                            },
                            child: Text(
                              'MUSIC',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Color(0x66FFFFFF),
                                    fontSize: 24,
                                  ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(100, 0, 0, 0),
                            child: InkWell(
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProfileWidget(),
                                  ),
                                );
                              },
                              child: Icon(
                                Icons.menu_sharp,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 8),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Latest Modeling Gigs',
                      style: FlutterFlowTheme.of(context).bodyText2.override(
                            fontFamily: 'Lexend Deca',
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 7,
                      color: Color(0x2F1D2429),
                      offset: Offset(0, 3),
                    )
                  ],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.local_police_rounded,
                              color: Color(0xFF4B39EF),
                              size: 44,
                            ),
                            Container(
                              height: 32,
                              decoration: BoxDecoration(
                                color: Color(0x4C4B39EF),
                                borderRadius: BorderRadius.circular(32),
                              ),
                              alignment: AlignmentDirectional(0, 0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 0, 16, 0),
                                child: Text(
                                  'Today',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: Color(0xFF4B39EF),
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Tag',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF39D2C0),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(4, 4, 0, 4),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Main Header',
                              style: FlutterFlowTheme.of(context)
                                  .subtitle1
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF090F13),
                                    fontSize: 20,
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
              StreamBuilder(
                  stream: profile,
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    return snapshot.hasData
                        ? Builder(builder: (context){
                           !fired?getSubScription(snapshot.data.docs[0]['subID']).then((value) {
                             var utils = Provider.of<Utils>(context, listen: false);
                             utils.setStatus(value);
                             fired = true;
                           }):null;
                            return StreamBuilder(
                              stream: gigstream,
                              builder: (context,
                                  AsyncSnapshot<QuerySnapshot> snapshot) {
                                if (snapshot.hasData) {
                                  searchGig = snapshot.data.docs
                                      .map((doc) =>
                                          GigsModel.fromMap(doc.data(), doc.id))
                                      .toList();
                                  List<GigsModel> gigData = [];
                                  for (var v in searchGig) {
                                    gigData.add(v);
                                  }
                                  gigData.sort((b, a) =>
                                      a.postTime.compareTo(b.postTime));
                                  switch (snapshot.connectionState) {
                                    case ConnectionState.waiting:
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                          child: Container(
                                            width: 23,
                                            height: 23,
                                            child:
                                                const CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    default:
                                      if (snapshot.hasError) {
                                        return buildText(
                                            'Something Went Wrong Try later',
                                            Colors.white);
                                      } else {
                                        final gigs = gigData;
                                        if (gigs.isEmpty) {
                                          return buildText('No Music Gig Found',
                                              Colors.white);
                                        } else {
                                          return StreamBuilder(
                                            stream: modelstream,
                                            builder: (context,
                                                AsyncSnapshot<QuerySnapshot>
                                                    snapshot) {
                                              if (snapshot.hasData) {
                                                gigz = snapshot.data.docs
                                                    .map((doc) =>
                                                        GigsModel.fromMap(
                                                            doc.data(), doc.id))
                                                    .toList();
                                                List<GigsModel> gigData = [];
                                                for (var v in gigz) {
                                                  gigData.add(v);
                                                }
                                                gigData.sort((b, a) => a
                                                    .postTime
                                                    .compareTo(b.postTime));
                                                switch (
                                                    snapshot.connectionState) {
                                                  case ConnectionState.waiting:
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Center(
                                                        child: Container(
                                                          width: 23,
                                                          height: 23,
                                                          child:
                                                              const CircularProgressIndicator(
                                                            valueColor:
                                                                AlwaysStoppedAnimation<
                                                                    Color>(
                                                              Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  default:
                                                    if (snapshot.hasError) {
                                                      return buildText(
                                                          'Something Went Wrong Try later',
                                                          Colors.white);
                                                    } else {
                                                      final gigs = gigData;
                                                      if (gigs.isEmpty) {
                                                        return buildText(
                                                            'No Music Gig Found',
                                                            Colors.white);
                                                      } else {
                                                        return SizedBox(
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.51,
                                                          child:
                                                              ListView.builder(
                                                            physics:
                                                                const NeverScrollableScrollPhysics(),
                                                            itemBuilder:
                                                                (context,
                                                                    index) {
                                                              return utils.status == "canceled"
                                                                  ? buildText(
                                                                      'Please Subscribe',
                                                                      Colors
                                                                          .white)
                                                                  :utils.status==null?Padding(
                                                                padding:
                                                                const EdgeInsets.all(8.0),
                                                                child: Center(
                                                                  child: Container(
                                                                    width: 23,
                                                                    height: 23,
                                                                    child:
                                                                    const CircularProgressIndicator(
                                                                      valueColor:
                                                                      AlwaysStoppedAnimation<
                                                                          Color>(
                                                                        Colors.white,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ): Column(
                                                                      // mainAxisSize: MainAxisSize.max,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              5,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              InkWell(
                                                                            onTap:
                                                                                () async {
                                                                              await Navigator.push(
                                                                                context,
                                                                                MaterialPageRoute(
                                                                                  builder: (context) => GigPageWidget(data: gigs[index]),
                                                                                ),
                                                                              );
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              width: MediaQuery.of(context).size.width,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0xD0FFFFFF),
                                                                                boxShadow: [
                                                                                  BoxShadow(
                                                                                    blurRadius: 3,
                                                                                    color: Color(0x41000000),
                                                                                    offset: Offset(0, 1),
                                                                                  )
                                                                                ],
                                                                                borderRadius: BorderRadius.circular(8),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(8, 12, 8, 12),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Container(
                                                                                      width: 50,
                                                                                      height: 50,
                                                                                      clipBehavior: Clip.antiAlias,
                                                                                      decoration: BoxDecoration(
                                                                                        shape: BoxShape.circle,
                                                                                      ),
                                                                                      child: Image.network(
                                                                                        gigs[index].gigImage,
                                                                                        fit: BoxFit.cover,
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Text(
                                                                                              gigs[index].gigTitle,
                                                                                              style: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                                    fontFamily: 'Lexend Deca',
                                                                                                    color: Color(0xFF4B39EF),
                                                                                                    fontSize: 16,
                                                                                                    fontWeight: FontWeight.normal,
                                                                                                  ),
                                                                                            ),
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                Text(
                                                                                                  gigs[index].shortlocation,
                                                                                                  style: FlutterFlowTheme.of(context).bodyText1,
                                                                                                ),
                                                                                                Icon(
                                                                                                  Icons.navigate_next_sharp,
                                                                                                  color: Color(0xFF5E02D1),
                                                                                                  size: 20,
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 4, 0),
                                                                                                    child: Text(
                                                                                                      'Posted',
                                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                            fontFamily: 'Lexend Deca',
                                                                                                            color: Color(0xFF57636C),
                                                                                                            fontSize: 12,
                                                                                                            fontWeight: FontWeight.normal,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  Text(
                                                                                                    compareDate(DateTime.parse(gigs[index].postTime)),
                                                                                                    style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                                          fontFamily: 'Lexend Deca',
                                                                                                          color: Color(0xFF090F13),
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
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    );
                                                            },
                                                            itemCount:
                                                                gigs.length,
                                                          ),
                                                        );
                                                      }
                                                    }
                                                }
                                              } else {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Center(
                                                    child: Container(
                                                      width: 23,
                                                      height: 23,
                                                      child:
                                                          const CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                            },
                                          );
                                        }
                                      }
                                  }
                                } else {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Container(
                                        width: 23,
                                        height: 23,
                                        child: const CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              },
                            );
                          })
                        : buildText('No Music Gig Found', Colors.white);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
