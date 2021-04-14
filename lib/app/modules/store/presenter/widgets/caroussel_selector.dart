import 'package:flutter/material.dart';
import 'package:gnu_delivery/app/utils/theme/color_theme.dart';

class CarousselSelector {
  BuildContext context;

  Widget item({
    @required bool colorIndex,
    @required VoidCallback onPressed,
    @required Color onSelectedColor,
    @required Color notSelectedColor,
    @required String categoryText,
    Icon icon,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: colorIndex ? onSelectedColor : notSelectedColor,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              categoryText,
              style: TextStyle(
                fontSize: 12.0,
                color: UIThemeColors.blackTheme,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
