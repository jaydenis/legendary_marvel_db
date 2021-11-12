import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:legendary_marvel_db/models/legendary_models.dart';
import 'package:legendary_marvel_db/services/services.dart';

class LegendarySetPageView extends StatefulWidget {
  final LegendarySet? legendarySet;

  const LegendarySetPageView({this.legendarySet});

  @override
  _LegendarySetPageViewState createState() => _LegendarySetPageViewState();
}

class _LegendarySetPageViewState extends State<LegendarySetPageView> {
  final _titleController = TextEditingController();
  final _yearReleased = TextEditingController();
  final _numberOfCards = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View: '+widget.legendarySet!.setName),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(_titleController.text),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(_yearReleased.text),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(_numberOfCards.text),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    if (widget.legendarySet != null) {
      _titleController.text = widget.legendarySet!.setName;
      _yearReleased.text = widget.legendarySet!.yearReleased.toString();
      _numberOfCards.text = widget.legendarySet!.numberOfCards.toString();
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _yearReleased.dispose();
    _numberOfCards.dispose();
    super.dispose();
  }
}