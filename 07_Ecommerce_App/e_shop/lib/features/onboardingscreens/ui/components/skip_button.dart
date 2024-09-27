import 'package:flutter/material.dart';

class SkipButton extends StatelessWidget {
  final void Function()? onTAp;
  const SkipButton({super.key, required this.onTAp});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: kToolbarHeight,
      right: Checkbox.width,
      child: TextButton(
        onPressed: onTAp,
        child: const Text("Skip"),
      ),
    );
  }
  //
  
  
}
