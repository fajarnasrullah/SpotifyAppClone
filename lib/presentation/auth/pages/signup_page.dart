import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_app_clone/common/widgets/button/basic_button.dart';
import 'package:spotify_app_clone/core/configs/assets/app_vectors.dart';
import 'package:spotify_app_clone/data/models/auth/create_user_request.dart';
import 'package:spotify_app_clone/domain/usecases/auth/signup.dart';
import 'package:spotify_app_clone/presentation/auth/pages/signin_page.dart';

import '../../../common/widgets/appbar/app_bar.dart';
import '../../../service_locator.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final TextEditingController _fullname = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _signinButton(context),
      appBar: BasicAppbar(
        title: SvgPicture.asset(
          AppVectors.spotifyLogo,
          height: 40,
          width: 40,
        ),
      ),
      body:  SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 50
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _registerText(),
              const SizedBox(height: 20,),
              _fullnameField(context),
              const SizedBox(height: 20,),
              _emailField(context),
              const SizedBox(height: 20,),
              _passwordField(context),
              const SizedBox(height: 20,),
              BasicButton(
                  onPressed: () async {
                    var result = await sl<SignupUseCase>().call(
                        params: CreateUserReq(
                            fullName: _fullname.text.toString(),
                            email: _email.text.toString(),
                            password: _password.text.toString()
                        )
                    );

                    result.fold(
                            (l) {
                              var snackbar = SnackBar(content: Text(l));
                              ScaffoldMessenger.of(context).showSnackBar(snackbar);
                              },
                            (r) {
                              var snackbar = SnackBar(content: Text('You Have Successfully Signed Up'));
                              ScaffoldMessenger.of(context).showSnackBar(snackbar);
                              Navigator.pushAndRemoveUntil(context,
                                  MaterialPageRoute(builder: (BuildContext context) => SigninPage() ),
                                  (route) => false
                              );
                            }
                            );
                    },

                  title: 'Create Account'
              ),
              const SizedBox(height: 20,),

            ],
          ),
      ),
      );

  }

  Widget _registerText() {
    return const Text(
      'Register',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _fullnameField(BuildContext context) {
    return TextField(
      controller: _fullname,
      decoration: const InputDecoration(
          hintText: 'Full Name'
      ).applyDefaults(
          Theme.of(context).inputDecorationTheme
      ),
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(
      controller: _email,
      decoration: const InputDecoration(
          hintText: 'Enter Email'
      ).applyDefaults(
          Theme.of(context).inputDecorationTheme
      ),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      controller: _password,
      decoration: const InputDecoration(
          hintText: 'Password'
      ).applyDefaults(
          Theme.of(context).inputDecorationTheme
      ),
    );
  }

  Widget _signinButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Do you have an account?',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400
          ),
        ),
        SizedBox(width: 5,),
        TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>  SigninPage()
                )
              );
            },
            child: Text(
              'Sign In',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.lightBlue
              ),
            )
        )
      ],
    );
  }

}
