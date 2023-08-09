import 'package:flutter_clean_arch_v2/features/home/presentation/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) => const HomePage(),
      transition: TransitionType.fadeIn,
    );
  }
}
