import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert' as convert;
import 'package:network/models/failure_model.dart';
import 'package:network/models/response_model.dart';

class FakeData {
  static Future<Either<FailureModel, ResponseModel>> fetchData(
    String filePath,
  ) async {
    print('_init fetchData');
    try {
      // Future.delayed(Duration(seconds: 1));

      if (filePath == '/public/v1/coins?skip=0&limit=10') {
        filePath = 'test/fake/json/coin_list.json';
      }

      final string = await rootBundle.loadString(filePath);
      Map content = convert.jsonDecode(string);
      return Right(ResponseModel(code: 200, message: 'OK', data: content));
    } catch (error) {
      // print('FakeData::Error => ' + error.toString());
      return const Left(FailureModel(code: 500, message: 'Error fetchData'));
    }
  }
}
