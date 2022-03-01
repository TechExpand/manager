import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'gig_record.g.dart';

abstract class GigRecord implements Built<GigRecord, GigRecordBuilder> {
  static Serializer<GigRecord> get serializer => _$gigRecordSerializer;

  @nullable
  double get salary;

  @nullable
  String get date;

  @nullable
  String get manager;

  @nullable
  String get detail;

  @nullable
  String get location;

  @nullable
  String get questions;

  @nullable
  BuiltList<String> get category;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(GigRecordBuilder builder) => builder
    ..salary = 0.0
    ..date = ''
    ..manager = ''
    ..detail = ''
    ..location = ''
    ..questions = ''
    ..category = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('gig');

  static Stream<GigRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<GigRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  GigRecord._();
  factory GigRecord([void Function(GigRecordBuilder) updates]) = _$GigRecord;

  static GigRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createGigRecordData({
  double salary,
  String date,
  String manager,
  String detail,
  String location,
  String questions,
}) =>
    serializers.toFirestore(
        GigRecord.serializer,
        GigRecord((g) => g
          ..salary = salary
          ..date = date
          ..manager = manager
          ..detail = detail
          ..location = location
          ..questions = questions
          ..category = null));
