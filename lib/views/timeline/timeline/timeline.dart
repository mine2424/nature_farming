import 'package:admob_flutter/admob_flutter.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:nature_farming/common/color/color.dart';
import 'package:nature_farming/models/ad_manager/ad_manager.dart';
import 'package:nature_farming/use_case/sns/sns_notifier.dart';
import 'package:nature_farming/use_case/sns/sns_state.dart';
import 'package:nature_farming/views/timeline/timeline/list_item.dart';
import 'package:nature_farming/views/widget/dialog/post_dialog.dart';
import 'package:provider/provider.dart';

class TimeLinePage extends StatelessWidget {
  const TimeLinePage._({Key key}) : super(key: key);
  static Widget wrapped() {
    return MultiProvider(
      providers: [
        StateNotifierProvider<SnsNotifier, SnsState>(
          create: (context) => SnsNotifier(isFetchReplyMessage: false),
        ),
      ],
      child: const TimeLinePage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final notifier = context.read<SnsNotifier>();
    final isLoading = context.select((SnsState value) => value.isLoading);
    return Scaffold(
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : _buildListView(context),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        backgroundColor: AppColor.mainColor,
        onPressed: () {
          notifier.pushWithReload(
            context: context,
            page: PostDialog.wrapped(),
          );
        },
      ),
    );
  }

  Widget _buildListView(BuildContext context) {
    final postItems = context.select((SnsState value) => value.postItems);
    List<Widget> _children = List<Widget>.generate(
      postItems.length,
      (int index) => listItem(
        context: context,
        index: index,
        notifier: context.read<SnsNotifier>(),
        postItem: postItems[index],
      ),
    );
    if (postItems.length > 6) {
      _children.insert(
        6,
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: AdmobBanner(
                adUnitId: AdManager.bannerAdUnitId,
                // adUnitId: BannerAd.testAdUnitId,
                adSize: AdmobBannerSize.LEADERBOARD,
              ),
            ),
            const Divider()
          ],
        ),
      );
    }

    return ListView(children: _children);
  }
}
