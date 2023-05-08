import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:my_listview/custom_listview_model.dart';
import 'package:waddi/domain/models/coin_model.dart';

import '../../../domain/repositories/coins_repository.dart';
import '../../../utils/app_enums.dart';
part 'coin_list_event.dart';
part 'coin_list_state.dart';

class CoinListBloc extends Bloc<CoinListEvent, CoinListState> {
  final CoinsRepository coinsRepository;
  late final Timer _timer;

  CoinListBloc({required this.coinsRepository})
      : super(const CoinListInitial()) {
    // on<CustomCoinListEvent>(_onCustomCoinListEvent);

    on<CleanDataCoinListEvent>((event, emit) {
      emit(state.copyWith(status: AppHttpStatus.none, listModel: null));
    });

    on<ConnectingCoinListEvent>((event, emit) {
      emit(state.copyWith(status: AppHttpStatus.connecting));
    });

    on<FailDataCoinListEvent>((event, emit) {
      emit(state.copyWith(
        status: AppHttpStatus.fail,
        listModel: state.listModel,
      ));
    });

    on<SuccessDataCoinListEvent>((event, emit) {
      List<CustomListViewModel> listViewModel = [];

      for (var e in event.listModel) {
        listViewModel.add(
          CustomListViewModel(
            name: e.name,
            logo: e.icon,
            amount: e.price,
          ),
        );
      }

      emit(state.copyWith(
        status: AppHttpStatus.success,
        listModel: event.listModel,
        listViewModel: listViewModel,
      ));
    });

    _init();
  }

  Future<void> _init() async {
    getData();

    _timer = Timer.periodic(const Duration(seconds: 60), (_) {
      getData();
    });
  }

  Future<void> getData() async {
    // print('getData.Start ${DateTime.now()}');
    add(const ConnectingCoinListEvent());
    var result = await coinsRepository.getCoinList();
    if (kDebugMode) print(result);
    result.fold((l) {
      add(const FailDataCoinListEvent());
    }, (r) {
      add(SuccessDataCoinListEvent(listModel: r));
    });
  }

  @override
  Future<void> close() {
    _timer.cancel();
    return super.close();
  }
}
