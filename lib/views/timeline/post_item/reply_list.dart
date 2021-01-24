import 'package:flutter/material.dart';
import 'package:nature_farming/views/widget/dialog/reply_dialog.dart';

Widget replyList(GlobalKey<FormState> formKey) {
  return ListView.separated(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: 5,
    separatorBuilder: (BuildContext context, int index) => const Divider(),
    itemBuilder: (BuildContext context, int index) {
      return ListTile(
        leading: Image.network(
          'https://cdn.iconscout.com/icon/free/png-512/flutter-2038877-1720090.png',
          width: 40,
        ),
        title: Text('title'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('sonannda'),
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
          ],
        ),
      );
    },
  );
}
