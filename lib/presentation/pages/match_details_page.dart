import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:poo_fotball/core/k_snack_bar.dart';
import 'package:poo_fotball/models/football_match_model.dart';
import 'package:poo_fotball/models/user_entity.dart';

import '../../data/dummy_repository.dart';
import '../widgets/card_decoration.dart';
import '../widgets/my_button.dart';

class MatchDetailsPage extends StatefulWidget {
  const MatchDetailsPage({
    super.key,
    required this.footballMatchModel,
  });
  final FootballMatchModel footballMatchModel;

  @override
  State<MatchDetailsPage> createState() => _MatchDetailsPageState();
}

class _MatchDetailsPageState extends State<MatchDetailsPage> {
  final List<UserEntity> _listOfPlayers = [];

  bool canAddPlayer() {
    return widget.footballMatchModel.maxPlayers > _listOfPlayers.length;
  }

  void _addPlayer() {
    if (!canAddPlayer()) {
      kShowSnackBar(
        context,
        'Nu mai sunt locuri disponibile',
      );
      return;
    }

    _listOfPlayers.add(
      listOfRandomPlayers[math.Random().nextInt(listOfRandomPlayers.length)],
    );

    log(listOfRandomPlayers.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.footballMatchModel.name,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: cardDecoration,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  Text(
                    'Locatie:  ${widget.footballMatchModel.location}',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        '${widget.footballMatchModel.fromTimeFormatted}   -   ${widget.footballMatchModel.toTimeFormatted}',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ],
                  ),
                  MyButton(
                    color: canAddPlayer() ? Colors.indigo : Colors.grey,
                    text: 'Cere sa intrii',
                    onPressed: () => _addPlayer(),
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        width: double.infinity,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 16.0,
                        ),
                        child: Container(
                          decoration: cardDecoration,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(
                                  'Deja au intrat:',
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                                Column(
                                  children: _listOfPlayers
                                      .map(
                                        (e) => ListTile(
                                          leading: const Icon(
                                            Icons.sports_soccer,
                                            color: Colors.indigo,
                                          ),
                                          title: Text(
                                            e.firstName,
                                          ),
                                          subtitle: Text(
                                            e.lastName,
                                          ),
                                          trailing: Text(
                                            e.footballPosition.name,
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
