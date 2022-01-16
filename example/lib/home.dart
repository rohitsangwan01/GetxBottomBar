// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxbottombar/getxbottombar.dart';
import 'package:getxbottombar_example/app/routes/app_pages.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetxBottomBarView(
      appBar: AppBar(
        title: Text('GetxBottomBar'),
        centerTitle: true,
      ),
      getPages: AppPages.routes,
      routes: [Routes.DASHBOARD, Routes.CART, Routes.PROFILE],
      defaultTransition: Transition.noTransition,
      backgroundColor: Colors.grey.shade100,
      bottomBar: <GetBottomBarItem>[
        GetBottomBarItem(
            icon: Icon(Icons.dashboard),
            title: Text('Dashboard'),
            activeColor: Colors.red),
        GetBottomBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            title: Text('Cart'),
            activeColor: Colors.green),
        GetBottomBarItem(
            icon: Icon(Icons.person),
            title: Text('User'),
            activeColor: Colors.blue)
      ],
    );
  }
}
