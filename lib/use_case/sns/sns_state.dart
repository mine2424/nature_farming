import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
part 'sns_state.freezed.dart';

@freezed
abstract class SnsState with _$SnsState {
  const factory SnsState({
    @Default(false) bool isLoading,
    @Default('') String name,
    @Default('') String content,
    @Default('') String fmcToken,
    @Default('') String postImage,
    File image,
  }) = _SnsState;
}
