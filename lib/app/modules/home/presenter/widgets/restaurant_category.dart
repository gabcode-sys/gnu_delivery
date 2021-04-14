import 'package:flutter/material.dart';

class RestaurantCategory {
  BuildContext context;

  Widget category({
    @required bool colorIndex,
    @required VoidCallback onPressed,
    @required Color onSelectedColor,
    @required Color notSelectedColor,
    @required String categoryText,
    Widget image,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 110.0,
        width: 70.0,
        margin: const EdgeInsets.only(
            left: 5.0, right: 5.0, top: 10.0, bottom: 10.0),
        decoration: BoxDecoration(
          color: colorIndex ? onSelectedColor : notSelectedColor,
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 60.0,
              padding: const EdgeInsets.all(18.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                  bottomLeft: Radius.circular(40.0),
                  bottomRight: Radius.circular(40.0),
                ),
                color: colorIndex ? Color(0xFFFFFFFF) : Colors.grey.shade100,
              ),
              child: image,
            ),
            Text(
              categoryText,
              style: TextStyle(
                color: colorIndex ? Color(0xFFFFFFFF) : Color(0xFF03041D),
                fontSize: 12.0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}
