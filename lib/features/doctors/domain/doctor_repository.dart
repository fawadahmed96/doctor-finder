import 'package:doctor_finder/features/doctors/domain/doctor_model.dart';

abstract class DoctorRepository {

  Future<List<DoctorModel>> fetchDoctors();
}