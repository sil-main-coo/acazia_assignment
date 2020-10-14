import 'package:acaziaassignmentclient/di_containter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:acaziaassignmentclient/app.dart';
import 'core/app_bloc/simple_bloc_delegate.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  await setUpLocator();
  runApp(MyApp());
}
