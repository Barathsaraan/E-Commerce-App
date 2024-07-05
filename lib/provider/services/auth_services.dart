import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sunstar/common/dio_client.dart';
import 'package:sunstar/entities/user.dart';


class AuthService {
  final Dio _dio = ApiClient.dio;

  Future<User> login(String phoneNumber) async {
    try {
      var response =
          await _dio.post("/auth/login", data: {"phoneNumber": phoneNumber});

      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: "Login Successful");
        return User.fromJson(response.data);
      } else {
        Fluttertoast.showToast(msg: "Login Failed");
        throw Exception(response.data["message"]);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> logout() async {
    return true;
  }
}
