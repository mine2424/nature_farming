import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nature_farming/models/post/post.dart';
import 'package:nature_farming/models/post/replyMessage.dart';
part 'sns_state.freezed.dart';

@freezed
abstract class SnsState with _$SnsState {
  const factory SnsState({
    @Default(false) bool isLoading,
    @Default(false) bool isLoadingReply,
    @Default('') String name,
    @Default('') String content,
    @Default('') String fmcToken,
    @Default(false) bool good,
    File image,
    List<Post> postItems,
    List<ReplyMessage> replyMessages,
  }) = _SnsState;
}
