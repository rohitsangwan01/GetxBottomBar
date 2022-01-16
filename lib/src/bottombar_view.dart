// ignore_for_file: prefer_const_constructors, constant_identifier_names, must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../getxbottombar.dart';

class GetxBottomBarView extends StatelessWidget {
  ///Don't Pass Route of Same Page, Ex: (Don't pass `Routes.Home` from `Home` Page)
  ///in `routes` list

  GetxBottomBarView({
    Key? key,
    required this.getPages,
    required this.routes,
    required this.bottomBar,
    this.navigationKey = 1,
    this.appBar,
    this.defaultTransition,
    this.curve = Curves.easeOutQuint,
    this.duration = const Duration(milliseconds: 750),
    this.height,
    this.backgroundColor,
    this.showActiveBackgroundColor = true,
    this.itemPadding = const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
    this.textStyle = const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
  }) : super(key: key);

  ///Key user for `Navigation`
  int navigationKey;

  /// Same List of Pages Passed to main.dart under `GetMaterial`
  List<GetPage> getPages;

  ///List of `Routes`
  ///Must be specified under `GetPages` List
  List<String> routes;

  ///List og `Bottom Bar` Items
  List<GetBottomBarItem> bottomBar;

  ///Default Transition
  Transition? defaultTransition;

  ///App Bar For Scaffold
  AppBar? appBar;

  /// Animation Curve of animation
  Curve curve;

  /// Duration of the animation
  Duration duration;

  /// Height of `BottomBar`
  num? height;

  /// Background Color of `BottomBar`
  Color? backgroundColor;

  /// Shows the background color of `BottomBarItem` when it is active
  /// and when this is set to true
  bool showActiveBackgroundColor;

  /// Padding between the background color and
  /// (`Row` that contains icon and title)
  EdgeInsets itemPadding;

  /// `TextStyle` of title
  TextStyle textStyle;

  ///`A Variable for Changing Index Values of BottomBar`
  var currentIndex = 0.obs;

  void changePage(int index) {
    try {
      if (currentIndex.value != index) {
        Get.offAllNamed(routes[index], id: navigationKey);
        currentIndex.value = index;
      }
    } catch (e) {
      Get.log(e.toString());
    }
  }

  Route? onGenerateRoute(RouteSettings settings) {
    ///`Check if List is Empty`
    if (routes.isEmpty || getPages.isEmpty) {
      return GetPageRoute(
        settings: settings,
        page: () => EmptyPage(),
      );
    }

    /// Check if we Have Route of That Page
    /// assigning first Route as Default
    /// in case if no route name matches

    for (var element in routes) {
      if (element == settings.name) {
        //   GetRouteMap routeMap = routeList[routes.indexOf(element)];

        ///Grab `Get Page` from list
        GetPage? getPage = getPages.firstWhereOrNull((e) => e.name == element);

        ///if `GetPage = Null` , Means Wrong Route Passed , Show Empty Page
        if (getPage == null) {
          return EmptyGetPageRoute(element, settings);
        }

        /// Else We can return Finally The `Correct` Page
        return GetRouteFromPage(getPage, settings);
        // return routeList[pages.indexOf(element)].getPageRoute;
      }

      ///if `settingName = / ` We can Pass the First Page
      if (settings.name == '/') {
        GetPage? getPage =
            getPages.firstWhereOrNull((e) => e.name == routes[0]);
        if (getPage == null) {
          return EmptyGetPageRoute(routes[0], settings);
        }
        return GetRouteFromPage(getPage, settings);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar,
        body: Navigator(
          key: Get.nestedKey(navigationKey),
          initialRoute: '/', // routes.isEmpty ? '/' : routes[0],
          onGenerateRoute: onGenerateRoute,
        ),
        bottomNavigationBar: Obx(
          () => BottomBar(
              selectedIndex: currentIndex.value,
              curve: curve,
              duration: duration,
              height: height,
              backgroundColor: backgroundColor,
              showActiveBackgroundColor: showActiveBackgroundColor,
              itemPadding: itemPadding,
              textStyle: textStyle,
              onTap: (index) {
                changePage(index);
              },
              items: bottomBar),
        ));
  }

  GetPageRoute EmptyGetPageRoute(name, settings) {
    return GetPageRoute(
      settings: settings,
      page: () => EmptyPage(
        msg: '$name not found',
      ),
    );
  }

  GetPageRoute GetRouteFromPage(GetPage getPage, settings) {
    return GetPageRoute(
      settings: settings,
      page: getPage.page,
      binding: getPage.binding,
      bindings: getPage.bindings,
      transition: defaultTransition ?? getPage.transition,
      title: getPage.title,
      gestureWidth: getPage.gestureWidth,
      maintainState: getPage.maintainState,
      curve: getPage.curve,
      alignment: getPage.alignment,
      opaque: getPage.opaque,
      transitionDuration:
          getPage.transitionDuration ?? Duration(milliseconds: 300),
      popGesture: getPage.popGesture,
      customTransition: getPage.customTransition,
      fullscreenDialog: getPage.fullscreenDialog,
      middlewares: getPage.middlewares,
      showCupertinoParallax: getPage.showCupertinoParallax,
    );
  }
}

class EmptyPage extends StatelessWidget {
  Color? color;
  String? msg;
  EmptyPage({Key? key, this.color, this.msg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color ?? Colors.white,
      child: Center(
        child: Text(msg ?? 'Empty Page'),
      ),
    );
  }
}
