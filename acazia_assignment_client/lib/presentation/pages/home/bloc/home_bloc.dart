import 'package:acaziaassignmentclient/data/repositories/repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:acaziaassignmentclient/data/models/models.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final PersonsRepository _repository;

  List<Person> _people = [];
  List<Person> favoritePeople = [];
  int _tabIndex = 0;

  HomeBloc(this._repository) : super(HomeLoadingState());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    // TODO: implement mapEventToState
    if (event is GetAllPersonsEvent) {
      yield* _mapGetAllPersonsToState();
    } else if (event is DismissPersonOnPressEvent) {
      yield* _mapDismissPersonToState(event.person);
    } else if (event is SavePersonOnPressEvent) {
      yield* _mapSavePersonToState(event.person);
    }
  }

  Stream<HomeState> _mapGetAllPersonsToState() async* {
    yield HomeLoadingState();
    final result = await _repository.fetchAllPersonsRepository();
    yield result.fold((failure) => HomeFailureState(),
        (data) => HomeSuccessState(data, this.favoritePeople));
  }

  Stream<HomeState> _mapDismissPersonToState(Person person) async* {
    yield PersonWaitingState();
    final currentState = state;
    if (currentState is HomeSuccessState) {
      final newPeople = currentState.people..remove(person);
      if (newPeople.length == 0) {
        yield* _mapGetAllPersonsToState();
      }

      yield currentState.copyWith(
          people: newPeople, favoritePeople: this.favoritePeople);
    }
  }

  Stream<HomeState> _mapSavePersonToState(Person person) async* {
    yield PersonWaitingState();
    final currentState = state;
    if (currentState is HomeSuccessState) {
      final newPeople = currentState.people..remove(person);
      final newFavorite = currentState.favoritePeople..add(person);

      if (newPeople.length == 0) {
        yield* _mapGetAllPersonsToState();
      } else {
        yield currentState.copyWith(
            people: newPeople, favoritePeople: newFavorite);
      }
    }
  }
}
