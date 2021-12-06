import 'package:flutter/material.dart';
import 'package:legendary_marvel_db/models/legendary_set_model.dart';

import '../constants.dart';

class LegendaryCardDetailPage extends StatelessWidget {

  final LegendaryCard legendaryCard;
  final int index;
  const LegendaryCardDetailPage({Key? key, required this.legendaryCard, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Hero(
              tag: 'logo$index',
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  image: DecorationImage(
                    image: NetworkImage(IMAGE_ROOT+legendaryCard.cardImage),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 260,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      /*Text(
                        legendaryCard.cardName,
                        style: const TextStyle(
                          color: Colors.lightBlueAccent,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),*/
                      Text(
                        legendaryCard.cardType,
                        style: const TextStyle(
                          fontSize: 10,
                        ),
                      ),

                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        padding: EdgeInsets.symmetric(vertical: 15),
                        color: Colors.lightBlueAccent,
                        child: const Text(
                          'Back',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),

                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
