import 'package:flutter_clean_arch_v2/core/usecase_core.dart';
import 'package:flutter_clean_arch_v2/features/login/data/datasource/login_datasource_impl.dart';
import 'package:flutter_clean_arch_v2/features/login/domain/dto/login_user_dto.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../core/exceptions.dart';
import '../entities/user_entity.dart';

abstract class LoginUsecases {
  AsyncResult<UserEntity, NiweException> doLogin(LoginUserDTO loginUser);
}

class LoginUsecasesImpl implements LoginUsecases {
  final LoginDatasource loginDatasource;

  LoginUsecasesImpl({required this.loginDatasource});

  @override
  AsyncResult<UserEntity, NiweException> doLogin(LoginUserDTO loginUser) async {
    return await usecaseCore(
      task: () async {
        loginUser.validate().onFailure((failure) => throw failure);

        return loginDatasource.doLogin(loginUser);
      },
    );
  }
}
