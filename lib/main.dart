import 'package:flutter/material.dart';
import 'package:test1/service/dialog_service.dart';
import 'package:test1/service/navigation_service.dart';
import 'file:///C:/Users/GodExandro/Desktop/test1/lib/ui/views/home_view.dart';
import 'package:test1/ui/widgets/router.dart';

import 'locator.dart';
import 'managers/dialog_manager.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SSC',
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: Navigator(
          key: locator<DialogService>().dialogNavigationKey,
          onGenerateRoute: (settings) => MaterialPageRoute(
              builder: (context) => DialogManager(child: child)),
        ),
      ),
      navigatorKey: locator<NavigationService>().navigationKey,
      home: HomeView(),
      onGenerateRoute: generateRoute,
    );
  }
}
