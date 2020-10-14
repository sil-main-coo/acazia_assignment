import 'package:acaziaassignmentclient/presentation/pages/home/bloc/home_bloc.dart';
import 'package:acaziaassignmentclient/presentation/pages/home/components/present_card.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:acaziaassignmentclient/data/models/models.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loading/loading.dart';

import 'components/next_card.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(768, 1280));

    return SafeArea(
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoadingState)
            return Container(
                color: Colors.black87,
                child: Loading(
                  color: Colors.white,
                  size: ScreenUtil().setHeight(10),
                ));
          else if (state is HomeSuccessState)
            return Scaffold(
              appBar: _mAppBar(state),
              body: _mBody(state),
            );
          else if (state is HomeFailureState) {
            return Scaffold(
              body: Container(
                color: Colors.black87,
                alignment: Alignment.center,
                child: Text(
                  "Lỗi kết nối",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            );
          } else {
            return Scaffold(
              appBar: _mAppBar(state),
              body: _mBody(state),
            );
          }
        },
      ),
    );
  }

  _mAppBar(HomeSuccessState state) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.black87,
      centerTitle: true,
      actions: <Widget>[
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, '/favorites',
              arguments: state.favoritePeople),
          child: Container(
              margin: const EdgeInsets.all(15.0),
              child: Image.asset(
                'assets/img/ic-wish-list.png',
                height: ScreenUtil().setHeight(18),
              )),
        ),
      ],
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "PERSONS",
            style: TextStyle(
                fontSize: ScreenUtil().setSp(18),
                color: Colors.white,
                letterSpacing: 3.5,
                fontWeight: FontWeight.bold),
          ),
          Container(
            width: ScreenUtil().setHeight(25),
            height: ScreenUtil().setHeight(25),
            alignment: Alignment.center,
            margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(18)),
            child: Text(
              state.people.length.toString(),
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(12), color: Colors.white),
            ),
            decoration:
                BoxDecoration(color: Colors.red, shape: BoxShape.circle),
          )
        ],
      ),
    );
  }

  _mBody(HomeSuccessState state) {
    double initialBottom = 15.0;
    double backCardPosition =
        initialBottom + (state.people.length - 1) * 10 + 10;
    List<Person> allPersonal = state.people;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.black87,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: state.people.length > 0
              ? Stack(
                  alignment: AlignmentDirectional.center,
                  children: allPersonal.map((person) {
                    if (allPersonal.indexOf(person) ==
                        state.people.length - 1) {
                      return PresentCard(
                        person,
                      );
                    } else {
                      backCardPosition = backCardPosition - 10;

                      return NextCard(
                        person,
                      );
                    }
                  }).toList())
              : Text("No Event Left",
                  style: TextStyle(color: Colors.white, fontSize: 50.0)),
        ),
      ],
    );
  }
}
