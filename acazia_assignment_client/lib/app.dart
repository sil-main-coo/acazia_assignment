import 'package:acaziaassignmentclient/di_containter.dart';

import 'package:acaziaassignmentclient/presentation/pages/home/bloc/home_bloc.dart';
import 'package:acaziaassignmentclient/presentation/pages/home/home_view.dart';
import 'package:acaziaassignmentclient/presentation/route/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Acazia Assignment',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      onGenerateRoute: router(),
      home: BlocProvider(
          create: (context) => locator<HomeBloc>()..add(GetAllPersonsEvent()),
          child: HomeView()),
    );
  }
}
