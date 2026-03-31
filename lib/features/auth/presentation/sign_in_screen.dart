import 'package:doctor_finder/features/doctors/presentation/doctor_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'sign_in_notifier.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(signInProvider);
    ref.listen<SignInState>(signInProvider, (previous, next) {
      if (next.isSuccess) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => DoctorListScreen()),
        );
      }
      if (next.errorMsg != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.errorMsg!), backgroundColor: Colors.red),
        );
      }
    });
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Doctor finder',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 40),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 24),
              if (state.errorMsg != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(
                    state.errorMsg!,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed:
                      state.isLoading
                          ? null
                          : () {
                            ref
                                .read(signInProvider.notifier)
                                .signIn(
                                  _emailController.text,
                                  _passwordController.text,
                                );
                          },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child:
                        state.isLoading
                            ? CircularProgressIndicator(color: Colors.white)
                            : Text('Sign In'),
                  ),
                ),
              ),

              // SizedBox(
              //   width: double.infinity,
              //   child: ElevatedButton(
              //     onPressed: () {
              //       if (state.errorMsg != null) {
              //         Padding(
              //           padding: EdgeInsets.only(bottom: 16),
              //           child: Text(
              //             state.errorMsg!,
              //             style: TextStyle(color: Colors.red),
              //           ),
              //         );
              //         SizedBox(
              //           width: double.infinity,
              //           child: ElevatedButton(
              //               onPressed:state.isLoading?null:
              //               (){
              //                 ref.read(signInProvider.notifier).signIn(
              //                   'test@test.com',
              //                   '123456',
              //                 );
              //               },
              //             child: Padding(
              //               padding: const EdgeInsets.all(16.0),
              //               child: state.isLoading?
              //               CircularProgressIndicator(color: Colors.white,):Text("Sign In"),
              //             ),
              //           ),
              //         );
              //       }
              //     },
              //     child: Padding(
              //       padding: const EdgeInsets.all(16.0),
              //       child: Text('Sign In'),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
