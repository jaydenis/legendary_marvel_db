import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:legendary_marvel_db/models/legendary_set_model.dart';
import 'package:legendary_marvel_db/theme/colors.dart';
import 'package:legendary_marvel_db/widgets/card_image_slider.dart';
import '../constants.dart';

final borderRadius = BorderRadius.circular(20.0);

class LegendaryDeckDetailPage extends StatefulWidget {
  final Deck legendaryDeck;
  const LegendaryDeckDetailPage({
    Key? key,
    required this.legendaryDeck,
  }) : super(key: key);


  @override
  _LegendaryDeckDetailPageState createState() => _LegendaryDeckDetailPageState();
}

class _LegendaryDeckDetailPageState extends State<LegendaryDeckDetailPage> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          child:  getAppBar(),
          preferredSize: const Size.fromHeight(100)),
      body: getBody(),
      //bottomNavigationBar: getFooter(),
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
                    image: NetworkImage(IMAGE_ROOT+widget.legendaryDeck.deckImage), fit: BoxFit.cover)),
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
                          widget.legendaryDeck.deckName,
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
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        widget.legendaryDeck.deckType,
                        style: TextStyle(
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

    var size = MediaQuery
        .of(context)
        .size;
    return SizedBox(
        child: CardImageSlider(legendaryDeck: widget.legendaryDeck
        )
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
