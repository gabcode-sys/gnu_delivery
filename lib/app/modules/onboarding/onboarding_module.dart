import 'package:flutter_modular/flutter_modular.dart';
import 'package:gnu_delivery/app/modules/onboarding/presenter/pages/on_board.dart';

class OnboardingModule extends ChildModule {
  static List<Bind> export = [];

  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => [
        ModularRouter("/onboarding", child: (_, __) => OnBoard()),
      ];
}
