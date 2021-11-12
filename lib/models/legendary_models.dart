class LegendarySet {
  final int setId;
  final String setName;
  final int? yearReleased;
  final int? numberOfCards;
  final String? imageAssetPath;

  LegendarySet(this.setId, this.setName, this.yearReleased, this.numberOfCards,this.imageAssetPath);

  @override
  String toString() {
    return 'LegendarySet{setId: $setId, setName: $yearReleased, numberOfCards: $numberOfCards}';
  }
}

class LegendaryDeck {
  final int deckId;
  final String deckName;
  final int deckTypeId;
  final int setId;

  LegendaryDeck(this.deckId, this.deckName, this.deckTypeId, this.setId);

  @override
  String toString() {
    return 'LegendaryDeck{deckId: $deckId, deckName: $deckName, deckTypeId: $deckTypeId, setId: $setId}';
  }
}

class LegendaryCard {
  final int cardId;
  final String cardName;
  final int cardTypeId;
  final int deckId;
  final int numberOfCards;
  final int teamId;

  LegendaryCard(this.cardId, this.cardName, this.cardTypeId, this.deckId,this.numberOfCards, this.teamId);

  @override
  String toString() {
    return 'LegendaryCard{cardId: $cardId, cardName: $cardName, cardTypeId: $cardTypeId, deckId: $deckId, numberOfCards: $numberOfCards, teamId: $teamId}';
  }
}