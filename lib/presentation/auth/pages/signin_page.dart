

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_app_clone/common/widgets/button/basic_button.dart';
import 'package:spotify_app_clone/core/configs/assets/app_vectors.dart';
import 'package:spotify_app_clone/presentation/auth/pages/signup_page.dart';
import 'package:spotify_app_clone/presentation/root/pages/root.dart';

import '../../../common/widgets/appbar/app_bar.dart';
import '../../../data/models/auth/signin_user_request.dart';
import '../../../domain/usecases/auth/signin.dart';
import '../../../service_locator.dart';

class SigninPage extends StatelessWidget {
  SigninPage({super.key});

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _signupButton(context),
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
            _signinText(),
            const SizedBox(height: 20,),
            _emailField(context),
            const SizedBox(height: 20,),
            _passwordField(context),
            const SizedBox(height: 20,),
            BasicButton(
                onPressed: () async {
                  var result = await sl<SigninUseCase>().call(
                      params: SigninUserReq(
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
                            var snackbar = SnackBar(content: Text('You Have Successfully Signed In'));
                            ScaffoldMessenger.of(context).showSnackBar(snackbar);
                            Navigator.pushAndRemoveUntil(context,
                                MaterialPageRoute(builder: (BuildContext context)=> const RootPage()),
                                (route) => false
                            );
                      }
                  );

                },
                title: 'Sign In'
            ),
            const SizedBox(height: 20,),

          ],
        ),
      ),
    );

  }

  Widget _signinText() {
    return const Text(
      'Sign In',
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25
      ),
      textAlign: TextAlign.center,
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

  Widget _signupButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Not a Member?',
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
                      builder: (BuildContext context) => SignupPage()
                  )
              );

            },
            child: Text(
              'Register Now',
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
