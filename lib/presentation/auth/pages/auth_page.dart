import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_app_clone/common/helpers/is_dark_mode.dart';
import 'package:spotify_app_clone/common/widgets/button/basic_button.dart';
import 'package:spotify_app_clone/core/configs/assets/app_images.dart';
import 'package:spotify_app_clone/core/configs/assets/app_vectors.dart';
import 'package:spotify_app_clone/presentation/auth/pages/signin_page.dart';
import 'package:spotify_app_clone/presentation/auth/pages/signup_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(AppVectors.topPatternPic),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(AppVectors.bottomPatternPic),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(AppImages.authBG),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppVectors.spotifyLogo),
                  SizedBox(height: 40,),
                  Text(
                    'Enjoy Listening Music',
                    style: TextStyle(
                        color: context.isDarkMode ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w700,
                      fontSize: 18
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text(
                    'Download and listen your best playlist music for the future.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: context.isDarkMode ? Colors.white : Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 14
                    ),
                  ),
                  SizedBox(height: 40,),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                          child: BasicButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) => SignupPage()
                                    )
                                );
                              },
                              title: 'Register'
                          )
                      ),
                      Expanded(
                        flex: 1,
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) => SigninPage()
                                  )
                              );
                            },
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                color: context.isDarkMode ? Colors.white : Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                              ),
                            )
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
