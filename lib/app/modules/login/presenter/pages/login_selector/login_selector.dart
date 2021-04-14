import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gnu_delivery/app/utils/theme/color_theme.dart';
import 'package:video_player/video_player.dart';

class LoginSelector extends StatefulWidget {
  @override
  _LoginSelectorState createState() => _LoginSelectorState();
}

class _LoginSelectorState extends State<LoginSelector> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset("assets/videos/login.mp4");
    _controller.initialize().then((_) {
      _controller.setLooping(true);
      _controller.setVolume(0.0);
      Timer(Duration(milliseconds: 100), () {
        setState(() {
          _controller.play();
        });
      });
    });
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      body: Stack(
        children: [
          SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: _controller.value.size?.width ?? 0,
                height: _controller.value.size?.height ?? 0,
                child: VideoPlayer(_controller),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 2,
              ),
              Container(
                height: 330,
                padding: const EdgeInsets.all(40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Bem-Vindo ao Gnu Delivery',
                      style: TextStyle(
                        fontSize: 26.0,
                        color: UIThemeColors.whiteTheme,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Peça delivery de uma variedade de restaurantes',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: UIThemeColors.whiteTheme,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: FlatButton(
                        color: UIThemeColors.whiteTheme,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.face),
                            SizedBox(width: 4),
                            Text('Continuar com Facebook')
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: FlatButton(
                        color: UIThemeColors.orangeTheme,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        onPressed: () {
                          Modular.link.pushNamed("/number_sign_up");
                        },
                        child: Text('Continuar com celular'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
