import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:legendary_marvel_db/models/legendary_set_model.dart';
import 'package:http/http.dart' as http;
import 'package:legendary_marvel_db/theme/colors.dart';
import 'package:legendary_marvel_db/theme/helper.dart';
import 'package:legendary_marvel_db/widgets/legendary_deck_card.dart';
import 'package:legendary_marvel_db/widgets/legendary_sets_atom.dart';
import '../constants.dart';
import '../responsive.dart';
import 'package:legendary_marvel_db/theme/colors.dart';
import 'package:legendary_marvel_db/widgets/menu_controller.dart';
import 'package:legendary_marvel_db/widgets/side_menu.dart';
import 'package:provider/provider.dart';

class LegendaryMastermindsPage extends StatefulWidget {
  const LegendaryMastermindsPage({Key? key}) : super(key: key);

  @override
  _LegendaryMastermindsPageState createState() =>
      _LegendaryMastermindsPageState();
}

class _LegendaryMastermindsPageState extends State<LegendaryMastermindsPage> {

  Future<List<LegendarySetModel>> ReadLegendarySetsJsonData() async {
    final response = await http
        .get(Uri.parse('${JSON_ROOT}json_data/legendary_sets.json'));

    if (response.statusCode == 200) {
      final list = json.decode(response.body) as List<dynamic>;
      list.map((e) => LegendarySetDetails.fromJson(e)).toList();

      List<LegendarySetModel> models =[];
      for(var item in list){

        final response2 = await http
            .get(Uri.parse(JSON_ROOT+item['jsonFile']));

        if (response2.statusCode == 200) {
          final data2 = json.decode(response2.body) as dynamic;
          Map<String, dynamic> setData2 = jsonDecode(response2.body) ;
          models.add(LegendarySetModel.fromJson(setData2));
        } else {
        //  throw Exception('Failed to load Legendary Set');
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
        drawer: SideMenu(),
        body: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // We want this side menu only for large screen
              if (Responsive.isDesktop(context))
                const Expanded(
                  // default flex = 1
                  // and it takes 1/6 part of the screen
                  child: SideMenu(),
                ),
              Expanded(
                // It takes 5/6 part of the screen
                flex: 5,
                child:
                getBody(ReadLegendarySetsJsonData()),
              ),
            ],
          ),
        ),
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

  Widget getBody( final Future<List<LegendarySetModel>> list) {
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
                    getMasterminds(list),
                  ],
                ),
              ),
              if (!Responsive.isMobile(context))
                const SizedBox(width: defaultPadding),
              // On Mobile means if the screen is less than 850 we dont want to show it
             /* if (!Responsive.isMobile(context))
                Expanded(
                  flex: 2,
                  child: LegendarySetsVertAtom(list: list),
                ),*/
            ],
          ),

        ],
      ),
    );
  }

  Widget getMasterminds(final Future<List<LegendarySetModel>> list) {
    var size = MediaQuery
        .of(context)
        .size;
    return FutureBuilder(
      future: list,
      builder: (context, data) {
        if (data.hasError) {
          return Center(child: Text("${data.error}"));
        } else if (data.hasData) {
          var items = data.data as List<LegendarySetModel>;
List<Deck> mastermindsList = [];
for(var item in items) {
  var decks = item.decks.where((element) =>  element.deckType == 'Masterminds').toList();
  for(var deck in decks) {
    mastermindsList.add(deck);
  }
}
          return Column(
              children:
                <Widget>[
                  Responsive(
                    mobile: DeckInfoCardGridView(legendaryDecks: mastermindsList,
                      crossAxisCount: size.width < 650 ? 2 : 4,
                      childAspectRatio: size.width < 650 ? 1.3 : 1,
                    ),
                    tablet: DeckInfoCardGridView(
                        legendaryDecks: mastermindsList),
                    desktop: DeckInfoCardGridView(
                      legendaryDecks: mastermindsList,
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
