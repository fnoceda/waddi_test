import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waddi/features/coin_list/coin_list.dart';
import 'package:waddi/service_locator.dart';
import 'package:waddi/utils/color_mannager.dart';

import 'package:my_listview/custom_listview_favorites_widget.dart';

import '../../../utils/app_enums.dart';

class CoinListPage extends StatelessWidget {
  const CoinListPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const CoinListPage());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const Key('CoinListPage.Key'),
      child: const SafeArea(
        child: Scaffold(
          appBar: WaddiAppBar(),
          body: CoinListView(),
        ),
      ),
    );
  }
}

class WaddiAppBar extends StatelessWidget with PreferredSizeWidget {
  const WaddiAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      elevation: 0,
      // titleSpacing: 0.0,
      title: Text(
        'Waddi',
        style: TextStyle(color: ColorManager.white),
      ),
    );
  }
}

class CoinListView extends StatelessWidget {
  const CoinListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoinListBloc, CoinListState>(
      key: const Key('CoinListView.Key'),
      bloc: MyGetIt.sl.get<CoinListBloc>(),
      builder: (_, state) {
        switch (state.status) {
          case AppHttpStatus.none:
            return const Text('Waiting');
          case AppHttpStatus.connecting:
            return const Center(child: CupertinoActivityIndicator(radius: 50));
          case AppHttpStatus.fail:
            return const Text('FAIL!');
          case AppHttpStatus.success:
          case AppHttpStatus.more:
            return CustomListViewFavorites(
              initialData: state.listViewModel ?? [],
            );
        }
      },
    );
  }
}
