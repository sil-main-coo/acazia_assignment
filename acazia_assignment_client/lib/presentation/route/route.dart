import 'package:acaziaassignmentclient/presentation/pages/favorite/favorite_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:acaziaassignmentclient/data/models/models.dart';

RouteFactory router() {
  return (RouteSettings settings) {
    Widget screen;

    // todo:  add screen route here
    switch (settings.name) {
      case '/favorites':
        List<Person> favoritePeople = settings.arguments;
        screen = FavoriteView(people: favoritePeople);
        break;
    }

    return CupertinoPageRoute(
      builder: (context) {
        return screen;
      },
    );
  };
}
