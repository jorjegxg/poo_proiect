part of 'matches_bloc.dart';

@immutable
abstract class MatchesEvent {}

class GetMatchesEvent extends MatchesEvent {}

class AddMatchEvent extends MatchesEvent {
  final FootballMatchModel match;

  AddMatchEvent(this.match);
}

class GetMatchesByNameOrLocationEvent extends MatchesEvent {
  final String nameOrLocation;

  GetMatchesByNameOrLocationEvent(this.nameOrLocation);
}

class JoinMatchEvent extends MatchesEvent {
  final FootballMatchModel footballMatchModel;

  JoinMatchEvent(this.footballMatchModel);
}
