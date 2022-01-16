import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue.shade100,
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
