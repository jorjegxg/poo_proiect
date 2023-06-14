import 'package:poo_fotball/models/user_model.dart';

import '../models/football_match_model.dart';

List<FootballMatchModel> listOfMatches = [
  FootballMatchModel(
      name: 'Meci 1',
      location: 'Suceava',
      fromDateTime: DateTime(2023, 12, 12, 12, 00),
      toDateTime: DateTime(2023, 12, 12, 14, 00),
      maxPlayers: 12,
      minPlayers: 10,
      owner: UserModel.thisUser,
      players: []),
  FootballMatchModel(
      name: 'Meci 2',
      location: 'Bucuresti',
      fromDateTime: DateTime(2023, 12, 12, 12, 00),
      toDateTime: DateTime(2023, 12, 12, 14, 00),
      maxPlayers: 12,
      minPlayers: 10,
      owner: UserModel.thisUser,
      players: []),
  FootballMatchModel(
      name: 'Meci 3',
      location: 'Iasi',
      fromDateTime: DateTime(2023, 12, 12, 12, 00),
      toDateTime: DateTime(2023, 12, 12, 14, 00),
      maxPlayers: 12,
      minPlayers: 10,
      owner: UserModel.thisUser,
      players: []),
  FootballMatchModel(
      name: 'Meci 4',
      location: 'Cluj',
      fromDateTime: DateTime(2023, 12, 12, 12, 00),
      toDateTime: DateTime(2023, 12, 12, 14, 00),
      maxPlayers: 12,
      minPlayers: 10,
      owner: UserModel.thisUser,
      players: []),
  FootballMatchModel(
      name: 'Meci 5',
      location: 'Timisoara',
      fromDateTime: DateTime(2023, 12, 12, 12, 00),
      toDateTime: DateTime(2023, 12, 12, 14, 00),
      maxPlayers: 12,
      minPlayers: 10,
      owner: UserModel.thisUser,
      players: []),
  FootballMatchModel(
      name: 'Meci 6',
      location: 'Constanta',
      fromDateTime: DateTime(2023, 12, 12, 12, 00),
      toDateTime: DateTime(2023, 12, 12, 14, 00),
      maxPlayers: 12,
      minPlayers: 10,
      owner: UserModel.thisUser,
      players: []),
];
