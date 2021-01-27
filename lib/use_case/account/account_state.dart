import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'account_state.freezed.dart';

@freezed
abstract class AccountState with _$AccountState {
  const factory AccountState({
    @Default(false) bool isLoading,
    @Default('') String name,
    @Default('') String content,
    @Default('') String token,
  }) = _AccountState;
}
