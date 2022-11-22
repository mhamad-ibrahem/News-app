
import 'package:flutter/material.dart';
class DrawerTile extends StatelessWidget {
   final VoidCallback fun;
   final String title ;
   final Widget leading;
 final Widget? widget;
  const DrawerTile({super.key,  required this.fun, required this.title, required this.leading, this.widget,});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.all(5),
      margin:const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color:Theme.of(context).primaryColor,
        
      ),
      child: ListTile(
        leading: leading,
        title: Text(title,style:Theme.of(context).textTheme.headline4,),
        trailing: widget,
        onTap :fun
        
      ),
    );
  }
}