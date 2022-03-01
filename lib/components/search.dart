import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:manager/Service/Firebase_service.dart';
import 'package:manager/Widget/CustomCircular.dart';
import 'package:manager/flutter_flow/flutter_flow_theme.dart';
import 'package:manager/gig_page/gig_page_widget.dart';
import 'package:manager/model/Gigs.dart';
import 'package:search_page/search_page.dart';

/// This is a very simple class, used to
/// demo the `SearchPage` package
class Person {
  final String name, surname;
  final num age;

  Person(this.name, this.surname, this.age);
}





class SearchMyHomePage extends StatelessWidget {

  List<GigsModel> gigs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
        elevation: 0,
      ),
      body:  Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                FlutterFlowTheme.of(context).primaryColor,
                Color(0xFFEE8B60)
              ],
              stops: [0, 1],
              begin: AlignmentDirectional(0, -1),
              end: AlignmentDirectional(0, 1),
            ),
          ),
        child: StreamBuilder(
          stream: FirebaseApi.getigStream(),
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
                        itemBuilder: (context, index) {
                          final GigsModel gig = gigData[index];
                          return Column(
                            // mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                child: InkWell(
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => GigPageWidget(data:gigs[index]),
                                      ),
                                    );
                                  },
                                  child: Container(
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
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8, 12, 8, 12),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width:50,
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
                                              padding: EdgeInsetsDirectional.fromSTEB(
                                                  12, 0, 0, 0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    gigs[index].gigTitle,
                                                    style: FlutterFlowTheme.of(
                                                        context)
                                                        .subtitle2
                                                        .override(
                                                      fontFamily: 'Lexend Deca',
                                                      color: Color(0xFF4B39EF),
                                                      fontSize: 16,
                                                      fontWeight:
                                                      FontWeight.normal,
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisSize: MainAxisSize.max,
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Text(
                                                        gigs[index].shortlocation,
                                                        style: FlutterFlowTheme.of(
                                                            context)
                                                            .bodyText1,
                                                      ),
                                                      Icon(
                                                        Icons.navigate_next_sharp,
                                                        color: Color(0xFF5E02D1),
                                                        size: 20,
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsetsDirectional
                                                        .fromSTEB(0, 4, 0, 0),
                                                    child: Row(
                                                      mainAxisSize: MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                              0, 0, 4, 0),
                                                          child: Text(
                                                            'Posted',
                                                            style:
                                                            FlutterFlowTheme.of(
                                                                context)
                                                                .bodyText1
                                                                .override(
                                                              fontFamily:
                                                              'Lexend Deca',
                                                              color: Color(
                                                                  0xFF57636C),
                                                              fontSize: 12,
                                                              fontWeight:
                                                              FontWeight
                                                                  .normal,
                                                            ),
                                                          ),
                                                        ),
                                                        Text(
                                                          compareDate(DateTime.parse(gigs[index].postTime)),
                                                          style: FlutterFlowTheme.of(
                                                              context)
                                                              .bodyText2
                                                              .override(
                                                            fontFamily:
                                                            'Lexend Deca',
                                                            color:
                                                            Color(0xFF090F13),
                                                            fontSize: 12,
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
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Search gigs',
        onPressed: () => showSearch(
          context: context,
          delegate: SearchPage<GigsModel>(
            onQueryUpdate: (s) => print(s),
            items: gigs,
            searchLabel: 'Search gig',
            suggestion: Center(
              child: Text('Filter gigs by title, salary or city/country'),
            ),
            failure: Center(
              child: Text('No gig found'),
            ),
            filter: (gig) => [
              gig.gigTitle,
              gig.location,
              gig.salary.toString(),
            ],
            builder: (gig) => ListTile(
              title: Text(gig.gigTitle),
              trailing: Text('${gig.salary}\$'),
            ),
          ),
        ),
        child: Icon(Icons.search),
      ),
    );
  }
}