import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:poo_fotball/models/football_match_entity.dart';

class MatchTile extends StatelessWidget {
  final FootballMatchEntity footballMatchEntity;

  const MatchTile({
    super.key,
    required this.footballMatchEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes the position of the shadow
          ),
        ],
      ),
      child: ListTile(
        title: Text(footballMatchEntity.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(footballMatchEntity.location),
            Text(
                'Date: ${DateFormat.yMMMEd().format(footballMatchEntity.fromDateTime)}'),
          ],
        ),
      ),
    );
  }
}
