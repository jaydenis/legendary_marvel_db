import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:legendary_marvel_db/models/legendary_set_model.dart';
import 'package:legendary_marvel_db/theme/colors.dart';
import 'package:legendary_marvel_db/widgets/card_image_slider.dart';
import '../constants.dart';
import 'legendary_card_detail_page.dart';

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
      //body: getBody(),
      body: CardImageSlider(legendaryDeck: widget.legendaryDeck
      ),
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
                    image: NetworkImage(
                        IMAGE_ROOT + widget.legendaryDeck.deckImage),
                    fit: BoxFit.cover)),
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
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        widget.legendaryDeck.deckType,
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



}
