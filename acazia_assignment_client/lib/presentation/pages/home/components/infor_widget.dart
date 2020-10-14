import 'package:acaziaassignmentclient/data/models/models.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InfoWidget extends StatefulWidget {
  final Person person;

  InfoWidget(this.person);

  @override
  _InfoWidgetState createState() => _InfoWidgetState();
}

class _InfoWidgetState extends State<InfoWidget> {
  int indexPage = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Column(
          children: <Widget>[
            Expanded(
              flex: 27,
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xfff9f9f9),
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20.0))),
                alignment: Alignment.bottomCenter,
                child: Divider(
                  height: 0,
                  color: Colors.black26,
                  thickness: ScreenUtil().setWidth(1),
                ),
              ),
            ),
            Expanded(
              flex: 73,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(20.0))),
              ),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(30)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                height: ScreenUtil().setHeight(150),
                width: ScreenUtil().setHeight(150),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: Colors.black26,
                        width: ScreenUtil().setWidth(1.5)),
                    color: Colors.white),
                padding: EdgeInsets.all(5),
                child: Container(
                    height: ScreenUtil().setHeight(128),
                    width: ScreenUtil().setHeight(128),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image:
                              NetworkImage("${widget.person.picture.large}")),
                    )),
              ),
              _personTabWidget(widget.person),
              BottomNavigationBar(
                currentIndex: indexPage,
                iconSize: ScreenUtil().setHeight(32),
                elevation: 0,
                backgroundColor: Colors.transparent,
                selectedItemColor: Colors.green,
                unselectedItemColor: Colors.black26,
                type: BottomNavigationBarType.fixed,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(FontAwesomeIcons.user), title: new Text('')),
                  BottomNavigationBarItem(
                      icon: Icon(FontAwesomeIcons.envelope),
                      title: new Text('')),
                  BottomNavigationBarItem(
                      icon: Icon(FontAwesomeIcons.calendarAlt),
                      title: new Text('')),
                  BottomNavigationBarItem(
                      icon: Icon(FontAwesomeIcons.mapMarkedAlt),
                      title: new Text('')),
                  BottomNavigationBarItem(
                      icon: Icon(FontAwesomeIcons.phoneAlt),
                      title: new Text('')),
                  BottomNavigationBarItem(
                      icon: Icon(FontAwesomeIcons.lock), title: new Text(''))
                ],
                onTap: (index) {
                  setState(() {
                    indexPage = index;
                  });
                },
              )
            ],
          ),
        )
      ],
    );
  }

  _personTabWidget(Person person) {
    switch (indexPage) {
      case 0:
        return AutoSizeText.rich(
          TextSpan(
              text: 'Hi, My name is\n',
              style: TextStyle(
                  color: Colors.black26, fontSize: ScreenUtil().setSp(18)),
              children: [
                TextSpan(
                    text: '${person.name.getFullName()}',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: ScreenUtil().setSp(38)))
              ]),
          textAlign: TextAlign.center,
        );
      case 1:
        return AutoSizeText.rich(
          TextSpan(
              text: 'My email address is\n',
              style: TextStyle(
                  color: Colors.black26, fontSize: ScreenUtil().setSp(18)),
              children: [
                TextSpan(
                    text: '${person.email}',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: ScreenUtil().setSp(38)))
              ]),
          maxLines: 3,
          textAlign: TextAlign.center,
        );
      case 2:
        return RichText(
          text: TextSpan(
              text: 'My Birthday is\n',
              style: TextStyle(
                  color: Colors.black26, fontSize: ScreenUtil().setSp(18)),
              children: [
                TextSpan(
                    text: '${person.dob.date}',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: ScreenUtil().setSp(38)))
              ]),
          textAlign: TextAlign.center,
        );
      case 3:
        return RichText(
          text: TextSpan(
              text: 'My address is\n',
              style: TextStyle(
                  color: Colors.black26, fontSize: ScreenUtil().setSp(18)),
              children: [
                TextSpan(
                    text: '${person.location.street.getAddress()}',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: ScreenUtil().setSp(38)))
              ]),
          textAlign: TextAlign.center,
        );
      case 4:
        return RichText(
          text: TextSpan(
              text: 'My phone number is\n',
              style: TextStyle(
                  color: Colors.black26, fontSize: ScreenUtil().setSp(18)),
              children: [
                TextSpan(
                    text: '${person.phone}',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: ScreenUtil().setSp(32)))
              ]),
          textAlign: TextAlign.center,
        );
      case 5:
        return RichText(
          text: TextSpan(
              text: 'My password is\n',
              style: TextStyle(
                  color: Colors.black26, fontSize: ScreenUtil().setSp(18)),
              children: [
                TextSpan(
                    text: '${person.login.password}',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: ScreenUtil().setSp(38)))
              ]),
          textAlign: TextAlign.center,
        );
    }
  }
}
