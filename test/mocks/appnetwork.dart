import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network/app_network.dart';
import 'package:network/models/failure_model.dart';
import 'package:network/models/response_model.dart';

import '../fake/fake_data.dart';

// final mockResponseModel = ResponseModel(code: 200, message: 'OK', data: mockCoinListData);

class MockAppNetwork extends Mock implements AppNetwork {
  @override
  Future<Either<FailureModel, ResponseModel>> getData({
    required String path,
    Map<String, dynamic>? headers,
  }) async {
    try {
      print('viene por aca => ${path}');
      Either<FailureModel, ResponseModel> result =
          await FakeData.fetchData(path);

      // response = result.fold((l) => {}, (r) {

      // });

      return result;
    } catch (e) {
      return const Left(FailureModel(code: 500, message: 'Fatal Error'));
    }
  }
}
