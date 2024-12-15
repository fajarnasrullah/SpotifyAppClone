import 'package:flutter/material.dart';
import 'package:spotify_app_clone/core/configs/themes/app_themes.dart';

class BasicButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double ? height;
  const BasicButton({super.key, required this.onPressed, required this.title, this.height});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(height ?? 60)
        ),
        child: Text(title, style: TextStyle(color: Colors.black),));
  }
}
