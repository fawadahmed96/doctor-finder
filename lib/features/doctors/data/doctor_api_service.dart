import 'package:dio/dio.dart';

class DoctorApiService {
  final Dio _dio;

  DoctorApiService()
    : _dio = Dio(
        BaseOptions(
          baseUrl:
              'https://ziamis.dzuh.edu.pk/mobile_app/frontend/web/index.php',
          headers: {'sec_token': 'XYZ50XX789'},
        ),
      );

     Future<List<dynamic>> fetchDoctors()async{
       FormData formData=FormData.fromMap({"mrno": "027443"});

       final response=await _dio.post(
         '?r=api/patient/doctorsearch',
         data: formData,
       );

       if(response.data['status']==true){
         return response.data['data']['doctors'];
       }
       else{
         throw Exception("failed to fetch doctors");
       }
     }
}
