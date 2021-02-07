import 'package:flutter/material.dart';
import 'package:nature_farming/common/color/color.dart';
import 'package:nature_farming/models/post/post.dart';
import 'package:nature_farming/use_case/sns/sns_notifier.dart';

void replyMessage({
  BuildContext context,
  GlobalKey<FormState> formKey,
  SnsNotifier notifier,
  Post postItem,
}) {
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    builder: (_) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              left: 8,
              right: 8,
            ),
            child: Form(
              key: formKey,
              child: TextFormField(
                onChanged: (value) {
                  notifier.saveContent(value);
                },
                decoration: InputDecoration(
                  hintText: '返信してみよう',
                  suffixIcon: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.image,
                          color: AppColor.mainColor,
                        ),
                        onPressed: () {
                          //TODO: add image select function
                        },
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.send,
                          color: AppColor.mainColor,
                        ),
                        onPressed: () {
                          notifier.addReply(postItem.id);
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 32)
        ],
      ),
    ),
  );
}
