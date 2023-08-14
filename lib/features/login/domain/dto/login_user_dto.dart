import 'package:flutter_clean_arch_v2/core/dto.dart';
import 'package:flutter_clean_arch_v2/core/exceptions.dart';
import 'package:flutter_clean_arch_v2/features/login/domain/exceptions/login_exceptions.dart';
import 'package:flutter_clean_arch_v2/features/login/domain/value_objects/email.dart';
import 'package:result_dart/result_dart.dart';

class LoginUserDTO implements DTOValidate {
  final Email email;
  final String password;

  const LoginUserDTO({
    required this.email,
    required this.password,
  });

  @override
  Result<LoginUserDTO, NiweException> validate() {
    return email.validate().flatMap((_) => validatePassword()).pure(this);
  }

  Result<Unit, NiweException> validatePassword() {
    if (password.isEmpty) {
      Result.failure(const PasswordException(msg: 'Senha inválida'));
    }
    return Result.success(unit);
  }

  static LoginUserDTO empty() {
    return LoginUserDTO(
      email: Email.create(''),
      password: '',
    );
  }
}
