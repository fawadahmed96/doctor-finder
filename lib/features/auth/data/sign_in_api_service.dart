import 'package:dio/dio.dart';

class SignInApiService {
  final Dio _dio;

  SignInApiService()
    : _dio = Dio(
        BaseOptions(
          baseUrl:
              'https://ziamis.dzuh.edu.pk/mobile_app/frontend/web/index.php',
          headers: {'sec_token': 'XYZ50XX789'},
        ),
      );

  Future<Map<String,dynamic>> signIn(String username,String password) async {
    FormData formData = FormData.fromMap({
      "username": username,
      "password": password,
    });

    final response=await _dio.post(
      '?r=api/patient/signin',
      data: formData,
    );

    if(response.data["status"]==true){
      return response.data;
    }
    else {
      throw Exception(response.data["msg"]);
    }
  }
}
