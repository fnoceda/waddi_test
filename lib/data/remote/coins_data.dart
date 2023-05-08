import 'package:flutter/foundation.dart';
import 'package:waddi/domain/models/coin_model.dart';
import 'package:dartz/dartz.dart';
import 'package:waddi/domain/repositories/coins_repository.dart';
import 'package:network/models/failure_model.dart';
import 'package:network/app_network.dart';
import 'package:network/models/response_model.dart';

class CoinsData implements CoinsRepository {
  final AppNetwork appNetwork;
  CoinsData({required this.appNetwork});

  @override
  Future<Either<FailureModel, List<CoinModel>>> getCoinList() async {
    try {
      String path = '/public/v1/coins?skip=0&limit=10';
      // print(1);
      Either<FailureModel, ResponseModel> result =
          await appNetwork.getData(path: path);
      // print(2);

      Either<FailureModel, List<CoinModel>> rta =
          result.fold((l) => Left(l), (r) {
        List<CoinModel> list = [];
        // print(r.data['coins']);

        list.addAll((r.data['coins'] as List)
            .map((e) => CoinModel.fromMap(e))
            .toList());
        // print(4);

        return Right(list);
      });
      return rta;
    } catch (e, s) {
      if (kDebugMode) {
        print(e);
        print(s);
      }

      return const Left(FailureModel(code: 500, message: 'Unknow Error 2'));
    }

    // return rta;
  }
}
