import 'package:flutter/material.dart';

void replyMessage(BuildContext context, GlobalKey<FormState> formKey) {
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
                decoration: InputDecoration(
                  hintText: '返信してみよう',
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.image,
                      color: Color(0xFFAACF52),
                    ),
                    onPressed: () {},
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
