// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchLawyerDetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchLawyerDetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchLawyerDetails,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchLawyerDetails value) fetchLawyerDetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchLawyerDetails value)? fetchLawyerDetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchLawyerDetails value)? fetchLawyerDetails,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeEventCopyWith<$Res> {
  factory $HomeEventCopyWith(HomeEvent value, $Res Function(HomeEvent) then) =
      _$HomeEventCopyWithImpl<$Res, HomeEvent>;
}

/// @nodoc
class _$HomeEventCopyWithImpl<$Res, $Val extends HomeEvent>
    implements $HomeEventCopyWith<$Res> {
  _$HomeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FetchLawyerDetailsCopyWith<$Res> {
  factory _$$FetchLawyerDetailsCopyWith(_$FetchLawyerDetails value,
          $Res Function(_$FetchLawyerDetails) then) =
      __$$FetchLawyerDetailsCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchLawyerDetailsCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$FetchLawyerDetails>
    implements _$$FetchLawyerDetailsCopyWith<$Res> {
  __$$FetchLawyerDetailsCopyWithImpl(
      _$FetchLawyerDetails _value, $Res Function(_$FetchLawyerDetails) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchLawyerDetails implements FetchLawyerDetails {
  const _$FetchLawyerDetails();

  @override
  String toString() {
    return 'HomeEvent.fetchLawyerDetails()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchLawyerDetails);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchLawyerDetails,
  }) {
    return fetchLawyerDetails();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchLawyerDetails,
  }) {
    return fetchLawyerDetails?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchLawyerDetails,
    required TResult orElse(),
  }) {
    if (fetchLawyerDetails != null) {
      return fetchLawyerDetails();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchLawyerDetails value) fetchLawyerDetails,
  }) {
    return fetchLawyerDetails(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchLawyerDetails value)? fetchLawyerDetails,
  }) {
    return fetchLawyerDetails?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchLawyerDetails value)? fetchLawyerDetails,
    required TResult orElse(),
  }) {
    if (fetchLawyerDetails != null) {
      return fetchLawyerDetails(this);
    }
    return orElse();
  }
}

abstract class FetchLawyerDetails implements HomeEvent {
  const factory FetchLawyerDetails() = _$FetchLawyerDetails;
}

/// @nodoc
mixin _$HomeState {
  bool get isError => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  List<LawyerModel> get lawyerDetails => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call({bool isError, bool isLoading, List<LawyerModel> lawyerDetails});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isError = null,
    Object? isLoading = null,
    Object? lawyerDetails = null,
  }) {
    return _then(_value.copyWith(
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      lawyerDetails: null == lawyerDetails
          ? _value.lawyerDetails
          : lawyerDetails // ignore: cast_nullable_to_non_nullable
              as List<LawyerModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$$InitialCopyWith(_$Initial value, $Res Function(_$Initial) then) =
      __$$InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isError, bool isLoading, List<LawyerModel> lawyerDetails});
}

/// @nodoc
class __$$InitialCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$Initial>
    implements _$$InitialCopyWith<$Res> {
  __$$InitialCopyWithImpl(_$Initial _value, $Res Function(_$Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isError = null,
    Object? isLoading = null,
    Object? lawyerDetails = null,
  }) {
    return _then(_$Initial(
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      lawyerDetails: null == lawyerDetails
          ? _value._lawyerDetails
          : lawyerDetails // ignore: cast_nullable_to_non_nullable
              as List<LawyerModel>,
    ));
  }
}

/// @nodoc

class _$Initial implements Initial {
  const _$Initial(
      {required this.isError,
      required this.isLoading,
      required final List<LawyerModel> lawyerDetails})
      : _lawyerDetails = lawyerDetails;

  @override
  final bool isError;
  @override
  final bool isLoading;
  final List<LawyerModel> _lawyerDetails;
  @override
  List<LawyerModel> get lawyerDetails {
    if (_lawyerDetails is EqualUnmodifiableListView) return _lawyerDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lawyerDetails);
  }

  @override
  String toString() {
    return 'HomeState(isError: $isError, isLoading: $isLoading, lawyerDetails: $lawyerDetails)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Initial &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._lawyerDetails, _lawyerDetails));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isError, isLoading,
      const DeepCollectionEquality().hash(_lawyerDetails));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialCopyWith<_$Initial> get copyWith =>
      __$$InitialCopyWithImpl<_$Initial>(this, _$identity);
}

abstract class Initial implements HomeState {
  const factory Initial(
      {required final bool isError,
      required final bool isLoading,
      required final List<LawyerModel> lawyerDetails}) = _$Initial;

  @override
  bool get isError;
  @override
  bool get isLoading;
  @override
  List<LawyerModel> get lawyerDetails;
  @override
  @JsonKey(ignore: true)
  _$$InitialCopyWith<_$Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
