import 'package:flutter_clean_arch_v2/features/login/data/datasource/login_datasource_impl.dart';
import 'package:flutter_clean_arch_v2/features/login/domain/usecases/login_usecases.dart';
import 'package:flutter_clean_arch_v2/features/login/presentation/login_page/login_page.dart';
import 'package:flutter_clean_arch_v2/features/login/presentation/login_page/reducers/login_reducer.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends Module {
  @override
  void binds(i) {
    i.add<LoginDatasource>(LoginDatasourceImpl.new);
    i.add<LoginUsecases>(LoginUsecasesImpl.new);
    i.addSingleton<LoginReducer>(LoginReducer.new);
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) => const LoginPage(),
      transition: TransitionType.fadeIn,
    );
  }
}
