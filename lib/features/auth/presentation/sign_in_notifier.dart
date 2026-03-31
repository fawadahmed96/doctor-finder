import 'package:riverpod_annotation/riverpod_annotation.dart';

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

  Future<void> signIn(String email,String password)async{
    state=const  SignInState(isLoading: true);
    await Future.delayed(const Duration(seconds: 2));

    if (email == 'test@test.com' && password == '123456'){
      state=const  SignInState(isSuccess:true);
    }
    else {
      state =const  SignInState(
        errorMsg: 'Wrong email or password',
      );
    }
  }
}

final signInProvider=NotifierProvider<SignInNotifier,SignInState>(
    ()=>SignInNotifier(),
);

