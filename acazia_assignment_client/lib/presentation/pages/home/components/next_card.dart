import 'package:acaziaassignmentclient/data/models/user.dart';
import 'package:flutter/material.dart';
import 'infor_widget.dart';

class NextCard extends StatelessWidget {
  Person person;

  NextCard(this.person);


  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Card(
      color: Colors.white,
      elevation: 3.0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Container(
        alignment: Alignment.center,
        width: screenSize.width * 0.9,
        height: screenSize.height / 1.7,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: InfoWidget(person),
      ),
    );
  }
}
