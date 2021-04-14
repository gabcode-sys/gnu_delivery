// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'number_signup_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $NumberSignUpController = BindInject(
  (i) => NumberSignUpController(i<LoginWithPhone>(), i<AuthStore>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NumberSignUpController on ControllerBase, Store {
  Computed<LoginCredential> _$credentialComputed;

  @override
  LoginCredential get credential => (_$credentialComputed ??=
          Computed<LoginCredential>(() => super.credential,
              name: 'ControllerBase.credential'))
      .value;
  Computed<bool> _$isValidComputed;

  @override
  bool get isValid => (_$isValidComputed ??=
          Computed<bool>(() => super.isValid, name: 'ControllerBase.isValid'))
      .value;

  final _$textEditingControllerNumberAtom =
      Atom(name: 'ControllerBase.textEditingControllerNumber');

  @override
  TextEditingController get textEditingControllerNumber {
    _$textEditingControllerNumberAtom.reportRead();
    return super.textEditingControllerNumber;
  }

  @override
  set textEditingControllerNumber(TextEditingController value) {
    _$textEditingControllerNumberAtom
        .reportWrite(value, super.textEditingControllerNumber, () {
      super.textEditingControllerNumber = value;
    });
  }

  final _$maskFormatterNumberAtom =
      Atom(name: 'ControllerBase.maskFormatterNumber');

  @override
  MaskTextInputFormatter get maskFormatterNumber {
    _$maskFormatterNumberAtom.reportRead();
    return super.maskFormatterNumber;
  }

  @override
  set maskFormatterNumber(MaskTextInputFormatter value) {
    _$maskFormatterNumberAtom.reportWrite(value, super.maskFormatterNumber, () {
      super.maskFormatterNumber = value;
    });
  }

  final _$textSizeAtom = Atom(name: 'ControllerBase.textSize');

  @override
  int get textSize {
    _$textSizeAtom.reportRead();
    return super.textSize;
  }

  @override
  set textSize(int value) {
    _$textSizeAtom.reportWrite(value, super.textSize, () {
      super.textSize = value;
    });
  }

  final _$buttonColorAtom = Atom(name: 'ControllerBase.buttonColor');

  @override
  Color get buttonColor {
    _$buttonColorAtom.reportRead();
    return super.buttonColor;
  }

  @override
  set buttonColor(Color value) {
    _$buttonColorAtom.reportWrite(value, super.buttonColor, () {
      super.buttonColor = value;
    });
  }

  final _$textColorAtom = Atom(name: 'ControllerBase.textColor');

  @override
  Color get textColor {
    _$textColorAtom.reportRead();
    return super.textColor;
  }

  @override
  set textColor(Color value) {
    _$textColorAtom.reportWrite(value, super.textColor, () {
      super.textColor = value;
    });
  }

  final _$isButtonEnabledAtom = Atom(name: 'ControllerBase.isButtonEnabled');

  @override
  bool get isButtonEnabled {
    _$isButtonEnabledAtom.reportRead();
    return super.isButtonEnabled;
  }

  @override
  set isButtonEnabled(bool value) {
    _$isButtonEnabledAtom.reportWrite(value, super.isButtonEnabled, () {
      super.isButtonEnabled = value;
    });
  }

  final _$phoneAtom = Atom(name: 'ControllerBase.phone');

  @override
  String get phone {
    _$phoneAtom.reportRead();
    return super.phone;
  }

  @override
  set phone(String value) {
    _$phoneAtom.reportWrite(value, super.phone, () {
      super.phone = value;
    });
  }

  final _$ControllerBaseActionController =
      ActionController(name: 'ControllerBase');

  @override
  dynamic setPhone() {
    final _$actionInfo = _$ControllerBaseActionController.startAction(
        name: 'ControllerBase.setPhone');
    try {
      return super.setPhone();
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic validatedInput() {
    final _$actionInfo = _$ControllerBaseActionController.startAction(
        name: 'ControllerBase.validatedInput');
    try {
      return super.validatedInput();
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
textEditingControllerNumber: ${textEditingControllerNumber},
maskFormatterNumber: ${maskFormatterNumber},
textSize: ${textSize},
buttonColor: ${buttonColor},
textColor: ${textColor},
isButtonEnabled: ${isButtonEnabled},
phone: ${phone},
credential: ${credential},
isValid: ${isValid}
    ''';
  }
}
