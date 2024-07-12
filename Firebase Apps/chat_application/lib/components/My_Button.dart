import 'package:flutter/material.dart';

class My_Button extends StatelessWidget {
  final String btnText;
  final void Function()? onTap;
  const My_Button({
    super.key,
    required this.btnText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.symmetric(horizontal: 25),
        child: Center(child: Text(btnText)),
      ),
    );
  }
}
