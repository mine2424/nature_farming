import 'package:flutter/material.dart';
import 'package:nature_farming/use_case/sns/sns_notifier.dart';
import 'package:nature_farming/use_case/sns/sns_state.dart';

Widget replyList({
  GlobalKey<FormState> formKey,
  SnsNotifier notifier,
  SnsState state,
}) {
  final replyItems = state.replyMessages;
  return (state.isLoadingReply)
      ? const Center(child: Text('now Loading...'))
      : ListView.separated(
          shrinkWrap: true,
          itemCount: replyItems.length,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
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
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      replyItem.content,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  const Divider(),
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            IconButton(
                              iconSize: 18,
                              icon: const Icon(Icons.thumb_up_alt,
                                  color: Colors.red),
                              onPressed: () {
                                notifier.countUpReplyGood(
                                  goods: replyItem.good,
                                  postDocId: state.postItems[index].id,
                                  replyDocId: replyItem.id,
                                );
                              },
                            ),
                            Text(replyItem.good.toString()),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: PopupMenuButton(
                            itemBuilder: (BuildContext context) => const [
                              PopupMenuItem(
                                child: Text('New Chat'),
                                value: 'newchat',
                              ),
                              PopupMenuItem(
                                child: Text('New Group Chat'),
                                value: 'new-group-chat',
                              ),
                              PopupMenuItem(
                                child: Text('Settings'),
                                value: 'settings',
                              ),
                            ],
                            onSelected: (String value) {
                              print(value);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
}
