import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gnu_delivery/app/utils/theme/color_theme.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'verification_controller.dart';

class Verification extends StatefulWidget {
  @override
  _VerificationState createState() => _VerificationState();
}

class _VerificationState
    extends ModularState<Verification, VerificationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(15),
          height: MediaQuery.of(context).size.height / 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: UIThemeColors.whiteTheme,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 5),
                      blurRadius: 4,
                      spreadRadius: 2,
                      color: Colors.grey.shade200,
                    ),
                  ],
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_rounded,
                    size: 15,
                    color: UIThemeColors.blackTheme,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Text(
                'Digite o código enviado para o seu celular',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Nós enviamos o código para o número +55 (27) x xxxx-xxxx',
                style: TextStyle(
                  fontSize: 12.0,
                  color: UIThemeColors.greyTheme,
                ),
              ),
              PinCodeTextField(
                showCursor: false,
                autoDismissKeyboard: true,
                appContext: context,
                length: 6,
                obscureText: false,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 40,
                    activeFillColor: Colors.grey.shade200,
                    disabledColor: Colors.grey.shade200,
                    inactiveColor: Colors.grey.shade200,
                    inactiveFillColor: Colors.grey.shade200,
                    selectedFillColor: Colors.grey.shade300,
                    selectedColor: Colors.grey.shade300,
                    borderWidth: 0.0),
                animationDuration: Duration(milliseconds: 300),
                backgroundColor: Colors.transparent,
                enableActiveFill: true,
                onCompleted: (v) {
                  // ignore: unnecessary_statements
                  controller.isValid
                      ? controller.enterCode(context)
                      : null; //null =>
                },
                onChanged: (value) {
                  controller.setCode(value);
                },
                beforeTextPaste: (text) {
                  // Formato de colagem errado, etc.
                  return true;
                },
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: Text(
            'Reenviando código em 00:58',
            style: TextStyle(
              color: UIThemeColors.greyTheme,
            ),
          ),
        ),
      ),
    );
  }
}
