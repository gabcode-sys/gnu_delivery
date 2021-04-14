import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gnu_delivery/app/utils/theme/color_theme.dart';

class GeneralErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height / 1.8,
            width: MediaQuery.of(context).size.width / 1.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  CupertinoIcons.xmark,
                  color: UIThemeColors.greyTheme,
                  size: 50.0,
                ),
                Text(
                  'Tivemos um problema ao identificar o seu dispositivo',
                  textAlign: TextAlign.center,
                ),
                Text('Tente novamente mais tarde', textAlign: TextAlign.center),
                IconButton(
                  onPressed: () {
                    Modular.to.pop();
                  },
                  icon: Icon(
                    CupertinoIcons.arrow_left,
                    size: 40.0,
                    color: UIThemeColors.orangeTheme,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
