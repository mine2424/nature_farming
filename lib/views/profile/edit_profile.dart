import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:nature_farming/common/color/color.dart';
import 'package:nature_farming/use_case/account/account_notifier.dart';
import 'package:nature_farming/use_case/account/account_state.dart';
import 'package:nature_farming/views/widget/appBar/appBar.dart';
import 'package:provider/provider.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage._({Key key}) : super(key: key);

  static Widget wrapped() {
    return MultiProvider(
      providers: [
        StateNotifierProvider<AccountNotifier, AccountState>(
          create: (context) => AccountNotifier(),
        ),
      ],
      child: const EditProfilePage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, 'プロフィールの編集', true),
      body: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            child: Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [],
                ),
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            painter: HeaderCurvedContainer(),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50),
                    _profileText(),
                    _circleAvatar(context),
                    _textListCalling(context),
                    const SizedBox(height: 500)
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _profileText() {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: const Text(
        'Profile',
        style: TextStyle(
          fontSize: 35,
          letterSpacing: 1.5,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _circleAvatar(BuildContext context) {
    final stateImage = context.select((AccountState value) => value);
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      height: MediaQuery.of(context).size.width / 2,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 5),
        shape: BoxShape.circle,
        color: Colors.white,
        image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
                'https://www.appventurez.com/blog/wp-content/uploads/2020/05/kotlin-vs-flutter.jpg')),
      ),
    );
  }

  Widget _textFormField({
    BuildContext context,
    String selectName,
    String hintText,
    String myText,
    IconData icon,
  }) {
    return Material(
      elevation: 4,
      shadowColor: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      child: TextFormField(
        keyboardType: TextInputType.multiline,
        maxLines: null,
        validator: (input) {
          return null;
        },
        onSaved: (input) {},
        initialValue: myText,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
            prefixIcon: Icon(
              icon,
              // color: Theme.of(context).primaryColor,
            ),
            hintText: hintText,
            hintStyle: const TextStyle(
              letterSpacing: 2,
              color: Colors.blueGrey,
              fontWeight: FontWeight.bold,
            ),
            filled: true,
            fillColor: Colors.white30),
      ),
    );
  }

  Widget _textListCalling(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final notifier = context.read<AccountNotifier>();
    final state = context.read<AccountNotifier>();

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 30),
            FlatButton(
              onPressed: () {
                // getImageFromGallery();
              },
              child: Material(
                  elevation: 4,
                  shadowColor: Colors.grey,
                  color: AppColor.mainColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                  child: SizedBox(
                    height: 40,
                    child: Center(
                      child: const Text(
                        '画像を選択',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            letterSpacing: 0.5),
                      ),
                    ),
                  )),
            ),
            const SizedBox(height: 16),
            _textFormField(
                context: context,
                hintText: '名前',
                selectName: 'name',
                myText: 'a',
                icon: Icons.ac_unit),
            const SizedBox(height: 16),
            _textFormField(
              context: context,
              hintText: 'メッセージ',
              selectName: 'content',
              myText: 'a',
              icon: Icons.ac_unit,
            ),
            const SizedBox(height: 16),
            Container(
              height: 55,
              width: double.infinity,
              child: RaisedButton(
                color: AppColor.mainColor,
                child: Center(
                  child: const Text(
                    '更新',
                    style: TextStyle(
                        fontSize: 23, color: Colors.white, letterSpacing: 0.5),
                  ),
                ),
                onPressed: () {
                  // editConsumerInfo();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Color(0xff555555)
class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = AppColor.mainColor;
    Path path = Path()
      ..relativeLineTo(0, 150)
      ..quadraticBezierTo(size.width / 2, 250.0, size.width, 150)
      ..relativeLineTo(0, -150)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
