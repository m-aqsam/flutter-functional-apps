import 'package:e_shop/utlis/constants/colors.dart';
import 'package:e_shop/utlis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class Form_Divider extends StatelessWidget {
  final String text;
  const Form_Divider({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        Flexible(
          child: Divider(
            color: dark ? EColors.grey : EColors.darkGrey,
            thickness: 0.5,
            endIndent: 8,
            indent: 40,
          ),
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Flexible(
          child: Divider(
            color: dark ? EColors.grey : EColors.darkGrey,
            thickness: 0.5,
            endIndent: 40,
            indent: 8,
          ),
        ),
      ],
    );
  }
}
