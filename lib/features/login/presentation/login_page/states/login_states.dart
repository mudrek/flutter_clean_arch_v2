import 'package:flutter_clean_arch_v2/core/exceptions.dart';
import 'package:flutter_clean_arch_v2/features/login/domain/entities/user_entity.dart';

sealed class LoginStates {}

class InitialLoginState implements LoginStates {}

class LoadingLoginState implements LoginStates {}

class SuccessLoginState implements LoginStates {
  final UserEntity userEntity;

  SuccessLoginState({required this.userEntity});
}

class ErrorLoginState implements LoginStates {
  final NiweException niweException;

  ErrorLoginState({required this.niweException});
}
