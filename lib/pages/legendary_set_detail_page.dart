import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:legendary_marvel_db/data/legendary_data_object.dart';
import 'package:legendary_marvel_db/data/legendary_decks_json.dart';
import 'package:legendary_marvel_db/models/legendary_models.dart';
import 'package:legendary_marvel_db/models/legendary_set_model.dart';
import 'package:legendary_marvel_db/theme/colors.dart';
import 'package:legendary_marvel_db/theme/fontsizes.dart';
import 'package:legendary_marvel_db/theme/helper.dart';
import 'package:legendary_marvel_db/theme/padding.dart';
import 'package:legendary_marvel_db/widgets/legendary_deck_card.dart';
import 'package:legendary_marvel_db/widgets/main_app_bar.dart';

import '../constants.dart';
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

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          child:  getAppBar(),
        preferredSize: const Size.fromHeight(100)),
      body: FutureBuilder(
        future: ReadJsonData(widget.legendarySet.jsonFile),
        builder: (context, data) {
          if (data.hasError) {
            return Center(child: Text("${data.error}"));
          } else if (data.hasData) {
            var items = data.data as LegendarySetModel;

            return Container(
              width: double.infinity,
              decoration: const BoxDecoration(color: light),
              child: Padding(
                padding: const EdgeInsets.all(mainPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: List.generate(items.decks.length, (index) {
                        var legendaryDeck = items.decks[index];
                        return Padding(
                          padding:
                          const EdgeInsets.only(bottom: bottomMainPadding),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        LegendaryDeckDetailPage(legendaryDeck: legendaryDeck,)
                                ),
                              );
                            },
                            child: LegendaryDeckCard(
                                width: size.width - (mainPadding * 3),
                                legendaryDeck: legendaryDeck),
                          ),
                        );
                      }),
                    )
                  ],
                ),
              ),
            );

          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
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



  Widget getFooter() {
    List iconItems = [
      "assets/icons/home_icon.svg",
      "assets/icons/search_icon.svg",
    ];
    List textItems = ["Home", "Search"];
    List navItems = ["/", "/search"];
    return Container(
      width: double.infinity,
      height: 90,
      decoration: BoxDecoration(
          color: textWhite,
          border: Border(
              top: BorderSide(width: 2, color: textBlack.withOpacity(0.06)))),
      child: Padding(
        padding:
        const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(iconItems.length, (index) {
            return InkWell(
              onTap: () {
                setState(() {
                  Navigator.pushNamed(context, navItems[index]);
                });
              },
              child: Column(
                children: [
                  SvgPicture.asset(
                    iconItems[index],
                    width: 22,
                    color: pageIndex == index ? primary : textBlack,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    textItems[index],
                    style: TextStyle(
                        fontSize: 10,
                        color: pageIndex == index ? primary : textBlack),
                  )
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

}
