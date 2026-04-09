import 'package:doctor_finder/features/doctors/data/doctor_details_repository_impl.dart';
import 'package:doctor_finder/features/doctors/data/doctor_repository_impl.dart';
import 'package:doctor_finder/features/doctors/domain/doctor_details_model.dart';
import 'package:doctor_finder/features/doctors/domain/doctor_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final doctorDetailsRepositoryProvider = Provider<DoctorDetailsRepositoryImpl>(
  (ref) => DoctorDetailsRepositoryImpl(),
);

final doctorDetailProvider=FutureProvider.family<DoctorDetailsModel,String>((ref,params)async{
  final parts = params.split(',');
  final docId=parts[0];
  final orgId=parts[1];
  final repository=ref.watch(doctorDetailsRepositoryProvider);
  return repository.fetchDoctorDetails(docId,orgId);
});

final selectedCampusProvider=StateProvider<int>((ref)=>0);




