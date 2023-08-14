///
import 'package:flutter/foundation.dart';
import 'package:flutter_clean_arch_v2/core/exceptions.dart';
import 'package:flutter_clean_arch_v2/features/login/domain/exceptions/login_exceptions.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
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
    final isEmailValid = _validateEmailREGEX(value);

    if (!isEmailValid) {
      return Result.failure(const EmailException(msg: 'Email inválido'));
    }

    return Result.success(unit);
  }

  static bool _validateEmailREGEX(String email) {
    final emailRegex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    return emailRegex.hasMatch(email);
  }

  bool get isValid => validate().isSuccess();

  static String _format(String value) => value.trim();

  static String? Function(String?)? formFieldValidateEmail() {
    return FormBuilderValidators.compose([
      FormBuilderValidators.required(errorText: 'Email é obrigatório'),
      (value) {
        if (value != null && !_validateEmailREGEX(value)) {
          return 'Email inválido';
        }
        return null;
      }
    ]);
  }

  @override
  bool operator ==(covariant Email other) {
    if (identical(this, other)) return true;

    return other.value == value;
  }

  @override
  int get hashCode => value.hashCode;
}
