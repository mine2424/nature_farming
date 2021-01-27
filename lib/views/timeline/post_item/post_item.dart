import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:nature_farming/use_case/sns/sns_notifier.dart';
import 'package:nature_farming/use_case/sns/sns_state.dart';
import 'package:nature_farming/views/timeline/post_item/reply_list.dart';
import 'package:nature_farming/views/widget/appBar/appBar.dart';
import 'package:nature_farming/views/widget/dialog/reply_dialog.dart';
import 'package:provider/provider.dart';

class PostItemPage extends StatelessWidget {
  const PostItemPage._({Key key}) : super(key: key);

  static Widget wrapped(int index) {
    return MultiProvider(
      providers: [
        StateNotifierProvider<SnsNotifier, SnsState>(
          create: (context) => SnsNotifier(),
        ),
      ],
      child: const PostItemPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: appBar(context, '投稿内容', false),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(200)),
                    child: Image.network(
                      'https://cdn.iconscout.com/icon/free/png-512/flutter-2038877-1720090.png',
                      width: 32,
                    ),
                  ),
                ),
                Text(
                  'flutter team',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text('@Hello world'),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                  '古代穀物である「スペルト小麦」を使ったパン屋さんを発見！環欒舎というお店で、自然農で小麦を栽培して、パン作りをされているそうです🌾卸しですが、店頭で取り扱うパン屋は滅多にありません'),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                child: Image.network(
                  'https://pbs.twimg.com/media/ErdYFPyUUAQNWxc?format=jpg&name=large',
                  height: 230,
                ),
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        icon: Icon(Icons.reply_outlined),
                        onPressed: () {
                          replyMessage(context, _formKey);
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        IconButton(
                          iconSize: 20,
                          icon: Icon(
                            Icons.thumb_up_alt,
                            color: Colors.red,
                          ),
                          onPressed: () {},
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text('23'),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        icon: Icon(Icons.share_sharp),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            replyList(_formKey),
          ],
        ),
      ),
    );
  }
}
