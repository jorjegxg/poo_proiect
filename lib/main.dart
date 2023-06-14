import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poo_fotball/presentation/pages/my_bottom_app_bar.dart';
import 'package:poo_fotball/presentation/state/bloc/matches_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) =>
          MatchesBloc()..add(GetMatchesByNameOrLocationEvent('')),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const String _title = 'POO Football';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: const MyBottomAppBar(),
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
    );
  }
}
