import 'package:flutter_clean_arch_v2/features/login/presentation/login_page/login_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) => const LoginPage(),
      transition: TransitionType.fadeIn,
    );
  }
}
