import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:legendary_marvel_db/models/legendary_models.dart';
import 'package:legendary_marvel_db/theme/colors.dart';
import 'package:legendary_marvel_db/widgets/home_atoms.dart';
import 'package:legendary_marvel_db/widgets/legendary_sets_atom.dart';


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
          LegendarySetsHorzAtom(),
         // LegendarySetsNewAtom(recommendedSets: legendarySets),
          //LegendarySetsAllAtom(legendarySetsList: legendarySets),
        ],
      ),
    );
  }
}

