import 'package:get/get.dart';

import '../../home.dart';
import '../modules/cart/cart_binding.dart';
import '../modules/cart/cart_view.dart';
import '../modules/dashboard/dashboard_binding.dart';
import '../modules/dashboard/dashboard_view.dart';
import '../modules/profile/profile_binding.dart';
import '../modules/profile/profile_view.dart';


// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const Home(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
  
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.CART,
      page: () => CartView(),
      binding: CartBinding(),
    ),
  ];
}
