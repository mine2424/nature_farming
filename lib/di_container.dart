import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/single_child_widget.dart';

import 'use_case/account/account_notifier.dart';
import 'use_case/account/account_state.dart';

List<SingleChildWidget> get useCaseProviders {
  return <SingleChildWidget>[
    StateNotifierProvider<AccountNotifier, AccountState>(
      create: (context) => AccountNotifier(),
    ),
  ];
}
