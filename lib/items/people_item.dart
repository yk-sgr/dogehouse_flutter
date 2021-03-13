import 'package:dogehouse_flutter/resources/palette.dart';
import 'package:flutter/material.dart';

class PeopleItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          height: 50,
          child: Row(
            children: [
              Container(
                height: 50.0,
                width: 50.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage('https://avatars.githubusercontent.com/u/7872329?s=400&u=f41fcb80dc9ce32a809caf9a6c4d9bf31c6ae11a&v=4'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Lauren Miller',
                      style: TextStyle(color: Palette.lightWhite, fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 1),
                      child: Text(
                        'The Developers',
                        style: TextStyle(color: Palette.lightBlue, fontWeight: FontWeight.bold, fontSize: 13),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
