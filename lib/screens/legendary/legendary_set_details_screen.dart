//LegendarySetDetailPage
import 'dart:convert';

import 'package:admin/controllers/MenuController.dart';
import 'package:admin/models/legendary_set_model.dart';
import 'package:admin/responsive.dart';
import 'package:admin/screens/main/components/side_menu.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:admin/constants.dart';

import 'package:admin/screens/legendary/components/legendary_header.dart';

import 'package:http/http.dart' as http;
import 'package:provider/src/provider.dart';

import 'components/legendary_deck_info_card.dart';
import 'components/legendary_details.dart';
import 'legendary_deck_details_screen.dart';

class LegendarySetDetailsScreen extends StatelessWidget {
  final LegendarySetDetails legendarySet;
  const LegendarySetDetailsScreen({
    Key? key, required this.legendarySet,
  }) : super(key: key);

  Future<LegendarySetModel> ReadJsonData(String jsonFile) async {
    final response = await http
        .get(Uri.parse(APP_ROOT+jsonFile));

    if (response.statusCode == 200) {

      Map<String, dynamic> setData = jsonDecode(response.body) ;
      print(setData);
      return LegendarySetModel.fromJson(setData);
    } else {
      throw Exception('Failed to load Legendary Set');
    }
  }

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
              child: getBody(context),
            ),
          ],
        ),
      ),
    );
  }
    
  Widget getBody(BuildContext context){
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
                      getDecks(),
                      SizedBox(height: defaultPadding),
                      //getDecks(),
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
                    child: Container(
                      padding: EdgeInsets.all(defaultPadding),
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                            child: CachedNetworkImage(
                              placeholder: (context, url) => const CircularProgressIndicator(),
                              imageUrl:APP_ROOT + legendarySet.boxImage,
                              fit: BoxFit.cover,
                            ),
                          )
                        ],
                      ),
                  ),
                      ),
                      ],
            )
          ],
        ),
      ),
    );
  }

  Widget getDecks() {
    return FutureBuilder(
      future: ReadJsonData(legendarySet.jsonFile),
      builder: (context, data) {
        if (data.hasError) {
          return Center(child: Text("${data.error}"));
        } else if (data.hasData) {
          var items = data.data as LegendarySetModel;

          var heroesList = items.decks.where((element) =>
          element.deckType == 'Heroes').toList();

          var mastermindsList = items.decks.where((element) =>
          element.deckType == 'Masterminds').toList();

          var villainsList = items.decks.where((element) =>
          element.deckType == 'Villains').toList();

          var henchmenList = items.decks.where((element) =>
          element.deckType == 'Henchmen').toList();

          var schemeList = items.decks.where((element) =>
          element.deckType == 'Schemes').toList();

          var generalList = items.decks.where((element) =>
          element.deckType == 'General').toList();

          return Column(
              children: [
                DeckExpandableCard(legendaryDecks: heroesList),
                DeckExpandableCard(legendaryDecks: mastermindsList),
                DeckExpandableCard(legendaryDecks: villainsList),

                if (henchmenList.isNotEmpty)
                 DeckExpandableCard(legendaryDecks: henchmenList),

                if (schemeList.isNotEmpty)
                  DeckExpandableCard(legendaryDecks: schemeList),

                if (generalList.isNotEmpty)
                  DeckExpandableCard(legendaryDecks: generalList),
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

class DeckExpandableCard extends StatelessWidget{
  const DeckExpandableCard({
    Key? key,
    required this.legendaryDecks
  }) : super(key: key);
  final List<Deck> legendaryDecks;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      elevation: 2,
      margin: const EdgeInsets.all(12.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ExpansionTile(
          backgroundColor: secondaryColor,
          title: Text(legendaryDecks[0].deckType),
          trailing: const SizedBox(),
          children: <Widget>[
            Responsive(
              mobile: DeckInfoCardGridView(legendaryDecks: legendaryDecks,
                crossAxisCount: size.width < 650 ? 2 : 4,
                childAspectRatio: size.width < 650 ? 1.3 : 1,
              ),
              tablet: DeckInfoCardGridView(
                  legendaryDecks: legendaryDecks),
              desktop: DeckInfoCardGridView(
                legendaryDecks: legendaryDecks,
                childAspectRatio: size.width < 1400 ? 1.1 : 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class DeckInfoCardGridView extends StatelessWidget {
  const DeckInfoCardGridView({
    Key? key,
    required this.legendaryDecks,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
  }) : super(key: key);
  final List<Deck> legendaryDecks;
  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: legendaryDecks.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) => Container(
        padding:  EdgeInsets.all(defaultPadding),
        decoration: const BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          LegendaryDeckDetailsScreen(legendaryDeck: legendaryDecks[index],
                          )
                  )
              );
            },
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: CachedNetworkImage(
                placeholder: (context, url) => const CircularProgressIndicator(),
                imageUrl:APP_ROOT + legendaryDecks[index].deckImage,
                fit: BoxFit.cover,
              ),
            )
        ),
      ),
    );
  }
}

