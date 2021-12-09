//LegendarySetDetailPage
import 'dart:convert';

import 'package:admin/controllers/MenuController.dart';
import 'package:admin/models/legendary_set_model.dart';
import 'package:admin/responsive.dart';
import 'package:admin/screens/main/components/side_menu.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:admin/constants.dart';
import 'package:http/http.dart' as http;
import 'legendary_deck_details_screen.dart';

class LegendaryDecksByTypeScreen extends StatefulWidget {
  final String deckTypeFilter;
  const LegendaryDecksByTypeScreen({
    Key? key, required this.deckTypeFilter,
  }) : super(key: key);

  @override
  _LegendaryDecksByTypeScreenState createState() =>
      _LegendaryDecksByTypeScreenState();
}

class _LegendaryDecksByTypeScreenState extends State<LegendaryDecksByTypeScreen> {


  Future<List<LegendarySetDetails>> ReadLegendarySetDetailsJsonData() async {
    final response = await http
        .get(Uri.parse(JSON_ROOT));

    if (response.statusCode == 200) {
      final list = json.decode(response.body) as List<dynamic>;
      return list.map((e) => LegendarySetDetails.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load Legendary Set');
    }
  }

  Future<List<LegendarySetModel>> ReadLegendarySetsJsonData() async {
    final response = await http
        .get(Uri.parse(JSON_ROOT));

    if (response.statusCode == 200) {
      final list = json.decode(response.body) as List<dynamic>;
      list.map((e) => LegendarySetDetails.fromJson(e)).toList();

      List<LegendarySetModel> models = [];

      for (var item in list) {
        var jsonUrl =APP_ROOT + item['jsonFile'];
      final response2 = await http
            .get(Uri.parse(jsonUrl));

        if (response2.statusCode == 200) {
          final data2 = json.decode(response2.body) as dynamic;
          Map<String, dynamic> setData2 = jsonDecode(response2.body);
          models.add(LegendarySetModel.fromJson(setData2));
        }
      }
      return models;
    } else {
      throw Exception('Failed to load Legendary Set');
    }
  }


int pageIndex = 0;

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
    var size = MediaQuery
        .of(context)
        .size;
    var legendarySets = ReadLegendarySetDetailsJsonData();
    return FutureBuilder(
      future: ReadLegendarySetsJsonData(),
      builder: (context, data) {
        if (data.hasError) {
          return Center(child: Text("${data.error}"));
        } else if (data.hasData) {
          var items = data.data as List<LegendarySetModel>;
          List<Deck> deckList = [];
          for (var item in items) {
            var decks = item.decks.where((element) =>
            element.deckType == widget.deckTypeFilter).toList();
            for (var deck in decks) {
              deckList.add(deck);
            }
          }
          return Column(
            children:
            <Widget>[
              Responsive(
                mobile: DeckInfoCardGridView(legendaryDecks: deckList,
                  crossAxisCount: size.width < 650 ? 2 : 4,
                  childAspectRatio: size.width < 650 ? 1.3 : 1,
                ),
                tablet: DeckInfoCardGridView(
                    legendaryDecks: deckList),
                desktop: DeckInfoCardGridView(
                  legendaryDecks: deckList,
                  childAspectRatio: size.width < 1400 ? 1.1 : 1.4,
                ),
              ),

            ],
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget getDecks() {
    var size = MediaQuery
        .of(context)
        .size;
    return FutureBuilder(
      future: ReadLegendarySetsJsonData(),
      builder: (context, data) {
        if (data.hasError) {
          return Center(child: Text("${data.error}"));
        } else if (data.hasData) {
          var items = data.data as List<LegendarySetModel>;
          List<Deck> deckList = [];
          for (var item in items) {
            var decks = item.decks.where((element) =>
            element.deckType == widget.deckTypeFilter).toList();
            for (var deck in decks) {
              deckList.add(deck);
            }
          }
          return Column(
            children:
            <Widget>[
              Responsive(
                mobile: DeckInfoCardGridView(legendaryDecks: deckList,
                  crossAxisCount: size.width < 650 ? 2 : 4,
                  childAspectRatio: size.width < 650 ? 1.3 : 1,
                ),
                tablet: DeckInfoCardGridView(
                    legendaryDecks: deckList),
                desktop: DeckInfoCardGridView(
                  legendaryDecks: deckList,
                  childAspectRatio: size.width < 1400 ? 1.1 : 1.4,
                ),
              ),

            ],
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

