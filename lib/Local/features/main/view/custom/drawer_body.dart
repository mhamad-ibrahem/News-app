import 'package:flutter/material.dart';

class DrawerBody extends StatelessWidget {
  final VoidCallback fun;
  final String title;
  final Widget? widget;
  final IconData icon;
  final Color iconColor;
  const DrawerBody({
    super.key,
    required this.fun,
    required this.title,
    this.widget,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
            leading: Icon(
              icon,
              color: iconColor,
            ),
            title: Text(
              title,
              style: Theme.of(context).textTheme.headline4,
            ),
            trailing: widget,
            onTap: fun),
        const Divider(
          thickness: 1.5,
        ),
      ],
    );
  }
}
