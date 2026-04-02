class Charges {
  final int initialCharges;
  final int followupCharges;

  const Charges({required this.initialCharges, required this.followupCharges});

  factory Charges.fromJson(Map<String, dynamic> json){
    return Charges(
        initialCharges:json['initial_charges']??0,
        followupCharges: json['followup_charges']??0,
    );
  }
}

class DoctorModel{
  final String doctorName;
  final String gender;
  final String education;
  final String specialityEnglish;
  final String locationName;
  final Charges charges;

  const DoctorModel({
    required this.doctorName,
    required this.gender,
    required this.education,
    required this.specialityEnglish,
    required this.locationName,
    required this.charges,
  });

  factory DoctorModel.fromJson(Map<String,dynamic> json){
    return DoctorModel(
      doctorName: json['doctor_name'] ?? '',
      gender: json['gender'] ?? '',
      education: json['education'] ?? '',
      specialityEnglish: json['speciality_english'] ?? '',
      locationName: json['location_name'] ?? '',
      charges:Charges.fromJson(json['charges']),
    );
  }
}