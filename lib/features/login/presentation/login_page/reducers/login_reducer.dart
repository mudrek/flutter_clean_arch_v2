import 'package:asp/asp.dart';
import 'package:flutter_clean_arch_v2/features/login/domain/usecases/login_usecases.dart';
import 'package:flutter_clean_arch_v2/features/login/presentation/login_page/states/login_states.dart';
import 'package:result_dart/result_dart.dart';

import '../atoms/login_atom.dart';

class LoginReducer extends Reducer {
  final LoginUsecases loginUsecases;

  LoginReducer({required this.loginUsecases}) {
    on(() => [doLogin.value], _doLogin);
  }

  _doLogin() async {
    loginState.setValue(LoadingLoginState());
    final loginUserDTO = doLogin.value;
    await loginUsecases.doLogin(loginUserDTO).fold(
          (userEntity) =>
              loginState.setValue(SuccessLoginState(userEntity: userEntity)),
          (error) => loginState.setValue(
            ErrorLoginState(niweException: error),
          ),
        );
  }
}
