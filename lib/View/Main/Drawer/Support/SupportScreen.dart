import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_app/View/Main/Drawer/Support/SupportBody.dart';
import '../../../../Constant/Constant.dart';
import '../../../../Controller/Support/SupportController.dart';

class SupoortScreen extends StatelessWidget {
  SupoortScreen({super.key});
  SupoortController controller = Get.put(SupoortController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: red,
            title: Text(
              'Help & Support'.tr,
              style: TextStyle(
                  color: white, fontSize: 18, fontWeight: FontWeight.w500),
            ),
            centerTitle: true,
          ),
          body: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 25),
              child: GetBuilder<SupoortController>(
                builder: (controller) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'FAQ :'.tr,
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ListTile(
                        title: Text(
                          'How to use this app'.tr,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        trailing: controller.visible == false
                            ? const Icon(
                                Icons.arrow_forward,
                                color: cyan,
                              )
                            : const Icon(
                                Icons.arrow_downward,
                                color: cyan,
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
                          'How made this app'.tr,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        trailing: controller.visibleName == false
                            ? const Icon(
                                Icons.arrow_forward,
                                color: cyan,
                              )
                            : const Icon(
                                Icons.arrow_downward,
                                color: cyan,
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
                            'This app made by Mhamad Ibrahem'.tr,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                      ),
                    ]),
              ))),
    );
  }
}
