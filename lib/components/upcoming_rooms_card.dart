import 'package:dogehouse_flutter/items/upcoming_rooms_item.dart';
import 'package:dogehouse_flutter/resources/palette.dart';
import 'package:flutter/material.dart';

class UpcomingRoomsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.circular(8.0),
          ),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Text(
                      'Upcoming rooms',
                      style: TextStyle(color: Palette.lightWhite, fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        color: Palette.darkBlue,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      width: 25,
                      height: 25,
                      child: Icon(Icons.add),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 1,
                color: Palette.separateLine,
              ),
              UpcomingRoomsItem(),
              UpcomingRoomsItem(),
              UpcomingRoomsItem(),
              UpcomingRoomsItem(),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
                  color: Palette.darkBlue,
                ),
                width: double.infinity,
                height: 50,
                child: Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Explore more rooms',
                      style: TextStyle(color: Palette.lightWhite, fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
