import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:legendary_marvel_db/data/legendary_cards_json.dart';
import 'package:legendary_marvel_db/data/legendary_data_object.dart';
import 'package:legendary_marvel_db/data/legendary_decks_json.dart';
import 'package:legendary_marvel_db/models/legendary_models.dart';
import 'package:legendary_marvel_db/theme/colors.dart';
import 'package:legendary_marvel_db/theme/helper.dart';
import 'package:legendary_marvel_db/theme/padding.dart';
import 'package:legendary_marvel_db/widgets/main_app_bar.dart';

class LegendaryCardDetailPage extends StatefulWidget {
  final int cardId;
  const LegendaryCardDetailPage({
    Key? key,
    required this.cardId,
  }) : super(key: key);




  @override
  _LegendaryCardDetailPageState createState() => _LegendaryCardDetailPageState();
}

class _LegendaryCardDetailPageState extends State<LegendaryCardDetailPage> {

  int pageIndex = 0;
  late LegendaryCardObject legendaryCard;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    legendaryCard = legendaryCards.where((element) => element['cardId'] == widget.cardId).first();
    return Scaffold(
      appBar: PreferredSize(
          child:  getAppBar(),
          preferredSize: const Size.fromHeight(200)),
      body: getBody(),
      bottomNavigationBar: getFooter(),
    );
  }


  Widget getAppBar() {

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
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: getImage(legendaryCard.cardImage??''), fit: BoxFit.cover)),
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
                          legendaryCard.cardName??'',
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
                      const Icon(Icons.star, color: textWhite, size: 18),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        legendaryCard.cardType??'',
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: textWhite),
                      ),

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

  Widget getBody() {

    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding:  const EdgeInsets.all(mainPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  legendaryCard.cardName??'',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Image(image: getImage(legendaryCard.cardImage??''),
                    fit: BoxFit.cover),

              ],
            ),
            const SizedBox(
              height: 40,
            ),

          ],
        ),
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
