import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red.shade100,
        child: Center(
          child: Text(
            '${controller.page} is working',
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
