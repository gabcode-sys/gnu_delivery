import 'package:flutter_modular/flutter_modular.dart';
import 'package:gnu_delivery/app/core/stores/auth_store.dart';
import 'package:mobx/mobx.dart';

part 'user_controller.g.dart';

@Injectable()
class UserController = ControllerBase with _$UserController;

abstract class ControllerBase with Store {
  final AuthStore authStore;
  ControllerBase(
    this.authStore,
  );

  @action
  doLogout() async {
    await authStore.signOut();
    Modular.to.pushNamedAndRemoveUntil("login_module", (_) => false);
  }
}
