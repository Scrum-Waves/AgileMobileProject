import 'package:flutter/material.dart';
/*import 'package:stafford_county_medications/model/medication_list.dart';
import 'package:stafford_county_medications/ui/home_page.dart';*/

class MedicationRow extends StatelessWidget {
  String socialmedia;
  MedicationRow(this.socialmedia);

  /*final Medication medication;
  final Medication amountGiven;*/

  /*MedicationRow(this.medication);*/

  @override
  Widget build(BuildContext context) {
    final medicationCardContent = Container(
      margin: EdgeInsets.all(16.0),
      constraints: BoxConstraints.expand(),
      child: Container(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Image.asset('assets/images/SocialMedia/fcb.jpg',
                            height: 30.0),
                        SizedBox(width: 5.0),
                        Text('Medication:',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(height: 5.0),
                    Text(/*medication.name*/ socialmedia),
                    SizedBox(height: 5.0),
                    Text(/*medication.name2*/ socialmedia),
                    SizedBox(height: 5.0),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Image.asset('assets/images/SocialMedia/fcb.jpg',
                            height: 30.0),
                        SizedBox(width: 5.0),
                        Text(
                          'Dosage:',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.0),
                    Text(/*medication.dosage*/ socialmedia,
                        overflow: TextOverflow.ellipsis),
                    SizedBox(height: 5.0),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text('Amount to give:'),
                Text(/*amountGiven.toString()*/ socialmedia),
              ],
            ),
          ],
        ),
      ),
    );

    final medicationCard = Container(
      child: medicationCardContent,
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

    return Container(
      height: 140.0,
      margin: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          medicationCard,
        ],
      ),
    );
  }
}
