
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:manager/flutter_flow/upload_media.dart';


class Utils extends ChangeNotifier {
  String accountType = '';
  String status;
  String userID = "";
  String height = "";
  String weight = "";
  String hair = "";
  String eye = "";
  final picker = ImagePicker();


  setModelDetails({value1,value2,value3,value4}) {
    height = value1;
    weight = value2;
    hair = value3;
    eye = value4;
    notifyListeners();
  }

  setAccountType(value) {
    accountType = value;
    notifyListeners();
  }

  setStatus(value) {
    status = value;
    notifyListeners();
  }


  setUserID(value) {
    userID = value;
    notifyListeners();
  }


  SelectedMedia selectedImage1;
  SelectedMedia selectedImage2;
  SelectedMedia selectedImage3;



}
