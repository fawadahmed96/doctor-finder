import 'package:doctor_finder/features/doctors/data/doctor_repository_impl.dart';
import 'package:doctor_finder/features/doctors/domain/doctor_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final doctorRepositoryProvider = Provider<DoctorRepositoryImpl>(
  (ref) => DoctorRepositoryImpl(),
);

final doctorProvider = FutureProvider<List<DoctorModel>>((ref) async {
  final repository = ref.watch(doctorRepositoryProvider);
  return repository.fetchDoctors();
});
