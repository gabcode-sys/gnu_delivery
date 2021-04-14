import 'package:flutter/material.dart';
import 'package:gnu_delivery/app/utils/theme/color_theme.dart';

class OnBoardTab extends StatefulWidget {
  final String title;
  final String description;
  const OnBoardTab({Key key, @required this.title, @required this.description})
      : super(key: key);

  @override
  _OnBoardTabState createState() => _OnBoardTabState();
}

class _OnBoardTabState extends State<OnBoardTab> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: double.infinity,
          height: 140,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 300,
                child: Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 26.0,
                    fontWeight: FontWeight.bold,
                    color: UIThemeColors.blackTheme,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                width: 230,
                child: Text(
                  widget.description,
                  style: TextStyle(
                    color: UIThemeColors.greyTheme,
                    fontSize: 12.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
