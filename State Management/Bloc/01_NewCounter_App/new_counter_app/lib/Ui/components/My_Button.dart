import 'package:flutter/material.dart';

class My_Button extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  const My_Button({
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Text(text),
    );
  }
}
