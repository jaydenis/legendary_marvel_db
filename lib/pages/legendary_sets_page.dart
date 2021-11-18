import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:legendary_marvel_db/models/legendary_models.dart';
import 'package:legendary_marvel_db/services/services.dart';

import 'home_page.dart';
import 'legendary_set_page_edit.dart';
import 'legendary_set_page_view.dart';
class LegendarySetsPage extends StatefulWidget {
  const LegendarySetsPage();

  @override
  _LegendarySetsPageState createState() => _LegendarySetsPageState();
}

class _LegendarySetsPageState extends State<LegendarySetsPage> {
  Future<void> _signOut() async {
    final success = await Services.of(context).authService.signOut();
    if (success) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => HomePage()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('There was an issue logging out.')));
    }
  }

  Future<void> _addSet() async {
    final note = await Navigator.push<LegendarySet?>(
      context,
      MaterialPageRoute(builder: (context) => LegendarySetPageEdit()),
    );
    if (note != null) {
      setState(() {});
    }
  }

  Future<void> _editSet(LegendarySet legendarySet) async {
    final updatedSet = await Navigator.push<LegendarySet?>(
      context,
      MaterialPageRoute(builder: (context) => LegendarySetPageEdit(legendarySet: legendarySet)),
    );
    if (updatedSet != null) {
      setState(() {});
    }
  }

  Future<void> _viewSet(LegendarySet legendarySet) async {
    final updatedSet = await Navigator.push<LegendarySet?>(
      context,
      MaterialPageRoute(builder: (context) => LegendarySetPageView(legendarySet: legendarySet)),
    );
    if (updatedSet != null) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Legendary Marvel'),
        actions: [_logOutButton(context)],
      ),
      body: ListView(
        children: [
          FutureBuilder<List<LegendarySet>>(
            future: Services.of(context).legendaryService.getSets(),
            builder: (context, snapshot) {
              final legendarySets = (snapshot.data ?? []);
              return Column(
                children: legendarySets.map(_toLegendarySetWidget).toList(),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Add Set'),
        icon: Icon(Icons.add),
        onPressed: _addSet,
      ),
    );
  }

  Widget _logOutButton(BuildContext context) {
    return IconButton(
      onPressed: _signOut,
      icon: Icon(Icons.logout),
    );
  }

  Widget _toLegendarySetWidget(LegendarySet legendarySet) {
    return Dismissible(
      key: ValueKey(legendarySet.setId),
      direction: DismissDirection.endToStart,
      confirmDismiss: (_) =>
          Services.of(context).legendaryService.deleteSet(legendarySet.setId),
      onDismissed: (_) => setState(() {}),
      background: Container(
        padding: const EdgeInsets.all(16.0),
        color: Theme.of(context).errorColor,
        alignment: Alignment.centerRight,
        child: Icon(Icons.delete),
      ),
      child: ListTile(
        title: Text(legendarySet.setName),
        subtitle: Text(legendarySet.yearReleased.toString()),
        onTap: () => _viewSet(legendarySet),
        onLongPress: () => _editSet(legendarySet),
      ),
    );
  }



}