import 'package:flutter_clean_arch_v2/features/login/data/adapters/user_entity_adapter.dart';
import 'package:flutter_clean_arch_v2/features/login/domain/dto/login_user_dto.dart';

import '../../domain/entities/user_entity.dart';

abstract class LoginDatasource {
  Future<UserEntity> doLogin(LoginUserDTO loginUser);
}

class LoginDatasourceImpl implements LoginDatasource {
  @override
  Future<UserEntity> doLogin(LoginUserDTO loginUser) async {
    await Future.delayed(const Duration(seconds: 2));
    final jsonExample = {'email': 'email@example.com', 'name': 'Example Name'};

    return UserEntityAdapter.fromJson(jsonExample);
  }
}
