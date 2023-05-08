library network;

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:network/models/failure_model.dart';
import 'package:dartz/dartz.dart';
import 'package:network/services/dio_service.dart';
import 'helpers/error_handler.dart';
import 'models/response_model.dart';

class AppNetwork {
  final String baseUrl;
  final DioService dioService = DioService();
  AppNetwork({
    required this.baseUrl,
  });
  Future<Either<FailureModel, ResponseModel>> postData({
    required String path,
    required Map<String, dynamic> body,
    Map<String, dynamic>? headers,
  }) async {
    try {
      var client = await dioService.getDio(baseUrl: baseUrl);
      Response response = await client.post(
        path,
        data: body,
      );
      return Right(
        ResponseModel(
          code: response.statusCode!,
          message: 'OK',
          data: response.data,
        ),
      );
    } on PlatformException catch (e, s) {
      if (kDebugMode) {
        print(e);
        print(s);
      }
      return Left(ErrorHandler.handle(e).faiulure);
    }
  }

  Future<Either<FailureModel, ResponseModel>> getData({
    required String path,
    Map<String, dynamic>? headers,
  }) async {
    try {
      // print(22);

      var client = await dioService.getDio(baseUrl: baseUrl);
      // print(23);

      Response response = await client.get(path);
      // print(24);
      return Right(
        ResponseModel(
          code: response.statusCode!,
          message: 'OK',
          data: response.data,
        ),
      );
    } on PlatformException catch (e, s) {
      if (kDebugMode) {
        print(e);
        print(s);
      }
      return Left(ErrorHandler.handle(e).faiulure);
    }
  }
}
