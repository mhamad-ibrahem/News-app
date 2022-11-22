import 'package:flutter/material.dart';

class DetailsBody extends StatelessWidget {
  const DetailsBody({super.key, required this.text, @required this.style});
  final String text;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          style: style,
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
