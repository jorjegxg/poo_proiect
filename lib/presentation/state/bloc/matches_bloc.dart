import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:poo_fotball/data/dummy_repository.dart';

import '../../../data/i_matches_service.dart';
import '../../../models/football_match_model.dart';

part 'matches_event.dart';
part 'matches_state.dart';

class MatchesBloc extends Bloc<MatchesEvent, MatchesState> {
  final IMatchesService _matchesService = DummyRepository();

  MatchesBloc() : super(MatchesInitial()) {
    on<AddMatchEvent>(_addMatch);
    on<GetMatchesByNameOrLocationEvent>(_getMatchesByNameOrLocation);
  }

  Future<void> _addMatch(
      AddMatchEvent event, Emitter<MatchesState> emit) async {
    await _matchesService.addMatch(match: event.match);
    final List<FootballMatchModel> matches =
        await _matchesService.getAllMatches();
    emit(MatchesLoaded(matches: matches));
  }

  Future<void> _getMatchesByNameOrLocation(
      GetMatchesByNameOrLocationEvent event, Emitter<MatchesState> emit) async {
    final List<FootballMatchModel> matches =
        await _matchesService.getMatchesByNameOrLocation(
      name: event.nameOrLocation,
    );

    log(matches.toString());

    emit(MatchesLoaded(matches: matches));
  }
}
