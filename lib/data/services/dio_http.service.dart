import 'package:dio/dio.dart';
import 'package:notes_app/data/services/contracts/http.service.contract.dart';

class DioHttpService implements HttpService {
  final Dio dio = Dio();

  @override
  Future<Response> get(String url) async {
    try {
      return await dio.get(url);
    } catch (error) {
      throw Exception('Failed to get data: $error.toString()');
    }
  }

  @override
  Future<Response> post(String url, dynamic body) async {
    try {
      return await dio.post(url, data: body);
    } catch (error) {
      throw Exception('Failed to post data: $error.toString()');
    }
  }
}
