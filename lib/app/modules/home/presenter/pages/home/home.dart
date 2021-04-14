import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:gnu_delivery/app/modules/home/presenter/pages/favorite/favorite.dart';
import 'package:gnu_delivery/app/modules/home/presenter/pages/more_searched/more_searched.dart';
import 'package:gnu_delivery/app/modules/home/presenter/pages/user/user.dart';
import 'package:gnu_delivery/app/utils/theme/color_theme.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey _bottomNavigationKey = GlobalKey();
  PageController pageController;
  int currentTab;
  @override
  void initState() {
    super.initState();
    currentTab = 0;
    pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        animationCurve: Curves.easeInExpo,
        animationDuration: Duration(milliseconds: 200),
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: UIThemeColors.whiteTheme,
        items: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(
              Icons.restaurant_rounded,
              size: 20,
              color: currentTab == 0
                  ? UIThemeColors.orangeTheme
                  : UIThemeColors.greyTheme,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(
              Icons.favorite,
              size: 20,
              color: currentTab == 1
                  ? UIThemeColors.orangeTheme
                  : UIThemeColors.greyTheme,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(
              Icons.shopping_bag_rounded,
              size: 20,
              color: currentTab == 2
                  ? UIThemeColors.orangeTheme
                  : UIThemeColors.greyTheme,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(
              Icons.person_rounded,
              size: 20,
              color: currentTab == 3
                  ? UIThemeColors.orangeTheme
                  : UIThemeColors.greyTheme,
            ),
          ),
        ],
        onTap: (index) {
          setState(() {
            currentTab = index;
            pageController.jumpToPage(index);
          });
        },
      ),
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          MoreSearched(),
          Favorite(),
          Text(''),
          User(),
        ],
      ),
    );
  }
}
