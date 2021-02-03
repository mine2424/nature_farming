import 'package:flutter/material.dart';
import 'package:nature_farming/models/post/post.dart';
import 'package:nature_farming/use_case/sns/sns_notifier.dart';
import 'package:nature_farming/views/timeline/detail_item/post_item.dart';

Widget listItem({
  BuildContext context,
  int index,
  SnsNotifier notifier,
  Post postItem,
}) {
  return GestureDetector(
    onTap: () {
      notifier.pushWithReload(
        context: context,
        page: PostItemPage.wrapped(index),
      );
    },
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(200)),
            child: Image.network(
              'https://cdn.iconscout.com/icon/free/png-512/flutter-2038877-1720090.png',
              width: 60,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    postItem.name.toString(),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, right: 8),
                child: Text(postItem.content),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, right: 8),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  child: (postItem.postImage == null)
                      ? const SizedBox()
                      : Image.network(
                          postItem.postImage.url,
                          height: 200,
                        ),
                ),
              ),
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
                            Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    PostItemPage.wrapped(index),
                              ),
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
                            onPressed: () {},
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(postItem.good.toString()),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          icon: Icon(Icons.share_sharp),
                          onPressed: () {
                            notifier.deletePost(postItem.id);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}
