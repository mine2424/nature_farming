// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'sns_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$SnsStateTearOff {
  const _$SnsStateTearOff();

// ignore: unused_element
  _SnsState call(
      {bool isLoading = false,
      String name = '',
      String content = '',
      String fmcToken = '',
      String postImage = '',
      File image}) {
    return _SnsState(
      isLoading: isLoading,
      name: name,
      content: content,
      fmcToken: fmcToken,
      postImage: postImage,
      image: image,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $SnsState = _$SnsStateTearOff();

/// @nodoc
mixin _$SnsState {
  bool get isLoading;
  String get name;
  String get content;
  String get fmcToken;
  String get postImage;
  File get image;

  @JsonKey(ignore: true)
  $SnsStateCopyWith<SnsState> get copyWith;
}

/// @nodoc
abstract class $SnsStateCopyWith<$Res> {
  factory $SnsStateCopyWith(SnsState value, $Res Function(SnsState) then) =
      _$SnsStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading,
      String name,
      String content,
      String fmcToken,
      String postImage,
      File image});
}

/// @nodoc
class _$SnsStateCopyWithImpl<$Res> implements $SnsStateCopyWith<$Res> {
  _$SnsStateCopyWithImpl(this._value, this._then);

  final SnsState _value;
  // ignore: unused_field
  final $Res Function(SnsState) _then;

  @override
  $Res call({
    Object isLoading = freezed,
    Object name = freezed,
    Object content = freezed,
    Object fmcToken = freezed,
    Object postImage = freezed,
    Object image = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
      name: name == freezed ? _value.name : name as String,
      content: content == freezed ? _value.content : content as String,
      fmcToken: fmcToken == freezed ? _value.fmcToken : fmcToken as String,
      postImage: postImage == freezed ? _value.postImage : postImage as String,
      image: image == freezed ? _value.image : image as File,
    ));
  }
}

/// @nodoc
abstract class _$SnsStateCopyWith<$Res> implements $SnsStateCopyWith<$Res> {
  factory _$SnsStateCopyWith(_SnsState value, $Res Function(_SnsState) then) =
      __$SnsStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading,
      String name,
      String content,
      String fmcToken,
      String postImage,
      File image});
}

/// @nodoc
class __$SnsStateCopyWithImpl<$Res> extends _$SnsStateCopyWithImpl<$Res>
    implements _$SnsStateCopyWith<$Res> {
  __$SnsStateCopyWithImpl(_SnsState _value, $Res Function(_SnsState) _then)
      : super(_value, (v) => _then(v as _SnsState));

  @override
  _SnsState get _value => super._value as _SnsState;

  @override
  $Res call({
    Object isLoading = freezed,
    Object name = freezed,
    Object content = freezed,
    Object fmcToken = freezed,
    Object postImage = freezed,
    Object image = freezed,
  }) {
    return _then(_SnsState(
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
      name: name == freezed ? _value.name : name as String,
      content: content == freezed ? _value.content : content as String,
      fmcToken: fmcToken == freezed ? _value.fmcToken : fmcToken as String,
      postImage: postImage == freezed ? _value.postImage : postImage as String,
      image: image == freezed ? _value.image : image as File,
    ));
  }
}

/// @nodoc
class _$_SnsState with DiagnosticableTreeMixin implements _SnsState {
  const _$_SnsState(
      {this.isLoading = false,
      this.name = '',
      this.content = '',
      this.fmcToken = '',
      this.postImage = '',
      this.image})
      : assert(isLoading != null),
        assert(name != null),
        assert(content != null),
        assert(fmcToken != null),
        assert(postImage != null);

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
  final String fmcToken;
  @JsonKey(defaultValue: '')
  @override
  final String postImage;
  @override
  final File image;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SnsState(isLoading: $isLoading, name: $name, content: $content, fmcToken: $fmcToken, postImage: $postImage, image: $image)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SnsState'))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('content', content))
      ..add(DiagnosticsProperty('fmcToken', fmcToken))
      ..add(DiagnosticsProperty('postImage', postImage))
      ..add(DiagnosticsProperty('image', image));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SnsState &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality()
                    .equals(other.content, content)) &&
            (identical(other.fmcToken, fmcToken) ||
                const DeepCollectionEquality()
                    .equals(other.fmcToken, fmcToken)) &&
            (identical(other.postImage, postImage) ||
                const DeepCollectionEquality()
                    .equals(other.postImage, postImage)) &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isLoading) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(fmcToken) ^
      const DeepCollectionEquality().hash(postImage) ^
      const DeepCollectionEquality().hash(image);

  @JsonKey(ignore: true)
  @override
  _$SnsStateCopyWith<_SnsState> get copyWith =>
      __$SnsStateCopyWithImpl<_SnsState>(this, _$identity);
}

abstract class _SnsState implements SnsState {
  const factory _SnsState(
      {bool isLoading,
      String name,
      String content,
      String fmcToken,
      String postImage,
      File image}) = _$_SnsState;

  @override
  bool get isLoading;
  @override
  String get name;
  @override
  String get content;
  @override
  String get fmcToken;
  @override
  String get postImage;
  @override
  File get image;
  @override
  @JsonKey(ignore: true)
  _$SnsStateCopyWith<_SnsState> get copyWith;
}