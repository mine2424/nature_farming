import 'package:flutter/material.dart';
import 'package:nature_farming/use_case/sns/sns_notifier.dart';
import 'package:nature_farming/use_case/sns/sns_state.dart';
import 'package:nature_farming/views/widget/dialog/reply_dialog.dart';

Widget replyList({
  GlobalKey<FormState> formKey,
  SnsNotifier notifier,
  SnsState state,
}) {
  final replyItems = state.replyMessages;
  return ListView.separated(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: replyItems.length,
    separatorBuilder: (BuildContext context, int index) => const Divider(),
    itemBuilder: (BuildContext context, int index) {
      final replyItem = replyItems[index];
      return ListTile(
        leading: Image.network(
          'https://cdn.iconscout.com/icon/free/png-512/flutter-2038877-1720090.png',
          width: 40,
        ),
        title: Text(replyItem.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(replyItem.content),
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
                          //TODO: replyMessage用に仕様を変更する。
                          replyMessage(context, formKey);
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
                          child: Text(replyItem.good.toString()),
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
          ],
        ),
      );
    },
  );
}
