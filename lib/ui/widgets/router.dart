import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test1/constants/route_names.dart';
import 'file:///C:/Users/GodExandro/Desktop/test1/lib/ui/views/home_view.dart';
import 'package:test1/ui/views/created_documents_view.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: HomeView(),
      );
    case CreatedDocumentsViewRoute:
      var args = settings.arguments;
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: CreatedDocumentsView(documents: args),
      );

    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(child: Text('No route defined ')),
              ));
  }
}

PageRoute _getPageRoute({String routeName, Widget viewToShow}) {
  return MaterialPageRoute(
      settings: RouteSettings(
        name: routeName,
      ),
      builder: (_) => viewToShow);
}
