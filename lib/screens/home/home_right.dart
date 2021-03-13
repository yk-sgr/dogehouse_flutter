import 'package:dogehouse_flutter/components/profile_card.dart';
import 'package:dogehouse_flutter/components/right_header.dart';
import 'package:dogehouse_flutter/components/upcoming_rooms_card.dart';
import 'package:dogehouse_flutter/models/profile_card_model.dart';
import 'package:dogehouse_flutter/resources/palette.dart';
import 'package:flutter/material.dart';

class HomeRight extends StatefulWidget {
  @override
  _HomeRightState createState() => _HomeRightState();
}

class _HomeRightState extends State<HomeRight> {
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
            title: RightHeader(),
            centerTitle: true,
            floating: true,
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: ProfileCard(ProfileCardModel.testData()),
          ),
          SliverToBoxAdapter(
            child: UpcomingRoomsCard(),
          ),
        ],
      ),
    );
  }
}
