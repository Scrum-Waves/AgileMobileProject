import 'package:flutter/material.dart';

import 'createPost.dart';
/*import 'package:stafford_county_medications/model/medication_list.dart';
import 'package:stafford_county_medications/ui/home_page.dart';*/

class SocialmediaRow extends StatelessWidget {
  final socialmedia;
  SocialmediaRow(this.socialmedia);

  /*final Medication medication;
  final Medication amountGiven;*/

  /*MedicationRow(this.medication);*/

  @override
  Widget build(BuildContext context) {
    final socialMediaCardContent = Container(
      margin: EdgeInsets.all(16.0),
      constraints: BoxConstraints.expand(),
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(socialmedia[1], height: 70.0),
                /*SizedBox(width: 5.0),
                Text(socialmedia[0],
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.black54)),*/
              ],
            ),
            SizedBox(height: 5.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                /*Text('Amount to give:'),
                Text(/*amountGiven.toString()*/ socialmedia[0]),*/

                Text(socialmedia[0],
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 27,
                        color: Colors.black54)),
              ],
            ),
          ],
        ),
      ),
    );

    final socialMediaCard = Container(
      child: socialMediaCardContent,
      height: 140.0,
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
    );

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                CreatePost(socialMedia: socialmedia[0] ?? "Error "),
          ),
        );
      },
      child: Container(
        height: 160.0,
        margin: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            socialMediaCard,
          ],
        ),
      ),
    );
  }
}
