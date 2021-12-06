import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:legendary_marvel_db/models/legendary_set_model.dart';
import 'package:legendary_marvel_db/theme/colors.dart';
import 'package:legendary_marvel_db/theme/helper.dart';
import 'package:legendary_marvel_db/theme/padding.dart';
import 'package:legendary_marvel_db/widgets/header.dart';
import 'package:legendary_marvel_db/widgets/legendary_deck_card.dart';
import 'package:legendary_marvel_db/widgets/legendary_decktypes_atom.dart';
import 'package:legendary_marvel_db/widgets/legendary_sets_atom.dart';
import '../constants.dart';
import '../responsive.dart';
import 'legendary_deck_detail_page.dart';
import 'package:http/http.dart' as http;

class LegendarySetDetailPage extends StatefulWidget {
  final LegendarySetDetails legendarySet;
  const LegendarySetDetailPage({
    Key? key,
    required this.legendarySet
  }) : super(key: key);


  @override
  _LegendarySetDetailPageState createState() => _LegendarySetDetailPageState();
}

class _LegendarySetDetailPageState extends State<LegendarySetDetailPage> {
  int pageIndex = 0;

  Future<LegendarySetModel> ReadJsonData(String jsonFile) async {
    final response = await http
        .get(Uri.parse('https://raw.githubusercontent.com/jaydenis/legendary_marvel_cards/master/'+jsonFile));

    if (response.statusCode == 200) {
      final data = json.decode(response.body) as dynamic;
      Map<String, dynamic> setData = jsonDecode(response.body) ;
      return LegendarySetModel.fromJson(setData) as LegendarySetModel;
    } else {
      throw Exception('Failed to load Legendary Set');
    }
  }

  Future<List<LegendarySetDetails>> ReadLegendarySetsJsonData() async {
    final response = await http
        .get(Uri.parse('https://raw.githubusercontent.com/jaydenis/legendary_marvel_cards/master/json_data/legendary_sets.json'));

    if (response.statusCode == 200) {
      final list = json.decode(response.body) as List<dynamic>;
      return list.map((e) => LegendarySetDetails.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load Legendary Set');
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          child:  getAppBar(),
        preferredSize: const Size.fromHeight(100)),
      body: getBody(ReadLegendarySetsJsonData()),
      //bottomNavigationBar: getFooter(),
    );
  }


  Widget getAppBar() {
    var size = MediaQuery.of(context).size;
    return AppBar(
      automaticallyImplyLeading: false,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(
            "assets/icons/arrow_back_icon.svg",
            color: textWhite,
          )),
      actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.info))],
      backgroundColor: primary,
      flexibleSpace: Stack(
        children: [
          Container(
            height: getHeight(size.width, "21:9"),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(IMAGE_ROOT+widget.legendarySet.boxImage),
                    fit: BoxFit.cover)
            ),
          ),

          Container(
            decoration: BoxDecoration(color: textBlack.withOpacity(0.5)),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: Padding(
                        padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: Text(
                          widget.legendarySet.setName,
                          style: const TextStyle(
                              color: textWhite,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.add_moderator_sharp, color: textWhite, size: 18),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Year: "+widget.legendarySet.yearReleased.toString(),
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: textWhite),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "# of Cards: "+ widget.legendarySet.numberOfCards.toString(),
                        style: const TextStyle(fontSize: 15, color: textWhite),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget getBody( final Future<List<LegendarySetDetails>> list) {
    var size = MediaQuery
        .of(context)
        .size;
    return SingleChildScrollView(
      child: Column(
        children: [
          //const Header(),
          const SizedBox(height: defaultPadding),
          //HomePageCover(size: size),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 5,
                child: Column(
                  children: [

                    const SizedBox(height: defaultPadding),
                    decks(),
                    // LegendaryHeroes(),
                   // if (Responsive.isMobile(context))
                   //   SizedBox(height: defaultPadding),
                  //  if (Responsive.isMobile(context)) LegendarySetsVertAtom(),

                  ],
                ),
              ),
              if (!Responsive.isMobile(context))
                const SizedBox(width: defaultPadding),
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

Widget decks() {
  var size = MediaQuery
      .of(context)
      .size;
  return FutureBuilder(
    future: ReadJsonData(widget.legendarySet.jsonFile),
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
      itemBuilder: (context, index) => LegendaryDeckCardSmall(legendaryDeck: legendaryDecks[index]),
    );
  }
}
