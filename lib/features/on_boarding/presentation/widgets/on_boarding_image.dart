import 'package:flutter/material.dart';

class OnBoardingImage extends StatelessWidget {
  final String imagePath;
  
  const OnBoardingImage({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 290,
      width: 343,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
} 