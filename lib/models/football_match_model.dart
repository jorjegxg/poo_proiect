import 'package:intl/intl.dart';
import 'package:poo_fotball/models/user_entity.dart';

import 'football_match_entity.dart';

class FootballMatchModel extends FootballMatchEntity {
  final int maxPlayers;
  final int minPlayers;
  final UserEntity owner;
  final List<UserEntity> players;

  FootballMatchModel({
    required super.name,
    required super.location,
    required super.fromDateTime,
    required super.toDateTime,
    required this.maxPlayers,
    required this.minPlayers,
    required this.owner,
    required this.players,
  });

  String get fromDateFormatted => DateFormat().add_yMMMd().format(fromDateTime);
  String get toDateFormatted => DateFormat().add_yMMMd().format(toDateTime);

  String get fromTimeFormatted => DateFormat().add_jm().format(fromDateTime);
  String get toTimeFormatted => DateFormat().add_jm().format(toDateTime);

  @override
  String toString() {
    return '\nFootballMatchModel(name: $name, location: $location, fromDateTime: $fromDateTime, toDateTime: $toDateTime, maxPlayers: $maxPlayers, minPlayers: $minPlayers, owner: $owner, players: $players)';
  }
}
