import 'package:dogehouse_flutter/items/people_item.dart';
import 'package:dogehouse_flutter/resources/palette.dart';
import 'package:flutter/material.dart';

class HomeLeft extends StatefulWidget {
  @override
  _HomeLeftState createState() => _HomeLeftState();
}

class _HomeLeftState extends State<HomeLeft> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Palette.scaffoldBackgroundColor,
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: false,
            actions: [Container()],
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            title: Container(
                width: double.infinity,
                height: 40,
                child: Row(
                  children: [
                    SizedBox(width: 20),
                    Text(
                      'DogeHouse',
                      style: TextStyle(color: Palette.primaryColor, fontSize: 25),
                    ),
                  ],
                )),
            centerTitle: true,
            floating: true,
            pinned: true,
          ),
          SliverAppBar(
            automaticallyImplyLeading: false,
            actions: [Container()],
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'People',
                      style: TextStyle(color: Palette.lightWhite),
                    ),
                    Spacer(),
                  ],
                ),
                Text(
                  'ONLINE (23)',
                  style: TextStyle(color: Palette.lightBlue, fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ],
            ),
            centerTitle: true,
            floating: true,
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return PeopleItem();
              },
              childCount: 10,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'Show more',
                style: TextStyle(color: Palette.lightBlue, fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
          )
        ],
      ),
    );
  }
}
