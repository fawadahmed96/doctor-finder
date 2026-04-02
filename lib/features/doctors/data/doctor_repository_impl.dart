import 'package:doctor_finder/features/doctors/data/doctor_api_service.dart';
import 'package:doctor_finder/features/doctors/domain/doctor_model.dart';
import 'package:doctor_finder/features/doctors/domain/doctor_repository.dart';

class DoctorRepositoryImpl implements DoctorRepository{
    final DoctorApiService _apiService;

    DoctorRepositoryImpl():_apiService=DoctorApiService();
  @override
  Future<List<DoctorModel>> fetchDoctors()async{
    final rawDoctors=await _apiService.fetchDoctors();
    return rawDoctors.map((json)=>DoctorModel.fromJson(json)).toList();
  }
}