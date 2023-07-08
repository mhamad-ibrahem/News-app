import 'package:get/get.dart';
import 'package:news/Local/features/categories/view/pages/all_news.dart';
import 'package:news/Local/features/categories/view/pages/categories_view.dart';
import 'package:news/Local/features/main/binding/main_bindings.dart';
import 'package:news/Local/features/support/binding/support_bindings.dart';
import 'package:news/Local/features/support/view/supoort_page.dart';
import 'Local/Core/Constant/Routes.dart';
import 'Local/features/categories/binding/category_binding.dart';
import 'Local/features/main/view/main.dart';
import 'Local/features/news_details/binding/news_details_binding.dart';
import 'Local/features/news_details/view/news_details_page.dart';
import 'Local/features/settings/view/settings_view.dart';
import 'Local/features/welcom/binding/welcom_binding.dart';
import 'Local/features/welcom/view/welcom.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: AppRoute.welcom,
      page: () => StartScreen(),
      transition: Transition.fade,
      binding: WelcomBinding(),
      transitionDuration: const Duration(milliseconds: 700)),
//=====================Home=====================
  GetPage(
      name: AppRoute.main,
      page: () => MainView(),
      transition: Transition.fade,
      binding: MainBinding(),
      transitionDuration: const Duration(milliseconds: 700)),
  GetPage(
      name: AppRoute.allNews,
      page: () => AllNewsScreen(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 700)),
  GetPage(
      name: AppRoute.helpCenter,
      page: () => SupoortScreen(),
      transition: Transition.fade,
      binding: SupportBinding(),
      transitionDuration: const Duration(milliseconds: 700)),
  GetPage(
      name: AppRoute.newsDetails,
      page: () => NewsDetailsScreen(),
      transition: Transition.fade,
      binding: NewsDetailsBinding(),
      transitionDuration: const Duration(milliseconds: 700)),
  GetPage(
      name: AppRoute.categoryNews,
      page: () => CategoriesView(),
      transition: Transition.fade,
      binding: CategoryBinding(),
      transitionDuration: const Duration(milliseconds: 700)),
  GetPage(
      name: AppRoute.settings,
      page: () => SettingsView(),
      transition: Transition.fade,
      // binding: CategoryBinding(),
      transitionDuration: const Duration(milliseconds: 700)),
];
