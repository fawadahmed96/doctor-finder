// To parse this JSON data, do
//
//     final doctorDetailsModel = doctorDetailsModelFromJson(jsonString);

import 'dart:convert';

DoctorDetailsModel doctorDetailsModelFromJson(String str) => DoctorDetailsModel.fromJson(json.decode(str));

String doctorDetailsModelToJson(DoctorDetailsModel data) => json.encode(data.toJson());

class DoctorDetailsModel {
  final bool? status;
  final Errors? errors;
  final Data? data;

  DoctorDetailsModel({
    this.status,
    this.errors,
    this.data,
  });

  factory DoctorDetailsModel.fromJson(Map<String, dynamic> json) => DoctorDetailsModel(
    status: json["status"],
    errors: json["errors"] == null ? null : Errors.fromJson(json["errors"]),
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "errors": errors?.toJson(),
    "data": data?.toJson(),
  };
}

class Data {
  final Detail? detail;
  final List<Campus>? campus;

  Data({
    this.detail,
    this.campus,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    detail: json["detail"] == null ? null : Detail.fromJson(json["detail"]),
    campus: json["campus"] == null ? [] : List<Campus>.from(json["campus"]!.map((x) => Campus.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "detail": detail?.toJson(),
    "campus": campus == null ? [] : List<dynamic>.from(campus!.map((x) => x.toJson())),
  };
}

class Campus {
  final String? campusId;
  final String? campusName;
  final List<Time>? time;
  final Charges? charges;

  Campus({
    this.campusId,
    this.campusName,
    this.time,
    this.charges,
  });

  factory Campus.fromJson(Map<String, dynamic> json) => Campus(
    campusId: json["campus_id"],
    campusName: json["campus_name"],
    time: json["time"] == null ? [] : List<Time>.from(json["time"]!.map((x) => Time.fromJson(x))),
    charges: json["charges"] == null ? null : Charges.fromJson(json["charges"]),
  );

  Map<String, dynamic> toJson() => {
    "campus_id": campusId,
    "campus_name": campusName,
    "time": time == null ? [] : List<dynamic>.from(time!.map((x) => x.toJson())),
    "charges": charges?.toJson(),
  };
}

class Charges {
  final int? initialCharges;
  final int? followupCharges;

  Charges({
    this.initialCharges,
    this.followupCharges,
  });

  factory Charges.fromJson(Map<String, dynamic> json) => Charges(
    initialCharges: json["initial_charges"]??"0",
    followupCharges: json["followup_charges"]??"0",
  );

  Map<String, dynamic> toJson() => {
    "initial_charges": initialCharges,
    "followup_charges": followupCharges,
  };
}

class Time {
  final String? fullDayName;
  final String? timeFrom;
  final String? timeTo;
  final String? timeFromFormatted;
  final String? timeToFormatted;

  Time({
    this.fullDayName,
    this.timeFrom,
    this.timeTo,
    this.timeFromFormatted,
    this.timeToFormatted,
  });

  factory Time.fromJson(Map<String, dynamic> json) => Time(
    fullDayName: json["full_day_name"],
    timeFrom: json["time_from"],
    timeTo: json["time_to"],
    timeFromFormatted: json["time_from_formatted"],
    timeToFormatted: json["time_to_formatted"],
  );

  Map<String, dynamic> toJson() => {
    "full_day_name": fullDayName,
    "time_from": timeFrom,
    "time_to": timeTo,
    "time_from_formatted": timeFromFormatted,
    "time_to_formatted": timeToFormatted,
  };
}

  class Detail {
  final dynamic docUserId;
  final String? oracleUserName;
  final String? doctorId;
  final String? doctorName;
  final String? gender;
  final String? email;
  final dynamic image;
  final String? education;
  final dynamic isFcf;
  final String? description;
  final String? specialityId;
  final String? specialityEnglish;
  final String? specialityUrdu;
  final String? status;
  final String? doctorImage;

  Detail({
    this.docUserId,
    this.oracleUserName,
    this.doctorId,
    this.doctorName,
    this.gender,
    this.email,
    this.image,
    this.education,
    this.isFcf,
    this.description,
    this.specialityId,
    this.specialityEnglish,
    this.specialityUrdu,
    this.status,
    this.doctorImage,
  });

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    docUserId: json["doc_user_id"],
    oracleUserName: json["oracle_user_name"],
    doctorId: json["doctor_id"],
    doctorName: json["doctor_name"],
    gender: json["gender"],
    email: json["email"],
    image: json["image"],
    education: json["education"],
    isFcf: json["is_fcf"],
    description: json["description"],
    specialityId: json["speciality_id"],
    specialityEnglish: json["speciality_english"],
    specialityUrdu: json["speciality_urdu"],
    status: json["status"],
    doctorImage: json["doctor_image"],
  );

  Map<String, dynamic> toJson() => {
    "doc_user_id": docUserId,
    "oracle_user_name": oracleUserName,
    "doctor_id": doctorId,
    "doctor_name": doctorName,
    "gender": gender,
    "email": email,
    "image": image,
    "education": education,
    "is_fcf": isFcf,
    "description": description,
    "speciality_id": specialityId,
    "speciality_english": specialityEnglish,
    "speciality_urdu": specialityUrdu,
    "status": status,
    "doctor_image": doctorImage,
  };
}

class Errors {
  Errors();

  factory Errors.fromJson(Map<String, dynamic> json) => Errors(
  );

  Map<String, dynamic> toJson() => {
  };
}
