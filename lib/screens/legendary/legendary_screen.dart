import 'dart:convert';

import 'package:admin/models/legendary_set_model.dart';
import 'package:admin/responsive.dart';
import 'package:flutter/material.dart';

import 'package:admin/constants.dart';

import 'package:admin/screens/legendary/components/legendary_header.dart';

import 'package:http/http.dart' as http;

import 'components/legendary_details.dart';
import 'components/legendary_details_info_card.dart';
import 'components/legendary_sets_new.dart';
import 'components/legendary_sets_new.dart';
import 'components/legendary_sets_table.dart';

class LegendaryScreen extends StatelessWidget {

  Future<List<LegendarySetDetails>> ReadJsonData() async {
    final response = await http
        .get(Uri.parse(JSON_ROOT));

    if (response.statusCode == 200) {
      final list = json.decode(response.body) as List<dynamic>;
      return list.map((e) => LegendarySetDetails.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load Legendary Set');
    }
  }

  @override
  Widget build(BuildContext context) {
    var legendarySets = ReadJsonData();
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            LegendaryHeader(),
            SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      NewLegendarySets(legendarySets: legendarySets),
                      SizedBox(height: defaultPadding),
                      LegendarySetsTable(legendarySets: legendarySets),
                      if (Responsive.isMobile(context))
                        SizedBox(height: defaultPadding),
                     // if (Responsive.isMobile(context)) LegendaryDetails(),
                    ],
                  ),
                ),
                if (!Responsive.isMobile(context))
                  SizedBox(width: defaultPadding),
                // On Mobile means if the screen is less than 850 we dont want to show it
                if (!Responsive.isMobile(context))
                  Expanded(
                    flex: 2,
                    child: LegendaryDetails(),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
