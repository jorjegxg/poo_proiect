import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poo_fotball/core/k_snack_bar.dart';
import 'package:poo_fotball/presentation/state/bloc/matches_bloc.dart';
import 'package:poo_fotball/presentation/widgets/my_button.dart';

import '../../models/football_match_model.dart';
import '../../models/user_model.dart';

class AddMatchPage extends StatefulWidget {
  const AddMatchPage({super.key});

  @override
  State<AddMatchPage> createState() => _AddMatchPageState();
}

class _AddMatchPageState extends State<AddMatchPage> {
  TimeOfDay startTime = TimeOfDay.now();
  TimeOfDay endTime = TimeOfDay.now();
  DateTime date = DateTime.now();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _maxPlayersController = TextEditingController();
  final TextEditingController _minPlayersController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _locationController.dispose();
    _maxPlayersController.dispose();
    _minPlayersController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Match'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _nameController,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Match Name',
                ),
              ),
              const SizedBox(height: 8.0),
              TextField(
                controller: _locationController,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Location',
                ),
              ),
              const SizedBox(height: 8.0),
              TextField(
                controller: _maxPlayersController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Max Players',
                ),
              ),
              const SizedBox(height: 8.0),
              TextField(
                controller: _minPlayersController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Min Players',
                ),
              ),
              const SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyButton(
                    text: 'Pick Date',
                    onPressed: () async {
                      date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2025),
                          ) ??
                          date;

                      setState(() {});
                    },
                  ),
                  const SizedBox(width: 8.0),
                  Text(
                    '${date.year}/${date.month}/${date.day}',
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyButton(
                    onPressed: () async {
                      startTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          ) ??
                          startTime;

                      setState(() {});
                    },
                    text: 'Pick start time',
                  ),
                  const SizedBox(width: 8.0),
                  Text(
                    '${startTime.hour} : ${startTime.minute}',
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyButton(
                    onPressed: () async {
                      endTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          ) ??
                          endTime;
                      setState(() {});
                    },
                    text: 'Pick end time',
                  ),
                  const SizedBox(width: 8.0),
                  Text(
                    '${endTime.hour} : ${endTime.minute}',
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              Row(
                children: [
                  Expanded(
                    child: MyButton(
                      onPressed: () {
                        if (!isValid()) {
                          return;
                        }
                        context.read<MatchesBloc>().add(
                              AddMatchEvent(
                                FootballMatchModel(
                                  name: _nameController.text,
                                  location: _locationController.text,
                                  maxPlayers:
                                      int.parse(_maxPlayersController.text),
                                  minPlayers:
                                      int.parse(_minPlayersController.text),
                                  fromDateTime: DateTime(
                                    date.year,
                                    date.month,
                                    date.day,
                                    startTime.hour,
                                    startTime.minute,
                                  ),
                                  owner: UserModel.thisUser,
                                  players: [],
                                  toDateTime: DateTime(
                                    date.year,
                                    date.month,
                                    date.day,
                                    endTime.hour,
                                    endTime.minute,
                                  ),
                                ),
                              ),
                            );

                        Navigator.pop(context);
                      },
                      text: 'Add Match',
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  bool isValid() {
    if (_nameController.text.isEmpty) {
      kShowSnackBar(context, 'Please enter match name');
      return false;
    }

    if (_locationController.text.isEmpty) {
      kShowSnackBar(context, 'Please enter match location');
      return false;
    }

    if (_maxPlayersController.text.isEmpty) {
      kShowSnackBar(context, 'Please enter max players');
      return false;
    }

    if (_minPlayersController.text.isEmpty) {
      kShowSnackBar(context, 'Please enter min players');
      return false;
    }

    if (startTime.hour > endTime.hour) {
      kShowSnackBar(context, 'Start time must be before end time');
      return false;
    }

    if (startTime.hour == endTime.hour && startTime.minute > endTime.minute) {
      kShowSnackBar(context, 'Start time must be before end time');
      return false;
    }

    if (int.parse(_maxPlayersController.text) <
        int.parse(_minPlayersController.text)) {
      kShowSnackBar(context, 'Max players must be greater than min players');
      return false;
    }

    return true;
  }
}
