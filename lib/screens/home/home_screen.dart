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
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: _size.width <= 1100 ? Drawer(child: HomeLeft()) : null,
      endDrawer: _size.width <= 693 ? Drawer(child: HomeRight()) : null,
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
        mobile: HomeCenter(),
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
    );
  }
}
