import 'package:e_shop/utlis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatelessWidget {
  final String image;
  final String text;
  final String subText;
  const OnBoardingPage({
    super.key,
    required this.image,
    required this.text,
    required this.subText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          // Image/Illustration

          Image(
            height: EHelperFunctions.screenHeight() * 0.60,
            width: EHelperFunctions.screenWidth() * 0.8,
            image: AssetImage(image),
          ),

          // Heading

          Text(
            text,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 12),
          // Sub Heading
          SizedBox(
            width: 250,
            child: Text(
              subText,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ),
        ],
        
      ),
    );
  }
}
