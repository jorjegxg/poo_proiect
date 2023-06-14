import 'package:poo_fotball/models/football_match_model.dart';

abstract class IMatchesService {
  Future<List<FootballMatchModel>> getAllMatches();
  Future<List<FootballMatchModel>> getMatchesByNameOrLocation(
      {required String name});
  Future<void> addMatch({required FootballMatchModel match});
}
