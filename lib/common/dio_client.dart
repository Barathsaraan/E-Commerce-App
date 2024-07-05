import 'package:dio/dio.dart';
import 'package:sunstar/constant/config.dart';
import 'package:sunstar/constant/prefs.dart';


class ApiClient {
  static final Dio _dio = Dio();

  static Dio get dio => _dio;

  ApiClient._();

  static void initialize() async {
    // _dio.options.baseUrl = AppConfig.apiUrl;

    String? userid = await SharedPrefsHelper.getString("id");

    _dio.options.headers = {
      "userid": userid ?? "",
    };
    _dio.interceptors.add(LogInterceptor(responseBody: true));
  }
}
