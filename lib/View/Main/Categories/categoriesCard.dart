import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CategoriesCard extends StatelessWidget {
  final VoidCallback fun;
  
  final String title;
  final String description;
  final String imageUrl;

  const CategoriesCard(
      {super.key, required this.fun, required this.title, required this.description, required this.imageUrl,
      
      });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: fun,
      child: Container(
        padding: const EdgeInsets.only(bottom: 20),
        margin: const EdgeInsets.only(top: 20),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Get.theme.primaryColor,
        ),
        child: Column(
          children: [
            Container(
              height: 175,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12)),
                  image: DecorationImage(
                      image: NetworkImage('${imageUrl}'),fit: BoxFit.fill
                      )
                      ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  const SizedBox(
                height: 15,
              ),
              Text('${title}',style: Get.textTheme.headline5,),
               const SizedBox(
                height: 10,
              ),
              Text('${description}',style: Get.textTheme.headline3),
          
                ],
              ),
            ),
          ]
        ),
      ),
    );
  }
}
