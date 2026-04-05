import 'package:doctor_finder/features/auth/data/sign_in_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final signInRepositoryProvider=Provider<SignInRepositoryImpl>((ref)=>SignInRepositoryImpl());

class SignInState {
  final bool isLoading;
  final String? errorMsg;
  final bool isSuccess;

  const SignInState({this.isLoading = false, this.errorMsg, this.isSuccess = false});
}

class SignInNotifier extends Notifier<SignInState>{
  @override
  SignInState build(){
    return const SignInState();
  }

  Future<void> signIn(String username,String password)async{
    state=const SignInState(isLoading: true);
try{
  final repository= ref.read(signInRepositoryProvider);
  await repository.signIn(username, password);
  state=SignInState(isSuccess: true);
}
    catch(e){
      state=SignInState(errorMsg:e.toString());

    }


    // await Future.delayed(const Duration(seconds: 2));
    //
    // if (email == 'test@test.com' && password == '123456'){
    //   state=const  SignInState(isSuccess:true);
    // }
    // else {
    //   state =const  SignInState(
    //     errorMsg: 'Wrong email or password',
    //   );
    // }
  }
}

final signInProvider=NotifierProvider<SignInNotifier,SignInState>(
    ()=>SignInNotifier(),
);

