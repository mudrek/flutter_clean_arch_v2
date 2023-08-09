///
import 'package:flutter/foundation.dart';
import 'package:flutter_clean_arch_v2/core/exceptions.dart';
import 'package:flutter_clean_arch_v2/features/login/domain/exceptions/login_exceptions.dart';
import 'package:result_dart/result_dart.dart';

@immutable
class Email {
  final String value;

  const Email._(this.value);

  factory Email.create(String value) {
    final formattedEmail = _format(value);
    final email = Email._(formattedEmail);

    return email;
  }

  factory Email.createEmpty() => Email.create('');

  Result<Unit, NiweException> validate() {
    final emailRegex = RegExp(r'^[\w-.]+@([\w-]+.)+[\w-]{2,4}$');
    final isEmailValid = emailRegex.hasMatch(value);

    if (!isEmailValid) {
      return Result.failure(const EmailException(msg: 'Email inválido'));
    }

    return Result.success(unit);
  }

  bool get isValid => validate().isSuccess();

  static String _format(String value) => value.trim();

  @override
  bool operator ==(covariant Email other) {
    if (identical(this, other)) return true;

    return other.value == value;
  }

  @override
  int get hashCode => value.hashCode;
}
