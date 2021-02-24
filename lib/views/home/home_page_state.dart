import 'dart:io';

import 'package:flamingo/flamingo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nature_farming/models/contact/contact.dart';
import 'package:nature_farming/models/user/index.dart' as user;
import 'package:nature_farming/repository/data_source/auth_data_source.dart';
import 'package:nature_farming/views/home/home_page.dart';
import 'package:state_notifier/state_notifier.dart';
part 'home_page_state.freezed.dart';

@freezed
abstract class HomePageState with _$HomePageState {
  const factory HomePageState({
    @Default(false) bool isLoading,
    @Default('') String name,
    @Default('') String content,
  }) = _HomePageState;
}

class HomePageNotifier extends StateNotifier<HomePageState> with LocatorMixin {
  HomePageNotifier(this.context) : super(const HomePageState(isLoading: false));

  final formkey = GlobalKey<FormState>();
  final userDoc = user.User(id: loggedInUserId());

  DocumentAccessor documentAccessor = DocumentAccessor();

  // AuthDataSource _authDataSource;
  // AuthRepository get _authRepository => read<AuthRepository>();

  BuildContext context;

  @override
  void dispose() {
    super.dispose();
  }

  void _finishLoading() {
    state = state.copyWith(isLoading: false);
  }

  void saveName(String name) => state = state.copyWith(name: name);

  void saveContent(String content) => state = state.copyWith(content: content);

  Future sendQuestionnaire() async {
    print('start sendQuestionnaire');
    final doc = Contact()
      ..name = state.name
      ..content = state.content
      ..userId = loggedInUserId();

    Batch().save(doc);
    await Batch().commit();
    state = state.copyWith(name: '');
    state = state.copyWith(content: '');
    sleep(const Duration(seconds: 1));
    await Navigator.pushReplacement(
        context,
        MaterialPageRoute<void>(
            builder: (BuildContext context) => HomePage.wrapped()));
  }
}
