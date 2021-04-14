import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gnu_delivery/app/core/stores/auth_store.dart';
import 'package:gnu_delivery/app/modules/login/domain/entities/login_credential.dart';
import 'package:gnu_delivery/app/modules/login/domain/errors/errors.dart';
import 'package:gnu_delivery/app/modules/login/domain/usecases/login_with_phone.dart';
import 'package:gnu_delivery/app/utils/theme/color_theme.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mobx/mobx.dart';

part 'number_signup_controller.g.dart';

@Injectable()
class NumberSignUpController = ControllerBase with _$NumberSignUpController;

abstract class ControllerBase with Store {
  final LoginWithPhone loginWithPhoneUsecase;
  final AuthStore authStore;
  ControllerBase(this.loginWithPhoneUsecase, this.authStore);

  @observable
  var textEditingControllerNumber = TextEditingController();

  @observable
  var maskFormatterNumber = new MaskTextInputFormatter(
      mask: '+## (##) # ####-####', filter: {"#": RegExp(r'[0-9]')});

  @observable
  int textSize = 0;

  @observable
  Color buttonColor = Colors.grey.shade200;

  @observable
  Color textColor = UIThemeColors.greyTheme;

  @observable
  bool isButtonEnabled = false;

  @observable
  String phone = "";

  @computed
  LoginCredential get credential =>
      LoginCredential.withPhone(phoneNumber: phone);

  @computed
  bool get isValid => credential.isValidPhone;

  @action
  setPhone() => this.phone = '+' + maskFormatterNumber.getUnmaskedText();

  enterPhone(BuildContext context) async {
    var result = await loginWithPhoneUsecase(credential);
    result.fold((failure) {
      if (failure is NotAutomaticRetrieved) {
        Modular.link.pushNamed(
          "/verification/${failure.verificationId}",
        );
      } else {
        print(failure);
        if (failure is ConnectionError) {
          Modular.to.pushNamed('/connection_error');
        } else {
          Modular.to.pushNamed('/general_error');
        }
      }
    }, (user) {
      authStore.setUser(user);
      Modular.to.popUntil(ModalRoute.withName(Modular.link.modulePath));
      Modular.to.pop();
    });
  }

  @action
  validatedInput() {
    if (maskFormatterNumber.getUnmaskedText().length == 13) {
      buttonColor = UIThemeColors.orangeTheme;
      textColor = UIThemeColors.whiteTheme;
      isButtonEnabled = true;
    } else {
      buttonColor = Colors.grey.shade200;
      isButtonEnabled = false;
      textColor = UIThemeColors.greyTheme;
    }
  }
}
