import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:nature_farming/common/color/color.dart';
import 'package:nature_farming/views/home/home_page.dart';
import 'package:nature_farming/views/widget/sizedBox/sizedBox.dart';

class OnBoardPage extends StatefulWidget {
  @override
  _OnBoardPageState createState() => _OnBoardPageState();
}

class _OnBoardPageState extends State<OnBoardPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  @override
  void dispose() {
    print('dispose onBoard');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          title: "Fractional shares",
          body:
              "Instead of having to buy an entire share, invest any amount you want.",
          image: _buildImage(),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Learn as you go",
          body:
              "Download the Stockpile app and master the market with our mini-lesson.",
          image: _buildImage(),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: 'ユーザー登録しましょう',
          bodyWidget: Form(
              child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'ユーザー名',
                  labelStyle: TextStyle(color: Colors.grey),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColor.mainColor),
                  ),
                ),
                maxLength: 20,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: '自己紹介文',
                    labelStyle: TextStyle(color: Colors.grey),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColor.mainColor))),
              ),
            ],
          )),
          image: _buildImage(),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "プロフィール画像を追加",
          body: '後から編集できます。',
          image: _buildImage(),
          footer: RaisedButton(
            onPressed: () {
              introKey.currentState?.animateScroll(0);
            },
            child: const Text(
              '画像を選択',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.lightBlue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Title of last page",
          bodyWidget: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("Click on ", style: bodyStyle),
              Icon(Icons.edit),
              Text(" to edit a post", style: bodyStyle),
            ],
          ),
          image: _buildImage(),
          decoration: pageDecoration,
        ),
      ],
      onDone: () {
        _showMainPage();
      },
      skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
    );
  }

  void _showMainPage() {
    Navigator.of(context, rootNavigator: true)
        .pushReplacement<MaterialPageRoute, void>(
      MaterialPageRoute(
        builder: (_) => HomePage(),
      ),
    );
  }

  Widget _buildImage() {
    return Align(
      child: Image.network(
        'https://i2.wp.com/aspgems.com/wp-content/uploads/2020/01/flutter-dart.png?fit=1200%2C600&ssl=1',
        width: 350,
      ),
      alignment: Alignment.bottomCenter,
    );
  }
}
