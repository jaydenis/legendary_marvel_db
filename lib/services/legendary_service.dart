import 'dart:developer';

import 'package:supabase/supabase.dart';
import 'package:legendary_marvel_db/models/legendary_models.dart';

class LegendaryService {
  static const sets = 'legendary_set';
  static const decks = 'legendary_deck';
  static const cards = 'legendary_card';

  final SupabaseClient _client;

  LegendaryService(this._client);

  Future<List<LegendarySet>> getSets() async {
    final response = await _client
        .from(sets)
        .select('*')
        .order('yearReleased')
        .execute();
    if (response.error == null) {
      final results = response.data as List<dynamic>;
      return results.map((e) => toLegendarySet(e)).toList();
    }
    log('Error fetching sets: ${response.error!.message}');
    return [];
  }

  Future<LegendarySet?> getSet(int setId) async {
    final response = await _client
        .from(sets)
        .select('*')
    .eq('setId', setId)
        .execute();
    if (response.error == null) {
      final results = response.data as dynamic;
      return results.map((e) => toLegendarySet(e));
    }
    log('Error fetching sets: ${response.error!.message}');
    return null;
  }

  Future<List<LegendarySet>> searchSets(String searchTerm) async {
    final response = await _client
        .from(sets)
        .select('*')
    .eq('setName', searchTerm)
        .order('setName')
        .execute();
    if (response.error == null) {
      final results = response.data as List<dynamic>;
      return results.map((e) => toLegendarySet(e)).toList();
    }
    log('Error fetching sets: ${response.error!.message}');
    return [];
  }

  Future<LegendarySet?> createSet(String setName, int yearReleased, int numberOfCards) async {
    final response = await _client
        .from(sets)
        .insert({'setName': setName, 'yearReleased': yearReleased, 'numberOfCards': numberOfCards}).execute();
    if (response.error == null) {
      final results = response.data as List<dynamic>;
      return toLegendarySet(results[0]);
    }
    log('Error creating note: ${response.error!.message}');
    return null;
  }

  Future<LegendarySet?> updateSet(int setId, String setName, int yearReleased, int numberOfCards) async {
    final response = await _client
        .from(sets)
        .update({'setName': setName, 'yearReleased': yearReleased, 'numberOfCards': numberOfCards})
        .eq('setId', setId)
        .execute();
    if (response.error == null) {
      final results = response.data as List<dynamic>;
      return toLegendarySet(results[0]);
    }
    log('Error editing note: ${response.error!.message}');
    return null;
  }
  Future<bool> deleteSet(int id) async {

    log('Error deleting set');
    return false;
  }


  LegendarySet toLegendarySet(Map<String, dynamic> result) {
    return LegendarySet(
      result['setId'],
      result['setName'],
      result['yearReleased'],
      result['numberOfCards'],
      result['imageAssetPath']
    );
  }

  Future<List<LegendaryDeck>> getDecks(int setId) async {
    final response = await _client
        .from(decks)
        .select('deckId, deckName, deckTypeId, setId')
        .eq('setId', setId)
        .order('deckName')
        .execute();
    if (response.error == null) {
      final results = response.data as List<dynamic>;
      return results.map((e) => toLegendaryDeck(e)).toList();
    }
    log('Error fetching decks: ${response.error!.message}');
    return [];
  }

  LegendaryDeck toLegendaryDeck(Map<String, dynamic> result) {
    return LegendaryDeck(
      result['deckId'],
      result['deckName'],
      result['deckTypeId'],
      result['setId'],
    );
  }

  Future<List<LegendaryCard>> getCards(int deckId) async {
    final response = await _client
        .from(cards)
        .select('cardId, cardName, cardTypeId, deckId, numberOfCards, teamId')
        .eq('deckId', deckId)
        .order('cardName')
        .execute();
    if (response.error == null) {
      final results = response.data as List<dynamic>;
      return results.map((e) => toLegendaryCard(e)).toList();
    }
    log('Error fetching decks: ${response.error!.message}');
    return [];
  }

  LegendaryCard toLegendaryCard(Map<String, dynamic> result) {
    return LegendaryCard(
      result['cardId'],
      result['cardName'],
      result['cardTypeId'],
      result['deckId'],
      result['numberOfCards'],
      result['teamId']
    );
  }

}
