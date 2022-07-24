// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'check_address_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CheckAddressState {
  AppError? get error => throw _privateConstructorUsedError;
  Data? get data => throw _privateConstructorUsedError;
  String? get hash => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  String? get network => throw _privateConstructorUsedError;
  bool get pasteAddress => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CheckAddressStateCopyWith<CheckAddressState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckAddressStateCopyWith<$Res> {
  factory $CheckAddressStateCopyWith(
          CheckAddressState value, $Res Function(CheckAddressState) then) =
      _$CheckAddressStateCopyWithImpl<$Res>;
  $Res call(
      {AppError? error,
      Data? data,
      String? hash,
      bool loading,
      String? network,
      bool pasteAddress});
}

/// @nodoc
class _$CheckAddressStateCopyWithImpl<$Res>
    implements $CheckAddressStateCopyWith<$Res> {
  _$CheckAddressStateCopyWithImpl(this._value, this._then);

  final CheckAddressState _value;
  // ignore: unused_field
  final $Res Function(CheckAddressState) _then;

  @override
  $Res call({
    Object? error = freezed,
    Object? data = freezed,
    Object? hash = freezed,
    Object? loading = freezed,
    Object? network = freezed,
    Object? pasteAddress = freezed,
  }) {
    return _then(_value.copyWith(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as AppError?,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data?,
      hash: hash == freezed
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String?,
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      network: network == freezed
          ? _value.network
          : network // ignore: cast_nullable_to_non_nullable
              as String?,
      pasteAddress: pasteAddress == freezed
          ? _value.pasteAddress
          : pasteAddress // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_CheckAddressStateCopyWith<$Res>
    implements $CheckAddressStateCopyWith<$Res> {
  factory _$$_CheckAddressStateCopyWith(_$_CheckAddressState value,
          $Res Function(_$_CheckAddressState) then) =
      __$$_CheckAddressStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {AppError? error,
      Data? data,
      String? hash,
      bool loading,
      String? network,
      bool pasteAddress});
}

/// @nodoc
class __$$_CheckAddressStateCopyWithImpl<$Res>
    extends _$CheckAddressStateCopyWithImpl<$Res>
    implements _$$_CheckAddressStateCopyWith<$Res> {
  __$$_CheckAddressStateCopyWithImpl(
      _$_CheckAddressState _value, $Res Function(_$_CheckAddressState) _then)
      : super(_value, (v) => _then(v as _$_CheckAddressState));

  @override
  _$_CheckAddressState get _value => super._value as _$_CheckAddressState;

  @override
  $Res call({
    Object? error = freezed,
    Object? data = freezed,
    Object? hash = freezed,
    Object? loading = freezed,
    Object? network = freezed,
    Object? pasteAddress = freezed,
  }) {
    return _then(_$_CheckAddressState(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as AppError?,
      data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data?,
      hash == freezed
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String?,
      loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      network == freezed
          ? _value.network
          : network // ignore: cast_nullable_to_non_nullable
              as String?,
      pasteAddress == freezed
          ? _value.pasteAddress
          : pasteAddress // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_CheckAddressState implements _CheckAddressState {
  const _$_CheckAddressState(
      [this.error,
      this.data,
      this.hash,
      this.loading = false,
      this.network,
      this.pasteAddress = false]);

  @override
  final AppError? error;
  @override
  final Data? data;
  @override
  final String? hash;
  @override
  @JsonKey()
  final bool loading;
  @override
  final String? network;
  @override
  @JsonKey()
  final bool pasteAddress;

  @override
  String toString() {
    return 'CheckAddressState(error: $error, data: $data, hash: $hash, loading: $loading, network: $network, pasteAddress: $pasteAddress)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CheckAddressState &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality().equals(other.data, data) &&
            const DeepCollectionEquality().equals(other.hash, hash) &&
            const DeepCollectionEquality().equals(other.loading, loading) &&
            const DeepCollectionEquality().equals(other.network, network) &&
            const DeepCollectionEquality()
                .equals(other.pasteAddress, pasteAddress));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(data),
      const DeepCollectionEquality().hash(hash),
      const DeepCollectionEquality().hash(loading),
      const DeepCollectionEquality().hash(network),
      const DeepCollectionEquality().hash(pasteAddress));

  @JsonKey(ignore: true)
  @override
  _$$_CheckAddressStateCopyWith<_$_CheckAddressState> get copyWith =>
      __$$_CheckAddressStateCopyWithImpl<_$_CheckAddressState>(
          this, _$identity);
}

abstract class _CheckAddressState implements CheckAddressState {
  const factory _CheckAddressState(
      [final AppError? error,
      final Data? data,
      final String? hash,
      final bool loading,
      final String? network,
      final bool pasteAddress]) = _$_CheckAddressState;

  @override
  AppError? get error;
  @override
  Data? get data;
  @override
  String? get hash;
  @override
  bool get loading;
  @override
  String? get network;
  @override
  bool get pasteAddress;
  @override
  @JsonKey(ignore: true)
  _$$_CheckAddressStateCopyWith<_$_CheckAddressState> get copyWith =>
      throw _privateConstructorUsedError;
}
