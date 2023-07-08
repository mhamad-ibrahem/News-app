import 'package:flutter/material.dart';
import 'package:news/Local/Core/Constant/Colors.dart';

class CustomExitButton extends StatelessWidget {
  const CustomExitButton({
    super.key,
    this.onPressed,
  });
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: AppColors.red.withOpacity(0.4),
      child: IconButton(
        onPressed: onPressed,
        icon: const Icon(Icons.close),
        color: AppColors.white,
      ),
    );
  }
}
