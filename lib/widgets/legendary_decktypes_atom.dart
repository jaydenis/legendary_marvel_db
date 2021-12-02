import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:legendary_marvel_db/data/legendary_deck_types_json.dart';
import 'package:legendary_marvel_db/models/legendary_set_model.dart';
import 'package:legendary_marvel_db/pages/legendary_set_detail_page.dart';
import 'package:legendary_marvel_db/theme/colors.dart';
import 'package:legendary_marvel_db/theme/fontsizes.dart';
import 'package:legendary_marvel_db/theme/padding.dart';

import '../constants.dart';
import '../responsive.dart';
import 'legendary_set_card.dart';
import 'package:http/http.dart' as http;

class LegendaryDeckTypesAtom extends StatelessWidget {
  Future<List<LegendarySetDetails>> ReadJsonData() async {
    final response = await http
        .get(Uri.parse(
        'https://raw.githubusercontent.com/jaydenis/legendary_marvel_cards/master/json_data/legendary_sets.json'));

    if (response.statusCode == 200) {
      final list = json.decode(response.body) as List<dynamic>;
      return list.map((e) => LegendarySetDetails.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load Legendary Set');
    }
  }

  LegendaryDeckTypesAtom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var items = legendaryDeckTypes.toList();
    var size = MediaQuery
        .of(context)
        .size;
    return
      Container(
        width: double.infinity,
        decoration: const BoxDecoration(color: secondaryColor),
        child: Padding(
          padding: const EdgeInsets.all(mainPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: List.generate(items.length, (index) {
                  var legendaryDeckType = items[index];
                  return Padding(
                    padding:
                    const EdgeInsets.only(bottom: bottomMainPadding),
                    child: GestureDetector(
                      onTap: () {
                        /*Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    LegendarySetDetailPage(
                                      legendarySet: legendarySet,
                                    )
                            )
                        );*/
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: textWhite,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                legendaryDeckType['deckType'],
                                overflow: TextOverflow.ellipsis,
textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: textBlack,
                                    fontSize: titleFontSize,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              )
            ],
          ),
        ),
      );
  }
}
