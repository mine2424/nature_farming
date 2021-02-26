import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nature_farming/common/type/types.dart';
import 'package:nature_farming/models/user/index.dart';
part 'account_state.freezed.dart';

@freezed
abstract class AccountState with _$AccountState {
  const factory AccountState({
    @Default(true) bool isLoading,
    @Default('') String name,
    @Default('') String content,
    @Default('') String token,
    @Default(StartUpType.incompleteUser) StartUpType startUpType,
    User userInfo,
    File image,
  }) = _AccountState;
}
