import 'package:poo_fotball/models/user_entity.dart';

import '../core/enums.dart';

class UserModel extends UserEntity {
  final String address;
  final String email;
  final String phone;

  UserModel({
    required super.firstName,
    required super.lastName,
    required super.footballPosition,
    required this.address,
    required this.email,
    required this.phone,
  });

  static UserModel thisUser = UserModel(
    firstName: 'Andrei',
    lastName: 'Popescu',
    footballPosition: FootballPosition.defender,
    address: 'Str. Mihai Viteazu, nr. 1, Bucuresti',
    email: 'andrei@popescu.com',
    phone: '0722222222',
  );
}
