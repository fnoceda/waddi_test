import 'package:get_it/get_it.dart';
import 'package:network/app_network.dart';
import 'package:network/services/dio_service.dart';

import 'data/remote/coins_data.dart';
import 'domain/repositories/coins_repository.dart';
import 'features/coin_list/bloc/coin_list_bloc.dart';

class MyGetIt {
  const MyGetIt._();
  static final sl = GetIt.instance;

  static setUpLocators(
      {required String baseUrl, required AppNetwork appNetwork}) {
    CoinsRepository coinsRepository = CoinsData(appNetwork: appNetwork);

    sl.registerSingleton<CoinListBloc>(
        CoinListBloc(coinsRepository: coinsRepository));
  }
}
