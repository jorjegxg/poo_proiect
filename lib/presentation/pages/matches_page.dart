import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../state/bloc/matches_bloc.dart';
import '../widgets/match_tile.dart';
import 'add_match_page.dart';
import 'match_details_page.dart';

class MatchesPage extends StatefulWidget {
  const MatchesPage({super.key});

  @override
  State<MatchesPage> createState() => _MatchesPageState();
}

class _MatchesPageState extends State<MatchesPage> {
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Matches'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddMatchPage(),
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: _nameController,
                  textInputAction: TextInputAction.search,
                  onChanged: (value) => setState(() {}),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Search by name or location',
                  ),
                ),
                BlocBuilder<MatchesBloc, MatchesState>(
                  builder: (context, state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (state is MatchesLoading)
                          const Center(child: CircularProgressIndicator()),
                        if (state is MatchesLoaded)
                          for (final match in state.matches)
                            if (match.name.toLowerCase().contains(
                                    _nameController.text.toLowerCase()) ||
                                match.location.toLowerCase().contains(
                                    _nameController.text.toLowerCase()))
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MatchDetailsPage(
                                        footballMatchModel: match,
                                      ),
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 4.0),
                                  child: MatchTile(footballMatchEntity: match),
                                ),
                              ),
                      ],
                    );
                  },
                )
              ],
            ),
          ),
        ));
  }
}
