import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nature_farming/models/user/index.dart';
part 'account_state.freezed.dart';

@freezed
abstract class AccountState with _$AccountState {
  const factory AccountState({
    @Default(false) bool isLoading,
    @Default('') String name,
    @Default('') String content,
    @Default('') String token,
    User userInfo,
    File image,
  }) = _AccountState;
}
