import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Core/Constant/Colors.dart';
import '../../../View/Widget/custom_app_bar.dart';
import '../controller/support_controller.dart';
import 'custom/support_body.dart';

class SupoortScreen extends StatelessWidget {
  SupoortScreen({super.key});
  final SupoortController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: customAppBar(title: 'Help & Support'),
          body: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 25),
              child: GetBuilder<SupoortController>(
                builder: (controller) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'FAQ :',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ListTile(
                        title: Text(
                          'How to use this app',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        trailing: controller.visible == false
                            ? const Icon(
                                Icons.arrow_forward,
                                color: AppColors.cyan,
                              )
                            : const Icon(
                                Icons.arrow_downward,
                                color: AppColors.cyan,
                              ),
                        onTap: () {
                          controller.showMoreInfo();
                        },
                      ),
                      Visibility(
                          visible: controller.visible,
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: SupportBody(),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      ListTile(
                        title: Text(
                          'How made this app',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        trailing: controller.visibleName == false
                            ? const Icon(
                                Icons.arrow_forward,
                                color: AppColors.cyan,
                              )
                            : const Icon(
                                Icons.arrow_downward,
                                color: AppColors.cyan,
                              ),
                        onTap: () {
                          controller.showNameInfo();
                        },
                      ),
                      Visibility(
                        visible: controller.visibleName,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 10),
                          child: Text(
                            'This app made by Mhamad Ibrahem',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                      ),
                    ]),
              ))),
    );
  }
}
