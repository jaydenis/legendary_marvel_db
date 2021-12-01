

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:legendary_marvel_db/models/legendary_set_model.dart';
import 'package:legendary_marvel_db/pages/legendary_set_detail_page.dart';
import 'package:legendary_marvel_db/theme/colors.dart';
import 'package:legendary_marvel_db/theme/padding.dart';

import '../constants.dart';
import '../responsive.dart';
import 'legendary_set_card.dart';
import 'package:http/http.dart' as http;

class LegendaryDeckAtom extends StatelessWidget {


  Future<List<LegendarySetDetails>?> ReadJsonData() async {
    final response = await http
        .get(Uri.parse('https://raw.githubusercontent.com/jaydenis/legendary_marvel_cards/master/json_data/legendary_sets.json'));

    if (response.statusCode == 200) {
      final list = json.decode(response.body) as List<dynamic>;
      return list.map((e) => LegendarySetDetails.fromJson(e)).where((element) => element.yearReleased >= 2019).toList();
    } else {
      throw Exception('Failed to load Legendary Set');
    }
  }

  LegendaryDeckAtom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return FutureBuilder(
      future: ReadJsonData(),
      builder: (context, data) {
        if (data.hasError) {
          return Center(child: Text("${data.error}"));
        } else if (data.hasData) {
          var items = data.data as List<LegendarySetDetails>;
          return Column(
              children: [
                SizedBox(height: defaultPadding),
                Responsive(
                  mobile: SetInfoCardGridView(legendarySets: items,
                    crossAxisCount: size.width < 650 ? 2 : 4,
                    childAspectRatio: size.width < 650 ? 1.3 : 1,
                  ),
                  tablet: SetInfoCardGridView(legendarySets: items),
                  desktop: SetInfoCardGridView(legendarySets: items,
                    childAspectRatio: size.width < 1400 ? 1.1 : 1.4,
                  ),
                ),
              ]
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }


}

class SetInfoCardGridView extends StatelessWidget {
  const SetInfoCardGridView({
    Key? key,
    required this.legendarySets,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
  }) : super(key: key);
  final List<LegendarySetDetails> legendarySets;
  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: legendarySets.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) => LegendarySetCardSmall(legendarySetFuture: legendarySets[index]),
    );
  }
}