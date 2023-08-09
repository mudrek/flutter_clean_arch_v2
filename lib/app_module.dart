import 'package:flutter_clean_arch_v2/features/login/login_module.dart';
import 'package:flutter_clean_arch_v2/features/splash_screen/presentation/splash_screen_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'features/home/home_module.dart';

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child('/', child: (context) => const SplashScreenPage());
    r.module('/home', module: HomeModule());
    r.module('/login', module: LoginModule());
  }
}
