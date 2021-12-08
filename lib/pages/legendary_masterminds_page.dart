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

class LegendaryMastermindsPage extends StatefulWidget {
  const LegendaryMastermindsPage({Key? key, required this.deckTypeFilter}) : super(key: key);
final String deckTypeFilter;
  @override
  _LegendaryMastermindsPageState createState() =>
      _LegendaryMastermindsPageState();
}

class _LegendaryMastermindsPageState extends State<LegendaryMastermindsPage> {


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
        final response2 = await http
            .get(Uri.parse(APP_ROOT + item['jsonFile']));

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
    var size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      appBar: PreferredSize(
          child: getAppBar(),
          preferredSize: const Size.fromHeight(100)),
      body: getBody(),
    );
  }


  Widget getAppBar() {
    var size = MediaQuery
        .of(context)
        .size;
    return AppBar(
      backgroundColor: bgColor,
      flexibleSpace: Stack(
        children: [
          Container(
            height: getHeight(size.width, "21:9"),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "${APP_ROOT}images/marvel_legendary_deck_building_game.jpg"),
                    fit: BoxFit.cover)
            ),
          ),
        ],
      ),
    );
  }

  Widget getBody() {
  var legendarySets = ReadLegendarySetDetailsJsonData();
    var size = MediaQuery
        .of(context)
        .size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            widget.deckTypeFilter,
            style: const TextStyle(
                color: textWhite,
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: defaultPadding),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 5,
                child: Column(
                  children: [

                    const SizedBox(height: defaultPadding),
                    getDecks(),
                  ],
                ),
              ),
              if (!Responsive.isMobile(context))
                const SizedBox(width: defaultPadding),
              // On Mobile means if the screen is less than 850 we dont want to show it
              /*if (!Responsive.isMobile(context))
                Expanded(
                  flex: 2,
                  child: LegendarySetsVertAtom(list: legendarySets),
                ),*/
            ],
          ),
        ],
      ),
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
