// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gig_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GigRecord> _$gigRecordSerializer = new _$GigRecordSerializer();

class _$GigRecordSerializer implements StructuredSerializer<GigRecord> {
  @override
  final Iterable<Type> types = const [GigRecord, _$GigRecord];
  @override
  final String wireName = 'GigRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, GigRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.salary;
    if (value != null) {
      result
        ..add('salary')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.date;
    if (value != null) {
      result
        ..add('date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.manager;
    if (value != null) {
      result
        ..add('manager')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.detail;
    if (value != null) {
      result
        ..add('detail')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.location;
    if (value != null) {
      result
        ..add('location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.questions;
    if (value != null) {
      result
        ..add('questions')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.category;
    if (value != null) {
      result
        ..add('category')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.reference;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    return result;
  }

  @override
  GigRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GigRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'salary':
          result.salary = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'manager':
          result.manager = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'detail':
          result.detail = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'questions':
          result.questions = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'category':
          result.category.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'Document__Reference__Field':
          result.reference = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
      }
    }

    return result.build();
  }
}

class _$GigRecord extends GigRecord {
  @override
  final double salary;
  @override
  final String date;
  @override
  final String manager;
  @override
  final String detail;
  @override
  final String location;
  @override
  final String questions;
  @override
  final BuiltList<String> category;
  @override
  final DocumentReference<Object> reference;

  factory _$GigRecord([void Function(GigRecordBuilder) updates]) =>
      (new GigRecordBuilder()..update(updates)).build();

  _$GigRecord._(
      {this.salary,
      this.date,
      this.manager,
      this.detail,
      this.location,
      this.questions,
      this.category,
      this.reference})
      : super._();

  @override
  GigRecord rebuild(void Function(GigRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GigRecordBuilder toBuilder() => new GigRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GigRecord &&
        salary == other.salary &&
        date == other.date &&
        manager == other.manager &&
        detail == other.detail &&
        location == other.location &&
        questions == other.questions &&
        category == other.category &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, salary.hashCode), date.hashCode),
                            manager.hashCode),
                        detail.hashCode),
                    location.hashCode),
                questions.hashCode),
            category.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GigRecord')
          ..add('salary', salary)
          ..add('date', date)
          ..add('manager', manager)
          ..add('detail', detail)
          ..add('location', location)
          ..add('questions', questions)
          ..add('category', category)
          ..add('reference', reference))
        .toString();
  }
}

class GigRecordBuilder implements Builder<GigRecord, GigRecordBuilder> {
  _$GigRecord _$v;

  double _salary;
  double get salary => _$this._salary;
  set salary(double salary) => _$this._salary = salary;

  String _date;
  String get date => _$this._date;
  set date(String date) => _$this._date = date;

  String _manager;
  String get manager => _$this._manager;
  set manager(String manager) => _$this._manager = manager;

  String _detail;
  String get detail => _$this._detail;
  set detail(String detail) => _$this._detail = detail;

  String _location;
  String get location => _$this._location;
  set location(String location) => _$this._location = location;

  String _questions;
  String get questions => _$this._questions;
  set questions(String questions) => _$this._questions = questions;

  ListBuilder<String> _category;
  ListBuilder<String> get category =>
      _$this._category ??= new ListBuilder<String>();
  set category(ListBuilder<String> category) => _$this._category = category;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  GigRecordBuilder() {
    GigRecord._initializeBuilder(this);
  }

  GigRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _salary = $v.salary;
      _date = $v.date;
      _manager = $v.manager;
      _detail = $v.detail;
      _location = $v.location;
      _questions = $v.questions;
      _category = $v.category?.toBuilder();
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GigRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GigRecord;
  }

  @override
  void update(void Function(GigRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GigRecord build() {
    _$GigRecord _$result;
    try {
      _$result = _$v ??
          new _$GigRecord._(
              salary: salary,
              date: date,
              manager: manager,
              detail: detail,
              location: location,
              questions: questions,
              category: _category?.build(),
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'category';
        _category?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GigRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
