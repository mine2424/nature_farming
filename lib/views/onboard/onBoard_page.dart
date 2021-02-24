import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter/material.dart';
import 'package:nature_farming/common/color/color.dart';
import 'package:nature_farming/common/constants/constants.dart';
import 'package:nature_farming/common/type/types.dart';
import 'package:nature_farming/use_case/account/account_notifier.dart';
import 'package:nature_farming/use_case/account/account_state.dart';
import 'package:provider/provider.dart';

final introKey = GlobalKey<IntroductionScreenState>();

class OnBoardPage extends StatelessWidget {
  const OnBoardPage._({Key key}) : super(key: key);

  static Widget wrapped() {
    return MultiProvider(
      providers: [
        StateNotifierProvider<AccountNotifier, AccountState>(
          create: (context) => AccountNotifier(context: context),
        ),
      ],
      child: const OnBoardPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<AccountNotifier>();
    final state = context.select((AccountState value) => value);
    const bodyStyle = TextStyle(fontSize: 19);
    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16, 0, 16, 16),
      pageColor: Color(0xFFfffae5),
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      globalBackgroundColor: AppColor.mainColor,
      key: introKey,
      dotsDecorator: DotsDecorator(activeColor: AppColor.mainColor),
      pages: [
        PageViewModel(
          title: '自然農民へようこそ！',
          body: 'このアプリは自然農をされている方のためのSNS交流アプリです。',
          image: _buildImage(),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: 'ユーザー登録しましょう',
          bodyWidget: Form(
            key: notifier.formkey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'ユーザー名',
                      labelStyle: TextStyle(color: Colors.grey),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColor.mainColor),
                      )),
                  maxLength: 20,
                  onChanged: (value) {
                    notifier.saveName(value);
                  },
                  validator: (String value) {
                    if (value.isEmpty) {
                      return '名前を入力してください';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: '自己紹介文',
                      labelStyle: TextStyle(color: Colors.grey),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColor.mainColor))),
                  onChanged: (value) {
                    notifier.saveContent(value);
                  },
                ),
              ],
            ),
          ),
          image: _buildImage(),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: 'プロフィール画像を追加',
          body: '後から編集できます。',
          image: _buildProfileImage(state),
          footer: RaisedButton(
            onPressed: () {
              notifier.saveProfileImage();
            },
            child: const Text(
              '画像を選択',
              style: TextStyle(color: Colors.white),
            ),
            color: AppColor.mainColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: 'さあ、始めましょう！',
          bodyWidget: const SizedBox(
            width: 300,
            child: Text(
              'プロフィールはいつでも編集できます！',
              style: bodyStyle,
              textAlign: TextAlign.center,
            ),
          ),
          image: _buildImage(),
          decoration: pageDecoration,
        ),
      ],
      onDone: () async {
        if (notifier.formkey.currentState.validate()) {
          notifier.formkey.currentState.save();

          final startUp = await notifier.startUp();
          if (startUp == StartUpType.incompleteUser) {
            return notifier.createUser();
          }
          await notifier.pushReplacementHomePage();
        }
      },
      skip: const Text('スキップ'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('始める！', style: TextStyle(fontWeight: FontWeight.w600)),
    );
  }

  Widget _buildImage() {
    return Align(
      child: Image.network(
        Constants.appImage,
        width: 250,
      ),
      alignment: Alignment.bottomCenter,
    );
  }

  Widget _buildProfileImage(AccountState state) {
    return (state.image != null)
        ? Align(
            child: Image.file(
              state.image,
              width: 250,
              fit: BoxFit.cover,
            ),
            alignment: Alignment.bottomCenter)
        : Align(
            child: Image.network(
              Constants.appImage,
              width: 250,
            ),
            alignment: Alignment.bottomCenter);
  }
}
