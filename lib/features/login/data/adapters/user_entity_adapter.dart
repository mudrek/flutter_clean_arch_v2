import 'package:flutter_clean_arch_v2/features/login/domain/entities/user_entity.dart';

class UserEntityAdapter {
  static UserEntity fromJson(Map<String, dynamic> json) {
    return UserEntity(
      email: json['email'],
      name: json['name'],
    );
  }
}
