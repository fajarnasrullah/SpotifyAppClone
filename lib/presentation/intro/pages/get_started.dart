import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_app_clone/common/widgets/button/basic_button.dart';
import 'package:spotify_app_clone/core/configs/assets/app_images.dart';
import 'package:spotify_app_clone/core/configs/assets/app_vectors.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AppImages.introBG),
            fit: BoxFit.fill
        )
      ),
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
          SizedBox(height: 20),
          const Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec consectetur, nibh sed feugiat lobortis, justo arcu scelerisque neque, non condimentum erat dui vitae erat. Phasellus sed lacinia augue.',
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          BasicButton(
              onPressed:() {

              },
              title: 'Get Started')
        ],
      ),
    );
  }
}
