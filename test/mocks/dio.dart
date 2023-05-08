import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network/services/dio_service.dart';

class MockDioService extends Mock implements DioService {
  @override
  Future<Dio> getDio({String? baseUrl}) async {
    baseUrl = baseUrl ?? 'example.com';
    Dio dio = Dio();
    final dioAdapter = DioAdapter(dio: dio);
    dio.httpClientAdapter = dioAdapter;

    dioAdapter.onGet(
      baseUrl,
      (request) => request.reply(200, {'message': 'Success!'}),
    );

    final response = await dio.get(baseUrl);

    print('baseUrl=>$baseUrl data=>${response.data}');

    return dio;
  }
}
