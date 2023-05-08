import 'package:flutter/material.dart';
import 'package:waddi/features/coin_list/bloc/bloc.dart';

/// {@template coin_list_body}
/// Body of the CoinListPage.
///
/// Add what it does
/// {@endtemplate}
class CoinListBody extends StatelessWidget {
  /// {@macro coin_list_body}
  const CoinListBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoinListBloc, CoinListState>(
      builder: (context, state) {
        return Center(child: Text(state.status.toString()));
      },
    );
  }
}
