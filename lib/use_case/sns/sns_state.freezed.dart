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
      bool isLoadingReply = false,
      String name = '',
      String content = '',
      String fmcToken = '',
      bool good = false,
      File image,
      List<Post> postItems,
      List<ReplyMessage> replyMessages}) {
    return _SnsState(
      isLoading: isLoading,
      isLoadingReply: isLoadingReply,
      name: name,
      content: content,
      fmcToken: fmcToken,
      good: good,
      image: image,
      postItems: postItems,
      replyMessages: replyMessages,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $SnsState = _$SnsStateTearOff();

/// @nodoc
mixin _$SnsState {
  bool get isLoading;
  bool get isLoadingReply;
  String get name;
  String get content;
  String get fmcToken;
  bool get good;
  File get image;
  List<Post> get postItems;
  List<ReplyMessage> get replyMessages;

  @JsonKey(ignore: true)
  $SnsStateCopyWith<SnsState> get copyWith;
}

/// @nodoc
abstract class $SnsStateCopyWith<$Res> {
  factory $SnsStateCopyWith(SnsState value, $Res Function(SnsState) then) =
      _$SnsStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading,
      bool isLoadingReply,
      String name,
      String content,
      String fmcToken,
      bool good,
      File image,
      List<Post> postItems,
      List<ReplyMessage> replyMessages});
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
    Object isLoadingReply = freezed,
    Object name = freezed,
    Object content = freezed,
    Object fmcToken = freezed,
    Object good = freezed,
    Object image = freezed,
    Object postItems = freezed,
    Object replyMessages = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
      isLoadingReply: isLoadingReply == freezed
          ? _value.isLoadingReply
          : isLoadingReply as bool,
      name: name == freezed ? _value.name : name as String,
      content: content == freezed ? _value.content : content as String,
      fmcToken: fmcToken == freezed ? _value.fmcToken : fmcToken as String,
      good: good == freezed ? _value.good : good as bool,
      image: image == freezed ? _value.image : image as File,
      postItems:
          postItems == freezed ? _value.postItems : postItems as List<Post>,
      replyMessages: replyMessages == freezed
          ? _value.replyMessages
          : replyMessages as List<ReplyMessage>,
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
      bool isLoadingReply,
      String name,
      String content,
      String fmcToken,
      bool good,
      File image,
      List<Post> postItems,
      List<ReplyMessage> replyMessages});
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
    Object isLoadingReply = freezed,
    Object name = freezed,
    Object content = freezed,
    Object fmcToken = freezed,
    Object good = freezed,
    Object image = freezed,
    Object postItems = freezed,
    Object replyMessages = freezed,
  }) {
    return _then(_SnsState(
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
      isLoadingReply: isLoadingReply == freezed
          ? _value.isLoadingReply
          : isLoadingReply as bool,
      name: name == freezed ? _value.name : name as String,
      content: content == freezed ? _value.content : content as String,
      fmcToken: fmcToken == freezed ? _value.fmcToken : fmcToken as String,
      good: good == freezed ? _value.good : good as bool,
      image: image == freezed ? _value.image : image as File,
      postItems:
          postItems == freezed ? _value.postItems : postItems as List<Post>,
      replyMessages: replyMessages == freezed
          ? _value.replyMessages
          : replyMessages as List<ReplyMessage>,
    ));
  }
}

/// @nodoc
class _$_SnsState with DiagnosticableTreeMixin implements _SnsState {
  const _$_SnsState(
      {this.isLoading = false,
      this.isLoadingReply = false,
      this.name = '',
      this.content = '',
      this.fmcToken = '',
      this.good = false,
      this.image,
      this.postItems,
      this.replyMessages})
      : assert(isLoading != null),
        assert(isLoadingReply != null),
        assert(name != null),
        assert(content != null),
        assert(fmcToken != null),
        assert(good != null);

  @JsonKey(defaultValue: false)
  @override
  final bool isLoading;
  @JsonKey(defaultValue: false)
  @override
  final bool isLoadingReply;
  @JsonKey(defaultValue: '')
  @override
  final String name;
  @JsonKey(defaultValue: '')
  @override
  final String content;
  @JsonKey(defaultValue: '')
  @override
  final String fmcToken;
  @JsonKey(defaultValue: false)
  @override
  final bool good;
  @override
  final File image;
  @override
  final List<Post> postItems;
  @override
  final List<ReplyMessage> replyMessages;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SnsState(isLoading: $isLoading, isLoadingReply: $isLoadingReply, name: $name, content: $content, fmcToken: $fmcToken, good: $good, image: $image, postItems: $postItems, replyMessages: $replyMessages)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SnsState'))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty('isLoadingReply', isLoadingReply))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('content', content))
      ..add(DiagnosticsProperty('fmcToken', fmcToken))
      ..add(DiagnosticsProperty('good', good))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('postItems', postItems))
      ..add(DiagnosticsProperty('replyMessages', replyMessages));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SnsState &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)) &&
            (identical(other.isLoadingReply, isLoadingReply) ||
                const DeepCollectionEquality()
                    .equals(other.isLoadingReply, isLoadingReply)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality()
                    .equals(other.content, content)) &&
            (identical(other.fmcToken, fmcToken) ||
                const DeepCollectionEquality()
                    .equals(other.fmcToken, fmcToken)) &&
            (identical(other.good, good) ||
                const DeepCollectionEquality().equals(other.good, good)) &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)) &&
            (identical(other.postItems, postItems) ||
                const DeepCollectionEquality()
                    .equals(other.postItems, postItems)) &&
            (identical(other.replyMessages, replyMessages) ||
                const DeepCollectionEquality()
                    .equals(other.replyMessages, replyMessages)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isLoading) ^
      const DeepCollectionEquality().hash(isLoadingReply) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(fmcToken) ^
      const DeepCollectionEquality().hash(good) ^
      const DeepCollectionEquality().hash(image) ^
      const DeepCollectionEquality().hash(postItems) ^
      const DeepCollectionEquality().hash(replyMessages);

  @JsonKey(ignore: true)
  @override
  _$SnsStateCopyWith<_SnsState> get copyWith =>
      __$SnsStateCopyWithImpl<_SnsState>(this, _$identity);
}

abstract class _SnsState implements SnsState {
  const factory _SnsState(
      {bool isLoading,
      bool isLoadingReply,
      String name,
      String content,
      String fmcToken,
      bool good,
      File image,
      List<Post> postItems,
      List<ReplyMessage> replyMessages}) = _$_SnsState;

  @override
  bool get isLoading;
  @override
  bool get isLoadingReply;
  @override
  String get name;
  @override
  String get content;
  @override
  String get fmcToken;
  @override
  bool get good;
  @override
  File get image;
  @override
  List<Post> get postItems;
  @override
  List<ReplyMessage> get replyMessages;
  @override
  @JsonKey(ignore: true)
  _$SnsStateCopyWith<_SnsState> get copyWith;
}
