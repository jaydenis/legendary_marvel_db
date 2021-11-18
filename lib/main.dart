// @dart=2.9

import 'package:flutter/material.dart';
import 'package:legendary_marvel_db/pages/home_page.dart';
import 'package:legendary_marvel_db/pages/login_page.dart';
import 'package:legendary_marvel_db/pages/root_app.dart';
import 'router.dart' as router;

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    onGenerateRoute: router.generateRoute,
    home: RootApp(),
  ));
}
