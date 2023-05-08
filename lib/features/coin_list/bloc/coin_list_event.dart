part of 'coin_list_bloc.dart';

abstract class CoinListEvent extends Equatable {
  const CoinListEvent();

  @override
  List<Object> get props => [];
}

class ConnectingCoinListEvent extends CoinListEvent {
  const ConnectingCoinListEvent();
}

class SuccessDataCoinListEvent extends CoinListEvent {
  final List<CoinModel> listModel;

  const SuccessDataCoinListEvent({required this.listModel});
}

class FailDataCoinListEvent extends CoinListEvent {
  const FailDataCoinListEvent();
}

class MoreDataCoinListEvent extends CoinListEvent {
  const MoreDataCoinListEvent();
}

class CleanDataCoinListEvent extends CoinListEvent {
  const CleanDataCoinListEvent();
}

class CustomCoinListEvent extends CoinListEvent {
  final AppHttpStatus? status;
  final List<CoinModel>? listModel;
  const CustomCoinListEvent({required this.status, required this.listModel});
}
