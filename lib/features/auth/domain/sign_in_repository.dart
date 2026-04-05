import 'package:doctor_finder/features/auth/domain/sign_in_model.dart';

abstract class SignInRepository {

  Future<SignInModel> signIn(String username,String password);

}