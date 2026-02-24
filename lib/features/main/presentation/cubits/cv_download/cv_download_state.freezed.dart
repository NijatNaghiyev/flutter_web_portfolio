// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cv_download_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CvDownloadState {

 String? get cvDownloadPath; CvDownloadStatus get status;
/// Create a copy of CvDownloadState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CvDownloadStateCopyWith<CvDownloadState> get copyWith => _$CvDownloadStateCopyWithImpl<CvDownloadState>(this as CvDownloadState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CvDownloadState&&(identical(other.cvDownloadPath, cvDownloadPath) || other.cvDownloadPath == cvDownloadPath)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,cvDownloadPath,status);

@override
String toString() {
  return 'CvDownloadState(cvDownloadPath: $cvDownloadPath, status: $status)';
}


}

/// @nodoc
abstract mixin class $CvDownloadStateCopyWith<$Res>  {
  factory $CvDownloadStateCopyWith(CvDownloadState value, $Res Function(CvDownloadState) _then) = _$CvDownloadStateCopyWithImpl;
@useResult
$Res call({
 String? cvDownloadPath, CvDownloadStatus status
});




}
/// @nodoc
class _$CvDownloadStateCopyWithImpl<$Res>
    implements $CvDownloadStateCopyWith<$Res> {
  _$CvDownloadStateCopyWithImpl(this._self, this._then);

  final CvDownloadState _self;
  final $Res Function(CvDownloadState) _then;

/// Create a copy of CvDownloadState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cvDownloadPath = freezed,Object? status = null,}) {
  return _then(_self.copyWith(
cvDownloadPath: freezed == cvDownloadPath ? _self.cvDownloadPath : cvDownloadPath // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CvDownloadStatus,
  ));
}

}


/// Adds pattern-matching-related methods to [CvDownloadState].
extension CvDownloadStatePatterns on CvDownloadState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CvDownloadState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CvDownloadState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CvDownloadState value)  $default,){
final _that = this;
switch (_that) {
case _CvDownloadState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CvDownloadState value)?  $default,){
final _that = this;
switch (_that) {
case _CvDownloadState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? cvDownloadPath,  CvDownloadStatus status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CvDownloadState() when $default != null:
return $default(_that.cvDownloadPath,_that.status);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? cvDownloadPath,  CvDownloadStatus status)  $default,) {final _that = this;
switch (_that) {
case _CvDownloadState():
return $default(_that.cvDownloadPath,_that.status);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? cvDownloadPath,  CvDownloadStatus status)?  $default,) {final _that = this;
switch (_that) {
case _CvDownloadState() when $default != null:
return $default(_that.cvDownloadPath,_that.status);case _:
  return null;

}
}

}

/// @nodoc


class _CvDownloadState implements CvDownloadState {
  const _CvDownloadState({this.cvDownloadPath, this.status = CvDownloadStatus.initial});
  

@override final  String? cvDownloadPath;
@override@JsonKey() final  CvDownloadStatus status;

/// Create a copy of CvDownloadState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CvDownloadStateCopyWith<_CvDownloadState> get copyWith => __$CvDownloadStateCopyWithImpl<_CvDownloadState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CvDownloadState&&(identical(other.cvDownloadPath, cvDownloadPath) || other.cvDownloadPath == cvDownloadPath)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,cvDownloadPath,status);

@override
String toString() {
  return 'CvDownloadState(cvDownloadPath: $cvDownloadPath, status: $status)';
}


}

/// @nodoc
abstract mixin class _$CvDownloadStateCopyWith<$Res> implements $CvDownloadStateCopyWith<$Res> {
  factory _$CvDownloadStateCopyWith(_CvDownloadState value, $Res Function(_CvDownloadState) _then) = __$CvDownloadStateCopyWithImpl;
@override @useResult
$Res call({
 String? cvDownloadPath, CvDownloadStatus status
});




}
/// @nodoc
class __$CvDownloadStateCopyWithImpl<$Res>
    implements _$CvDownloadStateCopyWith<$Res> {
  __$CvDownloadStateCopyWithImpl(this._self, this._then);

  final _CvDownloadState _self;
  final $Res Function(_CvDownloadState) _then;

/// Create a copy of CvDownloadState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cvDownloadPath = freezed,Object? status = null,}) {
  return _then(_CvDownloadState(
cvDownloadPath: freezed == cvDownloadPath ? _self.cvDownloadPath : cvDownloadPath // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CvDownloadStatus,
  ));
}


}

// dart format on
