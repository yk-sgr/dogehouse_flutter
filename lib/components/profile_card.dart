import 'package:dogehouse_flutter/models/profile_card_model.dart';
import 'package:dogehouse_flutter/resources/palette.dart';
import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final ProfileCardModel profileCardModel;

  ProfileCard(this.profileCardModel);

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
              Row(
                children: [
                  Stack(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 25, top: 25),
                        child: Container(
                          height: 100.0,
                          width: 100.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(profileCardModel.profilePicUrl),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          profileCardModel.name,
                          style: TextStyle(color: Color(0xFFdee3ea), fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        Text(
                          profileCardModel.username,
                          style: TextStyle(color: Palette.lightBlue, fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10, right: 5),
                              child: Material(
                                color: Colors.transparent,
                                child: Ink(
                                  decoration: BoxDecoration(
                                    color: Palette.darkBlue,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(8.0),
                                    onTap: () {},
                                    child: Container(
                                      width: 30,
                                      height: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10, right: 5),
                              child: Material(
                                color: Colors.transparent,
                                child: Ink(
                                  decoration: BoxDecoration(
                                    color: Palette.darkBlue,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(8.0),
                                    onTap: () {},
                                    child: Container(
                                      width: 30,
                                      height: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10, right: 5),
                              child: Material(
                                color: Colors.transparent,
                                child: Ink(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(8.0),
                                    onTap: () {},
                                    child: Container(
                                      width: 30,
                                      height: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 15),
                  child: RichText(
                    text: TextSpan(
                      text: '${profileCardModel.followers} ',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'followers',
                          style: TextStyle(color: Palette.lightBlue, fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        TextSpan(
                          text: '       ',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        TextSpan(
                          text: '${profileCardModel.following} ',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        TextSpan(
                          text: 'following',
                          style: TextStyle(color: Palette.lightBlue, fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ],
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 15),
                child: Text(
                  profileCardModel.description,
                  style: TextStyle(color: Palette.lightBlue, fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 20),
                child: InkWell(
                  onTap: () {},
                  child: Text(
                    profileCardModel.url,
                    style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
