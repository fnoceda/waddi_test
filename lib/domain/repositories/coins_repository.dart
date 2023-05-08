import 'package:dartz/dartz.dart';
import 'package:waddi/domain/models/coin_model.dart';
import 'package:network/models/failure_model.dart';

abstract class CoinsRepository {
  Future<Either<FailureModel, List<CoinModel>>> getCoinList();
}
