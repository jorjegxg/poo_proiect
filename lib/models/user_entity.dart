import '../core/enums.dart';

class UserEntity {
  final String firstName;
  final String lastName;
  final FootballPosition footballPosition;

  const UserEntity({
    required this.firstName,
    required this.lastName,
    required this.footballPosition,
  });
}


