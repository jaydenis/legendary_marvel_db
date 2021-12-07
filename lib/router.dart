import 'package:flutter/material.dart';
import 'package:legendary_marvel_db/pages/legendary_masterminds_page.dart';
import 'package:legendary_marvel_db/pages/root_app.dart';

Route<dynamic> generateRoute(RouteSettings setting) {
  final Map<String, dynamic> args = new Map<String, dynamic>();

  switch (setting.name) {
    case '/root_app':
      return MaterialPageRoute(builder: (context) => RootApp());
    case '/masterminds':
      return MaterialPageRoute(builder: (context) => LegendaryMastermindsPage());
    default:
      return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(),
          ));
  }
}
