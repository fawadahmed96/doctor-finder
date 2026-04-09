import 'package:doctor_finder/features/doctors/data/doctor_api_service.dart';
import 'package:doctor_finder/features/doctors/data/doctor_details_api_service.dart';
import 'package:doctor_finder/features/doctors/domain/doctor_details_model.dart';
import 'package:doctor_finder/features/doctors/domain/doctor_details_repository.dart';
import 'package:doctor_finder/features/doctors/domain/doctor_model.dart';
import 'package:doctor_finder/features/doctors/domain/doctor_repository.dart';

class DoctorDetailsRepositoryImpl implements DoctorDetailsRepository{
    final DoctorDetailsApiService _doctorDetailsApiService;

    DoctorDetailsRepositoryImpl():_doctorDetailsApiService=DoctorDetailsApiService();
  @override
  Future<DoctorDetailsModel> fetchDoctorDetails(String docId,String orgId)async{
    final rawDoctorDetails=await _doctorDetailsApiService.fetchDoctorsDetails(docId: docId,orgId: orgId);
    return DoctorDetailsModel.fromJson(rawDoctorDetails);
  }
}