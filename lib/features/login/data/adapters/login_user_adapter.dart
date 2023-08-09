import 'package:flutter_clean_arch_v2/features/login/domain/dto/login_user_dto.dart';

class LoginUserAdapter {
  static LoginUserDTO fromJson(Map<String, dynamic> json) {
    return LoginUserDTO(
      email: json['email'],
      password: json['password'],
    );
  }

  static Map<String, dynamic> toJson(LoginUserDTO loginUserRequest) {
    return {
      'email': loginUserRequest.email,
      'password': loginUserRequest.password,
    };
  }
}
