import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Core/Constant/Colors.dart';

class SearchForm extends StatelessWidget {
  const SearchForm(
      {super.key,
      this.onChanged,
      this.search,
      this.onSearch,
      this.onSubmitted});
  final void Function(String)? onChanged;
  final TextEditingController? search;
  final void Function()? onSearch;
  final void Function(String)? onSubmitted;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(12)),
      child: TextFormField(
        onFieldSubmitted: onSubmitted,
        onChanged: onChanged,
        controller: search,
        decoration: InputDecoration(
          hintText: "Search News".tr,
          // fillColor: AppColors.black,
          hintStyle: Theme.of(context)
              .textTheme
              .headline2!
              .copyWith(color: AppColors.deepGrey, fontSize: 15.sp),
          border: InputBorder.none,
          prefixIcon: IconButton(
              onPressed: onSearch,
              icon: const Icon(
                Icons.search,
                color: AppColors.deepGrey,
              )),
        ),
        style: Theme.of(context).textTheme.headline3,
        cursorColor: AppColors.deepGrey,
      ),
    );
  }
}
