import 'package:dogehouse_flutter/resources/palette.dart';
import 'package:flutter/material.dart';

class UpcomingRoomsItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'TODAY 1:30 PM',
                  style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    'Live with u/DeepFuckingValue',
                    style: TextStyle(color: Palette.lightWhite, fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        Container(
                          height: 25.0,
                          width: 25.0,
                          //   margin: EdgeInsets.only(left: 12.0, top: 14.0, right: 16.0, bottom: 10.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  'https://avatars.githubusercontent.com/u/7872329?s=400&u=f41fcb80dc9ce32a809caf9a6c4d9bf31c6ae11a&v=4'),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            'Doug Tery',
                            style: TextStyle(color: Palette.lightBlue, fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: 1,
          color: Palette.separateLine,
        ),
      ],
    );
  }
}
