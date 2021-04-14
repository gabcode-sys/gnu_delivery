import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gnu_delivery/app/modules/login/presenter/pages/number_sign_up/number_signup_controller.dart';

class NumberSignUp extends StatefulWidget {
  @override
  _NumberSignUpState createState() => _NumberSignUpState();
}

class _NumberSignUpState
    extends ModularState<NumberSignUp, NumberSignUpController> {
  @override
  void initState() {
    super.initState();
  }

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
                  color: Color(0xFFFFFFFF),
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
                    color: Color(0xFF03041D),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Text(
                'Digite o seu número de celular',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Nós iremos mandar um código de confirmação para este número',
                style: TextStyle(
                  fontSize: 12.0,
                  color: Color(0xFFBEBEC7),
                ),
              ),
              TextField(
                style: TextStyle(fontSize: 22.0, color: Color(0xFF03041D)),
                controller: controller.textEditingControllerNumber,
                inputFormatters: [controller.maskFormatterNumber],
                keyboardType: TextInputType.number,
                onChanged: (_) {
                  controller.validatedInput();
                  controller.setPhone();
                },
                decoration: InputDecoration(
                  hintText: '+55 (DD) X XXXX-XXXX',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  hintStyle:
                      TextStyle(fontSize: 22.0, color: Color(0xFFBEBEC7)),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: Observer(builder: (_) {
            return FlatButton(
              color: controller.buttonColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              onPressed: () {
                controller.isValid ? controller.enterPhone(context) : null;
              },
              child: Text(
                'Próximo',
                style: TextStyle(
                  color: controller.textColor,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
