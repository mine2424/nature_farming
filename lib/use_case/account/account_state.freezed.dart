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
      {bool isLoading = true,
      String name = '',
      String content = '',
      String token = '',
      StartUpType startUpType = StartUpType.incompleteUser,
      User userInfo,
      File image}) {
    return _AccountState(
      isLoading: isLoading,
      name: name,
      content: content,
      token: token,
      startUpType: startUpType,
      userInfo: userInfo,
      image: image,
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
  StartUpType get startUpType;
  User get userInfo;
  File get image;

  @JsonKey(ignore: true)
  $AccountStateCopyWith<AccountState> get copyWith;
}

/// @nodoc
abstract class $AccountStateCopyWith<$Res> {
  factory $AccountStateCopyWith(
          AccountState value, $Res Function(AccountState) then) =
      _$AccountStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading,
      String name,
      String content,
      String token,
      StartUpType startUpType,
      User userInfo,
      File image});
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
    Object startUpType = freezed,
    Object userInfo = freezed,
    Object image = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
      name: name == freezed ? _value.name : name as String,
      content: content == freezed ? _value.content : content as String,
      token: token == freezed ? _value.token : token as String,
      startUpType: startUpType == freezed
          ? _value.startUpType
          : startUpType as StartUpType,
      userInfo: userInfo == freezed ? _value.userInfo : userInfo as User,
      image: image == freezed ? _value.image : image as File,
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
  $Res call(
      {bool isLoading,
      String name,
      String content,
      String token,
      StartUpType startUpType,
      User userInfo,
      File image});
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
    Object startUpType = freezed,
    Object userInfo = freezed,
    Object image = freezed,
  }) {
    return _then(_AccountState(
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
      name: name == freezed ? _value.name : name as String,
      content: content == freezed ? _value.content : content as String,
      token: token == freezed ? _value.token : token as String,
      startUpType: startUpType == freezed
          ? _value.startUpType
          : startUpType as StartUpType,
      userInfo: userInfo == freezed ? _value.userInfo : userInfo as User,
      image: image == freezed ? _value.image : image as File,
    ));
  }
}

/// @nodoc
class _$_AccountState with DiagnosticableTreeMixin implements _AccountState {
  const _$_AccountState(
      {this.isLoading = true,
      this.name = '',
      this.content = '',
      this.token = '',
      this.startUpType = StartUpType.incompleteUser,
      this.userInfo,
      this.image})
      : assert(isLoading != null),
        assert(name != null),
        assert(content != null),
        assert(token != null),
        assert(startUpType != null);

  @JsonKey(defaultValue: true)
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
  @JsonKey(defaultValue: StartUpType.incompleteUser)
  @override
  final StartUpType startUpType;
  @override
  final User userInfo;
  @override
  final File image;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AccountState(isLoading: $isLoading, name: $name, content: $content, token: $token, startUpType: $startUpType, userInfo: $userInfo, image: $image)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AccountState'))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('content', content))
      ..add(DiagnosticsProperty('token', token))
      ..add(DiagnosticsProperty('startUpType', startUpType))
      ..add(DiagnosticsProperty('userInfo', userInfo))
      ..add(DiagnosticsProperty('image', image));
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
                const DeepCollectionEquality().equals(other.token, token)) &&
            (identical(other.startUpType, startUpType) ||
                const DeepCollectionEquality()
                    .equals(other.startUpType, startUpType)) &&
            (identical(other.userInfo, userInfo) ||
                const DeepCollectionEquality()
                    .equals(other.userInfo, userInfo)) &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isLoading) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(token) ^
      const DeepCollectionEquality().hash(startUpType) ^
      const DeepCollectionEquality().hash(userInfo) ^
      const DeepCollectionEquality().hash(image);

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
      String token,
      StartUpType startUpType,
      User userInfo,
      File image}) = _$_AccountState;

  @override
  bool get isLoading;
  @override
  String get name;
  @override
  String get content;
  @override
  String get token;
  @override
  StartUpType get startUpType;
  @override
  User get userInfo;
  @override
  File get image;
  @override
  @JsonKey(ignore: true)
  _$AccountStateCopyWith<_AccountState> get copyWith;
}
