import 'package:get/get.dart';

class CartController extends GetxController {
  final count = 0.obs;

  @override
  void onInit() {
    count.value = 10;
    super.onInit();
  }

  void increment() => count.value++;
}
