import 'package:flutter/material.dart';
import 'package:nature_farming/common/color/color.dart';
import 'package:nature_farming/use_case/account/account_notifier.dart';
import 'package:nature_farming/use_case/account/account_state.dart';
import 'package:nature_farming/views/profile/edit_profile.dart';

Drawer drawer({
  BuildContext context,
  AccountNotifier notifier,
  AccountState state,
}) {
  return Drawer(
    // TODO(mine2424):add profile like twitter.
    child: ListView(
      children: [
        UserAccountsDrawerHeader(
          accountName: Text(state.userInfo?.name.toString()),
          decoration: const BoxDecoration(color: AppColor.mainColor),
          currentAccountPicture: CircleAvatar(
            backgroundImage: NetworkImage(state.userInfo.userImage.url),
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => EditProfilePage.wrapped(),
              ),
            );
          },
          title: const Text('アカウント編集'),
          trailing: const Icon(Icons.keyboard_arrow_right),
        ),
        ListTile(
          title: Text('お問い合わせ', style: Theme.of(context).textTheme.bodyText1),
          onTap: () {},
        ),
        ListTile(
          title: Text('利用規約', style: Theme.of(context).textTheme.bodyText1),
          onTap: () {},
        ),
        ListTile(
          title: Text('通知設定', style: Theme.of(context).textTheme.bodyText1),
          onTap: () {},
        ),
      ],
    ),
  );
}
