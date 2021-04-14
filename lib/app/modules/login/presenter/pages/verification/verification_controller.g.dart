// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verification_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $VerificationController = BindInject(
  (i) => VerificationController(i<VerifyPhoneCode>(), i<AuthStore>(),
      verificationId: i.args.params['verificationId']),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$VerificationController on ControllerBase, Store {
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

  final _$codeAtom = Atom(name: 'ControllerBase.code');

  @override
  String get code {
    _$codeAtom.reportRead();
    return super.code;
  }

  @override
  set code(String value) {
    _$codeAtom.reportWrite(value, super.code, () {
      super.code = value;
    });
  }

  final _$ControllerBaseActionController =
      ActionController(name: 'ControllerBase');

  @override
  dynamic setCode(String value) {
    final _$actionInfo = _$ControllerBaseActionController.startAction(
        name: 'ControllerBase.setCode');
    try {
      return super.setCode(value);
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
code: ${code},
credential: ${credential},
isValid: ${isValid}
    ''';
  }
}
