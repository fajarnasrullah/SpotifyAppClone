import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_app_clone/common/widgets/button/basic_button.dart';
import 'package:spotify_app_clone/core/configs/themes/app_themes.dart';
import 'package:spotify_app_clone/main.dart';
import 'package:spotify_app_clone/presentation/auth/pages/auth_page.dart';
import 'package:spotify_app_clone/presentation/choose_mode/bloc/theme_cubit.dart';

import '../../../core/configs/assets/app_images.dart';
import '../../../core/configs/assets/app_vectors.dart';

class ChooseModePage extends StatelessWidget {
  const ChooseModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(40),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AppImages.chooseModeBG),
                      fit: BoxFit.fill
                  )
              ),
            ),
            Container(
              color: Colors.black.withOpacity(0.3),
            ),
            Padding(
              padding: const EdgeInsets.all(40 ),
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.topCenter,
                      child: SvgPicture.asset(AppVectors.spotifyLogo)
                  ),
                  Spacer(),
                  const Text(
                    'Enjoy Listening To Music',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),
                  ),
                  SizedBox(height: 40),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          GestureDetector(
                            onTap: (){
                              context.read<ThemeCubit>().updateTheme(ThemeMode.dark);
                            },
                            child: ClipOval(
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                child: Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: const Color(0xff30393c).withOpacity(0.5),
                                    shape: BoxShape.circle
                                  ),
                                  child: SvgPicture.asset(
                                      AppVectors.moonIcon,
                                    fit: BoxFit.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          Text(
                            'Dark Mode',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white.withOpacity(0.7)
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 40,),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              context.read<ThemeCubit>().updateTheme(ThemeMode.light);
                            },
                            child: ClipOval(
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                child: Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                      color: const Color(0xff30393c).withOpacity(0.5),
                                      shape: BoxShape.circle
                                  ),
                                  child: SvgPicture.asset(
                                    AppVectors.sunIcon,
                                    fit: BoxFit.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          Text(
                            'Light Mode',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white.withOpacity(0.7)
                            ),
                          ),
                        ],
                      )

                    ],
                  ),

                  SizedBox(height: 40),
                  BasicButton(
                      onPressed:() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => const AuthPage()
                            )
                        );
                      },
                      title: 'Get Started'
                  )
                ],
              ),
            ),
          ]
      ),
    );
  }
}
