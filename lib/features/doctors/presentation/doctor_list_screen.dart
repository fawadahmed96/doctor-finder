import 'package:doctor_finder/features/doctors/domain/doctor_model.dart';
import 'package:doctor_finder/features/doctors/presentation/doctor_details_screen.dart';
import 'package:doctor_finder/features/doctors/presentation/doctor_list_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DoctorListScreen extends ConsumerWidget {
  const DoctorListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final doctorAsync = ref.watch(doctorProvider);
    final searchQuery = ref.watch(searchQueryProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Doctors List')),
      body: doctorAsync.when(
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
        data: (doctors) {
          final filtered =
                doctors
                  .where(
                    (doctor) =>
                        doctor.doctorName.toLowerCase().contains(searchQuery.toLowerCase()),
                  )
                  .toList();

          return Column(
              children: [
                Padding(padding: const EdgeInsets.all(16),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search doctors...',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                  ),
                  onChanged:(value)=> ref.read(searchQueryProvider.notifier).state=value ,
                ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: filtered.length,
                      itemBuilder:(context,index){
                        final doctor=filtered[index];
                        return InkWell(
                          onTap: (){
                            print(doctor.doctorId + doctor.locationId);
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) => DoctorDetailsScreen(
                                docId: doctor.doctorId,
                                orgId: doctor.locationId,
                              ),
                            ),);
                          },
                          child: Card(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    doctor.doctorName,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(doctor.specialityEnglish),
                                  const SizedBox(height: 4),
                                  Text(doctor.locationName),
                                  const SizedBox(height: 4),
                                  Text('Rs. ${doctor.charges.initialCharges}'),
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                  ),
                ),
              ]
          );
        },
      ),
    );
  }
}
