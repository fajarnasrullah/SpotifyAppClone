

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_app_clone/common/widgets/button/basic_button.dart';
import 'package:spotify_app_clone/core/configs/assets/app_vectors.dart';
import 'package:spotify_app_clone/presentation/auth/pages/signup_page.dart';

import '../../../common/widgets/appbar/app_bar.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

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
            _signinText(),
            const SizedBox(height: 20,),
            _emailField(context),
            const SizedBox(height: 20,),
            _passwordField(context),
            const SizedBox(height: 20,),
            BasicButton(
                onPressed: () {

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
      decoration: const InputDecoration(
          hintText: 'Enter Email'
      ).applyDefaults(
          Theme.of(context).inputDecorationTheme
      ),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
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
          'Not a Member?',
          style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400
          ),
        ),
        SizedBox(width: 5,),
        TextButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                MaterialPageRoute(
                    builder: (BuildContext context) => const SignupPage()
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
