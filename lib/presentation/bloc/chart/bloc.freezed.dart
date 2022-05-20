// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ChartEventTearOff {
  const _$ChartEventTearOff();

  GetHistoryDataEvent getHistoryData(DateTime timeStart, DateTime timeEnd) {
    return GetHistoryDataEvent(
      timeStart,
      timeEnd,
    );
  }
}

/// @nodoc
const $ChartEvent = _$ChartEventTearOff();

/// @nodoc
mixin _$ChartEvent {
  DateTime get timeStart => throw _privateConstructorUsedError;
  DateTime get timeEnd => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime timeStart, DateTime timeEnd)
        getHistoryData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(DateTime timeStart, DateTime timeEnd)? getHistoryData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime timeStart, DateTime timeEnd)? getHistoryData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetHistoryDataEvent value) getHistoryData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetHistoryDataEvent value)? getHistoryData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetHistoryDataEvent value)? getHistoryData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChartEventCopyWith<ChartEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChartEventCopyWith<$Res> {
  factory $ChartEventCopyWith(
          ChartEvent value, $Res Function(ChartEvent) then) =
      _$ChartEventCopyWithImpl<$Res>;
  $Res call({DateTime timeStart, DateTime timeEnd});
}

/// @nodoc
class _$ChartEventCopyWithImpl<$Res> implements $ChartEventCopyWith<$Res> {
  _$ChartEventCopyWithImpl(this._value, this._then);

  final ChartEvent _value;
  // ignore: unused_field
  final $Res Function(ChartEvent) _then;

  @override
  $Res call({
    Object? timeStart = freezed,
    Object? timeEnd = freezed,
  }) {
    return _then(_value.copyWith(
      timeStart: timeStart == freezed
          ? _value.timeStart
          : timeStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      timeEnd: timeEnd == freezed
          ? _value.timeEnd
          : timeEnd // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class $GetHistoryDataEventCopyWith<$Res>
    implements $ChartEventCopyWith<$Res> {
  factory $GetHistoryDataEventCopyWith(
          GetHistoryDataEvent value, $Res Function(GetHistoryDataEvent) then) =
      _$GetHistoryDataEventCopyWithImpl<$Res>;
  @override
  $Res call({DateTime timeStart, DateTime timeEnd});
}

/// @nodoc
class _$GetHistoryDataEventCopyWithImpl<$Res>
    extends _$ChartEventCopyWithImpl<$Res>
    implements $GetHistoryDataEventCopyWith<$Res> {
  _$GetHistoryDataEventCopyWithImpl(
      GetHistoryDataEvent _value, $Res Function(GetHistoryDataEvent) _then)
      : super(_value, (v) => _then(v as GetHistoryDataEvent));

  @override
  GetHistoryDataEvent get _value => super._value as GetHistoryDataEvent;

  @override
  $Res call({
    Object? timeStart = freezed,
    Object? timeEnd = freezed,
  }) {
    return _then(GetHistoryDataEvent(
      timeStart == freezed
          ? _value.timeStart
          : timeStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      timeEnd == freezed
          ? _value.timeEnd
          : timeEnd // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$GetHistoryDataEvent extends GetHistoryDataEvent {
  const _$GetHistoryDataEvent(this.timeStart, this.timeEnd) : super._();

  @override
  final DateTime timeStart;
  @override
  final DateTime timeEnd;

  @override
  String toString() {
    return 'ChartEvent.getHistoryData(timeStart: $timeStart, timeEnd: $timeEnd)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetHistoryDataEvent &&
            const DeepCollectionEquality().equals(other.timeStart, timeStart) &&
            const DeepCollectionEquality().equals(other.timeEnd, timeEnd));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(timeStart),
      const DeepCollectionEquality().hash(timeEnd));

  @JsonKey(ignore: true)
  @override
  $GetHistoryDataEventCopyWith<GetHistoryDataEvent> get copyWith =>
      _$GetHistoryDataEventCopyWithImpl<GetHistoryDataEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime timeStart, DateTime timeEnd)
        getHistoryData,
  }) {
    return getHistoryData(timeStart, timeEnd);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(DateTime timeStart, DateTime timeEnd)? getHistoryData,
  }) {
    return getHistoryData?.call(timeStart, timeEnd);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime timeStart, DateTime timeEnd)? getHistoryData,
    required TResult orElse(),
  }) {
    if (getHistoryData != null) {
      return getHistoryData(timeStart, timeEnd);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetHistoryDataEvent value) getHistoryData,
  }) {
    return getHistoryData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetHistoryDataEvent value)? getHistoryData,
  }) {
    return getHistoryData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetHistoryDataEvent value)? getHistoryData,
    required TResult orElse(),
  }) {
    if (getHistoryData != null) {
      return getHistoryData(this);
    }
    return orElse();
  }
}

abstract class GetHistoryDataEvent extends ChartEvent {
  const factory GetHistoryDataEvent(DateTime timeStart, DateTime timeEnd) =
      _$GetHistoryDataEvent;
  const GetHistoryDataEvent._() : super._();

  @override
  DateTime get timeStart;
  @override
  DateTime get timeEnd;
  @override
  @JsonKey(ignore: true)
  $GetHistoryDataEventCopyWith<GetHistoryDataEvent> get copyWith =>
      throw _privateConstructorUsedError;
}
