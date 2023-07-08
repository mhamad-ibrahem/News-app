import 'package:flutter/material.dart';
import '../../../Local/Core/Constant/Colors.dart';
import '../../../Local/View/Widget/retry_button.dart';
import '../Constant/Size.dart';
import 'status_request.dart';

class HandilingDataView extends StatelessWidget {
  const HandilingDataView(
      {super.key,
      required this.statusRequest,
      required this.child,
      this.retryFunction});
  final StatusRequest statusRequest;
  final Widget child;
  final void Function()? retryFunction;
  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Container(
            height: AppSize.screenHight,
            width: AppSize.screenWidth,
            alignment: Alignment.center,
            child: const CircularProgressIndicator(
              color: AppColors.primaryColor,
            ))
        : statusRequest == StatusRequest.faliure
            ? RetryButton(
                hight: AppSize.screenHight * 0.1,
                retryFunction: retryFunction,
                textError: 'Some thing wrong',
              )
            : statusRequest == StatusRequest.offlineFaliure
                ? RetryButton(
                    hight: AppSize.screenHight * 0.1,
                    retryFunction: retryFunction,
                    textError: 'Check your enternet connection',
                  )
                : statusRequest == StatusRequest.serverFaliure
                    ? RetryButton(
                        hight: AppSize.screenHight * 0.4,
                        retryFunction: retryFunction,
                        textError: 'Some thing wrong',
                      )
                    : child;
  }
}

class HandilingDataRequest extends StatelessWidget {
  const HandilingDataRequest(
      {super.key, required this.statusRequest, required this.child});
  final StatusRequest statusRequest;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? const Center(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            ],
          ))
        : child;
  }
}
