import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nature_farming/common/color/color.dart';
import 'package:nature_farming/use_case/sns/sns_notifier.dart';
import 'package:nature_farming/use_case/sns/sns_state.dart';
import 'package:nature_farming/views/widget/sizedBox/sizedBox.dart';
import 'package:provider/provider.dart';

class PostDialog extends StatelessWidget {
  const PostDialog._({Key key}) : super(key: key);

  static Widget wrapped() {
    return MultiProvider(
      providers: [
        StateNotifierProvider<SnsNotifier, SnsState>(
          create: (context) => SnsNotifier(),
        ),
      ],
      child: const PostDialog._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final notifier = context.read<SnsNotifier>();
    final image = context.select((SnsState value) => value.image);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.mainColor,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextButton(
              child: const Text(
                '投稿する',
                style: TextStyle(fontSize: 13),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.black,
                shape: const StadiumBorder(),
              ),
              onPressed: () {
                notifier.addPost();
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
            child: TextFormField(
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(16),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(200)),
                    child: Image.network(
                      'https://cdn.iconscout.com/icon/free/png-512/flutter-2038877-1720090.png',
                      width: 32,
                    ),
                  ),
                ),
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.image,
                    color: AppColor.mainColor,
                  ),
                  onPressed: () {
                    notifier.savePostImage();
                  },
                ),
                filled: true,
                fillColor: Colors.white30,
              ),
              onChanged: (value) {
                notifier.saveContent(value);
              },
            ),
          ),
          const SizedBox(height: 16),
          if (image != null)
            Image.file(
              image,
              width: 280,
            )
        ],
      ),
    );
  }
}
