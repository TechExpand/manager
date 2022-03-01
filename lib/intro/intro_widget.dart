import 'package:manager/Provider/utils.dart';
import 'package:manager/register/register_widget.dart';
import 'package:provider/provider.dart';

import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../login/login_widget.dart';
import '../register_type/register_type_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroWidget extends StatefulWidget {
  const IntroWidget({Key key}) : super(key: key);

  @override
  _IntroWidgetState createState() => _IntroWidgetState();
}

class _IntroWidgetState extends State<IntroWidget>
    with TickerProviderStateMixin {

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 1000,
      delay: 1000,
      fadeIn: true,
      initialState: AnimationState(
        opacity: 0,
      ),
      finalState: AnimationState(
        opacity: 1,
      ),
    ),
    'columnOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 100,
      fadeIn: true,
      initialState: AnimationState(
        opacity: 0,
      ),
      finalState: AnimationState(
        opacity: 1,
      ),
    ),
    'imageOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 1100,
      fadeIn: true,
      initialState: AnimationState(
        scale: 0.4,
        opacity: 0,
      ),
      finalState: AnimationState(
        scale: 1,
        opacity: 1,
      ),
    ),
    'textOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 1100,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 70),
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        opacity: 1,
      ),
    ),
    'textOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 1100,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 100),
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        opacity: 1,
      ),
    ),
  };
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );
  }

  @override
  Widget build(BuildContext context) {
    var utils = Provider.of<Utils>(context, listen: false);
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF1E2429),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF4B39EF), Color(0xFFEE8B60)],
            stops: [0, 1],
            begin: AlignmentDirectional(1, -1),
            end: AlignmentDirectional(-1, 1),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 140,
              height: 140,
              fit: BoxFit.fitHeight,
            ).animated([animationsMap['imageOnPageLoadAnimation']]),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
              child: Text(
                'Welcome to ManagR',
                style: FlutterFlowTheme.of(context).title1.override(
                      fontFamily: 'Lexend Deca',
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
              ).animated([animationsMap['textOnPageLoadAnimation1']]),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 120),
              child: Text(
                'Powered by MMC Management',
                style: FlutterFlowTheme.of(context).title3.override(
                      fontFamily: 'Lexend Deca',
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
              ).animated([animationsMap['textOnPageLoadAnimation2']]),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
              child: FFButtonWidget(
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginWidget(),
                    ),
                  );
                },
                text: 'sign in',
                options: FFButtonOptions(
                  width: 130,
                  height: 40,
                  color: Colors.white,
                  textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily: 'Poppins',
                        color: Color(0x8B000000),
                      ),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: 30,
                ),
              ),
            ),
            FFButtonWidget(
              onPressed: () async {
                await Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.rightToLeft,
                    duration: Duration(milliseconds: 10),
                    reverseDuration: Duration(milliseconds: 10),
                    child: RegisterWidget(),
                  ),
                );
              },
              text: 'register',
              options: FFButtonOptions(
                width: 130,
                height: 40,
                color: Color(0xFFEFEFEF),
                textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                      fontFamily: 'Poppins',
                      color: Color(0x8B000000),
                    ),
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
                borderRadius: 30,
              ),
            ),
          ],
        ).animated([animationsMap['columnOnPageLoadAnimation']]),
      ).animated([animationsMap['containerOnPageLoadAnimation']]),
    );
  }
}
