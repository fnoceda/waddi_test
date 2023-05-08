// ignore_for_file: constant_identifier_names

import 'package:dio/dio.dart';
import '../models/failure_model.dart';

enum DataSource {
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTHORISED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECEIVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  DEFAULT
}

class ErrorHandler implements Exception {
  late FailureModel faiulure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioError) {
      // dio error so its error from response of the API
      faiulure = _handleError(error);
    } else {
      // default error
      faiulure = DataSource.DEFAULT.getFailureModel();
    }
  }

  FailureModel _handleError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectionTimeout:
        return DataSource.CONNECT_TIMEOUT.getFailureModel();
      case DioErrorType.sendTimeout:
        return DataSource.SEND_TIMEOUT.getFailureModel();
      case DioErrorType.receiveTimeout:
        return DataSource.RECEIVE_TIMEOUT.getFailureModel();

      case DioErrorType.cancel:
        return DataSource.CANCEL.getFailureModel();
      default:
        return DataSource.DEFAULT.getFailureModel();
    }
  }
}

extension DataSourceExtension on DataSource {
  FailureModel getFailureModel() {
    switch (this) {
      case DataSource.BAD_REQUEST:
        return const FailureModel(
            code: ResponseCode.BAD_REQUEST,
            message: ResponseMessage.BAD_REQUEST);
      case DataSource.FORBIDDEN:
        return const FailureModel(
            code: ResponseCode.FORBIDDEN, message: ResponseMessage.FORBIDDEN);
      case DataSource.UNAUTHORISED:
        return const FailureModel(
            code: ResponseCode.UNAUTHORISED,
            message: ResponseMessage.UNAUTHORISED);
      case DataSource.NOT_FOUND:
        return const FailureModel(
            code: ResponseCode.NOT_FOUND, message: ResponseMessage.NOT_FOUND);
      case DataSource.INTERNAL_SERVER_ERROR:
        return const FailureModel(
            code: ResponseCode.INTERNAL_SERVER_ERROR,
            message: ResponseMessage.INTERNAL_SERVER_ERROR);
      case DataSource.CONNECT_TIMEOUT:
        return const FailureModel(
            code: ResponseCode.CONNECT_TIMEOUT,
            message: ResponseMessage.CONNECT_TIMEOUT);
      case DataSource.CANCEL:
        return const FailureModel(
            code: ResponseCode.CANCEL, message: ResponseMessage.CANCEL);
      case DataSource.RECEIVE_TIMEOUT:
        return const FailureModel(
            code: ResponseCode.RECEIVE_TIMEOUT,
            message: ResponseMessage.RECEIVE_TIMEOUT);
      case DataSource.SEND_TIMEOUT:
        return const FailureModel(
            code: ResponseCode.SEND_TIMEOUT,
            message: ResponseMessage.SEND_TIMEOUT);
      case DataSource.CACHE_ERROR:
        return const FailureModel(
            code: ResponseCode.CACHE_ERROR,
            message: ResponseMessage.CACHE_ERROR);
      case DataSource.NO_INTERNET_CONNECTION:
        return const FailureModel(
            code: ResponseCode.NO_INTERNET_CONNECTION,
            message: ResponseMessage.NO_INTERNET_CONNECTION);
      case DataSource.DEFAULT:
        return const FailureModel(
            code: ResponseCode.DEFAULT, message: ResponseMessage.DEFAULT);
      default:
        return const FailureModel(
            code: ResponseCode.DEFAULT, message: ResponseMessage.DEFAULT);
    }
  }
}

class ResponseCode {
  // API status codes
  static const int SUCCESS = 200; // success with data
  static const int CREATED = 201; // success with no content
  static const int BAD_REQUEST = 400; // api rejected the request
  static const int FORBIDDEN = 403; // api rejected the request
  static const int UNAUTHORISED = 401; // user is not authorised
  static const int NOT_FOUND = 404; // api url  not found
  static const int INTERNAL_SERVER_ERROR = 500; //crash happened in server side

  // local status code
  static const int DEFAULT = -1;
  static const int CONNECT_TIMEOUT = -2;
  static const int CANCEL = -3;
  static const int RECEIVE_TIMEOUT = -4;
  static const int SEND_TIMEOUT = -5;
  static const int CACHE_ERROR = -6;
  static const int NO_INTERNET_CONNECTION = -7;
}

class ResponseMessage {
  // API status codes
  static const String SUCCESS = "success"; // success with data
  static const String NO_CONTENT =
      "success with no content"; // success with no content
  static const String BAD_REQUEST =
      "Bad request, try again later"; // FailureModel, api rejected the request
  static const String FORBIDDEN =
      "forbidden request, try again later"; // FailureModel, api rejected the request
  static const String UNAUTHORISED =
      "user is unauthorised, try again later"; // FailureModel user is not authorised
  static const String NOT_FOUND =
      "Url is not found, try again later"; // FailureModel, api url is not correct and not found
  static const String INTERNAL_SERVER_ERROR =
      "some thing went wrong, try again later"; // FailureModel, crash happened in server side

  // local status code
  static const String DEFAULT = "some thing went wrong, try again later";
  static const String CONNECT_TIMEOUT = "time out error, try again later";
  static const String CANCEL = "request was cancelled, try again later";
  static const String RECEIVE_TIMEOUT = "time out error, try again later";
  static const String SEND_TIMEOUT = "time out error, try again later";
  static const String CACHE_ERROR = "Cache error, try again later";
  static const String NO_INTERNET_CONNECTION =
      "Please check your internet connection";
}

class ApiInternalStatus {
  static const int SUCCESS = 0;
  static const int FailureModel = 1;
}
