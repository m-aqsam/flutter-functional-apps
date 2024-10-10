import 'package:e_shop/utlis/constants/text_strings.dart';
import 'package:flutter/material.dart';

class Privacy_Policy_Text extends StatelessWidget {
  const Privacy_Policy_Text({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          child: SizedBox(
              width: 24,
              height: 24,
              child: Checkbox(value: true, onChanged: (value) {})),
        ),
        SizedBox(width: 4),
        Text.rich(TextSpan(
          children: [
            TextSpan(
                text: ETexts.signUpIAgree,
                style: Theme.of(context).textTheme.bodySmall),
            TextSpan(
              text: ' ${ETexts.signUpPrivacyPolicy}',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
            TextSpan(
                text: ' ${ETexts.signUpAnd} ',
                style: Theme.of(context).textTheme.bodySmall),
            TextSpan(
              text: ETexts.signUpTermOfUse,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ))
      ],
    );
  }
}
