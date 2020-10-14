import 'package:acaziaassignmentclient/data/models/user.dart';
import 'package:acaziaassignmentclient/presentation/pages/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'infor_widget.dart';

class PresentCard extends StatelessWidget {
  Person person;

  PresentCard(this.person);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Dismissible(
      key: UniqueKey(),
      crossAxisEndOffset: -0.3,
      onDismissed: (DismissDirection direction) {
        if (direction == DismissDirection.endToStart) {
          BlocProvider.of<HomeBloc>(context)
              .add(DismissPersonOnPressEvent(person));
        } else {
          BlocProvider.of<HomeBloc>(context)
              .add(SavePersonOnPressEvent(person));
        }
      },
      child: Card(
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
            borderRadius: BorderRadius.circular(20),
          ),
          child: InfoWidget(person),
        ),
      ),
    );
  }
}
