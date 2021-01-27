// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'account_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$AccountStateTearOff {
  const _$AccountStateTearOff();

// ignore: unused_element
  _AccountState call(
      {bool isLoading = false,
      String name = '',
      String content = '',
      String token = ''}) {
    return _AccountState(
      isLoading: isLoading,
      name: name,
      content: content,
      token: token,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $AccountState = _$AccountStateTearOff();

/// @nodoc
mixin _$AccountState {
  bool get isLoading;
  String get name;
  String get content;
  String get token;

  @JsonKey(ignore: true)
  $AccountStateCopyWith<AccountState> get copyWith;
}

/// @nodoc
abstract class $AccountStateCopyWith<$Res> {
  factory $AccountStateCopyWith(
          AccountState value, $Res Function(AccountState) then) =
      _$AccountStateCopyWithImpl<$Res>;
  $Res call({bool isLoading, String name, String content, String token});
}

/// @nodoc
class _$AccountStateCopyWithImpl<$Res> implements $AccountStateCopyWith<$Res> {
  _$AccountStateCopyWithImpl(this._value, this._then);

  final AccountState _value;
  // ignore: unused_field
  final $Res Function(AccountState) _then;

  @override
  $Res call({
    Object isLoading = freezed,
    Object name = freezed,
    Object content = freezed,
    Object token = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
      name: name == freezed ? _value.name : name as String,
      content: content == freezed ? _value.content : content as String,
      token: token == freezed ? _value.token : token as String,
    ));
  }
}

/// @nodoc
abstract class _$AccountStateCopyWith<$Res>
    implements $AccountStateCopyWith<$Res> {
  factory _$AccountStateCopyWith(
          _AccountState value, $Res Function(_AccountState) then) =
      __$AccountStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isLoading, String name, String content, String token});
}

/// @nodoc
class __$AccountStateCopyWithImpl<$Res> extends _$AccountStateCopyWithImpl<$Res>
    implements _$AccountStateCopyWith<$Res> {
  __$AccountStateCopyWithImpl(
      _AccountState _value, $Res Function(_AccountState) _then)
      : super(_value, (v) => _then(v as _AccountState));

  @override
  _AccountState get _value => super._value as _AccountState;

  @override
  $Res call({
    Object isLoading = freezed,
    Object name = freezed,
    Object content = freezed,
    Object token = freezed,
  }) {
    return _then(_AccountState(
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
      name: name == freezed ? _value.name : name as String,
      content: content == freezed ? _value.content : content as String,
      token: token == freezed ? _value.token : token as String,
    ));
  }
}

/// @nodoc
class _$_AccountState with DiagnosticableTreeMixin implements _AccountState {
  const _$_AccountState(
      {this.isLoading = false,
      this.name = '',
      this.content = '',
      this.token = ''})
      : assert(isLoading != null),
        assert(name != null),
        assert(content != null),
        assert(token != null);

  @JsonKey(defaultValue: false)
  @override
  final bool isLoading;
  @JsonKey(defaultValue: '')
  @override
  final String name;
  @JsonKey(defaultValue: '')
  @override
  final String content;
  @JsonKey(defaultValue: '')
  @override
  final String token;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AccountState(isLoading: $isLoading, name: $name, content: $content, token: $token)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AccountState'))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('content', content))
      ..add(DiagnosticsProperty('token', token));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AccountState &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality()
                    .equals(other.content, content)) &&
            (identical(other.token, token) ||
                const DeepCollectionEquality().equals(other.token, token)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isLoading) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(token);

  @JsonKey(ignore: true)
  @override
  _$AccountStateCopyWith<_AccountState> get copyWith =>
      __$AccountStateCopyWithImpl<_AccountState>(this, _$identity);
}

abstract class _AccountState implements AccountState {
  const factory _AccountState(
      {bool isLoading,
      String name,
      String content,
      String token}) = _$_AccountState;

  @override
  bool get isLoading;
  @override
  String get name;
  @override
  String get content;
  @override
  String get token;
  @override
  @JsonKey(ignore: true)
  _$AccountStateCopyWith<_AccountState> get copyWith;
}
