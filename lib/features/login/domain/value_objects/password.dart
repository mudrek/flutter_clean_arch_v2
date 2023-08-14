///
import 'package:flutter/foundation.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

@immutable
class Password {
  static String? Function(String?)? formFieldValidatePassword() {
    return FormBuilderValidators.compose([
      FormBuilderValidators.required(errorText: 'Senha é obrigatória'),
      FormBuilderValidators.minLength(3,
          errorText: 'A senha precisa ter no mínimo 3 caracteres')
    ]);
  }
}
