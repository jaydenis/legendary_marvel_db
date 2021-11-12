import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:legendary_marvel_db/pages/home_page.dart';
import 'package:legendary_marvel_db/pages/legendary_sets_page.dart';
import 'package:legendary_marvel_db/services/services.dart';
import 'package:legendary_marvel_db/utils.dart';

void main() {
  runApp(LegendaryApp());
}

class LegendaryApp extends StatelessWidget {
  static const supabaseGreen = Color.fromRGBO(101, 217, 165, 1.0);

  const LegendaryApp();

  @override
  Widget build(BuildContext context) {
    return Services(
      child: MaterialApp(
        title: 'Legendary Marvel',
        theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: toMaterialColor(supabaseGreen),
        ),
        home: Builder(
          builder: (context) {
            return FutureBuilder<bool>(
              future: Services.of(context).authService.recoverSession(),
              builder: (context, snapshot) {
                final sessionRecovered = snapshot.data ?? false;
                return sessionRecovered ? LegendarySetsPage() : HomePage();
              },
            );
          },
        ),
      ),
    );
  }
}