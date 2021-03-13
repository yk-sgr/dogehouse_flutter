import 'package:dogehouse_flutter/components/style_button.dart';
import 'package:flutter/material.dart';

class RightHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(
        width: double.infinity,
        height: 40,
        child: Row(
          children: [
            Icon(Icons.phone_android),
            SizedBox(width: 6),
            Icon(Icons.notification_important),
            SizedBox(width: 6),
            Icon(Icons.beach_access),
            SizedBox(width: 10),
            StyleButton(
              onTap: () {},
              width: 100,
              height: 35,
              child: Center(
                child: Text(
                  'Get Coins',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
            SizedBox(width: 10),
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
            )
          ],
        ));
  }
}
