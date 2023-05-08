part of 'coin_list_bloc.dart';

class CoinListState extends Equatable {
  final AppHttpStatus status;
  final List<CoinModel>? listModel;
  final List<CustomListViewModel>? listViewModel;
  final String? message;
  const CoinListState({
    this.listModel = const [],
    this.listViewModel = const [],
    this.status = AppHttpStatus.none,
    this.message = '',
  });

  @override
  List<Object?> get props => [status, message, listModel];

  @override
  String toString() {
    return 'CoinListState(status: $status, message: $message, listModel: $listModel, listViewModel: $listViewModel)';
  }

  /// Creates a copy of the current CoinListState with property changes
  CoinListState copyWith({
    AppHttpStatus? status,
    String? message,
    List<CoinModel>? listModel,
    List<CustomListViewModel>? listViewModel,
  }) {
    return CoinListState(
      status: status ?? this.status,
      message: message ?? this.message,
      listModel: listModel ?? listModel,
      listViewModel: listViewModel ?? listViewModel,
    );
  }
}

class CoinListInitial extends CoinListState {
  const CoinListInitial({super.status = AppHttpStatus.none});
}

class CoinListConnecting extends CoinListState {
  const CoinListConnecting({super.status = AppHttpStatus.connecting});
}

class CoinListSuccess extends CoinListState {
  const CoinListSuccess({super.status = AppHttpStatus.success});
}

class CoinListFail extends CoinListState {
  const CoinListFail({super.status = AppHttpStatus.fail});
}

class CoinListMore extends CoinListState {
  const CoinListMore({super.status = AppHttpStatus.more});
}
