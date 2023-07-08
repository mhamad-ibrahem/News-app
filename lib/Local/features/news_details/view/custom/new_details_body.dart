import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsBody extends StatelessWidget {
  const DetailsBody({super.key, required this.text, @required this.style});
  final String? text;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text ?? 'empty'.tr,
          style: style,
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
