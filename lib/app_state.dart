import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _question1answer =
        prefs.getString('ff_question1answer') ?? _question1answer;
  }

  SharedPreferences prefs;

  String _question1answer = '';
  String get question1answer => _question1answer;
  set question1answer(String _value) {
    _question1answer = _value;
    prefs.setString('ff_question1answer', _value);
  }
}

LatLng _latLngFromString(String val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
