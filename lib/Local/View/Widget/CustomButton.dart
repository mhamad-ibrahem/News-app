import 'package:flutter/material.dart';
import '../../Core/Constant/Colors.dart';
import '../../Core/Constant/TextStyles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.buttonBody,
    required this.onTap,
    required this.buttonWidth,
  }) : super(key: key);
  final double buttonWidth;
  final void Function()? onTap;
  final String buttonBody;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      color: AppColors.primaryColor,
      disabledColor: AppColors.primaryColor,
      disabledTextColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: SizedBox(
        width: buttonWidth,
        child: Center(
          child: Text(
            buttonBody,
            style: buttonTextStyle(),
          ),
        ),
      ),
    );
  }
}
