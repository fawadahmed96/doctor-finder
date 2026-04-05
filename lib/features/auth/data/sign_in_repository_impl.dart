import 'package:doctor_finder/features/auth/data/sign_in_api_service.dart';
import 'package:doctor_finder/features/auth/domain/sign_in_model.dart';
import 'package:doctor_finder/features/auth/domain/sign_in_repository.dart';

class SignInRepositoryImpl extends SignInRepository{
  final SignInApiService _signInApiService;

  SignInRepositoryImpl():_signInApiService=SignInApiService();

  @override
  Future<SignInModel> signIn(String username,String password)async{
     final rawData=await _signInApiService.signIn(username, password);
     return SignInModel.fromJson(rawData);

  }
}