import 'package:acaziaassignmentclient/di_containter.dart';
import 'package:acaziaassignmentclient/presentation/pages/home/bloc/home_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:acaziaassignmentclient/data/models/models.dart';

/// This is unaccomplished ....

void main() {
  HomeBloc homeBloc;
  setUp(() {
    homeBloc = HomeBloc(locator());
  });

  tearDown(() {
    homeBloc?.close();
  });

//  test('initial is correct', () {
//    expect(HomeLoadingState(), homeBloc.initialState);
//  });
}
