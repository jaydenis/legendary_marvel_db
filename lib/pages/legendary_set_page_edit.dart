import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:legendary_marvel_db/models/legendary_models.dart';
import 'package:legendary_marvel_db/services/services.dart';

class LegendarySetPageEdit extends StatefulWidget {
  final LegendarySet? legendarySet;

  const LegendarySetPageEdit({this.legendarySet});

  @override
  _LegendarySetPageEditState createState() => _LegendarySetPageEditState();
}

class _LegendarySetPageEditState extends State<LegendarySetPageEdit> {
  final _titleController = TextEditingController();
  final _yearReleased = TextEditingController();
  final _numberOfCards = TextEditingController();

  Future<void> _saveSet() async {
    final setName = _titleController.text;
    final yearReleased = _yearReleased.text;
    final numberOfCards = _numberOfCards.text;
    if (setName.isEmpty) {
      _showSnackBar('Title cannot be empty.');
      return;
    }
    final legendarySet = await _createOrUpdateSet(setName, yearReleased,numberOfCards);
    if (legendarySet != null) {
      Navigator.pop(context, legendarySet);
    } else {
      _showSnackBar('Something went wrong.');
    }
  }

  Future<LegendarySet?> _createOrUpdateSet(String setName, String yearReleased, String numberOfCards) {
    final legendaryService = Services.of(context).legendaryService;
    if (widget.legendarySet != null) {
      return legendaryService.updateSet(widget.legendarySet!.setId, setName, int.parse(yearReleased),int.parse(numberOfCards));
    } else {
      return legendaryService.createSet(setName, int.parse(yearReleased),int.parse(numberOfCards));
    }
  }

  void _showSnackBar(String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.legendarySet != null ? 'Edit Set' : 'New Set'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _titleController,
              decoration: InputDecoration(hintText: 'Set Name'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              controller: _yearReleased,
              decoration: InputDecoration(hintText: 'Year'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              controller: _numberOfCards,
              decoration: InputDecoration(hintText: 'Cards'),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _saveSet,
        icon: Icon(Icons.save),
        label: Text('Save'),
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