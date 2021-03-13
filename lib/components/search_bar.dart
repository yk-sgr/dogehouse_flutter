import 'package:dogehouse_flutter/resources/palette.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        color: Palette.darkBlue,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(8.0),
        onTap: () {},
        child: Container(
            width: double.infinity,
            height: 40,
            child: Row(
              children: [
                SizedBox(width: 20),
                Icon(
                  Icons.search,
                  color: Palette.lightBlue,
                ),
                SizedBox(width: 20),
                Flexible(
                  child: Text(
                    'Search for rooms, users or categories',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Palette.lightBlue, fontSize: 15),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
