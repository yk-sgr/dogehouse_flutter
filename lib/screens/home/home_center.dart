import 'package:dogehouse_flutter/components/home_header.dart';
import 'package:dogehouse_flutter/components/search_bar.dart';
import 'package:dogehouse_flutter/items/home_item.dart';
import 'package:dogehouse_flutter/models/home_item_model.dart';
import 'package:dogehouse_flutter/resources/palette.dart';
import 'package:flutter/material.dart';

class HomeCenter extends StatefulWidget {
  @override
  _HomeCenterState createState() => _HomeCenterState();
}

class _HomeCenterState extends State<HomeCenter> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          automaticallyImplyLeading: false,
          actions: [Container()],
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: SearchBar(),
          centerTitle: true,
          floating: true,
          pinned: true,
        ),
        SliverAppBar(
          automaticallyImplyLeading: false,
          actions: [Container()],
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: HomeHeader(),
          centerTitle: true,
          floating: true,
          pinned: false,
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return HomeItem(HomeItemModel.testData2());
            },
            childCount: 2,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              width: double.infinity,
              height: 1,
              color: Palette.separateLine,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return HomeItem(HomeItemModel.testData());
            },
            childCount: 10,
          ),
        )
      ],
    );
  }
}
