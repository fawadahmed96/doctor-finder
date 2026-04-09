import 'package:doctor_finder/features/doctors/domain/doctor_details_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'doctor_details_notifier.dart';

class DoctorDetailsScreen extends ConsumerWidget {
  final String docId;
  final String orgId;

  const DoctorDetailsScreen({
    super.key,
    required this.docId,
    required this.orgId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailAsync = ref.watch(doctorDetailProvider('$docId,$orgId'));

    final selectedCampus = ref.watch(selectedCampusProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Doctor Details'),
      ),
      body: detailAsync.when(
        loading: () =>
        const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stack) =>
            Center(
              child: Text('Error: $error'),
            ),
        data: (doctorDetails) =>
            _buildContent(
              context,
              ref,
              doctorDetails,
              selectedCampus,
            ),
      ),
    );
  }
  Widget _buildContent(
      BuildContext context,
      WidgetRef ref,
      DoctorDetailsModel doctorDetails,
      int selectedCampus,
      ) {
    final detail = doctorDetails.data!.detail!;
    final campusList = doctorDetails.data!.campus!;
    final currentCampus = campusList[selectedCampus];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Doctor info card
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    detail.doctorName??'',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(detail.specialityEnglish??''),
                  const SizedBox(height: 4),
                  Text(detail.education??''),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Campus selector
          Text(
            'Select Campus',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: campusList.asMap().entries.map((entry) {
              final index = entry.key;
              final campus = entry.value;
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ChoiceChip(
                  label: Text(campus.campusName!),
                  selected: selectedCampus == index,
                  onSelected: (selected) {
                    ref.read(selectedCampusProvider.notifier).state = index;
                  },
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 16),

          // Charges
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Consultation Fees',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text('Initial: Rs. ${currentCampus.charges!.initialCharges}'),
                  Text('Followup: Rs. ${currentCampus.charges!.followupCharges}'),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // OPD Schedule
          Text(
            'OPD Schedule',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: _buildSchedule(currentCampus),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildSchedule(Campus currentCampus) {
    final allDays = [
      'Monday', 'Tuesday', 'Wednesday',
      'Thursday', 'Friday', 'Saturday', 'Sunday'
    ];

    return allDays.map((day) {
      final times = currentCampus.time!
          .where((t) => t.fullDayName == day)
          .toList();

      if (times.isEmpty) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(day),
              Text(
                'Not Available',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        );
      }

      return Column(
        children: times.map((time) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(day),
              Text('${time.timeFromFormatted} - ${time.timeToFormatted}'),
            ],
          ),
        )).toList(),
      );
    }).toList();
  }

}