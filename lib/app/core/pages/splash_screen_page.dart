import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gnu_delivery/app/core/stores/auth_store.dart';

class SplashScreenPage extends StatelessWidget {
  final authStore = Modular.get<AuthStore>();
  SplashScreenPage() {
    Modular.get<AuthStore>().checkLogin().then((v) {
      return Future.delayed(Duration(seconds: 1));
    }).then((value) {
      authStore.isLogged
          ? Modular.to.pushNamedAndRemoveUntil("/home_module", (_) => false)
          : Modular.to
              .pushNamedAndRemoveUntil('/onboarding_module', (_) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
