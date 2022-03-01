import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:manager/AdminGid/add_gig_widget.dart';
import 'package:manager/Service/Firebase_service.dart';
import 'package:manager/Widget/CustomCircular.dart';
import 'package:manager/flutter_flow/flutter_flow_theme.dart';
import 'package:manager/flutter_flow/flutter_flow_widgets.dart';
import 'package:manager/model/Gigs.dart';
import 'package:manager/payment_2/payment2_widget.dart';

class GigList extends StatefulWidget {
  // const GigList() : super(key: key);

  @override
  _GigListState createState() => _GigListState();
}

class _GigListState extends State<GigList> {
  List<GigsModel> gigs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:  Container(
        width: 170,
        height:65,
        margin: const EdgeInsets.only(bottom: 20),
        decoration:
        BoxDecoration(),
        child: Padding(
          padding:
          EdgeInsetsDirectional
              .fromSTEB(0,
              20, 0, 0),
          child: FFButtonWidget(
            onPressed:
                () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      AddGigWidget(),
                ),
              );
            },
            text:  '+  Add new gig',
            options:
            FFButtonOptions(
              width: 130,
              height: 40,
              color: FlutterFlowTheme
                  .of(context)
                  .primaryColor,
              textStyle:
              FlutterFlowTheme.of(context)
                  .bodyText1
                  .override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 24,
              ),
              borderSide:
              BorderSide(
                color: Colors
                    .transparent,
                width: 1,
              ),
              borderRadius: 30,
            ),
          ),
        ),
      ),
      backgroundColor: Color(0xFFEEEEEE),
      appBar: AppBar(
        elevation: 2,
        title: Text('Gig Listing', style: TextStyle(color: Colors.black54, fontSize: 18),),
        backgroundColor: Color(0xFFEEEEEE),
      ),
      body:
      StreamBuilder(
        stream:
        FirebaseApi.getigStream(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            gigs = snapshot.data.docs
                .map((doc) => GigsModel.fromMap(doc.data(), doc.id))
                .toList();
            List<GigsModel> gigData = [];
            for (var v in gigs) {
              gigData.add(v);
            }
            gigData
                .sort((b, a) =>
                a.postTime.compareTo(b.postTime));
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Padding(
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
                );
              default:
                if (snapshot.hasError) {
                  return buildText(
                      'Something Went Wrong Try later', Colors.white);
                } else {
                  final gigs = gigData;
                  if (gigs.isEmpty) {
                    return buildText('No Music Gig Found', Colors.white);
                  } else {
                    return  ListView.builder(
                      itemCount: gigs.length,
                      itemBuilder: (context, index){
                        return  Card(
                          elevation: 2,
                          color: Colors.white,
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    children: [
                                      Text(gigs[index].gigTitle, style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54
                                      ),),
                                      Padding(
                                        padding: const EdgeInsets.only(left:8.0),
                                        child: Text(gigs[index].date, style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black26
                                        )),
                                      ),
                                      Spacer(),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Text('Salary', style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black
                                          )),
                                          Text(gigs[index].salary+"\$", style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black
                                          )),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(gigs[index].gigDescription),
                                ),
                              ],
                            ),
                          ),
                        );
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
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.white,
                    ),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
