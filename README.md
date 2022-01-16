# GetXBottomBar

For using GetX Navigation With Bindings in BottomBar (This Package is only helpfull with [GetX](https://pub.dev/packages/get))

## Features

We can Navigate Between Pages From BottomBat And Get All Benefits of Get.toNamed()

## Getting started

Add Latest Version of This Package to your Pubspec.yaml and start using ,(Use With ['get_cli](https://pub.dev/packages/get_cli) for More Better Use)

## Usage

Added longer examples
to `/example` folder.

Add GetXBottomBarView Like this to Your Project
Make sure not to Pass Route of Same Page, Ex: (Don't pass Routes.Home from Home Page)
in routes list

We Require getpages List

```dart
 GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL, //We can Describe Routes Here ( Checkout GetCli)
      getPages: AppPages.routes, ///Take This List from here
    ),
```

We just have to pass those Routes and AppPages.routes list To GetXBottomBarView

```dart
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
      routes: [
          Routes.DASHBOARD,
           Routes.CART,
            Routes.PROFILE ],
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
```

Or if You Directly Want your Users To Show HomePage , You can Add it to GetMaterial Page like this

```dart
void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      getPages: AppPages.routes,
      home: GetxBottomBarView(
        getPages: AppPages.routes,
        routes: [Routes.DASHBOARD, Routes.PROFILE, Routes.USER],
        defaultTransition: Transition.noTransition,
        bottomBar: <GetBottomBarItem>[
          GetBottomBarItem(
              icon: Icon(Icons.dashboard),
              title: Text('data'),
              activeColor: Colors.red),
          GetBottomBarItem(
              icon: Icon(Icons.person),
              title: Text('data'),
              activeColor: Colors.red),
          GetBottomBarItem(
              icon: Icon(Icons.person_add),
              title: Text('data'),
              activeColor: Colors.red)
        ],
      ),
    ),
  );
}
```

## Additional information

This is Just The Initial Version feel free to Contribute or Report any Bug!
