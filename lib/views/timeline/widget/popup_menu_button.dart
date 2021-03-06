import 'package:flutter/material.dart';
import 'package:nature_farming/models/post/post.dart';
import 'package:nature_farming/repository/data_source/auth_data_source.dart';
import 'package:nature_farming/use_case/sns/sns_notifier.dart';
import 'package:nature_farming/views/contact/contact.dart';

Widget popupMenuButtonWidget({
  @required BuildContext context,
  Post postItem,
  SnsNotifier notifier,
}) {
  return PopupMenuButton(
    itemBuilder: (BuildContext bc) {
      return (postItem.userId == loggedInUserId())
          ? [
              const PopupMenuItem(
                child: Text('削除'),
                value: 'delete',
              ),
              const PopupMenuItem(
                child: Text('共有'),
                value: 'share',
              ),
              const PopupMenuItem(
                child: Text('報告'),
                value: 'report',
              ),
            ]
          : [
              const PopupMenuItem(
                child: Text('共有'),
                value: 'share',
              ),
              const PopupMenuItem(
                child: Text('報告'),
                value: 'report',
              ),
            ];
    },
    onSelected: (String value) {
      print(value);
      if (value == 'delete') {
        notifier.deletePost(postItem.id);
      } else if (value == 'share') {
        notifier.snsShare(name: postItem.name, content: postItem.content);
      } else {
        //TODO: お問い合わせフォームに飛ばす
        Navigator.push(
            context,
            MaterialPageRoute<void>(
                builder: (BuildContext context) => ContactPage()));
      }
    },
  );
}
