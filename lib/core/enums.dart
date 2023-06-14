enum FootballPosition { goalkeeper, defender, midfielder, forward }

extension FootballPositionExtension on FootballPosition {
  String get name {
    switch (this) {
      case FootballPosition.goalkeeper:
        return 'Goalkeeper';
      case FootballPosition.defender:
        return 'Defender';
      case FootballPosition.midfielder:
        return 'Midfielder';
      case FootballPosition.forward:
        return 'Forward';
      default:
        return '';
    }
  }
}
