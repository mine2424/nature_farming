import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:nature_farming/models/post/post.dart';
import 'package:nature_farming/use_case/sns/sns_notifier.dart';
import 'package:nature_farming/use_case/sns/sns_state.dart';
import 'package:nature_farming/views/timeline/detail_item/reply_list.dart';
import 'package:nature_farming/views/timeline/widget/popup_menu_button.dart';
import 'package:nature_farming/views/widget/appBar/appBar.dart';
import 'package:nature_farming/views/widget/dialog/reply_dialog.dart';
import 'package:provider/provider.dart';

class PostItemPage extends StatelessWidget {
  PostItemPage({Key key, this.index}) : super(key: key);
  final int index;

  static Widget wrapped(int index, Post item) {
    return MultiProvider(
      providers: [
        StateNotifierProvider<SnsNotifier, SnsState>(
          create: (context) =>
              SnsNotifier(isFetchReplyMessage: true, postDocId: item.id),
        ),
      ],
      child: PostItemPage(index: index),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final postItems = context.select((SnsState value) => value.postItems);
    final state = context.select((SnsState value) => value);
    final notifier = context.read<SnsNotifier>();
    return Scaffold(
      appBar: appBar(context, '投稿内容', false),
      body: (state.isLoading)
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(200)),
                          child: Image.network(
                            'https://cdn.iconscout.com/icon/free/png-512/flutter-2038877-1720090.png',
                            width: 32,
                          ),
                        ),
                      ),
                      Text(
                        postItems[index].name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16, top: 8, bottom: 8, right: 16),
                        child: Text(
                          postItems[index].content,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  (postItems[index].imageDate == null)
                      ? const SizedBox()
                      : Padding(
                          padding: const EdgeInsets.all(16),
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                            child: Image.network(
                              postItems[index].imageDate.url,
                              height: 230,
                            ),
                          ),
                        ),
                  const Divider(),
                  Row(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: IconButton(
                            icon: Icon(Icons.reply_outlined),
                            onPressed: () {
                              // print('open replyMessage');
                              replyMessage(
                                context: context,
                                formKey: _formKey,
                                notifier: notifier,
                                postItem: postItems[index],
                              );
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
                              onPressed: () {
                                notifier.countUpGood(
                                  postItems[index].good,
                                  postItems[index].id,
                                );
                              },
                            ),
                            Text(postItems[index].good.toString()),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: popupMenuButtonWidget(
                            context: context,
                            postItem: postItems[index],
                            notifier: notifier,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  replyList(
                    formKey: _formKey,
                    state: state,
                    notifier: notifier,
                  ),
                ],
              ),
            ),
    );
  }
}
