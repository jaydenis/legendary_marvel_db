import 'package:admin/screens/legendary/legendary_decks_by_type_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.network(APP_ROOT+"images/boxart/legendary_core.jpg"),
          ),
          DrawerListTile(
            title: "Dashboard",
            svgSrc: "assets/icons/menu_dashbord.svg",
            press: () {
              Navigator.pushNamed(context, "/");
            },
          ),
          DrawerListTile(
            title: "Heroes",
            svgSrc: "assets/icons/menu_tran.svg",
            press: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LegendaryDecksByTypeScreen(deckTypeFilter:'Heroes')
                  )
              );
            },
          ),
          DrawerListTile(
            title: "Masterminds",
            svgSrc: "assets/icons/menu_task.svg",
            press: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LegendaryDecksByTypeScreen(deckTypeFilter:'Masterminds')
                  )
              );
            },
          ),
          DrawerListTile(
            title: "Villains",
            svgSrc: "assets/icons/menu_doc.svg",
            press: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LegendaryDecksByTypeScreen(deckTypeFilter:'Villains')
                  )
              );
            },
          ),
          DrawerListTile(
            title: "Henchmen",
            svgSrc: "assets/icons/menu_store.svg",
            press: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LegendaryDecksByTypeScreen(deckTypeFilter:'Henchmen')
                  )
              );
            },
          ),
          DrawerListTile(
            title: "Schemes",
            svgSrc: "assets/icons/menu_notification.svg",
            press: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LegendaryDecksByTypeScreen(deckTypeFilter:'Schemes')
                  )
              );
            },
          ),
          DrawerListTile(
            title: "Sidekicks",
            svgSrc: "assets/icons/menu_profile.svg",
            press: () {},
          ),
          DrawerListTile(
            title: "SHIELD Offices",
            svgSrc: "assets/icons/menu_setting.svg",
            press: () {},
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        color: Colors.white54,
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white54),
      ),
    );
  }
}
