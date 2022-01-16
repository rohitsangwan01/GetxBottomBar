import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'cart_controller.dart';

class CartView extends GetView<CartController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.increment(),
        child: const Icon(Icons.add),
      ),
      body: Container(
        color: Colors.green.shade100,
        child: Center(
          child: Obx(() => Text(
                'Cart Items : ${controller.count}',
                style: const TextStyle(fontSize: 20),
              )),
        ),
      ),
    );
  }
}
