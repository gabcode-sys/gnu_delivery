import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gnu_delivery/app/core/stores/auth_store.dart';
import 'package:gnu_delivery/app/modules/home/domain/errors/errors.dart';
import 'package:mobx/mobx.dart';

import '../../../domain/entities/login_credential.dart';
import '../../../domain/usecases/verify_phone_code.dart';

part 'verification_controller.g.dart';

@Injectable()
class VerificationController = ControllerBase with _$VerificationController;

abstract class ControllerBase with Store {
  final VerifyPhoneCode verifyPhoneCode;
  final String verificationId;
  final AuthStore authStore;
  ControllerBase(this.verifyPhoneCode, this.authStore,
      {@Param this.verificationId});

  @observable
  String code = "";

  @action
  setCode(String value) => code = value;

  @computed
  LoginCredential get credential => LoginCredential.withVerificationCode(
      code: code, verificationId: verificationId);

  @computed
  bool get isValid => credential.isValidCode;

  enterCode(BuildContext context) async {
    await Future.delayed(Duration(seconds: 1));
    var result = await verifyPhoneCode(credential);
    result.fold((failure) {
      // Go to inespected error

      if (failure is ConnectionError) {
        Modular.to.pushNamed('/connection_error');
      } else {
        Modular.to.pushNamed('/general_error');
      }
    }, (user) {
      authStore.setUser(user);
      Modular.to.pushNamedAndRemoveUntil("/home_module", (_) => false);
    });
  }
}
