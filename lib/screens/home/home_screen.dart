import 'package:dogehouse_flutter/resources/palette.dart';
import 'package:dogehouse_flutter/utils/responsive.dart';
import 'package:flutter/material.dart';

import 'home_center.dart';
import 'home_left.dart';
import 'home_right.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  PageController pageController = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        drawer: _size.width <= 1100 ? Drawer(child: HomeLeft()) : null,
        bottomNavigationBar: _size.width <= 693
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: Palette.separateLine,
                  ),
                  bottomNavBar(),
                ],
              )
            : null,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(30.0),
          child: AppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
            automaticallyImplyLeading: false,
            actions: [Container()],
          ),
        ),
        body: Responsive(
          mobile: PageView(
            controller: pageController,
            physics: NeverScrollableScrollPhysics(),
            children: [
              HomeCenter(),
              HomeLeft(),
              HomeRight(),
            ],
          ),
          tablet: Row(
            children: [
              Expanded(
                flex: _size.width > 864 ? 5 : 5,
                child: HomeCenter(),
              ),
              Expanded(
                flex: _size.width > 781 ? 4 : 5,
                child: HomeRight(),
              ),
            ],
          ),
          desktop: Row(
            children: [
              Expanded(
                flex: _size.width > 1398 ? 2 : 2,
                child: HomeLeft(),
              ),
              Expanded(
                flex: _size.width > 1183 ? 6 : 5,
                child: HomeCenter(),
              ),
              Expanded(
                flex: _size.width > 1398 ? 3 : 4,
                child: HomeRight(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomNavBar() {
    final List<BottomNavigationBarItem> items = [
      BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: currentIndex == 0 ? Palette.primaryColor : Palette.lightWhite,
          ),
          label: 'Feed'),
      BottomNavigationBarItem(
          icon: Icon(
            Icons.people,
            color: currentIndex == 1 ? Palette.primaryColor : Palette.lightWhite,
          ),
          label: 'People'),
      BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            color: currentIndex == 2 ? Palette.primaryColor : Palette.lightWhite,
          ),
          label: 'Profile'),
    ];

    return BottomNavigationBar(
      items: items,
      onTap: (int index) {
        currentIndex = index;
        pageController.jumpToPage(index);
        setState(() {});
      },
      currentIndex: currentIndex,
      iconSize: 24.0,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
      selectedFontSize: 0.0,
      type: BottomNavigationBarType.fixed,
      elevation: 18.0,
      backgroundColor: Palette.backgroundColor,
    );
  }
}
