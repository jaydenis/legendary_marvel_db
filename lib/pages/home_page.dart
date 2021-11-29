import 'package:flutter/material.dart';
import 'package:legendary_marvel_db/data/legendary_deck_types_json.dart';
import 'package:legendary_marvel_db/data/legendary_sets_json.dart';
import 'package:legendary_marvel_db/theme/colors.dart';
import 'package:legendary_marvel_db/theme/fontsizes.dart';
import 'package:legendary_marvel_db/theme/helper.dart';
import 'package:legendary_marvel_db/theme/padding.dart';
import 'package:legendary_marvel_db/widgets/home_atoms.dart';
import 'package:legendary_marvel_db/widgets/legendary_sets_atom.dart';
import 'package:legendary_marvel_db/widgets/main_app_bar.dart';
import 'package:legendary_marvel_db/widgets/legendary_set_card.dart';

import 'package:legendary_marvel_db/pages/legendary_set_detail_page.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      backgroundColor: textWhite,
      // appBar: PreferredSize(
      //     child: MainAppBar(size: size), preferredSize: const Size.fromHeight(40)),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery
        .of(context)
        .size;
    return SingleChildScrollView(
      child: Column(
        children: [
          HomePageCover(size: size),
          const LegendarySetsHorzAtom(),
          const LegendarySetsNewAtom(),
          const LegendarySetsAllAtom(),
        ],
      ),
    );
  }
}

