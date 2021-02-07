import 'package:flutter/material.dart';
import 'package:nature_farming/models/post/post.dart';
import 'package:nature_farming/repository/index.dart';
import 'package:nature_farming/use_case/sns/sns_notifier.dart';
import 'package:nature_farming/views/timeline/detail_item/post_item.dart';
import 'package:nature_farming/views/timeline/widget/image_detail_page.dart';
import 'package:nature_farming/views/timeline/widget/popup_menu_button.dart';

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
        page: PostItemPage.wrapped(index, postItem),
      );
    },
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.16,
            height: MediaQuery.of(context).size.width * 0.16,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  postItem.userImage,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Text(
                postItem.name.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, right: 8),
                child: Text(postItem.content),
              ),
              if (postItem.postImage?.url != null)
                Stack(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.push<void>(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BoardDetailsImage(
                            image: postItem.postImage.url,
                          ),
                        ),
                      ),
                      child: Hero(
                        tag: 'heroCount.toString()',
                        child: Image.network(
                          postItem.postImage.url,
                          filterQuality: FilterQuality.medium,
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width * 0.55,
                          height: 180,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(
                                  valueColor:
                                      const AlwaysStoppedAnimation<Color>(
                                          Colors.black),
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes
                                      : null),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          icon: const Icon(Icons.reply_outlined),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    PostItemPage.wrapped(index, postItem),
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
                            icon: const Icon(
                              Icons.thumb_up_alt,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              notifier.countUpGood(postItem.good, postItem.id);
                            },
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
                          child: popupMenuButtonWidget(
                              postItem: postItem, notifier: notifier)),
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
