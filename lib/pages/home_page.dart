import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:legendary_marvel_db/models/legendary_set_model.dart';
import 'package:legendary_marvel_db/theme/colors.dart';
import 'package:legendary_marvel_db/theme/helper.dart';
import 'package:legendary_marvel_db/widgets/legendary_sets_atom.dart';
import 'package:legendary_marvel_db/responsive.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  Future<List<LegendarySetDetails>> ReadJsonData() async {
    final response = await http
        .get(Uri.parse('${JSON_ROOT}json_data/legendary_sets.json'));

    if (response.statusCode == 200) {
      final list = json.decode(response.body) as List<dynamic>;
      return list.map((e) => LegendarySetDetails.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load Legendary Set');
    }
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          child:  getAppBar(),
          preferredSize: const Size.fromHeight(100)),
      body: getBody(widget.ReadJsonData()),
    );

  }

  Widget getAppBar() {
    var size = MediaQuery.of(context).size;
    return AppBar(
      backgroundColor: bgColor,
      flexibleSpace: Stack(
        children: [
          Container(
            height: getHeight(size.width, "21:9"),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage("${IMAGE_ROOT}images/marvel_legendary_deck_building_game.jpg"),
                    fit: BoxFit.cover)
            ),
          ),


        ],
      ),
    );
  }

  Widget getBody( final Future<List<LegendarySetDetails>> list) {

    var size = MediaQuery
        .of(context)
        .size;
    return SingleChildScrollView(
      padding: EdgeInsets.all(defaultPadding),
      child: Column(
        children: [
          //const Header(),
          SizedBox(height: defaultPadding),
          //HomePageCover(size: size),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 5,
                child: Column(
                  children: [
                      LegendarySetsHorzAtom(list: list),
                    SizedBox(height: defaultPadding),
    /* if (!Responsive.isMobile(context))
                      SizedBox(height: defaultPadding),
                    if (!Responsive.isMobile(context))
                      LegendarySetsNewAtom(list: list),

                    if (Responsive.isMobile(context))
                      SizedBox(height: defaultPadding),
                    if (Responsive.isMobile(context))
                      LegendarySetsVertAtom(list: list),*/
                  ],
                ),
              ),
              if (!Responsive.isMobile(context))
                SizedBox(width: defaultPadding),
              // On Mobile means if the screen is less than 850 we dont want to show it
              if (!Responsive.isMobile(context))
                Expanded(
                  flex: 2,
                  child: LegendarySetsVertAtom(list: list),
                ),
            ],
          ),

         // LegendarySetsNewAtom(recommendedSets: legendarySets),
          //LegendarySetsAllAtom(legendarySetsList: legendarySets),
        ],
      ),
    );
  }
}

