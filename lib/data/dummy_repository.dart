import 'package:poo_fotball/data/i_matches_service.dart';
import 'package:poo_fotball/data/list_of_matches.dart';

import '../core/enums.dart';
import '../models/football_match_model.dart';
import '../models/user_entity.dart';

class DummyRepository implements IMatchesService {
  final List<FootballMatchModel> _listOfMatches = listOfMatches;

  @override
  Future<void> addMatch({required FootballMatchModel match}) async {
    _listOfMatches.add(match);
  }

  @override
  Future<List<FootballMatchModel>> getAllMatches() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _listOfMatches;
  }

  @override
  Future<List<FootballMatchModel>> getMatchesByNameOrLocation(
      {required String name}) async {
    final List<FootballMatchModel> filteredMatches = _listOfMatches
        .where((element) =>
            element.name.toLowerCase().contains(name.toLowerCase()) ||
            element.location.toLowerCase().contains(name.toLowerCase()))
        .toList();

    await Future.delayed(const Duration(milliseconds: 500));
    return filteredMatches;
  }
}

List<UserEntity> listOfRandomPlayers = [
  const UserEntity(
    firstName: 'Tom',
    lastName: 'Holland',
    footballPosition: FootballPosition.goalkeeper,
  ),
  const UserEntity(
    firstName: 'Robert',
    lastName: 'Downey Jr.',
    footballPosition: FootballPosition.forward,
  ),
  const UserEntity(
    firstName: 'Chris',
    lastName: 'Evans',
    footballPosition: FootballPosition.defender,
  ),
  const UserEntity(
    firstName: 'Scarlett',
    lastName: 'Johansson',
    footballPosition: FootballPosition.midfielder,
  ),
  const UserEntity(
    firstName: 'Chris',
    lastName: 'Hemsworth',
    footballPosition: FootballPosition.goalkeeper,
  ),
  const UserEntity(
    firstName: 'Mark',
    lastName: 'Ruffalo',
    footballPosition: FootballPosition.defender,
  ),
  const UserEntity(
    firstName: 'Benedict',
    lastName: 'Cumberbatch',
    footballPosition: FootballPosition.midfielder,
  ),
  const UserEntity(
    firstName: 'Tom',
    lastName: 'Hiddleston',
    footballPosition: FootballPosition.forward,
  ),
  const UserEntity(
    firstName: 'Elizabeth',
    lastName: 'Olsen',
    footballPosition: FootballPosition.goalkeeper,
  ),
  const UserEntity(
    firstName: 'Paul',
    lastName: 'Rudd',
    footballPosition: FootballPosition.defender,
  ),
  const UserEntity(
    firstName: 'Anthony',
    lastName: 'Mackie',
    footballPosition: FootballPosition.midfielder,
  ),
  const UserEntity(
    firstName: 'Sebastian',
    lastName: 'Stan',
    footballPosition: FootballPosition.forward,
  ),
  const UserEntity(
    firstName: 'Chadwick',
    lastName: 'Boseman',
    footballPosition: FootballPosition.goalkeeper,
  ),
  const UserEntity(
    firstName: 'Brie',
    lastName: 'Larson',
    footballPosition: FootballPosition.defender,
  ),
  const UserEntity(
    firstName: 'Jeremy',
    lastName: 'Renner',
    footballPosition: FootballPosition.midfielder,
  ),
  const UserEntity(
    firstName: 'Paul',
    lastName: 'Bettany',
    footballPosition: FootballPosition.forward,
  ),
  const UserEntity(
    firstName: 'Don',
    lastName: 'Cheadle',
    footballPosition: FootballPosition.goalkeeper,
  ),
  const UserEntity(
    firstName: 'Karen',
    lastName: 'Gillan',
    footballPosition: FootballPosition.defender,
  ),
  const UserEntity(
    firstName: 'Zoe',
    lastName: 'Saldana',
    footballPosition: FootballPosition.midfielder,
  ),
  const UserEntity(
    firstName: 'Dave',
    lastName: 'Bautista',
    footballPosition: FootballPosition.forward,
  ),
];
