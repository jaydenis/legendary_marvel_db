

import 'dart:convert';

import 'package:legendary_marvel_db/models/legendary_models.dart';

import 'package:http/http.dart' as http;

Future<List<LegendarySet>> fetchLegendarySets() async {
  final response = await http
      .get(Uri.parse('https://raw.githubusercontent.com/jaydenis/legendary_marvel_cards/master/json_data/legendary_sets_json.dart'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.

    return LegendarySet.fromJson(jsonDecode(response.body)) as List<LegendarySet>;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Legendary Set');
  }
}