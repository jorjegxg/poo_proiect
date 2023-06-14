class FootballMatchEntity {
  final String name;
  final String location;
  final DateTime fromDateTime;
  final DateTime toDateTime;

  const FootballMatchEntity({
    required this.name,
    required this.location,
    required this.fromDateTime,
    required this.toDateTime,
  });
}
