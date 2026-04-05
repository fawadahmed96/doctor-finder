class SignInModel {
  final String? msg;
  final bool? status;
  final Data? data;

  SignInModel({
    required this.msg,
    required this.status,
    required this.data
  });

  factory SignInModel.fromJson(Map<String,dynamic> json)=>
      SignInModel(
          msg: json["msg"],
          status: json["status"],
          data: json["data"]==null?null:Data.fromJson(json['data']),
      );
}

class Data {
  final String? userId;
  final String? userName;
  final String? name;
  final String? userPassword;
  final String? userTypeId;
  final String? userType;
  final String? createdDatetime;
  final String? createdBy;

  Data({
    this.userId,
    this.userName,
    this.name,
    this.userPassword,
    this.userTypeId,
    this.userType,
    this.createdDatetime,
    this.createdBy,
  });

  factory Data.fromJson(Map<String, dynamic> json) =>
      Data(
        userId: json["USER_ID"],
        userName: json["USER_NAME"],
        name: json["NAME"],
        userPassword: json["USER_PASSWORD"],
        userTypeId: json["USER_TYPE_ID"],
        userType: json["USER_TYPE"],
        createdDatetime: json["CREATED_DATETIME"],
        createdBy: json["CREATED_BY"],
      );
}