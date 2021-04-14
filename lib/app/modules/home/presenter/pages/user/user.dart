import 'package:flutter/material.dart';
import 'package:gnu_delivery/app/modules/home/presenter/widgets/userGeneralOption.dart';
import 'package:gnu_delivery/app/utils/theme/color_theme.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class User extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserGeneralOption _userGeneralOption = UserGeneralOption(context: context);

    return SlidingUpPanel(
        minHeight: MediaQuery.of(context).size.height / 2.4,
        maxHeight: MediaQuery.of(context).size.height / 1.8,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 25.0,
            color: Colors.grey.shade200,
            offset: Offset(0, -1),
          )
        ],
        panel: Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Geral",
                style: TextStyle(
                  color: UIThemeColors.greyTheme,
                  fontSize: 12.0,
                ),
              ),
              ListView(
                padding: const EdgeInsets.only(top: 6.0, right: 15.0),
                shrinkWrap: true,
                primary: false,
                children: [
                  _userGeneralOption.generalOption(
                    icon: Icon(
                      Icons.delivery_dining,
                      color: UIThemeColors.blackTheme,
                      size: 16.0,
                    ),
                    title: Text(
                      'Meus Pedidos',
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        color: UIThemeColors.blackTheme,
                      ),
                    ),
                  ),
                  _userGeneralOption.generalOption(
                    icon: Icon(
                      Icons.person_rounded,
                      color: UIThemeColors.blackTheme,
                      size: 16.0,
                    ),
                    title: Text(
                      'Configurações do Perfil',
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        color: UIThemeColors.blackTheme,
                      ),
                    ),
                  ),
                  _userGeneralOption.generalOption(
                    icon: Icon(
                      Icons.payments_rounded,
                      color: UIThemeColors.blackTheme,
                      size: 16.0,
                    ),
                    title: Text(
                      'Pagamentos',
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        color: UIThemeColors.blackTheme,
                      ),
                    ),
                  ),
                  _userGeneralOption.generalOption(
                    icon: Icon(
                      Icons.notifications_rounded,
                      color: UIThemeColors.blackTheme,
                      size: 16.0,
                    ),
                    title: Text(
                      'Notificações',
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        color: UIThemeColors.blackTheme,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        header: Container(
          padding: const EdgeInsets.only(top: 8.0),
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Container(
              width: 35.0,
              height: 4.0,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(
                  20.0,
                ),
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  width: MediaQuery.of(context).size.width,
                  child: GestureDetector(
                    onTap: () {
                      // Sair
                    },
                    child: Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: UIThemeColors.whiteTheme,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 20.0,
                            offset: Offset(0, 1),
                            color: Colors.grey.shade100,
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.exit_to_app_rounded,
                        color: UIThemeColors.blackTheme,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 110,
                        width: MediaQuery.of(context).size.width,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            //dark
                            Positioned(
                              width: MediaQuery.of(context).size.width,
                              right: 100.0,
                              top: 20.0,
                              child: Container(
                                height: 8.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: UIThemeColors.orangeTheme,
                                ),
                              ),
                            ),
                            Positioned(
                              width: MediaQuery.of(context).size.width,
                              right: 50.0,
                              top: 80.0,
                              child: Container(
                                height: 6.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: UIThemeColors.orangeTheme,
                                ),
                              ),
                            ),
                            Positioned(
                              width: MediaQuery.of(context).size.width,
                              left: 70.0,
                              top: 8.0,
                              child: Container(
                                height: 5.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: UIThemeColors.orangeTheme,
                                ),
                              ),
                            ),
                            Positioned(
                              width: MediaQuery.of(context).size.width,
                              left: 85.0,
                              top: 45.0,
                              child: Container(
                                height: 6.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: UIThemeColors.orangeTheme,
                                ),
                              ),
                            ),
                            Positioned(
                              width: MediaQuery.of(context).size.width,
                              left: 130.0,
                              top: 30.0,
                              child: Container(
                                height: 4.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: UIThemeColors.orangeTheme,
                                ),
                              ),
                            ),
                            //Light
                            Positioned(
                              width: MediaQuery.of(context).size.width,
                              right: 90.0,
                              top: 80.0,
                              child: Container(
                                height: 7.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: UIThemeColors.orangeThemeLight,
                                ),
                              ),
                            ),
                            Positioned(
                              width: MediaQuery.of(context).size.width,
                              right: 80.0,
                              top: 45.0,
                              child: Container(
                                height: 4.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: UIThemeColors.orangeThemeLight,
                                ),
                              ),
                            ),
                            Positioned(
                              width: MediaQuery.of(context).size.width,
                              right: 60.0,
                              top: 5.0,
                              child: Container(
                                height: 4.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: UIThemeColors.orangeThemeLight,
                                ),
                              ),
                            ),
                            Positioned(
                              width: MediaQuery.of(context).size.width,
                              left: 60.0,
                              top: 75.0,
                              child: Container(
                                height: 5.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: UIThemeColors.orangeThemeLight,
                                ),
                              ),
                            ),
                            Positioned(
                              width: MediaQuery.of(context).size.width,
                              left: 100.0,
                              top: 80.0,
                              child: Container(
                                height: 4.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: UIThemeColors.orangeThemeLight,
                                ),
                              ),
                            ),

                            CustomPaint(
                              size: Size(100, 300),
                              painter: MyPainter(),
                              child: CircleAvatar(
                                radius: 45.0,
                                backgroundImage: NetworkImage(
                                    'https://stcotvfoco.com.br/2020/06/mia-khalifa-1.jpg'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        'Mia Khalifa',
                        style: TextStyle(
                          fontSize: 22.0,
                          color: UIThemeColors.blackTheme,
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Container(
                        height: 30.0,
                        width: 120.0,
                        decoration: BoxDecoration(
                          color: UIThemeColors.whiteTheme,
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 20.0,
                              offset: Offset(0, 1),
                              color: Colors.grey.shade200,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.verified_rounded,
                              size: 18.0,
                              color: UIThemeColors.orangeTheme,
                            ),
                            Text(
                              '2400 Pontos',
                              style: TextStyle(
                                fontSize: 12.0,
                                color: UIThemeColors.blackTheme,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class MyPainter extends CustomPainter {
  //         <-- CustomPainter class
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = UIThemeColors.orangeTheme
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;
    //draw arc
    paint1.strokeCap = StrokeCap.round;
    canvas.drawArc(
        Offset(-6, -6) & Size(102, 102),
        0.9, //radians
        5.4, //radians
        false,
        paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
