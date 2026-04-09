import 'package:dio/dio.dart';

class DoctorDetailsApiService {
  final Dio _dio;

  DoctorDetailsApiService()
    : _dio = Dio(
        BaseOptions(
          baseUrl:
              'https://ziamis.dzuh.edu.pk/mobile_app/frontend/web/index.php',
          headers: {'sec_token': 'XYZ50XX789'},
        ),
      );

     Future<Map<String,dynamic>> fetchDoctorsDetails(
         {String? docId, String? orgId})async{
       FormData formData=FormData.fromMap({"mrno": "027443","org_id":orgId,"doctorid":docId});

       final response=await _dio.post(
         '?r=api/patient/doctordetail',
         data: formData,
       );

       if(response.data['status']==true){
         return response.data;
       }
       else{
         throw Exception("failed to fetch doctors details");
       }
     }
}
