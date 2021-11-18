import 'package:badges/badges.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:legendary_marvel_db/theme/colors.dart';
import 'package:legendary_marvel_db/theme/fontsizes.dart';
import 'package:legendary_marvel_db/theme/helper.dart';
import 'package:legendary_marvel_db/theme/padding.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0.5,
        brightness: Brightness.light,
        backgroundColor: textWhite,
        automaticallyImplyLeading: false,
        primary: false,
        excludeHeaderSemantics: true,
        flexibleSpace: SafeArea(
          child: Container(
            padding:
            const EdgeInsets.only(left: leftMainPadding, right: rightMainPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            style: TextStyle(fontSize: 30, color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Legendary Marvel DB ',
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pushNamed(context, "/");
                                    },
                            style: TextStyle(
                                color: textBlack,
                                fontSize: titleFontSize,
                                fontWeight: FontWeight.bold),
                            ),
                            ],
                          ),
                        ),

                        const SizedBox(
                          width: 10,

                        ),
                        getSvgIcon("arrow_right_icon.svg"),
                      ],
                    ),
                    Row(
                      children: [

                        IconButton(
                            onPressed: () {
                              Navigator.pushNamed(context, "/search");
                            },
                            icon:  const Icon(
                                EvilIcons.search,
                                size: 30,
                              ),
                            )
                      ],
                    )
                  ],
                ),

              ],
            ),
          ),
        ));
  }
}
