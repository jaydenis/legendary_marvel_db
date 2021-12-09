//LegendarySetDetailPage
import 'dart:convert';

import 'package:admin/models/legendary_set_model.dart';
import 'package:admin/responsive.dart';
import 'package:admin/screens/main/components/side_menu.dart';
import 'package:flutter/material.dart';
import 'package:admin/constants.dart';
import 'package:admin/screens/legendary/components/legendary_header.dart';
import 'package:http/http.dart' as http;
import 'components/card_image_slider.dart';
import 'components/legendary_details.dart';

class LegendaryDeckDetailsScreen extends StatelessWidget {
  final Deck legendaryDeck;
  const LegendaryDeckDetailsScreen({
    Key? key, required this.legendaryDeck,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //key: context.read<MenuController>().scaffoldKey,
      drawer: SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: CardImageSlider(legendaryDeck: legendaryDeck),
            ),
          ],
        ),
      ),
    );
  }


}


