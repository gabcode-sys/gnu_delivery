import 'package:flutter/material.dart';
import 'package:gnu_delivery/app/modules/onboarding/presenter/notifiers/notifier.dart';
import 'package:gnu_delivery/app/modules/onboarding/presenter/widgets/onboard_tab.dart';
import 'package:gnu_delivery/app/utils/theme/color_theme.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

class OnBoard extends StatefulWidget {
  @override
  _OnBoardState createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> with SingleTickerProviderStateMixin {
  PageController _pageController = PageController(initialPage: 0);

  final int _numPages = 3;
  int _currentPage = 0;
  List image = [
    'assets/images/onboardone.png',
    'assets/images/onboardtwo.jpg',
    'assets/images/onboardthree.jpg'
  ];

  Animation<double> animation;
  AnimationController controller;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      height: 6.0,
      width: isActive ? 10.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? UIThemeColors.orangeTheme : Colors.grey[300],
        borderRadius: BorderRadius.all(Radius.circular(500)),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(hours: 2));

    animation = Tween<double>(begin: 0, end: 360).animate(controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PageNotifier(_pageController),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0),
              ),
              onPressed: () {
                Navigator.pushNamed(context, 'login_module');
              },
              child: Text(
                'Pular',
                style: TextStyle(
                  color: UIThemeColors.orangeTheme,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: UIThemeColors.whiteTheme,
        body: Stack(
          children: [
            Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(10),
                  color: UIThemeColors.whiteTheme,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Consumer<PageNotifier>(
                        builder: (context, notifier, child) {
                          return Transform.rotate(
                            angle:
                                math.max(0, (math.pi / 5) * 10 * notifier.page),
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: UIThemeColors.whiteTheme,
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0, 0),
                                        blurRadius: 1,
                                        color: Colors.grey.shade200)
                                  ]),
                              child: Container(
                                height: 220,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: UIThemeColors.whiteTheme,
                                  image: DecorationImage(
                                    image: AssetImage(image[_currentPage]),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      Transform.rotate(
                        angle: animation.value,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          height: 250,
                          width: 250,
                          child: Stack(
                            children: [
                              Positioned(
                                right: 120,
                                top: 160,
                                child: CircleAvatar(
                                  radius: 15,
                                  backgroundColor: UIThemeColors.orangeTheme,
                                  backgroundImage: NetworkImage(
                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcT0YTwo4yqELiO2A603hN3xTBXhrAqsJMyA&usqp=CAU',
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 200,
                                top: 130,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: UIThemeColors.whiteTheme,
                                    shape: BoxShape.circle,
                                  ),
                                  child: CircleAvatar(
                                    radius: 25,
                                    backgroundColor: UIThemeColors.orangeTheme,
                                    backgroundImage: NetworkImage(
                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoUfh4ag5RWHEsKjQUKzl-WJLJ8jGtX77Esw&usqp=CAU'),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 40,
                                right: 20,
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: UIThemeColors.whiteTheme,
                                  ),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.pink,
                                    backgroundImage: NetworkImage(
                                        'https://3.bp.blogspot.com/-E49-JIlGo6Q/WOEx9zQX4wI/AAAAAAAAR2s/Z9xIac_2bPsDMD6lz-jE_aj2eE94DldIACLcB/s1600/leite-mo%25C3%25A7a-3.jpg'),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 50,
                                right: 80,
                                child: Container(
                                  padding: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: UIThemeColors.whiteTheme,
                                  ),
                                  child: CircleAvatar(
                                    radius: 10,
                                    backgroundColor: UIThemeColors.orangeTheme,
                                    backgroundImage: NetworkImage(
                                        'https://i.pinimg.com/originals/5e/78/db/5e78dba6e46cf3b49d024d26df157730.jpg'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: PageView(
                    controller: _pageController,
                    physics: BouncingScrollPhysics(),
                    onPageChanged: (int index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    children: <Widget>[
                      OnBoardTab(
                        title: 'Os seus restaurantes preferidos',
                        description:
                            'Faça seus pedidos nos melhores restaurantes locais com entrega fácil sob demanda',
                      ),
                      OnBoardTab(
                        title: 'Suporte Gratuito \npara você',
                        description:
                            'Aconteceu alguma coisa? fale com uma pessoa real. Estamos aqui para ajudar',
                      ),
                      OnBoardTab(
                        title: 'Totalmente Confiável \ne Seguro',
                        description:
                            'Fique tranquilo enquanto rastreia seu pedido em tempo real',
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
                Container(
                  height: 170,
                  padding: const EdgeInsets.only(
                      left: 90.0, right: 90.0, top: 50.0, bottom: 60.0),
                  width: MediaQuery.of(context).size.width,
                  child: FlatButton(
                    color: UIThemeColors.orangeTheme,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                    onPressed: () {
                      _currentPage != _numPages - 1
                          ? _pageController.nextPage(
                              duration: Duration(seconds: 1),
                              curve: Curves.ease,
                            )
                          : Navigator.pushNamed(context, 'login_module');
                      ;
                    },
                    child: Text(
                      _currentPage != _numPages - 1 ? 'Próximo' : 'Começar',
                      style: TextStyle(
                        color: UIThemeColors.whiteTheme,
                      ),
                    ),
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
