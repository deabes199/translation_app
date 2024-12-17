import 'package:dio/dio.dart';
import 'package:google_translation_app/core/helper/constant.dart';

class ApiServices {
  final Dio dio;
 

  ApiServices(this.dio);
  Future<Response> get(
      {required String endpoint, required Map<String, dynamic> params}) async {
    final response =
        await dio.get('$kBaseUrl/$endpoint', queryParameters: params);
    return response;
  }



  Future<Response> post(
      {required String endpoint,
      required Map<String, dynamic> params,
      Map<String, dynamic>? data,Options?optaion}) async {
    final response = await dio.post('$kBaseUrl/$endpoint',
        queryParameters: params, data: data,options: optaion);
    return response;
  }
}
