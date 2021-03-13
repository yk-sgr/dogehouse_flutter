import 'package:dogehouse_flutter/components/style_button.dart';
import 'package:dogehouse_flutter/resources/palette.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Your feed',
          style: TextStyle(color: Palette.lightWhite),
        ),
        Spacer(),
        StyleButton(
          onTap: () {},
          width: 150,
          height: 40,
          child: Center(
            child: Text(
              'New Room',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ),
      ],
    );
  }
}
