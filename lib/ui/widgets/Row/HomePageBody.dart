import 'package:flutter/material.dart';

import '../../../global/constants/assets/assets_path.dart';
import 'socialmadia_row.dart';
/*import 'package:stafford_county_medications/ui/medication_row.dart';
import 'package:stafford_county_medications/model/medication_list.dart';*/

class HomePageBody extends StatelessWidget {
  List SocialMedia = [
    ["Facebook", Assets.assetsFacebook],
    ["Instagram", Assets.assetsInstagram],
    ["Twitter", Assets.assetsTwitter],
    ["LinkedIn", Assets.assetsLinkedIn],
    /*["Snapchat", "assets/images/snap.jpg"],
    ["Pinterest", "assets/images/pint.jpg"],
    ["Tumblr", "assets/images/tumb.jpg"],
    ["Reddit", "assets/images/redd.jpg"],
    ["Flickr", "assets/images/flic.jpg"],
    ["Google+", "assets/images/goo.jpg"],
    ["Vine", "assets/images/vine.jpg"],
    ["Meetup", "assets/images/meet.jpg"],
    ["Ask.fm", "assets/images/ask.jpg"],
    ["Classmates", "assets/images/clas.jpg"],
    ["MeetMe", "assets/images/meetme.jpg"],
    ["Meetup", "assets/images/meet.jpg"],
    ["Ask.fm", "assets/images/ask.jpg"],
    ["Classmates", "assets/images/clas.jpg"],
    ["MeetMe", "assets/images/meetme.jpg"],*/
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: <Widget>[
            SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              sliver: SliverFixedExtentList(
                itemExtent: 172.0,
                delegate: SliverChildBuilderDelegate(
                  (context, index) => /*new MedicationRow(medications[index])*/
                      SocialmediaRow(SocialMedia[index]),
                  childCount: /*medications*/
                      SocialMedia.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
