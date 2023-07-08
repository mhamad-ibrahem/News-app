import 'package:flutter/material.dart';
import '../../Core/Constant/Colors.dart';
import '../../Core/Constant/TextStyles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.icon,
    required this.label,
    required this.hint,
    required this.obscure,
    required this.textEditingController,
    required this.validator,
    this.inputType,
    @required this.suffixIcon,
    this.onChange,
  }) : super(key: key);
  final IconData icon;
  final String label;
  final String hint;
  final bool obscure;
  final TextInputType? inputType;
  final TextEditingController? textEditingController;
  final String? Function(String?) validator;
  final Widget? suffixIcon;
  final void Function(String)? onChange;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChange,
      controller: textEditingController,
      validator: validator,
      style: textFormStyle(),
      obscureText: obscure,
      maxLines: 1,
      cursorColor: AppColors.deepGrey,
      keyboardType: inputType,
      decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.grey,
          suffixIcon: suffixIcon,
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Icon(
              icon,
              color: AppColors.deepGrey,
            ),
          ),
          contentPadding:
              const EdgeInsets.only(left: 0, right: 0, top: 15, bottom: 15),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: hint,
          hintStyle: Theme.of(context)
              .textTheme
              .headline2!
              .copyWith(color: AppColors.deepGrey),
          // labelText: label,
          labelStyle: const TextStyle(
            fontSize: 17,
            color: AppColors.black,
            fontWeight: FontWeight.bold,
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.grey)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.grey, width: 2)),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.grey)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:
                  const BorderSide(color: AppColors.primaryColor, width: 2)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          )),
    );
  }
}
