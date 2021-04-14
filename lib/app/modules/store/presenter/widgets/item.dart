import 'package:flutter/material.dart';
import 'package:gnu_delivery/app/utils/theme/color_theme.dart';

class Item {
  Widget product({
    @required Widget image,
    @required String name,
    @required double volume,
    @required String measurementUnit,
    @required double price,
    @required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: UIThemeColors.whiteTheme,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade100,
              offset: Offset(0, 0),
              blurRadius: 20.0,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 110.0,
              width: 120.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: image,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              name,
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              volume.toString() + ' ' + measurementUnit,
              style: TextStyle(
                color: UIThemeColors.greyTheme,
                fontSize: 12.0,
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              height: 35.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Text(
                'R\$ ' + price.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
