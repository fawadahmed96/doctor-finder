import 'package:doctor_finder/features/doctors/domain/doctor_details_model.dart';
import 'package:doctor_finder/features/doctors/domain/doctor_model.dart';

abstract class DoctorDetailsRepository {

  Future<DoctorDetailsModel> fetchDoctorDetails(String docId,String orgId);
}