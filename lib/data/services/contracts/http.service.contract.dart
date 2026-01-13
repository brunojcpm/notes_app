import 'package:dio/dio.dart';

abstract interface class HttpService {
  Future<Response> get(String url);
  Future<Response> post(String url, dynamic body);
}
