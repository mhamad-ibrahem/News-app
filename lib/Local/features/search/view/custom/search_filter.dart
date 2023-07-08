import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Global/Core/Constant/Size.dart';
import '../../../../Core/Constant/Colors.dart';
import '../../model/search_country_model.dart';

class SearchFilter extends StatelessWidget {
  const SearchFilter(
      {super.key,
      required this.filterBy,
      required this.onChanged,
      this.list,
      this.sortList,
      required this.selectedValue,
      required this.isCountries});
  final String filterBy;
  final dynamic selectedValue;
  final void Function(dynamic)? onChanged;
  final List<CountryModel>? list;
  final List<String>? sortList;
  final bool isCountries;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.5),
      child: Row(
        children: [
          Text(
            filterBy,
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(fontSize: 12.sp, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            width: 3,
          ),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              alignment: Alignment.centerRight,
              height: 40,
              width: AppSize.screenWidth / 3.5,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.black),
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  color: Theme.of(context).primaryColor),
              child: DropdownButton(
                isExpanded: true,
                value: selectedValue,
                items: isCountries
                    ? list!.map((CountryModel e) {
                        return DropdownMenuItem(
                          value: e,
                          child: Text(e.country,
                              style: Theme.of(context).textTheme.headline3),
                        );
                      }).toList()
                    : sortList!
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e,
                                  style: Theme.of(context).textTheme.headline3),
                            ))
                        .toList(),
                onChanged: onChanged,
              ))
        ],
      ),
    );
  }
}
