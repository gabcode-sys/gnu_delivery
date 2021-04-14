import 'package:flutter/material.dart';

class Store {
  BuildContext context;
  Store({@required this.context})
      : assert(
          context != null,
          'É necessário informar um contexto',
        );

  Widget store({
    @required VoidCallback onPressed,
    @required String image,
    @required int minWaitingTime,
    @required int maxWaitingTime,
    @required String storeTitle,
    @required double avaliation,
    @required List categories,
    @required int priceNivel,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: 170.0,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 0),
                    blurRadius: 8.0,
                    color: Colors.grey.shade300,
                  )
                ],
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      ),
                    ),
                    child: Text(
                      minWaitingTime.toString() +
                          '-' +
                          maxWaitingTime.toString() +
                          'min',
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    storeTitle,
                    style: TextStyle(
                      fontSize: 19.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  width: MediaQuery.of(context).size.width / 1.8,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.star_rounded,
                        color: Color(0xFFFB6E3B),
                        size: 19.0,
                      ),
                      Text(
                        avaliation.toString(),
                        style: TextStyle(
                          fontSize: 12.0,
                        ),
                      ),
                      Container(
                        width: 60,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: categories
                                .map((e) => Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: Colors.grey.shade400,
                                          radius: 2,
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          e.toString(),
                                          style: TextStyle(
                                            fontSize: 12.0,
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                      ],
                                    ))
                                .toList(),
                          ),
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.grey.shade400,
                        radius: 2,
                      ),
                      Text(
                        '\$',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: priceNivel >= 1
                              ? Color(0xFF03041D)
                              : Color(0xFFBEBEC7),
                        ),
                      ),
                      Text(
                        '\$',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: priceNivel >= 2
                              ? Color(0xFF03041D)
                              : Color(0xFFBEBEC7),
                        ),
                      ),
                      Text(
                        '\$',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: priceNivel >= 3
                              ? Color(0xFF03041D)
                              : Color(0xFFBEBEC7),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
