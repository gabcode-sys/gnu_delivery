import 'package:connectivity/connectivity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gnu_delivery/app/core/pages/connection_error_page.dart';
import 'package:gnu_delivery/app/core/pages/splash_screen_page.dart';
import 'package:gnu_delivery/app/modules/onboarding/onboarding_module.dart';

import 'app_widget.dart';
import 'core/pages/general_error_page.dart';
import 'core/stores/auth_store.dart';
import 'modules/home/home_module.dart';
import 'modules/login/login_module.dart';
import 'modules/store/store_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        ...LoginModule.export,
        ...HomeModule.export,
        ...StoreModule.export,
        $AuthStore,
        Bind((i) => FirebaseAuth.instance),
        Bind((i) => Connectivity()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, __) => SplashScreenPage()),
        ModularRouter('/connection_error',
            child: (_, __) => ConnectionErrorPage()),
        ModularRouter('/general_error', child: (_, __) => GeneralErrorPage()),
        ModularRouter('/onboarding_module', module: OnboardingModule()),
        ModularRouter('/login_module', module: LoginModule()),
        ModularRouter('/home_module', module: HomeModule()),
        ModularRouter('/store_module', module: StoreModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();
}
