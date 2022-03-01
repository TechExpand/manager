// import 'package:fixme/Services/network_service.dart';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:manager/Provider/utils.dart';
import 'package:manager/gigs/gigs_widget.dart';
import 'package:manager/payment_2/payment2_widget.dart';
import 'package:manager/register_details/register_details_widget.dart';
import 'package:manager/register_details/register_details_widget.dart';
import 'package:manager/register_details_music/register_details_music_widget.dart';
import 'package:path/path.dart' as Path;
import 'package:cloud_firestore/cloud_firestore.dart' ;
import 'package:firebase_storage/firebase_storage.dart';
// import 'package:fixme/Model/Message.dart';
// import 'package:fixme/Model/User.dart';
// import 'package:fixme/Utils/utils.dart';
// import 'package:provider/provider.dart';
import 'dart:async';
import 'dart:io';

import 'package:provider/provider.dart';

class FirebaseApi {


  static Future Login({email,password, context, scaffoldKey})async{
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.toString(),
          password: password.toString()
      );

      if(userCredential.user != null){
        Navigator.pop(context);
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>  GigsWidget(),
            ));
        // FirebaseFirestore.instance.
        // collection('Profile').
        // doc(userCredential.user.uid).get().then((val){
        //
        // });
        // setUserid(userCredential.user.uid);
        return userCredential.user.uid;
      }
    } on FirebaseAuthException catch (e) {
      print(e);
      if (e.code == 'user-not-found') {
        Navigator.pop(context);
        Fluttertoast.showToast(
          msg: "No user found for that email.",
          textColor: Colors.white,
        );
      } else if (e.code == 'wrong-password') {
        Navigator.pop(context);
        Fluttertoast.showToast(
          msg: "Wrong password provided for that user.",
          textColor: Colors.white,
        );
      }else{
        Navigator.pop(context);
        Fluttertoast.showToast(
          msg: "invalid credentials.",
          textColor: Colors.white,
        );
      }
    }
  }




  static Future register({String email, password,username,  context, scaffoldKey}) async {
    var utils = Provider.of<Utils>(context, listen: false);
    try {
      var userCredential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );


      print(userCredential.user.email);

      if (userCredential.user != null) {
       Navigator.pop(context);
        createUser(
          name: username,
          urlAvatar: "",
          email: email,
          id: userCredential.user.uid,
        );
       Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return  Payment2Widget();
                },
            ));
       utils.setUserID(userCredential.user.uid);
        return userCredential.user.uid;
      }
    } on FirebaseAuthException catch (e) {
      print(e);
      if (e.code == 'weak-password') {
        Navigator.pop(context);
        Fluttertoast.showToast(
            msg: "The password provided is too weak.",
            textColor: Colors.white,
        );
      } else if (e.code == 'email-already-in-use') {
        print(e);
        Navigator.pop(context);
        Fluttertoast.showToast(
          msg: "Email Already exist.",
          textColor: Colors.white,
        );

      }else{
        Navigator.pop(context);
        Fluttertoast.showToast(
          msg: e.code,
          textColor: Colors.white,
        );
      }
    } catch (e) {
      print(e);
      Navigator.pop(context);
      Fluttertoast.showToast(
        msg: e.code,
        textColor: Colors.white,
      );
    }
  }



  static Stream<QuerySnapshot> getMusicGigStream() {
    var data = FirebaseFirestore.instance
        .collection('gigs')
        .where('gigType', isEqualTo: "music");
    return data.snapshots();
  }


  static Stream<QuerySnapshot> getigStream() {
    var data = FirebaseFirestore.instance
        .collection('gigs');
    return data.snapshots();
  }

  static Stream<QuerySnapshot> getModelGigStream() {
    var data = FirebaseFirestore.instance
        .collection('gigs')
        .where('gigType', isEqualTo: "model");
    return data.snapshots();
  }


  static Stream<QuerySnapshot> getUserProfile() {
     FirebaseAuth user = FirebaseAuth.instance;
    String userid = user.currentUser==null?'':user.currentUser.uid;
    var data = FirebaseFirestore.instance
        .collection('User')
        .where('id', isEqualTo: userid);
    return data.snapshots();
  }



  static Stream<QuerySnapshot> getAccountTypeProfile() {
    FirebaseAuth user = FirebaseAuth.instance;
    String userid = user.currentUser==null?'':user.currentUser.uid;
    print(userid);
    print(userid);
    var data = FirebaseFirestore.instance
        .collection('AccountTypeDetail')
        .where('user', isEqualTo: userid);
    return data.snapshots();
  }




  static Future createUser({
    name,
    urlAvatar,
    email,
    id,
  }) async {
    final refUsers =
    FirebaseFirestore.instance.collection('User');
    await refUsers.doc(id).set({
      'name': name ?? '',
      'urlAvatar': urlAvatar ?? '',
      'email': email ?? '',
      'id': id ?? '',
      "subID": "111",
      "cusID": "111",
      "cardID": "111",
    });

  }



  static Future updateUserProfile({
    name,
    urlAvatar,
    email,
    id,
  }) async {
    final refUsers =
    FirebaseFirestore.instance.collection('User');
    await refUsers.doc(id).update({
      'name': name ?? '',
      'urlAvatar': urlAvatar ?? '',
      'email': email ?? '',
      'id': id ?? '',
    });

  }




  static Future updateUserProfileSub({
    subID,
    cardID,
    cusID,
    id,
  }) async {
    final refUsers =
    FirebaseFirestore.instance.collection('User');
    await refUsers.doc(id).update({
      'subID': subID ?? '',
      'cardID': cardID ?? '',
      'cusID': cusID ?? '',
    });

  }


  static Future updateAccountTypeDetail({
    accountType,
    height,
    weight,
    eye,
    id,
    hair,
    file1,
    file2,
    file3,
    user,
  }) async {
    final refUsers =
    FirebaseFirestore.instance.collection('AccountTypeDetail');
    await refUsers.doc(id).update({
      'accountType': accountType ?? '',
      'height': height ?? '',
      'weight': weight ?? '',
      'user': user ?? '',
      "eye": eye ?? "",
      "hair": hair ?? "",
      "file1": file1 ?? "",
      "file2": file2 ?? "",
      "file3": file3 ?? "",
    });

  }


  static const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  static Random _rnd = Random();

  static String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  static Future createAccountTypeDetail({
    accountType,
    height,
    weight,
    eye,
    hair,
    file1,
    file2,
    file3,
    user,
  }) async {
    final refUsers =
    FirebaseFirestore.instance.collection('AccountTypeDetail');
    String id = getRandomString(20);
    await refUsers.doc(id).set({
      'accountType': accountType ?? '',
      'height': height ?? '',
      'weight': weight ?? '',
      'user': user ?? '',
      "eye": eye ?? "",
      "id": id ??"",
      "hair": hair ?? "",
      "file1": file1 ?? "",
      "file2": file2 ?? "",
      "file3": file3 ?? "",
    });

  }






  static Future createGig({
    gigTitle,
    salary,
    date,
    shortlocation,
    gigDescription,
    location,
    managerPicture,
    contactName,
    contactEmail,
    contactCompany,
    managerName,
    postTime,
    duration,
    gigType,
    gigImage,
  }) async {
    final refUsers =
    FirebaseFirestore.instance.collection('gigs');
    String id = getRandomString(20);
    await refUsers.doc(id).set({
      'date': date ?? '',
      'duration': duration ?? '',
      'question': 'question' ?? '',
      'salary': salary ?? '',
      'contactName': contactName ?? '',
      'contactEmail': contactEmail ?? '',
      'contactCompany': contactCompany ?? '',
      'location': location ?? '',
      'shortlocation': shortlocation??'',
      'gigImage': gigImage ?? '',
      "postTime": postTime ?? "",
      "managerName": managerName ??"",
      "managerPicture": managerPicture ?? "",
      "gigTitle": gigTitle ?? "",
      "gigDescription": gigDescription ?? "",
      "gigType": gigType ?? "",
    });

  }

}
