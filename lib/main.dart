// @dart=2.9

import 'package:flutter/material.dart';
import 'package:legendary_marvel_db/pages/root_app.dart';
import 'package:legendary_marvel_db/widgets/menu_controller.dart';
import 'constants.dart';
import 'package:legendary_marvel_db/theme/colors.dart';
import 'router.dart' as router;
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Admin Panel',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => MenuController(),
          ),
        ],
        child: RootApp(),
      ),
    );
  }
}


/*void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    onGenerateRoute: router.generateRoute,
    home: RootApp(),
  ));
}*/
